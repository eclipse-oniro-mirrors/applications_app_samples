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
import {
  CustomLength,
  CustomFontStyle,
  CustomBreakPointStyle,
  SubTabsControllerStyle
} from '../../../main/ets/model/StyleType';;
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function mdlDefaultVol01Test() {
  describe('MultiNavBarMdlDefaultVol01', () => {

    /**
     * @tc.name   testMdlDefaultVol010001
     * @tc.number SUB_MNB_MDL_2323
     * @tc.desc   default values of
     *   CustomLength/CustomFontStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle probe series #0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010001 begin');
      const result: string = String(new CustomLength().left);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomFontStyle().fontColor),
        String(''));
      expect(String(new CustomFontStyle().fontColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuTextHeight), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuTextHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.width), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.height), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010001 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010002
     * @tc.number SUB_MNB_MDL_2324
     * @tc.desc   default values of
     *   CustomLength/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle probe
     *   series #1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010002 begin');
      const result: string = String(new CustomLength().bottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryNavListItemWidth), String(''));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryNavListItemWidth)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.left), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.right), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.width), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010002 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010003
     * @tc.number SUB_MNB_MDL_2325
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle
     *   probe series #2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010003 begin');
      const result: string = String(new CustomBreakPointStyle().sideBarPrimaryNavListHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(String(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompGridSecHeight), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompGridSecHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.bottom), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.left), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.right), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010003 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010004
     * @tc.number SUB_MNB_MDL_2326
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle
     *   probe series #3
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010004 begin');
      const result: string = String(new CustomBreakPointStyle().recommendCompGridHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.height), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.top), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.bottom), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListSpace), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListSpace)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010004 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010005
     * @tc.number SUB_MNB_MDL_2327
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle
     *   probe series #4
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010005 begin');
      const result: string = String(new CustomBreakPointStyle().controlButtonStyle.right);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.width), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.height), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.top), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().isShowPageTitle), String('false'));
      expect(String(new SubTabsControllerStyle().isShowPageTitle)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010005 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010006
     * @tc.number SUB_MNB_MDL_2328
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle
     *   probe series #5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010006 begin');
      const result: string = String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.left);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.right), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.width), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuFlexDirection), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuFlexDirection)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.right), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010006 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010007
     * @tc.number SUB_MNB_MDL_2329
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #6
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010007 begin');
      const result: string = String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.bottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.left), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemHeight), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListDirection), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListDirection)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.left), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010007 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010008
     * @tc.number SUB_MNB_MDL_2330
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #7
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010008 begin');
      const result: string = String(new CustomBreakPointStyle().mainTabsContentMargin.top);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.bottom), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().isShowSecondMenu), String('false'));
      expect(String(new SubTabsControllerStyle().isShowSecondMenu)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.top), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010008 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010009
     * @tc.number SUB_MNB_MDL_2331
     * @tc.desc   default values of
     *   CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #8
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010009 begin');
      const result: string = String(new CustomBreakPointStyle().recommendCompMargin.height);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().primaryMenuTextAlign), String('0'));
      expect(String(new SubTabsControllerStyle().primaryMenuTextAlign)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.width), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.height), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.top), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010009 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010010
     * @tc.number SUB_MNB_MDL_2332
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #9
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010010 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryMenuFlexAlign);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.left), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.right), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.width), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.height), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010010 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010011
     * @tc.number SUB_MNB_MDL_2333
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #10
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010011 begin');
      const result: string = String(new SubTabsControllerStyle().secondMenuListItemWidth);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(String(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.left), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.right), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.width), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010011 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010012
     * @tc.number SUB_MNB_MDL_2334
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #11
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010012 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.height);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.top), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.left), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.right), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010012 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010013
     * @tc.number SUB_MNB_MDL_2335
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/CustomLength probe
     *   series #12
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010013 begin');
      const result: string = String(new SubTabsControllerStyle().secondMenuListItemMargin.width);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.height), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.top), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().left),
        String('0'));
      expect(String(new CustomLength().left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010013 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010014
     * @tc.number SUB_MNB_MDL_2336
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/CustomLength probe
     *   series #13
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010014 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.right);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.width), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.height), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.top), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().bottom),
        String('0'));
      expect(String(new CustomLength().bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010014 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010015
     * @tc.number SUB_MNB_MDL_2337
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/CustomLength/CustomBreakPointStyle probe
     *   series #14
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010015 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.left);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.right), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.width), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().height),
        String('0'));
      expect(String(new CustomLength().height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryNavListHeight), String(''));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryNavListHeight)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010015 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010016
     * @tc.number SUB_MNB_MDL_2338
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/CustomLength/CustomFontStyle/CustomBreakPointStyle probe series
     *   #15
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010016 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.bottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.left), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().right),
        String('0'));
      expect(String(new CustomLength().right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomFontStyle().fontSize),
        String('0'));
      expect(String(new CustomFontStyle().fontSize)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompGridHeight), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompGridHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010016 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010017
     * @tc.number SUB_MNB_MDL_2339
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/CustomFontStyle/CustomBreakPointStyle/CustomBreakPointStyle probe
     *   series #16
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010017 begin');
      const result: string = String(new SubTabsControllerStyle().searchModulePadding.top);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomFontStyle().fillColor),
        String(''));
      expect(String(new CustomFontStyle().fillColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuTextSize), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuTextSize)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.right), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010017 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010018
     * @tc.number SUB_MNB_MDL_2340
     * @tc.desc   default values of
     *   SubTabsControllerStyle/CustomLength/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle probe
     *   series #17
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010018 begin');
      const result: string = String(new SubTabsControllerStyle().toolBarPadding.height);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().top),
        String('0'));
      expect(String(new CustomLength().top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryNavListMargin), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryNavListMargin)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsBcColor), String(''));
      expect(String(new CustomBreakPointStyle().mainTabsBcColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.left), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010018 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010019
     * @tc.number SUB_MNB_MDL_2341
     * @tc.desc   default values of
     *   CustomLength/CustomFontStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle probe series #18
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010019 begin');
      const result: string = String(new CustomLength().width);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomFontStyle().backgroundColor), String(''));
      expect(String(new CustomFontStyle().backgroundColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompGridItemHeight), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompGridItemHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.top), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.bottom), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010019 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010020
     * @tc.number SUB_MNB_MDL_2342
     * @tc.desc   default values of
     *   CustomFontStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle probe
     *   series #19
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010020 begin');
      const result: string = String(new CustomFontStyle().fontColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(String(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuTextHeight), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuTextHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.width), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.height), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.top), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010020 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010021
     * @tc.number SUB_MNB_MDL_2343
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle
     *   probe series #20
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010021 begin');
      const result: string = String(new CustomBreakPointStyle().sideBarPrimaryNavListItemWidth);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(String(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.left), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.right), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.width), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.height), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010021 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010022
     * @tc.number SUB_MNB_MDL_2344
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle
     *   probe series #21
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010022 begin');
      const result: string = String(new CustomBreakPointStyle().recommendCompGridSecHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.bottom), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.left), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.right), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuFlexAlign), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuFlexAlign)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010022 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010023
     * @tc.number SUB_MNB_MDL_2345
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle
     *   probe series #22
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010023 begin');
      const result: string = String(new CustomBreakPointStyle().controlButtonStyle.height);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.top), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.bottom), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListSpace), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListSpace)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemWidth), String(''));
      expect(String(new SubTabsControllerStyle().secondMenuListItemWidth)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010023 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010024
     * @tc.number SUB_MNB_MDL_2346
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle
     *   probe series #23
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010024 begin');
      const result: string = String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.width);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.height), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.top), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().isShowPageTitle), String('false'));
      expect(String(new SubTabsControllerStyle().isShowPageTitle)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.height), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010024 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010025
     * @tc.number SUB_MNB_MDL_2347
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #24
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010025 begin');
      const result: string = String(new CustomBreakPointStyle().mainTabsContentMargin.right);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.width), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuFlexDirection), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuFlexDirection)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.right), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.width), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010025 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010026
     * @tc.number SUB_MNB_MDL_2348
     * @tc.desc   default values of
     *   CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #25
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010026 begin');
      const result: string = String(new CustomBreakPointStyle().recommendCompMargin.left);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemHeight), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListDirection), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListDirection)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.left), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.right), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010026 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010027
     * @tc.number SUB_MNB_MDL_2349
     * @tc.desc   default values of
     *   CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #26
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010027 begin');
      const result: string = String(new CustomBreakPointStyle().recommendCompMargin.bottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().isShowSecondMenu), String('false'));
      expect(String(new SubTabsControllerStyle().isShowSecondMenu)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.top), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.left), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010027 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010028
     * @tc.number SUB_MNB_MDL_2350
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #27
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010028 begin');
      const result: string = String(new SubTabsControllerStyle().primaryMenuTextAlign);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.width), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.height), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.top), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010028 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010029
     * @tc.number SUB_MNB_MDL_2351
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #28
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010029 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.left);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.right), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.width), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.height), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.top), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010029 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010030
     * @tc.number SUB_MNB_MDL_2352
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #29
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010030 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.bottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.left), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.right), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.width), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.height), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010030 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010031
     * @tc.number SUB_MNB_MDL_2353
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/CustomLength probe
     *   series #30
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010031 begin');
      const result: string = String(new SubTabsControllerStyle().secondMenuListItemMargin.top);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.left), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.right), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().width),
        String('0'));
      expect(String(new CustomLength().width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010031 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010032
     * @tc.number SUB_MNB_MDL_2354
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/CustomLength/CustomFontStyle probe series
     *   #31
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010032 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.height);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.top), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().left),
        String('0'));
      expect(String(new CustomLength().left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomFontStyle().fontColor),
        String(''));
      expect(String(new CustomFontStyle().fontColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010032 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010033
     * @tc.number SUB_MNB_MDL_2355
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/CustomLength/CustomBreakPointStyle probe
     *   series #32
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010033 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.width);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.height), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.top), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().bottom),
        String('0'));
      expect(String(new CustomLength().bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryNavListItemWidth), String(''));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryNavListItemWidth)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010033 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010034
     * @tc.number SUB_MNB_MDL_2356
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/CustomLength/CustomBreakPointStyle/CustomBreakPointStyle probe
     *   series #33
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010034 begin');
      const result: string = String(new SubTabsControllerStyle().searchModulePadding.right);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.width), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().height),
        String('0'));
      expect(String(new CustomLength().height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryNavListHeight), String(''));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryNavListHeight)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompGridSecHeight), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompGridSecHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010034 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010035
     * @tc.number SUB_MNB_MDL_2357
     * @tc.desc   default values of
     *   SubTabsControllerStyle/CustomLength/CustomFontStyle/CustomBreakPointStyle/CustomBreakPointStyle probe series
     *   #34
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010035 begin');
      const result: string = String(new SubTabsControllerStyle().toolBarPadding.left);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().right),
        String('0'));
      expect(String(new CustomLength().right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomFontStyle().fontSize),
        String('0'));
      expect(String(new CustomFontStyle().fontSize)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompGridHeight), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompGridHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.height), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010035 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010036
     * @tc.number SUB_MNB_MDL_2358
     * @tc.desc   default values of
     *   SubTabsControllerStyle/CustomFontStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle probe
     *   series #35
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010036 begin');
      const result: string = String(new SubTabsControllerStyle().toolBarPadding.bottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomFontStyle().fillColor),
        String(''));
      expect(String(new CustomFontStyle().fillColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuTextSize), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuTextSize)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.right), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.width), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010036 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010037
     * @tc.number SUB_MNB_MDL_2359
     * @tc.desc   default values of
     *   CustomLength/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle probe
     *   series #36
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010037 begin');
      const result: string = String(new CustomLength().top);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryNavListMargin), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryNavListMargin)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsBcColor), String(''));
      expect(String(new CustomBreakPointStyle().mainTabsBcColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.left), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.right), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010037 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010038
     * @tc.number SUB_MNB_MDL_2360
     * @tc.desc   default values of
     *   CustomFontStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle probe
     *   series #37
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010038 begin');
      const result: string = String(new CustomFontStyle().backgroundColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(String(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompGridItemHeight), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompGridItemHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.top), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.bottom), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.left), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010038 end');
    });

  });
}
