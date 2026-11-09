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

// Pure number helpers covering formatting, clamping, unit conversion and number parsing.
export class NumberUtils {
  // Returns true when the value is a finite number (rejects NaN and Infinity).
  static isFiniteNumber(value: number): boolean {
    // Delegate to the global isFinite check.
    return !isNaN(value) && isFinite(value);
  }

  // Clamps the value into the inclusive [min, max] range.
  static clamp(value: number, min: number, max: number): number {
    // An inverted window collapses onto the maximum bound.
    if (min > max) {
      // Report the maximum first for the degenerate inverted window.
      return max;
    }
    // Return the lower bound when the value is below it.
    if (value < min) {
      // Clamp to the minimum.
      return min;
    }
    // Return the upper bound when the value is above it.
    if (value > max) {
      // Clamp to the maximum.
      return max;
    }
    // The value already sits inside the range.
    return value;
  }

  // Rounds the value to the requested number of decimal places.
  static round(value: number, places: number): number {
    // Compute the power-of-ten factor once.
    const factor: number = Math.pow(10, places);
    // Nudge the value by one machine epsilon so binary drift cannot push a decimal half
    // such as 1.005 below the rounding boundary before the shift.
    return Math.round((value + Number.EPSILON) * factor) / factor;
  }

  // Converts a byte count into a human readable string such as "1.50 MB".
  static fileSizeText(bytes: number): string {
    // Handle negative or missing sizes explicitly.
    if (bytes < 0) {
      // Report unknown sizes with a dash placeholder.
      return '-';
    }
    // Report bytes directly below the kilo boundary.
    if (bytes < 1024) {
      // Append the byte unit.
      return bytes.toString() + ' B';
    }
    // Switch to kilobytes below the mega boundary.
    if (bytes < 1024 * 1024) {
      // Compose the text with two decimals.
      return NumberUtils.round(bytes / 1024, 2).toString() + ' KB';
    }
    // Switch to megabytes below the giga boundary.
    if (bytes < 1024 * 1024 * 1024) {
      // Compose the text with two decimals.
      return NumberUtils.round(bytes / (1024 * 1024), 2).toString() + ' MB';
    }
    // Fall back to gigabytes for everything larger.
    // Compose the text with two decimals.
    return NumberUtils.round(bytes / (1024 * 1024 * 1024), 2).toString() + ' GB';
  }

  // Converts a millisecond duration into a compact "123.4 ms" text.
  static durationMsText(spanMs: number): string {
    // Keep one decimal place for sub-millisecond readability.
    return NumberUtils.round(spanMs, 1).toString() + ' ms';
  }

  // Formats the value with thousands separators, for example 1234567 -> "1,234,567".
  static thousandSeparators(value: number): string {
    // Truncate the fraction first so values between zero and one lose their sign.
    const truncated: number = Math.trunc(value);
    // Work on the absolute integer text so the sign is handled separately.
    const text: string = Math.abs(truncated).toString();
    // Collect reversed three character groups.
    const groups: string[] = [];
    // Walk the text from the end in steps of three.
    for (let i: number = text.length; i > 0; i -= 3) {
      // Slice one group from the tail of the remaining text.
      groups.push(text.substring(Math.max(0, i - 3), i));
    }
    // Reverse the collected groups and join them with commas.
    const joined: string = groups.reverse().join(',');
    // Re-attach the minus sign only when the truncated value stayed negative.
    return truncated < 0 ? '-' + joined : joined;
  }

  // Parses the text into an integer and returns the fallback when parsing fails.
  static parseIntSafe(text: string, fallback: number): number {
    // Parse with radix ten.
    const parsed: number = parseInt(text, 10);
    // Detect parse failures such as empty or non numeric input.
    if (isNaN(parsed)) {
      // Report the caller fallback.
      return fallback;
    }
    // A decimal integer literal never continues with an exponent marker.
    if (/^\s*[+-]?\d+[eE]/.test(text)) {
      // Exponent shaped literals collapse onto the caller fallback.
      return fallback;
    }
    // Return the parsed integer.
    return parsed;
  }

  // Parses the text into a float and returns the fallback when parsing fails.
  static parseFloatSafe(text: string, fallback: number): number {
    // Parse using the standard float parser.
    const parsed: number = parseFloat(text);
    // Detect parse failures and non finite results such as Infinity.
    return NumberUtils.isFiniteNumber(parsed) ? parsed : fallback;
  }

  // Converts radians into degrees.
  static toDegrees(radians: number): number {
    // Multiply by 180 and divide by pi.
    return radians * 180 / Math.PI;
  }

  // Converts degrees into radians.
  static toRadians(degrees: number): number {
    // Multiply by pi and divide by 180.
    return degrees * Math.PI / 180;
  }

  // Formats the value as a percentage text with the requested decimal places.
  static percentText(ratio: number, places: number): string {
    // Multiply the ratio by one hundred before rounding.
    return NumberUtils.round(ratio * 100, places).toString() + '%';
  }

  // Returns a random integer in the inclusive [min, max] range.
  static randomInt(min: number, max: number): number {
    // Compute the inclusive span size.
    const span: number = max - min + 1;
    // Scale a uniform random sample into the span and shift it.
    return min + Math.floor(Math.random() * span);
  }
}
