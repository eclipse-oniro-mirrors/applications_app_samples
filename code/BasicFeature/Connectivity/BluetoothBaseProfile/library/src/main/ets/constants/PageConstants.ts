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
 * page route constant amount and UI size inch constant amount specify meaning.
 * set in manage manage all page path and layout local params, avoid free hard encode.
 */
export class PageConstants {
  /** first page route by */
  static readonly PAGE_INDEX: string = 'pages/Index';
  /** A2DP page route */
  static readonly PAGE_A2DP: string = 'pages/A2dpPage';
  /** HFP page route */
  static readonly PAGE_HFP: string = 'pages/HfpPage';
  /** HID page route */
  static readonly PAGE_HID: string = 'pages/HidPage';
  /** PAN page route */
  static readonly PAGE_PAN: string = 'pages/PanPage';
  /** PBAP page route */
  static readonly PAGE_PBAP: string = 'pages/PbapPage';
  /** MAP page route */
  static readonly PAGE_MAP: string = 'pages/MapPage';
  /** AVRCP page route */
  static readonly PAGE_AVRCP: string = 'pages/AvrcpPage';
  /** HDP page route */
  static readonly PAGE_HDP: string = 'pages/HdpPage';
  /** scan page route */
  static readonly PAGE_SCAN: string = 'pages/ScanPage';
  /** already pairing device page route */
  static readonly PAGE_BONDED_DEVICES: string = 'pages/BondedDevicesPage';
  /** connection log page route */
  static readonly PAGE_CONNECTION_LOG: string = 'pages/ConnectionLogPage';
  /** Profile statistics page route */
  static readonly PAGE_PROFILE_STATISTICS: string = 'pages/ProfileStatisticsPage';
  /** combined scenario page route */
  static readonly PAGE_COMBINED_SCENARIO: string = 'pages/CombinedScenarioPage';
  /** set page route */
  static readonly PAGE_SETTINGS: string = 'pages/SettingsPage';

  /** state state column high degree */
  static readonly STATUS_BAR_HEIGHT: number = 56;
  /** guide navigation column high degree */
  static readonly NAV_BAR_HEIGHT: number = 56;
  /** guide navigation item high degree */
  static readonly NAV_ITEM_HEIGHT: number = 64;
  /** page padding */
  static readonly PAGE_PADDING: number = 16;
  /** card piece internal edge distance */
  static readonly CARD_PADDING: number = 16;
  /** card piece round angle */
  static readonly CARD_BORDER_RADIUS: number = 12;
  /** press button round angle */
  static readonly BUTTON_BORDER_RADIUS: number = 8;
  /** press button high degree */
  static readonly BUTTON_HEIGHT: number = 40;
  /** item item interval distance */
  static readonly ITEM_SPACING: number = 12;
  /** region block interval distance */
  static readonly SECTION_SPACING: number = 16;

  /** mark topic character number */
  static readonly FONT_SIZE_TITLE: number = 20;
  /** secondary mark topic character number */
  static readonly FONT_SIZE_SUBTITLE: number = 16;
  /** correct text character number */
  static readonly FONT_SIZE_BODY: number = 14;
  /** small character number */
  static readonly FONT_SIZE_SMALL: number = 12;
  /** note release character number */
  static readonly FONT_SIZE_CAPTION: number = 11;

  /** coarse body */
  static readonly FONT_WEIGHT_BOLD: number = 700;
  /** in equal coarse detail */
  static readonly FONT_WEIGHT_MEDIUM: number = 500;
  /** correct constant coarse detail */
  static readonly FONT_WEIGHT_NORMAL: number = 400;

  /** background scene color */
  static readonly COLOR_BACKGROUND: string = '#F5F5F5';
  /** card piece background scene color */
  static readonly COLOR_CARD: string = '#FFFFFF';
  /** color adjust */
  static readonly COLOR_PRIMARY: string = '#007DFF';
  /** success color */
  static readonly COLOR_SUCCESS: string = '#4CAF50';
  /** warning notify color */
  static readonly COLOR_WARNING: string = '#FF9800';
  /** error color */
  static readonly COLOR_ERROR: string = '#F44336';
  /** connected point display color */
  static readonly COLOR_CONNECTED: string = '#4CAF50';
  /** disconnected point display color */
  static readonly COLOR_DISCONNECTED: string = '#F44336';
  /** main text character color */
  static readonly COLOR_TEXT_PRIMARY: string = '#333333';
  /** times want text character color */
  static readonly COLOR_TEXT_SECONDARY: string = '#666666';
  /** provide display text character color */
  static readonly COLOR_TEXT_HINT: string = '#999999';
  /** blue tooth icon color */
  static readonly COLOR_BLUETOOTH: string = '#2196F3';
  /** audio stream color */
  static readonly COLOR_AUDIO: string = '#9C27B0';
  /** call color */
  static readonly COLOR_CALL: string = '#F44336';
  /** health data color */
  static readonly COLOR_HEALTH: string = '#00BCD4';
}
