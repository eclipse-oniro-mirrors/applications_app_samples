/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

// 断点键与 LocalStorage 键
export const BREAKPOINT_SM: string = 'sm';
export const BREAKPOINT_MD: string = 'md';
export const BREAKPOINT_LG: string = 'lg';
export const KEY_CURRENT_BREAKPOINT: string = 'currentBreakPoint';

// 页面路由
export const PAGE_INDEX: string = 'pages/Index';
export const ROUTE_MAILBOX: string = 'Application/MailBox';
export const ROUTE_PHOTO_ALBUM: string = 'Application/PhotoAlbum';
export const ROUTE_SETTINGS: string = 'Application/Settings';
export const NAV_PATH_FIRST: string = 'one';

// 侧栏与断点联动尺寸（px）
export const SIDE_BAR_WIDTH: number = 304;
export const MIN_SIDE_BAR_WIDTH: number = 240;
export const MIN_CONTENT_WIDTH_SM: number = 360;
export const MIN_CONTENT_WIDTH_MD_LG: number = 600;
export const MAIL_NAV_BAR_WIDTH_SM: number = 321;
export const MAIL_NAV_BAR_WIDTH_MD: number = 321;
export const MAIL_NAV_BAR_WIDTH_LG: number = 390;
export const SETTINGS_NAV_BAR_WIDTH: number = 293;
export const CONTROL_BUTTON_LEFT: number = 24;
export const CONTROL_BUTTON_WIDTH: number = 24;
export const CONTROL_BUTTON_HEIGHT: number = 24;
export const CONTROL_BUTTON_TOP_MAILBOX: number = 40;
export const CONTROL_BUTTON_TOP_PHOTO_ALBUM: number = 16;
export const PHOTO_SIDE_BAR_MARGIN_TOP: number = 64;

// 视觉设计令牌（vp）：字号
export const FONT_DISPLAY: number = 30;
export const FONT_TITLE: number = 20;
export const FONT_SUBTITLE: number = 16;
export const FONT_BODY: number = 14;
export const FONT_CAPTION: number = 12;
export const FONT_BADGE: number = 10;

// 视觉设计令牌（vp）：行高
export const LINE_HEIGHT_DISPLAY: number = 41;
export const LINE_HEIGHT_TITLE: number = 23;
export const LINE_HEIGHT_SUBTITLE: number = 22;
export const LINE_HEIGHT_SUBTITLE_TIGHT: number = 20;
export const LINE_HEIGHT_BODY: number = 25;
export const LINE_HEIGHT_BODY_TIGHT: number = 19;
export const LINE_HEIGHT_BADGE: number = 12;

// 视觉设计令牌（vp）：图标尺寸
export const ICON_XXS: number = 12;
export const ICON_XS: number = 16;
export const ICON_SM: number = 18;
export const ICON_MD: number = 24;
export const ICON_LG: number = 32;
export const ICON_XXL: number = 48;

// 视觉设计令牌（vp）：行高与图片尺寸
export const ROW_HEIGHT_TITLE_BAR: number = 26;
export const ROW_HEIGHT_TOOLBAR: number = 48;
export const ROW_HEIGHT_LIST_ITEM: number = 56;
export const ROW_HEIGHT_MAIL_ITEM: number = 96;
export const MAIL_BODY_IMAGE_HEIGHT: number = 166;
export const MAIL_BODY_CONTENT_HEIGHT: number = 478;
export const NAV_TITLE_WIDTH: number = 138;
export const NAV_TITLE_HEIGHT: number = 162;
export const SWITCH_WIDTH: number = 36;
export const SWITCH_HEIGHT: number = 20;
export const CASE_BUTTON_WIDTH: number = 100;

// 视觉设计令牌（vp）：圆角
export const RADIUS_BADGE: number = 5;
export const RADIUS_TAG: number = 8;
export const RADIUS_COMPACT: number = 10;
export const RADIUS_THUMBNAIL: number = 12;
export const RADIUS_CARD: number = 16;
export const RADIUS_CIRCLE: number = 18;
export const RADIUS_CARD_SM: number = 20;
export const RADIUS_CARD_LG: number = 24;

// 视觉设计令牌：透明度与间距
export const OPACITY_NEAR_FULL: number = 0.9;
export const OPACITY_TERTIARY: number = 0.8;
export const OPACITY_SECONDARY: number = 0.6;
export const GRID_COLUMNS_GAP: number = 22;
export const GRID_ROWS_GAP: number = 17;
export const PADDING_XS: number = 4;

// 其他业务常量
export const SELECTED_MAIL_INDEX: number = 2;
export const MAIL_CONTENT_PADDING_SM: number = 21;
export const MAIL_CONTENT_PADDING_MD_LG: number = 46;
export const COLUMNS_TEMPLATE_THREE: string = '1fr 1fr 1fr';
export const COLUMNS_TEMPLATE_FOUR: string = '1fr 1fr 1fr 1fr';
export const ANIMATE_DURATION: number = 300;
export const FAB_POSITION_X: number = 240;
export const FAB_POSITION_Y: number = 549;
export const FONT_HARMONY_HEITI: string = 'HarmonyHeiTi';

// 日志
export const LOG_DOMAIN: number = 0xF811;
export const LOG_TAG: string = '[MultiColumns]';
