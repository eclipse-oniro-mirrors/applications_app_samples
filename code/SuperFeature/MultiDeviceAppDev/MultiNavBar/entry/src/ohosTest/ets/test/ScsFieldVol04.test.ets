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

// @volume rule=field basis=main-frozen cases=38
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

export default function scsFieldVol04Test() {
  describe('MultiNavBarScsFieldVol04', () => {

    /**
     * @tc.name   testScsFieldVol040001
     * @tc.number SUB_MNB_SCS_1648
     * @tc.desc   getSubTabsControllerStyle('md', '') window #0 covers
     *   isShowSecondMenu/toolBarPadding.right/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   sideBarPrimaryMenuTextMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040001 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040001 end');
    });

    /**
     * @tc.name   testScsFieldVol040002
     * @tc.number SUB_MNB_SCS_1649
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #1 covers
     *   toolBarPadding.left/secondMenuListItemMargin.left/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/
     *   sideBarPrimaryNavListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040002 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040002 end');
    });

    /**
     * @tc.name   testScsFieldVol040003
     * @tc.number SUB_MNB_SCS_1650
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #2 covers
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right/toolBarPadding.left/secondMenuListItemHeight/
     *   isShowSecondMenu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040003 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040003 end');
    });

    /**
     * @tc.name   testScsFieldVol040004
     * @tc.number SUB_MNB_SCS_1651
     * @tc.desc   getSubTabsControllerStyle('md', '') window #3 covers
     *   sideBarPrimaryMenuListPadding.left/searchModulePadding.left/secondMenuListSpace/isShowPageTitle/
     *   toolBarPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040004 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040004 end');
    });

    /**
     * @tc.name   testScsFieldVol040005
     * @tc.number SUB_MNB_SCS_1652
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #4 covers
     *   secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.right/secondMenuListSpace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040005 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040005 end');
    });

    /**
     * @tc.name   testScsFieldVol040006
     * @tc.number SUB_MNB_SCS_1653
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #5 covers
     *   toolBarPadding.right/secondMenuListItemHeight/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040006 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040006 end');
    });

    /**
     * @tc.name   testScsFieldVol040007
     * @tc.number SUB_MNB_SCS_1654
     * @tc.desc   getSubTabsControllerStyle('md', '') window #6 covers
     *   secondMenuListItemMargin.left/isShowPageTitle/toolBarPadding.right/sideBarPrimaryNavListPadding.left/
     *   secondMenuListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040007 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040007 end');
    });

    /**
     * @tc.name   testScsFieldVol040008
     * @tc.number SUB_MNB_SCS_1655
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #7 covers
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right/secondMenuListItemMargin.left/isShowSecondMenu/
     *   toolBarPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040008 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040008 end');
    });

    /**
     * @tc.name   testScsFieldVol040009
     * @tc.number SUB_MNB_SCS_1656
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #8 covers
     *   searchModulePadding.left/sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.right/
     *   toolBarPadding.left/secondMenuListItemMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040009 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040009 end');
    });

    /**
     * @tc.name   testScsFieldVol040010
     * @tc.number SUB_MNB_SCS_1657
     * @tc.desc   getSubTabsControllerStyle('md', '') window #9 covers
     *   sideBarPrimaryMenuTextMargin.top/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040010 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040010 end');
    });

    /**
     * @tc.name   testScsFieldVol040011
     * @tc.number SUB_MNB_SCS_1658
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #10 covers
     *   secondMenuListItemHeight/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040011 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040011 end');
    });

    /**
     * @tc.name   testScsFieldVol040012
     * @tc.number SUB_MNB_SCS_1659
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #11 covers
     *   isShowPageTitle/toolBarPadding.left/secondMenuListItemHeight/secondMenuListItemWidth/
     *   sideBarPrimaryMenuTextMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040012 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040012 end');
    });

    /**
     * @tc.name   testScsFieldVol040013
     * @tc.number SUB_MNB_SCS_1660
     * @tc.desc   getSubTabsControllerStyle('md', '') window #12 covers
     *   searchModulePadding.right/secondMenuListSpace/isShowPageTitle/toolBarPadding.right/secondMenuListItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040013 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040013 end');
    });

    /**
     * @tc.name   testScsFieldVol040014
     * @tc.number SUB_MNB_SCS_1661
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #13 covers
     *   sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.left/searchModulePadding.right/
     *   secondMenuListItemMargin.left/isShowPageTitle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040014 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040014 end');
    });

    /**
     * @tc.name   testScsFieldVol040015
     * @tc.number SUB_MNB_SCS_1662
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #14 covers
     *   sideBarPrimaryNavListPadding.left/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040015 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040015 end');
    });

    /**
     * @tc.name   testScsFieldVol040016
     * @tc.number SUB_MNB_SCS_1663
     * @tc.desc   getSubTabsControllerStyle('md', '') window #15 covers
     *   isShowSecondMenu/toolBarPadding.right/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   sideBarPrimaryMenuTextMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040016 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040016 end');
    });

    /**
     * @tc.name   testScsFieldVol040017
     * @tc.number SUB_MNB_SCS_1664
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #16 covers
     *   toolBarPadding.left/secondMenuListItemMargin.left/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/
     *   sideBarPrimaryNavListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040017 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040017 end');
    });

    /**
     * @tc.name   testScsFieldVol040018
     * @tc.number SUB_MNB_SCS_1665
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #17 covers
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right/toolBarPadding.left/secondMenuListItemHeight/
     *   isShowSecondMenu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040018 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040018 end');
    });

    /**
     * @tc.name   testScsFieldVol040019
     * @tc.number SUB_MNB_SCS_1666
     * @tc.desc   getSubTabsControllerStyle('md', '') window #18 covers
     *   sideBarPrimaryMenuListPadding.left/searchModulePadding.left/secondMenuListSpace/isShowPageTitle/
     *   toolBarPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040019 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040019 end');
    });

    /**
     * @tc.name   testScsFieldVol040020
     * @tc.number SUB_MNB_SCS_1667
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #19 covers
     *   secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.right/secondMenuListSpace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040020 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040020 end');
    });

    /**
     * @tc.name   testScsFieldVol040021
     * @tc.number SUB_MNB_SCS_1668
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #20 covers
     *   toolBarPadding.right/secondMenuListItemHeight/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040021 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040021 end');
    });

    /**
     * @tc.name   testScsFieldVol040022
     * @tc.number SUB_MNB_SCS_1669
     * @tc.desc   getSubTabsControllerStyle('md', '') window #21 covers
     *   secondMenuListItemMargin.left/isShowPageTitle/toolBarPadding.right/sideBarPrimaryNavListPadding.left/
     *   secondMenuListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040022 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040022 end');
    });

    /**
     * @tc.name   testScsFieldVol040023
     * @tc.number SUB_MNB_SCS_1670
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #22 covers
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right/secondMenuListItemMargin.left/isShowSecondMenu/
     *   toolBarPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040023 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040023 end');
    });

    /**
     * @tc.name   testScsFieldVol040024
     * @tc.number SUB_MNB_SCS_1671
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #23 covers
     *   searchModulePadding.left/sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.right/
     *   toolBarPadding.left/secondMenuListItemMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040024 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040024 end');
    });

    /**
     * @tc.name   testScsFieldVol040025
     * @tc.number SUB_MNB_SCS_1672
     * @tc.desc   getSubTabsControllerStyle('md', '') window #24 covers
     *   sideBarPrimaryMenuTextMargin.top/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040025 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040025 end');
    });

    /**
     * @tc.name   testScsFieldVol040026
     * @tc.number SUB_MNB_SCS_1673
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #25 covers
     *   secondMenuListItemHeight/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040026 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040026 end');
    });

    /**
     * @tc.name   testScsFieldVol040027
     * @tc.number SUB_MNB_SCS_1674
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #26 covers
     *   isShowPageTitle/toolBarPadding.left/secondMenuListItemHeight/secondMenuListItemWidth/
     *   sideBarPrimaryMenuTextMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040027 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040027 end');
    });

    /**
     * @tc.name   testScsFieldVol040028
     * @tc.number SUB_MNB_SCS_1675
     * @tc.desc   getSubTabsControllerStyle('md', '') window #27 covers
     *   searchModulePadding.right/secondMenuListSpace/isShowPageTitle/toolBarPadding.right/secondMenuListItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040028 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040028 end');
    });

    /**
     * @tc.name   testScsFieldVol040029
     * @tc.number SUB_MNB_SCS_1676
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #28 covers
     *   sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.left/searchModulePadding.right/
     *   secondMenuListItemMargin.left/isShowPageTitle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040029 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040029 end');
    });

    /**
     * @tc.name   testScsFieldVol040030
     * @tc.number SUB_MNB_SCS_1677
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #29 covers
     *   sideBarPrimaryNavListPadding.left/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040030 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040030 end');
    });

    /**
     * @tc.name   testScsFieldVol040031
     * @tc.number SUB_MNB_SCS_1678
     * @tc.desc   getSubTabsControllerStyle('md', '') window #30 covers
     *   isShowSecondMenu/toolBarPadding.right/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   sideBarPrimaryMenuTextMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040031 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040031 end');
    });

    /**
     * @tc.name   testScsFieldVol040032
     * @tc.number SUB_MNB_SCS_1679
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #31 covers
     *   toolBarPadding.left/secondMenuListItemMargin.left/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/
     *   sideBarPrimaryNavListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040032 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040032 end');
    });

    /**
     * @tc.name   testScsFieldVol040033
     * @tc.number SUB_MNB_SCS_1680
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #32 covers
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right/toolBarPadding.left/secondMenuListItemHeight/
     *   isShowSecondMenu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040033 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040033 end');
    });

    /**
     * @tc.name   testScsFieldVol040034
     * @tc.number SUB_MNB_SCS_1681
     * @tc.desc   getSubTabsControllerStyle('md', '') window #33 covers
     *   sideBarPrimaryMenuListPadding.left/searchModulePadding.left/secondMenuListSpace/isShowPageTitle/
     *   toolBarPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040034 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040034 end');
    });

    /**
     * @tc.name   testScsFieldVol040035
     * @tc.number SUB_MNB_SCS_1682
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #34 covers
     *   secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.right/secondMenuListSpace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040035 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040035 end');
    });

    /**
     * @tc.name   testScsFieldVol040036
     * @tc.number SUB_MNB_SCS_1683
     * @tc.desc   getSubTabsControllerStyle('xs', 'tabs') window #35 covers
     *   toolBarPadding.right/secondMenuListItemHeight/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040036 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040036 end');
    });

    /**
     * @tc.name   testScsFieldVol040037
     * @tc.number SUB_MNB_SCS_1684
     * @tc.desc   getSubTabsControllerStyle('md', '') window #36 covers
     *   secondMenuListItemMargin.left/isShowPageTitle/toolBarPadding.right/sideBarPrimaryNavListPadding.left/
     *   secondMenuListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040037 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040037 end');
    });

    /**
     * @tc.name   testScsFieldVol040038
     * @tc.number SUB_MNB_SCS_1685
     * @tc.desc   getSubTabsControllerStyle('', 'tabs') window #37 covers
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right/secondMenuListItemMargin.left/isShowSecondMenu/
     *   toolBarPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol040038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040038 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol040038 end');
    });

  });
}
