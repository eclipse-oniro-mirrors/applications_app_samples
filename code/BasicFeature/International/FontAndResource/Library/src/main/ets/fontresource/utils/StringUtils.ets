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

// Pure string helpers that only rely on the standard String API, safe for any thread.
export class StringUtils {
  // Returns true when the value is undefined, null or an empty string.
  static isEmpty(value: string | null | undefined): boolean {
    // A missing value is always empty.
    if (value === undefined || value === null) {
      // Report emptiness for missing values.
      return true;
    }
    // Compare the length against zero for real strings.
    return value.length === 0;
  }

  // Returns true when the value is empty or contains only whitespace characters.
  static isBlank(value: string | null | undefined): boolean {
    // Reuse isEmpty for the missing and empty cases.
    if (StringUtils.isEmpty(value)) {
      // Empty values are also blank.
      return true;
    }
    // Trim the value and check whether anything remains.
    return (value as string).trim().length === 0;
  }

  // Returns the original value when non-empty, otherwise the fallback value.
  static defaultIfEmpty(value: string | null | undefined, fallback: string): string {
    // Pick the fallback when the value is empty.
    return StringUtils.isEmpty(value) ? fallback : (value as string);
  }

  // Reverses the characters of the input string.
  static reverse(value: string): string {
    // Split into characters, reverse the array and join it back together.
    return value.split('').reverse().join('');
  }

  // Converts the first character of the value to upper case and keeps the rest.
  static capitalize(value: string): string {
    // Return an empty string unchanged.
    if (StringUtils.isEmpty(value)) {
      // Nothing to capitalize.
      return '';
    }
    // Upper-case the first character and append the remainder untouched.
    return value.charAt(0).toUpperCase() + value.substring(1);
  }

  // Converts a camelCase or PascalCase identifier into kebab-case.
  static toKebabCase(value: string): string {
    // Insert a dash before every upper-case letter and lower-case the result.
    return value.replace(/([A-Z])/g, '-$1').toLowerCase();
  }

  // Converts a kebab-case or snake_case identifier into camelCase.
  static toCamelCase(value: string): string {
    // Lower-case the first letter of the value and drop the separators afterwards.
    const lowered: string = value.charAt(0).toLowerCase() + value.substring(1);
    // Remove every dash or underscore and upper-case the following character.
    return lowered.replace(/[-_]+([a-zA-Z0-9])/g, (match: string, letter: string): string => {
      // Return the upper-cased letter following the separator.
      return letter.toUpperCase();
    });
  }

  // Truncates the value to the limit and appends the suffix when it was cut.
  static truncate(value: string, limit: number, suffix: string): string {
    // Return the value untouched when it already fits the limit.
    if (value.length <= limit) {
      // No truncation needed.
      return value;
    }
    // Cut the value and append the ellipsis suffix.
    return value.substring(0, limit) + suffix;
  }

  // Pads the string on the left with the pad character up to the target length.
  static padStart(value: string, length: number, padChar: string): string {
    // Return the value untouched when it is already long enough.
    if (value.length >= length) {
      // No padding needed.
      return value;
    }
    // Compose the missing padding characters.
    let padding: string = '';
    // Append one pad character per missing position.
    for (let i: number = value.length; i < length; i++) {
      // Append the pad character once.
      padding += padChar;
    }
    // Prepend the padding to the original value.
    return padding + value;
  }

  // Pads the string on the right with the pad character up to the target length.
  static padEnd(value: string, length: number, padChar: string): string {
    // Return the value untouched when it is already long enough.
    if (value.length >= length) {
      // No padding needed.
      return value;
    }
    // Compose the missing padding characters.
    let padding: string = '';
    // Append one pad character per missing position.
    for (let i: number = value.length; i < length; i++) {
      // Append the pad character once.
      padding += padChar;
    }
    // Append the padding after the original value.
    return value + padding;
  }

  // Counts how many times the search text occurs inside the value.
  static countMatches(value: string, search: string): number {
    // Return zero when either input is empty.
    if (StringUtils.isEmpty(value) || StringUtils.isEmpty(search)) {
      // Nothing to count.
      return 0;
    }
    // Track the number of non-overlapping matches found so far.
    let count: number = 0;
    // Track the scan position of the current search.
    let index: number = value.indexOf(search);
    // Keep searching while a match exists.
    while (index !== -1) {
      // Register the match.
      count += 1;
      // Continue the scan after the end of the current match.
      index = value.indexOf(search, index + search.length);
    }
    // Return the total match count.
    return count;
  }

  // Repeats the value the requested number of times.
  static repeat(value: string, times: number): string {
    // Return an empty string for non-positive repetitions.
    if (times <= 0) {
      // Nothing to repeat.
      return '';
    }
    // Accumulate the repeated result.
    let result: string = '';
    // Append the value once per requested repetition.
    for (let i: number = 0; i < times; i++) {
      // Append one copy of the value.
      result += value;
    }
    // Return the joined repetitions.
    return result;
  }

  // Joins the string parts with the separator, skipping empty parts.
  static joinSkipEmpty(separator: string, parts: string[]): string {
    // Collect the non-empty parts into a new list.
    const kept: string[] = [];
    // Inspect every part in order.
    for (let i: number = 0; i < parts.length; i++) {
      // Keep only parts that contain characters.
      if (!StringUtils.isEmpty(parts[i])) {
        // Append the non-empty part to the keep list.
        kept.push(parts[i]);
      }
    }
    // Join the kept parts with the separator.
    return kept.join(separator);
  }
}
