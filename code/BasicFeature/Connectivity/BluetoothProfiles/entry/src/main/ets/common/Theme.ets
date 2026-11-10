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
 * 视觉常量：颜色、间距、圆角、字号与固定尺寸。
 * 页面只引用这里的语义化常量，避免样式散落在各个演示页。
 */

export class AppColors {
  public static readonly PAGE_BG: string = '#F2F3F5';
  public static readonly CARD_BG: string = '#FFFFFF';
  public static readonly PRIMARY: string = '#0A59F7';
  public static readonly PRIMARY_SOFT: string = '#E8F0FE';
  public static readonly SUBTLE_BG: string = '#F7F8FA';
  public static readonly SOFT_BG: string = '#F0F1F3';
  public static readonly TEXT_PRIMARY: string = '#1A1A1A';
  public static readonly TEXT_SECONDARY: string = '#666666';
  public static readonly TEXT_TERTIARY: string = '#8A8A8A';
  public static readonly TEXT_MUTED: string = '#999999';
  public static readonly TEXT_STRONG: string = '#333333';
  public static readonly DANGER: string = '#E84026';
  public static readonly DANGER_SOFT: string = '#FDECEA';
  public static readonly WARNING: string = '#E6A23C';
  public static readonly WARNING_SOFT: string = '#FDF6EC';
  public static readonly SUCCESS: string = '#28A745';
  public static readonly SUCCESS_SOFT: string = '#EAF7EE';
  public static readonly GRADIENT_PRIMARY: string = '#E7F0FF';
  public static readonly GRADIENT_SECONDARY: string = '#F7FAFF';
  public static readonly WHITE: string = '#FFFFFF';
}

export class AppSpacing {
  public static readonly XS: number = 4;
  public static readonly SM: number = 6;
  public static readonly MD: number = 8;
  public static readonly LG: number = 10;
  public static readonly XL: number = 12;
  public static readonly CARD: number = 14;
  public static readonly PAGE: number = 16;
  public static readonly LARGE: number = 20;
  public static readonly XLARGE: number = 24;
}

export class AppRadius {
  public static readonly TAG: number = 4;
  public static readonly SMALL: number = 8;
  public static readonly CARD: number = 10;
  public static readonly LARGE: number = 12;
  public static readonly PILL: number = 24;
}

export class AppText {
  public static readonly CAPTION: number = 10;
  public static readonly SMALL: number = 11;
  public static readonly BODY: number = 12;
  public static readonly LABEL: number = 13;
  public static readonly TITLE: number = 14;
  public static readonly SECTION: number = 15;
  public static readonly HEADING: number = 18;
  public static readonly DISPLAY: number = 20;
}

export class AppSize {
  public static readonly BUTTON_SM: number = 30;
  public static readonly BUTTON: number = 32;
  public static readonly BUTTON_MD: number = 34;
  public static readonly MONO_CHIP_HEIGHT: number = 24;
}
