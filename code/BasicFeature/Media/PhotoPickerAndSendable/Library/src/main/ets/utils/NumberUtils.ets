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

// Bytes in one kibibyte.
const BYTES_PER_KB: number = 1024;
// Bytes in one mebibyte.
const BYTES_PER_MB: number = BYTES_PER_KB * BYTES_PER_KB;
// Bytes in one gibibyte.
const BYTES_PER_GB: number = BYTES_PER_MB * BYTES_PER_KB;
// Bytes in one tebibyte.
const BYTES_PER_TB: number = BYTES_PER_GB * BYTES_PER_KB;
// Unit suffix used for the byte range.
const UNIT_BYTE: string = ' B';
// Unit suffix used for the kibibyte range.
const UNIT_KB: string = ' KB';
// Unit suffix used for the mebibyte range.
const UNIT_MB: string = ' MB';
// Unit suffix used for the gibibyte range.
const UNIT_GB: string = ' GB';
// Unit suffix used for the tebibyte range and above.
const UNIT_TB: string = ' TB';
// Separator used to group the thousands of a formatted number.
const THOUSAND_SEPARATOR: string = ',';
// Size of one thousands group.
const THOUSAND_GROUP: number = 3;
// Decimal base of the number system.
const DECIMAL_BASE: number = 10;
// Result of a failed numeric parse.
const PARSE_FAILED: number = Number.NaN;
// Value returned when the requested precision cannot be applied.
const INVALID_RESULT: number = Number.NaN;

/**
 * Numeric helpers that avoid throwing on invalid input.
 * Every method is pure and accepts the full number domain including NaN.
 */
export class NumberUtils {
  /**
   * Clamps a value into the inclusive range between the bounds.
   * @param value Value to clamp.
   * @param min Lower bound.
   * @param max Upper bound.
   * @returns Clamped value, the lower bound wins when the range is inverted.
   */
  static clamp(value: number, min: number, max: number): number {
    // A NaN input cannot be clamped and is handed back unchanged.
    if (Number.isNaN(value)) {
      return value;
    }
    // Values below the lower bound are raised.
    if (value < min) {
      return min;
    }
    // Values above the upper bound are lowered.
    if (value > max) {
      return max;
    }
    // Values inside the range stay untouched.
    return value;
  }

  /**
   * Parses a text into a number without throwing.
   * @param value Text to parse, undefined and null are accepted.
   * @returns Parsed number, NaN when the text is missing or not numeric.
   */
  static parseSafe(value: string | undefined | null): number {
    // Missing text cannot be parsed.
    if (value === undefined || value === null) {
      return PARSE_FAILED;
    }
    // Trim the text so that padded numbers still parse.
    const trimmed: string = value.trim();
    // Blank text has no numeric content.
    if (trimmed.length === 0) {
      return PARSE_FAILED;
    }
    // Convert through the platform parser and keep its NaN result as a signal.
    const parsed: number = Number(trimmed);
    // Hand the parse result back, NaN included.
    return parsed;
  }

  /**
   * Formats a number with a fixed number of decimals without throwing.
   * @param value Number to format.
   * @param digits Number of decimals, negative values are raised to zero.
   * @returns Formatted text, 'NaN' when the input is NaN.
   */
  static toFixedSafe(value: number, digits: number): string {
    // A NaN input is reported explicitly instead of throwing.
    if (Number.isNaN(value)) {
      return 'NaN';
    }
    // Guard the precision so that toFixed stays inside its supported range.
    const precision: number = digits < 0 ? 0 : Math.floor(digits);
    // Delegate to the platform formatter.
    return value.toFixed(precision);
  }

  /**
   * Checks whether the value is a finite whole number.
   * @param value Number to test.
   * @returns True when the value is finite and has no fractional part.
   */
  static isInteger(value: number): boolean {
    // Finite is required because Infinity has no meaningful integer form.
    if (!Number.isFinite(value)) {
      return false;
    }
    // Compare the value with its truncated form.
    return Math.floor(value) === value;
  }

  /**
   * Checks whether the value is strictly greater than zero.
   * @param value Number to test.
   * @returns True when the value is positive and not NaN.
   */
  static isPositive(value: number): boolean {
    // NaN never compares greater than zero, so a single comparison is enough.
    return value > 0;
  }

