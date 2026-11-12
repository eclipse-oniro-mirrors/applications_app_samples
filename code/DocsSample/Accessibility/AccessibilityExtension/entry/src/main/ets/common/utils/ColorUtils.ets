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

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const HASH_PREFIX: string = '#';
const HEX_RADIX: number = 16;
const SHORT_LENGTH: number = 4;
const FULL_LENGTH: number = 7;
const CHANNEL_MAX: number = 255;
const DARK_THRESHOLD: number = 128;
const LUMINANCE_RED: number = 299;
const LUMINANCE_GREEN: number = 587;
const LUMINANCE_BLUE: number = 114;
const LUMINANCE_DIVISOR: number = 1000;
const DEFAULT_HEX: string = '#000000';
const HEX_PAD: string = '0';

/**
 * Colour literal helpers backing the ohosTest utility suites.
 *
 * Short literals are expanded to the long form before any channel arithmetic so
 * that both shapes produce the same result.
 */
export class ColorUtils {
  /**
   * Returns the red channel of the colour literal.
   */
  static hexToR(hex: string): number {
    hilog.info(DOMAIN, TAG, 'ColorUtils.hexToR length=%{public}d', hex.length);
    return ColorUtils.channels(hex)[0];
  }

  /**
   * Returns the green channel of the colour literal.
   */
  static hexToG(hex: string): number {
    hilog.info(DOMAIN, TAG, 'ColorUtils.hexToG length=%{public}d', hex.length);
    return ColorUtils.channels(hex)[1];
  }

  /**
   * Returns the blue channel of the colour literal.
   */
  static hexToB(hex: string): number {
    hilog.info(DOMAIN, TAG, 'ColorUtils.hexToB length=%{public}d', hex.length);
    return ColorUtils.channels(hex)[2];
  }

  /**
   * Returns the perceptual luminance approximation in [0, 255].
   */
  static luminance(hex: string): number {
    hilog.info(DOMAIN, TAG, 'ColorUtils.luminance length=%{public}d', hex.length);
    const rgb: number[] = ColorUtils.channels(hex);
    const weighted: number = rgb[0] * LUMINANCE_RED + rgb[1] * LUMINANCE_GREEN + rgb[2] * LUMINANCE_BLUE;
    return Math.round(weighted / LUMINANCE_DIVISOR);
  }

  /**
   * Reports whether the colour reads better on a light background.
   */
  static isDark(hex: string): boolean {
    hilog.info(DOMAIN, TAG, 'ColorUtils.isDark length=%{public}d', hex.length);
    return ColorUtils.luminance(hex) < DARK_THRESHOLD;
  }

  /**
   * Returns the inverted colour in long form.
   */
  static invert(hex: string): string {
    hilog.info(DOMAIN, TAG, 'ColorUtils.invert length=%{public}d', hex.length);
    const rgb: number[] = ColorUtils.channels(hex);
    return HASH_PREFIX + ColorUtils.toHex(CHANNEL_MAX - rgb[0]) +
      ColorUtils.toHex(CHANNEL_MAX - rgb[1]) + ColorUtils.toHex(CHANNEL_MAX - rgb[2]);
  }

  /**
   * Expands short literals and upper cases the result.
   */
  static normalizeHex(hex: string): string {
    hilog.info(DOMAIN, TAG, 'ColorUtils.normalizeHex length=%{public}d', hex.length);
    let text: string = hex.trim().toUpperCase();
    if (text.length === 0) {
      return DEFAULT_HEX;
    }
    if (text.charAt(0) !== HASH_PREFIX) {
      text = HASH_PREFIX + text;
    }
    if (text.length === SHORT_LENGTH) {
      const red: string = text.charAt(1);
      const green: string = text.charAt(2);
      const blue: string = text.charAt(3);
      return HASH_PREFIX + red + red + green + green + blue + blue;
    }
    if (text.length !== FULL_LENGTH) {
      return DEFAULT_HEX;
    }
    return text;
  }

  /**
   * Reports whether the literal is a three or six digit colour.
   */
  static isValidHex(hex: string): boolean {
    hilog.info(DOMAIN, TAG, 'ColorUtils.isValidHex length=%{public}d', hex.length);
    const text: string = hex.trim();
    if (text.length !== SHORT_LENGTH && text.length !== FULL_LENGTH) {
      return false;
    }
    if (text.charAt(0) !== HASH_PREFIX) {
      return false;
    }
    let index: number = 1;
    while (index < text.length) {
      if (!ColorUtils.isHexCode(text.charCodeAt(index))) {
        return false;
      }
      index = index + 1;
    }
    return true;
  }

