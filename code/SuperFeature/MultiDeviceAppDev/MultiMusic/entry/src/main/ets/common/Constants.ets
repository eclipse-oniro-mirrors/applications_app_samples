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
 * Breakpoint identifiers shared by all pages.
 */
export class BreakpointConstants {
  static readonly SM: string = 'sm';
  static readonly MD: string = 'md';
  static readonly LG: string = 'lg';
}

/**
 * Layout metrics of the root GridRow and the tab bar.
 */
export class TabBarConstants {
  static readonly GRID_COLUMNS_SM: number = 4;
  static readonly GRID_COLUMNS_MD: number = 8;
  static readonly GRID_COLUMNS_LG: number = 12;
  static readonly ICON_SIZE: number = 24;
  static readonly LABEL_TOP_MARGIN: number = 4;
  static readonly LABEL_FONT_SIZE: number = 10;
  static readonly LABEL_HEIGHT: number = 14;
  static readonly LABEL_LINE_HEIGHT: number = 14;
  static readonly HEIGHT: number = 56;
  static readonly BREAKPOINT_ANIMATION_DURATION: number = 600;
}

/**
 * Layout metrics of the mini music player.
 */
export class MusicPlayerConstants {
  static readonly COVER_SIZE: number = 32;
  static readonly COVER_LEFT_MARGIN: number = 12;
  static readonly TITLE_FONT_SIZE: number = 14;
  static readonly ARTIST_FONT_SIZE: number = 10;
  static readonly ARTIST_OPACITY: number = 0.6;
  static readonly ICON_SIZE: number = 26;
  static readonly ICON_LEFT_MARGIN: number = 20;
  static readonly HEIGHT: number = 48;
  static readonly HORIZONTAL_PADDING: number = 16;
}

/**
 * Page level spacing of the recommend page.
 */
export class RecommendPageConstants {
  static readonly PADDING: number = 16;
  static readonly PADDING_LG: number = 24;
  static readonly BANNER_TOP_MARGIN: number = 8;
  static readonly MODULE_TOP_MARGIN: number = 24;
  static readonly SONG_LIST_TOP_MARGIN: number = 26;
}

/**
 * Layout metrics of the banner area.
 */
export class BannerConstants {
  static readonly COLUMN_SPACE: number = 13;
  static readonly COLUMN_ITEM_SPACE: number = 10;
  static readonly MAIN_HEIGHT: number = 249;
  static readonly SIDE_HEIGHT: number = 120;
  static readonly MAIN_WIDTH: string = '66%';
  static readonly SIDE_WIDTH: string = '33%';
  static readonly BORDER_RADIUS: number = 12;
  static readonly SWIPER_HEIGHT: number = 191;
  static readonly SWIPER_BORDER_RADIUS: number = 10;
  static readonly SWIPER_ITEM_SPACE: number = 8;
  static readonly SWIPER_CACHED_COUNT: number = 3;
  static readonly SWIPER_DISPLAY_COUNT_SM: number = 1;
  static readonly SWIPER_DISPLAY_COUNT_MD: number = 2;
  static readonly SWIPER_DISPLAY_COUNT_LG: number = 3;
}

/**
 * Layout metrics of the recommended song grid.
 */
export class SongGridConstants {
  static readonly HEADER_HEIGHT: number = 48;
  static readonly TITLE_FONT_SIZE: number = 16;
  static readonly ACTION_FONT_SIZE: number = 14;
  static readonly ARROW_HEIGHT: number = 24;
  static readonly ARROW_WIDTH: number = 12;
  static readonly ARROW_OPACITY: number = 0.3;
  static readonly PLAY_ICON_SIZE: number = 20;
  static readonly PLAY_ICON_OFFSET_X: number = 6;
  static readonly PLAY_ICON_OFFSET_Y: number = -6;
  static readonly LABEL_TOP_MARGIN: number = 8;
  static readonly LABEL_FONT_SIZE: number = 14;
  static readonly LABEL_HEIGHT: number = 38;
  static readonly ROW_GAP: number = 16;
  static readonly COLUMN_GAP: number = 8;
  static readonly DEFAULT_HEIGHT: number = 900;
  static readonly COLUMNS_SM: number = 3;
  static readonly COLUMNS_MD: number = 5;
  static readonly COLUMNS_LG: number = 6;
  static readonly COLUMNS_TEMPLATE_SM: string = '1fr 1fr 1fr';
  static readonly COLUMNS_TEMPLATE_MD: string = '1fr 1fr 1fr 1fr 1fr';
  static readonly COLUMNS_TEMPLATE_LG: string = '1fr 1fr 1fr 1fr 1fr 1fr';
  static readonly PLAYER_EXTRA_HEIGHT: number = 48;
}

