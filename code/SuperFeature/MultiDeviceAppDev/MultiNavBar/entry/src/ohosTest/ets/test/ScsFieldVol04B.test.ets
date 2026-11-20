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

export default function scsFieldVol04BTest() {
  describe('MultiNavBarScsFieldVol04B', () => {

    /**
     * @tc.name   testScsFieldVol040039
     * @tc.number SUB_MNB_SCS_1686
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #38 covers
     *   searchModulePadding.left/sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.right/
     *   toolBarPadding.left/secondMenuListItemMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040039 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('xs', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040039 end');
    });

    /**
     * @tc.name   testScsFieldVol040040
     * @tc.number SUB_MNB_SCS_1687
     * @tc.desc   getSubTabsControllerStyle('md', '') window #39 covers
     *   sideBarPrimaryMenuTextMargin.top/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040040 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040040 end');
    });

    /**
     * @tc.name   testScsFieldVol040041
     * @tc.number SUB_MNB_SCS_1688
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #40 covers
     *   secondMenuListItemHeight/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040041 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040041 end');
    });

    /**
     * @tc.name   testScsFieldVol040042
     * @tc.number SUB_MNB_SCS_1689
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #41 covers
     *   isShowPageTitle/toolBarPadding.left/secondMenuListItemHeight/secondMenuListItemWidth/
     *   sideBarPrimaryMenuTextMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040042 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('xs', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040042 end');
    });

    /**
     * @tc.name   testScsFieldVol040043
     * @tc.number SUB_MNB_SCS_1690
     * @tc.desc   getSubTabsControllerStyle('md', '') window #42 covers
     *   searchModulePadding.right/secondMenuListSpace/isShowPageTitle/toolBarPadding.right/secondMenuListItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040043 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040043 end');
    });

    /**
     * @tc.name   testScsFieldVol040044
     * @tc.number SUB_MNB_SCS_1691
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #43 covers
     *   sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.left/searchModulePadding.right/
     *   secondMenuListItemMargin.left/isShowPageTitle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040044 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040044 end');
    });

    /**
     * @tc.name   testScsFieldVol040045
     * @tc.number SUB_MNB_SCS_1692
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #44 covers
     *   sideBarPrimaryNavListPadding.left/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040045 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('xs', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040045 end');
    });

    /**
     * @tc.name   testScsFieldVol040046
     * @tc.number SUB_MNB_SCS_1693
     * @tc.desc   getSubTabsControllerStyle('md', '') window #45 covers
     *   isShowSecondMenu/toolBarPadding.right/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   sideBarPrimaryMenuTextMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040046 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040046 end');
    });

    /**
     * @tc.name   testScsFieldVol040047
     * @tc.number SUB_MNB_SCS_1694
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #46 covers
     *   toolBarPadding.left/secondMenuListItemMargin.left/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/
     *   sideBarPrimaryNavListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040047 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040047 end');
    });

    /**
     * @tc.name   testScsFieldVol040048
     * @tc.number SUB_MNB_SCS_1695
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #47 covers
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right/toolBarPadding.left/secondMenuListItemHeight/
     *   isShowSecondMenu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040048 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('xs', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040048 end');
    });

    /**
     * @tc.name   testScsFieldVol040049
     * @tc.number SUB_MNB_SCS_1696
     * @tc.desc   getSubTabsControllerStyle('md', '') window #48 covers
     *   sideBarPrimaryMenuListPadding.left/searchModulePadding.left/secondMenuListSpace/isShowPageTitle/
     *   toolBarPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040049 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040049 end');
    });

    /**
     * @tc.name   testScsFieldVol040050
     * @tc.number SUB_MNB_SCS_1697
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #49 covers
     *   secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.right/secondMenuListSpace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040050 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040050 end');
    });

    /**
     * @tc.name   testScsFieldVol040051
     * @tc.number SUB_MNB_SCS_1698
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #50 covers
     *   toolBarPadding.right/secondMenuListItemHeight/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040051 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('xs', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040051 end');
    });

    /**
     * @tc.name   testScsFieldVol040052
     * @tc.number SUB_MNB_SCS_1699
     * @tc.desc   getSubTabsControllerStyle('md', '') window #51 covers
     *   secondMenuListItemMargin.left/isShowPageTitle/toolBarPadding.right/sideBarPrimaryNavListPadding.left/
     *   secondMenuListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040052 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040052 end');
    });

    /**
     * @tc.name   testScsFieldVol040053
     * @tc.number SUB_MNB_SCS_1700
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #52 covers
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right/secondMenuListItemMargin.left/isShowSecondMenu/
     *   toolBarPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040053 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040053 end');
    });

    /**
     * @tc.name   testScsFieldVol040054
     * @tc.number SUB_MNB_SCS_1701
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #53 covers
     *   searchModulePadding.left/sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.right/
     *   toolBarPadding.left/secondMenuListItemMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040054 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('xs', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040054 end');
    });

    /**
     * @tc.name   testScsFieldVol040055
     * @tc.number SUB_MNB_SCS_1702
     * @tc.desc   getSubTabsControllerStyle('md', '') window #54 covers
     *   sideBarPrimaryMenuTextMargin.top/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040055 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040055 end');
    });

    /**
     * @tc.name   testScsFieldVol040056
     * @tc.number SUB_MNB_SCS_1703
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #55 covers
     *   secondMenuListItemHeight/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040056 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040056 end');
    });

    /**
     * @tc.name   testScsFieldVol040057
     * @tc.number SUB_MNB_SCS_1704
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #56 covers
     *   isShowPageTitle/toolBarPadding.left/secondMenuListItemHeight/secondMenuListItemWidth/
     *   sideBarPrimaryMenuTextMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040057 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('xs', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040057 end');
    });

    /**
     * @tc.name   testScsFieldVol040058
     * @tc.number SUB_MNB_SCS_1705
     * @tc.desc   getSubTabsControllerStyle('md', '') window #57 covers
     *   searchModulePadding.right/secondMenuListSpace/isShowPageTitle/toolBarPadding.right/secondMenuListItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040058 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040058 end');
    });

    /**
     * @tc.name   testScsFieldVol040059
     * @tc.number SUB_MNB_SCS_1706
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #58 covers
     *   sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.left/searchModulePadding.right/
     *   secondMenuListItemMargin.left/isShowPageTitle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040059 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040059 end');
    });

    /**
     * @tc.name   testScsFieldVol040060
     * @tc.number SUB_MNB_SCS_1707
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #59 covers
     *   sideBarPrimaryNavListPadding.left/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040060 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('xs', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040060 end');
    });

    /**
     * @tc.name   testScsFieldVol040061
     * @tc.number SUB_MNB_SCS_1708
     * @tc.desc   getSubTabsControllerStyle('md', '') window #60 covers
     *   isShowSecondMenu/toolBarPadding.right/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   sideBarPrimaryMenuTextMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040061 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040061 end');
    });

    /**
     * @tc.name   testScsFieldVol040062
     * @tc.number SUB_MNB_SCS_1709
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #61 covers
     *   toolBarPadding.left/secondMenuListItemMargin.left/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/
     *   sideBarPrimaryNavListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040062 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040062 end');
    });

    /**
     * @tc.name   testScsFieldVol040063
     * @tc.number SUB_MNB_SCS_1710
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #62 covers
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right/toolBarPadding.left/secondMenuListItemHeight/
     *   isShowSecondMenu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040063 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('xs', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040063 end');
    });

    /**
     * @tc.name   testScsFieldVol040064
     * @tc.number SUB_MNB_SCS_1711
     * @tc.desc   getSubTabsControllerStyle('md', '') window #63 covers
     *   sideBarPrimaryMenuListPadding.left/searchModulePadding.left/secondMenuListSpace/isShowPageTitle/
     *   toolBarPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040064 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040064 end');
    });

    /**
     * @tc.name   testScsFieldVol040065
     * @tc.number SUB_MNB_SCS_1712
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #64 covers
     *   secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.right/secondMenuListSpace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040065 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040065 end');
    });

    /**
     * @tc.name   testScsFieldVol040066
     * @tc.number SUB_MNB_SCS_1713
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #65 covers
     *   toolBarPadding.right/secondMenuListItemHeight/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040066 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('xs', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040066 end');
    });

    /**
     * @tc.name   testScsFieldVol040067
     * @tc.number SUB_MNB_SCS_1714
     * @tc.desc   getSubTabsControllerStyle('md', '') window #66 covers
     *   secondMenuListItemMargin.left/isShowPageTitle/toolBarPadding.right/sideBarPrimaryNavListPadding.left/
     *   secondMenuListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040067 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040067 end');
    });

    /**
     * @tc.name   testScsFieldVol040068
     * @tc.number SUB_MNB_SCS_1715
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #67 covers
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right/secondMenuListItemMargin.left/isShowSecondMenu/
     *   toolBarPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040068 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040068 end');
    });

    /**
     * @tc.name   testScsFieldVol040069
     * @tc.number SUB_MNB_SCS_1716
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #68 covers
     *   searchModulePadding.left/sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.right/
     *   toolBarPadding.left/secondMenuListItemMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040069 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('xs', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040069 end');
    });

    /**
     * @tc.name   testScsFieldVol040070
     * @tc.number SUB_MNB_SCS_1717
     * @tc.desc   getSubTabsControllerStyle('md', '') window #69 covers
     *   sideBarPrimaryMenuTextMargin.top/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040070 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040070 end');
    });

    /**
     * @tc.name   testScsFieldVol040071
     * @tc.number SUB_MNB_SCS_1718
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #70 covers
     *   secondMenuListItemHeight/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040071 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040071 end');
    });

    /**
     * @tc.name   testScsFieldVol040072
     * @tc.number SUB_MNB_SCS_1719
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #71 covers
     *   isShowPageTitle/toolBarPadding.left/secondMenuListItemHeight/secondMenuListItemWidth/
     *   sideBarPrimaryMenuTextMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040072 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('xs', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040072 end');
    });

    /**
     * @tc.name   testScsFieldVol040073
     * @tc.number SUB_MNB_SCS_1720
     * @tc.desc   getSubTabsControllerStyle('md', '') window #72 covers
     *   searchModulePadding.right/secondMenuListSpace/isShowPageTitle/toolBarPadding.right/secondMenuListItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040073 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040073 end');
    });

    /**
     * @tc.name   testScsFieldVol040074
     * @tc.number SUB_MNB_SCS_1721
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #73 covers
     *   sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.left/searchModulePadding.right/
     *   secondMenuListItemMargin.left/isShowPageTitle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040074 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('', 'tabs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040074 end');
    });

    /**
     * @tc.name   testScsFieldVol040075
     * @tc.number SUB_MNB_SCS_1722
     * @tc.desc   Anchor: an empty side bar mode keeps the wide controller on a wide layout
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040075 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'title=%{public}s menu=%{public}s height=%{public}s',
        String(style.isShowPageTitle), String(style.isShowSecondMenu), String(style.secondMenuListItemHeight));
      expect(style.isShowPageTitle).assertTrue();
      expect(style.isShowSecondMenu).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.secondMenuListItemHeight');
      expect(style.secondMenuListItemHeight).assertEqual(48);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040075 end');
    });
  });
}
