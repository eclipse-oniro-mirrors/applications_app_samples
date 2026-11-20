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
import { CustomBreakPointStyle } from '../../../main/ets/model/StyleType';
import { BREAKPOINT_STYLE_DEFAULT } from '../util/NavSpec';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function bstFieldVol02BTest() {
  describe('MultiNavBarBstFieldVol02B', () => {

    /**
     * @tc.name   testBstFieldVol020039
     * @tc.number SUB_MNB_BST_0836
     * @tc.desc   getBreakpointStyle('md') window #38 covers
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom/recommendCompGridSecHeight/
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020039 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020039 end');
    });

    /**
     * @tc.name   testBstFieldVol020040
     * @tc.number SUB_MNB_BST_0837
     * @tc.desc   getBreakpointStyle('md') window #39 covers
     *   sideBarPrimaryMenuTextHeight/recommendCompMargin.top/controlButtonStyle.top/mainTabsContentMargin.bottom/
     *   recommendCompGridItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020040 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020040 end');
    });

    /**
     * @tc.name   testBstFieldVol020041
     * @tc.number SUB_MNB_BST_0838
     * @tc.desc   getBreakpointStyle('md') window #40 covers
     *   mainTabsContentMargin.left/recommendCompGridSecHeight/sideBarPrimaryNavListHeight/recommendCompMargin.top/
     *   controlButtonStyle.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020041 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020041 end');
    });

    /**
     * @tc.name   testBstFieldVol020042
     * @tc.number SUB_MNB_BST_0839
     * @tc.desc   getBreakpointStyle('md') window #41 covers
     *   recommendCompGridHeight/controlButtonStyle.top/sideBarPrimaryMenuImgMargin.top/recommendCompGridSecHeight/
     *   controlButtonStyle.height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020042 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020042 end');
    });

    /**
     * @tc.name   testBstFieldVol020043
     * @tc.number SUB_MNB_BST_0840
     * @tc.desc   getBreakpointStyle('md') window #42 covers
     *   mainTabsBcColor/sideBarPrimaryNavListHeight/mainTabsContentMargin.top/controlButtonStyle.top/
     *   sideBarPrimaryNavListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020043 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020043 end');
    });

    /**
     * @tc.name   testBstFieldVol020044
     * @tc.number SUB_MNB_BST_0841
     * @tc.desc   getBreakpointStyle('md') window #43 covers
     *   controlButtonStyle.width/sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.right/
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020044 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020044 end');
    });

    /**
     * @tc.name   testBstFieldVol020045
     * @tc.number SUB_MNB_BST_0842
     * @tc.desc   getBreakpointStyle('md') window #44 covers
     *   sideBarPrimaryNavListMargin/mainTabsContentMargin.top/recommendCompGridItemHeight/
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020045 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020045 end');
    });

    /**
     * @tc.name   testBstFieldVol020046
     * @tc.number SUB_MNB_BST_0843
     * @tc.desc   getBreakpointStyle('md') window #45 covers
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right/controlButtonStyle.left/mainTabsContentMargin.top/
     *   recommendCompGridHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020046 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020046 end');
    });

    /**
     * @tc.name   testBstFieldVol020047
     * @tc.number SUB_MNB_BST_0844
     * @tc.desc   getBreakpointStyle('md') window #46 covers
     *   mainTabsContentMargin.bottom/recommendCompGridItemHeight/controlButtonStyle.height/mainTabsContentMargin.right/
     *   mainTabsBcColor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020047 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020047 end');
    });

    /**
     * @tc.name   testBstFieldVol020048
     * @tc.number SUB_MNB_BST_0845
     * @tc.desc   getBreakpointStyle('md') window #47 covers
     *   recommendCompMargin.top/controlButtonStyle.left/sideBarPrimaryNavListItemWidth/recommendCompGridItemHeight/
     *   controlButtonStyle.width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020048 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020048 end');
    });

    /**
     * @tc.name   testBstFieldVol020049
     * @tc.number SUB_MNB_BST_0846
     * @tc.desc   getBreakpointStyle('md') window #48 covers
     *   recommendCompGridSecHeight/controlButtonStyle.height/sideBarPrimaryMenuTextHeight/controlButtonStyle.left/
     *   sideBarPrimaryNavListMargin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020049 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020049 end');
    });

    /**
     * @tc.name   testBstFieldVol020050
     * @tc.number SUB_MNB_BST_0847
     * @tc.desc   getBreakpointStyle('md') window #49 covers
     *   controlButtonStyle.top/sideBarPrimaryNavListItemWidth/mainTabsContentMargin.left/controlButtonStyle.height/
     *   sideBarPrimaryMenuTextSize
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020050 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020050 end');
    });

    /**
     * @tc.name   testBstFieldVol020051
     * @tc.number SUB_MNB_BST_0848
     * @tc.desc   getBreakpointStyle('md') window #50 covers
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight/recommendCompGridHeight/
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020051 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020051 end');
    });

    /**
     * @tc.name   testBstFieldVol020052
     * @tc.number SUB_MNB_BST_0849
     * @tc.desc   getBreakpointStyle('md') window #51 covers
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left/mainTabsBcColor/sideBarPrimaryMenuTextHeight/
     *   recommendCompMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020052 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020052 end');
    });

    /**
     * @tc.name   testBstFieldVol020053
     * @tc.number SUB_MNB_BST_0850
     * @tc.desc   getBreakpointStyle('md') window #52 covers
     *   mainTabsContentMargin.top/recommendCompGridHeight/controlButtonStyle.width/mainTabsContentMargin.left/
     *   recommendCompGridSecHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020053 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020053 end');
    });

    /**
     * @tc.name   testBstFieldVol020054
     * @tc.number SUB_MNB_BST_0851
     * @tc.desc   getBreakpointStyle('md') window #53 covers
     *   mainTabsContentMargin.right/mainTabsBcColor/sideBarPrimaryNavListMargin/recommendCompGridHeight/
     *   controlButtonStyle.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020054 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020054 end');
    });

    /**
     * @tc.name   testBstFieldVol020055
     * @tc.number SUB_MNB_BST_0852
     * @tc.desc   getBreakpointStyle('md') window #54 covers
     *   recommendCompGridItemHeight/controlButtonStyle.width/sideBarPrimaryMenuTextSize/mainTabsBcColor/
     *   sideBarPrimaryNavListHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020055 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020055 end');
    });

    /**
     * @tc.name   testBstFieldVol020056
     * @tc.number SUB_MNB_BST_0853
     * @tc.desc   getBreakpointStyle('md') window #55 covers
     *   controlButtonStyle.left/sideBarPrimaryNavListMargin/mainTabsContentMargin.bottom/controlButtonStyle.width/
     *   sideBarPrimaryMenuImgMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020056 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020056 end');
    });

    /**
     * @tc.name   testBstFieldVol020057
     * @tc.number SUB_MNB_BST_0854
     * @tc.desc   getBreakpointStyle('md') window #56 covers
     *   controlButtonStyle.height/sideBarPrimaryMenuTextSize/recommendCompMargin.top/sideBarPrimaryNavListMargin/
     *   mainTabsContentMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020057 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020057 end');
    });

    /**
     * @tc.name   testBstFieldVol020058
     * @tc.number SUB_MNB_BST_0855
     * @tc.desc   getBreakpointStyle('md') window #57 covers
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom/recommendCompGridSecHeight/
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020058 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020058 end');
    });

    /**
     * @tc.name   testBstFieldVol020059
     * @tc.number SUB_MNB_BST_0856
     * @tc.desc   getBreakpointStyle('md') window #58 covers
     *   sideBarPrimaryMenuTextHeight/recommendCompMargin.top/controlButtonStyle.top/mainTabsContentMargin.bottom/
     *   recommendCompGridItemHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020059 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020059 end');
    });

    /**
     * @tc.name   testBstFieldVol020060
     * @tc.number SUB_MNB_BST_0857
     * @tc.desc   getBreakpointStyle('md') window #59 covers
     *   mainTabsContentMargin.left/recommendCompGridSecHeight/sideBarPrimaryNavListHeight/recommendCompMargin.top/
     *   controlButtonStyle.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020060 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020060 end');
    });

    /**
     * @tc.name   testBstFieldVol020061
     * @tc.number SUB_MNB_BST_0858
     * @tc.desc   getBreakpointStyle('md') window #60 covers
     *   recommendCompGridHeight/controlButtonStyle.top/sideBarPrimaryMenuImgMargin.top/recommendCompGridSecHeight/
     *   controlButtonStyle.height
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020061 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020061 end');
    });

    /**
     * @tc.name   testBstFieldVol020062
     * @tc.number SUB_MNB_BST_0859
     * @tc.desc   getBreakpointStyle('md') window #61 covers
     *   mainTabsBcColor/sideBarPrimaryNavListHeight/mainTabsContentMargin.top/controlButtonStyle.top/
     *   sideBarPrimaryNavListItemWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020062 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020062 end');
    });

    /**
     * @tc.name   testBstFieldVol020063
     * @tc.number SUB_MNB_BST_0860
     * @tc.desc   getBreakpointStyle('md') window #62 covers
     *   controlButtonStyle.width/sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.right/
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020063 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020063 end');
    });

    /**
     * @tc.name   testBstFieldVol020064
     * @tc.number SUB_MNB_BST_0861
     * @tc.desc   getBreakpointStyle('md') window #63 covers
     *   sideBarPrimaryNavListMargin/mainTabsContentMargin.top/recommendCompGridItemHeight/
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020064 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020064 end');
    });

    /**
     * @tc.name   testBstFieldVol020065
     * @tc.number SUB_MNB_BST_0862
     * @tc.desc   getBreakpointStyle('md') window #64 covers
     *   sideBarPrimaryMenuTextSize/mainTabsContentMargin.right/controlButtonStyle.left/mainTabsContentMargin.top/
     *   recommendCompGridHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020065 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020065 end');
    });

    /**
     * @tc.name   testBstFieldVol020066
     * @tc.number SUB_MNB_BST_0863
     * @tc.desc   getBreakpointStyle('md') window #65 covers
     *   mainTabsContentMargin.bottom/recommendCompGridItemHeight/controlButtonStyle.height/mainTabsContentMargin.right/
     *   mainTabsBcColor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020066 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020066 end');
    });

    /**
     * @tc.name   testBstFieldVol020067
     * @tc.number SUB_MNB_BST_0864
     * @tc.desc   getBreakpointStyle('md') window #66 covers
     *   recommendCompMargin.top/controlButtonStyle.left/sideBarPrimaryNavListItemWidth/recommendCompGridItemHeight/
     *   controlButtonStyle.width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020067 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020067 end');
    });

    /**
     * @tc.name   testBstFieldVol020068
     * @tc.number SUB_MNB_BST_0865
     * @tc.desc   getBreakpointStyle('md') window #67 covers
     *   recommendCompGridSecHeight/controlButtonStyle.height/sideBarPrimaryMenuTextHeight/controlButtonStyle.left/
     *   sideBarPrimaryNavListMargin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020068 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020068 end');
    });

    /**
     * @tc.name   testBstFieldVol020069
     * @tc.number SUB_MNB_BST_0866
     * @tc.desc   getBreakpointStyle('md') window #68 covers
     *   controlButtonStyle.top/sideBarPrimaryNavListItemWidth/mainTabsContentMargin.left/controlButtonStyle.height/
     *   sideBarPrimaryMenuTextSize
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020069 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020069 end');
    });

    /**
     * @tc.name   testBstFieldVol020070
     * @tc.number SUB_MNB_BST_0867
     * @tc.desc   getBreakpointStyle('md') window #69 covers
     *   sideBarPrimaryNavListHeight/sideBarPrimaryMenuTextHeight/recommendCompGridHeight/
     *   sideBarPrimaryNavListItemWidth/mainTabsContentMargin.bottom
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020070 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020070 end');
    });

    /**
     * @tc.name   testBstFieldVol020071
     * @tc.number SUB_MNB_BST_0868
     * @tc.desc   getBreakpointStyle('md') window #70 covers
     *   sideBarPrimaryMenuImgMargin.top/mainTabsContentMargin.left/mainTabsBcColor/sideBarPrimaryMenuTextHeight/
     *   recommendCompMargin.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020071 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020071 end');
    });

    /**
     * @tc.name   testBstFieldVol020072
     * @tc.number SUB_MNB_BST_0869
     * @tc.desc   getBreakpointStyle('md') window #71 covers
     *   mainTabsContentMargin.top/recommendCompGridHeight/controlButtonStyle.width/mainTabsContentMargin.left/
     *   recommendCompGridSecHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020072 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020072 end');
    });

    /**
     * @tc.name   testBstFieldVol020073
     * @tc.number SUB_MNB_BST_0870
     * @tc.desc   getBreakpointStyle('md') window #72 covers
     *   mainTabsContentMargin.right/mainTabsBcColor/sideBarPrimaryNavListMargin/recommendCompGridHeight/
     *   controlButtonStyle.top
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020073 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020073 end');
    });

    /**
     * @tc.name   testBstFieldVol020074
     * @tc.number SUB_MNB_BST_0871
     * @tc.desc   getBreakpointStyle('md') window #73 covers
     *   recommendCompGridItemHeight/controlButtonStyle.width/sideBarPrimaryMenuTextSize/mainTabsBcColor/
     *   sideBarPrimaryNavListHeight
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020074 begin');
      const result: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020074 end');
    });

    /**
     * @tc.name   testBstFieldVol020075
     * @tc.number SUB_MNB_BST_0872
     * @tc.desc   Anchor: an empty breakpoint string takes the default branch, list item width becomes 100%
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBstFieldVol020075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020075 begin');
      const style: CustomBreakPointStyle = StyleConfiguration.getBreakpointStyle('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'itemWidth=%{public}s height=[%{public}s]',
        style.sideBarPrimaryNavListItemWidth, style.sideBarPrimaryNavListHeight);
      expect(style.sideBarPrimaryNavListItemWidth).assertEqual('100%');
      expect(style.sideBarPrimaryNavListHeight).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.sideBarPrimaryNavListMargin');
      expect(style.sideBarPrimaryNavListMargin).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBstFieldVol020075 end');
    });
  });
}
