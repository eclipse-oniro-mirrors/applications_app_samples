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

// @volume rule=field basis=main-frozen cases=37
// Volume cases, see section 4 of ohosTest.md for the generation rule. Hand-written anchor cases must be added
// to the same describe and marked with an @tc.desc starting with 'Anchor:'.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { StyleConfiguration } from '../../../main/ets/common/Configuration';
import { SubTabsControllerStyle } from '../../../main/ets/model/StyleType';
import {
  SUB_TABS_STYLE_LIST,
  SUB_TABS_STYLE_TABS
} from '../util/NavSpec';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function scsFieldVol02BTest() {
  describe('MultiNavBarScsFieldVol02B', () => {

    /**
     * @tc.name   testScsFieldVol020039
     * @tc.number SUB_MNB_SCS_1536
     * @tc.desc   getSubTabsControllerStyle('md', '') window #38 covers
     *   sideBarPrimaryNavListPadding.left/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020039 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020039 end');
    });

    /**
     * @tc.name   testScsFieldVol020040
     * @tc.number SUB_MNB_SCS_1537
     * @tc.desc   getSubTabsControllerStyle('md', 'tabs') window #39 covers
     *   isShowSecondMenu/toolBarPadding.right/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   sideBarPrimaryMenuTextMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020040 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_TABS.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020040 end');
    });

    /**
     * @tc.name   testScsFieldVol020041
     * @tc.number SUB_MNB_SCS_1538
     * @tc.desc   getSubTabsControllerStyle('lg', 'tabs') window #40 covers
     *   toolBarPadding.left/secondMenuListItemMargin.left/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/
     *   sideBarPrimaryNavListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020041 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_TABS.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020041 end');
    });

    /**
     * @tc.name   testScsFieldVol020042
     * @tc.number SUB_MNB_SCS_1539
     * @tc.desc   getSubTabsControllerStyle('md', '') window #41 covers
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right/toolBarPadding.left/secondMenuListItemHeight/
     *   isShowSecondMenu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020042 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_TABS.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020042 end');
    });

    /**
     * @tc.name   testScsFieldVol020043
     * @tc.number SUB_MNB_SCS_1540
     * @tc.desc   getSubTabsControllerStyle('md', 'tabs') window #42 covers
     *   sideBarPrimaryMenuListPadding.left/searchModulePadding.left/secondMenuListSpace/isShowPageTitle/
     *   toolBarPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020043 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_TABS.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020043 end');
    });

    /**
     * @tc.name   testScsFieldVol020044
     * @tc.number SUB_MNB_SCS_1541
     * @tc.desc   getSubTabsControllerStyle('lg', 'tabs') window #43 covers
     *   secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.right/secondMenuListSpace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020044 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020044 end');
    });

    /**
     * @tc.name   testScsFieldVol020045
     * @tc.number SUB_MNB_SCS_1542
     * @tc.desc   getSubTabsControllerStyle('md', '') window #44 covers
     *   toolBarPadding.right/secondMenuListItemHeight/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020045 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020045 end');
    });

    /**
     * @tc.name   testScsFieldVol020046
     * @tc.number SUB_MNB_SCS_1543
     * @tc.desc   getSubTabsControllerStyle('md', 'tabs') window #45 covers
     *   secondMenuListItemMargin.left/isShowPageTitle/toolBarPadding.right/sideBarPrimaryNavListPadding.left/
     *   secondMenuListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020046 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_TABS.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020046 end');
    });

    /**
     * @tc.name   testScsFieldVol020047
     * @tc.number SUB_MNB_SCS_1544
     * @tc.desc   getSubTabsControllerStyle('lg', 'tabs') window #46 covers
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right/secondMenuListItemMargin.left/isShowSecondMenu/
     *   toolBarPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020047 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_TABS.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020047 end');
    });

    /**
     * @tc.name   testScsFieldVol020048
     * @tc.number SUB_MNB_SCS_1545
     * @tc.desc   getSubTabsControllerStyle('md', '') window #47 covers
     *   searchModulePadding.left/sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.right/
     *   toolBarPadding.left/secondMenuListItemMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020048 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020048 end');
    });

    /**
     * @tc.name   testScsFieldVol020049
     * @tc.number SUB_MNB_SCS_1546
     * @tc.desc   getSubTabsControllerStyle('md', 'tabs') window #48 covers
     *   sideBarPrimaryMenuTextMargin.top/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020049 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020049 end');
    });

    /**
     * @tc.name   testScsFieldVol020050
     * @tc.number SUB_MNB_SCS_1547
     * @tc.desc   getSubTabsControllerStyle('lg', 'tabs') window #49 covers
     *   secondMenuListItemHeight/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020050 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_TABS.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020050 end');
    });

    /**
     * @tc.name   testScsFieldVol020051
     * @tc.number SUB_MNB_SCS_1548
     * @tc.desc   getSubTabsControllerStyle('md', '') window #50 covers
     *   isShowPageTitle/toolBarPadding.left/secondMenuListItemHeight/secondMenuListItemWidth/
     *   sideBarPrimaryMenuTextMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020051 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_TABS.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020051 end');
    });

    /**
     * @tc.name   testScsFieldVol020052
     * @tc.number SUB_MNB_SCS_1549
     * @tc.desc   getSubTabsControllerStyle('md', 'tabs') window #51 covers
     *   searchModulePadding.right/secondMenuListSpace/isShowPageTitle/toolBarPadding.right/secondMenuListItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020052 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_TABS.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020052 end');
    });

    /**
     * @tc.name   testScsFieldVol020053
     * @tc.number SUB_MNB_SCS_1550
     * @tc.desc   getSubTabsControllerStyle('lg', 'tabs') window #52 covers
     *   sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.left/searchModulePadding.right/
     *   secondMenuListItemMargin.left/isShowPageTitle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020053 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_TABS.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020053 end');
    });

    /**
     * @tc.name   testScsFieldVol020054
     * @tc.number SUB_MNB_SCS_1551
     * @tc.desc   getSubTabsControllerStyle('md', '') window #53 covers
     *   sideBarPrimaryNavListPadding.left/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020054 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020054 end');
    });

    /**
     * @tc.name   testScsFieldVol020055
     * @tc.number SUB_MNB_SCS_1552
     * @tc.desc   getSubTabsControllerStyle('md', 'tabs') window #54 covers
     *   isShowSecondMenu/toolBarPadding.right/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   sideBarPrimaryMenuTextMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020055 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_TABS.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020055 end');
    });

    /**
     * @tc.name   testScsFieldVol020056
     * @tc.number SUB_MNB_SCS_1553
     * @tc.desc   getSubTabsControllerStyle('lg', 'tabs') window #55 covers
     *   toolBarPadding.left/secondMenuListItemMargin.left/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/
     *   sideBarPrimaryNavListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020056 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_TABS.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020056 end');
    });

    /**
     * @tc.name   testScsFieldVol020057
     * @tc.number SUB_MNB_SCS_1554
     * @tc.desc   getSubTabsControllerStyle('md', '') window #56 covers
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right/toolBarPadding.left/secondMenuListItemHeight/
     *   isShowSecondMenu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020057 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_TABS.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020057 end');
    });

    /**
     * @tc.name   testScsFieldVol020058
     * @tc.number SUB_MNB_SCS_1555
     * @tc.desc   getSubTabsControllerStyle('md', 'tabs') window #57 covers
     *   sideBarPrimaryMenuListPadding.left/searchModulePadding.left/secondMenuListSpace/isShowPageTitle/
     *   toolBarPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020058 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_TABS.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020058 end');
    });

    /**
     * @tc.name   testScsFieldVol020059
     * @tc.number SUB_MNB_SCS_1556
     * @tc.desc   getSubTabsControllerStyle('lg', 'tabs') window #58 covers
     *   secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.right/secondMenuListSpace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020059 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020059 end');
    });

    /**
     * @tc.name   testScsFieldVol020060
     * @tc.number SUB_MNB_SCS_1557
     * @tc.desc   getSubTabsControllerStyle('md', '') window #59 covers
     *   toolBarPadding.right/secondMenuListItemHeight/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020060 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020060 end');
    });

    /**
     * @tc.name   testScsFieldVol020061
     * @tc.number SUB_MNB_SCS_1558
     * @tc.desc   getSubTabsControllerStyle('md', 'tabs') window #60 covers
     *   secondMenuListItemMargin.left/isShowPageTitle/toolBarPadding.right/sideBarPrimaryNavListPadding.left/
     *   secondMenuListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020061 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_TABS.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020061 end');
    });

    /**
     * @tc.name   testScsFieldVol020062
     * @tc.number SUB_MNB_SCS_1559
     * @tc.desc   getSubTabsControllerStyle('lg', 'tabs') window #61 covers
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right/secondMenuListItemMargin.left/isShowSecondMenu/
     *   toolBarPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020062 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_TABS.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020062 end');
    });

    /**
     * @tc.name   testScsFieldVol020063
     * @tc.number SUB_MNB_SCS_1560
     * @tc.desc   getSubTabsControllerStyle('md', '') window #62 covers
     *   searchModulePadding.left/sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.right/
     *   toolBarPadding.left/secondMenuListItemMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020063 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020063 end');
    });

    /**
     * @tc.name   testScsFieldVol020064
     * @tc.number SUB_MNB_SCS_1561
     * @tc.desc   getSubTabsControllerStyle('md', 'tabs') window #63 covers
     *   sideBarPrimaryMenuTextMargin.top/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020064 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020064 end');
    });

    /**
     * @tc.name   testScsFieldVol020065
     * @tc.number SUB_MNB_SCS_1562
     * @tc.desc   getSubTabsControllerStyle('lg', 'tabs') window #64 covers
     *   secondMenuListItemHeight/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020065 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_TABS.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020065 end');
    });

    /**
     * @tc.name   testScsFieldVol020066
     * @tc.number SUB_MNB_SCS_1563
     * @tc.desc   getSubTabsControllerStyle('md', '') window #65 covers
     *   isShowPageTitle/toolBarPadding.left/secondMenuListItemHeight/secondMenuListItemWidth/
     *   sideBarPrimaryMenuTextMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020066 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_TABS.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020066 end');
    });

    /**
     * @tc.name   testScsFieldVol020067
     * @tc.number SUB_MNB_SCS_1564
     * @tc.desc   getSubTabsControllerStyle('md', 'tabs') window #66 covers
     *   searchModulePadding.right/secondMenuListSpace/isShowPageTitle/toolBarPadding.right/secondMenuListItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020067 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_TABS.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020067 end');
    });

    /**
     * @tc.name   testScsFieldVol020068
     * @tc.number SUB_MNB_SCS_1565
     * @tc.desc   getSubTabsControllerStyle('lg', 'tabs') window #67 covers
     *   sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.left/searchModulePadding.right/
     *   secondMenuListItemMargin.left/isShowPageTitle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020068 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_TABS.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020068 end');
    });

    /**
     * @tc.name   testScsFieldVol020069
     * @tc.number SUB_MNB_SCS_1566
     * @tc.desc   getSubTabsControllerStyle('md', '') window #68 covers
     *   sideBarPrimaryNavListPadding.left/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020069 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020069 end');
    });

    /**
     * @tc.name   testScsFieldVol020070
     * @tc.number SUB_MNB_SCS_1567
     * @tc.desc   getSubTabsControllerStyle('md', 'tabs') window #69 covers
     *   isShowSecondMenu/toolBarPadding.right/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   sideBarPrimaryMenuTextMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020070 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_TABS.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020070 end');
    });

    /**
     * @tc.name   testScsFieldVol020071
     * @tc.number SUB_MNB_SCS_1568
     * @tc.desc   getSubTabsControllerStyle('lg', 'tabs') window #70 covers
     *   toolBarPadding.left/secondMenuListItemMargin.left/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/
     *   sideBarPrimaryNavListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020071 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_TABS.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020071 end');
    });

    /**
     * @tc.name   testScsFieldVol020072
     * @tc.number SUB_MNB_SCS_1569
     * @tc.desc   getSubTabsControllerStyle('md', '') window #71 covers
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right/toolBarPadding.left/secondMenuListItemHeight/
     *   isShowSecondMenu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020072 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_TABS.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020072 end');
    });

    /**
     * @tc.name   testScsFieldVol020073
     * @tc.number SUB_MNB_SCS_1570
     * @tc.desc   getSubTabsControllerStyle('md', 'tabs') window #72 covers
     *   sideBarPrimaryMenuListPadding.left/searchModulePadding.left/secondMenuListSpace/isShowPageTitle/
     *   toolBarPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020073 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_TABS.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_TABS.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_TABS.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020073 end');
    });

    /**
     * @tc.name   testScsFieldVol020074
     * @tc.number SUB_MNB_SCS_1571
     * @tc.desc   getSubTabsControllerStyle('lg', 'tabs') window #73 covers
     *   secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.right/secondMenuListSpace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020074 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_TABS.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_TABS.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_TABS.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020074 end');
    });

    /**
     * @tc.name   testScsFieldVol020075
     * @tc.number SUB_MNB_SCS_1572
     * @tc.desc   Anchor: list mode on a wide layout keeps the compact controller
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol020075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020075 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('lg', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'space=%{public}s height=%{public}s',
        String(style.secondMenuListSpace), String(style.secondMenuListItemHeight));
      expect(style.secondMenuListSpace).assertEqual(16);
      expect(style.secondMenuListItemHeight).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.secondMenuListItemWidth');
      expect(style.secondMenuListItemWidth).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol020075 end');
    });
  });
}
