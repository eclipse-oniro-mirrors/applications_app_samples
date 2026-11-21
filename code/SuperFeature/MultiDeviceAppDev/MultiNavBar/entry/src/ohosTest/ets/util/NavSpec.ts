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

/**
 * Frozen expectation tables for the MultiNavBar responsive navigation model.
 *
 * Every constant below is copied from src/main/ets (basis = main-frozen):
 * - common/Configuration.ets:74  getBreakpointStyle       -> BREAKPOINT_STYLE_SM / BREAKPOINT_STYLE_DEFAULT
 * - common/Configuration.ets:116 getCurrentMainTabsStyle  -> MAIN_TABS_*
 * - common/Configuration.ets:132 getSubTabsControllerStyle -> SUB_TABS_STYLE_LIST / SUB_TABS_STYLE_TABS
 * - common/Configuration.ets:174 getCurrentSubTabsStyle   -> SUB_TABS_FONT_*
 * - model/SideListData.ets:18    sideListData             -> SIDE_LIST_*
 *
 * The design values themselves live in Configuration.ets (class DesignSpec) and are frozen here
 * verbatim, so a change in main still shows up as a failure.
 *
 * Test cases import these tables instead of recomputing expectations from the
 * production expression, so a behaviour change in main shows up as a failure.
 */

export const BP_SM: string = 'sm';
export const BP_MD: string = 'md';
export const BP_LG: string = 'lg';
export const SIDEBAR_LIST: string = 'list';
export const SIDEBAR_TABS: string = 'tabs';

/**
 * Breakpoint values that must NOT hit the 'sm' branch. 'SM' / 'Md' / ' sm' / 'lg '
 * are boundary probes for case sensitivity and stray whitespace.
 */
export const NON_SM_BREAKPOINTS: string[] = ['md', 'lg', '', 'SM', 'Md', 'LG', ' sm', 'lg ', 'xs', 'xl', 'xxl',
  '0', 's', 'smlg', 'tab'];

/** Every probe here has to resolve to undefined in BreakpointType.GetValue / SideBarMode.GetValue. */
export const UNKNOWN_BREAKPOINTS: string[] = ['', 'SM', 'Md', 'LG', ' sm', 'lg ', 'xs', 'xl', 'xxl', '0', 's',
  'smlg', 'tab', 'sm sm', 'md\t'];

/** Side bar modes that must NOT hit the 'list' branch. */
export const NON_LIST_MODES: string[] = ['tabs', '', 'List', 'TABS', 'tabs ', ' tab', 'vertical', '0', 'listtabs'];

/** Side bar modes that resolve to undefined in SideBarMode.GetValue. */
export const UNKNOWN_MODES: string[] = ['', 'List', 'TABS', 'tabs ', ' tab', 'vertical', '0', 'listtabs', 'LIST'];

/** Configuration.ets:118-127 - the accent colours used for the selected main tab. */
export const MAIN_TABS_ACTIVE_FILL: string = '#0a59f7';
export const MAIN_TABS_ACTIVE_FONT: string = '#0a59f7';
export const MAIN_TABS_INACTIVE_FILL: string = '';
export const MAIN_TABS_INACTIVE_FONT: string = '#182431';

/** Configuration.ets:177-186 - small screen (or side bar in list mode) sub tab fonts. */
export const SUB_TABS_LIST_ACTIVE_SIZE: number = 24;
export const SUB_TABS_LIST_INACTIVE_SIZE: number = 18;
export const SUB_TABS_LIST_ACTIVE_BG: string = '#00ffffff';
export const SUB_TABS_LIST_ACTIVE_FONT: string = '#000';
export const SUB_TABS_LIST_INACTIVE_BG: string = '#00ffffff';
export const SUB_TABS_LIST_INACTIVE_FONT: string = '#99000000';

/** Configuration.ets:187-196 - wide layout sub tab fonts. */
export const SUB_TABS_TABS_ACTIVE_SIZE: number = 16;
export const SUB_TABS_TABS_INACTIVE_SIZE: number = 16;
export const SUB_TABS_TABS_ACTIVE_BG: string = '#190A59F7';
export const SUB_TABS_TABS_ACTIVE_FONT: string = '#0A59F7';
export const SUB_TABS_TABS_INACTIVE_BG: string = '#00ffffff';
export const SUB_TABS_TABS_INACTIVE_FONT: string = '#000';

/** getBreakpointStyle('sm') - Configuration.ets:76-91. */
export class FrozenBreakpointStyle {
  controlButtonLeft: number = 24;
  controlButtonTop: number = 40;
  controlButtonWidth: number = 24;
  controlButtonHeight: number = 24;
  sideBarPrimaryNavListHeight: string = '56vp';
  sideBarPrimaryNavListMargin: number = 0;
  sideBarPrimaryNavListItemWidth: string = '20%';
  sideBarPrimaryMenuImgMarginTop: number = 7;
  sideBarPrimaryMenuTextSize: number = 10;
  sideBarPrimaryMenuTextHeight: number = 14;
  mainTabsContentMarginTop: number = 24;
  mainTabsContentMarginBottom: number = 0;
  mainTabsContentMarginLeft: number = 16;
  mainTabsContentMarginRight: number = 16;
  recommendCompMarginTop: number = 0;
  recommendCompGridHeight: number = 284;
  recommendCompGridItemHeight: number = 138;
  recommendCompGridSecHeight: number = 576;
  mainTabsBcColor: string = '#f1f3f5';
}

