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
import {
  CustomLength,
  CustomFontStyle,
  CustomBreakPointStyle,
  SubTabsControllerStyle
} from '../../../main/ets/model/StyleType';
import {
  MAIN_TABS_ACTIVE_FILL,
  MAIN_TABS_ACTIVE_FONT
} from '../util/NavSpec';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

/**
 * L1 cases for the style value objects in model/StyleType.ets:16-64.
 * All fields are optional with declared defaults, so a freshly created instance describes the
 * zero state that the layout code relies on when a breakpoint never sets a value.
 */
export default function mdlDefaultReal01Test() {
  describe('MultiNavBarMdlDefaultReal01', () => {
    /**
     * @tc.name   testMdlReal2301
     * @tc.number SUB_MNB_MDL_2301
     * @tc.desc   CustomLength starts with all six offsets at zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMdlReal2301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2301 begin');
      const length: CustomLength = new CustomLength();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'left=%{public}s right=%{public}s top=%{public}s',
        String(length.left), String(length.right), String(length.top));
      expect(length.left).assertEqual(0);
      expect(length.right).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check length.top');
      expect(length.top).assertEqual(0);
      expect(length.bottom).assertEqual(0);
      expect(length.width).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check length.height');
      expect(length.height).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2301 end');
    });

    /**
     * @tc.name   testMdlReal2302
     * @tc.number SUB_MNB_MDL_2302
     * @tc.desc   CustomFontStyle starts with empty colour strings and font size zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMdlReal2302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2302 begin');
      const font: CustomFontStyle = new CustomFontStyle();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'fill=[%{public}s] size=%{public}s', font.fillColor,
        String(font.fontSize));
      expect(font.fillColor).assertEqual('');
      expect(font.fontColor).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check font.fontSize');
      expect(font.fontSize).assertEqual(0);
      expect(font.backgroundColor).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2302 end');
    });

    /**
     * @tc.name   testMdlReal2303
     * @tc.number SUB_MNB_MDL_2303
     * @tc.desc   Boundary: overriding one offset leaves the other five at their defaults
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMdlReal2303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2303 begin');
      const length: CustomLength = new CustomLength();
      length.top = -8;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'top=%{public}s left=%{public}s', String(length.top),
        String(length.left));
      expect(length.left).assertEqual(0);
      expect(length.bottom).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check length.top < 0');
      expect(length.top < 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2303 end');
    });

    /**
     * @tc.name   testMdlReal2304
     * @tc.number SUB_MNB_MDL_2304
     * @tc.desc   State: two CustomLength instances do not share field values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMdlReal2304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2304 begin');
      const first: CustomLength = new CustomLength();
      const second: CustomLength = new CustomLength();
      first.width = 48;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s second=%{public}s', String(first.width),
        String(second.width));
      expect(second.width).assertEqual(0);
      expect(first === second).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check second.height');
      expect(second.height).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2304 end');
    });

    /**
     * @tc.name   testMdlReal2305
     * @tc.number SUB_MNB_MDL_2305
     * @tc.desc   State: setting the font colour leaves the fill colour at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMdlReal2305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2305 begin');
      const font: CustomFontStyle = new CustomFontStyle();
      font.fontColor = MAIN_TABS_ACTIVE_FONT;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'font=%{public}s fill=[%{public}s]', font.fontColor, font.fillColor);
      expect(font.fillColor).assertEqual('');
      expect(font.fontSize).assertEqual(0);
      expect(font.fontColor).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2305 end');
    });

    /**
     * @tc.name   testMdlReal2306
     * @tc.number SUB_MNB_MDL_2306
     * @tc.desc   Combination: the four nested CustomLength members of CustomBreakPointStyle exist
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMdlReal2306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2306 begin');
      const style: CustomBreakPointStyle = new CustomBreakPointStyle();
      let present: number = 0;
      if (style.controlButtonStyle instanceof CustomLength) {
        present++;
      }
      if (style.sideBarPrimaryMenuImgMargin instanceof CustomLength) {
        present++;
      }
      if (style.mainTabsContentMargin instanceof CustomLength) {
        present++;
      }
      if (style.recommendCompMargin instanceof CustomLength) {
        present++;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'present=%{public}s expected=%{public}s', String(present), '4');
      expect(present).assertEqual(4);
      expect(style.controlButtonStyle === style.mainTabsContentMargin).assertFalse();
      expect(style.recommendCompMargin.top).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2306 end');
    });

    /**
     * @tc.name   testMdlReal2307
     * @tc.number SUB_MNB_MDL_2307
     * @tc.desc   CustomBreakPointStyle keeps its three string fields empty by default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMdlReal2307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2307 begin');
      const style: CustomBreakPointStyle = new CustomBreakPointStyle();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'height=[%{public}s] width=[%{public}s] color=[%{public}s]',
        style.sideBarPrimaryNavListHeight, style.sideBarPrimaryNavListItemWidth, style.mainTabsBcColor);
      expect(style.sideBarPrimaryNavListHeight).assertEqual('');
      expect(style.sideBarPrimaryNavListItemWidth).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.mainTabsBcColor');
      expect(style.mainTabsBcColor).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2307 end');
    });

    /**
     * @tc.name   testMdlReal2308
     * @tc.number SUB_MNB_MDL_2308
     * @tc.desc   CustomBreakPointStyle numeric fields default to zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMdlReal2308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2308 begin');
      const style: CustomBreakPointStyle = new CustomBreakPointStyle();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'margin=%{public}s size=%{public}s',
        String(style.sideBarPrimaryNavListMargin), String(style.sideBarPrimaryMenuTextSize));
      expect(style.sideBarPrimaryNavListMargin).assertEqual(0);
      expect(style.sideBarPrimaryMenuTextSize).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.sideBarPrimaryMenuTextHeight');
      expect(style.sideBarPrimaryMenuTextHeight).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2308 end');
    });

    /**
     * @tc.name   testMdlReal2309
     * @tc.number SUB_MNB_MDL_2309
     * @tc.desc   Property: all three grid heights default to zero before a breakpoint is applied
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlReal2309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2309 begin');
      const style: CustomBreakPointStyle = new CustomBreakPointStyle();
      const heights: number[] = [style.recommendCompGridHeight, style.recommendCompGridItemHeight,
        style.recommendCompGridSecHeight];
      let nonZero: number = 0;
      for (let i: number = 0; i < heights.length; i++) {
        if (heights[i] !== 0) {
          nonZero++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nonZero=%{public}s heights=%{public}s', String(nonZero),
        heights.join(','));
      expect(nonZero).assertEqual(0);
      expect(heights.length).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.recommendCompGridSecHeight');
      expect(style.recommendCompGridSecHeight).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2309 end');
    });

    /**
     * @tc.name   testMdlReal2310
     * @tc.number SUB_MNB_MDL_2310
     * @tc.desc   SubTabsControllerStyle starts with both visibility flags disabled
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMdlReal2310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2310 begin');
      const style: SubTabsControllerStyle = new SubTabsControllerStyle();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'title=%{public}s menu=%{public}s', String(style.isShowPageTitle),
        String(style.isShowSecondMenu));
      expect(style.isShowPageTitle).assertFalse();
      expect(style.isShowSecondMenu).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.isShowPageTitle === style.isShowSecondMenu');
      expect(style.isShowPageTitle === style.isShowSecondMenu).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2310 end');
    });

    /**
     * @tc.name   testMdlReal2311
     * @tc.number SUB_MNB_MDL_2311
     * @tc.desc   SubTabsControllerStyle keeps the secondary menu width empty by default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlReal2311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2311 begin');
      const style: SubTabsControllerStyle = new SubTabsControllerStyle();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'width=[%{public}s] height=%{public}s',
        style.secondMenuListItemWidth, String(style.secondMenuListItemHeight));
      expect(style.secondMenuListItemWidth).assertEqual('');
      expect(style.secondMenuListItemHeight).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.secondMenuListSpace');
      expect(style.secondMenuListSpace).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2311 end');
    });

    /**
     * @tc.name   testMdlReal2312
     * @tc.number SUB_MNB_MDL_2312
     * @tc.desc   SubTabsControllerStyle flex and alignment fields default to the zero enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlReal2312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2312 begin');
      const style: SubTabsControllerStyle = new SubTabsControllerStyle();
      const alignments: number[] = [style.sideBarPrimaryMenuFlexAlign, style.sideBarPrimaryMenuFlexDirection,
        style.primaryMenuTextAlign, style.secondMenuListDirection];
      let nonZero: number = 0;
      for (let i: number = 0; i < alignments.length; i++) {
        if (alignments[i] !== 0) {
          nonZero++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nonZero=%{public}s values=%{public}s', String(nonZero),
        alignments.join(','));
      expect(nonZero).assertEqual(0);
      expect(alignments.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.primaryMenuTextAlign');
      expect(style.primaryMenuTextAlign).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2312 end');
    });

    /**
     * @tc.name   testMdlReal2313
     * @tc.number SUB_MNB_MDL_2313
     * @tc.desc   Combination: the five nested CustomLength members of SubTabsControllerStyle exist
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlReal2313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2313 begin');
      const style: SubTabsControllerStyle = new SubTabsControllerStyle();
      let instances: number = 0;
      if (style.sideBarPrimaryMenuTextMargin instanceof CustomLength) {
        instances++;
      }
      if (style.secondMenuListItemMargin instanceof CustomLength) {
        instances++;
      }
      if (style.sideBarPrimaryNavListPadding instanceof CustomLength) {
        instances++;
      }
      if (style.sideBarPrimaryMenuListPadding instanceof CustomLength) {
        instances++;
      }
      if (style.searchModulePadding instanceof CustomLength) {
        instances++;
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'instances=%{public}s expected=%{public}s', String(instances), '5');
      expect(instances).assertEqual(5);
      expect(style.toolBarPadding instanceof CustomLength).assertTrue();
      expect(style.searchModulePadding === style.toolBarPadding).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2313 end');
    });

    /**
     * @tc.name   testMdlReal2314
     * @tc.number SUB_MNB_MDL_2314
     * @tc.desc   SubTabsControllerStyle paddings all start at zero on both sides
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlReal2314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2314 begin');
      const style: SubTabsControllerStyle = new SubTabsControllerStyle();
      const paddings: string[] = [String(style.searchModulePadding.left),
        String(style.searchModulePadding.right), String(style.toolBarPadding.left),
        String(style.toolBarPadding.right), String(style.sideBarPrimaryNavListPadding.left)];
      let nonZero: number = 0;
      for (let i: number = 0; i < paddings.length; i++) {
        if (paddings[i] !== '0') {
          nonZero++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'nonZero=%{public}s paddings=%{public}s', String(nonZero),
        paddings.join(','));
      expect(nonZero).assertEqual(0);
      expect(paddings.length).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.toolBarPadding.left');
      expect(style.toolBarPadding.left).assertEqual(style.toolBarPadding.right);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2314 end');
    });

    /**
     * @tc.name   testMdlReal2315
     * @tc.number SUB_MNB_MDL_2315
     * @tc.desc   State: nested objects of two CustomBreakPointStyle instances are independent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlReal2315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2315 begin');
      const first: CustomBreakPointStyle = new CustomBreakPointStyle();
      const second: CustomBreakPointStyle = new CustomBreakPointStyle();
      first.mainTabsContentMargin.left = 16;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s second=%{public}s',
        String(first.mainTabsContentMargin.left), String(second.mainTabsContentMargin.left));
      expect(second.mainTabsContentMargin.left).assertEqual(0);
      expect(first.mainTabsContentMargin === second.mainTabsContentMargin).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check second.mainTabsContentMargin.right');
      expect(second.mainTabsContentMargin.right).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2315 end');
    });

    /**
     * @tc.name   testMdlReal2316
     * @tc.number SUB_MNB_MDL_2316
     * @tc.desc   Combination: a CustomFontStyle can carry a full accent state at once
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlReal2316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2316 begin');
      const font: CustomFontStyle = new CustomFontStyle();
      font.fillColor = MAIN_TABS_ACTIVE_FILL;
      font.fontColor = MAIN_TABS_ACTIVE_FONT;
      font.fontSize = 16;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'fill=%{public}s font=%{public}s size=%{public}s', font.fillColor,
        font.fontColor, String(font.fontSize));
      const fresh: CustomFontStyle = new CustomFontStyle();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'freshSize=%{public}s freshFill=[%{public}s]', String(fresh.fontSize),
        fresh.fillColor);
      expect(font.fillColor === fresh.fillColor).assertFalse();
      expect(font.fontSize === fresh.fontSize).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check fresh.backgroundColor');
      expect(fresh.backgroundColor).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2316 end');
    });

    /**
     * @tc.name   testMdlReal2317
     * @tc.number SUB_MNB_MDL_2317
     * @tc.desc   Property: two default CustomLength instances agree on every field
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlReal2317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2317 begin');
      const first: CustomLength = new CustomLength();
      const second: CustomLength = new CustomLength();
      const mismatched: number = (first.left === second.left ? 0 : 1) + (first.top === second.top ? 0 : 1) +
        (first.width === second.width ? 0 : 1) + (first.height === second.height ? 0 : 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'mismatched=%{public}s', String(mismatched));
      expect(mismatched).assertEqual(0);
      expect(first === second).assertFalse();
      expect(first.bottom).assertEqual(second.bottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2317 end');
    });

    /**
     * @tc.name   testMdlReal2318
     * @tc.number SUB_MNB_MDL_2318
     * @tc.desc   Property: numeric fields keep the number type before any breakpoint is applied
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlReal2318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2318 begin');
      const length: CustomLength = new CustomLength();
      const style: SubTabsControllerStyle = new SubTabsControllerStyle();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'leftType=%{public}s heightType=%{public}s',
        typeof length.left, typeof style.secondMenuListItemHeight);
      expect(typeof length.left).assertEqual('number');
      expect(typeof style.secondMenuListItemHeight).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check String(length.left) + String(length.height)');
      expect(String(length.left) + String(length.height)).assertEqual('00');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2318 end');
    });

    /**
     * @tc.name   testMdlReal2319
     * @tc.number SUB_MNB_MDL_2319
     * @tc.desc   Anchor: an explicitly cleared optional field reads back as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlReal2319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2319 begin');
      const length: CustomLength = new CustomLength();
      length.width = undefined;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'width=%{public}s expected=%{public}s', String(length.width), 'undefined');
      expect(String(length.width)).assertEqual('undefined');
      expect(length.left).assertEqual(0);
      expect(length.height).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2319 end');
    });

    /**
     * @tc.name   testMdlReal2320
     * @tc.number SUB_MNB_MDL_2320
     * @tc.desc   Anchor: a non-numeric string offset is stored verbatim and breaks the zero contract
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlReal2320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2320 begin');
      const style: CustomBreakPointStyle = new CustomBreakPointStyle();
      style.sideBarPrimaryNavListHeight = 'auto';
      hilog.info(LOG_DOMAIN, LOG_TAG, 'height=%{public}s', style.sideBarPrimaryNavListHeight);
      const fresh: CustomBreakPointStyle = new CustomBreakPointStyle();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'freshHeight=[%{public}s]', fresh.sideBarPrimaryNavListHeight);
      expect(style.sideBarPrimaryNavListHeight === fresh.sideBarPrimaryNavListHeight).assertFalse();
      expect(fresh.sideBarPrimaryNavListHeight).assertEqual('');
      expect(fresh.recommendCompGridHeight).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2320 end');
    });

    /**
     * @tc.name   testMdlReal2321
     * @tc.number SUB_MNB_MDL_2321
     * @tc.desc   Boundary: an explicit zero offset is indistinguishable from the default, by design
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlReal2321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2321 begin');
      const explicit: CustomLength = new CustomLength();
      explicit.left = 0;
      const implicit: CustomLength = new CustomLength();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'explicit=%{public}s implicit=%{public}s', String(explicit.left),
        String(implicit.left));
      expect(explicit.left).assertEqual(implicit.left);
      expect(typeof explicit.left).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check explicit === implicit');
      expect(explicit === implicit).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2321 end');
    });

    /**
     * @tc.name   testMdlReal2322
     * @tc.number SUB_MNB_MDL_2322
     * @tc.desc   Extreme: large offsets are stored without clamping
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlReal2322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2322 begin');
      const style: SubTabsControllerStyle = new SubTabsControllerStyle();
      style.secondMenuListItemHeight = 100000;
      style.secondMenuListSpace = -1;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'height=%{public}s space=%{public}s',
        String(style.secondMenuListItemHeight), String(style.secondMenuListSpace));
      expect(style.secondMenuListItemHeight > 99999).assertTrue();
      expect(style.secondMenuListSpace < 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.secondMenuListItemWidth');
      expect(style.secondMenuListItemWidth).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlReal2322 end');
    });
  });
}
