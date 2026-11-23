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

export class NavBarBreakpointStyle {
  navListHeight: string = '';
  navListMargin: number = 0;
  navListItemWidth: string = '';
  menuImgMarginTop: number = 0;
  menuTextSize: number = 0;
  menuTextHeight: number = 0;
  contentMarginTop: number = 0;
  contentMarginBottom: number = 0;
  contentMarginLeft: number = 0;
  contentMarginRight: number = 0;
  recommendMarginTop: number = 0;
  gridHeight: number = 0;
  gridItemHeight: number = 0;
  gridSecHeight: number = 0;
  background: string = '';
}

export class NavBarFontStyle {
  fillColor: string = '';
  fontColor: string = '';
  fontSize: number = 0;
  backgroundColor: string = '';
}

export class NavBarSubTabsStyle {
  textMarginTop: number = 0;
  textMarginLeft: number = 0;
  listSpace: number = 0;
  itemMarginLeft: number = 0;
  itemHeight: number = 0;
  navPaddingLeft: number = 0;
  navPaddingRight: number = 0;
  menuPaddingLeft: number = 0;
  menuPaddingRight: number = 0;
  flexAlign: number = 0;
  flexDirection: number = 0;
  textAlign: number = 0;
  showPageTitle: boolean = false;
  showSecondMenu: boolean = false;
  itemWidth: string = '';
  listDirection: number = 0;
  searchPaddingLeft: number = 0;
  searchPaddingRight: number = 0;
  toolPaddingLeft: number = 0;
  toolPaddingRight: number = 0;
}

export const NAV_STYLE_BREAKPOINTS: string[] = ['sm', 'md', 'lg'];

export const NAV_SIDE_BAR_MODES: string[] = ['list', 'tabs'];

export const FLEX_ALIGN_START: number = 0;
export const FLEX_ALIGN_CENTER: number = 1;
export const FLEX_DIRECTION_ROW: number = 0;
export const FLEX_DIRECTION_COLUMN: number = 1;
export const TEXT_ALIGN_START: number = 0;
export const TEXT_ALIGN_CENTER: number = 1;
export const AXIS_VERTICAL: number = 0;
export const AXIS_HORIZONTAL: number = 1;

export const NAV_COMPACT_TEXT_SIZE: number = 24;
export const NAV_EXPANDED_TEXT_SIZE: number = 16;

/**
 * Style resolution rules mirrored from common/Configuration.ets, kept free of
 * ArkUI enums so the mapping table can be verified on the JS thread.
 */
export class NavBarStyleModel {
  public static isCompactMode(currentBreakpoint: string, currentSideBarMode: string): boolean {
    return currentBreakpoint === 'sm' || (currentBreakpoint !== 'sm' && currentSideBarMode === 'list');
  }

  public static getBreakpointStyle(currentBreakpoint: string): NavBarBreakpointStyle {
    const style: NavBarBreakpointStyle = new NavBarBreakpointStyle();
    if (currentBreakpoint === 'sm') {
      style.navListHeight = '56vp';
      style.navListMargin = 0;
      style.navListItemWidth = '20%';
      style.menuImgMarginTop = 7;
      style.menuTextSize = 10;
      style.menuTextHeight = 14;
      style.contentMarginTop = 24;
      style.contentMarginBottom = 0;
      style.contentMarginLeft = 16;
      style.contentMarginRight = 16;
      style.recommendMarginTop = 0;
      style.gridHeight = 284;
      style.gridItemHeight = 138;
      style.gridSecHeight = 576;
      style.background = '#f1f3f5';
    } else {
      style.navListHeight = '';
      style.navListMargin = 24;
      style.navListItemWidth = '100%';
      style.menuImgMarginTop = 0;
      style.menuTextSize = 12;
      style.menuTextHeight = 16;
      style.contentMarginTop = 24;
      style.contentMarginBottom = 22;
      style.contentMarginLeft = 24;
      style.contentMarginRight = 24;
      style.recommendMarginTop = 16;
      style.gridHeight = 106;
      style.gridItemHeight = 106;
      style.gridSecHeight = 220;
      style.background = '#fff';
    }
    return style;
  }

  public static getCurrentMainTabsStyle(index: number, currentIndex: number, currentBreakpoint: string): NavBarFontStyle {
    const style: NavBarFontStyle = new NavBarFontStyle();
    if (index === currentIndex) {
      style.fillColor = '#0a59f7';
      style.fontColor = '#0a59f7';
    } else {
      style.fillColor = '';
      style.fontColor = '#182431';
    }
    return style;
  }

  public static getSubTabsControllerStyle(currentBreakpoint: string, currentSideBarMode: string): NavBarSubTabsStyle {
    const style: NavBarSubTabsStyle = new NavBarSubTabsStyle();
    if (NavBarStyleModel.isCompactMode(currentBreakpoint, currentSideBarMode)) {
      style.textMarginTop = 4;
      style.textMarginLeft = 0;
      style.listSpace = 16;
      style.itemMarginLeft = 0;
      style.itemHeight = 56;
      style.navPaddingLeft = 0;
      style.navPaddingRight = 0;
      style.menuPaddingLeft = 0;
      style.menuPaddingRight = 0;
      style.flexAlign = FLEX_ALIGN_CENTER;
      style.flexDirection = FLEX_DIRECTION_COLUMN;
      style.textAlign = TEXT_ALIGN_CENTER;
      style.showPageTitle = false;
      style.showSecondMenu = true;
      style.itemWidth = '';
      style.listDirection = AXIS_HORIZONTAL;
      style.searchPaddingLeft = 0;
      style.searchPaddingRight = 0;
      style.toolPaddingLeft = 0;
      style.toolPaddingRight = 0;
    } else {
      style.textMarginTop = 0;
      style.textMarginLeft = 8;
      style.listSpace = 0;
      style.itemMarginLeft = 44;
      style.itemHeight = 48;
      style.navPaddingLeft = 12;
      style.navPaddingRight = 12;
      style.menuPaddingLeft = 12;
      style.menuPaddingRight = 12;
      style.flexAlign = FLEX_ALIGN_START;
      style.flexDirection = FLEX_DIRECTION_ROW;
      style.textAlign = TEXT_ALIGN_START;
      style.showPageTitle = true;
      style.showSecondMenu = false;
      style.itemWidth = '100%';
      style.listDirection = AXIS_VERTICAL;
      style.searchPaddingLeft = 12;
      style.searchPaddingRight = 12;
      style.toolPaddingLeft = 12;
      style.toolPaddingRight = 12;
    }
    return style;
  }

  public static getCurrentSubTabsStyle(currentBreakpoint: string, currentSideBarMode: string,
    index: number, currentIndex: number): NavBarFontStyle {
    const style: NavBarFontStyle = new NavBarFontStyle();
    const compact: boolean = NavBarStyleModel.isCompactMode(currentBreakpoint, currentSideBarMode);
    if (compact) {
      if (index === currentIndex) {
        style.fontSize = NAV_COMPACT_TEXT_SIZE;
        style.backgroundColor = '#00ffffff';
        style.fontColor = '#000';
      } else {
        style.fontSize = 18;
        style.backgroundColor = '#00ffffff';
        style.fontColor = '#99000000';
      }
    } else {
      style.fontSize = NAV_EXPANDED_TEXT_SIZE;
      if (index === currentIndex) {
        style.backgroundColor = '#190A59F7';
        style.fontColor = '#0A59F7';
      } else {
        style.backgroundColor = '#00ffffff';
        style.fontColor = '#000';
      }
    }
    return style;
  }
}
