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

import { describe, it, expect } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import {
  NavBarStyleModel,
  NavBarBreakpointStyle,
  NavBarFontStyle,
  NavBarSubTabsStyle,
  NAV_STYLE_BREAKPOINTS,
  NAV_SIDE_BAR_MODES,
  FLEX_ALIGN_START,
  FLEX_ALIGN_CENTER,
  FLEX_DIRECTION_ROW,
  FLEX_DIRECTION_COLUMN,
  TEXT_ALIGN_START,
  TEXT_ALIGN_CENTER,
  AXIS_VERTICAL,
  AXIS_HORIZONTAL
} from '../Shared/NavBarStyleModel';

const DATASET = 'NavAppStyleResolution';
const DOMAIN: number = 0xF811;
const TAG: string = '[NavAppStyleResolution]';

function compactStyle(): NavBarSubTabsStyle {
  return NavBarStyleModel.getSubTabsControllerStyle('sm', 'tabs');
}

function expandedStyle(): NavBarSubTabsStyle {
  return NavBarStyleModel.getSubTabsControllerStyle('md', 'tabs');
}

export default function navAppStyleResolutionSuite() {
  describe('NavAppStyleResolution', () => {
    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1853
     * @tc.name    NavAppStyleResolution1
     * @tc.desc    sm breakpoint uses the compact navigation list layout
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointCompact1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('sm');
      expect(s.navListHeight).assertEqual('56vp');
      expect(s.navListItemWidth).assertEqual('20%');
      expect(s.navListMargin).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1854
     * @tc.name    NavAppStyleResolution2
     * @tc.desc    sm breakpoint keeps the menu icon and text compact
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointCompact2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('sm');
      expect(s.menuImgMarginTop).assertEqual(7);
      expect(s.menuTextSize).assertEqual(10);
      expect(s.menuTextHeight).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1855
     * @tc.name    NavAppStyleResolution3
     * @tc.desc    sm breakpoint uses symmetric 16 vp content margins
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointCompact3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('sm');
      expect(s.contentMarginLeft).assertEqual(16);
      expect(s.contentMarginRight).assertEqual(16);
      expect(s.contentMarginLeft).assertEqual(s.contentMarginRight);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1856
     * @tc.name    NavAppStyleResolution4
     * @tc.desc    sm breakpoint drops the bottom content margin and recommendation offset
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointCompact4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('sm');
      expect(s.contentMarginTop).assertEqual(24);
      expect(s.contentMarginBottom).assertEqual(0);
      expect(s.recommendMarginTop).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1857
     * @tc.name    NavAppStyleResolution5
     * @tc.desc    sm breakpoint uses the 284/138/576 recommendation grid metrics
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointCompact5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('sm');
      expect(s.gridHeight).assertEqual(284);
      expect(s.gridItemHeight).assertEqual(138);
      expect(s.gridSecHeight).assertEqual(576);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1858
     * @tc.name    NavAppStyleResolution6
     * @tc.desc    sm breakpoint paints the tabs container with the grey background
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointCompact6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('sm');
      expect(s.background).assertEqual('#f1f3f5');
      expect(s.background === '#fff').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1859
     * @tc.name    NavAppStyleResolution7
     * @tc.desc    sm secondary grid is taller than the primary grid block
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointCompact7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('sm');
      expect(s.gridSecHeight > s.gridHeight).assertTrue();
      expect(s.gridHeight > s.gridItemHeight).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1860
     * @tc.name    NavAppStyleResolution8
     * @tc.desc    md breakpoint expands the navigation list to full width
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointExpanded1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('md');
      expect(s.navListHeight).assertEqual('');
      expect(s.navListItemWidth).assertEqual('100%');
      expect(s.navListMargin).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1861
     * @tc.name    NavAppStyleResolution9
     * @tc.desc    md breakpoint grows the menu text to 12/16 vp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointExpanded2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('md');
      expect(s.menuTextSize).assertEqual(12);
      expect(s.menuTextHeight).assertEqual(16);
      expect(s.menuImgMarginTop).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1862
     * @tc.name    NavAppStyleResolution10
     * @tc.desc    md breakpoint uses 24 vp horizontal and 24/22 vp vertical content margins
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointExpanded3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('md');
      expect(s.contentMarginLeft).assertEqual(24);
      expect(s.contentMarginRight).assertEqual(24);
      expect(s.contentMarginTop).assertEqual(24);
      expect(s.contentMarginBottom).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1863
     * @tc.name    NavAppStyleResolution11
     * @tc.desc    md breakpoint offsets the recommendation block by 16 vp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointExpanded4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('md');
      expect(s.recommendMarginTop).assertEqual(16);
      expect(s.recommendMarginTop === 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1864
     * @tc.name    NavAppStyleResolution12
     * @tc.desc    md breakpoint collapses the recommendation grid to a single row
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointExpanded5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('md');
      expect(s.gridHeight).assertEqual(106);
      expect(s.gridItemHeight).assertEqual(106);
      expect(s.gridHeight).assertEqual(s.gridItemHeight);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1865
     * @tc.name    NavAppStyleResolution13
     * @tc.desc    md breakpoint caps the secondary grid at 220 vp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointExpanded6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('md');
      expect(s.gridSecHeight).assertEqual(220);
      expect(s.gridSecHeight > s.gridHeight).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1866
     * @tc.name    NavAppStyleResolution14
     * @tc.desc    md breakpoint paints the tabs container white
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointExpanded7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('md');
      expect(s.background).assertEqual('#fff');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1867
     * @tc.name    NavAppStyleResolution15
     * @tc.desc    lg breakpoint shares the expanded table with md
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointExpanded8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const md: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('md');
      const lg: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('lg');
      expect(lg.navListItemWidth).assertEqual(md.navListItemWidth);
      expect(lg.gridHeight).assertEqual(md.gridHeight);
      expect(lg.background).assertEqual(md.background);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1868
     * @tc.name    NavAppStyleResolution16
     * @tc.desc    unknown breakpoint string falls back to the expanded table
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointExpanded9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('');
      const md: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('md');
      expect(s.navListMargin).assertEqual(md.navListMargin);
      expect(s.menuTextSize).assertEqual(md.menuTextSize);
      expect(s.gridSecHeight).assertEqual(md.gridSecHeight);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1869
     * @tc.name    NavAppStyleResolution17
     * @tc.desc    compact and expanded tables differ on every listed metric
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpointExpanded10', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const sm: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('sm');
      const md: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('md');
      expect(sm.menuTextSize !== md.menuTextSize).assertTrue();
      expect(sm.navListItemWidth !== md.navListItemWidth).assertTrue();
      expect(sm.gridHeight !== md.gridHeight).assertTrue();
      expect(sm.background !== md.background).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1870
     * @tc.name    NavAppStyleResolution18
     * @tc.desc    compact mode resolution for breakpoint sm and sidebar mode list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'compactMatrix_sm_list', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(NavBarStyleModel.isCompactMode('sm', 'list')).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1871
     * @tc.name    NavAppStyleResolution19
     * @tc.desc    compact mode resolution for breakpoint sm and sidebar mode tabs
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'compactMatrix_sm_tabs', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(NavBarStyleModel.isCompactMode('sm', 'tabs')).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1872
     * @tc.name    NavAppStyleResolution20
     * @tc.desc    compact mode resolution for breakpoint md and sidebar mode list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'compactMatrix_md_list', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(NavBarStyleModel.isCompactMode('md', 'list')).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1873
     * @tc.name    NavAppStyleResolution21
     * @tc.desc    compact mode resolution for breakpoint md and sidebar mode tabs
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'compactMatrix_md_tabs', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(NavBarStyleModel.isCompactMode('md', 'tabs')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1874
     * @tc.name    NavAppStyleResolution22
     * @tc.desc    compact mode resolution for breakpoint lg and sidebar mode list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'compactMatrix_lg_list', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(NavBarStyleModel.isCompactMode('lg', 'list')).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1875
     * @tc.name    NavAppStyleResolution23
     * @tc.desc    compact mode resolution for breakpoint lg and sidebar mode tabs
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'compactMatrix_lg_tabs', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(NavBarStyleModel.isCompactMode('lg', 'tabs')).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1876
     * @tc.name    NavAppStyleResolution24
     * @tc.desc    unknown breakpoint or mode is treated as expanded
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'compactMatrixUnknown', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(NavBarStyleModel.isCompactMode('', 'tabs')).assertFalse();
      expect(NavBarStyleModel.isCompactMode('md', '')).assertFalse();
      expect(NavBarStyleModel.isCompactMode('sm', '')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1877
     * @tc.name    NavAppStyleResolution25
     * @tc.desc    selected main tab is highlighted for breakpoint sm
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mainTabsHit_sm', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarFontStyle = NavBarStyleModel.getCurrentMainTabsStyle(2, 2, 'sm');
      expect(s.fillColor).assertEqual('#0a59f7');
      expect(s.fontColor).assertEqual('#0a59f7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1878
     * @tc.name    NavAppStyleResolution26
     * @tc.desc    unselected main tab keeps the neutral foreground for breakpoint sm
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mainTabsMiss_sm', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarFontStyle = NavBarStyleModel.getCurrentMainTabsStyle(1, 2, 'sm');
      expect(s.fillColor).assertEqual('');
      expect(s.fontColor).assertEqual('#182431');
      expect(s.fontColor === '#0a59f7').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1879
     * @tc.name    NavAppStyleResolution27
     * @tc.desc    selected main tab is highlighted for breakpoint md
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mainTabsHit_md', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarFontStyle = NavBarStyleModel.getCurrentMainTabsStyle(2, 2, 'md');
      expect(s.fillColor).assertEqual('#0a59f7');
      expect(s.fontColor).assertEqual('#0a59f7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1880
     * @tc.name    NavAppStyleResolution28
     * @tc.desc    unselected main tab keeps the neutral foreground for breakpoint md
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mainTabsMiss_md', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarFontStyle = NavBarStyleModel.getCurrentMainTabsStyle(1, 2, 'md');
      expect(s.fillColor).assertEqual('');
      expect(s.fontColor).assertEqual('#182431');
      expect(s.fontColor === '#0a59f7').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1881
     * @tc.name    NavAppStyleResolution29
     * @tc.desc    selected main tab is highlighted for breakpoint lg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mainTabsHit_lg', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarFontStyle = NavBarStyleModel.getCurrentMainTabsStyle(2, 2, 'lg');
      expect(s.fillColor).assertEqual('#0a59f7');
      expect(s.fontColor).assertEqual('#0a59f7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1882
     * @tc.name    NavAppStyleResolution30
     * @tc.desc    unselected main tab keeps the neutral foreground for breakpoint lg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mainTabsMiss_lg', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarFontStyle = NavBarStyleModel.getCurrentMainTabsStyle(1, 2, 'lg');
      expect(s.fillColor).assertEqual('');
      expect(s.fontColor).assertEqual('#182431');
      expect(s.fontColor === '#0a59f7').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1883
     * @tc.name    NavAppStyleResolution31
     * @tc.desc    main tab selection compares indices strictly without coercion
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mainTabsBoundary', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(NavBarStyleModel.getCurrentMainTabsStyle(0, 0, 'sm').fillColor).assertEqual('#0a59f7');
      expect(NavBarStyleModel.getCurrentMainTabsStyle(0, 1, 'sm').fillColor).assertEqual('');
      expect(NavBarStyleModel.getCurrentMainTabsStyle(-1, 0, 'md').fontColor).assertEqual('#182431');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1884
     * @tc.name    NavAppStyleResolution32
     * @tc.desc    main tab style depends only on the index pair and breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mainTabsIgnoresMode', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const a: NavBarFontStyle = NavBarStyleModel.getCurrentMainTabsStyle(3, 3, 'lg');
      const b: NavBarFontStyle = NavBarStyleModel.getCurrentMainTabsStyle(3, 3, 'md');
      expect(a.fillColor).assertEqual(b.fillColor);
      expect(a.fontColor).assertEqual(b.fontColor);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1885
     * @tc.name    NavAppStyleResolution33
     * @tc.desc    compact sub tabs use 4 vp top text margin and 16 vp list spacing
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCompact1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarSubTabsStyle = compactStyle();
      expect(s.textMarginTop).assertEqual(4);
      expect(s.textMarginLeft).assertEqual(0);
      expect(s.listSpace).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1886
     * @tc.name    NavAppStyleResolution34
     * @tc.desc    compact sub tabs keep a 56 vp item height without left margin
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCompact2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarSubTabsStyle = compactStyle();
      expect(s.itemHeight).assertEqual(56);
      expect(s.itemMarginLeft).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1887
     * @tc.name    NavAppStyleResolution35
     * @tc.desc    compact sub tabs strip horizontal padding from navigation and menu lists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCompact3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarSubTabsStyle = compactStyle();
      expect(s.navPaddingLeft).assertEqual(0);
      expect(s.menuPaddingLeft).assertEqual(0);
      expect(s.menuPaddingRight).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1888
     * @tc.name    NavAppStyleResolution36
     * @tc.desc    compact sub tabs stack the primary menu vertically and center it
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCompact4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarSubTabsStyle = compactStyle();
      expect(s.flexAlign).assertEqual(FLEX_ALIGN_CENTER);
      expect(s.flexDirection).assertEqual(FLEX_DIRECTION_COLUMN);
      expect(s.textAlign).assertEqual(TEXT_ALIGN_CENTER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1889
     * @tc.name    NavAppStyleResolution37
     * @tc.desc    compact sub tabs hide the page title and show the second menu horizontally
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCompact5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarSubTabsStyle = compactStyle();
      expect(s.showPageTitle).assertFalse();
      expect(s.showSecondMenu).assertTrue();
      expect(s.listDirection).assertEqual(AXIS_HORIZONTAL);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1890
     * @tc.name    NavAppStyleResolution38
     * @tc.desc    compact sub tabs leave the second menu item width unset
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCompact6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarSubTabsStyle = compactStyle();
      expect(s.itemWidth).assertEqual('');
      expect(s.itemWidth.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1891
     * @tc.name    NavAppStyleResolution39
     * @tc.desc    compact sub tabs zero out search and tool bar paddings
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCompact7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarSubTabsStyle = compactStyle();
      expect(s.searchPaddingLeft).assertEqual(0);
      expect(s.searchPaddingRight).assertEqual(0);
      expect(s.toolPaddingLeft).assertEqual(0);
      expect(s.toolPaddingRight).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1892
     * @tc.name    NavAppStyleResolution40
     * @tc.desc    expanded sub tabs indent the text by 8 vp with no list spacing
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsExpanded1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarSubTabsStyle = expandedStyle();
      expect(s.textMarginTop).assertEqual(0);
      expect(s.textMarginLeft).assertEqual(8);
      expect(s.listSpace).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1893
     * @tc.name    NavAppStyleResolution41
     * @tc.desc    expanded sub tabs use a 48 vp item with a 44 vp left margin
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsExpanded2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarSubTabsStyle = expandedStyle();
      expect(s.itemHeight).assertEqual(48);
      expect(s.itemMarginLeft).assertEqual(44);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1894
     * @tc.name    NavAppStyleResolution42
     * @tc.desc    expanded sub tabs apply 12 vp padding to navigation and menu lists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsExpanded3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarSubTabsStyle = expandedStyle();
      expect(s.navPaddingLeft).assertEqual(12);
      expect(s.navPaddingRight).assertEqual(12);
      expect(s.menuPaddingLeft).assertEqual(12);
      expect(s.menuPaddingRight).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1895
     * @tc.name    NavAppStyleResolution43
     * @tc.desc    expanded sub tabs align the primary menu to the start in a row
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsExpanded4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarSubTabsStyle = expandedStyle();
      expect(s.flexAlign).assertEqual(FLEX_ALIGN_START);
      expect(s.flexDirection).assertEqual(FLEX_DIRECTION_ROW);
      expect(s.textAlign).assertEqual(TEXT_ALIGN_START);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1896
     * @tc.name    NavAppStyleResolution44
     * @tc.desc    expanded sub tabs show the page title and hide the second menu
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsExpanded5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarSubTabsStyle = expandedStyle();
      expect(s.showPageTitle).assertTrue();
      expect(s.showSecondMenu).assertFalse();
      expect(s.listDirection).assertEqual(AXIS_VERTICAL);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1897
     * @tc.name    NavAppStyleResolution45
     * @tc.desc    expanded sub tabs stretch the second menu item to full width
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsExpanded6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarSubTabsStyle = expandedStyle();
      expect(s.itemWidth).assertEqual('100%');
      expect(s.itemWidth.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1898
     * @tc.name    NavAppStyleResolution46
     * @tc.desc    expanded sub tabs pad search and tool bars by 12 vp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsExpanded7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarSubTabsStyle = expandedStyle();
      expect(s.searchPaddingLeft).assertEqual(12);
      expect(s.searchPaddingRight).assertEqual(12);
      expect(s.toolPaddingLeft).assertEqual(12);
      expect(s.toolPaddingRight).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1899
     * @tc.name    NavAppStyleResolution47
     * @tc.desc    sm keeps the compact table for both sidebar modes
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsMode1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const a: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('sm', 'list');
      const b: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('sm', 'tabs');
      expect(a.itemHeight).assertEqual(b.itemHeight);
      expect(a.listSpace).assertEqual(b.listSpace);
      expect(a.showSecondMenu).assertEqual(b.showSecondMenu);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1900
     * @tc.name    NavAppStyleResolution48
     * @tc.desc    md switches the table when the sidebar mode changes
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsMode2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const list: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('md', 'list');
      const tabs: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('md', 'tabs');
      expect(list.itemHeight).assertEqual(56);
      expect(tabs.itemHeight).assertEqual(48);
      expect(list.showSecondMenu).assertTrue();
      expect(tabs.showSecondMenu).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1901
     * @tc.name    NavAppStyleResolution49
     * @tc.desc    lg switches the table when the sidebar mode changes
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsMode3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const list: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('lg', 'list');
      const tabs: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('lg', 'tabs');
      expect(list.listSpace).assertEqual(16);
      expect(tabs.listSpace).assertEqual(0);
      expect(tabs.itemWidth).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1902
     * @tc.name    NavAppStyleResolution50
     * @tc.desc    unknown breakpoint resolves like the expanded table in tabs mode
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsMode4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const unknown: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('', 'tabs');
      const tabs: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('md', 'tabs');
      expect(unknown.itemHeight).assertEqual(tabs.itemHeight);
      expect(unknown.textMarginLeft).assertEqual(tabs.textMarginLeft);
      expect(unknown.showPageTitle).assertEqual(tabs.showPageTitle);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1903
     * @tc.name    NavAppStyleResolution51
     * @tc.desc    unknown sidebar mode falls back to the expanded table
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsMode5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const unknown: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('md', 'unknown');
      expect(unknown.showPageTitle).assertTrue();
      expect(unknown.itemHeight).assertEqual(48);
      expect(unknown.flexDirection).assertEqual(FLEX_DIRECTION_ROW);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1904
     * @tc.name    NavAppStyleResolution52
     * @tc.desc    compact and expanded tables disagree on visibility flags
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsMode6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const compact: NavBarSubTabsStyle = compactStyle();
      const expanded: NavBarSubTabsStyle = expandedStyle();
      expect(compact.showPageTitle !== expanded.showPageTitle).assertTrue();
      expect(compact.showSecondMenu !== expanded.showSecondMenu).assertTrue();
      expect(compact.flexDirection !== expanded.flexDirection).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1905
     * @tc.name    NavAppStyleResolution53
     * @tc.desc    compact selected sub tab is 24 vp and black
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCurrentCompactHit', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarFontStyle = NavBarStyleModel.getCurrentSubTabsStyle('sm', 'tabs', 1, 1);
      expect(s.fontSize).assertEqual(24);
      expect(s.fontColor).assertEqual('#000');
      expect(s.backgroundColor).assertEqual('#00ffffff');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1906
     * @tc.name    NavAppStyleResolution54
     * @tc.desc    compact unselected sub tab drops to 18 vp and 60 percent black
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCurrentCompactMiss', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarFontStyle = NavBarStyleModel.getCurrentSubTabsStyle('sm', 'tabs', 1, 0);
      expect(s.fontSize).assertEqual(18);
      expect(s.fontColor).assertEqual('#99000000');
      expect(s.fontSize < 24).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1907
     * @tc.name    NavAppStyleResolution55
     * @tc.desc    compact list mode still highlights the selected sub tab
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCurrentCompactListHit', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarFontStyle = NavBarStyleModel.getCurrentSubTabsStyle('md', 'list', 3, 3);
      expect(s.fontSize).assertEqual(24);
      expect(s.fontColor).assertEqual('#000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1908
     * @tc.name    NavAppStyleResolution56
     * @tc.desc    compact list mode keeps the unselected sub tab dimmed
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCurrentCompactListMiss', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarFontStyle = NavBarStyleModel.getCurrentSubTabsStyle('lg', 'list', 3, 2);
      expect(s.fontSize).assertEqual(18);
      expect(s.fontColor).assertEqual('#99000000');
      expect(s.backgroundColor).assertEqual('#00ffffff');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1909
     * @tc.name    NavAppStyleResolution57
     * @tc.desc    expanded selected sub tab is 16 vp with the blue chip background
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCurrentExpandedHit', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarFontStyle = NavBarStyleModel.getCurrentSubTabsStyle('md', 'tabs', 0, 0);
      expect(s.fontSize).assertEqual(16);
      expect(s.backgroundColor).assertEqual('#190A59F7');
      expect(s.fontColor).assertEqual('#0A59F7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1910
     * @tc.name    NavAppStyleResolution58
     * @tc.desc    expanded unselected sub tab keeps 16 vp with a transparent background
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCurrentExpandedMiss', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarFontStyle = NavBarStyleModel.getCurrentSubTabsStyle('lg', 'tabs', 0, 1);
      expect(s.fontSize).assertEqual(16);
      expect(s.backgroundColor).assertEqual('#00ffffff');
      expect(s.fontColor).assertEqual('#000');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1911
     * @tc.name    NavAppStyleResolution59
     * @tc.desc    negative current index never matches a zero index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCurrentNegative', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const s: NavBarFontStyle = NavBarStyleModel.getCurrentSubTabsStyle('md', 'tabs', 0, -1);
      expect(s.fontColor).assertEqual('#000');
      expect(s.backgroundColor).assertEqual('#00ffffff');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1912
     * @tc.name    NavAppStyleResolution60
     * @tc.desc    far apart indices fall back to the unselected style
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCurrentFarIndex', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const compact: NavBarFontStyle = NavBarStyleModel.getCurrentSubTabsStyle('sm', 'tabs', 99, 0);
      const expanded: NavBarFontStyle = NavBarStyleModel.getCurrentSubTabsStyle('md', 'tabs', 99, 0);
      expect(compact.fontSize).assertEqual(18);
      expect(expanded.fontSize).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1913
     * @tc.name    NavAppStyleResolution61
     * @tc.desc    expanded table returns one size for selected and unselected sub tabs
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'subTabsCurrentSameAcrossBreakpoints', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const hit: NavBarFontStyle = NavBarStyleModel.getCurrentSubTabsStyle('md', 'tabs', 2, 2);
      const miss: NavBarFontStyle = NavBarStyleModel.getCurrentSubTabsStyle('md', 'tabs', 2, 1);
      expect(hit.fontSize).assertEqual(miss.fontSize);
      expect(hit.fontColor !== miss.fontColor).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1914
     * @tc.name    NavAppStyleResolution62
     * @tc.desc    every declared breakpoint resolves a navigation list width
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'crossTable1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let widths: string = '';
      for (let i = 0; i < NAV_STYLE_BREAKPOINTS.length; i++) {
        widths += NavBarStyleModel.getBreakpointStyle(NAV_STYLE_BREAKPOINTS[i]).navListItemWidth;
        widths += ',';
      }
      expect(widths).assertEqual('20%,100%,100%,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1915
     * @tc.name    NavAppStyleResolution63
     * @tc.desc    every declared sidebar mode resolves a sub tabs table
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'crossTable2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let heights: string = '';
      for (let i = 0; i < NAV_SIDE_BAR_MODES.length; i++) {
        heights += String(NavBarStyleModel.getSubTabsControllerStyle('md', NAV_SIDE_BAR_MODES[i]).itemHeight);
        heights += ',';
      }
      expect(heights).assertEqual('56,48,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1916
     * @tc.name    NavAppStyleResolution64
     * @tc.desc    breakpoint style lookups are pure and repeatable
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'crossTable3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const first: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('sm');
      const second: NavBarBreakpointStyle = NavBarStyleModel.getBreakpointStyle('sm');
      expect(first.gridHeight).assertEqual(second.gridHeight);
      expect(first.contentMarginLeft).assertEqual(second.contentMarginLeft);
      first.gridHeight = 999;
      expect(NavBarStyleModel.getBreakpointStyle('sm').gridHeight).assertEqual(284);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1917
     * @tc.name    NavAppStyleResolution65
     * @tc.desc    style lookups do not mutate the compact table between calls
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'crossTable4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('sm', 'list');
      const snapshot: number = before.itemHeight;
      before.itemHeight = 1;
      const after: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('sm', 'list');
      expect(after.itemHeight).assertEqual(snapshot);
      expect(after.itemHeight).assertEqual(56);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1918
     * @tc.name    NavAppStyleResolution66
     * @tc.desc    compact style tables agree on the item height across modes
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'crossTable5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const list: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('sm', 'list');
      const tabs: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('sm', 'tabs');
      const lgList: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('lg', 'list');
      expect(list.itemHeight).assertEqual(tabs.itemHeight);
      expect(tabs.itemHeight).assertEqual(lgList.itemHeight);
      expect(lgList.itemHeight).assertEqual(56);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_1919
     * @tc.name    NavAppStyleResolution67
     * @tc.desc    expanded style tables agree on padding across modes and breakpoints
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'crossTable6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const md: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('md', 'tabs');
      const lg: NavBarSubTabsStyle = NavBarStyleModel.getSubTabsControllerStyle('lg', 'tabs');
      expect(md.searchPaddingLeft).assertEqual(lg.searchPaddingLeft);
      expect(md.toolPaddingRight).assertEqual(lg.toolPaddingRight);
      expect(lg.searchPaddingLeft).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })
  })
}
