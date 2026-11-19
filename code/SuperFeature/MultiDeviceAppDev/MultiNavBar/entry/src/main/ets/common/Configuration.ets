/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
import { BreakpointKey, Color, DimenText, SideBarModeKey } from './Constants';
import { CustomBreakPointStyle, CustomFontStyle, CustomLength, SubTabsControllerStyle } from '../model/StyleType';

/**
 * 设计稿冻结数值（单位 vp / fp）。
 * 数值按设计标注逐字保留，ohosTest 的冻结期望表（util/NavSpec.ts 的 FrozenBreakpointStyle、
 * FrozenSubTabsStyleCompact、FrozenSubTabsStyleWide）对这些字段逐项断言，改动需同步用例。
 */
class DesignSpec {
  /** 顶部控制按钮：左偏移 24、上偏移 40、图标 24 x 24，sm 与 md/lg 共用。 */
  static readonly CONTROL_BUTTON: CustomLength = { left: 24, top: 40, width: 24, height: 24 };

  /** sm：底部 tab 形态。 */
  static readonly SM_NAV_LIST_MARGIN: number = 0;
  static readonly SM_MENU_IMG_MARGIN: CustomLength = { top: 7 };
  static readonly SM_MENU_TEXT_SIZE: number = 10;
  static readonly SM_MENU_TEXT_HEIGHT: number = 14;
  static readonly SM_CONTENT_MARGIN: CustomLength = { top: 24, bottom: 0, left: 16, right: 16 };
  static readonly SM_RECOMMEND_MARGIN: CustomLength = { top: 0 };
  static readonly SM_RECOMMEND_GRID_HEIGHT: number = 284;
  static readonly SM_RECOMMEND_GRID_ITEM_HEIGHT: number = 138;
  static readonly SM_RECOMMEND_GRID_SEC_HEIGHT: number = 576;

  /** md/lg：侧边槽形态。 */
  static readonly MD_NAV_LIST_MARGIN: number = 24;
  static readonly MD_MENU_IMG_MARGIN: CustomLength = { top: 0 };
  static readonly MD_MENU_TEXT_SIZE: number = 12;
  static readonly MD_MENU_TEXT_HEIGHT: number = 16;
  static readonly MD_CONTENT_MARGIN: CustomLength = { left: 24, right: 24, top: 24, bottom: 22 };
  static readonly MD_RECOMMEND_MARGIN: CustomLength = { top: 16 };
  static readonly MD_RECOMMEND_GRID_HEIGHT: number = 106;
  static readonly MD_RECOMMEND_GRID_ITEM_HEIGHT: number = 106;
  static readonly MD_RECOMMEND_GRID_SEC_HEIGHT: number = 220;

  /** 二级菜单：sm / list 模式（紧凑）。 */
  static readonly COMPACT_TEXT_MARGIN: CustomLength = { top: 4, left: 0 };
  static readonly COMPACT_SECOND_MENU_SPACE: number = 16;
  static readonly COMPACT_SECOND_MENU_ITEM_MARGIN: CustomLength = { left: 0 };
  static readonly COMPACT_SECOND_MENU_ITEM_HEIGHT: number = 56;
  static readonly COMPACT_LIST_PADDING: CustomLength = { left: 0 };
  static readonly COMPACT_MENU_PADDING: CustomLength = { left: 0, right: 0 };
  static readonly COMPACT_ITEM_FONT_SIZE: number = 24;
  static readonly COMPACT_INACTIVE_FONT_SIZE: number = 18;

  /** 二级菜单：md/lg tabs 模式（宽松）。 */
  static readonly WIDE_TEXT_MARGIN: CustomLength = { top: 0, left: 8 };
  static readonly WIDE_SECOND_MENU_SPACE: number = 0;
  static readonly WIDE_SECOND_MENU_ITEM_HEIGHT: number = 48;
  static readonly WIDE_SECOND_MENU_ITEM_MARGIN: CustomLength = { left: 44 };
  static readonly WIDE_LIST_PADDING: CustomLength = { left: 12, right: 12 };
  static readonly WIDE_MENU_PADDING: CustomLength = { left: 12, right: 12 };
  static readonly WIDE_ITEM_FONT_SIZE: number = 16;
}

