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

/**
 * 全局常量：集中替代散落在各组件中的魔法字符串、颜色、尺寸、时长与阈值。
 * 所有取值均与改造前保持逐字一致，以免影响既有 ohosTest 用例的冻结期望表。
 */

/**
 * 断点 key。取值必须与 BreakpointType.GetValue 的比较值一致。
 */
export enum BreakpointKey {
  SM = 'sm',
  MD = 'md',
  LG = 'lg'
}

/**
 * 侧边栏模式 key。取值必须与 SideBarMode.GetValue 的比较值一致。
 */
export enum SideBarModeKey {
  LIST = 'list',
  TABS = 'tabs'
}

/**
 * LocalStorage 键名。
 * 注意：@LocalStorageLink/@LocalStorageProp 与 @Watch 的参数在 ArkTS 中必须是字符串字面量，
 * 装饰器处无法引用本常量。当前也没有其他代码引用，本类仅作文档用途，不要当作字面量的替代品。
 */
export class StorageKey {
  static readonly BREAKPOINT: string = 'currentBreakpoint';
  static readonly SIDE_BAR_MODE: string = 'currentSideBarMode';
}

/**
 * 颜色（ARGB 或 RGB 十六进制）。同一语义只允许一个取值，禁止再出现大小写不同的同义色。
 */
export class Color {
  static readonly PRIMARY: string = '#0a59f7';
  /**
   * 与 PRIMARY 同色，仅十六进制字母大小写不同。
   * ohosTest 的冻结期望表（util/NavSpec.ts: SUB_TABS_TABS_ACTIVE_FONT）按原值逐字断言，
   * 因此此处不可与 PRIMARY 合并，也不可改成小写。
   */
  static readonly PRIMARY_ACCENT: string = '#0A59F7';
  static readonly PRIMARY_TRANSLUCENT: string = '#190A59F7';
  static readonly PAGE_BACKGROUND: string = '#f1f3f5';
  static readonly CONTENT_BACKGROUND: string = '#fff';
  static readonly TEXT_PRIMARY: string = '#E5000000';
  static readonly TEXT_SECONDARY: string = '#182431';
  static readonly TEXT_ON_LIGHT: string = '#000';
  static readonly TEXT_MUTED: string = '#99000000';
  static readonly ICON_MUTED: string = '#66000000';
  static readonly TRANSPARENT: string = '#00ffffff';
  static readonly BUTTON_BACKGROUND: string = '#0c000000';
  static readonly IMAGE_PLACEHOLDER: string = '#7fD8D8D8';
}

/**
 * 尺寸（单位 vp）。
 */
export class Dimen {
  static readonly ICON: number = 24;
  static readonly ICON_LARGE: number = 40;
  static readonly APP_ICON: number = 56;
  static readonly NAV_ROW_HEIGHT: number = 56;
  static readonly NAV_ROW_HEIGHT_COMPACT: number = 40;
  static readonly LIST_ITEM_HEIGHT: number = 48;
  static readonly TOOL_BAR_HEIGHT: number = 58;
  static readonly GRID_ROW_HEIGHT: number = 72;
  static readonly GRID_ROW_MARGIN_TOP: number = 12.5;
  static readonly CONTENT_MARGIN_BOTTOM: number = 12;
  static readonly DRAWER_ICON_MARGIN_TOP: number = 41;
  static readonly SEARCH_HEIGHT: number = 40;
  static readonly SEARCH_COLLAPSED_WIDTH: number = 40;
  static readonly ARROW_ICON_WIDTH: number = 12;
  static readonly INSTALL_BUTTON_WIDTH: number = 56;
  static readonly INSTALL_BUTTON_HEIGHT: number = 28;
  static readonly SIDE_BAR_WIDTH_SM: number = 0;
  static readonly SIDE_BAR_WIDTH_MD: number = 64;
  static readonly SIDE_BAR_WIDTH_LG: number = 96;
  static readonly SIDE_BAR_WIDTH_TABS: number = 240;
  /** tabs 模式下的最小宽度，设计稿上与 SIDE_BAR_WIDTH_TABS 同值，两者语义不同，不可合并。 */
  static readonly SIDE_BAR_MIN_WIDTH_TABS: number = 240;
  static readonly SIDE_BAR_MAX_WIDTH_TABS: number = 280;
}

