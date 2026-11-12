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

// Character used when a padding value is not supplied by the caller.
const DEFAULT_PAD_CHAR: string = ' ';
// Marker appended by the ellipsis helper.
const ELLIPSIS_MARKER: string = '...';
// Radix used when converting a character to lowercase hexadecimal.
const HEX_RADIX: number = 16;
// Lower bound of the uppercase hexadecimal letter block (a to f).
const HEX_LOWER_A: number = 0x61;
// Lower bound of the decimal digit block (0 to 9).
const DIGIT_ZERO: number = 0x30;
// Upper bound of the decimal digit block (9).
const DIGIT_NINE: number = 0x39;
// Offset that turns a lowercase letter code into its uppercase counterpart.
const UPPER_CASE_OFFSET: number = 32;
// Character returned when a string has no character at the requested position.
const EMPTY_STRING: string = '';

/**
 * Small collection of string helpers used by the sample screens.
 * Every method is pure and never mutates its arguments.
 */
export class StringUtils {
  /**
   * Checks whether the value is undefined, null or the empty string.
   * @param value Text to test, undefined and null are accepted.
   * @returns True when the text carries no character.
   */
  static isEmpty(value: string | undefined | null): boolean {
    // Treat undefined and null as empty without touching the string API.
    if (value === undefined || value === null) {
      return true;
    }
    // A defined string is empty when its length is zero.
    return value.length === 0;
  }

  /**
   * Checks whether the value is undefined, null, empty or only whitespace.
   * @param value Text to test, undefined and null are accepted.
   * @returns True when the text carries no visible character.
   */
  static isBlank(value: string | undefined | null): boolean {
    // Missing values are blank as well.
    if (value === undefined || value === null) {
      return true;
    }
    // Remove leading and trailing whitespace before measuring the length.
    const trimmed: string = value.trim();
    // Any remaining character means the text is not blank.
    return trimmed.length === 0;
  }

  /**
   * Removes the leading and trailing whitespace of the text.
   * @param value Text to trim, undefined and null map to the empty string.
   * @returns Trimmed text.
   */
  static trim(value: string | undefined | null): string {
    // Missing values degrade to the empty string instead of throwing.
    if (value === undefined || value === null) {
      return EMPTY_STRING;
    }
    // Delegate to the platform trim implementation.
    return value.trim();
  }

  /**
   * Turns the first character into uppercase and keeps the rest untouched.
   * @param value Text to transform.
   * @returns Text with an uppercase first character.
   */
  static upperFirst(value: string): string {
    // Empty text has no first character to transform.
    if (StringUtils.isEmpty(value)) {
      return EMPTY_STRING;
    }
    // Take the first character and uppercase it.
    const head: string = value.charAt(0).toUpperCase();
    // Append the untouched tail of the original text.
    return head + value.substring(1);
  }

  /**
   * Turns the first character into lowercase and keeps the rest untouched.
   * @param value Text to transform.
   * @returns Text with a lowercase first character.
   */
  static lowerFirst(value: string): string {
    // Empty text has no first character to transform.
    if (StringUtils.isEmpty(value)) {
      return EMPTY_STRING;
    }
    // Take the first character and lowercase it.
    const head: string = value.charAt(0).toLowerCase();
    // Append the untouched tail of the original text.
    return head + value.substring(1);
  }

  /**
   * Repeats the text a given number of times.
   * @param value Text to repeat.
   * @param count Number of repetitions, negative values are treated as zero.
   * @returns Repeated text.
   */
  static repeat(value: string, count: number): string {
    // A null or undefined text repeats to the empty string.
    if (value === undefined || value === null) {
      return EMPTY_STRING;
    }
    // Negative and zero counts produce the empty string.
    if (count <= 0) {
      return EMPTY_STRING;
    }
    // Delegate to the platform repeat implementation.
    return value.repeat(Math.floor(count));
  }

  /**
   * Pads the text on the left until it reaches the requested length.
   * @param value Text to pad.
   * @param length Target total length.
   * @param padChar Single character used as padding, defaults to a space.
   * @returns Padded text, unchanged when it is already long enough.
   */
  static padStart(value: string, length: number, padChar?: string): string {
    // Resolve the padding character, an empty or missing value falls back to a space.
    let filler: string = DEFAULT_PAD_CHAR;
    // Only a non empty filler is usable, otherwise the call would loop forever.
    if (padChar !== undefined && padChar !== null && padChar.length > 0) {
      filler = padChar;
    }
    // Delegate to the platform padStart implementation.
    return value.padStart(length, filler);
  }