/**
 * 响应式样式表：各断点/侧边槽模式下的设计稿数值集中在此，组件内不再散落写数值。
 * 颜色与尺寸字符串取自 Constants，数值取自 DesignSpec，调整需同步 ohosTest 冻结期望表。
 */
export class StyleConfiguration {
  static getBreakpointStyle(currentBreakpoint: string): CustomBreakPointStyle {
    let customBreakPointStyle: CustomBreakPointStyle;
    if (currentBreakpoint === BreakpointKey.SM) {
      customBreakPointStyle = {
        controlButtonStyle: DesignSpec.CONTROL_BUTTON,
        sideBarPrimaryNavListHeight: DimenText.NAV_LIST_HEIGHT_SM,
        sideBarPrimaryNavListMargin: DesignSpec.SM_NAV_LIST_MARGIN,
        sideBarPrimaryNavListItemWidth: DimenText.NAV_LIST_ITEM_WIDTH_SM,
        sideBarPrimaryMenuImgMargin: DesignSpec.SM_MENU_IMG_MARGIN,
        sideBarPrimaryMenuTextSize: DesignSpec.SM_MENU_TEXT_SIZE,
        sideBarPrimaryMenuTextHeight: DesignSpec.SM_MENU_TEXT_HEIGHT,
        mainTabsContentMargin: DesignSpec.SM_CONTENT_MARGIN,
        recommendCompMargin: DesignSpec.SM_RECOMMEND_MARGIN,
        recommendCompGridHeight: DesignSpec.SM_RECOMMEND_GRID_HEIGHT,
        recommendCompGridItemHeight: DesignSpec.SM_RECOMMEND_GRID_ITEM_HEIGHT,
        recommendCompGridSecHeight: DesignSpec.SM_RECOMMEND_GRID_SEC_HEIGHT,
        mainTabsBcColor: Color.PAGE_BACKGROUND,
      };
    } else {
      customBreakPointStyle = {
        controlButtonStyle: DesignSpec.CONTROL_BUTTON,
        sideBarPrimaryNavListHeight: DimenText.EMPTY,
        sideBarPrimaryNavListMargin: DesignSpec.MD_NAV_LIST_MARGIN,
        sideBarPrimaryNavListItemWidth: DimenText.FULL,
        sideBarPrimaryMenuImgMargin: DesignSpec.MD_MENU_IMG_MARGIN,
        sideBarPrimaryMenuTextSize: DesignSpec.MD_MENU_TEXT_SIZE,
        sideBarPrimaryMenuTextHeight: DesignSpec.MD_MENU_TEXT_HEIGHT,
        mainTabsContentMargin: DesignSpec.MD_CONTENT_MARGIN,
        recommendCompMargin: DesignSpec.MD_RECOMMEND_MARGIN,
        recommendCompGridItemHeight: DesignSpec.MD_RECOMMEND_GRID_ITEM_HEIGHT,
        recommendCompGridHeight: DesignSpec.MD_RECOMMEND_GRID_HEIGHT,
        recommendCompGridSecHeight: DesignSpec.MD_RECOMMEND_GRID_SEC_HEIGHT,
        mainTabsBcColor: Color.CONTENT_BACKGROUND,
      };
    }
    return customBreakPointStyle;
  }

  /**
   * 主菜单项文字/图标配色：选中态取主色，未选中态无填充色。
   * sm 与 md/lg 的取值完全一致，原实现按断点分支后写入相同结果，此处合并为单一分支。
   */
  static getCurrentMainTabsStyle(index: number, currentIndex: number, currentBreakpoint: string): CustomFontStyle {
    let customFontStyle: CustomFontStyle;
    if (index === currentIndex) {
      customFontStyle = {
        fillColor: Color.PRIMARY,
        fontColor: Color.PRIMARY
      };
    } else {
      customFontStyle = {
        fillColor: DimenText.EMPTY,
        fontColor: Color.TEXT_SECONDARY
      };
    }
    return customFontStyle;
  }

