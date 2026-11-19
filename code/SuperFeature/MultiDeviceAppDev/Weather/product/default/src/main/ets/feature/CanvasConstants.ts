/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
 * 画布绘制用到的图片路径，ImageBitmap 只接受字符串路径，无法使用 $r 资源。
 */
export class CanvasImage {
  static readonly SUN: string = '/common/images/sun.png'
  static readonly MOON: string = '/common/images/moon.png'
  static readonly MOON_ICON: string = '/common/images/icon_moon.svg'
}

/**
 * 画布颜色，Canvas 的 fillStyle / strokeStyle 只接受字符串。
 */
export class CanvasColor {
  static readonly AXIS_LINE: string = '#33ffffff'
  static readonly TEXT: string = '#99ffffff'
  static readonly ARC_INACTIVE: string = '#33c0c0c0'
  static readonly GRADIENT_START: string = '#FFAF38'
  static readonly GRADIENT_MIDDLE: string = '#DDFAD961'
  static readonly GRADIENT_END: string = '#11FFFFFF'
  static readonly ROUND_BACKGROUND: string = '#33FFFFFF'
  static readonly ROUND_START: string = '#AED34A'
  static readonly ROUND_MIDDLE: string = '#82CD61'
  static readonly ROUND_END: string = '#82CD61'
  static readonly ROUND_VALUE: string = '#ffffff'
  static readonly ROUND_VALUE_TIP: string = '#99ffffff'
}

/**
 * 日出日落画布的文案、时间点与几何参数。
 */
export class SunCanvasConfig {
  static readonly BEGIN_LABEL: string = '\u65e5\u51fa \u65e9\u4e0a6:00' // 日出 早上6:00
  static readonly END_LABEL: string = '\u65e5\u843d \u508d\u665a5:32' // 日落 傍晚5:32
  static readonly MOON_BEGIN_LABEL: string = '\u6708\u51fa \u508d\u665a5:12' // 月出 傍晚5:12
  static readonly MOON_END_LABEL: string = '\u6708\u843d \u65e9\u4e0a6:20' // 月落 早上6:20
  static readonly MOON_PHASE_LABEL: string = '\u4e0a\u5f26\u6708' // 上弦月
  static readonly ASPECT_RATIO: number = 1.8
  static readonly CANVAS_HEIGHT: string = '95%'
  static readonly FONT: string = '20px'
  static readonly SUNRISE_HOUR: number = 6
  static readonly SUNSET_HOUR: number = 17
  static readonly SCALE_MAX: number = 18
  static readonly SUN_SCALE_SPAN: number = 11
  static readonly MOON_SCALE_SPAN: number = 13
  static readonly MOON_NIGHT_OFFSET: number = 7
  static readonly STEP_DEGREE: number = 9
  static readonly BASELINE_OFFSET: number = 54
  static readonly TEXT_BOTTOM_OFFSET: number = 40
  static readonly MOON_TEXT_BOTTOM_OFFSET: number = 20
  static readonly TEXT_LEFT_DIVISOR: number = 6
  static readonly TEXT_RIGHT_FACTOR: number = 5
  static readonly LINE_WIDTH: number = 1
  static readonly DASH_LENGTH: number = 8
  static readonly ARC_BOTTOM_OFFSET: number = 25
  static readonly SUN_ARC_RADIUS_RATIO: number = 0.4
  static readonly MOON_ARC_RADIUS_RATIO: number = 0.3
  static readonly SUN_ARC_START_DEGREE: number = 193
  static readonly SUN_ARC_END_DEGREE: number = 173
  static readonly MOON_ARC_START_DEGREE: number = 197
  static readonly MOON_ARC_END_DEGREE: number = 171
  static readonly ICON_SOURCE_SIZE: number = 120
  static readonly ICON_SIZE: number = 24
  static readonly ICON_X_OFFSET: number = 12
  static readonly ICON_Y_OFFSET: number = 37
  static readonly MOON_ICON_SOURCE_SIZE: number = 16
  static readonly MOON_ICON_SIZE: number = 24
  static readonly MOON_ICON_X_OFFSET: number = 5
  static readonly MOON_ICON_Y_OFFSET: number = 45
}

/**
 * 空气质量圆环画布的刻度、文案与几何参数。
 */
export class AirQualityConfig {
  static readonly PERCENT_FACTOR: number = 2
  static readonly PERCENT_BASE: number = 100
  static readonly PERCENT_OFFSET: number = 0.5
  static readonly LINE_WIDTH: number = 8
  static readonly ARC_INSET: number = 10
  static readonly BACKGROUND_START: number = 0.3
  static readonly BACKGROUND_END: number = 0.7
  static readonly VALUE_START: number = 0.7
  static readonly GRADIENT_MIDDLE_STOP: number = 0.5
  static readonly DESC_FONT: string = '22px'
  static readonly VALUE_FONT: string = '48px'
  static readonly SCALE_FONT: string = '20px'
  static readonly DESC_OFFSET_Y: number = 20
  static readonly VALUE_OFFSET_Y: number = 5
  static readonly MIN_LABEL: string = '0'
  static readonly MAX_LABEL: string = '500'
  static readonly MIN_LABEL_OFFSET_X: number = 30
  static readonly MAX_LABEL_OFFSET_X: number = 25
  static readonly LABEL_OFFSET_Y: number = 5
}
