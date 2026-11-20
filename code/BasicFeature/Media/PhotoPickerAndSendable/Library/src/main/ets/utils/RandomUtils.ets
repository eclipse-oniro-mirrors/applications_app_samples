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

import { util } from '@kit.ArkTS';

// Alphabet used by the generic random string helper, no ambiguous characters included.
const LETTER_POOL: string = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
// Digits used by the numeric helpers.
const DIGIT_POOL: string = '0123456789';
// Hexadecimal characters used by the hex color helper.
const HEX_POOL: string = '0123456789abcdef';
// Single step added to the range width so the upper bound is reachable.
const RANGE_STEP: number = 1;

/**
 * Small collection of random helpers used by the sample pages.
 * The class wraps util.generateRandomUUID where a real UUID is needed and falls back to
 * Math.random for the simple cases, which keeps the API easy to read for sample code.
 */
export class RandomUtils {
  /**
   * Returns a random integer inside the inclusive range.
   * @param minInclusive Lower bound, included.
   * @param maxInclusive Upper bound, included.
   * @returns Random integer, or minInclusive when the range is invalid.
   */
  static randomInt(minInclusive: number, maxInclusive: number): number {
    // Normalize the bounds so a swapped pair still produces a valid range.
    const low: number = Math.ceil(Math.min(minInclusive, maxInclusive));
    // Normalize the upper bound in the same way.
    const high: number = Math.floor(Math.max(minInclusive, maxInclusive));
    // A degenerate range only has one possible answer.
    if (high <= low) {
      // Return the single value of the range.
      return low;
    }
    // Scale Math.random into the inclusive range.
    const value: number = low + Math.floor(Math.random() * (high - low + RANGE_STEP));
    // Return the clamped result to protect against floating point drift.
    return value > high ? high : value;
  }

  /**
   * Returns a random boolean with an even distribution.
   * @returns True or false with the same probability.
   */
  static randomBoolean(): boolean {
    // Compare the random fraction against one half.
    return Math.random() < 0.5;
  }

  /**
   * Builds a random string from the letter pool.
   * @param length Number of characters to generate.
   * @returns Random string, empty when the length is not positive.
   */
  static randomString(length: number): string {
    // A non positive length has no meaningful output.
    if (length <= 0) {
      // Return the empty string.
      return '';
    }
    // Accumulate the characters one by one, concatenation avoids template strings.
    let result: string = '';
    // Generate exactly the requested number of characters.
    for (let index: number = 0; index < length; index++) {
      // Pick a random position inside the letter pool.
      const position: number = RandomUtils.randomInt(0, LETTER_POOL.length - 1);
      // Append the chosen character.
      result = result + LETTER_POOL.charAt(position);
    }
    // Return the assembled string.
    return result;
  }

  /**
   * Picks a random element from a string array.
   * @param arr Source array.
   * @returns Random element, or an empty string when the array is empty.
   */
  static randomItem(arr: string[]): string {
    // An empty array has nothing to pick.
    if (arr.length === 0) {
      // Return the neutral value.
      return '';
    }
    // Pick a random valid index of the array.
    const index: number = RandomUtils.randomInt(0, arr.length - 1);
    // Return the element at that index.
    return arr[index];
  }

  /**
   * Returns a shuffled copy of a string array without touching the input.
   * @param arr Source array.
   * @returns New array with the same elements in random order.
   */
  static shuffleCopy(arr: string[]): string[] {
    // Copy the input so the caller data stays unchanged.
    const copy: string[] = arr.slice(0);
    // Walk the copy from the last position to the first.
    for (let index: number = copy.length - 1; index > 0; index--) {
      // Pick a random partner inside the not yet fixed prefix.
      const partner: number = RandomUtils.randomInt(0, index);
      // Remember the current element before the swap.
      const current: string = copy[index];
      // Move the partner element to the current position.
      copy[index] = copy[partner];
      // Put the remembered element at the partner position.
      copy[partner] = current;
    }
    // Return the shuffled copy.
    return copy;
  }

  /**
   * Generates a version 4 style UUID string.
   * @returns UUID such as "3f0c...".
   */
  static uuid(): string {
    // Ask the platform for a real random UUID.
    const value: string = util.generateRandomUUID(true);
    // Return the generated identifier.
    return value;
  }

  /**
   * Generates a random "#RRGGBB" color string.
   * @returns Hex color with a leading hash.
   */
  static randomHexColor(): string {
    // Start the color with the required prefix.
    let color: string = '#';
    // A color needs exactly six hexadecimal digits.
    for (let index: number = 0; index < 6; index++) {
      // Pick a random position inside the hexadecimal pool.
      const position: number = RandomUtils.randomInt(0, HEX_POOL.length - 1);
      // Append the chosen digit.
      color = color + HEX_POOL.charAt(position);
    }
    // Return the assembled color string.
    return color;
  }

  /**
   * Generates a random digit only string.
   * @param length Number of digits to generate.
   * @returns Digit string, empty when the length is not positive.
   */
  static randomDigits(length: number): string {
    // A non positive length has no meaningful output.
    if (length <= 0) {
      // Return the empty string.
      return '';
    }
    // Accumulate the digits one by one.
    let result: string = '';
    // Generate exactly the requested number of digits.
    for (let index: number = 0; index < length; index++) {
      // Pick a random position inside the digit pool.
      const position: number = RandomUtils.randomInt(0, DIGIT_POOL.length - 1);
      // Append the chosen digit.
      result = result + DIGIT_POOL.charAt(position);
    }
    // Return the assembled digit string.
    return result;
  }
}
