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

// @volume rule=slot basis=main-frozen cases=37
// Volume cases, see section 4 of ohosTest.md for the generation rule. Hand-written anchor cases must be added
// to the same describe and marked with an @tc.desc starting with 'Anchor:'.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { StyleConfiguration } from '../../../main/ets/common/Configuration';
import { CustomBreakPointStyle } from '../../../main/ets/model/StyleType';
import { BREAKPOINT_STYLE_SM, BREAKPOINT_STYLE_DEFAULT } from '../util/NavSpec';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function bstFieldVol04BTest() {
  describe('MultiNavBarBstFieldVol04B', () => {

    /**
     * @tc.name   testBstFieldVol040039
     * @tc.number SUB_MNB_BST_0986
     * @tc.desc   getBreakpointStyle('md\t') window #38 covers
     *   controlButtonStyle.height/sideBarPrimaryMenuTextSize/recommendCompMargin.top/sideBarPrimaryNavListMargin/
     *   mainTabsContentMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040039 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md\t');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040039 end');
    });

    /**
     * @tc.name   testBstFieldVol040040
     * @tc.number SUB_MNB_BST_0987
     * @tc.desc   getBreakpointStyle('small') window #39 covers
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom/recommendCompGridSecHeight/
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040040 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('small');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040040 end');
    });

    /**
     * @tc.name   testBstFieldVol040041
     * @tc.number SUB_MNB_BST_0988
     * @tc.desc   getBreakpointStyle('medium') window #40 covers
     *   sideBarPrimaryMenuTextHeight/recommendCompMargin.top/controlButtonStyle.top/mainTabsContentMargin.bottom/
     *   recommendCompGridItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040041 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('medium');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040041 end');
    });

    /**
     * @tc.name   testBstFieldVol040042
     * @tc.number SUB_MNB_BST_0989
     * @tc.desc   getBreakpointStyle('large') window #41 covers
     *   mainTabsContentMargin.left/recommendCompGridSecHeight/sideBarPrimaryNavListHeight/recommendCompMargin.top/
     *   controlButtonStyle.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040042 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('large');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040042 end');
    });

    /**
     * @tc.name   testBstFieldVol040043
     * @tc.number SUB_MNB_BST_0990
     * @tc.desc   getBreakpointStyle('Sm') window #42 covers
     *   recommendCompGridHeight/controlButtonStyle.top/sideBarPrimaryMenuImgMargin.top/recommendCompGridSecHeight/
     *   controlButtonStyle.height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040043 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('Sm');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040043 end');
    });

    /**
     * @tc.name   testBstFieldVol040044
     * @tc.number SUB_MNB_BST_0991
     * @tc.desc   getBreakpointStyle('SMALL') window #43 covers
     *   mainTabsBcColor/sideBarPrimaryNavListHeight/mainTabsContentMargin.top/controlButtonStyle.top/
     *   sideBarPrimaryNavListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040044 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('SMALL');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040044 end');
    });

    /**
     * @tc.name   testBstFieldVol040045
     * @tc.number SUB_MNB_BST_0992
     * @tc.desc   getBreakpointStyle('sm\t') window #44 covers
     *   controlButtonStyle.width/sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.right/
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040045 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm\t');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040045 end');
    });

    /**
     * @tc.name   testBstFieldVol040046
     * @tc.number SUB_MNB_BST_0993
     * @tc.desc   getBreakpointStyle('\tsm') window #45 covers
     *   sideBarPrimaryNavListMargin/mainTabsContentMargin.top/recommendCompGridItemHeight/
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040046 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('\tsm');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040046 end');
    });

    /**
     * @tc.name   testBstFieldVol040047
     * @tc.number SUB_MNB_BST_0994
     * @tc.desc   getBreakpointStyle('tablet') window #46 covers
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right/controlButtonStyle.left/mainTabsContentMargin.top/
     *   recommendCompGridHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040047 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('tablet');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040047 end');
    });

    /**
     * @tc.name   testBstFieldVol040048
     * @tc.number SUB_MNB_BST_0995
     * @tc.desc   getBreakpointStyle('phone') window #47 covers
     *   mainTabsContentMargin.bottom/recommendCompGridItemHeight/controlButtonStyle.height/mainTabsContentMargin.right/
     *   mainTabsBcColor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040048 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('phone');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040048 end');
    });

    /**
     * @tc.name   testBstFieldVol040049
     * @tc.number SUB_MNB_BST_0996
     * @tc.desc   getBreakpointStyle('watch') window #48 covers
     *   recommendCompMargin.top/controlButtonStyle.left/sideBarPrimaryNavListItemWidth/recommendCompGridItemHeight/
     *   controlButtonStyle.width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040049 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('watch');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040049 end');
    });

    /**
     * @tc.name   testBstFieldVol040050
     * @tc.number SUB_MNB_BST_0997
     * @tc.desc   getBreakpointStyle('tv') window #49 covers
     *   recommendCompGridSecHeight/controlButtonStyle.height/sideBarPrimaryMenuTextHeight/controlButtonStyle.left/
     *   sideBarPrimaryNavListMargin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040050 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('tv');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040050 end');
    });

    /**
     * @tc.name   testBstFieldVol040051
     * @tc.number SUB_MNB_BST_0998
     * @tc.desc   getBreakpointStyle('sm') window #50 covers
     *   controlButtonStyle.top/sideBarPrimaryNavListItemWidth/mainTabsContentMargin.left/controlButtonStyle.height/
     *   sideBarPrimaryMenuTextSize
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040051 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040051 end');
    });

    /**
     * @tc.name   testBstFieldVol040052
     * @tc.number SUB_MNB_BST_0999
     * @tc.desc   getBreakpointStyle('') window #51 covers
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight/recommendCompGridHeight/
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040052 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040052 end');
    });

    /**
     * @tc.name   testBstFieldVol040053
     * @tc.number SUB_MNB_BST_1000
     * @tc.desc   getBreakpointStyle('SM') window #52 covers
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left/mainTabsBcColor/sideBarPrimaryMenuTextHeight/
     *   recommendCompMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040053 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('SM');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040053 end');
    });

    /**
     * @tc.name   testBstFieldVol040054
     * @tc.number SUB_MNB_BST_1001
     * @tc.desc   getBreakpointStyle('Md') window #53 covers
     *   mainTabsContentMargin.top/recommendCompGridHeight/controlButtonStyle.width/mainTabsContentMargin.left/
     *   recommendCompGridSecHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040054 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('Md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040054 end');
    });

    /**
     * @tc.name   testBstFieldVol040055
     * @tc.number SUB_MNB_BST_1002
     * @tc.desc   getBreakpointStyle(' sm') window #54 covers
     *   mainTabsContentMargin.right/mainTabsBcColor/sideBarPrimaryNavListMargin/recommendCompGridHeight/
     *   controlButtonStyle.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040055 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle(' sm');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040055 end');
    });

    /**
     * @tc.name   testBstFieldVol040056
     * @tc.number SUB_MNB_BST_1003
     * @tc.desc   getBreakpointStyle('lg ') window #55 covers
     *   recommendCompGridItemHeight/controlButtonStyle.width/sideBarPrimaryMenuTextSize/mainTabsBcColor/
     *   sideBarPrimaryNavListHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040056 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('lg ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040056 end');
    });

    /**
     * @tc.name   testBstFieldVol040057
     * @tc.number SUB_MNB_BST_1004
     * @tc.desc   getBreakpointStyle('xs') window #56 covers
     *   controlButtonStyle.left/sideBarPrimaryNavListMargin/mainTabsContentMargin.bottom/controlButtonStyle.width/
     *   sideBarPrimaryMenuImgMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040057 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xs');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040057 end');
    });

    /**
     * @tc.name   testBstFieldVol040058
     * @tc.number SUB_MNB_BST_1005
     * @tc.desc   getBreakpointStyle('xl') window #57 covers
     *   controlButtonStyle.height/sideBarPrimaryMenuTextSize/recommendCompMargin.top/sideBarPrimaryNavListMargin/
     *   mainTabsContentMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040058 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('xl');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040058 end');
    });

    /**
     * @tc.name   testBstFieldVol040059
     * @tc.number SUB_MNB_BST_1006
     * @tc.desc   getBreakpointStyle('0') window #58 covers
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom/recommendCompGridSecHeight/
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040059 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('0');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040059 end');
    });

    /**
     * @tc.name   testBstFieldVol040060
     * @tc.number SUB_MNB_BST_1007
     * @tc.desc   getBreakpointStyle('s') window #59 covers
     *   sideBarPrimaryMenuTextHeight/recommendCompMargin.top/controlButtonStyle.top/mainTabsContentMargin.bottom/
     *   recommendCompGridItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040060 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('s');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040060 end');
    });

    /**
     * @tc.name   testBstFieldVol040061
     * @tc.number SUB_MNB_BST_1008
     * @tc.desc   getBreakpointStyle('smlg') window #60 covers
     *   mainTabsContentMargin.left/recommendCompGridSecHeight/sideBarPrimaryNavListHeight/recommendCompMargin.top/
     *   controlButtonStyle.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040061 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040061 end');
    });

    /**
     * @tc.name   testBstFieldVol040062
     * @tc.number SUB_MNB_BST_1009
     * @tc.desc   getBreakpointStyle('tab') window #61 covers
     *   recommendCompGridHeight/controlButtonStyle.top/sideBarPrimaryMenuImgMargin.top/recommendCompGridSecHeight/
     *   controlButtonStyle.height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040062 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('tab');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040062 end');
    });

    /**
     * @tc.name   testBstFieldVol040063
     * @tc.number SUB_MNB_BST_1010
     * @tc.desc   getBreakpointStyle('sm sm') window #62 covers
     *   mainTabsBcColor/sideBarPrimaryNavListHeight/mainTabsContentMargin.top/controlButtonStyle.top/
     *   sideBarPrimaryNavListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040063 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm sm');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040063 end');
    });

    /**
     * @tc.name   testBstFieldVol040064
     * @tc.number SUB_MNB_BST_1011
     * @tc.desc   getBreakpointStyle('md\t') window #63 covers
     *   controlButtonStyle.width/sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.right/
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040064 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md\t');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040064 end');
    });

    /**
     * @tc.name   testBstFieldVol040065
     * @tc.number SUB_MNB_BST_1012
     * @tc.desc   getBreakpointStyle('small') window #64 covers
     *   sideBarPrimaryNavListMargin/mainTabsContentMargin.top/recommendCompGridItemHeight/
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040065 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('small');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040065 end');
    });

    /**
     * @tc.name   testBstFieldVol040066
     * @tc.number SUB_MNB_BST_1013
     * @tc.desc   getBreakpointStyle('medium') window #65 covers
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right/controlButtonStyle.left/mainTabsContentMargin.top/
     *   recommendCompGridHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040066 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('medium');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040066 end');
    });

    /**
     * @tc.name   testBstFieldVol040067
     * @tc.number SUB_MNB_BST_1014
     * @tc.desc   getBreakpointStyle('large') window #66 covers
     *   mainTabsContentMargin.bottom/recommendCompGridItemHeight/controlButtonStyle.height/mainTabsContentMargin.right/
     *   mainTabsBcColor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040067 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('large');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040067 end');
    });

    /**
     * @tc.name   testBstFieldVol040068
     * @tc.number SUB_MNB_BST_1015
     * @tc.desc   getBreakpointStyle('Sm') window #67 covers
     *   recommendCompMargin.top/controlButtonStyle.left/sideBarPrimaryNavListItemWidth/recommendCompGridItemHeight/
     *   controlButtonStyle.width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040068 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('Sm');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040068 end');
    });

    /**
     * @tc.name   testBstFieldVol040069
     * @tc.number SUB_MNB_BST_1016
     * @tc.desc   getBreakpointStyle('SMALL') window #68 covers
     *   recommendCompGridSecHeight/controlButtonStyle.height/sideBarPrimaryMenuTextHeight/controlButtonStyle.left/
     *   sideBarPrimaryNavListMargin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040069 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('SMALL');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040069 end');
    });

    /**
     * @tc.name   testBstFieldVol040070
     * @tc.number SUB_MNB_BST_1017
     * @tc.desc   getBreakpointStyle('sm\t') window #69 covers
     *   controlButtonStyle.top/sideBarPrimaryNavListItemWidth/mainTabsContentMargin.left/controlButtonStyle.height/
     *   sideBarPrimaryMenuTextSize
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040070 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('sm\t');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040070 end');
    });

    /**
     * @tc.name   testBstFieldVol040071
     * @tc.number SUB_MNB_BST_1018
     * @tc.desc   getBreakpointStyle('\tsm') window #70 covers
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight/recommendCompGridHeight/
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040071 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('\tsm');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040071 end');
    });

    /**
     * @tc.name   testBstFieldVol040072
     * @tc.number SUB_MNB_BST_1019
     * @tc.desc   getBreakpointStyle('tablet') window #71 covers
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left/mainTabsBcColor/sideBarPrimaryMenuTextHeight/
     *   recommendCompMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040072 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('tablet');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040072 end');
    });

    /**
     * @tc.name   testBstFieldVol040073
     * @tc.number SUB_MNB_BST_1020
     * @tc.desc   getBreakpointStyle('phone') window #72 covers
     *   mainTabsContentMargin.top/recommendCompGridHeight/controlButtonStyle.width/mainTabsContentMargin.left/
     *   recommendCompGridSecHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040073 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('phone');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040073 end');
    });

    /**
     * @tc.name   testBstFieldVol040074
     * @tc.number SUB_MNB_BST_1021
     * @tc.desc   getBreakpointStyle('watch') window #73 covers
     *   mainTabsContentMargin.right/mainTabsBcColor/sideBarPrimaryNavListMargin/recommendCompGridHeight/
     *   controlButtonStyle.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040074 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('watch');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040074 end');
    });

    /**
     * @tc.name   testBstFieldVol040075
     * @tc.number SUB_MNB_BST_1022
     * @tc.desc   Anchor: a fullwidth 'ｓｍ' is not the compact breakpoint
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol040075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040075 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('ｓｍ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'height=[%{public}s] size=%{public}s', style.sideBarPrimaryNavListHeight,
        String(style.sideBarPrimaryMenuTextSize));
      expect(style.sideBarPrimaryNavListHeight).assertEqual('');
      expect(style.sideBarPrimaryMenuTextSize).assertEqual(12);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.sideBarPrimaryMenuTextSize === 10');
      expect(style.sideBarPrimaryMenuTextSize === 10).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol040075 end');
    });
  });
}