/**
 * 间距（vp），按设计令牌的四级刻度收敛。
 */
export class Spacing {
  static readonly XXS: number = 4;
  static readonly XS: number = 7;
  static readonly SM: number = 8;
  static readonly MD: number = 12;
  static readonly LG: number = 24;
}

/**
 * 圆角（vp）。
 */
export class Radius {
  static readonly SM: number = 8;
  static readonly MD: number = 10;
}

/**
 * 列表间距（vp），按断点分档。
 */
export class ListSpacing {
  static readonly SM: number = 20;
  static readonly MD: number = 32;
  static readonly LG: number = 36;
}

/**
 * Swiper 配置：缓存数与可见张数（按断点分档）。
 */
export class SwiperConfig {
  static readonly CACHED_COUNT: number = 3;
  static readonly ITEM_SPACE: number = 8;
  static readonly DISPLAY_COUNT_SM: number = 1;
  static readonly DISPLAY_COUNT_MD: number = 2;
  static readonly DISPLAY_COUNT_LG: number = 3;
}

/**
 * 尺寸字符串与百分比。
 */
export class DimenText {
  static readonly FULL: string = '100%';
  static readonly NAV_LIST_ITEM_WIDTH_SM: string = '20%';
  static readonly NAV_LIST_HEIGHT_SM: string = '56vp';
  static readonly EMPTY: string = '';
}

/**
 * 字体大小（fp）。响应式样式表中的字号仍集中在 Configuration.ets，此处只收组件内直接书写的字号。
 */
export class FontSize {
  static readonly PAGE_TITLE: number = 20;
  static readonly SECTION_TITLE: number = 16;
  static readonly BODY: number = 14;
  static readonly CAPTION: number = 12;
}

/**
 * 动画与延时（毫秒）。
 */
export class DurationMs {
  static readonly ANIMATION: number = 300;
  static readonly LAYOUT_SYNC: number = 100;
}

/**
 * 布局阈值与判定边界。
 */
export class Threshold {
  static readonly MENU_WRAP_WIDTH: number = 104;
  static readonly TOOL_ICON_MORE_MIN_COUNT: number = 2;
}

/**
 * 组件 id。UI 自动化用例按这些 id 定位控件，改名会破坏 220+ 条 L2 用例，需与用例同步修改。
 */
export class ComponentId {
  static readonly SWITCH_BUTTON: string = 'switchButton';
  static readonly SEARCH_BUTTON: string = 'searchButton';
  static readonly ADD_TOOLS: string = 'addTools';
  static readonly MORE_TOOLS: string = 'moreTools';
  /** 账号文案已从字面量改为资源，UI 用例改为按 id 定位，与系统语言解耦。 */
  static readonly ACCOUNT_TITLE: string = 'accountTitle';
  static readonly ACCOUNT_NUMBER: string = 'accountNumber';
}

/**
 * UIAbility 常量。
 * 日志 Domain 与 TAG 与 ohosTest 保持一致，便于按 TAG 过滤样例日志。
 */
export class AbilityConfig {
  static readonly PAGE_PATH: string = 'pages/Index';
  static readonly LOG_DOMAIN: number = 0xF811;
  static readonly LOG_TAG: string = '[Sample_MultiNavBar]';
}

/**
 * 栅格断点列数（GridRow.columns 与 GridCol.span 共用）。
 * 类型直接使用 ArkUI 的 GridRowColumnOption，不在工程内再声明同构接口，
 * 避免自定义接口与 SDK 形参之间做结构赋值。
 */
export class GridColumns {
  /** 主区域：sm/md/lg 分别占满 3/6/9 列。 */
  static readonly MAIN: GridRowColumnOption = { sm: 3, md: 6, lg: 9 };
  /** 推荐区域：sm/md/lg 分别占 4/8/12 列。 */
  static readonly RECOMMEND: GridRowColumnOption = { sm: 4, md: 8, lg: 12 };
}
