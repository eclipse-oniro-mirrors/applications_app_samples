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
import { StyleConfiguration } from '../../../main/ets/common/Configuration';
import { CustomFontStyle } from '../../../main/ets/model/StyleType';
import {
  BP_SM,
  BP_MD,
  BP_LG,
  SIDEBAR_LIST,
  SIDEBAR_TABS,
  NON_SM_BREAKPOINTS,
  SUB_TABS_LIST_ACTIVE_SIZE,
  SUB_TABS_LIST_INACTIVE_SIZE,
  SUB_TABS_LIST_ACTIVE_BG,
  SUB_TABS_LIST_ACTIVE_FONT,
  SUB_TABS_LIST_INACTIVE_BG,
  SUB_TABS_LIST_INACTIVE_FONT,
  SUB_TABS_TABS_ACTIVE_SIZE,
  SUB_TABS_TABS_INACTIVE_SIZE,
  SUB_TABS_TABS_ACTIVE_BG,
  SUB_TABS_TABS_ACTIVE_FONT,
  SUB_TABS_TABS_INACTIVE_BG,
  SUB_TABS_TABS_INACTIVE_FONT
} from '../util/NavSpec';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

/**
 * L1 cases for StyleConfiguration.getCurrentSubTabsStyle (common/Configuration.ets:132).
 * The compact branch is shared by 'sm' and by the wide layout in list mode; the wide branch
 * is used for every other combination. Four field states exist in total.
 */
