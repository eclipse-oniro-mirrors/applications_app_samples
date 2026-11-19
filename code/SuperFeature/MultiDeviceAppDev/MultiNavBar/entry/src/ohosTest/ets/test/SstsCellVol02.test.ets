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

export default function sstsCellVol02Test() {
  describe('MultiNavBarSstsCellVol02', () => {

    /**
     * @tc.name   testSstsCellVol020001
     * @tc.number SUB_MNB_SSTS_1896
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 0, 0) returns the selected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020001 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020001 end');
    });

    /**
     * @tc.name   testSstsCellVol020002
     * @tc.number SUB_MNB_SSTS_1897
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 1, 2) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020002 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020002 end');
    });

    /**
     * @tc.name   testSstsCellVol020003
     * @tc.number SUB_MNB_SSTS_1898
     * @tc.desc   getCurrentSubTabsStyle('md', '', 2, 4) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020003 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020003 end');
    });

    /**
     * @tc.name   testSstsCellVol020004
     * @tc.number SUB_MNB_SSTS_1899
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 3, 1) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020004 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020004 end');
    });

    /**
     * @tc.name   testSstsCellVol020005
     * @tc.number SUB_MNB_SSTS_1900
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 4, 3) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020005 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020005 end');
    });

    /**
     * @tc.name   testSstsCellVol020006
     * @tc.number SUB_MNB_SSTS_1901
     * @tc.desc   getCurrentSubTabsStyle('md', '', 0, 0) returns the selected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020006 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020006 end');
    });

    /**
     * @tc.name   testSstsCellVol020007
     * @tc.number SUB_MNB_SSTS_1902
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 1, 2) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020007 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020007 end');
    });

    /**
     * @tc.name   testSstsCellVol020008
     * @tc.number SUB_MNB_SSTS_1903
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 2, 4) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020008 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020008 end');
    });

    /**
     * @tc.name   testSstsCellVol020009
     * @tc.number SUB_MNB_SSTS_1904
     * @tc.desc   getCurrentSubTabsStyle('md', '', 3, 1) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020009 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020009 end');
    });

    /**
     * @tc.name   testSstsCellVol020010
     * @tc.number SUB_MNB_SSTS_1905
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 4, 3) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020010 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020010 end');
    });

    /**
     * @tc.name   testSstsCellVol020011
     * @tc.number SUB_MNB_SSTS_1906
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 0, 0) returns the selected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020011 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020011 end');
    });

    /**
     * @tc.name   testSstsCellVol020012
     * @tc.number SUB_MNB_SSTS_1907
     * @tc.desc   getCurrentSubTabsStyle('md', '', 1, 2) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020012 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020012 end');
    });

    /**
     * @tc.name   testSstsCellVol020013
     * @tc.number SUB_MNB_SSTS_1908
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 2, 4) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020013 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020013 end');
    });

    /**
     * @tc.name   testSstsCellVol020014
     * @tc.number SUB_MNB_SSTS_1909
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 3, 1) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020014 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020014 end');
    });

    /**
     * @tc.name   testSstsCellVol020015
     * @tc.number SUB_MNB_SSTS_1910
     * @tc.desc   getCurrentSubTabsStyle('md', '', 4, 3) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020015 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020015 end');
    });

    /**
     * @tc.name   testSstsCellVol020016
     * @tc.number SUB_MNB_SSTS_1911
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 0, 0) returns the selected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020016 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020016 end');
    });

    /**
     * @tc.name   testSstsCellVol020017
     * @tc.number SUB_MNB_SSTS_1912
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 1, 2) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020017 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020017 end');
    });

    /**
     * @tc.name   testSstsCellVol020018
     * @tc.number SUB_MNB_SSTS_1913
     * @tc.desc   getCurrentSubTabsStyle('md', '', 2, 4) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020018 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020018 end');
    });

    /**
     * @tc.name   testSstsCellVol020019
     * @tc.number SUB_MNB_SSTS_1914
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 3, 1) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020019 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020019 end');
    });

    /**
     * @tc.name   testSstsCellVol020020
     * @tc.number SUB_MNB_SSTS_1915
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 4, 3) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020020 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020020 end');
    });

    /**
     * @tc.name   testSstsCellVol020021
     * @tc.number SUB_MNB_SSTS_1916
     * @tc.desc   getCurrentSubTabsStyle('md', '', 0, 0) returns the selected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020021 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020021 end');
    });

    /**
     * @tc.name   testSstsCellVol020022
     * @tc.number SUB_MNB_SSTS_1917
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 1, 2) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020022 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020022 end');
    });

    /**
     * @tc.name   testSstsCellVol020023
     * @tc.number SUB_MNB_SSTS_1918
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 2, 4) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020023 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020023 end');
    });

    /**
     * @tc.name   testSstsCellVol020024
     * @tc.number SUB_MNB_SSTS_1919
     * @tc.desc   getCurrentSubTabsStyle('md', '', 3, 1) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020024 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020024 end');
    });

    /**
     * @tc.name   testSstsCellVol020025
     * @tc.number SUB_MNB_SSTS_1920
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 4, 3) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020025 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020025 end');
    });

    /**
     * @tc.name   testSstsCellVol020026
     * @tc.number SUB_MNB_SSTS_1921
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 0, 0) returns the selected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020026 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020026 end');
    });

    /**
     * @tc.name   testSstsCellVol020027
     * @tc.number SUB_MNB_SSTS_1922
     * @tc.desc   getCurrentSubTabsStyle('md', '', 1, 2) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020027 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020027 end');
    });

    /**
     * @tc.name   testSstsCellVol020028
     * @tc.number SUB_MNB_SSTS_1923
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 2, 4) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020028 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020028 end');
    });

    /**
     * @tc.name   testSstsCellVol020029
     * @tc.number SUB_MNB_SSTS_1924
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 3, 1) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020029 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020029 end');
    });

    /**
     * @tc.name   testSstsCellVol020030
     * @tc.number SUB_MNB_SSTS_1925
     * @tc.desc   getCurrentSubTabsStyle('md', '', 4, 3) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020030 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020030 end');
    });

    /**
     * @tc.name   testSstsCellVol020031
     * @tc.number SUB_MNB_SSTS_1926
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 0, 0) returns the selected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020031 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020031 end');
    });

    /**
     * @tc.name   testSstsCellVol020032
     * @tc.number SUB_MNB_SSTS_1927
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 1, 2) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020032 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020032 end');
    });

    /**
     * @tc.name   testSstsCellVol020033
     * @tc.number SUB_MNB_SSTS_1928
     * @tc.desc   getCurrentSubTabsStyle('md', '', 2, 4) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020033 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020033 end');
    });

    /**
     * @tc.name   testSstsCellVol020034
     * @tc.number SUB_MNB_SSTS_1929
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 3, 1) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020034 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020034 end');
    });

    /**
     * @tc.name   testSstsCellVol020035
     * @tc.number SUB_MNB_SSTS_1930
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 4, 3) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020035 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020035 end');
    });

    /**
     * @tc.name   testSstsCellVol020036
     * @tc.number SUB_MNB_SSTS_1931
     * @tc.desc   getCurrentSubTabsStyle('md', '', 0, 0) returns the selected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020036 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020036 end');
    });

    /**
     * @tc.name   testSstsCellVol020037
     * @tc.number SUB_MNB_SSTS_1932
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 1, 2) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020037 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020037 end');
    });

    /**
     * @tc.name   testSstsCellVol020038
     * @tc.number SUB_MNB_SSTS_1933
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 2, 4) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020038 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020038 end');
    });

  });
}
