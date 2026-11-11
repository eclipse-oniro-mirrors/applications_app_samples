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

// Mask that keeps the red channel inside an ARGB integer.
const MASK_RED: number = 0x00FF0000;
// Mask that keeps the green channel inside an ARGB integer.
const MASK_GREEN: number = 0x0000FF00;
// Mask that keeps the blue channel inside an ARGB integer.
const MASK_BLUE: number = 0x000000FF;
// Mask that keeps the alpha channel inside an ARGB integer.
const MASK_ALPHA: number = 0xFF000000;
// Shift applied to extract the red channel.
const SHIFT_RED: number = 16;
// Shift applied to extract the green channel.
const SHIFT_GREEN: number = 8;
// Shift applied to extract the blue channel.
const SHIFT_BLUE: number = 0;
// Shift applied to extract the alpha channel.
const SHIFT_ALPHA: number = 24;
// Number of bits of a single byte, used to rescale channels.
const BITS_PER_BYTE: number = 8;
// Maximum value of a single color channel.
const CHANNEL_MAX: number = 255;
// Length of a "#RRGGBB" color string.
const HEX_LENGTH_RGB: number = 7;
// Length of a "#AARRGGBB" color string.
const HEX_LENGTH_ARGB: number = 9;
// Prefix of every hexadecimal color string.
const HEX_PREFIX: string = '#';
// Base of the hexadecimal number system.
const HEX_RADIX: number = 16;
// Fallback color returned when the input can not be parsed.
// Wrapped with "| 0" so it is the signed thirty two bit form, the same representation every other method returns.
const FALLBACK_COLOR: number = 0xFF000000 | 0;

/**
 * Pure color math helpers without any platform dependency.
 * Colors are handled as signed ARGB integers, the same representation ArkUI accepts.
 * Every method is side effect free so it can be used inside build() expressions.
 */
export class ColorUtils {
  /**
   * Converts a hexadecimal color string into an ARGB integer.
   * @param hex Color text like "#RRGGBB" or "#AARRGGBB", the hash is optional.
   * @returns ARGB integer, fully opaque black when the text is invalid.
   */
  static hexToNumber(hex: string): number {
    // Reject text that can not describe a color.
    if (!ColorUtils.isValidHex(hex)) {
      // Return the safe fallback color.
      return FALLBACK_COLOR;
    }
    // Remove the optional leading hash before parsing.
    const body: string = hex.charAt(0) === HEX_PREFIX ? hex.substring(1) : hex;
    // A six digit body carries no alpha so full opacity is assumed.
    const normalized: string = body.length === 6 ? 'FF' + body : body;
    // Parse the eight digit body as an unsigned hexadecimal number.
    const parsed: number = parseInt(normalized, HEX_RADIX);
    // Convert to a 32 bit signed integer, the representation used by ArkUI.
    return parsed | 0;
  }

  /**
   * Converts an ARGB integer into a "#AARRGGBB" string.
   * @param color ARGB integer.
   * @returns Upper case hexadecimal color string with a leading hash.
   */
  static numberToHex(color: number): string {
    // Keep only the low 32 bits so negative inputs still produce eight digits.
    const alpha: number = ColorUtils.channel(color, SHIFT_ALPHA);
    // Extract the red channel.
    const red: number = ColorUtils.channel(color, SHIFT_RED);
    // Extract the green channel.
    const green: number = ColorUtils.channel(color, SHIFT_GREEN);
    // Extract the blue channel.
    const blue: number = ColorUtils.channel(color, SHIFT_BLUE);
    // Concatenate the four channels, each padded to two digits.
    const body: string = ColorUtils.padByte(alpha) + ColorUtils.padByte(red) + ColorUtils.padByte(green) +
      ColorUtils.padByte(blue);
    // Return the prefixed upper case color text.
    return HEX_PREFIX + body.toUpperCase();
  }

  /**
   * Replaces the alpha channel of a color.
   * @param color ARGB integer.
   * @param alpha New alpha in the range 0 to 255.
   * @returns Color with the requested alpha, other channels untouched.
   */
  static withAlpha(color: number, alpha: number): number {
    // Clamp the alpha into the valid byte range.
    const safeAlpha: number = ColorUtils.clampChannel(alpha);
    // Drop the previous alpha channel.
    const body: number = color & ~MASK_ALPHA;
    // Shift the new alpha into place without sign extension.
    const alphaPart: number = (safeAlpha << SHIFT_ALPHA) & MASK_ALPHA;
    // Combine both parts and keep the 32 bit representation.
    return (body | alphaPart) | 0;
  }

  /**
   * Validates a hexadecimal color string.
   * @param hex Color text, the leading hash is optional.
   * @returns True when the text is a well formed six or eight digit color.
   */
  static isValidHex(hex: string): boolean {
    // An empty string can never be a color.
    if (hex.length === 0) {
      // Report the invalid input.
      return false;
    }
    // Determine whether the text starts with the prefix.
    const hasPrefix: boolean = hex.charAt(0) === HEX_PREFIX;
    // Read the body length to decide which formats are allowed.
    const bodyLength: number = hasPrefix ? hex.length - 1 : hex.length;
    // Only six and eight digit bodies are supported.
    if (bodyLength !== HEX_LENGTH_RGB - 1 && bodyLength !== HEX_LENGTH_ARGB - 1) {
      // Report the unsupported length.
      return false;
    }
    // Read the body starting after the optional prefix.
    const body: string = hasPrefix ? hex.substring(1) : hex;
    // Every character has to be a hexadecimal digit.
    for (let index: number = 0; index < body.length; index++) {
      // Read the character at the current position.
      const current: string = body.charAt(index).toLowerCase();
      // Check the character against the hexadecimal pool.
      if (HEX_DIGITS.indexOf(current) < 0) {
        // Report the offending character.
        return false;
      }
    }
    // Every check passed.
    return true;
  }