  static getSubTabsControllerStyle(currentBreakpoint: string, currentSideBarMode: string): SubTabsControllerStyle {
    let subTabsControllerStyle: SubTabsControllerStyle;
    if (currentBreakpoint === BreakpointKey.SM || currentSideBarMode === SideBarModeKey.LIST) {
      subTabsControllerStyle = {
        sideBarPrimaryMenuTextMargin: DesignSpec.COMPACT_TEXT_MARGIN,
        secondMenuListSpace: DesignSpec.COMPACT_SECOND_MENU_SPACE,
        secondMenuListItemMargin: DesignSpec.COMPACT_SECOND_MENU_ITEM_MARGIN,
        secondMenuListItemHeight: DesignSpec.COMPACT_SECOND_MENU_ITEM_HEIGHT,
        sideBarPrimaryNavListPadding: DesignSpec.COMPACT_LIST_PADDING,
        sideBarPrimaryMenuListPadding: DesignSpec.COMPACT_MENU_PADDING,
        sideBarPrimaryMenuFlexAlign: FlexAlign.Center,
        sideBarPrimaryMenuFlexDirection: FlexDirection.Column,
        primaryMenuTextAlign: TextAlign.Center,
        isShowPageTitle: false,
        isShowSecondMenu: true,
        secondMenuListItemWidth: DimenText.EMPTY,
        secondMenuListDirection: Axis.Horizontal,
        searchModulePadding: DesignSpec.COMPACT_MENU_PADDING,
        toolBarPadding: DesignSpec.COMPACT_MENU_PADDING,
      };
    } else {
      subTabsControllerStyle = {
        sideBarPrimaryMenuTextMargin: DesignSpec.WIDE_TEXT_MARGIN,
        secondMenuListSpace: DesignSpec.WIDE_SECOND_MENU_SPACE,
        secondMenuListItemHeight: DesignSpec.WIDE_SECOND_MENU_ITEM_HEIGHT,
        secondMenuListItemMargin: DesignSpec.WIDE_SECOND_MENU_ITEM_MARGIN,
        sideBarPrimaryNavListPadding: DesignSpec.WIDE_LIST_PADDING,
        sideBarPrimaryMenuListPadding: DesignSpec.WIDE_MENU_PADDING,
        sideBarPrimaryMenuFlexAlign: FlexAlign.Start,
        sideBarPrimaryMenuFlexDirection: FlexDirection.Row,
        primaryMenuTextAlign: TextAlign.Start,
        isShowPageTitle: true,
        isShowSecondMenu: false,
        secondMenuListItemWidth: DimenText.FULL,
        secondMenuListDirection: Axis.Vertical,
        searchModulePadding: DesignSpec.WIDE_MENU_PADDING,
        toolBarPadding: DesignSpec.WIDE_MENU_PADDING,
      };
    }
    return subTabsControllerStyle;
  }

  static getCurrentSubTabsStyle(currentBreakpoint: string, currentSideBarMode: string, index: number,
    currentIndex: number): CustomFontStyle {
    let customFontStyle: CustomFontStyle;
    if (currentBreakpoint === BreakpointKey.SM || currentSideBarMode === SideBarModeKey.LIST) {
      if (index === currentIndex) {
        customFontStyle = {
          fontSize: DesignSpec.COMPACT_ITEM_FONT_SIZE, backgroundColor: Color.TRANSPARENT, fontColor: Color.TEXT_ON_LIGHT
        };
      } else {
        customFontStyle = {
          fontSize: DesignSpec.COMPACT_INACTIVE_FONT_SIZE, backgroundColor: Color.TRANSPARENT, fontColor: Color.TEXT_MUTED
        };
      }
    } else {
      if (index === currentIndex) {
        customFontStyle = {
          fontSize: DesignSpec.WIDE_ITEM_FONT_SIZE, backgroundColor: Color.PRIMARY_TRANSLUCENT, fontColor: Color.PRIMARY_ACCENT
        };
      } else {
        customFontStyle = {
          fontSize: DesignSpec.WIDE_ITEM_FONT_SIZE, backgroundColor: Color.TRANSPARENT, fontColor: Color.TEXT_ON_LIGHT
        };
      }
    }
    return customFontStyle;
  }
}
