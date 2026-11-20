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
  NON_SM_BREAKPOINTS,
  MAIN_TABS_ACTIVE_FILL,
  MAIN_TABS_ACTIVE_FONT,
  MAIN_TABS_INACTIVE_FILL,
  MAIN_TABS_INACTIVE_FONT
} from '../util/NavSpec';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

/**
 * L1 cases for StyleConfiguration.getCurrentMainTabsStyle (common/Configuration.ets:58).
 * The selected tab (index === currentIndex) gets the accent colour on both the 'sm' and the
 * default branch; the implementation of the two branches is identical, which case 1112 pins down.
 */
export default function mtsGridReal01Test() {
  describe('MultiNavBarMtsGridReal01', () => {
    /**
     * @tc.name   testMtsReal1101
     * @tc.number SUB_MNB_MTS_1101
     * @tc.desc   sm branch: the selected tab uses the accent fill and font colour
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMtsReal1101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1101 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, BP_SM);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'fill=%{public}s expected=%{public}s', style.fillColor,
        MAIN_TABS_ACTIVE_FILL);
      expect(style.fillColor).assertEqual(MAIN_TABS_ACTIVE_FILL);
      expect(style.fontColor).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.fillColor === MAIN_TABS_INACTIVE_FILL');
      expect(style.fillColor === MAIN_TABS_INACTIVE_FILL).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1101 end');
    });

    /**
     * @tc.name   testMtsReal1102
     * @tc.number SUB_MNB_MTS_1102
     * @tc.desc   sm branch: an unselected tab has an empty fill and the secondary font colour
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMtsReal1102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1102 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 0, BP_SM);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'fill=[%{public}s] font=%{public}s', style.fillColor, style.fontColor);
      expect(style.fillColor).assertEqual(MAIN_TABS_INACTIVE_FILL);
      expect(style.fontColor).assertEqual(MAIN_TABS_INACTIVE_FONT);
      expect(style.fillColor === style.fontColor).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1102 end');
    });

    /**
     * @tc.name   testMtsReal1103
     * @tc.number SUB_MNB_MTS_1103
     * @tc.desc   md branch: the selected tab keeps the same accent colour as sm
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMtsReal1103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1103 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 2, BP_MD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'font=%{public}s expected=%{public}s', style.fontColor,
        MAIN_TABS_ACTIVE_FONT);
      expect(style.fontColor).assertEqual(MAIN_TABS_ACTIVE_FONT);
      expect(style.fillColor).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.fillColor === MAIN_TABS_INACTIVE_FILL');
      expect(style.fillColor === MAIN_TABS_INACTIVE_FILL).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1103 end');
    });

    /**
     * @tc.name   testMtsReal1104
     * @tc.number SUB_MNB_MTS_1104
     * @tc.desc   md branch: an unselected tab falls back to the secondary font colour
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMtsReal1104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1104 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 4, BP_MD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'font=%{public}s expected=%{public}s', style.fontColor,
        MAIN_TABS_INACTIVE_FONT);
      expect(style.fontColor).assertEqual(MAIN_TABS_INACTIVE_FONT);
      expect(style.fillColor).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.fontColor === MAIN_TABS_ACTIVE_FONT');
      expect(style.fontColor === MAIN_TABS_ACTIVE_FONT).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1104 end');
    });

    /**
     * @tc.name   testMtsReal1105
     * @tc.number SUB_MNB_MTS_1105
     * @tc.desc   lg branch behaves like md for both the selected and unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMtsReal1105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1105 begin');
      const active: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 3, BP_LG);
      const inactive: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 0, BP_LG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'active=%{public}s inactive=%{public}s', active.fontColor,
        inactive.fontColor);
      expect(active.fontColor).assertEqual(MAIN_TABS_ACTIVE_FONT);
      expect(inactive.fontColor).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check active.fillColor === inactive.fillColor');
      expect(active.fillColor === inactive.fillColor).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1105 end');
    });

    /**
     * @tc.name   testMtsReal1106
     * @tc.number SUB_MNB_MTS_1106
     * @tc.desc   Anchor: an empty breakpoint still highlights the selected tab
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMtsReal1106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1106 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'fill=%{public}s expected=%{public}s', style.fillColor,
        MAIN_TABS_ACTIVE_FILL);
      expect(style.fillColor).assertEqual(MAIN_TABS_ACTIVE_FILL);
      expect(style.fontColor).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.fontColor === MAIN_TABS_INACTIVE_FONT');
      expect(style.fontColor === MAIN_TABS_INACTIVE_FONT).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1106 end');
    });

    /**
     * @tc.name   testMtsReal1107
     * @tc.number SUB_MNB_MTS_1107
     * @tc.desc   Anchor: uppercase 'SM' behaves like the default branch, not like the sm branch
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMtsReal1107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1107 begin');
      const active: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'SM');
      const inactive: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 0, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'active=%{public}s inactive=%{public}s', active.fontColor,
        inactive.fontColor);
      expect(active.fontColor).assertEqual(MAIN_TABS_ACTIVE_FONT);
      expect(inactive.fontColor).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check active.fillColor === inactive.fillColor');
      expect(active.fillColor === inactive.fillColor).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1107 end');
    });

    /**
     * @tc.name   testMtsReal1108
     * @tc.number SUB_MNB_MTS_1108
     * @tc.desc   Anchor: a negative index never matches a non-negative current index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMtsReal1108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1108 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(-1, 0, BP_SM);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'fill=[%{public}s] expected=[%{public}s]', style.fillColor,
        MAIN_TABS_INACTIVE_FILL);
      expect(style.fillColor).assertEqual(MAIN_TABS_INACTIVE_FILL);
      expect(style.fontColor).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.fontColor === MAIN_TABS_ACTIVE_FONT');
      expect(style.fontColor === MAIN_TABS_ACTIVE_FONT).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1108 end');
    });

    /**
     * @tc.name   testMtsReal1109
     * @tc.number SUB_MNB_MTS_1109
     * @tc.desc   Anchor: -1 === -1 highlights the tab even though the index is out of range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsReal1109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1109 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(-1, -1, BP_MD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'fill=%{public}s expected=%{public}s', style.fillColor,
        MAIN_TABS_ACTIVE_FILL);
      expect(style.fillColor).assertEqual(MAIN_TABS_ACTIVE_FILL);
      expect(style.fontColor).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.fillColor === MAIN_TABS_INACTIVE_FILL');
      expect(style.fillColor === MAIN_TABS_INACTIVE_FILL).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1109 end');
    });

    /**
     * @tc.name   testMtsReal1110
     * @tc.number SUB_MNB_MTS_1110
     * @tc.desc   Extreme: a very large index tuple still resolves by equality only
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsReal1110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1110 begin');
      const active: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(999999, 999999, BP_SM);
      const inactive: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(999999, 999998, BP_SM);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'active=%{public}s inactive=%{public}s', active.fontColor,
        inactive.fontColor);
      expect(active.fontColor).assertEqual(MAIN_TABS_ACTIVE_FONT);
      expect(inactive.fontColor).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check active.fillColor === inactive.fillColor');
      expect(active.fillColor === inactive.fillColor).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1110 end');
    });

    /**
     * @tc.name   testMtsReal1111
     * @tc.number SUB_MNB_MTS_1111
     * @tc.desc   Combination: a 6x6 index grid produces exactly 6 highlighted cells
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsReal1111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1111 begin');
      let highlighted: number = 0;
      let total: number = 0;
      for (let row: number = 0; row < 6; row++) {
        for (let column: number = 0; column < 6; column++) {
          const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(row, column, BP_MD);
          total++;
          if (style.fillColor !== MAIN_TABS_INACTIVE_FILL) {
            highlighted++;
          }
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'highlighted=%{public}s total=%{public}s',
        String(highlighted), String(total));
      expect(highlighted).assertEqual(6);
      expect(total).assertEqual(36);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check total - highlighted');
      expect(total - highlighted).assertEqual(30);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1111 end');
    });

    /**
     * @tc.name   testMtsReal1112
     * @tc.number SUB_MNB_MTS_1112
     * @tc.desc   Property: the sm and default branches produce identical results for the same tuple
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsReal1112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1112 begin');
      let diverged: number = 0;
      for (let i: number = 0; i < 6; i++) {
        const smStyle: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(i, 3, BP_SM);
        const mdStyle: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(i, 3, BP_MD);
        if (smStyle.fillColor !== mdStyle.fillColor || smStyle.fontColor !== mdStyle.fontColor) {
          diverged++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'diverged=%{public}s', String(diverged));
      expect(diverged).assertEqual(0);
      expect(StyleConfiguration.getCurrentMainTabsStyle(3, 3, BP_SM).fillColor)
        .assertEqual(StyleConfiguration.getCurrentMainTabsStyle(3, 3, BP_MD).fillColor);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check value');
      expect(StyleConfiguration.getCurrentMainTabsStyle(0, 3, BP_SM).fillColor)
        .assertEqual(MAIN_TABS_INACTIVE_FILL);
    });

    /**
     * @tc.name   testMtsReal1113
     * @tc.number SUB_MNB_MTS_1113
     * @tc.desc   State: repeated calls with the same tuple are stable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMtsReal1113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1113 begin');
      const first: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 4, BP_MD);
      const second: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 4, BP_MD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s second=%{public}s', first.fontColor, second.fontColor);
      expect(first.fontColor).assertEqual(second.fontColor);
      expect(first.fillColor).assertEqual(second.fillColor);
      expect(first === second).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1113 end');
    });

    /**
     * @tc.name   testMtsReal1114
     * @tc.number SUB_MNB_MTS_1114
     * @tc.desc   Property: the highlighted state always uses one colour for fill and font
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsReal1114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1114 begin');
      let inconsistent: number = 0;
      for (let i: number = 0; i < 5; i++) {
        const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(i, i, BP_MD);
        if (style.fillColor !== style.fontColor) {
          inconsistent++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'inconsistent=%{public}s', String(inconsistent));
      expect(inconsistent).assertEqual(0);
      expect(StyleConfiguration.getCurrentMainTabsStyle(2, 2, BP_MD).fillColor).assertEqual('#0a59f7');
      expect(StyleConfiguration.getCurrentMainTabsStyle(2, 2, BP_MD).fontColor).assertEqual('#0a59f7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1114 end');
    });

    /**
     * @tc.name   testMtsReal1115
     * @tc.number SUB_MNB_MTS_1115
     * @tc.desc   Property: the unselected state always has an empty fill and the #182431 font
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsReal1115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1115 begin');
      let violations: number = 0;
      for (let i: number = 0; i < 5; i++) {
        const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(i, 99, BP_MD);
        if (style.fillColor !== MAIN_TABS_INACTIVE_FILL || style.fontColor !== MAIN_TABS_INACTIVE_FONT) {
          violations++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'violations=%{public}s', String(violations));
      expect(violations).assertEqual(0);
      expect(MAIN_TABS_INACTIVE_FONT).assertEqual('#182431');
      expect(MAIN_TABS_INACTIVE_FILL).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1115 end');
    });

    /**
     * @tc.name   testMtsReal1116
     * @tc.number SUB_MNB_MTS_1116
     * @tc.desc   Boundary: 1.5 matches 1.5 but not 1, so highlighting follows numeric equality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsReal1116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1116 begin');
      const fractional: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1.5, 1.5, BP_SM);
      const truncated: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1.5, 1, BP_SM);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'fractional=%{public}s truncated=%{public}s', fractional.fontColor,
        truncated.fontColor);
      expect(fractional.fontColor).assertEqual(MAIN_TABS_ACTIVE_FONT);
      expect(truncated.fontColor).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check fractional.fillColor === truncated.fillColor');
      expect(fractional.fillColor === truncated.fillColor).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1116 end');
    });

    /**
     * @tc.name   testMtsReal1117
     * @tc.number SUB_MNB_MTS_1117
     * @tc.desc   Combination: every NON_SM_BREAKPOINTS probe keeps the accent colour for the active tab
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsReal1117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1117 begin');
      let wrongColour: number = 0;
      for (let i: number = 0; i < NON_SM_BREAKPOINTS.length; i++) {
        const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 1, NON_SM_BREAKPOINTS[i]);
        if (style.fillColor !== MAIN_TABS_ACTIVE_FILL) {
          wrongColour++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'wrongColour=%{public}s probes=%{public}s', String(wrongColour),
        String(NON_SM_BREAKPOINTS.length));
      expect(wrongColour).assertEqual(0);
      expect(NON_SM_BREAKPOINTS.length).assertEqual(15);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check value');
      expect(StyleConfiguration.getCurrentMainTabsStyle(1, 1, BP_SM).fillColor)
        .assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1117 end');
    });

    /**
     * @tc.name   testMtsReal1118
     * @tc.number SUB_MNB_MTS_1118
     * @tc.desc   Boundary: index 0 with a fractional current index is not highlighted
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsReal1118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1118 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0.5, BP_MD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'fill=[%{public}s]', style.fillColor);
      expect(style.fillColor).assertEqual(MAIN_TABS_INACTIVE_FILL);
      expect(style.fontColor).assertEqual(MAIN_TABS_INACTIVE_FONT);
      expect(style.fillColor === MAIN_TABS_ACTIVE_FILL).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1118 end');
    });

    /**
     * @tc.name   testMtsReal1119
     * @tc.number SUB_MNB_MTS_1119
     * @tc.desc   Boundary: 0 and 0.0 compare equal so the first tab is highlighted
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsReal1119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1119 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0.0, BP_MD);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'fill=%{public}s expected=%{public}s', style.fillColor,
        MAIN_TABS_ACTIVE_FILL);
      expect(style.fillColor).assertEqual(MAIN_TABS_ACTIVE_FILL);
      expect(style.fontColor).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.fontColor === MAIN_TABS_INACTIVE_FONT');
      expect(style.fontColor === MAIN_TABS_INACTIVE_FONT).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1119 end');
    });

    /**
     * @tc.name   testMtsReal1120
     * @tc.number SUB_MNB_MTS_1120
     * @tc.desc   Property: exactly two distinct field states exist across the whole index space
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsReal1120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1120 begin');
      const seen: string[] = [];
      for (let i: number = 0; i < 4; i++) {
        for (let j: number = 0; j < 4; j++) {
          const style: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(i, j, BP_MD);
          const key: string = `${style.fillColor}|${style.fontColor}`;
          if (seen.indexOf(key) < 0) {
            seen.push(key);
          }
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'states=%{public}s values=%{public}s', String(seen.length), seen.join(';'));
      expect(seen.length).assertEqual(2);
      expect(seen.indexOf(`${MAIN_TABS_ACTIVE_FILL}|${MAIN_TABS_ACTIVE_FONT}`) >= 0).assertTrue();
      expect(seen.indexOf(`${MAIN_TABS_INACTIVE_FILL}|${MAIN_TABS_INACTIVE_FONT}`) >= 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsReal1120 end');
    });
  });
}
