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

export default function mdlDefaultVol02BTest() {
  describe('MultiNavBarMdlDefaultVol02B', () => {

    /**
     * @tc.name   testMdlDefaultVol020039
     * @tc.number SUB_MNB_MDL_2436
     * @tc.desc   writing CustomBreakPointStyle.sideBarPrimaryNavListHeight leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020039 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.sideBarPrimaryNavListHeight = 'auto';
      const result: string = String(twin.sideBarPrimaryNavListHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.sideBarPrimaryMenuTextSize),
        String('0'));
      expect(String(twin.sideBarPrimaryMenuTextSize)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryNavListMargin), String('0'));
      expect(String(probe.sideBarPrimaryNavListMargin)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryNavListHeight === twin.sideBarPrimaryNavListHeight), String('false'));
      expect(String(probe.sideBarPrimaryNavListHeight === twin.sideBarPrimaryNavListHeight)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020039 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020040
     * @tc.number SUB_MNB_MDL_2437
     * @tc.desc   writing CustomBreakPointStyle.sideBarPrimaryNavListMargin leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020040 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.sideBarPrimaryNavListMargin = 9;
      const result: string = String(twin.sideBarPrimaryNavListMargin);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.recommendCompGridItemHeight),
        String('0'));
      expect(String(twin.recommendCompGridItemHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.recommendCompGridItemHeight), String('0'));
      expect(String(probe.recommendCompGridItemHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryNavListMargin === twin.sideBarPrimaryNavListMargin), String('false'));
      expect(String(probe.sideBarPrimaryNavListMargin === twin.sideBarPrimaryNavListMargin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020040 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020041
     * @tc.number SUB_MNB_MDL_2438
     * @tc.desc   writing CustomBreakPointStyle.sideBarPrimaryNavListItemWidth leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020041 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.sideBarPrimaryNavListItemWidth = '50%';
      const result: string = String(twin.sideBarPrimaryNavListItemWidth);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.sideBarPrimaryNavListHeight),
        String(''));
      expect(String(twin.sideBarPrimaryNavListHeight)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.sideBarPrimaryMenuTextSize),
        String('0'));
      expect(String(probe.sideBarPrimaryMenuTextSize)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryNavListItemWidth === twin.sideBarPrimaryNavListItemWidth), String('false'));
      expect(String(probe.sideBarPrimaryNavListItemWidth === twin.sideBarPrimaryNavListItemWidth)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020041 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020042
     * @tc.number SUB_MNB_MDL_2439
     * @tc.desc   writing CustomBreakPointStyle.sideBarPrimaryMenuTextSize leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020042 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.sideBarPrimaryMenuTextSize = 9;
      const result: string = String(twin.sideBarPrimaryMenuTextSize);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(twin.sideBarPrimaryMenuTextHeight), String('0'));
      expect(String(twin.sideBarPrimaryMenuTextHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.mainTabsBcColor),
        String(''));
      expect(String(probe.mainTabsBcColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryMenuTextSize === twin.sideBarPrimaryMenuTextSize), String('false'));
      expect(String(probe.sideBarPrimaryMenuTextSize === twin.sideBarPrimaryMenuTextSize)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020042 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020043
     * @tc.number SUB_MNB_MDL_2440
     * @tc.desc   writing CustomBreakPointStyle.sideBarPrimaryMenuTextHeight leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020043 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.sideBarPrimaryMenuTextHeight = 9;
      const result: string = String(twin.sideBarPrimaryMenuTextHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.recommendCompGridSecHeight),
        String('0'));
      expect(String(twin.recommendCompGridSecHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.recommendCompGridHeight),
        String('0'));
      expect(String(probe.recommendCompGridHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryMenuTextHeight === twin.sideBarPrimaryMenuTextHeight), String('false'));
      expect(String(probe.sideBarPrimaryMenuTextHeight === twin.sideBarPrimaryMenuTextHeight)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020043 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020044
     * @tc.number SUB_MNB_MDL_2441
     * @tc.desc   writing CustomBreakPointStyle.recommendCompGridHeight leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020044 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.recommendCompGridHeight = 9;
      const result: string = String(twin.recommendCompGridHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.sideBarPrimaryNavListMargin),
        String('0'));
      expect(String(twin.sideBarPrimaryNavListMargin)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryNavListMargin), String('0'));
      expect(String(probe.sideBarPrimaryNavListMargin)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.recommendCompGridHeight === twin.recommendCompGridHeight), String('false'));
      expect(String(probe.recommendCompGridHeight === twin.recommendCompGridHeight)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020044 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020045
     * @tc.number SUB_MNB_MDL_2442
     * @tc.desc   writing CustomBreakPointStyle.recommendCompGridItemHeight leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020045 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.recommendCompGridItemHeight = 9;
      const result: string = String(twin.recommendCompGridItemHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(twin.sideBarPrimaryMenuTextHeight), String('0'));
      expect(String(twin.sideBarPrimaryMenuTextHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.recommendCompGridSecHeight),
        String('0'));
      expect(String(probe.recommendCompGridSecHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.recommendCompGridItemHeight === twin.recommendCompGridItemHeight), String('false'));
      expect(String(probe.recommendCompGridItemHeight === twin.recommendCompGridItemHeight)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020045 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020046
     * @tc.number SUB_MNB_MDL_2443
     * @tc.desc   writing CustomBreakPointStyle.recommendCompGridSecHeight leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020046 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.recommendCompGridSecHeight = 9;
      const result: string = String(twin.recommendCompGridSecHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.mainTabsBcColor),
        String(''));
      expect(String(twin.mainTabsBcColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.sideBarPrimaryMenuTextSize),
        String('0'));
      expect(String(probe.sideBarPrimaryMenuTextSize)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.recommendCompGridSecHeight === twin.recommendCompGridSecHeight), String('false'));
      expect(String(probe.recommendCompGridSecHeight === twin.recommendCompGridSecHeight)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020046 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020047
     * @tc.number SUB_MNB_MDL_2444
     * @tc.desc   writing CustomBreakPointStyle.mainTabsBcColor leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020047 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.mainTabsBcColor = '#123456';
      const result: string = String(twin.mainTabsBcColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(twin.sideBarPrimaryNavListItemWidth), String(''));
      expect(String(twin.sideBarPrimaryNavListItemWidth)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryNavListHeight), String(''));
      expect(String(probe.sideBarPrimaryNavListHeight)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.mainTabsBcColor === twin.mainTabsBcColor), String('false'));
      expect(String(probe.mainTabsBcColor === twin.mainTabsBcColor)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020047 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020048
     * @tc.number SUB_MNB_MDL_2445
     * @tc.desc   writing SubTabsControllerStyle.secondMenuListSpace leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020048 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.secondMenuListSpace = 9;
      const result: string = String(twin.secondMenuListSpace);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.isShowSecondMenu),
        String('false'));
      expect(String(twin.isShowSecondMenu)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.isShowSecondMenu),
        String('false'));
      expect(String(probe.isShowSecondMenu)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.secondMenuListSpace === twin.secondMenuListSpace), String('false'));
      expect(String(probe.secondMenuListSpace === twin.secondMenuListSpace)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020048 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020049
     * @tc.number SUB_MNB_MDL_2446
     * @tc.desc   writing SubTabsControllerStyle.secondMenuListItemHeight leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020049 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.secondMenuListItemHeight = 9;
      const result: string = String(twin.secondMenuListItemHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.secondMenuListSpace),
        String('0'));
      expect(String(twin.secondMenuListSpace)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryMenuFlexDirection), String('0'));
      expect(String(probe.sideBarPrimaryMenuFlexDirection)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.secondMenuListItemHeight === twin.secondMenuListItemHeight), String('false'));
      expect(String(probe.secondMenuListItemHeight === twin.secondMenuListItemHeight)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020049 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020050
     * @tc.number SUB_MNB_MDL_2447
     * @tc.desc   writing SubTabsControllerStyle.sideBarPrimaryMenuFlexAlign leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020050 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.sideBarPrimaryMenuFlexAlign = 9;
      const result: string = String(twin.sideBarPrimaryMenuFlexAlign);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.primaryMenuTextAlign),
        String('0'));
      expect(String(twin.primaryMenuTextAlign)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.secondMenuListDirection),
        String('0'));
      expect(String(probe.secondMenuListDirection)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryMenuFlexAlign === twin.sideBarPrimaryMenuFlexAlign), String('false'));
      expect(String(probe.sideBarPrimaryMenuFlexAlign === twin.sideBarPrimaryMenuFlexAlign)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020050 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020051
     * @tc.number SUB_MNB_MDL_2448
     * @tc.desc   writing SubTabsControllerStyle.sideBarPrimaryMenuFlexDirection leaves every other instance field at
     *   its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020051 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.sideBarPrimaryMenuFlexDirection = 9;
      const result: string = String(twin.sideBarPrimaryMenuFlexDirection);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.secondMenuListItemWidth),
        String(''));
      expect(String(twin.secondMenuListItemWidth)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.isShowPageTitle),
        String('false'));
      expect(String(probe.isShowPageTitle)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryMenuFlexDirection === twin.sideBarPrimaryMenuFlexDirection), String('false'));
      expect(
        String(probe.sideBarPrimaryMenuFlexDirection === twin.sideBarPrimaryMenuFlexDirection)
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020051 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020052
     * @tc.number SUB_MNB_MDL_2449
     * @tc.desc   writing SubTabsControllerStyle.primaryMenuTextAlign leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020052 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.primaryMenuTextAlign = 9;
      const result: string = String(twin.primaryMenuTextAlign);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.secondMenuListItemHeight),
        String('0'));
      expect(String(twin.secondMenuListItemHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.secondMenuListItemHeight),
        String('0'));
      expect(String(probe.secondMenuListItemHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.primaryMenuTextAlign === twin.primaryMenuTextAlign), String('false'));
      expect(String(probe.primaryMenuTextAlign === twin.primaryMenuTextAlign)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020052 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020053
     * @tc.number SUB_MNB_MDL_2450
     * @tc.desc   writing SubTabsControllerStyle.isShowPageTitle leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020053 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.isShowPageTitle = true;
      const result: string = String(twin.isShowPageTitle);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.primaryMenuTextAlign),
        String('0'));
      expect(String(twin.primaryMenuTextAlign)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.secondMenuListItemWidth),
        String(''));
      expect(String(probe.secondMenuListItemWidth)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.isShowPageTitle === twin.isShowPageTitle), String('false'));
      expect(String(probe.isShowPageTitle === twin.isShowPageTitle)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020053 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020054
     * @tc.number SUB_MNB_MDL_2451
     * @tc.desc   writing SubTabsControllerStyle.isShowSecondMenu leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020054 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.isShowSecondMenu = true;
      const result: string = String(twin.isShowSecondMenu);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.secondMenuListDirection),
        String('0'));
      expect(String(twin.secondMenuListDirection)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryMenuFlexDirection), String('0'));
      expect(String(probe.sideBarPrimaryMenuFlexDirection)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.isShowSecondMenu === twin.isShowSecondMenu), String('false'));
      expect(String(probe.isShowSecondMenu === twin.isShowSecondMenu)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020054 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020055
     * @tc.number SUB_MNB_MDL_2452
     * @tc.desc   writing SubTabsControllerStyle.secondMenuListItemWidth leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020055 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.secondMenuListItemWidth = '50%';
      const result: string = String(twin.secondMenuListItemWidth);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.sideBarPrimaryMenuFlexAlign),
        String('0'));
      expect(String(twin.sideBarPrimaryMenuFlexAlign)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.secondMenuListSpace),
        String('0'));
      expect(String(probe.secondMenuListSpace)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.secondMenuListItemWidth === twin.secondMenuListItemWidth), String('false'));
      expect(String(probe.secondMenuListItemWidth === twin.secondMenuListItemWidth)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020055 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020056
     * @tc.number SUB_MNB_MDL_2453
     * @tc.desc   writing SubTabsControllerStyle.secondMenuListDirection leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020056 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.secondMenuListDirection = 9;
      const result: string = String(twin.secondMenuListDirection);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.isShowPageTitle),
        String('false'));
      expect(String(twin.isShowPageTitle)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.isShowPageTitle),
        String('false'));
      expect(String(probe.isShowPageTitle)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.secondMenuListDirection === twin.secondMenuListDirection), String('false'));
      expect(String(probe.secondMenuListDirection === twin.secondMenuListDirection)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020056 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020057
     * @tc.number SUB_MNB_MDL_2454
     * @tc.desc   writing CustomLength.left leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020057 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.left = 77;
      const result: string = String(twin.left);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.top), String('0'));
      expect(String(twin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.height), String('0'));
      expect(String(probe.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.left === twin.left),
        String('false'));
      expect(String(probe.left === twin.left)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020057 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020058
     * @tc.number SUB_MNB_MDL_2455
     * @tc.desc   writing CustomLength.right leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020058 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.right = 77;
      const result: string = String(twin.right);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.width), String('0'));
      expect(String(twin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.height), String('0'));
      expect(String(probe.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.right === twin.right),
        String('false'));
      expect(String(probe.right === twin.right)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020058 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020059
     * @tc.number SUB_MNB_MDL_2456
     * @tc.desc   writing CustomLength.width leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020059 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.width = 77;
      const result: string = String(twin.width);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.bottom), String('0'));
      expect(String(twin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.height), String('0'));
      expect(String(probe.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.width === twin.width),
        String('false'));
      expect(String(probe.width === twin.width)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020059 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020060
     * @tc.number SUB_MNB_MDL_2457
     * @tc.desc   writing CustomLength.height leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020060 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.height = 77;
      const result: string = String(twin.height);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.width), String('0'));
      expect(String(twin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.width), String('0'));
      expect(String(probe.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.height === twin.height),
        String('false'));
      expect(String(probe.height === twin.height)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020060 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020061
     * @tc.number SUB_MNB_MDL_2458
     * @tc.desc   writing CustomLength.top leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020061 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.top = 77;
      const result: string = String(twin.top);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.left), String('0'));
      expect(String(twin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.width), String('0'));
      expect(String(probe.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.top === twin.top),
        String('false'));
      expect(String(probe.top === twin.top)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020061 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020062
     * @tc.number SUB_MNB_MDL_2459
     * @tc.desc   writing CustomLength.bottom leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020062 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.bottom = 77;
      const result: string = String(twin.bottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.height), String('0'));
      expect(String(twin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.width), String('0'));
      expect(String(probe.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.bottom === twin.bottom),
        String('false'));
      expect(String(probe.bottom === twin.bottom)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020062 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020063
     * @tc.number SUB_MNB_MDL_2460
     * @tc.desc   writing CustomFontStyle.fillColor leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020063 begin');
      const probe = new CustomFontStyle(); const twin = new CustomFontStyle();
      probe.fillColor = 'pinned';
      const result: string = String(twin.fillColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.fontColor), String(''));
      expect(String(twin.fontColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.fontColor), String(''));
      expect(String(probe.fontColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.fillColor === twin.fillColor), String('false'));
      expect(String(probe.fillColor === twin.fillColor)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020063 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020064
     * @tc.number SUB_MNB_MDL_2461
     * @tc.desc   writing CustomFontStyle.fontColor leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020064 begin');
      const probe = new CustomFontStyle(); const twin = new CustomFontStyle();
      probe.fontColor = 'pinned';
      const result: string = String(twin.fontColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.fillColor), String(''));
      expect(String(twin.fillColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.backgroundColor),
        String(''));
      expect(String(probe.backgroundColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.fontColor === twin.fontColor), String('false'));
      expect(String(probe.fontColor === twin.fontColor)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020064 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020065
     * @tc.number SUB_MNB_MDL_2462
     * @tc.desc   writing CustomFontStyle.fontSize leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020065 begin');
      const probe = new CustomFontStyle(); const twin = new CustomFontStyle();
      probe.fontSize = 21;
      const result: string = String(twin.fontSize);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.fillColor), String(''));
      expect(String(twin.fillColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.fontColor), String(''));
      expect(String(probe.fontColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.fontSize === twin.fontSize),
        String('false'));
      expect(String(probe.fontSize === twin.fontSize)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020065 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020066
     * @tc.number SUB_MNB_MDL_2463
     * @tc.desc   writing CustomFontStyle.backgroundColor leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020066 begin');
      const probe = new CustomFontStyle(); const twin = new CustomFontStyle();
      probe.backgroundColor = 'pinned';
      const result: string = String(twin.backgroundColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.fillColor), String(''));
      expect(String(twin.fillColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.fillColor), String(''));
      expect(String(probe.fillColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.backgroundColor === twin.backgroundColor), String('false'));
      expect(String(probe.backgroundColor === twin.backgroundColor)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020066 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020067
     * @tc.number SUB_MNB_MDL_2464
     * @tc.desc   writing CustomBreakPointStyle.sideBarPrimaryNavListHeight leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020067 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.sideBarPrimaryNavListHeight = 'auto';
      const result: string = String(twin.sideBarPrimaryNavListHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.recommendCompGridSecHeight),
        String('0'));
      expect(String(twin.recommendCompGridSecHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.recommendCompGridHeight),
        String('0'));
      expect(String(probe.recommendCompGridHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryNavListHeight === twin.sideBarPrimaryNavListHeight), String('false'));
      expect(String(probe.sideBarPrimaryNavListHeight === twin.sideBarPrimaryNavListHeight)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020067 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020068
     * @tc.number SUB_MNB_MDL_2465
     * @tc.desc   writing CustomBreakPointStyle.sideBarPrimaryNavListMargin leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020068 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.sideBarPrimaryNavListMargin = 9;
      const result: string = String(twin.sideBarPrimaryNavListMargin);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(twin.sideBarPrimaryNavListItemWidth), String(''));
      expect(String(twin.sideBarPrimaryNavListItemWidth)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryNavListItemWidth), String(''));
      expect(String(probe.sideBarPrimaryNavListItemWidth)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryNavListMargin === twin.sideBarPrimaryNavListMargin), String('false'));
      expect(String(probe.sideBarPrimaryNavListMargin === twin.sideBarPrimaryNavListMargin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020068 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020069
     * @tc.number SUB_MNB_MDL_2466
     * @tc.desc   writing CustomBreakPointStyle.sideBarPrimaryNavListItemWidth leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020069 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.sideBarPrimaryNavListItemWidth = '50%';
      const result: string = String(twin.sideBarPrimaryNavListItemWidth);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.recommendCompGridHeight),
        String('0'));
      expect(String(twin.recommendCompGridHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.recommendCompGridSecHeight),
        String('0'));
      expect(String(probe.recommendCompGridSecHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryNavListItemWidth === twin.sideBarPrimaryNavListItemWidth), String('false'));
      expect(String(probe.sideBarPrimaryNavListItemWidth === twin.sideBarPrimaryNavListItemWidth)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020069 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020070
     * @tc.number SUB_MNB_MDL_2467
     * @tc.desc   writing CustomBreakPointStyle.sideBarPrimaryMenuTextSize leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020070 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.sideBarPrimaryMenuTextSize = 9;
      const result: string = String(twin.sideBarPrimaryMenuTextSize);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.mainTabsBcColor),
        String(''));
      expect(String(twin.mainTabsBcColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryMenuTextHeight), String('0'));
      expect(String(probe.sideBarPrimaryMenuTextHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryMenuTextSize === twin.sideBarPrimaryMenuTextSize), String('false'));
      expect(String(probe.sideBarPrimaryMenuTextSize === twin.sideBarPrimaryMenuTextSize)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020070 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020071
     * @tc.number SUB_MNB_MDL_2468
     * @tc.desc   writing CustomBreakPointStyle.sideBarPrimaryMenuTextHeight leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020071 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.sideBarPrimaryMenuTextHeight = 9;
      const result: string = String(twin.sideBarPrimaryMenuTextHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(twin.sideBarPrimaryNavListItemWidth), String(''));
      expect(String(twin.sideBarPrimaryNavListItemWidth)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryNavListHeight), String(''));
      expect(String(probe.sideBarPrimaryNavListHeight)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryMenuTextHeight === twin.sideBarPrimaryMenuTextHeight), String('false'));
      expect(String(probe.sideBarPrimaryMenuTextHeight === twin.sideBarPrimaryMenuTextHeight)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020071 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020072
     * @tc.number SUB_MNB_MDL_2469
     * @tc.desc   writing CustomBreakPointStyle.recommendCompGridHeight leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020072 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.recommendCompGridHeight = 9;
      const result: string = String(twin.recommendCompGridHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.recommendCompGridItemHeight),
        String('0'));
      expect(String(twin.recommendCompGridItemHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.recommendCompGridItemHeight), String('0'));
      expect(String(probe.recommendCompGridItemHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.recommendCompGridHeight === twin.recommendCompGridHeight), String('false'));
      expect(String(probe.recommendCompGridHeight === twin.recommendCompGridHeight)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020072 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020073
     * @tc.number SUB_MNB_MDL_2470
     * @tc.desc   writing CustomBreakPointStyle.recommendCompGridItemHeight leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020073 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.recommendCompGridItemHeight = 9;
      const result: string = String(twin.recommendCompGridItemHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.sideBarPrimaryNavListHeight),
        String(''));
      expect(String(twin.sideBarPrimaryNavListHeight)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryNavListItemWidth), String(''));
      expect(String(probe.sideBarPrimaryNavListItemWidth)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.recommendCompGridItemHeight === twin.recommendCompGridItemHeight), String('false'));
      expect(String(probe.recommendCompGridItemHeight === twin.recommendCompGridItemHeight)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020073 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020074
     * @tc.number SUB_MNB_MDL_2471
     * @tc.desc   writing CustomBreakPointStyle.recommendCompGridSecHeight leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020074 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.recommendCompGridSecHeight = 9;
      const result: string = String(twin.recommendCompGridSecHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.sideBarPrimaryMenuTextSize),
        String('0'));
      expect(String(twin.sideBarPrimaryMenuTextSize)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.mainTabsBcColor),
        String(''));
      expect(String(probe.mainTabsBcColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.recommendCompGridSecHeight === twin.recommendCompGridSecHeight), String('false'));
      expect(String(probe.recommendCompGridSecHeight === twin.recommendCompGridSecHeight)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020074 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020075
     * @tc.number SUB_MNB_MDL_2472
     * @tc.desc   Anchor: clearing an optional offset back to undefined removes the default zero as well
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020075 begin');
      const length: CustomLength = new CustomLength();
      length.width = undefined;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'width=%{public}s height=%{public}s', String(length.width),
        String(length.height));
      expect(String(length.width)).assertEqual('undefined');
      expect(length.height).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check length.left');
      expect(length.left).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020075 end');
    });
  });
}
