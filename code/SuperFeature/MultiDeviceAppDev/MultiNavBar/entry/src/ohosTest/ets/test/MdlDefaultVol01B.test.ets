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
import {
  CustomLength,
  CustomFontStyle,
  CustomBreakPointStyle,
  SubTabsControllerStyle
} from '../../../main/ets/model/StyleType';;
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function mdlDefaultVol01BTest() {
  describe('MultiNavBarMdlDefaultVol01B', () => {

    /**
     * @tc.name   testMdlDefaultVol010039
     * @tc.number SUB_MNB_MDL_2361
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle
     *   probe series #38
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010039 begin');
      const result: string = String(new CustomBreakPointStyle().sideBarPrimaryMenuTextHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.width), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.height), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.top), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.bottom), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010039 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010040
     * @tc.number SUB_MNB_MDL_2362
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle
     *   probe series #39
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010040 begin');
      const result: string = String(new CustomBreakPointStyle().controlButtonStyle.left);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.right), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.width), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.height), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().primaryMenuTextAlign), String('0'));
      expect(String(new SubTabsControllerStyle().primaryMenuTextAlign)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010040 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010041
     * @tc.number SUB_MNB_MDL_2363
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle
     *   probe series #40
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010041 begin');
      const result: string = String(new CustomBreakPointStyle().controlButtonStyle.bottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.left), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.right), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuFlexAlign), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuFlexAlign)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.left), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010041 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010042
     * @tc.number SUB_MNB_MDL_2364
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #41
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010042 begin');
      const result: string = String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.top);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.bottom), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListSpace), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListSpace)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemWidth), String(''));
      expect(String(new SubTabsControllerStyle().secondMenuListItemWidth)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010042 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010043
     * @tc.number SUB_MNB_MDL_2365
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #42
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010043 begin');
      const result: string = String(new CustomBreakPointStyle().mainTabsContentMargin.height);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.top), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().isShowPageTitle), String('false'));
      expect(String(new SubTabsControllerStyle().isShowPageTitle)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.height), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.top), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010043 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010044
     * @tc.number SUB_MNB_MDL_2366
     * @tc.desc   default values of
     *   CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #43
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010044 begin');
      const result: string = String(new CustomBreakPointStyle().recommendCompMargin.width);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuFlexDirection), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuFlexDirection)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.right), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.width), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.height), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010044 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010045
     * @tc.number SUB_MNB_MDL_2367
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #44
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010045 begin');
      const result: string = String(new SubTabsControllerStyle().secondMenuListItemHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListDirection), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListDirection)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.left), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.right), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.width), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010045 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010046
     * @tc.number SUB_MNB_MDL_2368
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #45
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010046 begin');
      const result: string = String(new SubTabsControllerStyle().isShowSecondMenu);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.top), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.left), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.right), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010046 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010047
     * @tc.number SUB_MNB_MDL_2369
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #46
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010047 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.width);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.height), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.top), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.left), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010047 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010048
     * @tc.number SUB_MNB_MDL_2370
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #47
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010048 begin');
      const result: string = String(new SubTabsControllerStyle().secondMenuListItemMargin.right);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.width), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.height), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.top), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010048 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010049
     * @tc.number SUB_MNB_MDL_2371
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/CustomLength probe
     *   series #48
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010049 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.left);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.right), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.width), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.height), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().top),
        String('0'));
      expect(String(new CustomLength().top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010049 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010050
     * @tc.number SUB_MNB_MDL_2372
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/CustomLength/CustomFontStyle probe series
     *   #49
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010050 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.bottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.left), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.right), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().width),
        String('0'));
      expect(String(new CustomLength().width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomFontStyle().backgroundColor), String(''));
      expect(String(new CustomFontStyle().backgroundColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010050 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010051
     * @tc.number SUB_MNB_MDL_2373
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/CustomLength/CustomFontStyle/CustomBreakPointStyle probe series
     *   #50
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010051 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.top);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().left),
        String('0'));
      expect(String(new CustomLength().left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomFontStyle().fontColor),
        String(''));
      expect(String(new CustomFontStyle().fontColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuTextHeight), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuTextHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010051 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010052
     * @tc.number SUB_MNB_MDL_2374
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/CustomLength/CustomBreakPointStyle/CustomBreakPointStyle probe
     *   series #51
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010052 begin');
      const result: string = String(new SubTabsControllerStyle().searchModulePadding.height);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.top), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().bottom),
        String('0'));
      expect(String(new CustomLength().bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryNavListItemWidth), String(''));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryNavListItemWidth)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.left), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010052 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010053
     * @tc.number SUB_MNB_MDL_2375
     * @tc.desc   default values of
     *   SubTabsControllerStyle/CustomLength/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle probe
     *   series #52
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010053 begin');
      const result: string = String(new SubTabsControllerStyle().toolBarPadding.width);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().height),
        String('0'));
      expect(String(new CustomLength().height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryNavListHeight), String(''));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryNavListHeight)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompGridSecHeight), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompGridSecHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.bottom), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010053 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010054
     * @tc.number SUB_MNB_MDL_2376
     * @tc.desc   default values of
     *   CustomLength/CustomFontStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle probe series #53
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010054 begin');
      const result: string = String(new CustomLength().right);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomFontStyle().fontSize),
        String('0'));
      expect(String(new CustomFontStyle().fontSize)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompGridHeight), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompGridHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.height), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.top), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010054 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010055
     * @tc.number SUB_MNB_MDL_2377
     * @tc.desc   default values of
     *   CustomFontStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle probe
     *   series #54
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010055 begin');
      const result: string = String(new CustomFontStyle().fillColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(String(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuTextSize), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuTextSize)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.right), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.width), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.height), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010055 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010056
     * @tc.number SUB_MNB_MDL_2378
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle
     *   probe series #55
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010056 begin');
      const result: string = String(new CustomBreakPointStyle().sideBarPrimaryNavListMargin);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsBcColor), String(''));
      expect(String(new CustomBreakPointStyle().mainTabsBcColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.left), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.right), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.width), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010056 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010057
     * @tc.number SUB_MNB_MDL_2379
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle
     *   probe series #56
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010057 begin');
      const result: string = String(new CustomBreakPointStyle().recommendCompGridItemHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.top), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.bottom), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.left), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemHeight), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010057 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010058
     * @tc.number SUB_MNB_MDL_2380
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle
     *   probe series #57
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010058 begin');
      const result: string = String(new CustomBreakPointStyle().controlButtonStyle.width);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.height), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.top), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.bottom), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().isShowSecondMenu), String('false'));
      expect(String(new SubTabsControllerStyle().isShowSecondMenu)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010058 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010059
     * @tc.number SUB_MNB_MDL_2381
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle
     *   probe series #58
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010059 begin');
      const result: string = String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.right);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.width), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.height), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().primaryMenuTextAlign), String('0'));
      expect(String(new SubTabsControllerStyle().primaryMenuTextAlign)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.width), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010059 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010060
     * @tc.number SUB_MNB_MDL_2382
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010060 begin');
      const result: string = String(new CustomBreakPointStyle().mainTabsContentMargin.left);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.right), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuFlexAlign), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuFlexAlign)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.left), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.right), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010060 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010061
     * @tc.number SUB_MNB_MDL_2383
     * @tc.desc   default values of
     *   CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #60
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010061 begin');
      const result: string = String(new CustomBreakPointStyle().mainTabsContentMargin.bottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListSpace), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListSpace)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemWidth), String(''));
      expect(String(new SubTabsControllerStyle().secondMenuListItemWidth)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.left), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010061 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010062
     * @tc.number SUB_MNB_MDL_2384
     * @tc.desc   default values of
     *   CustomBreakPointStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #61
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010062 begin');
      const result: string = String(new CustomBreakPointStyle().recommendCompMargin.top);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().isShowPageTitle), String('false'));
      expect(String(new SubTabsControllerStyle().isShowPageTitle)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.height), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.top), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010062 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010063
     * @tc.number SUB_MNB_MDL_2385
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #62
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010063 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryMenuFlexDirection);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.right), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.width), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.height), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.top), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010063 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010064
     * @tc.number SUB_MNB_MDL_2386
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #63
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010064 begin');
      const result: string = String(new SubTabsControllerStyle().secondMenuListDirection);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.left), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.right), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.width), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.height), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010064 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010065
     * @tc.number SUB_MNB_MDL_2387
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/
     *   SubTabsControllerStyle probe series #64
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010065 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryMenuTextMargin.top);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().secondMenuListItemMargin.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().secondMenuListItemMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.left), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.right), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.width), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010065 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010066
     * @tc.number SUB_MNB_MDL_2388
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/CustomLength probe
     *   series #65
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010066 begin');
      const result: string = String(new SubTabsControllerStyle().secondMenuListItemMargin.height);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.top), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.left), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().right),
        String('0'));
      expect(String(new CustomLength().right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010066 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010067
     * @tc.number SUB_MNB_MDL_2389
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/CustomFontStyle
     *   probe series #66
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010067 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryNavListPadding.width);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.height), String('0'));
      expect(String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.top), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.bottom), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomFontStyle().fillColor),
        String(''));
      expect(String(new CustomFontStyle().fillColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010067 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010068
     * @tc.number SUB_MNB_MDL_2390
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/SubTabsControllerStyle/CustomLength/CustomBreakPointStyle probe
     *   series #67
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010068 begin');
      const result: string = String(new SubTabsControllerStyle().sideBarPrimaryMenuListPadding.right);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().searchModulePadding.width), String('0'));
      expect(String(new SubTabsControllerStyle().searchModulePadding.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.height), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().top),
        String('0'));
      expect(String(new CustomLength().top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryNavListMargin), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryNavListMargin)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010068 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010069
     * @tc.number SUB_MNB_MDL_2391
     * @tc.desc   default values of
     *   SubTabsControllerStyle/SubTabsControllerStyle/CustomLength/CustomFontStyle/CustomBreakPointStyle probe series
     *   #68
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010069 begin');
      const result: string = String(new SubTabsControllerStyle().searchModulePadding.left);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SubTabsControllerStyle().toolBarPadding.right), String('0'));
      expect(String(new SubTabsControllerStyle().toolBarPadding.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().width),
        String('0'));
      expect(String(new CustomLength().width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomFontStyle().backgroundColor), String(''));
      expect(String(new CustomFontStyle().backgroundColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompGridItemHeight), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompGridItemHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010069 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010070
     * @tc.number SUB_MNB_MDL_2392
     * @tc.desc   default values of
     *   SubTabsControllerStyle/CustomLength/CustomFontStyle/CustomBreakPointStyle/CustomBreakPointStyle probe series
     *   #69
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010070 begin');
      const result: string = String(new SubTabsControllerStyle().searchModulePadding.bottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().left),
        String('0'));
      expect(String(new CustomLength().left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomFontStyle().fontColor),
        String(''));
      expect(String(new CustomFontStyle().fontColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuTextHeight), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuTextHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.width), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010070 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010071
     * @tc.number SUB_MNB_MDL_2393
     * @tc.desc   default values of
     *   SubTabsControllerStyle/CustomLength/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle probe
     *   series #70
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010071 begin');
      const result: string = String(new SubTabsControllerStyle().toolBarPadding.top);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(new CustomLength().bottom),
        String('0'));
      expect(String(new CustomLength().bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryNavListItemWidth), String(''));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryNavListItemWidth)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.left), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.right), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010071 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010072
     * @tc.number SUB_MNB_MDL_2394
     * @tc.desc   default values of
     *   CustomLength/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle probe
     *   series #71
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010072 begin');
      const result: string = String(new CustomLength().height);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryNavListHeight), String(''));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryNavListHeight)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompGridSecHeight), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompGridSecHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.bottom), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.left), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010072 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010073
     * @tc.number SUB_MNB_MDL_2395
     * @tc.desc   default values of
     *   CustomFontStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle probe
     *   series #72
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010073 begin');
      const result: string = String(new CustomFontStyle().fontSize);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompGridHeight), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompGridHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.height), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.top), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.bottom), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010073 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010074
     * @tc.number SUB_MNB_MDL_2396
     * @tc.desc   default values of
     *   CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle/CustomBreakPointStyle
     *   probe series #73
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010074 begin');
      const result: string = String(new CustomBreakPointStyle().sideBarPrimaryMenuTextSize);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().controlButtonStyle.right), String('0'));
      expect(String(new CustomBreakPointStyle().controlButtonStyle.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.width), String('0'));
      expect(String(new CustomBreakPointStyle().sideBarPrimaryMenuImgMargin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().mainTabsContentMargin.height), String('0'));
      expect(String(new CustomBreakPointStyle().mainTabsContentMargin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new CustomBreakPointStyle().recommendCompMargin.top), String('0'));
      expect(String(new CustomBreakPointStyle().recommendCompMargin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010074 end');
    });

    /**
     * @tc.name   testMdlDefaultVol010075
     * @tc.number SUB_MNB_MDL_2397
     * @tc.desc   Anchor: a class instance is never interchangeable with a fresh instance of the same shape
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol010075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010075 begin');
      const first: CustomLength = new CustomLength();
      const second: CustomLength = new CustomLength();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'firstWidth=%{public}s secondWidth=%{public}s', String(first.width),
        String(second.width));
      expect(first === second).assertFalse();
      expect(first.width).assertEqual(second.width);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check typeof first.height');
      expect(String(typeof first.height)).assertEqual('number');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol010075 end');
    });
  });
}