/**
 * Layout metrics of the horizontal entry list.
 */
export class ListModuleConstants {
  static readonly ICON_SIZE: number = 40;
  static readonly LABEL_TOP_MARGIN: number = 8;
  static readonly LABEL_FONT_SIZE: number = 12;
  static readonly ITEM_SIZE: number = 64;
  static readonly HEIGHT: number = 64;
  static readonly SPACE_SM: number = 0;
  static readonly SPACE_MD: number = 35;
  static readonly SPACE_LG: number = 63;
}

/**
 * Layout metrics of the title bar.
 */
export class TitleBarConstants {
  static readonly GRID_COLUMNS_SM: number = 8;
  static readonly GRID_COLUMNS_MD: number = 16;
  static readonly GRID_COLUMNS_LG: number = 24;
  static readonly TITLE_SPAN_SM: number = 7;
  static readonly TITLE_SPAN_MD: number = 6;
  static readonly TITLE_SPAN_LG: number = 15;
  static readonly SEARCH_SPAN_SM: number = 7;
  static readonly SEARCH_SPAN_MD: number = 8;
  static readonly SEARCH_SPAN_LG: number = 7;
  static readonly ICON_SPAN: number = 1;
  static readonly TITLE_ORDER_SM: number = 1;
  static readonly TITLE_ORDER_MD: number = 1;
  static readonly TITLE_ORDER_LG: number = 1;
  static readonly SEARCH_ORDER_SM: number = 3;
  static readonly SEARCH_ORDER_MD: number = 2;
  static readonly SEARCH_ORDER_LG: number = 2;
  static readonly ACTION_ORDER_SM: number = 2;
  static readonly ACTION_ORDER_MD: number = 4;
  static readonly ACTION_ORDER_LG: number = 4;
  static readonly LISTENER_ORDER_SM: number = 4;
  static readonly LISTENER_ORDER_MD: number = 3;
  static readonly LISTENER_ORDER_LG: number = 3;
  static readonly ICON_SIZE: number = 24;
  static readonly ICON_AREA_HEIGHT: number = 56;
  static readonly TITLE_LINE_HEIGHT: number = 33;
  static readonly TITLE_FONT_SIZE: number = 24;
  static readonly SEARCH_HEIGHT: number = 40;
  static readonly SEARCH_AREA_HEIGHT: number = 56;
}

/**
 * Layout metrics of the user song list page.
 */
export class UserSongListConstants {
  static readonly TITLE_FONT_SIZE: number = 24;
  static readonly TITLE_LINE_HEIGHT: number = 33;
  static readonly HEADER_HEIGHT: number = 56;
  static readonly ICON_SIZE: number = 24;
  static readonly ICON_RIGHT_MARGIN: number = 24;
  static readonly SUBTITLE_FONT_SIZE: number = 16;
  static readonly SUBTITLE_LINE_HEIGHT: number = 22;
  static readonly SUBTITLE_ROW_HEIGHT: number = 48;
  static readonly SELF_BUILD_SONG_COUNT: number = 50;
  static readonly IMAGE_SIZE: string = '48vp';
  static readonly IMAGE_FULL_SIZE: string = '100%';
  static readonly IMAGE_BORDER_RADIUS: number = 8;
  static readonly PLAY_ICON_SIZE: number = 20;
  static readonly PLAY_OFFSET_X: number = 11;
  static readonly PLAY_OFFSET_Y: number = -11;
  static readonly LABEL_FONT_SIZE: number = 16;
  static readonly LABEL_LINE_HEIGHT: number = 22;
  static readonly LABEL_HEIGHT: number = 22;
  static readonly COUNT_FONT_SIZE: number = 12;
  static readonly COUNT_LINE_HEIGHT: number = 14;
  static readonly COUNT_HEIGHT: number = 14;
  static readonly TEXT_LEFT_MARGIN: number = 16;
  static readonly TEXT_LEFT_MARGIN_NONE: number = 0;
  static readonly TEXT_BLOCK_HEIGHT: number = 48;
  static readonly ARROW_WIDTH: number = 12;
  static readonly ARROW_HEIGHT: number = 24;
  static readonly ARROW_ROW_HEIGHT: number = 48;
  static readonly DIVIDER_STROKE_WIDTH: string = '1px';
  static readonly DIVIDER_LEFT_MARGIN: number = 64;
  static readonly COLUMNS_SM: string = '1fr';
  static readonly COLUMNS_MD: string = '1fr 1fr 1fr 1fr 1fr';
  static readonly COLUMNS_LG: string = '1fr 1fr 1fr 1fr 1fr 1fr';
  static readonly COLUMNS_GAP: number = 7;
  static readonly ROWS_GAP: number = 12;
  static readonly HORIZONTAL_PADDING: number = 16;
}