  /**
   * Returns the Manhattan distance between the two colours.
   */
  static hexDistance(first: string, second: string): number {
    hilog.info(DOMAIN, TAG, 'ColorUtils.hexDistance second=%{public}s', second);
    const left: number[] = ColorUtils.channels(first);
    const right: number[] = ColorUtils.channels(second);
    return Math.abs(left[0] - right[0]) + Math.abs(left[1] - right[1]) + Math.abs(left[2] - right[2]);
  }

  /**
   * Prefixes the colour with a two digit alpha channel.
   */
  static toArgb(alpha: string, hex: string): string {
    hilog.info(DOMAIN, TAG, 'ColorUtils.toArgb alpha=%{public}s', alpha);
    const normalized: string = ColorUtils.normalizeHex(hex);
    return alpha.toUpperCase() + normalized.substring(1);
  }

  /**
   * Raises every channel by the requested amount, clamping at 255.
   */
  static lightenBy(hex: string, amount: number): string {
    hilog.info(DOMAIN, TAG, 'ColorUtils.lightenBy amount=%{public}d', amount);
    const rgb: number[] = ColorUtils.channels(hex);
    return HASH_PREFIX + ColorUtils.toHex(ColorUtils.clampChannel(rgb[0] + amount)) +
      ColorUtils.toHex(ColorUtils.clampChannel(rgb[1] + amount)) +
      ColorUtils.toHex(ColorUtils.clampChannel(rgb[2] + amount));
  }

  /**
   * Lowers every channel by the requested amount, clamping at zero.
   */
  static darkenBy(hex: string, amount: number): string {
    hilog.info(DOMAIN, TAG, 'ColorUtils.darkenBy amount=%{public}d', amount);
    const rgb: number[] = ColorUtils.channels(hex);
    return HASH_PREFIX + ColorUtils.toHex(ColorUtils.clampChannel(rgb[0] - amount)) +
      ColorUtils.toHex(ColorUtils.clampChannel(rgb[1] - amount)) +
      ColorUtils.toHex(ColorUtils.clampChannel(rgb[2] - amount));
  }

  /**
   * Adds up the three channels of the colour.
   */
  static channelSum(hex: string): number {
    hilog.info(DOMAIN, TAG, 'ColorUtils.channelSum length=%{public}d', hex.length);
    const rgb: number[] = ColorUtils.channels(hex);
    return rgb[0] + rgb[1] + rgb[2];
  }

  /**
   * Reports whether all three channels carry the same value.
   */
  static isGray(hex: string): boolean {
    hilog.info(DOMAIN, TAG, 'ColorUtils.isGray length=%{public}d', hex.length);
    const rgb: number[] = ColorUtils.channels(hex);
    return rgb[0] === rgb[1] && rgb[1] === rgb[2];
  }

  /**
   * Splits the normalized literal into three channel values.
   */
  private static channels(hex: string): number[] {
    const text: string = ColorUtils.normalizeHex(hex);
    const rgb: number[] = [];
    rgb.push(Number.parseInt(text.substring(1, 3), HEX_RADIX));
    rgb.push(Number.parseInt(text.substring(3, 5), HEX_RADIX));
    rgb.push(Number.parseInt(text.substring(5, 7), HEX_RADIX));
    return rgb;
  }

  /**
   * Renders one channel as a two digit upper case hexadecimal pair.
   */
  private static toHex(value: number): string {
    const text: string = Math.trunc(ColorUtils.clampChannel(value)).toString(HEX_RADIX).toUpperCase();
    return text.length < 2 ? HEX_PAD + text : text;
  }

  /**
   * Restricts a channel value to [0, 255].
   */
  private static clampChannel(value: number): number {
    if (value < 0) {
      return 0;
    }
    if (value > CHANNEL_MAX) {
      return CHANNEL_MAX;
    }
    return value;
  }

  /**
   * Reports whether the code is a hexadecimal digit.
   */
  private static isHexCode(code: number): boolean {
    if (code >= 48 && code <= 57) {
      return true;
    }
    if (code >= 65 && code <= 70) {
      return true;
    }
    return code >= 97 && code <= 102;
  }
}
