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
import { BREAKPOINT_STYLE_DEFAULT } from '../util/NavSpec';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function bstFieldVol03Test() {
  describe('MultiNavBarBstFieldVol03', () => {

    /**
     * @tc.name   testBstFieldVol030001
     * @tc.number SUB_MNB_BST_0873
     * @tc.desc   getBreakpointStyle('lg') window #0 covers
     *   mainTabsContentMargin.left/recommendCompGridSecHeight/sideBarPrimaryNavListHeight/recommendCompMargin.top/
     *   controlButtonStyle.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030001 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030001 end');
    });

    /**
     * @tc.name   testBstFieldVol030002
     * @tc.number SUB_MNB_BST_0874
     * @tc.desc   getBreakpointStyle('lg') window #1 covers
     *   recommendCompGridHeight/controlButtonStyle.top/sideBarPrimaryMenuImgMargin.top/recommendCompGridSecHeight/
     *   controlButtonStyle.height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030002 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030002 end');
    });

    /**
     * @tc.name   testBstFieldVol030003
     * @tc.number SUB_MNB_BST_0875
     * @tc.desc   getBreakpointStyle('lg') window #2 covers
     *   mainTabsBcColor/sideBarPrimaryNavListHeight/mainTabsContentMargin.top/controlButtonStyle.top/
     *   sideBarPrimaryNavListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030003 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030003 end');
    });

    /**
     * @tc.name   testBstFieldVol030004
     * @tc.number SUB_MNB_BST_0876
     * @tc.desc   getBreakpointStyle('lg') window #3 covers
     *   controlButtonStyle.width/sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.right/
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030004 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030004 end');
    });

    /**
     * @tc.name   testBstFieldVol030005
     * @tc.number SUB_MNB_BST_0877
     * @tc.desc   getBreakpointStyle('lg') window #4 covers
     *   sideBarPrimaryNavListMargin/mainTabsContentMargin.top/recommendCompGridItemHeight/
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030005 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030005 end');
    });

    /**
     * @tc.name   testBstFieldVol030006
     * @tc.number SUB_MNB_BST_0878
     * @tc.desc   getBreakpointStyle('lg') window #5 covers
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right/controlButtonStyle.left/mainTabsContentMargin.top/
     *   recommendCompGridHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030006 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030006 end');
    });

    /**
     * @tc.name   testBstFieldVol030007
     * @tc.number SUB_MNB_BST_0879
     * @tc.desc   getBreakpointStyle('lg') window #6 covers
     *   mainTabsContentMargin.bottom/recommendCompGridItemHeight/controlButtonStyle.height/mainTabsContentMargin.right/
     *   mainTabsBcColor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030007 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030007 end');
    });

    /**
     * @tc.name   testBstFieldVol030008
     * @tc.number SUB_MNB_BST_0880
     * @tc.desc   getBreakpointStyle('lg') window #7 covers
     *   recommendCompMargin.top/controlButtonStyle.left/sideBarPrimaryNavListItemWidth/recommendCompGridItemHeight/
     *   controlButtonStyle.width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030008 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030008 end');
    });

    /**
     * @tc.name   testBstFieldVol030009
     * @tc.number SUB_MNB_BST_0881
     * @tc.desc   getBreakpointStyle('lg') window #8 covers
     *   recommendCompGridSecHeight/controlButtonStyle.height/sideBarPrimaryMenuTextHeight/controlButtonStyle.left/
     *   sideBarPrimaryNavListMargin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030009 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030009 end');
    });

    /**
     * @tc.name   testBstFieldVol030010
     * @tc.number SUB_MNB_BST_0882
     * @tc.desc   getBreakpointStyle('lg') window #9 covers
     *   controlButtonStyle.top/sideBarPrimaryNavListItemWidth/mainTabsContentMargin.left/controlButtonStyle.height/
     *   sideBarPrimaryMenuTextSize
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030010 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030010 end');
    });

    /**
     * @tc.name   testBstFieldVol030011
     * @tc.number SUB_MNB_BST_0883
     * @tc.desc   getBreakpointStyle('lg') window #10 covers
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight/recommendCompGridHeight/
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030011 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030011 end');
    });

    /**
     * @tc.name   testBstFieldVol030012
     * @tc.number SUB_MNB_BST_0884
     * @tc.desc   getBreakpointStyle('lg') window #11 covers
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left/mainTabsBcColor/sideBarPrimaryMenuTextHeight/
     *   recommendCompMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030012 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030012 end');
    });

    /**
     * @tc.name   testBstFieldVol030013
     * @tc.number SUB_MNB_BST_0885
     * @tc.desc   getBreakpointStyle('lg') window #12 covers
     *   mainTabsContentMargin.top/recommendCompGridHeight/controlButtonStyle.width/mainTabsContentMargin.left/
     *   recommendCompGridSecHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030013 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030013 end');
    });

    /**
     * @tc.name   testBstFieldVol030014
     * @tc.number SUB_MNB_BST_0886
     * @tc.desc   getBreakpointStyle('lg') window #13 covers
     *   mainTabsContentMargin.right/mainTabsBcColor/sideBarPrimaryNavListMargin/recommendCompGridHeight/
     *   controlButtonStyle.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030014 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030014 end');
    });

    /**
     * @tc.name   testBstFieldVol030015
     * @tc.number SUB_MNB_BST_0887
     * @tc.desc   getBreakpointStyle('lg') window #14 covers
     *   recommendCompGridItemHeight/controlButtonStyle.width/sideBarPrimaryMenuTextSize/mainTabsBcColor/
     *   sideBarPrimaryNavListHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030015 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030015 end');
    });

    /**
     * @tc.name   testBstFieldVol030016
     * @tc.number SUB_MNB_BST_0888
     * @tc.desc   getBreakpointStyle('lg') window #15 covers
     *   controlButtonStyle.left/sideBarPrimaryNavListMargin/mainTabsContentMargin.bottom/controlButtonStyle.width/
     *   sideBarPrimaryMenuImgMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030016 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030016 end');
    });

    /**
     * @tc.name   testBstFieldVol030017
     * @tc.number SUB_MNB_BST_0889
     * @tc.desc   getBreakpointStyle('lg') window #16 covers
     *   controlButtonStyle.height/sideBarPrimaryMenuTextSize/recommendCompMargin.top/sideBarPrimaryNavListMargin/
     *   mainTabsContentMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030017 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030017 end');
    });

    /**
     * @tc.name   testBstFieldVol030018
     * @tc.number SUB_MNB_BST_0890
     * @tc.desc   getBreakpointStyle('lg') window #17 covers
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom/recommendCompGridSecHeight/
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030018 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030018 end');
    });

    /**
     * @tc.name   testBstFieldVol030019
     * @tc.number SUB_MNB_BST_0891
     * @tc.desc   getBreakpointStyle('lg') window #18 covers
     *   sideBarPrimaryMenuTextHeight/recommendCompMargin.top/controlButtonStyle.top/mainTabsContentMargin.bottom/
     *   recommendCompGridItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030019 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030019 end');
    });

    /**
     * @tc.name   testBstFieldVol030020
     * @tc.number SUB_MNB_BST_0892
     * @tc.desc   getBreakpointStyle('lg') window #19 covers
     *   mainTabsContentMargin.left/recommendCompGridSecHeight/sideBarPrimaryNavListHeight/recommendCompMargin.top/
     *   controlButtonStyle.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030020 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030020 end');
    });

    /**
     * @tc.name   testBstFieldVol030021
     * @tc.number SUB_MNB_BST_0893
     * @tc.desc   getBreakpointStyle('lg') window #20 covers
     *   recommendCompGridHeight/controlButtonStyle.top/sideBarPrimaryMenuImgMargin.top/recommendCompGridSecHeight/
     *   controlButtonStyle.height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030021 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030021 end');
    });

    /**
     * @tc.name   testBstFieldVol030022
     * @tc.number SUB_MNB_BST_0894
     * @tc.desc   getBreakpointStyle('lg') window #21 covers
     *   mainTabsBcColor/sideBarPrimaryNavListHeight/mainTabsContentMargin.top/controlButtonStyle.top/
     *   sideBarPrimaryNavListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030022 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030022 end');
    });

    /**
     * @tc.name   testBstFieldVol030023
     * @tc.number SUB_MNB_BST_0895
     * @tc.desc   getBreakpointStyle('lg') window #22 covers
     *   controlButtonStyle.width/sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.right/
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030023 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030023 end');
    });

    /**
     * @tc.name   testBstFieldVol030024
     * @tc.number SUB_MNB_BST_0896
     * @tc.desc   getBreakpointStyle('lg') window #23 covers
     *   sideBarPrimaryNavListMargin/mainTabsContentMargin.top/recommendCompGridItemHeight/
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030024 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030024 end');
    });

    /**
     * @tc.name   testBstFieldVol030025
     * @tc.number SUB_MNB_BST_0897
     * @tc.desc   getBreakpointStyle('lg') window #24 covers
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right/controlButtonStyle.left/mainTabsContentMargin.top/
     *   recommendCompGridHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030025 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030025 end');
    });

    /**
     * @tc.name   testBstFieldVol030026
     * @tc.number SUB_MNB_BST_0898
     * @tc.desc   getBreakpointStyle('lg') window #25 covers
     *   mainTabsContentMargin.bottom/recommendCompGridItemHeight/controlButtonStyle.height/mainTabsContentMargin.right/
     *   mainTabsBcColor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030026 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030026 end');
    });

    /**
     * @tc.name   testBstFieldVol030027
     * @tc.number SUB_MNB_BST_0899
     * @tc.desc   getBreakpointStyle('lg') window #26 covers
     *   recommendCompMargin.top/controlButtonStyle.left/sideBarPrimaryNavListItemWidth/recommendCompGridItemHeight/
     *   controlButtonStyle.width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030027 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030027 end');
    });

    /**
     * @tc.name   testBstFieldVol030028
     * @tc.number SUB_MNB_BST_0900
     * @tc.desc   getBreakpointStyle('lg') window #27 covers
     *   recommendCompGridSecHeight/controlButtonStyle.height/sideBarPrimaryMenuTextHeight/controlButtonStyle.left/
     *   sideBarPrimaryNavListMargin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030028 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030028 end');
    });

    /**
     * @tc.name   testBstFieldVol030029
     * @tc.number SUB_MNB_BST_0901
     * @tc.desc   getBreakpointStyle('lg') window #28 covers
     *   controlButtonStyle.top/sideBarPrimaryNavListItemWidth/mainTabsContentMargin.left/controlButtonStyle.height/
     *   sideBarPrimaryMenuTextSize
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030029 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030029 end');
    });

    /**
     * @tc.name   testBstFieldVol030030
     * @tc.number SUB_MNB_BST_0902
     * @tc.desc   getBreakpointStyle('lg') window #29 covers
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight/recommendCompGridHeight/
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030030 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030030 end');
    });

    /**
     * @tc.name   testBstFieldVol030031
     * @tc.number SUB_MNB_BST_0903
     * @tc.desc   getBreakpointStyle('lg') window #30 covers
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left/mainTabsBcColor/sideBarPrimaryMenuTextHeight/
     *   recommendCompMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030031 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030031 end');
    });

    /**
     * @tc.name   testBstFieldVol030032
     * @tc.number SUB_MNB_BST_0904
     * @tc.desc   getBreakpointStyle('lg') window #31 covers
     *   mainTabsContentMargin.top/recommendCompGridHeight/controlButtonStyle.width/mainTabsContentMargin.left/
     *   recommendCompGridSecHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030032 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030032 end');
    });

    /**
     * @tc.name   testBstFieldVol030033
     * @tc.number SUB_MNB_BST_0905
     * @tc.desc   getBreakpointStyle('lg') window #32 covers
     *   mainTabsContentMargin.right/mainTabsBcColor/sideBarPrimaryNavListMargin/recommendCompGridHeight/
     *   controlButtonStyle.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030033 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030033 end');
    });

    /**
     * @tc.name   testBstFieldVol030034
     * @tc.number SUB_MNB_BST_0906
     * @tc.desc   getBreakpointStyle('lg') window #33 covers
     *   recommendCompGridItemHeight/controlButtonStyle.width/sideBarPrimaryMenuTextSize/mainTabsBcColor/
     *   sideBarPrimaryNavListHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030034 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030034 end');
    });

    /**
     * @tc.name   testBstFieldVol030035
     * @tc.number SUB_MNB_BST_0907
     * @tc.desc   getBreakpointStyle('lg') window #34 covers
     *   controlButtonStyle.left/sideBarPrimaryNavListMargin/mainTabsContentMargin.bottom/controlButtonStyle.width/
     *   sideBarPrimaryMenuImgMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030035 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030035 end');
    });

    /**
     * @tc.name   testBstFieldVol030036
     * @tc.number SUB_MNB_BST_0908
     * @tc.desc   getBreakpointStyle('lg') window #35 covers
     *   controlButtonStyle.height/sideBarPrimaryMenuTextSize/recommendCompMargin.top/sideBarPrimaryNavListMargin/
     *   mainTabsContentMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030036 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030036 end');
    });

    /**
     * @tc.name   testBstFieldVol030037
     * @tc.number SUB_MNB_BST_0909
     * @tc.desc   getBreakpointStyle('lg') window #36 covers
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom/recommendCompGridSecHeight/
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030037 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030037 end');
    });

    /**
     * @tc.name   testBstFieldVol030038
     * @tc.number SUB_MNB_BST_0910
     * @tc.desc   getBreakpointStyle('lg') window #37 covers
     *   sideBarPrimaryMenuTextHeight/recommendCompMargin.top/controlButtonStyle.top/mainTabsContentMargin.bottom/
     *   recommendCompGridItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol030038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030038 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol030038 end');
    });

  });
}
