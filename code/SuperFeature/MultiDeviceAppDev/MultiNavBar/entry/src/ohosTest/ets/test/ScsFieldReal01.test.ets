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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { StyleConfiguration } from '../../../main/ets/common/Configuration';
import { SubTabsControllerStyle } from '../../../main/ets/model/StyleType';
import {
  BP_SM,
  BP_MD,
  BP_LG,
  SIDEBAR_LIST,
  SIDEBAR_TABS,
  NON_LIST_MODES,
  SUB_TABS_STYLE_LIST,
  SUB_TABS_STYLE_TABS,
  FrozenSubTabsStyleCompact,
  FrozenSubTabsStyleWide
} from '../util/NavSpec';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

/**
 * L1 cases for StyleConfiguration.getSubTabsControllerStyle (common/Configuration.ets:90).
 * The compact branch is selected by `bp === 'sm' || (bp !== 'sm' && mode === 'list')`;
 * every other combination takes the wide branch.
 */
export default function scsFieldReal01Test() {
  describe('MultiNavBarScsFieldReal01', () => {
    /**
     * @tc.name   testScsReal1401
     * @tc.number SUB_MNB_SCS_1401
     * @tc.desc   (sm, list) selects the compact branch: primary menu text margin 4/0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testScsReal1401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1401 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_SM, SIDEBAR_LIST);
      const expected: FrozenSubTabsStyleCompact = SUB_TABS_STYLE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'top=%{public}s expected=%{public}s',
        String(style.sideBarPrimaryMenuTextMargin.top), String(expected.sideBarPrimaryMenuTextMarginTop));
      expect(style.sideBarPrimaryMenuTextMargin.top).assertEqual(expected.sideBarPrimaryMenuTextMarginTop);
      expect(style.sideBarPrimaryMenuTextMargin.left).assertEqual(expected.sideBarPrimaryMenuTextMarginLeft);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.isShowPageTitle');
      expect(style.isShowPageTitle).assertEqual(expected.isShowPageTitle);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1401 end');
    });

    /**
     * @tc.name   testScsReal1402
     * @tc.number SUB_MNB_SCS_1402
     * @tc.desc   On sm the mode is irrelevant: (sm, tabs) still uses the compact branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testScsReal1402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1402 begin');
      const listStyle: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_SM, SIDEBAR_LIST);
      const tabsStyle: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_SM, SIDEBAR_TABS);
      const expected: FrozenSubTabsStyleCompact = SUB_TABS_STYLE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'listTop=%{public}s tabsTop=%{public}s',
        String(listStyle.sideBarPrimaryMenuTextMargin.top), String(tabsStyle.sideBarPrimaryMenuTextMargin.top));
      expect(tabsStyle.sideBarPrimaryMenuTextMargin.top).assertEqual(expected.sideBarPrimaryMenuTextMarginTop);
      expect(tabsStyle.isShowSecondMenu).assertEqual(expected.isShowSecondMenu);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check listStyle.sideBarPrimaryMenuTextMargin.top');
      expect(listStyle.sideBarPrimaryMenuTextMargin.top).assertEqual(tabsStyle.sideBarPrimaryMenuTextMargin.top);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1402 end');
    });

    /**
     * @tc.name   testScsReal1403
     * @tc.number SUB_MNB_SCS_1403
     * @tc.desc   Anchor: on sm an empty mode still resolves to the compact branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testScsReal1403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1403 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_SM, '');
      const expected: FrozenSubTabsStyleCompact = SUB_TABS_STYLE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'showTitle=%{public}s expected=%{public}s',
        String(style.isShowPageTitle), String(expected.isShowPageTitle));
      expect(style.isShowPageTitle).assertEqual(expected.isShowPageTitle);
      expect(style.secondMenuListItemHeight).assertEqual(expected.secondMenuListItemHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.isShowSecondMenu');
      expect(style.isShowSecondMenu).assertEqual(expected.isShowSecondMenu);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1403 end');
    });

    /**
     * @tc.name   testScsReal1404
     * @tc.number SUB_MNB_SCS_1404
     * @tc.desc   Wide layout plus list mode also uses the compact branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testScsReal1404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1404 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_MD, SIDEBAR_LIST);
      const expected: FrozenSubTabsStyleCompact = SUB_TABS_STYLE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'space=%{public}s expected=%{public}s',
        String(style.secondMenuListSpace), String(expected.secondMenuListSpace));
      expect(style.secondMenuListSpace).assertEqual(expected.secondMenuListSpace);
      expect(style.isShowPageTitle).assertEqual(expected.isShowPageTitle);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.sideBarPrimaryMenuTextMargin.left');
      expect(style.sideBarPrimaryMenuTextMargin.left).assertEqual(expected.sideBarPrimaryMenuTextMarginLeft);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1404 end');
    });

    /**
     * @tc.name   testScsReal1405
     * @tc.number SUB_MNB_SCS_1405
     * @tc.desc   lg plus list mode uses the compact branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testScsReal1405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1405 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_LG, SIDEBAR_LIST);
      const expected: FrozenSubTabsStyleCompact = SUB_TABS_STYLE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'height=%{public}s expected=%{public}s',
        String(style.secondMenuListItemHeight), String(expected.secondMenuListItemHeight));
      expect(style.secondMenuListItemHeight).assertEqual(expected.secondMenuListItemHeight);
      expect(style.primaryMenuTextAlign === style.secondMenuListDirection).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.isShowSecondMenu');
      expect(style.isShowSecondMenu).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1405 end');
    });

    /**
     * @tc.name   testScsReal1406
     * @tc.number SUB_MNB_SCS_1406
     * @tc.desc   Anchor: an empty breakpoint with list mode still uses the compact branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testScsReal1406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1406 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('', SIDEBAR_LIST);
      const expected: FrozenSubTabsStyleCompact = SUB_TABS_STYLE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'menuPad=%{public}s expected=%{public}s',
        String(style.sideBarPrimaryMenuListPadding.right), String(expected.sideBarPrimaryMenuListPaddingRight));
      expect(style.sideBarPrimaryMenuListPadding.right).assertEqual(expected.sideBarPrimaryMenuListPaddingRight);
      expect(style.isShowPageTitle).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.isShowSecondMenu');
      expect(style.isShowSecondMenu).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1406 end');
    });

    /**
     * @tc.name   testScsReal1407
     * @tc.number SUB_MNB_SCS_1407
     * @tc.desc   (md, tabs) selects the wide branch: text margin 0/8
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testScsReal1407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1407 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_MD, SIDEBAR_TABS);
      const expected: FrozenSubTabsStyleWide = SUB_TABS_STYLE_TABS;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'left=%{public}s expected=%{public}s',
        String(style.sideBarPrimaryMenuTextMargin.left), String(expected.sideBarPrimaryMenuTextMarginLeft));
      expect(style.sideBarPrimaryMenuTextMargin.top).assertEqual(expected.sideBarPrimaryMenuTextMarginTop);
      expect(style.sideBarPrimaryMenuTextMargin.left).assertEqual(expected.sideBarPrimaryMenuTextMarginLeft);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.isShowPageTitle');
      expect(style.isShowPageTitle).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1407 end');
    });

    /**
     * @tc.name   testScsReal1408
     * @tc.number SUB_MNB_SCS_1408
     * @tc.desc   lg plus tabs mode uses the wide branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testScsReal1408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1408 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_LG, SIDEBAR_TABS);
      const expected: FrozenSubTabsStyleWide = SUB_TABS_STYLE_TABS;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'height=%{public}s expected=%{public}s',
        String(style.secondMenuListItemHeight), String(expected.secondMenuListItemHeight));
      expect(style.secondMenuListItemHeight).assertEqual(expected.secondMenuListItemHeight);
      expect(style.secondMenuListItemMargin.left).assertEqual(expected.secondMenuListItemMarginLeft);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.secondMenuListSpace');
      expect(style.secondMenuListSpace).assertEqual(expected.secondMenuListSpace);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1408 end');
    });

    /**
     * @tc.name   testScsReal1409
     * @tc.number SUB_MNB_SCS_1409
     * @tc.desc   Anchor: an empty breakpoint with tabs mode uses the wide branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testScsReal1409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1409 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle('', SIDEBAR_TABS);
      const expected: FrozenSubTabsStyleWide = SUB_TABS_STYLE_TABS;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'width=%{public}s expected=%{public}s', style.secondMenuListItemWidth,
        expected.secondMenuListItemWidth);
      expect(style.secondMenuListItemWidth).assertEqual(expected.secondMenuListItemWidth);
      expect(style.isShowPageTitle).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.isShowSecondMenu');
      expect(style.isShowSecondMenu).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1409 end');
    });

    /**
     * @tc.name   testScsReal1410
     * @tc.number SUB_MNB_SCS_1410
     * @tc.desc   Anchor: an unknown mode on a wide layout falls into the wide branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsReal1410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1410 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_MD, '');
      const expected: FrozenSubTabsStyleWide = SUB_TABS_STYLE_TABS;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'navPad=%{public}s expected=%{public}s',
        String(style.sideBarPrimaryNavListPadding.left), String(expected.sideBarPrimaryNavListPaddingLeft));
      expect(style.sideBarPrimaryNavListPadding.left).assertEqual(expected.sideBarPrimaryNavListPaddingLeft);
      expect(style.secondMenuListItemHeight).assertEqual(expected.secondMenuListItemHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.isShowPageTitle');
      expect(style.isShowPageTitle).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1410 end');
    });

    /**
     * @tc.name   testScsReal1411
     * @tc.number SUB_MNB_SCS_1411
     * @tc.desc   Anchor: uppercase 'LIST' is not recognised and therefore takes the wide branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsReal1411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1411 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_MD, 'LIST');
      const lower: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_MD, SIDEBAR_LIST);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'upperHeight=%{public}s lowerHeight=%{public}s',
        String(style.secondMenuListItemHeight), String(lower.secondMenuListItemHeight));
      expect(style.secondMenuListItemHeight).assertEqual(48);
      expect(lower.secondMenuListItemHeight).assertEqual(56);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.isShowSecondMenu');
      expect(style.isShowSecondMenu).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1411 end');
    });

    /**
     * @tc.name   testScsReal1412
     * @tc.number SUB_MNB_SCS_1412
     * @tc.desc   On sm the mode never matters, even for an unknown mode value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsReal1412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1412 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_SM, 'vertical');
      const expected: FrozenSubTabsStyleCompact = SUB_TABS_STYLE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'showSecond=%{public}s expected=%{public}s',
        String(style.isShowSecondMenu), String(expected.isShowSecondMenu));
      expect(style.isShowSecondMenu).assertEqual(expected.isShowSecondMenu);
      expect(style.isShowPageTitle).assertEqual(expected.isShowPageTitle);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.secondMenuListSpace');
      expect(style.secondMenuListSpace).assertEqual(expected.secondMenuListSpace);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1412 end');
    });

    /**
     * @tc.name   testScsReal1413
     * @tc.number SUB_MNB_SCS_1413
     * @tc.desc   Compact branch: secondary menu rhythm is 16 space, 0 margin, 56 height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testScsReal1413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1413 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_SM, SIDEBAR_TABS);
      const expected: FrozenSubTabsStyleCompact = SUB_TABS_STYLE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'space=%{public}s margin=%{public}s height=%{public}s',
        String(style.secondMenuListSpace), String(style.secondMenuListItemMargin.left),
        String(style.secondMenuListItemHeight));
      expect(style.secondMenuListSpace).assertEqual(expected.secondMenuListSpace);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.secondMenuListItemMargin.left');
      expect(style.secondMenuListItemMargin.left).assertEqual(expected.secondMenuListItemMarginLeft);
      expect(style.secondMenuListItemHeight).assertEqual(expected.secondMenuListItemHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1413 end');
    });

    /**
     * @tc.name   testScsReal1414
     * @tc.number SUB_MNB_SCS_1414
     * @tc.desc   Wide branch: secondary menu rhythm is 0 space, 44 margin, 48 height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testScsReal1414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1414 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_LG, SIDEBAR_TABS);
      const expected: FrozenSubTabsStyleWide = SUB_TABS_STYLE_TABS;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'space=%{public}s margin=%{public}s height=%{public}s',
        String(style.secondMenuListSpace), String(style.secondMenuListItemMargin.left),
        String(style.secondMenuListItemHeight));
      expect(style.secondMenuListSpace).assertEqual(expected.secondMenuListSpace);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.secondMenuListItemMargin.left');
      expect(style.secondMenuListItemMargin.left).assertEqual(expected.secondMenuListItemMarginLeft);
      expect(style.secondMenuListItemHeight).assertEqual(expected.secondMenuListItemHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1414 end');
    });

    /**
     * @tc.name   testScsReal1415
     * @tc.number SUB_MNB_SCS_1415
     * @tc.desc   Compact branch zeroes the navigation and menu paddings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsReal1415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1415 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_MD, SIDEBAR_LIST);
      const expected: FrozenSubTabsStyleCompact = SUB_TABS_STYLE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nav=%{public}s menu=%{public}s/%{public}s',
        String(style.sideBarPrimaryNavListPadding.left), String(style.sideBarPrimaryMenuListPadding.left),
        String(style.sideBarPrimaryMenuListPadding.right));
      expect(style.sideBarPrimaryNavListPadding.left).assertEqual(expected.sideBarPrimaryNavListPaddingLeft);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.sideBarPrimaryMenuListPadding.left');
      expect(style.sideBarPrimaryMenuListPadding.left).assertEqual(expected.sideBarPrimaryMenuListPaddingLeft);
      expect(style.sideBarPrimaryMenuListPadding.right).assertEqual(expected.sideBarPrimaryMenuListPaddingRight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1415 end');
    });

    /**
     * @tc.name   testScsReal1416
     * @tc.number SUB_MNB_SCS_1416
     * @tc.desc   Wide branch uses 12vp navigation and menu paddings on both sides
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsReal1416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1416 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_MD, SIDEBAR_TABS);
      const expected: FrozenSubTabsStyleWide = SUB_TABS_STYLE_TABS;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'navRight=%{public}s menuLeft=%{public}s',
        String(style.sideBarPrimaryNavListPadding.right), String(style.sideBarPrimaryMenuListPadding.left));
      expect(style.sideBarPrimaryNavListPadding.right).assertEqual(expected.sideBarPrimaryNavListPaddingRight);
      expect(style.sideBarPrimaryMenuListPadding.left).assertEqual(expected.sideBarPrimaryMenuListPaddingLeft);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.sideBarPrimaryMenuListPadding.right');
      expect(style.sideBarPrimaryMenuListPadding.right).assertEqual(expected.sideBarPrimaryMenuListPaddingRight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1416 end');
    });

    /**
     * @tc.name   testScsReal1417
     * @tc.number SUB_MNB_SCS_1417
     * @tc.desc   Compact branch hides the page title, shows the second menu and keeps an empty width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsReal1417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1417 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_SM, SIDEBAR_LIST);
      const expected: FrozenSubTabsStyleCompact = SUB_TABS_STYLE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'titleShow=%{public}s width=[%{public}s]',
        String(style.isShowPageTitle), style.secondMenuListItemWidth);
      expect(style.isShowPageTitle).assertFalse();
      expect(style.isShowSecondMenu).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.secondMenuListItemWidth');
      expect(style.secondMenuListItemWidth).assertEqual(expected.secondMenuListItemWidth);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1417 end');
    });

    /**
     * @tc.name   testScsReal1418
     * @tc.number SUB_MNB_SCS_1418
     * @tc.desc   Wide branch shows the page title, hides the second menu and stretches the width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsReal1418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1418 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_LG, SIDEBAR_TABS);
      const expected: FrozenSubTabsStyleWide = SUB_TABS_STYLE_TABS;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'titleShow=%{public}s width=%{public}s',
        String(style.isShowPageTitle), style.secondMenuListItemWidth);
      expect(style.isShowPageTitle).assertTrue();
      expect(style.isShowSecondMenu).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.secondMenuListItemWidth');
      expect(style.secondMenuListItemWidth).assertEqual(expected.secondMenuListItemWidth);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1418 end');
    });

    /**
     * @tc.name   testScsReal1419
     * @tc.number SUB_MNB_SCS_1419
     * @tc.desc   Compact search and tool bar paddings collapse to zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsReal1419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1419 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_SM, SIDEBAR_LIST);
      const expected: FrozenSubTabsStyleCompact = SUB_TABS_STYLE_LIST;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'search=%{public}s/%{public}s tool=%{public}s/%{public}s',
        String(style.searchModulePadding.left), String(style.searchModulePadding.right),
        String(style.toolBarPadding.left), String(style.toolBarPadding.right));
      expect(style.searchModulePadding.left).assertEqual(expected.searchModulePaddingLeft);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.toolBarPadding.left');
      expect(style.toolBarPadding.left).assertEqual(expected.toolBarPaddingLeft);
      expect(style.toolBarPadding.right).assertEqual(expected.toolBarPaddingRight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1419 end');
    });

    /**
     * @tc.name   testScsReal1420
     * @tc.number SUB_MNB_SCS_1420
     * @tc.desc   Wide search and tool bar paddings are 12vp on both sides
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsReal1420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1420 begin');
      const style: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_MD, SIDEBAR_TABS);
      const expected: FrozenSubTabsStyleWide = SUB_TABS_STYLE_TABS;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'searchRight=%{public}s toolLeft=%{public}s',
        String(style.searchModulePadding.right), String(style.toolBarPadding.left));
      expect(style.searchModulePadding.left).assertEqual(expected.searchModulePaddingLeft);
      expect(style.searchModulePadding.right).assertEqual(expected.searchModulePaddingRight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.toolBarPadding.left');
      expect(style.toolBarPadding.left).assertEqual(expected.toolBarPaddingLeft);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1420 end');
    });

    /**
     * @tc.name   testScsReal1421
     * @tc.number SUB_MNB_SCS_1421
     * @tc.desc   Property: page title and second menu are always mutually exclusive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsReal1421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1421 begin');
      const breakpoints: string[] = [BP_SM, BP_MD, BP_LG, ''];
      const modes: string[] = [SIDEBAR_LIST, SIDEBAR_TABS, ''];
      let violations: number = 0;
      let combinations: number = 0;
      for (let i: number = 0; i < breakpoints.length; i++) {
        for (let j: number = 0; j < modes.length; j++) {
          const style: SubTabsControllerStyle =
            StyleConfiguration.getSubTabsControllerStyle(breakpoints[i], modes[j]);
          combinations++;
          if (style.isShowPageTitle === style.isShowSecondMenu) {
            violations++;
          }
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'violations=%{public}s combinations=%{public}s',
        String(violations), String(combinations));
      expect(violations).assertEqual(0);
      expect(combinations).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s',
        'check StyleConfiguration.getSubTabsControllerStyle(BP_SM, SIDEBAR_LIST).isShowPageT...');
      expect(StyleConfiguration.getSubTabsControllerStyle(BP_SM, SIDEBAR_LIST).isShowPageTitle).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1421 end');
    });

    /**
     * @tc.name   testScsReal1422
     * @tc.number SUB_MNB_SCS_1422
     * @tc.desc   State: repeated calls return independent objects with stable values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testScsReal1422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1422 begin');
      const first: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_SM, SIDEBAR_LIST);
      const second: SubTabsControllerStyle = StyleConfiguration.getSubTabsControllerStyle(BP_SM, SIDEBAR_LIST);
      const sameReference: boolean = first === second;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sameReference=%{public}s', String(sameReference));
      expect(sameReference).assertFalse();
      expect(first.secondMenuListItemHeight).assertEqual(second.secondMenuListItemHeight);
      expect(first.isShowSecondMenu).assertEqual(second.isShowSecondMenu);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testScsReal1422 end');
    });
  });
}