  /**
   * Blends two colors with the given weight.
   * @param baseColor Color used when the weight is 0.
   * @param overlayColor Color used when the weight is 1.
   * @param weight Mixing weight in the range 0 to 1.
   * @returns Blended ARGB integer.
   */
  static blend(baseColor: number, overlayColor: number, weight: number): number {
    // Clamp the weight so out of range input can not distort the result.
    const ratio: number = weight < 0 ? 0 : (weight > 1 ? 1 : weight);
    // Read the base alpha channel.
    const baseAlpha: number = ColorUtils.channel(baseColor, SHIFT_ALPHA);
    // Read the overlay alpha channel.
    const overlayAlpha: number = ColorUtils.channel(overlayColor, SHIFT_ALPHA);
    // Interpolate the four channels one by one.
    const alpha: number = ColorUtils.mixChannel(baseAlpha, overlayAlpha, ratio);
    // Interpolate the red channel.
    const red: number = ColorUtils.mixChannel(ColorUtils.channel(baseColor, SHIFT_RED),
      ColorUtils.channel(overlayColor, SHIFT_RED), ratio);
    // Interpolate the green channel.
    const green: number = ColorUtils.mixChannel(ColorUtils.channel(baseColor, SHIFT_GREEN),
      ColorUtils.channel(overlayColor, SHIFT_GREEN), ratio);
    // Interpolate the blue channel.
    const blue: number = ColorUtils.mixChannel(ColorUtils.channel(baseColor, SHIFT_BLUE),
      ColorUtils.channel(overlayColor, SHIFT_BLUE), ratio);
    // Assemble the blended color and keep the 32 bit representation.
    const result: number = ((alpha << SHIFT_ALPHA) | (red << SHIFT_RED) | (green << SHIFT_GREEN) |
      (blue << SHIFT_BLUE)) | 0;
    // Return the blended color.
    return result;
  }

  /**
   * Inverts the RGB channels of a color and keeps the alpha channel.
   * @param color ARGB integer.
   * @returns Inverted ARGB integer.
   */
  static invert(color: number): number {
    // Keep the alpha channel untouched.
    const alpha: number = ColorUtils.channel(color, SHIFT_ALPHA);
    // Invert the red channel.
    const red: number = CHANNEL_MAX - ColorUtils.channel(color, SHIFT_RED);
    // Invert the green channel.
    const green: number = CHANNEL_MAX - ColorUtils.channel(color, SHIFT_GREEN);
    // Invert the blue channel.
    const blue: number = CHANNEL_MAX - ColorUtils.channel(color, SHIFT_BLUE);
    // Assemble the inverted color with the original alpha.
    const result: number = ((alpha << SHIFT_ALPHA) | (red << SHIFT_RED) | (green << SHIFT_GREEN) |
      (blue << SHIFT_BLUE)) | 0;
    // Return the inverted color.
    return result;
  }

  /**
   * Formats a color as an "rgb(r, g, b)" string.
   * @param color ARGB integer.
   * @returns CSS like rgb text, the alpha channel is ignored.
   */
  static toRgbString(color: number): string {
    // Read the red channel.
    const red: number = ColorUtils.channel(color, SHIFT_RED);
    // Read the green channel.
    const green: number = ColorUtils.channel(color, SHIFT_GREEN);
    // Read the blue channel.
    const blue: number = ColorUtils.channel(color, SHIFT_BLUE);
    // Build the text with plain concatenation, template strings are not allowed here.
    const text: string = 'rgb(' + red.toString() + ', ' + green.toString() + ', ' + blue.toString() + ')';
    // Return the formatted text.
    return text;
  }

  /**
   * Extracts one channel of a color.
   * @param color ARGB integer.
   * @param shift Bit offset of the channel.
   * @returns Channel value in the range 0 to 255.
   */
  private static channel(color: number, shift: number): number {
    // Shift the requested channel down and mask the remaining bits.
    const value: number = (color >> shift) & (CHANNEL_MAX);
    // Return the unsigned channel value.
    return value;
  }

  /**
   * Pads a channel value to exactly two hexadecimal digits.
   * @param value Channel value in the range 0 to 255.
   * @returns Two character lower case hexadecimal text.
   */
  private static padByte(value: number): string {
    // Convert the clamped channel into hexadecimal text.
    const text: string = ColorUtils.clampChannel(value).toString(HEX_RADIX);
    // A single digit has to be padded with a leading zero.
    return text.length === 1 ? '0' + text : text;
  }

  /**
   * Clamps a channel value into the byte range.
   * @param value Any number.
   * @returns Value inside 0 to 255.
   */
  private static clampChannel(value: number): number {
    // Clamp the lower bound first because Math.round keeps NaN out of the range.
    const lower: number = value < 0 ? 0 : value;
    // Clamp the upper bound as well.
    return lower > CHANNEL_MAX ? CHANNEL_MAX : Math.round(lower);
  }

  /**
   * Interpolates two channel values.
   * @param from Value used when the ratio is 0.
   * @param to Value used when the ratio is 1.
   * @param ratio Weight inside 0 to 1.
   * @returns Interpolated and rounded channel value.
   */
  private static mixChannel(from: number, to: number, ratio: number): number {
    // Scale the channel difference by the weight and round the result.
    const mixed: number = Math.round(from + (to - from) * ratio);
    // Keep the interpolated value inside the byte range.
    return ColorUtils.clampChannel(mixed);
  }
}

// Hexadecimal digit pool used by the validation helper.
const HEX_DIGITS: string = '0123456789abcdef';
