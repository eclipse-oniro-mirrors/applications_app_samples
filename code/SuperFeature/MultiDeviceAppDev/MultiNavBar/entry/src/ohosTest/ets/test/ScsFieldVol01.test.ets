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

export default function scsFieldVol01Test() {
  describe('MultiNavBarScsFieldVol01', () => {

    /**
     * @tc.name   testScsFieldVol010001
     * @tc.number SUB_MNB_SCS_1423
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #0 covers
     *   sideBarPrimaryMenuTextMargin.top/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010001 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010001 end');
    });

    /**
     * @tc.name   testScsFieldVol010002
     * @tc.number SUB_MNB_SCS_1424
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #1 covers
     *   secondMenuListItemHeight/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010002 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010002 end');
    });

    /**
     * @tc.name   testScsFieldVol010003
     * @tc.number SUB_MNB_SCS_1425
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #2 covers
     *   isShowPageTitle/toolBarPadding.left/secondMenuListItemHeight/secondMenuListItemWidth/
     *   sideBarPrimaryMenuTextMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010003 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010003 end');
    });

    /**
     * @tc.name   testScsFieldVol010004
     * @tc.number SUB_MNB_SCS_1426
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #3 covers
     *   searchModulePadding.right/secondMenuListSpace/isShowPageTitle/toolBarPadding.right/secondMenuListItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010004 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010004 end');
    });

    /**
     * @tc.name   testScsFieldVol010005
     * @tc.number SUB_MNB_SCS_1427
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #4 covers
     *   sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.left/searchModulePadding.right/
     *   secondMenuListItemMargin.left/isShowPageTitle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010005 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010005 end');
    });

    /**
     * @tc.name   testScsFieldVol010006
     * @tc.number SUB_MNB_SCS_1428
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #5 covers
     *   sideBarPrimaryNavListPadding.left/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010006 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010006 end');
    });

    /**
     * @tc.name   testScsFieldVol010007
     * @tc.number SUB_MNB_SCS_1429
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #6 covers
     *   isShowSecondMenu/toolBarPadding.right/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   sideBarPrimaryMenuTextMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010007 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010007 end');
    });

    /**
     * @tc.name   testScsFieldVol010008
     * @tc.number SUB_MNB_SCS_1430
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #7 covers
     *   toolBarPadding.left/secondMenuListItemMargin.left/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/
     *   sideBarPrimaryNavListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010008 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010008 end');
    });

    /**
     * @tc.name   testScsFieldVol010009
     * @tc.number SUB_MNB_SCS_1431
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #8 covers
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right/toolBarPadding.left/secondMenuListItemHeight/
     *   isShowSecondMenu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010009 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010009 end');
    });

    /**
     * @tc.name   testScsFieldVol010010
     * @tc.number SUB_MNB_SCS_1432
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #9 covers
     *   sideBarPrimaryMenuListPadding.left/searchModulePadding.left/secondMenuListSpace/isShowPageTitle/
     *   toolBarPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010010 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010010 end');
    });

    /**
     * @tc.name   testScsFieldVol010011
     * @tc.number SUB_MNB_SCS_1433
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #10 covers
     *   secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.right/secondMenuListSpace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010011 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010011 end');
    });

    /**
     * @tc.name   testScsFieldVol010012
     * @tc.number SUB_MNB_SCS_1434
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #11 covers
     *   toolBarPadding.right/secondMenuListItemHeight/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010012 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010012 end');
    });

    /**
     * @tc.name   testScsFieldVol010013
     * @tc.number SUB_MNB_SCS_1435
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #12 covers
     *   secondMenuListItemMargin.left/isShowPageTitle/toolBarPadding.right/sideBarPrimaryNavListPadding.left/
     *   secondMenuListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010013 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010013 end');
    });

    /**
     * @tc.name   testScsFieldVol010014
     * @tc.number SUB_MNB_SCS_1436
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #13 covers
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right/secondMenuListItemMargin.left/isShowSecondMenu/
     *   toolBarPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010014 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010014 end');
    });

    /**
     * @tc.name   testScsFieldVol010015
     * @tc.number SUB_MNB_SCS_1437
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #14 covers
     *   searchModulePadding.left/sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.right/
     *   toolBarPadding.left/secondMenuListItemMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010015 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010015 end');
    });

    /**
     * @tc.name   testScsFieldVol010016
     * @tc.number SUB_MNB_SCS_1438
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #15 covers
     *   sideBarPrimaryMenuTextMargin.top/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010016 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010016 end');
    });

    /**
     * @tc.name   testScsFieldVol010017
     * @tc.number SUB_MNB_SCS_1439
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #16 covers
     *   secondMenuListItemHeight/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010017 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010017 end');
    });

    /**
     * @tc.name   testScsFieldVol010018
     * @tc.number SUB_MNB_SCS_1440
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #17 covers
     *   isShowPageTitle/toolBarPadding.left/secondMenuListItemHeight/secondMenuListItemWidth/
     *   sideBarPrimaryMenuTextMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010018 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010018 end');
    });

    /**
     * @tc.name   testScsFieldVol010019
     * @tc.number SUB_MNB_SCS_1441
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #18 covers
     *   searchModulePadding.right/secondMenuListSpace/isShowPageTitle/toolBarPadding.right/secondMenuListItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010019 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010019 end');
    });

    /**
     * @tc.name   testScsFieldVol010020
     * @tc.number SUB_MNB_SCS_1442
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #19 covers
     *   sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.left/searchModulePadding.right/
     *   secondMenuListItemMargin.left/isShowPageTitle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010020 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010020 end');
    });

    /**
     * @tc.name   testScsFieldVol010021
     * @tc.number SUB_MNB_SCS_1443
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #20 covers
     *   sideBarPrimaryNavListPadding.left/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010021 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010021 end');
    });

    /**
     * @tc.name   testScsFieldVol010022
     * @tc.number SUB_MNB_SCS_1444
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #21 covers
     *   isShowSecondMenu/toolBarPadding.right/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   sideBarPrimaryMenuTextMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010022 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010022 end');
    });

    /**
     * @tc.name   testScsFieldVol010023
     * @tc.number SUB_MNB_SCS_1445
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #22 covers
     *   toolBarPadding.left/secondMenuListItemMargin.left/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/
     *   sideBarPrimaryNavListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010023 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010023 end');
    });

    /**
     * @tc.name   testScsFieldVol010024
     * @tc.number SUB_MNB_SCS_1446
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #23 covers
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right/toolBarPadding.left/secondMenuListItemHeight/
     *   isShowSecondMenu
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010024 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010024 end');
    });

    /**
     * @tc.name   testScsFieldVol010025
     * @tc.number SUB_MNB_SCS_1447
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #24 covers
     *   sideBarPrimaryMenuListPadding.left/searchModulePadding.left/secondMenuListSpace/isShowPageTitle/
     *   toolBarPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010025 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010025 end');
    });

    /**
     * @tc.name   testScsFieldVol010026
     * @tc.number SUB_MNB_SCS_1448
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #25 covers
     *   secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.right/secondMenuListSpace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010026 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010026 end');
    });

    /**
     * @tc.name   testScsFieldVol010027
     * @tc.number SUB_MNB_SCS_1449
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #26 covers
     *   toolBarPadding.right/secondMenuListItemHeight/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010027 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010027 end');
    });

    /**
     * @tc.name   testScsFieldVol010028
     * @tc.number SUB_MNB_SCS_1450
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #27 covers
     *   secondMenuListItemMargin.left/isShowPageTitle/toolBarPadding.right/sideBarPrimaryNavListPadding.left/
     *   secondMenuListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010028 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010028 end');
    });

    /**
     * @tc.name   testScsFieldVol010029
     * @tc.number SUB_MNB_SCS_1451
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #28 covers
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right/secondMenuListItemMargin.left/isShowSecondMenu/
     *   toolBarPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010029 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010029 end');
    });

    /**
     * @tc.name   testScsFieldVol010030
     * @tc.number SUB_MNB_SCS_1452
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #29 covers
     *   searchModulePadding.left/sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.right/
     *   toolBarPadding.left/secondMenuListItemMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010030 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010030 end');
    });

    /**
     * @tc.name   testScsFieldVol010031
     * @tc.number SUB_MNB_SCS_1453
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #30 covers
     *   sideBarPrimaryMenuTextMargin.top/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   secondMenuListSpace/sideBarPrimaryMenuListPadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010031 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010031 end');
    });

    /**
     * @tc.name   testScsFieldVol010032
     * @tc.number SUB_MNB_SCS_1454
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #31 covers
     *   secondMenuListItemHeight/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/sideBarPrimaryMenuListPadding.left/
     *   searchModulePadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010032 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010032 end');
    });

    /**
     * @tc.name   testScsFieldVol010033
     * @tc.number SUB_MNB_SCS_1455
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #32 covers
     *   isShowPageTitle/toolBarPadding.left/secondMenuListItemHeight/secondMenuListItemWidth/
     *   sideBarPrimaryMenuTextMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010033 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010033 end');
    });

    /**
     * @tc.name   testScsFieldVol010034
     * @tc.number SUB_MNB_SCS_1456
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #33 covers
     *   searchModulePadding.right/secondMenuListSpace/isShowPageTitle/toolBarPadding.right/secondMenuListItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010034 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010034 end');
    });

    /**
     * @tc.name   testScsFieldVol010035
     * @tc.number SUB_MNB_SCS_1457
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #34 covers
     *   sideBarPrimaryMenuTextMargin.left/sideBarPrimaryMenuListPadding.left/searchModulePadding.right/
     *   secondMenuListItemMargin.left/isShowPageTitle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010035 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010035 end');
    });

    /**
     * @tc.name   testScsFieldVol010036
     * @tc.number SUB_MNB_SCS_1458
     * @tc.desc   getSubTabsControllerStyle('md', 'list') window #35 covers
     *   sideBarPrimaryNavListPadding.left/secondMenuListItemWidth/sideBarPrimaryMenuTextMargin.left/
     *   sideBarPrimaryMenuListPadding.right/searchModulePadding.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010036 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010036 end');
    });

    /**
     * @tc.name   testScsFieldVol010037
     * @tc.number SUB_MNB_SCS_1459
     * @tc.desc   getSubTabsControllerStyle('sm', 'list') window #36 covers
     *   isShowSecondMenu/toolBarPadding.right/sideBarPrimaryNavListPadding.left/searchModulePadding.left/
     *   sideBarPrimaryMenuTextMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010037 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010037 end');
    });

    /**
     * @tc.name   testScsFieldVol010038
     * @tc.number SUB_MNB_SCS_1460
     * @tc.desc   getSubTabsControllerStyle('sm', 'tabs') window #37 covers
     *   toolBarPadding.left/secondMenuListItemMargin.left/isShowSecondMenu/sideBarPrimaryMenuTextMargin.top/
     *   sideBarPrimaryNavListPadding.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsFieldVol010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010038 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsFieldVol010038 end');
    });

  });
}