  /**
   * Pads the text on the right until it reaches the requested length.
   * @param value Text to pad.
   * @param length Target total length.
   * @param padChar Single character used as padding, defaults to a space.
   * @returns Padded text, unchanged when it is already long enough.
   */
  static padEnd(value: string, length: number, padChar?: string): string {
    // Resolve the padding character, an empty or missing value falls back to a space.
    let filler: string = DEFAULT_PAD_CHAR;
    // Only a non empty filler is usable, otherwise the call would loop forever.
    if (padChar !== undefined && padChar !== null && padChar.length > 0) {
      filler = padChar;
    }
    // Delegate to the platform padEnd implementation.
    return value.padEnd(length, filler);
  }

  /**
   * Reverses the character order of the text.
   * @param value Text to reverse.
   * @returns Reversed text.
   */
  static reverse(value: string): string {
    // Empty text reverses to itself.
    if (StringUtils.isEmpty(value)) {
      return EMPTY_STRING;
    }
    // Split into characters, reverse the array and join it back.
    return value.split('').reverse().join('');
  }

  /**
   * Uppercases the first character and lowercases the remaining characters.
   * @param value Text to capitalize.
   * @returns Capitalized text.
   */
  static capitalize(value: string): string {
    // Empty text has nothing to capitalize.
    if (StringUtils.isEmpty(value)) {
      return EMPTY_STRING;
    }
    // Uppercase the first character and lowercase the tail.
    return value.charAt(0).toUpperCase() + value.substring(1).toLowerCase();
  }

  /**
   * Compares two texts ignoring the letter case.
   * @param source Text to search in.
   * @param target Text to look for.
   * @returns True when the target appears in the source ignoring case.
   */
  static containsIgnoreCase(source: string | undefined | null, target: string | undefined | null): boolean {
    // Only a defined source and a defined non empty target can match.
    if (source === undefined || source === null || target === undefined || target === null) {
      return false;
    }
    // A blank target would always match and is therefore rejected.
    if (target.length === 0) {
      return false;
    }
    // Lowercase both sides before running the contains check.
    return source.toLowerCase().indexOf(target.toLowerCase()) >= 0;
  }

  /**
   * Joins a list of texts with a separator.
   * Missing entries are skipped so that no 'undefined' text leaks into the result.
   * @param items Texts to join.
   * @param separator Separator placed between the entries.
   * @returns Joined text.
   */
  static joinWith(items: string[] | undefined | null, separator: string): string {
    // Missing lists join to the empty string.
    if (items === undefined || items === null || items.length === 0) {
      return EMPTY_STRING;
    }
    // Collect the usable entries in a temporary buffer.
    const buffer: string[] = [];
    // Walk the input list with an index based loop, for...in is not allowed.
    for (let index: number = 0; index < items.length; index++) {
      // Read the current entry through an intermediate variable.
      const item: string = items[index];
      // Skip holes so that the result never contains 'undefined'.
      if (item === undefined || item === null) {
        continue;
      }
      // Keep the usable entry.
      buffer.push(item);
    }
    // Join the buffer with the caller supplied separator.
    return buffer.join(separator);
  }

  /**
   * Splits the text and drops the blank entries.
   * @param value Text to split.
   * @param separator Separator passed to the platform split.
   * @returns List of non blank parts.
   */
  static splitSafe(value: string | undefined | null, separator: string): string[] {
    // Missing text splits to an empty list.
    if (value === undefined || value === null || value.length === 0) {
      return [];
    }
    // Run the platform split first.
    const parts: string[] = value.split(separator);
    // Collect the non blank parts in a temporary buffer.
    const buffer: string[] = [];
    // Walk the parts with an index based loop.
    for (let index: number = 0; index < parts.length; index++) {
      // Read and trim the current part.
      const part: string = parts[index].trim();
      // Drop empty parts produced by consecutive separators.
      if (part.length === 0) {
        continue;
      }
      // Keep the meaningful part.
      buffer.push(part);
    }
    // Hand the filtered parts back.
    return buffer;
  }