export const BREAKPOINT_STYLE_SM: FrozenBreakpointStyle = new FrozenBreakpointStyle();

/** getBreakpointStyle(anything that is not 'sm') - Configuration.ets:92-107. */
export class FrozenDefaultBreakpointStyle {
  controlButtonLeft: number = 24;
  controlButtonTop: number = 40;
  controlButtonWidth: number = 24;
  controlButtonHeight: number = 24;
  sideBarPrimaryNavListHeight: string = '';
  sideBarPrimaryNavListMargin: number = 24;
  sideBarPrimaryNavListItemWidth: string = '100%';
  sideBarPrimaryMenuImgMarginTop: number = 0;
  sideBarPrimaryMenuTextSize: number = 12;
  sideBarPrimaryMenuTextHeight: number = 16;
  mainTabsContentMarginTop: number = 24;
  mainTabsContentMarginBottom: number = 22;
  mainTabsContentMarginLeft: number = 24;
  mainTabsContentMarginRight: number = 24;
  recommendCompMarginTop: number = 16;
  recommendCompGridHeight: number = 106;
  recommendCompGridItemHeight: number = 106;
  recommendCompGridSecHeight: number = 220;
  mainTabsBcColor: string = '#fff';
}

export const BREAKPOINT_STYLE_DEFAULT: FrozenDefaultBreakpointStyle = new FrozenDefaultBreakpointStyle();

/** getSubTabsControllerStyle: the compact branch (Configuration.ets:134-152). */
export class FrozenSubTabsStyleCompact {
  sideBarPrimaryMenuTextMarginTop: number = 4;
  sideBarPrimaryMenuTextMarginLeft: number = 0;
  secondMenuListSpace: number = 16;
  secondMenuListItemMarginLeft: number = 0;
  secondMenuListItemHeight: number = 56;
  sideBarPrimaryNavListPaddingLeft: number = 0;
  sideBarPrimaryMenuListPaddingLeft: number = 0;
  sideBarPrimaryMenuListPaddingRight: number = 0;
  isShowPageTitle: boolean = false;
  isShowSecondMenu: boolean = true;
  secondMenuListItemWidth: string = '';
  searchModulePaddingLeft: number = 0;
  searchModulePaddingRight: number = 0;
  toolBarPaddingLeft: number = 0;
  toolBarPaddingRight: number = 0;
}

export const SUB_TABS_STYLE_LIST: FrozenSubTabsStyleCompact = new FrozenSubTabsStyleCompact();

/** getSubTabsControllerStyle: the wide branch (Configuration.ets:152-170). */
export class FrozenSubTabsStyleWide {
  sideBarPrimaryMenuTextMarginTop: number = 0;
  sideBarPrimaryMenuTextMarginLeft: number = 8;
  secondMenuListSpace: number = 0;
  secondMenuListItemMarginLeft: number = 44;
  secondMenuListItemHeight: number = 48;
  sideBarPrimaryNavListPaddingLeft: number = 12;
  sideBarPrimaryNavListPaddingRight: number = 12;
  sideBarPrimaryMenuListPaddingLeft: number = 12;
  sideBarPrimaryMenuListPaddingRight: number = 12;
  isShowPageTitle: boolean = true;
  isShowSecondMenu: boolean = false;
  secondMenuListItemWidth: string = '100%';
  searchModulePaddingLeft: number = 12;
  searchModulePaddingRight: number = 12;
  toolBarPaddingLeft: number = 12;
  toolBarPaddingRight: number = 12;
}

export const SUB_TABS_STYLE_TABS: FrozenSubTabsStyleWide = new FrozenSubTabsStyleWide();

/** model/SideListData.ets:18-56 - sub-title count per primary menu entry. */
export const SIDE_LIST_SUBTITLE_COUNTS: number[] = [3, 2, 2, 2, 2];
export const SIDE_LIST_SIZE: number = 5;

/**
 * SideBarController.ets:175 hides the last primary entry when the layout is wider than 'sm',
 * so the visible primary menu count on a wide layout is SIDE_LIST_SIZE - 1.
 */
export const SIDE_LIST_VISIBLE_ON_WIDE: number = 4;

/** sub title names, grouped by primary menu index (resource names from resources/base/element/string.json). */
export const SIDE_LIST_SUBTITLE_NAMES: string[][] = [
  ['recommend', 'appList', 'gameList'],
  ['video', 'shopping'],
  ['category', 'rank'],
  ['discovery', 'hot'],
  ['discovery', 'hot']
];