export default function sstsCellReal01Test() {
  describe('MultiNavBarSstsCellReal01', () => {
    /**
     * @tc.name   testSstsReal1801
     * @tc.number SUB_MNB_SSTS_1801
     * @tc.desc   Compact branch, selected cell: font size 24 on a transparent background
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSstsReal1801', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1801 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_SM, SIDEBAR_LIST, 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'size=%{public}s expected=%{public}s',
        String(style.fontSize), String(SUB_TABS_LIST_ACTIVE_SIZE));
      expect(style.fontSize).assertEqual(SUB_TABS_LIST_ACTIVE_SIZE);
      expect(style.backgroundColor).assertEqual(SUB_TABS_LIST_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.fontColor');
      expect(style.fontColor).assertEqual(SUB_TABS_LIST_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1801 end');
    });

    /**
     * @tc.name   testSstsReal1802
     * @tc.number SUB_MNB_SSTS_1802
     * @tc.desc   Compact branch, unselected cell: font size drops to 18 with a muted colour
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSstsReal1802', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1802 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_SM, SIDEBAR_LIST, 1, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'size=%{public}s font=%{public}s',
        String(style.fontSize), style.fontColor);
      expect(style.fontSize).assertEqual(SUB_TABS_LIST_INACTIVE_SIZE);
      expect(style.backgroundColor).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.fontColor');
      expect(style.fontColor).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1802 end');
    });

    /**
     * @tc.name   testSstsReal1803
     * @tc.number SUB_MNB_SSTS_1803
     * @tc.desc   A wide layout in list mode keeps the compact branch typography
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSstsReal1803', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1803 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_MD, SIDEBAR_LIST, 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'size=%{public}s expected=%{public}s',
        String(style.fontSize), String(SUB_TABS_LIST_ACTIVE_SIZE));
      expect(style.fontSize).assertEqual(SUB_TABS_LIST_ACTIVE_SIZE);
      expect(style.fontColor).assertEqual(SUB_TABS_LIST_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.backgroundColor');
      expect(style.backgroundColor).assertEqual(SUB_TABS_LIST_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1803 end');
    });

    /**
     * @tc.name   testSstsReal1804
     * @tc.number SUB_MNB_SSTS_1804
     * @tc.desc   Wide branch, selected cell: font size 16 with the accent background
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSstsReal1804', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1804 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_MD, SIDEBAR_TABS, 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'bg=%{public}s expected=%{public}s', style.backgroundColor,
        SUB_TABS_TABS_ACTIVE_BG);
      expect(style.fontSize).assertEqual(SUB_TABS_TABS_ACTIVE_SIZE);
      expect(style.backgroundColor).assertEqual(SUB_TABS_TABS_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.fontColor');
      expect(style.fontColor).assertEqual(SUB_TABS_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1804 end');
    });

    /**
     * @tc.name   testSstsReal1805
     * @tc.number SUB_MNB_SSTS_1805
     * @tc.desc   Wide branch, unselected cell: same size 16 but a plain background and black text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSstsReal1805', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1805 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_MD, SIDEBAR_TABS, 1, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'size=%{public}s bg=%{public}s',
        String(style.fontSize), style.backgroundColor);
      expect(style.fontSize).assertEqual(SUB_TABS_TABS_INACTIVE_SIZE);
      expect(style.backgroundColor).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.fontColor');
      expect(style.fontColor).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1805 end');
    });

    /**
     * @tc.name   testSstsReal1806
     * @tc.number SUB_MNB_SSTS_1806
     * @tc.desc   lg plus tabs mode uses the wide branch and highlights the matching index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSstsReal1806', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1806 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_LG, SIDEBAR_TABS, 2, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'font=%{public}s expected=%{public}s', style.fontColor,
        SUB_TABS_TABS_ACTIVE_FONT);
      expect(style.fontColor).assertEqual(SUB_TABS_TABS_ACTIVE_FONT);
      expect(style.backgroundColor).assertEqual(SUB_TABS_TABS_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.fontSize');
      expect(style.fontSize).assertEqual(SUB_TABS_TABS_ACTIVE_SIZE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1806 end');
    });

    /**
     * @tc.name   testSstsReal1807
     * @tc.number SUB_MNB_SSTS_1807
     * @tc.desc   Anchor: on sm the side bar mode is ignored, so tabs mode keeps the compact branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSstsReal1807', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1807 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_SM, SIDEBAR_TABS, 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'size=%{public}s expected=%{public}s',
        String(style.fontSize), String(SUB_TABS_LIST_ACTIVE_SIZE));
      expect(style.fontSize).assertEqual(SUB_TABS_LIST_ACTIVE_SIZE);
      expect(style.fontColor).assertEqual(SUB_TABS_LIST_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.backgroundColor');
      expect(style.backgroundColor).assertEqual(SUB_TABS_LIST_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1807 end');
    });

    /**
     * @tc.name   testSstsReal1808
     * @tc.number SUB_MNB_SSTS_1808
     * @tc.desc   Anchor: an empty side bar mode on a wide layout drops to the wide branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsReal1808', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1808 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_MD, '', 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'size=%{public}s bg=%{public}s',
        String(style.fontSize), style.backgroundColor);
      expect(style.fontSize).assertEqual(SUB_TABS_TABS_ACTIVE_SIZE);
      expect(style.backgroundColor).assertEqual(SUB_TABS_TABS_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.fontColor');
      expect(style.fontColor).assertEqual(SUB_TABS_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1808 end');
    });

    /**
     * @tc.name   testSstsReal1809
     * @tc.number SUB_MNB_SSTS_1809
     * @tc.desc   Anchor: uppercase 'LIST' is not the list mode, so the wide branch is used
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsReal1809', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1809 begin');
      const upper: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_MD, 'LIST', 0, 1);
      const lower: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_MD, SIDEBAR_LIST, 0, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'upperSize=%{public}s lowerSize=%{public}s',
        String(upper.fontSize), String(lower.fontSize));
      expect(upper.fontSize).assertEqual(SUB_TABS_TABS_INACTIVE_SIZE);
      expect(lower.fontSize).assertEqual(SUB_TABS_LIST_INACTIVE_SIZE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check upper.backgroundColor');
      expect(upper.backgroundColor).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1809 end');
    });

    /**
     * @tc.name   testSstsReal1810
     * @tc.number SUB_MNB_SSTS_1810
     * @tc.desc   Boundary: a negative index never equals a non-negative current index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsReal1810', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1810 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_SM, SIDEBAR_LIST, -1, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'size=%{public}s expected=%{public}s',
        String(style.fontSize), String(SUB_TABS_LIST_INACTIVE_SIZE));
      expect(style.fontSize).assertEqual(SUB_TABS_LIST_INACTIVE_SIZE);
      expect(style.fontColor).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.backgroundColor');
      expect(style.backgroundColor).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1810 end');
    });

    /**
     * @tc.name   testSstsReal1811
     * @tc.number SUB_MNB_SSTS_1811
     * @tc.desc   Extreme: equal large indices are still highlighted
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsReal1811', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1811 begin');
      const style: CustomFontStyle =
        StyleConfiguration.getCurrentSubTabsStyle(BP_MD, SIDEBAR_TABS, 999999, 999999);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'font=%{public}s expected=%{public}s', style.fontColor,
        SUB_TABS_TABS_ACTIVE_FONT);
      expect(style.fontColor).assertEqual(SUB_TABS_TABS_ACTIVE_FONT);
      expect(style.backgroundColor).assertEqual(SUB_TABS_TABS_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.fontSize');
      expect(style.fontSize).assertEqual(SUB_TABS_TABS_ACTIVE_SIZE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1811 end');
    });

    /**
     * @tc.name   testSstsReal1812
     * @tc.number SUB_MNB_SSTS_1812
     * @tc.desc   Combination: the four field states have distinct font sizes 24/18/16/16
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsReal1812', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1812 begin');
      const compactActive: number =
        StyleConfiguration.getCurrentSubTabsStyle(BP_SM, SIDEBAR_LIST, 0, 0).fontSize as number;
      const compactIdle: number =
        StyleConfiguration.getCurrentSubTabsStyle(BP_SM, SIDEBAR_LIST, 1, 0).fontSize as number;
      const wideActive: number =
        StyleConfiguration.getCurrentSubTabsStyle(BP_MD, SIDEBAR_TABS, 0, 0).fontSize as number;
      const wideIdle: number =
        StyleConfiguration.getCurrentSubTabsStyle(BP_MD, SIDEBAR_TABS, 1, 0).fontSize as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'compact=%{public}s/%{public}s wide=%{public}s/%{public}s',
        String(compactActive), String(compactIdle), String(wideActive), String(wideIdle));
      expect(compactActive).assertEqual(24);
      expect(compactIdle).assertEqual(18);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check wideActive');
      expect(wideActive).assertEqual(16);
      expect(wideIdle).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1812 end');
    });

    /**
     * @tc.name   testSstsReal1813
     * @tc.number SUB_MNB_SSTS_1813
     * @tc.desc   Property: the compact branch shrinks the selected cell relative to idle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsReal1813', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1813 begin');
      let shrinking: number = 0;
      for (let i: number = 0; i < 5; i++) {
        const active: number =
          StyleConfiguration.getCurrentSubTabsStyle(BP_SM, SIDEBAR_LIST, i, i).fontSize as number;
        const idle: number =
          StyleConfiguration.getCurrentSubTabsStyle(BP_SM, SIDEBAR_LIST, i, i + 1).fontSize as number;
        if (active > idle) {
          shrinking++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'shrinking=%{public}s', String(shrinking));
      expect(shrinking).assertEqual(5);
      expect(SUB_TABS_LIST_ACTIVE_SIZE > SUB_TABS_LIST_INACTIVE_SIZE).assertTrue();
      expect(SUB_TABS_LIST_ACTIVE_SIZE - SUB_TABS_LIST_INACTIVE_SIZE).assertEqual(6);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1813 end');
    });

    /**
     * @tc.name   testSstsReal1814
     * @tc.number SUB_MNB_SSTS_1814
     * @tc.desc   Property: the wide branch keeps the same font size for both states
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsReal1814', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1814 begin');
      let equalSizes: number = 0;
      for (let i: number = 0; i < 5; i++) {
        const active: number =
          StyleConfiguration.getCurrentSubTabsStyle(BP_MD, SIDEBAR_TABS, i, i).fontSize as number;
        const idle: number =
          StyleConfiguration.getCurrentSubTabsStyle(BP_MD, SIDEBAR_TABS, i, i + 1).fontSize as number;
        if (active === idle) {
          equalSizes++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'equalSizes=%{public}s', String(equalSizes));
      expect(equalSizes).assertEqual(5);
      expect(SUB_TABS_TABS_ACTIVE_SIZE === SUB_TABS_TABS_INACTIVE_SIZE).assertTrue();
      expect(SUB_TABS_TABS_ACTIVE_SIZE).assertEqual(16);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1814 end');
    });

    /**
     * @tc.name   testSstsReal1815
     * @tc.number SUB_MNB_SSTS_1815
     * @tc.desc   Property: the compact branch always uses the transparent background
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsReal1815', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1815 begin');
      let opaque: number = 0;
      for (let i: number = 0; i < 5; i++) {
        const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_SM, SIDEBAR_LIST, i, i + 1);
        if (style.backgroundColor !== SUB_TABS_LIST_INACTIVE_BG) {
          opaque++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'opaque=%{public}s', String(opaque));
      expect(opaque).assertEqual(0);
      expect(SUB_TABS_LIST_ACTIVE_BG).assertEqual('#00ffffff');
      expect(SUB_TABS_LIST_ACTIVE_BG).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1815 end');
    });

    /**
     * @tc.name   testSstsReal1816
     * @tc.number SUB_MNB_SSTS_1816
     * @tc.desc   Combination: a 6x6 grid on the compact branch yields exactly 6 highlighted cells
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsReal1816', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1816 begin');
      let highlighted: number = 0;
      let cells: number = 0;
      for (let index: number = 0; index < 6; index++) {
        for (let current: number = 0; current < 6; current++) {
          const style: CustomFontStyle =
            StyleConfiguration.getCurrentSubTabsStyle(BP_SM, SIDEBAR_LIST, index, current);
          cells++;
          if (style.fontSize === SUB_TABS_LIST_ACTIVE_SIZE) {
            highlighted++;
          }
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'highlighted=%{public}s cells=%{public}s',
        String(highlighted), String(cells));
      expect(highlighted).assertEqual(6);
      expect(cells).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check cells - highlighted');
      expect(cells - highlighted).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1816 end');
    });

    /**
     * @tc.name   testSstsReal1817
     * @tc.number SUB_MNB_SSTS_1817
     * @tc.desc   Combination: the wide grid highlights exactly one cell per row
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsReal1817', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1817 begin');
      let perRow: number = 0;
      let mismatched: number = 0;
      for (let index: number = 0; index < 6; index++) {
        perRow = 0;
        for (let current: number = 0; current < 6; current++) {
          const style: CustomFontStyle =
            StyleConfiguration.getCurrentSubTabsStyle(BP_MD, SIDEBAR_TABS, index, current);
          if (style.backgroundColor === SUB_TABS_TABS_ACTIVE_BG) {
            perRow++;
          }
        }
        if (perRow !== 1) {
          mismatched++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'rowsWithWrongCount=%{public}s', String(mismatched));
      expect(mismatched).assertEqual(0);
      expect(SUB_TABS_TABS_ACTIVE_BG === SUB_TABS_TABS_INACTIVE_BG).assertFalse();
      expect(SUB_TABS_TABS_ACTIVE_BG).assertEqual('#190A59F7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1817 end');
    });

    /**
     * @tc.name   testSstsReal1818
     * @tc.number SUB_MNB_SSTS_1818
     * @tc.desc   State: repeated calls return independent objects with stable values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsReal1818', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1818 begin');
      const first: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_MD, SIDEBAR_TABS, 3, 3);
      const second: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_MD, SIDEBAR_TABS, 3, 3);
      const sameReference: boolean = first === second;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'sameReference=%{public}s', String(sameReference));
      expect(sameReference).assertFalse();
      expect(first.fontColor).assertEqual(second.fontColor);
      expect(first.backgroundColor).assertEqual(second.backgroundColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1818 end');
    });

    /**
     * @tc.name   testSstsReal1819
     * @tc.number SUB_MNB_SSTS_1819
     * @tc.desc   Property: the black font colour is shared by compact selected and wide unselected
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsReal1819', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1819 begin');
      const compactActive: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_SM, SIDEBAR_LIST, 0, 0);
      const wideIdle: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle(BP_MD, SIDEBAR_TABS, 0, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'compact=%{public}s wide=%{public}s',
        compactActive.fontColor, wideIdle.fontColor);
      expect(compactActive.fontColor).assertEqual(wideIdle.fontColor);
      expect(compactActive.fontColor).assertEqual('#000');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check compactActive.fontSize === wideIdle.fontSize');
      expect(compactActive.fontSize === wideIdle.fontSize).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1819 end');
    });

    /**
     * @tc.name   testSstsReal1820
     * @tc.number SUB_MNB_SSTS_1820
     * @tc.desc   Combination: every non-sm breakpoint with tabs mode uses the wide font size
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsReal1820', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1820 begin');
      let compactHits: number = 0;
      for (let i: number = 0; i < NON_SM_BREAKPOINTS.length; i++) {
        const style: CustomFontStyle =
          StyleConfiguration.getCurrentSubTabsStyle(NON_SM_BREAKPOINTS[i], SIDEBAR_TABS, 0, 0);
        if (style.fontSize !== SUB_TABS_TABS_ACTIVE_SIZE) {
          compactHits++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'compactHits=%{public}s probes=%{public}s', String(compactHits),
        String(NON_SM_BREAKPOINTS.length));
      expect(compactHits).assertEqual(0);
      expect(NON_SM_BREAKPOINTS.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check value');
      expect(StyleConfiguration.getCurrentSubTabsStyle(BP_SM, SIDEBAR_TABS, 0, 0).fontSize)
        .assertEqual(SUB_TABS_LIST_ACTIVE_SIZE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsReal1820 end');
    });
  });
}
