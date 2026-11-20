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
import { CustomBreakPointStyle } from '../../../main/ets/model/StyleType';
import {
  BP_SM,
  BP_MD,
  BP_LG,
  NON_SM_BREAKPOINTS,
  BREAKPOINT_STYLE_SM,
  BREAKPOINT_STYLE_DEFAULT,
  FrozenBreakpointStyle,
  FrozenDefaultBreakpointStyle
} from '../util/NavSpec';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

/**
 * L1 cases for StyleConfiguration.getBreakpointStyle (common/Configuration.ets:18).
 * The method has exactly two branches: currentBreakpoint === 'sm' and everything else.
 * Expectations come from the frozen tables in util/NavSpec.ts.
 */
export default function bstFieldReal01Test() {
  describe('MultiNavBarBstFieldReal01', () => {
    /**
     * @tc.name   testBstReal0701
     * @tc.number SUB_MNB_BST_0701
     * @tc.desc   sm branch: control button box is 24x24 anchored at left 24 top 40
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBstReal0701', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0701 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_SM);
      const expected: FrozenBreakpointStyle = BREAKPOINT_STYLE_SM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'left=%{public}s expected=%{public}s',
        String(style.controlButtonStyle.left), String(expected.controlButtonLeft));
      expect(style.controlButtonStyle.left).assertEqual(expected.controlButtonLeft);
      expect(style.controlButtonStyle.top).assertEqual(expected.controlButtonTop);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.controlButtonStyle.width');
      expect(style.controlButtonStyle.width).assertEqual(expected.controlButtonWidth);
      expect(style.controlButtonStyle.height).assertEqual(expected.controlButtonHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0701 end');
    });

    /**
     * @tc.name   testBstReal0702
     * @tc.number SUB_MNB_BST_0702
     * @tc.desc   sm branch: side bar list height 56vp, margin 0, item width 20%
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBstReal0702', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0702 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_SM);
      const expected: FrozenBreakpointStyle = BREAKPOINT_STYLE_SM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'height=%{public}s expected=%{public}s',
        style.sideBarPrimaryNavListHeight, expected.sideBarPrimaryNavListHeight);
      expect(style.sideBarPrimaryNavListHeight).assertEqual(expected.sideBarPrimaryNavListHeight);
      expect(style.sideBarPrimaryNavListMargin).assertEqual(expected.sideBarPrimaryNavListMargin);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.sideBarPrimaryNavListItemWidth');
      expect(style.sideBarPrimaryNavListItemWidth).assertEqual(expected.sideBarPrimaryNavListItemWidth);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0702 end');
    });

    /**
     * @tc.name   testBstReal0703
     * @tc.number SUB_MNB_BST_0703
     * @tc.desc   sm branch: primary menu icon offset 7, text size 10, text height 14
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBstReal0703', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0703 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_SM);
      const expected: FrozenBreakpointStyle = BREAKPOINT_STYLE_SM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'imgTop=%{public}s expected=%{public}s',
        String(style.sideBarPrimaryMenuImgMargin.top), String(expected.sideBarPrimaryMenuImgMarginTop));
      expect(style.sideBarPrimaryMenuImgMargin.top).assertEqual(expected.sideBarPrimaryMenuImgMarginTop);
      expect(style.sideBarPrimaryMenuTextSize).assertEqual(expected.sideBarPrimaryMenuTextSize);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.sideBarPrimaryMenuTextHeight');
      expect(style.sideBarPrimaryMenuTextHeight).assertEqual(expected.sideBarPrimaryMenuTextHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0703 end');
    });

    /**
     * @tc.name   testBstReal0704
     * @tc.number SUB_MNB_BST_0704
     * @tc.desc   sm branch: main tabs content margin is top 24 bottom 0 left 16 right 16
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBstReal0704', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0704 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_SM);
      const expected: FrozenBreakpointStyle = BREAKPOINT_STYLE_SM;
      const margin = style.mainTabsContentMargin;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'margin=%{public}s/%{public}s/%{public}s/%{public}s',
        String(margin.top), String(margin.bottom), String(margin.left), String(margin.right));
      expect(margin.top).assertEqual(expected.mainTabsContentMarginTop);
      expect(margin.bottom).assertEqual(expected.mainTabsContentMarginBottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check margin.left');
      expect(margin.left).assertEqual(expected.mainTabsContentMarginLeft);
      expect(margin.right).assertEqual(expected.mainTabsContentMarginRight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0704 end');
    });

    /**
     * @tc.name   testBstReal0705
     * @tc.number SUB_MNB_BST_0705
     * @tc.desc   sm branch: recommendation grid is 284/138/576 and the background is #f1f3f5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBstReal0705', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0705 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_SM);
      const expected: FrozenBreakpointStyle = BREAKPOINT_STYLE_SM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'grid=%{public}s expected=%{public}s',
        String(style.recommendCompGridHeight), String(expected.recommendCompGridHeight));
      expect(style.recommendCompGridHeight).assertEqual(expected.recommendCompGridHeight);
      expect(style.recommendCompGridItemHeight).assertEqual(expected.recommendCompGridItemHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.recommendCompGridSecHeight');
      expect(style.recommendCompGridSecHeight).assertEqual(expected.recommendCompGridSecHeight);
      expect(style.recommendCompMargin.top).assertEqual(expected.recommendCompMarginTop);
      expect(style.mainTabsBcColor).assertEqual(expected.mainTabsBcColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0705 end');
    });

    /**
     * @tc.name   testBstReal0706
     * @tc.number SUB_MNB_BST_0706
     * @tc.desc   md branch keeps the same 24x24/24/40 control button box as sm
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBstReal0706', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0706 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_MD);
      const expected: FrozenDefaultBreakpointStyle = BREAKPOINT_STYLE_DEFAULT;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'top=%{public}s expected=%{public}s',
        String(style.controlButtonStyle.top), String(expected.controlButtonTop));
      expect(style.controlButtonStyle.left).assertEqual(expected.controlButtonLeft);
      expect(style.controlButtonStyle.top).assertEqual(expected.controlButtonTop);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.controlButtonStyle.width');
      expect(style.controlButtonStyle.width).assertEqual(expected.controlButtonWidth);
      expect(style.controlButtonStyle.height).assertEqual(expected.controlButtonHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0706 end');
    });

    /**
     * @tc.name   testBstReal0707
     * @tc.number SUB_MNB_BST_0707
     * @tc.desc   md branch: list height is blank, margin 24, item width 100%
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBstReal0707', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0707 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_MD);
      const expected: FrozenDefaultBreakpointStyle = BREAKPOINT_STYLE_DEFAULT;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'height=[%{public}s] margin=%{public}s', style.sideBarPrimaryNavListHeight,
        String(style.sideBarPrimaryNavListMargin));
      expect(style.sideBarPrimaryNavListHeight).assertEqual(expected.sideBarPrimaryNavListHeight);
      expect(style.sideBarPrimaryNavListMargin).assertEqual(expected.sideBarPrimaryNavListMargin);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.sideBarPrimaryNavListItemWidth');
      expect(style.sideBarPrimaryNavListItemWidth).assertEqual(expected.sideBarPrimaryNavListItemWidth);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0707 end');
    });

    /**
     * @tc.name   testBstReal0708
     * @tc.number SUB_MNB_BST_0708
     * @tc.desc   md branch: icon offset sinks to 0 while text grows to 12/16
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBstReal0708', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0708 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_MD);
      const expected: FrozenDefaultBreakpointStyle = BREAKPOINT_STYLE_DEFAULT;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'textSize=%{public}s expected=%{public}s',
        String(style.sideBarPrimaryMenuTextSize), String(expected.sideBarPrimaryMenuTextSize));
      expect(style.sideBarPrimaryMenuImgMargin.top).assertEqual(expected.sideBarPrimaryMenuImgMarginTop);
      expect(style.sideBarPrimaryMenuTextSize).assertEqual(expected.sideBarPrimaryMenuTextSize);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.sideBarPrimaryMenuTextHeight');
      expect(style.sideBarPrimaryMenuTextHeight).assertEqual(expected.sideBarPrimaryMenuTextHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0708 end');
    });

    /**
     * @tc.name   testBstReal0709
     * @tc.number SUB_MNB_BST_0709
     * @tc.desc   md branch: content margin becomes 24/22/24/24 on the wide layout
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBstReal0709', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0709 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_MD);
      const expected: FrozenDefaultBreakpointStyle = BREAKPOINT_STYLE_DEFAULT;
      const margin = style.mainTabsContentMargin;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'bottom=%{public}s expected=%{public}s',
        String(margin.bottom), String(expected.mainTabsContentMarginBottom));
      expect(margin.top).assertEqual(expected.mainTabsContentMarginTop);
      expect(margin.bottom).assertEqual(expected.mainTabsContentMarginBottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check margin.left');
      expect(margin.left).assertEqual(expected.mainTabsContentMarginLeft);
      expect(margin.right).assertEqual(expected.mainTabsContentMarginRight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0709 end');
    });

    /**
     * @tc.name   testBstReal0710
     * @tc.number SUB_MNB_BST_0710
     * @tc.desc   md branch: recommendation grid shrinks to 106/106/220 with a white background
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testBstReal0710', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0710 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_MD);
      const expected: FrozenDefaultBreakpointStyle = BREAKPOINT_STYLE_DEFAULT;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'grid=%{public}s bcColor=%{public}s',
        String(style.recommendCompGridHeight), style.mainTabsBcColor);
      expect(style.recommendCompGridHeight).assertEqual(expected.recommendCompGridHeight);
      expect(style.recommendCompGridItemHeight).assertEqual(expected.recommendCompGridItemHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.recommendCompGridSecHeight');
      expect(style.recommendCompGridSecHeight).assertEqual(expected.recommendCompGridSecHeight);
      expect(style.recommendCompMargin.top).assertEqual(expected.recommendCompMarginTop);
      expect(style.mainTabsBcColor).assertEqual(expected.mainTabsBcColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0710 end');
    });

    /**
     * @tc.name   testBstReal0711
     * @tc.number SUB_MNB_BST_0711
     * @tc.desc   lg shares the md branch: grid 106 and content margin bottom 22
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBstReal0711', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0711 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_LG);
      const expected: FrozenDefaultBreakpointStyle = BREAKPOINT_STYLE_DEFAULT;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'grid=%{public}s expected=%{public}s',
        String(style.recommendCompGridHeight), String(expected.recommendCompGridHeight));
      expect(style.recommendCompGridHeight).assertEqual(expected.recommendCompGridHeight);
      expect(style.mainTabsContentMargin.bottom).assertEqual(expected.mainTabsContentMarginBottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.sideBarPrimaryNavListItemWidth');
      expect(style.sideBarPrimaryNavListItemWidth).assertEqual(expected.sideBarPrimaryNavListItemWidth);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0711 end');
    });

    /**
     * @tc.name   testBstReal0712
     * @tc.number SUB_MNB_BST_0712
     * @tc.desc   Anchor: an empty breakpoint falls back to the wide branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBstReal0712', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0712 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('');
      const expected: FrozenDefaultBreakpointStyle = BREAKPOINT_STYLE_DEFAULT;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'bcColor=%{public}s expected=%{public}s',
        style.mainTabsBcColor, expected.mainTabsBcColor);
      expect(style.mainTabsBcColor).assertEqual(expected.mainTabsBcColor);
      expect(style.recommendCompGridHeight).assertEqual(expected.recommendCompGridHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.sideBarPrimaryNavListMargin');
      expect(style.sideBarPrimaryNavListMargin).assertEqual(expected.sideBarPrimaryNavListMargin);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0712 end');
    });

    /**
     * @tc.name   testBstReal0713
     * @tc.number SUB_MNB_BST_0713
     * @tc.desc   Anchor: uppercase 'SM' does not select the compact branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBstReal0713', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0713 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('SM');
      const expected: FrozenDefaultBreakpointStyle = BREAKPOINT_STYLE_DEFAULT;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'textSize=%{public}s expected=%{public}s',
        String(style.sideBarPrimaryMenuTextSize), String(expected.sideBarPrimaryMenuTextSize));
      expect(style.sideBarPrimaryMenuTextSize).assertEqual(expected.sideBarPrimaryMenuTextSize);
      expect(style.sideBarPrimaryNavListHeight).assertEqual(expected.sideBarPrimaryNavListHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.mainTabsContentMargin.left');
      expect(style.mainTabsContentMargin.left).assertEqual(expected.mainTabsContentMarginLeft);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0713 end');
    });

    /**
     * @tc.name   testBstReal0714
     * @tc.number SUB_MNB_BST_0714
     * @tc.desc   Anchor: 'md ' with trailing whitespace still maps to the wide branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBstReal0714', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0714 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md ');
      const expected: FrozenDefaultBreakpointStyle = BREAKPOINT_STYLE_DEFAULT;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'itemWidth=%{public}s expected=%{public}s',
        style.sideBarPrimaryNavListItemWidth, expected.sideBarPrimaryNavListItemWidth);
      expect(style.sideBarPrimaryNavListItemWidth).assertEqual(expected.sideBarPrimaryNavListItemWidth);
      expect(style.sideBarPrimaryMenuImgMargin.top).assertEqual(expected.sideBarPrimaryMenuImgMarginTop);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.recommendCompGridSecHeight');
      expect(style.recommendCompGridSecHeight).assertEqual(expected.recommendCompGridSecHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0714 end');
    });

    /**
     * @tc.name   testBstReal0715
     * @tc.number SUB_MNB_BST_0715
     * @tc.desc   An unknown key 'xs' is treated as the wide branch, not as an error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstReal0715', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0715 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xs');
      const expected: FrozenDefaultBreakpointStyle = BREAKPOINT_STYLE_DEFAULT;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'gridItem=%{public}s expected=%{public}s',
        String(style.recommendCompGridItemHeight), String(expected.recommendCompGridItemHeight));
      expect(style.recommendCompGridItemHeight).assertEqual(expected.recommendCompGridItemHeight);
      expect(style.sideBarPrimaryMenuTextHeight).assertEqual(expected.sideBarPrimaryMenuTextHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.mainTabsBcColor');
      expect(style.mainTabsBcColor).assertEqual(expected.mainTabsBcColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0715 end');
    });

    /**
     * @tc.name   testBstReal0716
     * @tc.number SUB_MNB_BST_0716
     * @tc.desc   State: two calls return independent objects so mutating one does not leak
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstReal0716', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0716 begin');
      const first: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_SM);
      const second: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_SM);
      const sameReference: boolean = first === second;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sameReference=%{public}s expected=%{public}s',
        String(sameReference), 'false');
      expect(sameReference).assertFalse();
      expect(first.mainTabsBcColor).assertEqual(second.mainTabsBcColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check first.recommendCompGridHeight');
      expect(first.recommendCompGridHeight).assertEqual(second.recommendCompGridHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0716 end');
    });

    /**
     * @tc.name   testBstReal0717
     * @tc.number SUB_MNB_BST_0717
     * @tc.desc   State: mutating a returned style does not change the next result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstReal0717', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0717 begin');
      const first: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_SM);
      first.recommendCompGridHeight = 9999;
      first.mainTabsBcColor = '#000000';
      const second: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_SM);
      const expected: FrozenBreakpointStyle = BREAKPOINT_STYLE_SM;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'grid=%{public}s expected=%{public}s',
        String(second.recommendCompGridHeight), String(expected.recommendCompGridHeight));
      expect(second.recommendCompGridHeight).assertEqual(expected.recommendCompGridHeight);
      expect(second.mainTabsBcColor).assertEqual(expected.mainTabsBcColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check second.mainTabsBcColor === first.mainTabsBcColor');
      expect(second.mainTabsBcColor === first.mainTabsBcColor).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0717 end');
    });

    /**
     * @tc.name   testBstReal0718
     * @tc.number SUB_MNB_BST_0718
     * @tc.desc   Property: the sm grid is taller than the wide grid on every height field
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testBstReal0718', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0718 begin');
      const smStyle: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_SM);
      const mdStyle: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_MD);
      const smTaller: boolean = smStyle.recommendCompGridHeight > mdStyle.recommendCompGridHeight &&
        smStyle.recommendCompGridItemHeight > mdStyle.recommendCompGridItemHeight &&
        smStyle.recommendCompGridSecHeight > mdStyle.recommendCompGridSecHeight;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smTaller=%{public}s expected=%{public}s', String(smTaller), 'true');
      expect(smTaller).assertTrue();
      expect(mdStyle.recommendCompGridHeight).assertEqual(106);
      expect(smStyle.recommendCompGridHeight).assertEqual(284);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0718 end');
    });

    /**
     * @tc.name   testBstReal0719
     * @tc.number SUB_MNB_BST_0719
     * @tc.desc   Property: item width is a percentage on both branches but differs in value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstReal0719', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0719 begin');
      const smStyle: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_SM);
      const mdStyle: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_MD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm=%{public}s md=%{public}s',
        smStyle.sideBarPrimaryNavListItemWidth, mdStyle.sideBarPrimaryNavListItemWidth);
      expect(smStyle.sideBarPrimaryNavListItemWidth).assertContain('%');
      expect(mdStyle.sideBarPrimaryNavListItemWidth).assertContain('%');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s',
        'check smStyle.sideBarPrimaryNavListItemWidth === mdStyle.sideBarPrimaryNavListItemW...');
      expect(smStyle.sideBarPrimaryNavListItemWidth === mdStyle.sideBarPrimaryNavListItemWidth).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0719 end');
    });

    /**
     * @tc.name   testBstReal0720
     * @tc.number SUB_MNB_BST_0720
     * @tc.desc   Anchor: background colours differ only by case and value, both are kept verbatim
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstReal0720', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0720 begin');
      const smStyle: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(BP_SM);
      const upperStyle: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sm=%{public}s upper=%{public}s', smStyle.mainTabsBcColor,
        upperStyle.mainTabsBcColor);
      expect(smStyle.mainTabsBcColor).assertEqual('#f1f3f5');
      expect(upperStyle.mainTabsBcColor).assertEqual('#fff');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check smStyle.mainTabsBcColor === upperStyle.mainTabsBcColor');
      expect(smStyle.mainTabsBcColor === upperStyle.mainTabsBcColor).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0720 end');
    });

    /**
     * @tc.name   testBstReal0721
     * @tc.number SUB_MNB_BST_0721
     * @tc.desc   Extreme: a 256 character breakpoint key still resolves to the wide branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstReal0721', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0721 begin');
      const longKey: string = 'sm'.repeat(128);
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(longKey);
      const expected: FrozenDefaultBreakpointStyle = BREAKPOINT_STYLE_DEFAULT;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'grid=%{public}s expected=%{public}s',
        String(style.recommendCompGridHeight), String(expected.recommendCompGridHeight));
      expect(style.recommendCompGridHeight).assertEqual(expected.recommendCompGridHeight);
      expect(style.sideBarPrimaryMenuTextSize).assertEqual(expected.sideBarPrimaryMenuTextSize);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.mainTabsContentMargin.right');
      expect(style.mainTabsContentMargin.right).assertEqual(expected.mainTabsContentMarginRight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0721 end');
    });

    /**
     * @tc.name   testBstReal0722
     * @tc.number SUB_MNB_BST_0722
     * @tc.desc   Combination: every NON_SM_BREAKPOINTS probe yields the wide grid height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstReal0722', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0722 begin');
      const expected: FrozenDefaultBreakpointStyle = BREAKPOINT_STYLE_DEFAULT;
      let smHits: number = 0;
      for (let i: number = 0; i < NON_SM_BREAKPOINTS.length; i++) {
        const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(NON_SM_BREAKPOINTS[i]);
        if (style.recommendCompGridHeight !== expected.recommendCompGridHeight) {
          smHits++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'smHits=%{public}s probes=%{public}s', String(smHits),
        String(NON_SM_BREAKPOINTS.length));
      expect(smHits).assertEqual(0);
      expect(NON_SM_BREAKPOINTS.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check value');
      expect(StyleConfiguration.getBreakpointStyle(BP_SM).recommendCompGridHeight)
        .assertEqual(BREAKPOINT_STYLE_SM.recommendCompGridHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstReal0722 end');
    });
  });
}
