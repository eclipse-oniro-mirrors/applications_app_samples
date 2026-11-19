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
import { CustomBreakPointStyle } from '../../../main/ets/model/StyleType';
import { BREAKPOINT_STYLE_SM } from '../util/NavSpec';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function bstFieldVol01Test() {
  describe('MultiNavBarBstFieldVol01', () => {

    /**
     * @tc.name   testBstFieldVol010001
     * @tc.number SUB_MNB_BST_0723
     * @tc.desc   getBreakpointStyle('sm') window #0 covers
     *   controlButtonStyle.left/sideBarPrimaryNavListMargin/mainTabsContentMargin.bottom/controlButtonStyle.width/
     *   sideBarPrimaryMenuImgMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010001 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_SM.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_SM.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010001 end');
    });

    /**
     * @tc.name   testBstFieldVol010002
     * @tc.number SUB_MNB_BST_0724
     * @tc.desc   getBreakpointStyle('sm') window #1 covers
     *   controlButtonStyle.height/sideBarPrimaryMenuTextSize/recommendCompMargin.top/sideBarPrimaryNavListMargin/
     *   mainTabsContentMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010002 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010002 end');
    });

    /**
     * @tc.name   testBstFieldVol010003
     * @tc.number SUB_MNB_BST_0725
     * @tc.desc   getBreakpointStyle('sm') window #2 covers
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom/recommendCompGridSecHeight/
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010003 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010003 end');
    });

    /**
     * @tc.name   testBstFieldVol010004
     * @tc.number SUB_MNB_BST_0726
     * @tc.desc   getBreakpointStyle('sm') window #3 covers
     *   sideBarPrimaryMenuTextHeight/recommendCompMargin.top/controlButtonStyle.top/mainTabsContentMargin.bottom/
     *   recommendCompGridItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010004 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop)));
      expect(String(result.recommendCompMargin.top)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_SM.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010004 end');
    });

    /**
     * @tc.name   testBstFieldVol010005
     * @tc.number SUB_MNB_BST_0727
     * @tc.desc   getBreakpointStyle('sm') window #4 covers
     *   mainTabsContentMargin.left/recommendCompGridSecHeight/sideBarPrimaryNavListHeight/recommendCompMargin.top/
     *   controlButtonStyle.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010005 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop)));
      expect(String(result.recommendCompMargin.top)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_SM.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010005 end');
    });

    /**
     * @tc.name   testBstFieldVol010006
     * @tc.number SUB_MNB_BST_0728
     * @tc.desc   getBreakpointStyle('sm') window #5 covers
     *   recommendCompGridHeight/controlButtonStyle.top/sideBarPrimaryMenuImgMargin.top/recommendCompGridSecHeight/
     *   controlButtonStyle.height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010006 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight)));
      expect(String(result.recommendCompGridHeight)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_SM.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_SM.controlButtonHeight)));
      expect(String(result.controlButtonStyle.height)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010006 end');
    });

    /**
     * @tc.name   testBstFieldVol010007
     * @tc.number SUB_MNB_BST_0729
     * @tc.desc   getBreakpointStyle('sm') window #6 covers
     *   mainTabsBcColor/sideBarPrimaryNavListHeight/mainTabsContentMargin.top/controlButtonStyle.top/
     *   sideBarPrimaryNavListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010007 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_SM.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_SM.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010007 end');
    });

    /**
     * @tc.name   testBstFieldVol010008
     * @tc.number SUB_MNB_BST_0730
     * @tc.desc   getBreakpointStyle('sm') window #7 covers
     *   controlButtonStyle.width/sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.right/
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010008 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010008 end');
    });

    /**
     * @tc.name   testBstFieldVol010009
     * @tc.number SUB_MNB_BST_0731
     * @tc.desc   getBreakpointStyle('sm') window #8 covers
     *   sideBarPrimaryNavListMargin/mainTabsContentMargin.top/recommendCompGridItemHeight/
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010009 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010009 end');
    });

    /**
     * @tc.name   testBstFieldVol010010
     * @tc.number SUB_MNB_BST_0732
     * @tc.desc   getBreakpointStyle('sm') window #9 covers
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right/controlButtonStyle.left/mainTabsContentMargin.top/
     *   recommendCompGridHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010010 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_SM.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight)));
      expect(String(result.recommendCompGridHeight)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010010 end');
    });

    /**
     * @tc.name   testBstFieldVol010011
     * @tc.number SUB_MNB_BST_0733
     * @tc.desc   getBreakpointStyle('sm') window #10 covers
     *   mainTabsContentMargin.bottom/recommendCompGridItemHeight/controlButtonStyle.height/mainTabsContentMargin.right/
     *   mainTabsBcColor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010011 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_SM.controlButtonHeight)));
      expect(String(result.controlButtonStyle.height)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_SM.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010011 end');
    });

    /**
     * @tc.name   testBstFieldVol010012
     * @tc.number SUB_MNB_BST_0734
     * @tc.desc   getBreakpointStyle('sm') window #11 covers
     *   recommendCompMargin.top/controlButtonStyle.left/sideBarPrimaryNavListItemWidth/recommendCompGridItemHeight/
     *   controlButtonStyle.width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010012 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop)));
      expect(String(result.recommendCompMargin.top)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_SM.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_SM.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010012 end');
    });

    /**
     * @tc.name   testBstFieldVol010013
     * @tc.number SUB_MNB_BST_0735
     * @tc.desc   getBreakpointStyle('sm') window #12 covers
     *   recommendCompGridSecHeight/controlButtonStyle.height/sideBarPrimaryMenuTextHeight/controlButtonStyle.left/
     *   sideBarPrimaryNavListMargin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010013 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_SM.controlButtonHeight)));
      expect(String(result.controlButtonStyle.height)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_SM.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010013 end');
    });

    /**
     * @tc.name   testBstFieldVol010014
     * @tc.number SUB_MNB_BST_0736
     * @tc.desc   getBreakpointStyle('sm') window #13 covers
     *   controlButtonStyle.top/sideBarPrimaryNavListItemWidth/mainTabsContentMargin.left/controlButtonStyle.height/
     *   sideBarPrimaryMenuTextSize
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010014 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_SM.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_SM.controlButtonHeight)));
      expect(String(result.controlButtonStyle.height)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010014 end');
    });

    /**
     * @tc.name   testBstFieldVol010015
     * @tc.number SUB_MNB_BST_0737
     * @tc.desc   getBreakpointStyle('sm') window #14 covers
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight/recommendCompGridHeight/
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010015 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight)));
      expect(String(result.recommendCompGridHeight)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010015 end');
    });

    /**
     * @tc.name   testBstFieldVol010016
     * @tc.number SUB_MNB_BST_0738
     * @tc.desc   getBreakpointStyle('sm') window #15 covers
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left/mainTabsBcColor/sideBarPrimaryMenuTextHeight/
     *   recommendCompMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010016 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_SM.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop)));
      expect(String(result.recommendCompMargin.top)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010016 end');
    });

    /**
     * @tc.name   testBstFieldVol010017
     * @tc.number SUB_MNB_BST_0739
     * @tc.desc   getBreakpointStyle('sm') window #16 covers
     *   mainTabsContentMargin.top/recommendCompGridHeight/controlButtonStyle.width/mainTabsContentMargin.left/
     *   recommendCompGridSecHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010017 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight)));
      expect(String(result.recommendCompGridHeight)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_SM.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010017 end');
    });

    /**
     * @tc.name   testBstFieldVol010018
     * @tc.number SUB_MNB_BST_0740
     * @tc.desc   getBreakpointStyle('sm') window #17 covers
     *   mainTabsContentMargin.right/mainTabsBcColor/sideBarPrimaryNavListMargin/recommendCompGridHeight/
     *   controlButtonStyle.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010018 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_SM.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight)));
      expect(String(result.recommendCompGridHeight)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_SM.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010018 end');
    });

    /**
     * @tc.name   testBstFieldVol010019
     * @tc.number SUB_MNB_BST_0741
     * @tc.desc   getBreakpointStyle('sm') window #18 covers
     *   recommendCompGridItemHeight/controlButtonStyle.width/sideBarPrimaryMenuTextSize/mainTabsBcColor/
     *   sideBarPrimaryNavListHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010019 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_SM.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_SM.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010019 end');
    });

    /**
     * @tc.name   testBstFieldVol010020
     * @tc.number SUB_MNB_BST_0742
     * @tc.desc   getBreakpointStyle('sm') window #19 covers
     *   controlButtonStyle.left/sideBarPrimaryNavListMargin/mainTabsContentMargin.bottom/controlButtonStyle.width/
     *   sideBarPrimaryMenuImgMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010020 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_SM.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_SM.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010020 end');
    });

    /**
     * @tc.name   testBstFieldVol010021
     * @tc.number SUB_MNB_BST_0743
     * @tc.desc   getBreakpointStyle('sm') window #20 covers
     *   controlButtonStyle.height/sideBarPrimaryMenuTextSize/recommendCompMargin.top/sideBarPrimaryNavListMargin/
     *   mainTabsContentMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010021 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010021 end');
    });

    /**
     * @tc.name   testBstFieldVol010022
     * @tc.number SUB_MNB_BST_0744
     * @tc.desc   getBreakpointStyle('sm') window #21 covers
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom/recommendCompGridSecHeight/
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010022 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010022 end');
    });

    /**
     * @tc.name   testBstFieldVol010023
     * @tc.number SUB_MNB_BST_0745
     * @tc.desc   getBreakpointStyle('sm') window #22 covers
     *   sideBarPrimaryMenuTextHeight/recommendCompMargin.top/controlButtonStyle.top/mainTabsContentMargin.bottom/
     *   recommendCompGridItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010023 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop)));
      expect(String(result.recommendCompMargin.top)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_SM.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010023 end');
    });

    /**
     * @tc.name   testBstFieldVol010024
     * @tc.number SUB_MNB_BST_0746
     * @tc.desc   getBreakpointStyle('sm') window #23 covers
     *   mainTabsContentMargin.left/recommendCompGridSecHeight/sideBarPrimaryNavListHeight/recommendCompMargin.top/
     *   controlButtonStyle.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010024 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop)));
      expect(String(result.recommendCompMargin.top)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_SM.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010024 end');
    });

    /**
     * @tc.name   testBstFieldVol010025
     * @tc.number SUB_MNB_BST_0747
     * @tc.desc   getBreakpointStyle('sm') window #24 covers
     *   recommendCompGridHeight/controlButtonStyle.top/sideBarPrimaryMenuImgMargin.top/recommendCompGridSecHeight/
     *   controlButtonStyle.height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010025 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight)));
      expect(String(result.recommendCompGridHeight)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_SM.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_SM.controlButtonHeight)));
      expect(String(result.controlButtonStyle.height)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010025 end');
    });

    /**
     * @tc.name   testBstFieldVol010026
     * @tc.number SUB_MNB_BST_0748
     * @tc.desc   getBreakpointStyle('sm') window #25 covers
     *   mainTabsBcColor/sideBarPrimaryNavListHeight/mainTabsContentMargin.top/controlButtonStyle.top/
     *   sideBarPrimaryNavListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010026 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_SM.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_SM.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010026 end');
    });

    /**
     * @tc.name   testBstFieldVol010027
     * @tc.number SUB_MNB_BST_0749
     * @tc.desc   getBreakpointStyle('sm') window #26 covers
     *   controlButtonStyle.width/sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.right/
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010027 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010027 end');
    });

    /**
     * @tc.name   testBstFieldVol010028
     * @tc.number SUB_MNB_BST_0750
     * @tc.desc   getBreakpointStyle('sm') window #27 covers
     *   sideBarPrimaryNavListMargin/mainTabsContentMargin.top/recommendCompGridItemHeight/
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010028 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010028 end');
    });

    /**
     * @tc.name   testBstFieldVol010029
     * @tc.number SUB_MNB_BST_0751
     * @tc.desc   getBreakpointStyle('sm') window #28 covers
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right/controlButtonStyle.left/mainTabsContentMargin.top/
     *   recommendCompGridHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010029 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_SM.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight)));
      expect(String(result.recommendCompGridHeight)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010029 end');
    });

    /**
     * @tc.name   testBstFieldVol010030
     * @tc.number SUB_MNB_BST_0752
     * @tc.desc   getBreakpointStyle('sm') window #29 covers
     *   mainTabsContentMargin.bottom/recommendCompGridItemHeight/controlButtonStyle.height/mainTabsContentMargin.right/
     *   mainTabsBcColor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010030 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_SM.controlButtonHeight)));
      expect(String(result.controlButtonStyle.height)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_SM.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010030 end');
    });

    /**
     * @tc.name   testBstFieldVol010031
     * @tc.number SUB_MNB_BST_0753
     * @tc.desc   getBreakpointStyle('sm') window #30 covers
     *   recommendCompMargin.top/controlButtonStyle.left/sideBarPrimaryNavListItemWidth/recommendCompGridItemHeight/
     *   controlButtonStyle.width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010031 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop)));
      expect(String(result.recommendCompMargin.top)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_SM.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_SM.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010031 end');
    });

    /**
     * @tc.name   testBstFieldVol010032
     * @tc.number SUB_MNB_BST_0754
     * @tc.desc   getBreakpointStyle('sm') window #31 covers
     *   recommendCompGridSecHeight/controlButtonStyle.height/sideBarPrimaryMenuTextHeight/controlButtonStyle.left/
     *   sideBarPrimaryNavListMargin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010032 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_SM.controlButtonHeight)));
      expect(String(result.controlButtonStyle.height)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.left),
        String(String(BREAKPOINT_STYLE_SM.controlButtonLeft)));
      expect(String(result.controlButtonStyle.left)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010032 end');
    });

    /**
     * @tc.name   testBstFieldVol010033
     * @tc.number SUB_MNB_BST_0755
     * @tc.desc   getBreakpointStyle('sm') window #32 covers
     *   controlButtonStyle.top/sideBarPrimaryNavListItemWidth/mainTabsContentMargin.left/controlButtonStyle.height/
     *   sideBarPrimaryMenuTextSize
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010033 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_SM.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.height),
        String(String(BREAKPOINT_STYLE_SM.controlButtonHeight)));
      expect(String(result.controlButtonStyle.height)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010033 end');
    });

    /**
     * @tc.name   testBstFieldVol010034
     * @tc.number SUB_MNB_BST_0756
     * @tc.desc   getBreakpointStyle('sm') window #33 covers
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight/recommendCompGridHeight/
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010034 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight)));
      expect(String(result.recommendCompGridHeight)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListItemWidth),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth)));
      expect(
        String(result.sideBarPrimaryNavListItemWidth)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListItemWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.bottom), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom)));
      expect(
        String(result.mainTabsContentMargin.bottom)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginBottom));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010034 end');
    });

    /**
     * @tc.name   testBstFieldVol010035
     * @tc.number SUB_MNB_BST_0757
     * @tc.desc   getBreakpointStyle('sm') window #34 covers
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left/mainTabsBcColor/sideBarPrimaryMenuTextHeight/
     *   recommendCompMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010035 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuImgMargin.top),
        String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop)));
      expect(
        String(result.sideBarPrimaryMenuImgMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuImgMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_SM.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextHeight), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextHeight)));
      expect(
        String(result.sideBarPrimaryMenuTextHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompMargin.top),
        String(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop)));
      expect(String(result.recommendCompMargin.top)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010035 end');
    });

    /**
     * @tc.name   testBstFieldVol010036
     * @tc.number SUB_MNB_BST_0758
     * @tc.desc   getBreakpointStyle('sm') window #35 covers
     *   mainTabsContentMargin.top/recommendCompGridHeight/controlButtonStyle.width/mainTabsContentMargin.left/
     *   recommendCompGridSecHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010036 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsContentMargin.top),
        String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginTop)));
      expect(
        String(result.mainTabsContentMargin.top)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight)));
      expect(String(result.recommendCompGridHeight)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_SM.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.left), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft)));
      expect(
        String(result.mainTabsContentMargin.left)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginLeft));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridSecHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight)));
      expect(
        String(result.recommendCompGridSecHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridSecHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010036 end');
    });

    /**
     * @tc.name   testBstFieldVol010037
     * @tc.number SUB_MNB_BST_0759
     * @tc.desc   getBreakpointStyle('sm') window #36 covers
     *   mainTabsContentMargin.right/mainTabsBcColor/sideBarPrimaryNavListMargin/recommendCompGridHeight/
     *   controlButtonStyle.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010037 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.mainTabsContentMargin.right), String(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight)));
      expect(
        String(result.mainTabsContentMargin.right)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsContentMarginRight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_SM.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListMargin), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListMargin)));
      expect(
        String(result.sideBarPrimaryNavListMargin)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListMargin));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.recommendCompGridHeight),
        String(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight)));
      expect(String(result.recommendCompGridHeight)).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.top),
        String(String(BREAKPOINT_STYLE_SM.controlButtonTop)));
      expect(String(result.controlButtonStyle.top)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonTop));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010037 end');
    });

    /**
     * @tc.name   testBstFieldVol010038
     * @tc.number SUB_MNB_BST_0760
     * @tc.desc   getBreakpointStyle('sm') window #37 covers
     *   recommendCompGridItemHeight/controlButtonStyle.width/sideBarPrimaryMenuTextSize/mainTabsBcColor/
     *   sideBarPrimaryNavListHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010038 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.recommendCompGridItemHeight), String(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight)));
      expect(
        String(result.recommendCompGridItemHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.recommendCompGridItemHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.controlButtonStyle.width),
        String(String(BREAKPOINT_STYLE_SM.controlButtonWidth)));
      expect(String(result.controlButtonStyle.width)).assertEqual(String(BREAKPOINT_STYLE_SM.controlButtonWidth));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryMenuTextSize), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize)));
      expect(
        String(result.sideBarPrimaryMenuTextSize)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryMenuTextSize));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.mainTabsBcColor),
        String(String(BREAKPOINT_STYLE_SM.mainTabsBcColor)));
      expect(String(result.mainTabsBcColor)).assertEqual(String(BREAKPOINT_STYLE_SM.mainTabsBcColor));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result.sideBarPrimaryNavListHeight), String(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListHeight)));
      expect(
        String(result.sideBarPrimaryNavListHeight)
      ).assertEqual(String(BREAKPOINT_STYLE_SM.sideBarPrimaryNavListHeight));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol010038 end');
    });

  });
}