  /**
   * Computes the ratio of a part inside a total as a percentage.
   * @param part Part of the total.
   * @param total Total value.
   * @returns Percentage in the range 0 to 100, zero when the total is not positive.
   */
  static percent(part: number, total: number): number {
    // A non positive total makes the ratio meaningless.
    if (!NumberUtils.isPositive(total)) {
      return 0;
    }
    // Compute the raw percentage.
    const ratio: number = part / total * 100;
    // Keep the result inside the displayable range.
    return NumberUtils.clamp(ratio, 0, 100);
  }

  /**
   * Groups the integer part of a number with thousand separators.
   * @param value Number to format.
   * @returns Text such as '1,234,567'.
   */
  static formatThousands(value: number): string {
    // A NaN input is reported explicitly.
    if (Number.isNaN(value)) {
      return 'NaN';
    }
    // Handle the sign separately so the digit grouping stays simple.
    const negative: boolean = value < 0;
    // Work on the absolute value from here on.
    const absolute: number = negative ? -value : value;
    // Split the integer and the fractional part through the text form.
    const text: string = String(absolute);
    // Locate the decimal separator.
    const dotIndex: number = text.indexOf('.');
    // Take the integer digits of the text.
    const integerText: string = dotIndex >= 0 ? text.substring(0, dotIndex) : text;
    // Take the fractional digits, an empty text when there are none.
    const fractionText: string = dotIndex >= 0 ? text.substring(dotIndex) : '';
    // Collect the grouped digits from the right to the left.
    const groups: string[] = [];
    // Walk backwards through the integer digits.
    let cursor: number = integerText.length;
    // Cut one group per iteration until the text is consumed.
    while (cursor > 0) {
      // Compute the start of the current group.
      const start: number = cursor - THOUSAND_GROUP > 0 ? cursor - THOUSAND_GROUP : 0;
      // Copy the current group.
      groups.push(integerText.substring(start, cursor));
      // Move the cursor to the start of the group just copied.
      cursor = start;
    }
    // The groups were collected backwards, reverse them into reading order.
    groups.reverse();
    // Join the groups with the thousand separator.
    const grouped: string = groups.join(THOUSAND_SEPARATOR);
    // Re-attach the sign and the fractional part.
    return (negative ? '-' : '') + grouped + fractionText;
  }

  /**
   * Rounds a number to the requested number of decimals, halves move away from zero.
   * @param value Number to round.
   * @param digits Number of decimals, negative values are raised to zero.
   * @returns Rounded number.
   */
  static roundHalfUp(value: number, digits: number): number {
    // Infinite and NaN inputs cannot be rounded.
    if (!Number.isFinite(value)) {
      return INVALID_RESULT;
    }
    // Guard the precision so that the scale factor stays finite.
    const precision: number = digits < 0 ? 0 : Math.floor(digits);
    // Build the power of ten that matches the requested precision.
    const scale: number = Math.pow(DECIMAL_BASE, precision);
    // Lift the value into the integer domain before rounding.
    const scaled: number = value * scale;
    // Round half away from zero to match the documented behaviour.
    const rounded: number = scaled >= 0 ? Math.floor(scaled + 0.5) : Math.ceil(scaled - 0.5);
    // Bring the value back to its original magnitude.
    return rounded / scale;
  }

  /**
   * Renders a byte count with the most fitting binary unit.
   * @param bytes Number of bytes, negative values are treated as zero.
   * @returns Text such as '12.3 MB'.
   */
  static bytesToReadable(bytes: number): string {
    // Negative and NaN inputs are reported as zero bytes.
    if (Number.isNaN(bytes) || bytes <= 0) {
      return '0 B';
    }
    // Byte sized values are printed without decimals.
    if (bytes < BYTES_PER_KB) {
      return String(Math.floor(bytes)) + UNIT_BYTE;
    }
    // Kilobyte sized values are printed with one decimal.
    if (bytes < BYTES_PER_MB) {
      return NumberUtils.toFixedSafe(bytes / BYTES_PER_KB, 1) + UNIT_KB;
    }
    // Megabyte sized values are printed with one decimal.
    if (bytes < BYTES_PER_GB) {
      return NumberUtils.toFixedSafe(bytes / BYTES_PER_MB, 1) + UNIT_MB;
    }
    // Gigabyte sized values are printed with one decimal.
    if (bytes < BYTES_PER_TB) {
      return NumberUtils.toFixedSafe(bytes / BYTES_PER_GB, 1) + UNIT_GB;
    }
    // Everything above a terabyte stays in the terabyte unit.
    return NumberUtils.toFixedSafe(bytes / BYTES_PER_TB, 1) + UNIT_TB;
  }
}
