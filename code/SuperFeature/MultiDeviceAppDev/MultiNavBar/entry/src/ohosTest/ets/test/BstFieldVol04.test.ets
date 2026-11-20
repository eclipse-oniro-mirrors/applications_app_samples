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
import { CustomBreakPointStyle } from '../../../main/ets/model/StyleType';
import { BREAKPOINT_STYLE_SM, BREAKPOINT_STYLE_DEFAULT } from '../util/NavSpec';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function bstFieldVol04Test() {
  describe('MultiNavBarBstFieldVol04', () => {

    /**
     * @tc.name   testBstFieldVol040001
     * @tc.number SUB_MNB_BST_0948
     * @tc.desc   getBreakpointStyle('sm') window #0 covers
     *   controlButtonStyle.height/sideBarPrimaryMenuTextSize/recommendCompMargin.top/sideBarPrimaryNavListMargin/
     *   mainTabsContentMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040001 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_SM.controlButtonHeight)));
      expect(String(result.controlButtonStyle.height)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop)));
      expect(String(result.recommendCompMargin.top)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040001 end');
    });

    /**
     * @tc.name   testBstFieldVol040002
     * @tc.number SUB_MNB_BST_0949
     * @tc.desc   getBreakpointStyle('') window #1 covers
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom/recommendCompGridSecHeight/
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040002 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040002 end');
    });

    /**
     * @tc.name   testBstFieldVol040003
     * @tc.number SUB_MNB_BST_0950
     * @tc.desc   getBreakpointStyle('SM') window #2 covers
     *   sideBarPrimaryMenuTextHeight/recommendCompMargin.top/controlButtonStyle.top/mainTabsContentMargin.bottom/
     *   recommendCompGridItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040003 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop)));
      expect(
        String(result.recommendCompMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040003 end');
    });

    /**
     * @tc.name   testBstFieldVol040004
     * @tc.number SUB_MNB_BST_0951
     * @tc.desc   getBreakpointStyle('Md') window #3 covers
     *   mainTabsContentMargin.left/recommendCompGridSecHeight/sideBarPrimaryNavListHeight/recommendCompMargin.top/
     *   controlButtonStyle.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040004 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop)));
      expect(
        String(result.recommendCompMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040004 end');
    });

    /**
     * @tc.name   testBstFieldVol040005
     * @tc.number SUB_MNB_BST_0952
     * @tc.desc   getBreakpointStyle(' sm') window #4 covers
     *   recommendCompGridHeight/controlButtonStyle.top/sideBarPrimaryMenuImgMargin.top/recommendCompGridSecHeight/
     *   controlButtonStyle.height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040005 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(' sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight)));
      expect(
        String(result.recommendCompGridHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight)));
      expect(
        String(result.controlButtonStyle.height)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040005 end');
    });

    /**
     * @tc.name   testBstFieldVol040006
     * @tc.number SUB_MNB_BST_0953
     * @tc.desc   getBreakpointStyle('lg ') window #5 covers
     *   mainTabsBcColor/sideBarPrimaryNavListHeight/mainTabsContentMargin.top/controlButtonStyle.top/
     *   sideBarPrimaryNavListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040006 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040006 end');
    });

    /**
     * @tc.name   testBstFieldVol040007
     * @tc.number SUB_MNB_BST_0954
     * @tc.desc   getBreakpointStyle('xs') window #6 covers
     *   controlButtonStyle.width/sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.right/
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040007 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040007 end');
    });

    /**
     * @tc.name   testBstFieldVol040008
     * @tc.number SUB_MNB_BST_0955
     * @tc.desc   getBreakpointStyle('xl') window #7 covers
     *   sideBarPrimaryNavListMargin/mainTabsContentMargin.top/recommendCompGridItemHeight/
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040008 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xl');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040008 end');
    });

    /**
     * @tc.name   testBstFieldVol040009
     * @tc.number SUB_MNB_BST_0956
     * @tc.desc   getBreakpointStyle('0') window #8 covers
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right/controlButtonStyle.left/mainTabsContentMargin.top/
     *   recommendCompGridHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040009 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight)));
      expect(
        String(result.recommendCompGridHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040009 end');
    });

    /**
     * @tc.name   testBstFieldVol040010
     * @tc.number SUB_MNB_BST_0957
     * @tc.desc   getBreakpointStyle('s') window #9 covers
     *   mainTabsContentMargin.bottom/recommendCompGridItemHeight/controlButtonStyle.height/mainTabsContentMargin.right/
     *   mainTabsBcColor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040010 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('s');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight)));
      expect(
        String(result.controlButtonStyle.height)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040010 end');
    });

    /**
     * @tc.name   testBstFieldVol040011
     * @tc.number SUB_MNB_BST_0958
     * @tc.desc   getBreakpointStyle('smlg') window #10 covers
     *   recommendCompMargin.top/controlButtonStyle.left/sideBarPrimaryNavListItemWidth/recommendCompGridItemHeight/
     *   controlButtonStyle.width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040011 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('smlg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop)));
      expect(
        String(result.recommendCompMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040011 end');
    });

    /**
     * @tc.name   testBstFieldVol040012
     * @tc.number SUB_MNB_BST_0959
     * @tc.desc   getBreakpointStyle('tab') window #11 covers
     *   recommendCompGridSecHeight/controlButtonStyle.height/sideBarPrimaryMenuTextHeight/controlButtonStyle.left/
     *   sideBarPrimaryNavListMargin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040012 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('tab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight)));
      expect(
        String(result.controlButtonStyle.height)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040012 end');
    });

    /**
     * @tc.name   testBstFieldVol040013
     * @tc.number SUB_MNB_BST_0960
     * @tc.desc   getBreakpointStyle('sm sm') window #12 covers
     *   controlButtonStyle.top/sideBarPrimaryNavListItemWidth/mainTabsContentMargin.left/controlButtonStyle.height/
     *   sideBarPrimaryMenuTextSize
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040013 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight)));
      expect(
        String(result.controlButtonStyle.height)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040013 end');
    });

    /**
     * @tc.name   testBstFieldVol040014
     * @tc.number SUB_MNB_BST_0961
     * @tc.desc   getBreakpointStyle('md\t') window #13 covers
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight/recommendCompGridHeight/
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040014 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight)));
      expect(
        String(result.recommendCompGridHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040014 end');
    });

    /**
     * @tc.name   testBstFieldVol040015
     * @tc.number SUB_MNB_BST_0962
     * @tc.desc   getBreakpointStyle('small') window #14 covers
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left/mainTabsBcColor/sideBarPrimaryMenuTextHeight/
     *   recommendCompMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040015 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('small');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop)));
      expect(
        String(result.recommendCompMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040015 end');
    });

    /**
     * @tc.name   testBstFieldVol040016
     * @tc.number SUB_MNB_BST_0963
     * @tc.desc   getBreakpointStyle('medium') window #15 covers
     *   mainTabsContentMargin.top/recommendCompGridHeight/controlButtonStyle.width/mainTabsContentMargin.left/
     *   recommendCompGridSecHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040016 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('medium');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight)));
      expect(
        String(result.recommendCompGridHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040016 end');
    });

    /**
     * @tc.name   testBstFieldVol040017
     * @tc.number SUB_MNB_BST_0964
     * @tc.desc   getBreakpointStyle('large') window #16 covers
     *   mainTabsContentMargin.right/mainTabsBcColor/sideBarPrimaryNavListMargin/recommendCompGridHeight/
     *   controlButtonStyle.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040017 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('large');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight)));
      expect(
        String(result.recommendCompGridHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040017 end');
    });

    /**
     * @tc.name   testBstFieldVol040018
     * @tc.number SUB_MNB_BST_0965
     * @tc.desc   getBreakpointStyle('Sm') window #17 covers
     *   recommendCompGridItemHeight/controlButtonStyle.width/sideBarPrimaryMenuTextSize/mainTabsBcColor/
     *   sideBarPrimaryNavListHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040018 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('Sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040018 end');
    });

    /**
     * @tc.name   testBstFieldVol040019
     * @tc.number SUB_MNB_BST_0966
     * @tc.desc   getBreakpointStyle('SMALL') window #18 covers
     *   controlButtonStyle.left/sideBarPrimaryNavListMargin/mainTabsContentMargin.bottom/controlButtonStyle.width/
     *   sideBarPrimaryMenuImgMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040019 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('SMALL');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040019 end');
    });

    /**
     * @tc.name   testBstFieldVol040020
     * @tc.number SUB_MNB_BST_0967
     * @tc.desc   getBreakpointStyle('sm\t') window #19 covers
     *   controlButtonStyle.height/sideBarPrimaryMenuTextSize/recommendCompMargin.top/sideBarPrimaryNavListMargin/
     *   mainTabsContentMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040020 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm\t');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight)));
      expect(
        String(result.controlButtonStyle.height)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop)));
      expect(
        String(result.recommendCompMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040020 end');
    });

    /**
     * @tc.name   testBstFieldVol040021
     * @tc.number SUB_MNB_BST_0968
     * @tc.desc   getBreakpointStyle('\tsm') window #20 covers
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom/recommendCompGridSecHeight/
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040021 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('\tsm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040021 end');
    });

    /**
     * @tc.name   testBstFieldVol040022
     * @tc.number SUB_MNB_BST_0969
     * @tc.desc   getBreakpointStyle('tablet') window #21 covers
     *   sideBarPrimaryMenuTextHeight/recommendCompMargin.top/controlButtonStyle.top/mainTabsContentMargin.bottom/
     *   recommendCompGridItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040022 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('tablet');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop)));
      expect(
        String(result.recommendCompMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040022 end');
    });

    /**
     * @tc.name   testBstFieldVol040023
     * @tc.number SUB_MNB_BST_0970
     * @tc.desc   getBreakpointStyle('phone') window #22 covers
     *   mainTabsContentMargin.left/recommendCompGridSecHeight/sideBarPrimaryNavListHeight/recommendCompMargin.top/
     *   controlButtonStyle.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040023 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('phone');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop)));
      expect(
        String(result.recommendCompMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040023 end');
    });

    /**
     * @tc.name   testBstFieldVol040024
     * @tc.number SUB_MNB_BST_0971
     * @tc.desc   getBreakpointStyle('watch') window #23 covers
     *   recommendCompGridHeight/controlButtonStyle.top/sideBarPrimaryMenuImgMargin.top/recommendCompGridSecHeight/
     *   controlButtonStyle.height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040024 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('watch');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight)));
      expect(
        String(result.recommendCompGridHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight)));
      expect(
        String(result.controlButtonStyle.height)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040024 end');
    });

    /**
     * @tc.name   testBstFieldVol040025
     * @tc.number SUB_MNB_BST_0972
     * @tc.desc   getBreakpointStyle('tv') window #24 covers
     *   mainTabsBcColor/sideBarPrimaryNavListHeight/mainTabsContentMargin.top/controlButtonStyle.top/
     *   sideBarPrimaryNavListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040025 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('tv');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040025 end');
    });

    /**
     * @tc.name   testBstFieldVol040026
     * @tc.number SUB_MNB_BST_0973
     * @tc.desc   getBreakpointStyle('sm') window #25 covers
     *   controlButtonStyle.width/sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.right/
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040026 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_SM.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040026 end');
    });

    /**
     * @tc.name   testBstFieldVol040027
     * @tc.number SUB_MNB_BST_0974
     * @tc.desc   getBreakpointStyle('') window #26 covers
     *   sideBarPrimaryNavListMargin/mainTabsContentMargin.top/recommendCompGridItemHeight/
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040027 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040027 end');
    });

    /**
     * @tc.name   testBstFieldVol040028
     * @tc.number SUB_MNB_BST_0975
     * @tc.desc   getBreakpointStyle('SM') window #27 covers
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right/controlButtonStyle.left/mainTabsContentMargin.top/
     *   recommendCompGridHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040028 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight)));
      expect(
        String(result.recommendCompGridHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040028 end');
    });

    /**
     * @tc.name   testBstFieldVol040029
     * @tc.number SUB_MNB_BST_0976
     * @tc.desc   getBreakpointStyle('Md') window #28 covers
     *   mainTabsContentMargin.bottom/recommendCompGridItemHeight/controlButtonStyle.height/mainTabsContentMargin.right/
     *   mainTabsBcColor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040029 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight)));
      expect(
        String(result.controlButtonStyle.height)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040029 end');
    });

    /**
     * @tc.name   testBstFieldVol040030
     * @tc.number SUB_MNB_BST_0977
     * @tc.desc   getBreakpointStyle(' sm') window #29 covers
     *   recommendCompMargin.top/controlButtonStyle.left/sideBarPrimaryNavListItemWidth/recommendCompGridItemHeight/
     *   controlButtonStyle.width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040030 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(' sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop)));
      expect(
        String(result.recommendCompMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040030 end');
    });

    /**
     * @tc.name   testBstFieldVol040031
     * @tc.number SUB_MNB_BST_0978
     * @tc.desc   getBreakpointStyle('lg ') window #30 covers
     *   recommendCompGridSecHeight/controlButtonStyle.height/sideBarPrimaryMenuTextHeight/controlButtonStyle.left/
     *   sideBarPrimaryNavListMargin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040031 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight)));
      expect(
        String(result.controlButtonStyle.height)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040031 end');
    });

    /**
     * @tc.name   testBstFieldVol040032
     * @tc.number SUB_MNB_BST_0979
     * @tc.desc   getBreakpointStyle('xs') window #31 covers
     *   controlButtonStyle.top/sideBarPrimaryNavListItemWidth/mainTabsContentMargin.left/controlButtonStyle.height/
     *   sideBarPrimaryMenuTextSize
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040032 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight)));
      expect(
        String(result.controlButtonStyle.height)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040032 end');
    });

    /**
     * @tc.name   testBstFieldVol040033
     * @tc.number SUB_MNB_BST_0980
     * @tc.desc   getBreakpointStyle('xl') window #32 covers
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight/recommendCompGridHeight/
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040033 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xl');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight)));
      expect(
        String(result.recommendCompGridHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040033 end');
    });

    /**
     * @tc.name   testBstFieldVol040034
     * @tc.number SUB_MNB_BST_0981
     * @tc.desc   getBreakpointStyle('0') window #33 covers
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left/mainTabsBcColor/sideBarPrimaryMenuTextHeight/
     *   recommendCompMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040034 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop)));
      expect(
        String(result.recommendCompMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040034 end');
    });

    /**
     * @tc.name   testBstFieldVol040035
     * @tc.number SUB_MNB_BST_0982
     * @tc.desc   getBreakpointStyle('s') window #34 covers
     *   mainTabsContentMargin.top/recommendCompGridHeight/controlButtonStyle.width/mainTabsContentMargin.left/
     *   recommendCompGridSecHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040035 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('s');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight)));
      expect(
        String(result.recommendCompGridHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040035 end');
    });

    /**
     * @tc.name   testBstFieldVol040036
     * @tc.number SUB_MNB_BST_0983
     * @tc.desc   getBreakpointStyle('smlg') window #35 covers
     *   mainTabsContentMargin.right/mainTabsBcColor/sideBarPrimaryNavListMargin/recommendCompGridHeight/
     *   controlButtonStyle.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040036 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('smlg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight)));
      expect(
        String(result.recommendCompGridHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040036 end');
    });

    /**
     * @tc.name   testBstFieldVol040037
     * @tc.number SUB_MNB_BST_0984
     * @tc.desc   getBreakpointStyle('tab') window #36 covers
     *   recommendCompGridItemHeight/controlButtonStyle.width/sideBarPrimaryMenuTextSize/mainTabsBcColor/
     *   sideBarPrimaryNavListHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040037 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('tab');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040037 end');
    });

    /**
     * @tc.name   testBstFieldVol040038
     * @tc.number SUB_MNB_BST_0985
     * @tc.desc   getBreakpointStyle('sm sm') window #37 covers
     *   controlButtonStyle.left/sideBarPrimaryNavListMargin/mainTabsContentMargin.bottom/controlButtonStyle.width/
     *   sideBarPrimaryMenuImgMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040038 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom),
        String(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_DEFAULT.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040038 end');
    });

  });
}
