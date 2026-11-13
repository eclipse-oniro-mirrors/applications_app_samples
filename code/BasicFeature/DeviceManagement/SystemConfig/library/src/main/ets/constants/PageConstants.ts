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

import { ResourceHelper } from '../utils/basic/ResourceHelper';

/**
 * Page routing constants and UI dimension constants.
 * Centralizes all page paths and layout parameters to avoid hardcoding.
 */
export class PageConstants {
  /** Home page route */
  static readonly PAGE_INDEX: string = 'pages/Index';
  /** Custom Config page route */
  static readonly PAGE_CUSTOM_CONFIG: string = 'pages/customconfig/CustomConfigPage';
  /** Intelligent Scene page route */
  static readonly PAGE_INTELLIGENT_SCENE: string = 'pages/intelligentScene/IntelligentScenePage';
  /** Settings Lite page route */
  static readonly PAGE_SETTINGS_LITE: string = 'pages/settingslite/SettingsLitePage';

  /** Home page title (text in string.json page_title_index, resolved by name) */
  static get TITLE_INDEX(): string {
    return ResourceHelper.getStringByName('page_title_index');
  }

  /** Custom Config title (text in string.json page_title_custom_config) */
  static get TITLE_CUSTOM_CONFIG(): string {
    return ResourceHelper.getStringByName('page_title_custom_config');
  }

  /** Intelligent Scene title (text in string.json page_title_intelligent_scene) */
  static get TITLE_INTELLIGENT_SCENE(): string {
    return ResourceHelper.getStringByName('page_title_intelligent_scene');
  }

  /** Settings Lite title (text in string.json page_title_settings_lite) */
  static get TITLE_SETTINGS_LITE(): string {
    return ResourceHelper.getStringByName('page_title_settings_lite');
  }

  /** Status bar height */
  static readonly STATUS_BAR_HEIGHT: number = 56;
  /** Navigation bar height */
  static readonly NAV_BAR_HEIGHT: number = 56;
  /** Navigation item height */
  static readonly NAV_ITEM_HEIGHT: number = 64;
  /** Page padding */
  static readonly PAGE_PADDING: number = 16;
  /** Card padding */
  static readonly CARD_PADDING: number = 16;
  /** Card corner radius */
  static readonly CARD_BORDER_RADIUS: number = 12;
  /** Button corner radius */
  static readonly BUTTON_BORDER_RADIUS: number = 8;
  /** Button height */
  static readonly BUTTON_HEIGHT: number = 40;
  /** Item spacing */
  static readonly ITEM_SPACING: number = 12;
  /** Section spacing */
  static readonly SECTION_SPACING: number = 16;
  /** Small inner spacing of cards */
  static readonly CARD_INNER_SPACING: number = 8;
  /** Navigation icon size */
  static readonly NAV_ICON_SIZE: number = 32;
  /** Label column width (short) */
  static readonly LABEL_WIDTH_SHORT: number = 60;
  /** Label column width (medium) */
  static readonly LABEL_WIDTH_MEDIUM: number = 80;
  /** Label column width (long) */
  static readonly LABEL_WIDTH_LONG: number = 100;
  /** Maximum log panel height */
  static readonly LOG_PANEL_MAX_HEIGHT: number = 200;
  /** Permission tip top margin */
  static readonly PERMISSION_TIP_MARGIN_TOP: number = 4;
  /** Tiny spacing */
  static readonly SPACING_TINY: number = 4;

  /** Title font size */
  static readonly FONT_SIZE_TITLE: number = 20;
  /** Subtitle font size */
  static readonly FONT_SIZE_SUBTITLE: number = 16;
  /** Body font size */
  static readonly FONT_SIZE_BODY: number = 14;
  /** Small font size */
  static readonly FONT_SIZE_SMALL: number = 12;
  /** Caption font size */
  static readonly FONT_SIZE_CAPTION: number = 11;

  /** Bold */
  static readonly FONT_WEIGHT_BOLD: number = 700;
  /** Medium weight */
  static readonly FONT_WEIGHT_MEDIUM: number = 500;
  /** Normal weight */
  static readonly FONT_WEIGHT_NORMAL: number = 400;

  /** Background color */
  static readonly COLOR_BACKGROUND: string = '#F5F5F5';
  /** Card background color */
  static readonly COLOR_CARD: string = '#FFFFFF';
  /** Primary color */
  static readonly COLOR_PRIMARY: string = '#007DFF';
  /** Success color */
  static readonly COLOR_SUCCESS: string = '#4CAF50';
  /** Warning color */
  static readonly COLOR_WARNING: string = '#FF9800';
  /** Error color */
  static readonly COLOR_ERROR: string = '#F44336';
  /** Connected indicator color */
  static readonly COLOR_CONNECTED: string = '#4CAF50';
  /** Disconnected indicator color */
  static readonly COLOR_DISCONNECTED: string = '#F44336';
  /** Primary text color */
  static readonly COLOR_TEXT_PRIMARY: string = '#333333';
  /** Secondary text color */
  static readonly COLOR_TEXT_SECONDARY: string = '#666666';
  /** Hint text color */
  static readonly COLOR_TEXT_HINT: string = '#999999';
  /** Success status background color */
  static readonly COLOR_STATUS_SUCCESS_BG: string = '#E8F5E9';
  /** Failure status background color */
  static readonly COLOR_STATUS_FAIL_BG: string = '#FFEBEE';
  /** Warning/loading status background color */
  static readonly COLOR_STATUS_WARNING_BG: string = '#FFF3E0';
  /** Default status background color */
  static readonly COLOR_STATUS_DEFAULT_BG: string = '#F0F0F0';
  /** Card shadow color */
  static readonly COLOR_SHADOW: string = 'rgba(0,0,0,0.1)';
}
