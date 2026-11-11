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
 * 页面路由常量和 UI 尺寸常量定义。
 * 集中管理所有页面路径和布局参数，避免硬编码。
 */
export class PageConstants {
  /** 首页路由 */
  static readonly PAGE_INDEX: string = 'pages/Index';
  /** 定制配置页面路由 */
  static readonly PAGE_CUSTOM_CONFIG: string = 'pages/customconfig/CustomConfigPage';
  /** 情景模式页面路由 */
  static readonly PAGE_INTELLIGENT_SCENE: string = 'pages/intelligentScene/IntelligentScenePage';
  /** 设置信息页面路由 */
  static readonly PAGE_SETTINGS_LITE: string = 'pages/settingslite/SettingsLitePage';

  /** 首页标题 */
  static readonly TITLE_INDEX: string = '系统配置示例';
  /** 定制配置标题 */
  static readonly TITLE_CUSTOM_CONFIG: string = '定制配置';
  /** 情景模式标题 */
  static readonly TITLE_INTELLIGENT_SCENE: string = '情景模式';
  /** 设置信息标题 */
  static readonly TITLE_SETTINGS_LITE: string = '设置信息';

  /** 状态栏高度 */
  static readonly STATUS_BAR_HEIGHT: number = 56;
  /** 导航栏高度 */
  static readonly NAV_BAR_HEIGHT: number = 56;
  /** 导航项高度 */
  static readonly NAV_ITEM_HEIGHT: number = 64;
  /** 页面内边距 */
  static readonly PAGE_PADDING: number = 16;
  /** 卡片内边距 */
  static readonly CARD_PADDING: number = 16;
  /** 卡片圆角 */
  static readonly CARD_BORDER_RADIUS: number = 12;
  /** 按钮圆角 */
  static readonly BUTTON_BORDER_RADIUS: number = 8;
  /** 按钮高度 */
  static readonly BUTTON_HEIGHT: number = 40;
  /** 项目间距 */
  static readonly ITEM_SPACING: number = 12;
  /** 区块间距 */
  static readonly SECTION_SPACING: number = 16;

  /** 标题字号 */
  static readonly FONT_SIZE_TITLE: number = 20;
  /** 副标题字号 */
  static readonly FONT_SIZE_SUBTITLE: number = 16;
  /** 正文字号 */
  static readonly FONT_SIZE_BODY: number = 14;
  /** 小字号 */
  static readonly FONT_SIZE_SMALL: number = 12;
  /** 注释字号 */
  static readonly FONT_SIZE_CAPTION: number = 11;

  /** 粗体 */
  static readonly FONT_WEIGHT_BOLD: number = 700;
  /** 中等粗细 */
  static readonly FONT_WEIGHT_MEDIUM: number = 500;
  /** 正常粗细 */
  static readonly FONT_WEIGHT_NORMAL: number = 400;

  /** 背景色 */
  static readonly COLOR_BACKGROUND: string = '#F5F5F5';
  /** 卡片背景色 */
  static readonly COLOR_CARD: string = '#FFFFFF';
  /** 主色调 */
  static readonly COLOR_PRIMARY: string = '#007DFF';
  /** 成功色 */
  static readonly COLOR_SUCCESS: string = '#4CAF50';
  /** 警告色 */
  static readonly COLOR_WARNING: string = '#FF9800';
  /** 错误色 */
  static readonly COLOR_ERROR: string = '#F44336';
  /** 已连接指示色 */
  static readonly COLOR_CONNECTED: string = '#4CAF50';
  /** 已断开指示色 */
  static readonly COLOR_DISCONNECTED: string = '#F44336';
  /** 主要文字色 */
  static readonly COLOR_TEXT_PRIMARY: string = '#333333';
  /** 次要文字色 */
  static readonly COLOR_TEXT_SECONDARY: string = '#666666';
  /** 提示文字色 */
  static readonly COLOR_TEXT_HINT: string = '#999999';
}