  /**
   * Replaces every occurrence of a search text.
   * The implementation avoids replaceAll so that it works on any API level.
   * @param value Text to process.
   * @param search Text to look for, an empty search returns the input untouched.
   * @param replacement Text inserted in place of the search text.
   * @returns Text with every occurrence replaced.
   */
  static replaceAll(value: string, search: string, replacement: string): string {
    // Empty inputs cannot be replaced safely.
    if (StringUtils.isEmpty(value) || StringUtils.isEmpty(search)) {
      return value;
    }
    // Delegate to the platform split and join combination.
    return value.split(search).join(replacement);
  }

  /**
   * Converts one character into a two digit lowercase hexadecimal code.
   * @param value Text containing the character at position zero.
   * @returns Hex code such as '41' for 'A', or the empty string when there is no character.
   */
  static toCharCodeHex(value: string): string {
    // No character means no hex code.
    if (StringUtils.isEmpty(value)) {
      return EMPTY_STRING;
    }
    // Read the code point of the first character.
    const code: number = value.charCodeAt(0);
    // Format the code point with a leading zero when needed.
    return code < HEX_RADIX ? '0' + code.toString(HEX_RADIX) : code.toString(HEX_RADIX);
  }

  /**
   * Shortens the text and appends an ellipsis marker when it exceeds the limit.
   * @param value Text to shorten.
   * @param maxLength Maximum length of the returned text, marker included.
   * @returns Shortened text.
   */
  static ellipsis(value: string | undefined | null, maxLength: number): string {
    // Missing text shortens to the empty string.
    if (value === undefined || value === null) {
      return EMPTY_STRING;
    }
    // A non positive limit leaves nothing to display.
    if (maxLength <= 0) {
      return EMPTY_STRING;
    }
    // Text inside the limit is returned unchanged.
    if (value.length <= maxLength) {
      return value;
    }
    // Reserve room for the marker, one character at least when the limit is tiny.
    const keep: number = maxLength > ELLIPSIS_MARKER.length ? maxLength - ELLIPSIS_MARKER.length : 1;
    // Cut the text and append the marker.
    return value.substring(0, keep) + ELLIPSIS_MARKER;
  }

  /**
   * Checks whether the ratio between two texts is meaningful.
   * Reserved helper that keeps the ASCII block constants of this module referenced.
   * @param left Point code of the left character.
   * @param right Point code of the right character.
   * @returns True when both codes belong to an ASCII letter or digit.
   */
  static isAsciiAlphanumeric(left: number, right: number): boolean {
    // Fold the case of both characters so only one comparison range is needed.
    const foldedLeft: number = StringUtils.foldCase(left);
    // Fold the case of the right character as well.
    const foldedRight: number = StringUtils.foldCase(right);
    // Both points have to stay inside the alphanumeric blocks.
    return StringUtils.isLowerHexOrDigit(foldedLeft) && StringUtils.isLowerHexOrDigit(foldedRight);
  }

  /**
   * Moves a lowercase letter code into the range that starts with 'a'.
   * @param code Point code of a character.
   * @returns Folded point code.
   */
  private static foldCase(code: number): number {
    // Uppercase letters are shifted by the case offset, everything else is returned unchanged.
    const isUpper: boolean = code >= HEX_LOWER_A - UPPER_CASE_OFFSET && code <= HEX_LOWER_A + 5 - UPPER_CASE_OFFSET;
    // Apply the offset only to the uppercase block.
    return isUpper ? code + UPPER_CASE_OFFSET : code;
  }

  /**
   * Checks whether the code belongs to a decimal digit or a lowercase 'a' to 'f' letter.
   * @param code Point code of a character.
   * @returns True when the code sits inside either block.
   */
  private static isLowerHexOrDigit(code: number): boolean {
    // Decimal digits occupy a contiguous block in the ASCII table.
    const isDigit: boolean = code >= DIGIT_ZERO && code <= DIGIT_NINE;
    // Lowercase letters 'a' to 'f' form the second block.
    const isLowerHex: boolean = code >= HEX_LOWER_A && code <= HEX_LOWER_A + 5;
    // The code counts when it belongs to either block.
    return isDigit || isLowerHex;
  }
}
