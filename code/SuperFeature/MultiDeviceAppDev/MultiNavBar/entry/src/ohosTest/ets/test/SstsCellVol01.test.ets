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

export default function sstsCellVol01Test() {
  describe('MultiNavBarSstsCellVol01', () => {

    /**
     * @tc.name   testSstsCellVol010001
     * @tc.number SUB_MNB_SSTS_1821
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010001 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010001 end');
    });

    /**
     * @tc.name   testSstsCellVol010002
     * @tc.number SUB_MNB_SSTS_1822
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010002 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010002 end');
    });

    /**
     * @tc.name   testSstsCellVol010003
     * @tc.number SUB_MNB_SSTS_1823
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010003 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010003 end');
    });

    /**
     * @tc.name   testSstsCellVol010004
     * @tc.number SUB_MNB_SSTS_1824
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010004 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010004 end');
    });

    /**
     * @tc.name   testSstsCellVol010005
     * @tc.number SUB_MNB_SSTS_1825
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010005 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010005 end');
    });

    /**
     * @tc.name   testSstsCellVol010006
     * @tc.number SUB_MNB_SSTS_1826
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010006 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010006 end');
    });

    /**
     * @tc.name   testSstsCellVol010007
     * @tc.number SUB_MNB_SSTS_1827
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010007 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010007 end');
    });

    /**
     * @tc.name   testSstsCellVol010008
     * @tc.number SUB_MNB_SSTS_1828
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010008 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010008 end');
    });

    /**
     * @tc.name   testSstsCellVol010009
     * @tc.number SUB_MNB_SSTS_1829
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010009 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010009 end');
    });

    /**
     * @tc.name   testSstsCellVol010010
     * @tc.number SUB_MNB_SSTS_1830
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010010 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010010 end');
    });

    /**
     * @tc.name   testSstsCellVol010011
     * @tc.number SUB_MNB_SSTS_1831
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010011 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010011 end');
    });

    /**
     * @tc.name   testSstsCellVol010012
     * @tc.number SUB_MNB_SSTS_1832
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010012 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010012 end');
    });

    /**
     * @tc.name   testSstsCellVol010013
     * @tc.number SUB_MNB_SSTS_1833
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010013 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010013 end');
    });

    /**
     * @tc.name   testSstsCellVol010014
     * @tc.number SUB_MNB_SSTS_1834
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010014 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010014 end');
    });

    /**
     * @tc.name   testSstsCellVol010015
     * @tc.number SUB_MNB_SSTS_1835
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010015 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010015 end');
    });

    /**
     * @tc.name   testSstsCellVol010016
     * @tc.number SUB_MNB_SSTS_1836
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010016 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010016 end');
    });

    /**
     * @tc.name   testSstsCellVol010017
     * @tc.number SUB_MNB_SSTS_1837
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010017 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010017 end');
    });

    /**
     * @tc.name   testSstsCellVol010018
     * @tc.number SUB_MNB_SSTS_1838
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010018 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010018 end');
    });

    /**
     * @tc.name   testSstsCellVol010019
     * @tc.number SUB_MNB_SSTS_1839
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010019 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010019 end');
    });

    /**
     * @tc.name   testSstsCellVol010020
     * @tc.number SUB_MNB_SSTS_1840
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010020 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010020 end');
    });

    /**
     * @tc.name   testSstsCellVol010021
     * @tc.number SUB_MNB_SSTS_1841
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010021 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010021 end');
    });

    /**
     * @tc.name   testSstsCellVol010022
     * @tc.number SUB_MNB_SSTS_1842
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010022 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010022 end');
    });

    /**
     * @tc.name   testSstsCellVol010023
     * @tc.number SUB_MNB_SSTS_1843
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010023 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010023 end');
    });

    /**
     * @tc.name   testSstsCellVol010024
     * @tc.number SUB_MNB_SSTS_1844
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010024 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010024 end');
    });

    /**
     * @tc.name   testSstsCellVol010025
     * @tc.number SUB_MNB_SSTS_1845
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010025 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010025 end');
    });

    /**
     * @tc.name   testSstsCellVol010026
     * @tc.number SUB_MNB_SSTS_1846
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010026 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010026 end');
    });

    /**
     * @tc.name   testSstsCellVol010027
     * @tc.number SUB_MNB_SSTS_1847
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010027 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010027 end');
    });

    /**
     * @tc.name   testSstsCellVol010028
     * @tc.number SUB_MNB_SSTS_1848
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010028 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010028 end');
    });

    /**
     * @tc.name   testSstsCellVol010029
     * @tc.number SUB_MNB_SSTS_1849
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010029 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010029 end');
    });

    /**
     * @tc.name   testSstsCellVol010030
     * @tc.number SUB_MNB_SSTS_1850
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010030 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010030 end');
    });

    /**
     * @tc.name   testSstsCellVol010031
     * @tc.number SUB_MNB_SSTS_1851
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010031 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010031 end');
    });

    /**
     * @tc.name   testSstsCellVol010032
     * @tc.number SUB_MNB_SSTS_1852
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010032 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010032 end');
    });

    /**
     * @tc.name   testSstsCellVol010033
     * @tc.number SUB_MNB_SSTS_1853
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010033 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010033 end');
    });

    /**
     * @tc.name   testSstsCellVol010034
     * @tc.number SUB_MNB_SSTS_1854
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010034 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010034 end');
    });

    /**
     * @tc.name   testSstsCellVol010035
     * @tc.number SUB_MNB_SSTS_1855
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010035 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010035 end');
    });

    /**
     * @tc.name   testSstsCellVol010036
     * @tc.number SUB_MNB_SSTS_1856
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010036 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010036 end');
    });

    /**
     * @tc.name   testSstsCellVol010037
     * @tc.number SUB_MNB_SSTS_1857
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010037 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010037 end');
    });

    /**
     * @tc.name   testSstsCellVol010038
     * @tc.number SUB_MNB_SSTS_1858
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010038 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010038 end');
    });

  });
}
