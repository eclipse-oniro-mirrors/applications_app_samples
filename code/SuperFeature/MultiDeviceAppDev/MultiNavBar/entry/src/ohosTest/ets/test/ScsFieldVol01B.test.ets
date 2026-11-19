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

export default function scsFieldVol01BTest() {
  describe('MultiNavBarScsFieldVol01B', () => {

    /**
     * @tc.name   testScsFieldVol010039
     * @tc.number SUB_MNB_SCS_1461
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #38 covers
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right/toolBarPadding.left/secondMenuListItemHeight/
     *   isShowSecondMenu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010039 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_LIST.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010039 end');
    });

    /**
     * @tc.name   testScsFieldVol010040
     * @tc.number SUB_MNB_SCS_1462
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #39 covers
     *   sideBarPrimaryMenuListPadding.left/searchModulePadding.left/secondMenuListSpace/isShowPageTitle/
     *   toolBarPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010040 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_LIST.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010040 end');
    });

    /**
     * @tc.name   testScsFieldVol010041
     * @tc.number SUB_MNB_SCS_1463
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #40 covers
     *   secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.right/secondMenuListSpace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010041 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010041 end');
    });

    /**
     * @tc.name   testScsFieldVol010042
     * @tc.number SUB_MNB_SCS_1464
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #41 covers
     *   toolBarPadding.right/secondMenuListItemHeight/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010042 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010042 end');
    });

    /**
     * @tc.name   testScsFieldVol010043
     * @tc.number SUB_MNB_SCS_1465
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #42 covers
     *   secondMenuListItemMargin.left/isShowPageTitle/toolBarPadding.right/sideBarPrimaryNavListPadding.left/
     *   secondMenuListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010043 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_LIST.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010043 end');
    });

    /**
     * @tc.name   testScsFieldVol010044
     * @tc.number SUB_MNB_SCS_1466
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #43 covers
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right/secondMenuListItemMargin.left/isShowSecondMenu/
     *   toolBarPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010044 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_LIST.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010044 end');
    });

    /**
     * @tc.name   testScsFieldVol010045
     * @tc.number SUB_MNB_SCS_1467
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #44 covers
     *   searchModulePadding.left/sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.right/
     *   toolBarPadding.left/secondMenuListItemMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010045 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010045 end');
    });

    /**
     * @tc.name   testScsFieldVol010046
     * @tc.number SUB_MNB_SCS_1468
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #45 covers
     *   sideBarPrimaryMenuTextMargin.top/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010046 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010046 end');
    });

    /**
     * @tc.name   testScsFieldVol010047
     * @tc.number SUB_MNB_SCS_1469
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #46 covers
     *   secondMenuListItemHeight/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010047 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_LIST.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010047 end');
    });

    /**
     * @tc.name   testScsFieldVol010048
     * @tc.number SUB_MNB_SCS_1470
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #47 covers
     *   isShowPageTitle/toolBarPadding.left/secondMenuListItemHeight/secondMenuListItemWidth/
     *   sideBarPrimaryMenuTextMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010048 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_LIST.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010048 end');
    });

    /**
     * @tc.name   testScsFieldVol010049
     * @tc.number SUB_MNB_SCS_1471
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #48 covers
     *   searchModulePadding.right/secondMenuListSpace/isShowPageTitle/toolBarPadding.right/secondMenuListItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010049 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_LIST.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010049 end');
    });

    /**
     * @tc.name   testScsFieldVol010050
     * @tc.number SUB_MNB_SCS_1472
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #49 covers
     *   sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.left/searchModulePadding.right/
     *   secondMenuListItemMargin.left/isShowPageTitle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010050 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_LIST.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010050 end');
    });

    /**
     * @tc.name   testScsFieldVol010051
     * @tc.number SUB_MNB_SCS_1473
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #50 covers
     *   sideBarPrimaryNavListPadding.left/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010051 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010051 end');
    });

    /**
     * @tc.name   testScsFieldVol010052
     * @tc.number SUB_MNB_SCS_1474
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #51 covers
     *   isShowSecondMenu/toolBarPadding.right/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   sideBarPrimaryMenuTextMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010052 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_LIST.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010052 end');
    });

    /**
     * @tc.name   testScsFieldVol010053
     * @tc.number SUB_MNB_SCS_1475
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #52 covers
     *   toolBarPadding.left/secondMenuListItemMargin.left/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/
     *   sideBarPrimaryNavListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010053 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_LIST.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010053 end');
    });

    /**
     * @tc.name   testScsFieldVol010054
     * @tc.number SUB_MNB_SCS_1476
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #53 covers
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right/toolBarPadding.left/secondMenuListItemHeight/
     *   isShowSecondMenu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010054 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_LIST.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010054 end');
    });

    /**
     * @tc.name   testScsFieldVol010055
     * @tc.number SUB_MNB_SCS_1477
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #54 covers
     *   sideBarPrimaryMenuListPadding.left/searchModulePadding.left/secondMenuListSpace/isShowPageTitle/
     *   toolBarPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010055 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_LIST.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010055 end');
    });

    /**
     * @tc.name   testScsFieldVol010056
     * @tc.number SUB_MNB_SCS_1478
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #55 covers
     *   secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.right/secondMenuListSpace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010056 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010056 end');
    });

    /**
     * @tc.name   testScsFieldVol010057
     * @tc.number SUB_MNB_SCS_1479
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #56 covers
     *   toolBarPadding.right/secondMenuListItemHeight/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010057 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010057 end');
    });

    /**
     * @tc.name   testScsFieldVol010058
     * @tc.number SUB_MNB_SCS_1480
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #57 covers
     *   secondMenuListItemMargin.left/isShowPageTitle/toolBarPadding.right/sideBarPrimaryNavListPadding.left/
     *   secondMenuListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010058 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_LIST.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010058 end');
    });

    /**
     * @tc.name   testScsFieldVol010059
     * @tc.number SUB_MNB_SCS_1481
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #58 covers
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right/secondMenuListItemMargin.left/isShowSecondMenu/
     *   toolBarPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010059 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_LIST.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010059 end');
    });

    /**
     * @tc.name   testScsFieldVol010060
     * @tc.number SUB_MNB_SCS_1482
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #59 covers
     *   searchModulePadding.left/sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.right/
     *   toolBarPadding.left/secondMenuListItemMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010060 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010060 end');
    });

    /**
     * @tc.name   testScsFieldVol010061
     * @tc.number SUB_MNB_SCS_1483
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #60 covers
     *   sideBarPrimaryMenuTextMargin.top/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010061 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010061 end');
    });

    /**
     * @tc.name   testScsFieldVol010062
     * @tc.number SUB_MNB_SCS_1484
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #61 covers
     *   secondMenuListItemHeight/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010062 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_LIST.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010062 end');
    });

    /**
     * @tc.name   testScsFieldVol010063
     * @tc.number SUB_MNB_SCS_1485
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #62 covers
     *   isShowPageTitle/toolBarPadding.left/secondMenuListItemHeight/secondMenuListItemWidth/
     *   sideBarPrimaryMenuTextMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010063 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_LIST.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010063 end');
    });

    /**
     * @tc.name   testScsFieldVol010064
     * @tc.number SUB_MNB_SCS_1486
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #63 covers
     *   searchModulePadding.right/secondMenuListSpace/isShowPageTitle/toolBarPadding.right/secondMenuListItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010064 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_LIST.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010064 end');
    });

    /**
     * @tc.name   testScsFieldVol010065
     * @tc.number SUB_MNB_SCS_1487
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #64 covers
     *   sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.left/searchModulePadding.right/
     *   secondMenuListItemMargin.left/isShowPageTitle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010065 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_LIST.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010065 end');
    });

    /**
     * @tc.name   testScsFieldVol010066
     * @tc.number SUB_MNB_SCS_1488
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #65 covers
     *   sideBarPrimaryNavListPadding.left/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010066 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010066 end');
    });

    /**
     * @tc.name   testScsFieldVol010067
     * @tc.number SUB_MNB_SCS_1489
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #66 covers
     *   isShowSecondMenu/toolBarPadding.right/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   sideBarPrimaryMenuTextMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010067 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_LIST.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010067 end');
    });

    /**
     * @tc.name   testScsFieldVol010068
     * @tc.number SUB_MNB_SCS_1490
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #67 covers
     *   toolBarPadding.left/secondMenuListItemMargin.left/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/
     *   sideBarPrimaryNavListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010068 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_LIST.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010068 end');
    });

    /**
     * @tc.name   testScsFieldVol010069
     * @tc.number SUB_MNB_SCS_1491
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #68 covers
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right/toolBarPadding.left/secondMenuListItemHeight/
     *   isShowSecondMenu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010069 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_LIST.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010069 end');
    });

    /**
     * @tc.name   testScsFieldVol010070
     * @tc.number SUB_MNB_SCS_1492
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #69 covers
     *   sideBarPrimaryMenuListPadding.left/searchModulePadding.left/secondMenuListSpace/isShowPageTitle/
     *   toolBarPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010070 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.left),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft)));
      expect(String(result.searchModulePadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_LIST.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.left),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft)));
      expect(String(result.toolBarPadding.left)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010070 end');
    });

    /**
     * @tc.name   testScsFieldVol010071
     * @tc.number SUB_MNB_SCS_1493
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #70 covers
     *   secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.right/secondMenuListSpace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010071 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.top),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.top)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListSpace),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListSpace)));
      expect(String(result.secondMenuListSpace)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListSpace));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010071 end');
    });

    /**
     * @tc.name   testScsFieldVol010072
     * @tc.number SUB_MNB_SCS_1494
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #71 covers
     *   toolBarPadding.right/secondMenuListItemHeight/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010072 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('md', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemHeight),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight)));
      expect(String(result.secondMenuListItemHeight)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextMargin.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft)));
      expect(
        String(result.sideBarPrimaryMenuTextMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuTextMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010072 end');
    });

    /**
     * @tc.name   testScsFieldVol010073
     * @tc.number SUB_MNB_SCS_1495
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #72 covers
     *   secondMenuListItemMargin.left/isShowPageTitle/toolBarPadding.right/sideBarPrimaryNavListPadding.left/
     *   secondMenuListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010073 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowPageTitle),
        String(String(SUB_TABS_STYLE_LIST.isShowPageTitle)));
      expect(String(result.isShowPageTitle)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowPageTitle));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListPadding.left),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft)));
      expect(
        String(result.sideBarPrimaryNavListPadding.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryNavListPaddingLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.secondMenuListItemWidth),
        String(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth)));
      expect(String(result.secondMenuListItemWidth)).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010073 end');
    });

    /**
     * @tc.name   testScsFieldVol010074
     * @tc.number SUB_MNB_SCS_1496
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #73 covers
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right/secondMenuListItemMargin.left/isShowSecondMenu/
     *   toolBarPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010074 begin');
      const result: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuListPadding.right),
        String(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight)));
      expect(
        String(result.sideBarPrimaryMenuListPadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.sideBarPrimaryMenuListPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.searchModulePadding.right),
        String(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight)));
      expect(
        String(result.searchModulePadding.right)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.searchModulePaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.secondMenuListItemMargin.left), String(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft)));
      expect(
        String(result.secondMenuListItemMargin.left)
      ).assertEqual(String(SUB_TABS_STYLE_LIST.secondMenuListItemMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.isShowSecondMenu),
        String(String(SUB_TABS_STYLE_LIST.isShowSecondMenu)));
      expect(String(result.isShowSecondMenu)).assertEqual(String(SUB_TABS_STYLE_LIST.isShowSecondMenu));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.toolBarPadding.right),
        String(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight)));
      expect(String(result.toolBarPadding.right)).assertEqual(String(SUB_TABS_STYLE_LIST.toolBarPaddingRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010074 end');
    });

    /**
     * @tc.name   testScsFieldVol010075
     * @tc.number SUB_MNB_SCS_1497
     * @tc.desc   Anchor: the compact breakpoint wins over the tabs side bar mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010075 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('sm', 'tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'title=%{public}s menu=%{public}s', String(style.isShowPageTitle),
        String(style.isShowSecondMenu));
      expect(style.isShowPageTitle).assertFalse();
      expect(style.isShowSecondMenu).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.secondMenuListItemHeight');
      expect(style.secondMenuListItemHeight).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010075 end');
    });
  });
}
