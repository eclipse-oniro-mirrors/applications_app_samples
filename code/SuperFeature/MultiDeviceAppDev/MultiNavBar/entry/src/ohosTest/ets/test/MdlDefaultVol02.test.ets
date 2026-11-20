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

export default function mdlDefaultVol02Test() {
  describe('MultiNavBarMdlDefaultVol02', () => {

    /**
     * @tc.name   testMdlDefaultVol020001
     * @tc.number SUB_MNB_MDL_2398
     * @tc.desc   writing CustomLength.left leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020001 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.left = 77;
      const result: string = String(twin.left);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.right), String('0'));
      expect(String(twin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.height), String('0'));
      expect(String(probe.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.left === twin.left),
        String('false'));
      expect(String(probe.left === twin.left)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020001 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020002
     * @tc.number SUB_MNB_MDL_2399
     * @tc.desc   writing CustomLength.right leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020002 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.right = 77;
      const result: string = String(twin.right);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.top), String('0'));
      expect(String(twin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.height), String('0'));
      expect(String(probe.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.right === twin.right),
        String('false'));
      expect(String(probe.right === twin.right)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020002 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020003
     * @tc.number SUB_MNB_MDL_2400
     * @tc.desc   writing CustomLength.width leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020003 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.width = 77;
      const result: string = String(twin.width);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.right), String('0'));
      expect(String(twin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.height), String('0'));
      expect(String(probe.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.width === twin.width),
        String('false'));
      expect(String(probe.width === twin.width)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020003 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020004
     * @tc.number SUB_MNB_MDL_2401
     * @tc.desc   writing CustomLength.height leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020004 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.height = 77;
      const result: string = String(twin.height);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.bottom), String('0'));
      expect(String(twin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.width), String('0'));
      expect(String(probe.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.height === twin.height),
        String('false'));
      expect(String(probe.height === twin.height)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020004 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020005
     * @tc.number SUB_MNB_MDL_2402
     * @tc.desc   writing CustomLength.top leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020005 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.top = 77;
      const result: string = String(twin.top);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.width), String('0'));
      expect(String(twin.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.width), String('0'));
      expect(String(probe.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.top === twin.top),
        String('false'));
      expect(String(probe.top === twin.top)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020005 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020006
     * @tc.number SUB_MNB_MDL_2403
     * @tc.desc   writing CustomLength.bottom leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020006 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.bottom = 77;
      const result: string = String(twin.bottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.left), String('0'));
      expect(String(twin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.width), String('0'));
      expect(String(probe.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.bottom === twin.bottom),
        String('false'));
      expect(String(probe.bottom === twin.bottom)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020006 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020007
     * @tc.number SUB_MNB_MDL_2404
     * @tc.desc   writing CustomFontStyle.fillColor leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020007 begin');
      const probe = new CustomFontStyle(); const twin = new CustomFontStyle();
      probe.fillColor = 'pinned';
      const result: string = String(twin.fillColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.fontColor), String(''));
      expect(String(twin.fontColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.backgroundColor),
        String(''));
      expect(String(probe.backgroundColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.fillColor === twin.fillColor), String('false'));
      expect(String(probe.fillColor === twin.fillColor)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020007 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020008
     * @tc.number SUB_MNB_MDL_2405
     * @tc.desc   writing CustomFontStyle.fontColor leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020008 begin');
      const probe = new CustomFontStyle(); const twin = new CustomFontStyle();
      probe.fontColor = 'pinned';
      const result: string = String(twin.fontColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.fillColor), String(''));
      expect(String(twin.fillColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.fontSize), String('0'));
      expect(String(probe.fontSize)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.fontColor === twin.fontColor), String('false'));
      expect(String(probe.fontColor === twin.fontColor)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020008 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020009
     * @tc.number SUB_MNB_MDL_2406
     * @tc.desc   writing CustomFontStyle.fontSize leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020009 begin');
      const probe = new CustomFontStyle(); const twin = new CustomFontStyle();
      probe.fontSize = 21;
      const result: string = String(twin.fontSize);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.fillColor), String(''));
      expect(String(twin.fillColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.fillColor), String(''));
      expect(String(probe.fillColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.fontSize === twin.fontSize),
        String('false'));
      expect(String(probe.fontSize === twin.fontSize)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020009 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020010
     * @tc.number SUB_MNB_MDL_2407
     * @tc.desc   writing CustomFontStyle.backgroundColor leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020010 begin');
      const probe = new CustomFontStyle(); const twin = new CustomFontStyle();
      probe.backgroundColor = 'pinned';
      const result: string = String(twin.backgroundColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.fillColor), String(''));
      expect(String(twin.fillColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.fontSize), String('0'));
      expect(String(probe.fontSize)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.backgroundColor === twin.backgroundColor), String('false'));
      expect(String(probe.backgroundColor === twin.backgroundColor)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020010 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020011
     * @tc.number SUB_MNB_MDL_2408
     * @tc.desc   writing CustomBreakPointStyle.sideBarPrimaryNavListHeight leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020011 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020011 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020012
     * @tc.number SUB_MNB_MDL_2409
     * @tc.desc   writing CustomBreakPointStyle.sideBarPrimaryNavListMargin leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020012 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020012 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020013
     * @tc.number SUB_MNB_MDL_2410
     * @tc.desc   writing CustomBreakPointStyle.sideBarPrimaryNavListItemWidth leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020013 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020013 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020014
     * @tc.number SUB_MNB_MDL_2411
     * @tc.desc   writing CustomBreakPointStyle.sideBarPrimaryMenuTextSize leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020014 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020014 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020015
     * @tc.number SUB_MNB_MDL_2412
     * @tc.desc   writing CustomBreakPointStyle.sideBarPrimaryMenuTextHeight leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020015 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020015 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020016
     * @tc.number SUB_MNB_MDL_2413
     * @tc.desc   writing CustomBreakPointStyle.recommendCompGridHeight leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020016 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020016 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020017
     * @tc.number SUB_MNB_MDL_2414
     * @tc.desc   writing CustomBreakPointStyle.recommendCompGridItemHeight leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020017 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020017 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020018
     * @tc.number SUB_MNB_MDL_2415
     * @tc.desc   writing CustomBreakPointStyle.recommendCompGridSecHeight leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020018 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020018 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020019
     * @tc.number SUB_MNB_MDL_2416
     * @tc.desc   writing CustomBreakPointStyle.mainTabsBcColor leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020019 begin');
      const probe = new CustomBreakPointStyle(); const twin = new CustomBreakPointStyle();
      probe.mainTabsBcColor = '#123456';
      const result: string = String(twin.mainTabsBcColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.recommendCompGridItemHeight),
        String('0'));
      expect(String(twin.recommendCompGridItemHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryMenuTextHeight), String('0'));
      expect(String(probe.sideBarPrimaryMenuTextHeight)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.mainTabsBcColor === twin.mainTabsBcColor), String('false'));
      expect(String(probe.mainTabsBcColor === twin.mainTabsBcColor)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020019 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020020
     * @tc.number SUB_MNB_MDL_2417
     * @tc.desc   writing SubTabsControllerStyle.secondMenuListSpace leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020020 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.secondMenuListSpace = 9;
      const result: string = String(twin.secondMenuListSpace);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.sideBarPrimaryMenuFlexAlign),
        String('0'));
      expect(String(twin.sideBarPrimaryMenuFlexAlign)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryMenuFlexAlign), String('0'));
      expect(String(probe.sideBarPrimaryMenuFlexAlign)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.secondMenuListSpace === twin.secondMenuListSpace), String('false'));
      expect(String(probe.secondMenuListSpace === twin.secondMenuListSpace)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020020 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020021
     * @tc.number SUB_MNB_MDL_2418
     * @tc.desc   writing SubTabsControllerStyle.secondMenuListItemHeight leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020021 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.secondMenuListItemHeight = 9;
      const result: string = String(twin.secondMenuListItemHeight);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.isShowPageTitle),
        String('false'));
      expect(String(twin.isShowPageTitle)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.secondMenuListItemWidth),
        String(''));
      expect(String(probe.secondMenuListItemWidth)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.secondMenuListItemHeight === twin.secondMenuListItemHeight), String('false'));
      expect(String(probe.secondMenuListItemHeight === twin.secondMenuListItemHeight)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020021 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020022
     * @tc.number SUB_MNB_MDL_2419
     * @tc.desc   writing SubTabsControllerStyle.sideBarPrimaryMenuFlexAlign leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020022 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.sideBarPrimaryMenuFlexAlign = 9;
      const result: string = String(twin.sideBarPrimaryMenuFlexAlign);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.secondMenuListDirection),
        String('0'));
      expect(String(twin.secondMenuListDirection)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.primaryMenuTextAlign),
        String('0'));
      expect(String(probe.primaryMenuTextAlign)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryMenuFlexAlign === twin.sideBarPrimaryMenuFlexAlign), String('false'));
      expect(String(probe.sideBarPrimaryMenuFlexAlign === twin.sideBarPrimaryMenuFlexAlign)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020022 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020023
     * @tc.number SUB_MNB_MDL_2420
     * @tc.desc   writing SubTabsControllerStyle.sideBarPrimaryMenuFlexDirection leaves every other instance field at
     *   its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020023 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.sideBarPrimaryMenuFlexDirection = 9;
      const result: string = String(twin.sideBarPrimaryMenuFlexDirection);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.sideBarPrimaryMenuFlexAlign),
        String('0'));
      expect(String(twin.sideBarPrimaryMenuFlexAlign)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.secondMenuListSpace),
        String('0'));
      expect(String(probe.secondMenuListSpace)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryMenuFlexDirection === twin.sideBarPrimaryMenuFlexDirection), String('false'));
      expect(
        String(probe.sideBarPrimaryMenuFlexDirection === twin.sideBarPrimaryMenuFlexDirection)
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020023 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020024
     * @tc.number SUB_MNB_MDL_2421
     * @tc.desc   writing SubTabsControllerStyle.primaryMenuTextAlign leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020024 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.primaryMenuTextAlign = 9;
      const result: string = String(twin.primaryMenuTextAlign);
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
        String(probe.primaryMenuTextAlign === twin.primaryMenuTextAlign), String('false'));
      expect(String(probe.primaryMenuTextAlign === twin.primaryMenuTextAlign)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020024 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020025
     * @tc.number SUB_MNB_MDL_2422
     * @tc.desc   writing SubTabsControllerStyle.isShowPageTitle leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020025 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.isShowPageTitle = true;
      const result: string = String(twin.isShowPageTitle);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.secondMenuListSpace),
        String('0'));
      expect(String(twin.secondMenuListSpace)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.sideBarPrimaryMenuFlexAlign), String('0'));
      expect(String(probe.sideBarPrimaryMenuFlexAlign)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.isShowPageTitle === twin.isShowPageTitle), String('false'));
      expect(String(probe.isShowPageTitle === twin.isShowPageTitle)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020025 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020026
     * @tc.number SUB_MNB_MDL_2423
     * @tc.desc   writing SubTabsControllerStyle.isShowSecondMenu leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020026 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.isShowSecondMenu = true;
      const result: string = String(twin.isShowSecondMenu);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(twin.sideBarPrimaryMenuFlexDirection), String('0'));
      expect(String(twin.sideBarPrimaryMenuFlexDirection)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.secondMenuListDirection),
        String('0'));
      expect(String(probe.secondMenuListDirection)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.isShowSecondMenu === twin.isShowSecondMenu), String('false'));
      expect(String(probe.isShowSecondMenu === twin.isShowSecondMenu)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020026 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020027
     * @tc.number SUB_MNB_MDL_2424
     * @tc.desc   writing SubTabsControllerStyle.secondMenuListItemWidth leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020027 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.secondMenuListItemWidth = '50%';
      const result: string = String(twin.secondMenuListItemWidth);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.isShowSecondMenu),
        String('false'));
      expect(String(twin.isShowSecondMenu)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.primaryMenuTextAlign),
        String('0'));
      expect(String(probe.primaryMenuTextAlign)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.secondMenuListItemWidth === twin.secondMenuListItemWidth), String('false'));
      expect(String(probe.secondMenuListItemWidth === twin.secondMenuListItemWidth)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020027 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020028
     * @tc.number SUB_MNB_MDL_2425
     * @tc.desc   writing SubTabsControllerStyle.secondMenuListDirection leaves every other instance field at its
     *   default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020028 begin');
      const probe = new SubTabsControllerStyle(); const twin = new SubTabsControllerStyle();
      probe.secondMenuListDirection = 9;
      const result: string = String(twin.secondMenuListDirection);
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
        String(probe.secondMenuListDirection === twin.secondMenuListDirection), String('false'));
      expect(String(probe.secondMenuListDirection === twin.secondMenuListDirection)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020028 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020029
     * @tc.number SUB_MNB_MDL_2426
     * @tc.desc   writing CustomLength.left leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020029 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.left = 77;
      const result: string = String(twin.left);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.bottom), String('0'));
      expect(String(twin.bottom)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.height), String('0'));
      expect(String(probe.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.left === twin.left),
        String('false'));
      expect(String(probe.left === twin.left)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020029 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020030
     * @tc.number SUB_MNB_MDL_2427
     * @tc.desc   writing CustomLength.right leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020030 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.right = 77;
      const result: string = String(twin.right);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.height), String('0'));
      expect(String(twin.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.height), String('0'));
      expect(String(probe.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.right === twin.right),
        String('false'));
      expect(String(probe.right === twin.right)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020030 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020031
     * @tc.number SUB_MNB_MDL_2428
     * @tc.desc   writing CustomLength.width leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020031 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.width = 77;
      const result: string = String(twin.width);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.left), String('0'));
      expect(String(twin.left)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.height), String('0'));
      expect(String(probe.height)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.width === twin.width),
        String('false'));
      expect(String(probe.width === twin.width)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020031 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020032
     * @tc.number SUB_MNB_MDL_2429
     * @tc.desc   writing CustomLength.height leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020032 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.height = 77;
      const result: string = String(twin.height);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.top), String('0'));
      expect(String(twin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.width), String('0'));
      expect(String(probe.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.height === twin.height),
        String('false'));
      expect(String(probe.height === twin.height)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020032 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020033
     * @tc.number SUB_MNB_MDL_2430
     * @tc.desc   writing CustomLength.top leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020033 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.top = 77;
      const result: string = String(twin.top);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.right), String('0'));
      expect(String(twin.right)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.width), String('0'));
      expect(String(probe.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.top === twin.top),
        String('false'));
      expect(String(probe.top === twin.top)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020033 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020034
     * @tc.number SUB_MNB_MDL_2431
     * @tc.desc   writing CustomLength.bottom leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020034 begin');
      const probe = new CustomLength(); const twin = new CustomLength();
      probe.bottom = 77;
      const result: string = String(twin.bottom);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.top), String('0'));
      expect(String(twin.top)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.width), String('0'));
      expect(String(probe.width)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.bottom === twin.bottom),
        String('false'));
      expect(String(probe.bottom === twin.bottom)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020034 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020035
     * @tc.number SUB_MNB_MDL_2432
     * @tc.desc   writing CustomFontStyle.fillColor leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020035 begin');
      const probe = new CustomFontStyle(); const twin = new CustomFontStyle();
      probe.fillColor = 'pinned';
      const result: string = String(twin.fillColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.fontColor), String(''));
      expect(String(twin.fontColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.fontSize), String('0'));
      expect(String(probe.fontSize)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.fillColor === twin.fillColor), String('false'));
      expect(String(probe.fillColor === twin.fillColor)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020035 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020036
     * @tc.number SUB_MNB_MDL_2433
     * @tc.desc   writing CustomFontStyle.fontColor leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020036 begin');
      const probe = new CustomFontStyle(); const twin = new CustomFontStyle();
      probe.fontColor = 'pinned';
      const result: string = String(twin.fontColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.fillColor), String(''));
      expect(String(twin.fillColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.fillColor), String(''));
      expect(String(probe.fillColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.fontColor === twin.fontColor), String('false'));
      expect(String(probe.fontColor === twin.fontColor)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020036 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020037
     * @tc.number SUB_MNB_MDL_2434
     * @tc.desc   writing CustomFontStyle.fontSize leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020037 begin');
      const probe = new CustomFontStyle(); const twin = new CustomFontStyle();
      probe.fontSize = 21;
      const result: string = String(twin.fontSize);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.fillColor), String(''));
      expect(String(twin.fillColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.backgroundColor),
        String(''));
      expect(String(probe.backgroundColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.fontSize === twin.fontSize),
        String('false'));
      expect(String(probe.fontSize === twin.fontSize)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020037 end');
    });

    /**
     * @tc.name   testMdlDefaultVol020038
     * @tc.number SUB_MNB_MDL_2435
     * @tc.desc   writing CustomFontStyle.backgroundColor leaves every other instance field at its default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMdlDefaultVol020038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020038 begin');
      const probe = new CustomFontStyle(); const twin = new CustomFontStyle();
      probe.backgroundColor = 'pinned';
      const result: string = String(twin.backgroundColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(result).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(twin.fillColor), String(''));
      expect(String(twin.fillColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe === twin), String('false'));
      expect(String(probe === twin)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(probe.fontColor), String(''));
      expect(String(probe.fontColor)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(probe.backgroundColor === twin.backgroundColor), String('false'));
      expect(String(probe.backgroundColor === twin.backgroundColor)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMdlDefaultVol020038 end');
    });

  });
}
