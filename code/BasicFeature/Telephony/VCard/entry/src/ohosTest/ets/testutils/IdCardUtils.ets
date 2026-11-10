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
 * Pure-logic helpers around Chinese resident identity card numbers.
 *
 * The helpers are used by the hypium suites under the test folder to build
 * syntactically valid samples, to verify checksum behaviour and to exercise
 * masking or extraction edge cases without touching any real personal data.
 * Every method is static and side-effect free so that the test suites stay
 * deterministic and independent from device state or system services.
 */
export class IdCardUtils {
  /**
   * Weighting factors defined by GB 11643-1999 for the eighteen digit
   * resident identity card checksum algorithm. Index i multiplies digit i
   * of the first seventeen characters, counting from the left.
   */
  private static readonly WEIGHTS: number[] =
    [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];

  /**
   * Mapping from (weighted sum mod 11) to the expected eighteenth
   * character. Remainder 2 maps to the letter X, every other remainder
   * maps to a decimal digit, in the order 1, 0, X, 9, 8, 7, 6, 5, 4, 3, 2.
   */
  private static readonly CHECK_CODES: string[] =
    ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];

  /**
   * Returns true when every character of text is an ASCII digit.
   * An empty string contains no offending character and therefore yields
   * true; callers that care about emptiness check the length themselves.
   */
  static isAllDigits(text: string): boolean {
    for (let i = 0; i < text.length; i++) {
      const ch: string = text.charAt(i);
      if (ch < '0' || ch > '9') {
        return false;
      }
    }
    return true;
  }

  /**
   * Computes the checksum character for the first seventeen digits of an
   * eighteen digit identity card. The weighted sum of the seventeen digits
   * is reduced modulo eleven and mapped through CHECK_CODES. Returns ''
   * when first17 is not exactly seventeen ASCII digits.
   */
  static checksumDigit(first17: string): string {
    if (first17.length !== 17) {
      return '';
    }
    if (!IdCardUtils.isAllDigits(first17)) {
      return '';
    }
    let sum: number = 0;
    for (let i = 0; i < 17; i++) {
      const digit: number = first17.charCodeAt(i) - 48;
      sum = sum + digit * IdCardUtils.WEIGHTS[i];
    }
    const remainder: number = sum % 11;
    return IdCardUtils.CHECK_CODES[remainder];
  }

  /**
   * Validates an eighteen digit identity card number: the first seventeen
   * characters must be digits, the last one must be a digit or letter X/x,
   * and the checksum must match the computed value. No semantic checks
   * (region plausibility or birthday range) are applied on purpose, which
   * keeps the helper purely algorithmic for stable test assertions.
   */
  static isValidIdCard(id: string): boolean {
    if (id.length !== 18) {
      return false;
    }
    const first17: string = id.substring(0, 17);
    if (!IdCardUtils.isAllDigits(first17)) {
      return false;
    }
    const last: string = id.charAt(17);
    const lastIsDigit: boolean = last >= '0' && last <= '9';
    const lastIsUpperX: boolean = last === 'X';
    const lastIsLowerX: boolean = last === 'x';
    if (!lastIsDigit && !lastIsUpperX && !lastIsLowerX) {
      return false;
    }
    const expected: string = IdCardUtils.checksumDigit(first17);
    if (expected === '') {
      return false;
    }
    if (lastIsUpperX || lastIsLowerX) {
      return expected === 'X';
    }
    return expected === last;
  }

  /**
   * Checks the six digit administrative region prefix of an identity card.
   * Only the length plus the first two digits are inspected: the first
   * digit must be 1-9 because province codes never start with zero, and
   * the second digit must be 0-9. Trailing characters are not validated.
   */
  static isValidRegionCode(prefix: string): boolean {
    if (prefix.length !== 6) {
      return false;
    }
    const first: string = prefix.charAt(0);
    if (first < '1' || first > '9') {
      return false;
    }
    const second: string = prefix.charAt(1);
    if (second < '0' || second > '9') {
      return false;
    }
    return true;
  }

  /**
   * Extracts the birthday part of a valid identity card as yyyy-MM-dd.
   * Returns '' when id is not a checksum-valid eighteen digit number. The
   * month and day values are copied verbatim, so out-of-range dates such
   * as month 13 are still rendered by design to keep parsing decoupled
   * from calendar validation.
   */
  static extractBirthday(id: string): string {
    if (!IdCardUtils.isValidIdCard(id)) {
      return '';
    }
    const year: string = id.substring(6, 10);
    const month: string = id.substring(10, 12);
    const day: string = id.substring(12, 14);
    return year + '-' + month + '-' + day;
  }

  /**
   * Extracts the gender digit of a valid identity card and reduces it
   * modulo two. The gender digit is the seventeenth character: an odd
   * digit maps to 1 (male) and an even digit maps to 0 (female). Returns
   * -1 when id is not a valid eighteen digit number.
   */
  static extractGenderDigit(id: string): number {
    if (!IdCardUtils.isValidIdCard(id)) {
      return -1;
    }
    const gender: string = id.charAt(16);
    const value: number = gender.charCodeAt(0) - 48;
    return value % 2;
  }

  /**
   * Converts a numeric gender digit into a short English label. Returns
   * 'male' for 1, 'female' for 0 and the empty string for the -1 error
   * marker produced by extractGenderDigit on invalid input.
   */
  static genderLabelOf(id: string): string {
    const gender: number = IdCardUtils.extractGenderDigit(id);
    if (gender === 1) {
      return 'male';
    }
    if (gender === 0) {
      return 'female';
    }
    return '';
  }

  /**
   * Masks an identity card for log or UI output: keeps the first six and
   * the last four characters and replaces the middle eight characters with
   * asterisks. Strings whose length differs from 18 are returned unchanged
   * so that callers never receive a half-masked malformed value.
   */
  static maskIdCard(id: string): string {
    if (id.length !== 18) {
      return id;
    }
    let masked: string = id.substring(0, 6);
    for (let i = 0; i < 8; i++) {
      masked = masked + '*';
    }
    masked = masked + id.substring(14, 18);
    return masked;
  }

  /**
   * Generic masking variant with a configurable head length. Keeps the
   * first keep characters and the last four characters and fills the gap
   * with asterisks. Inputs shorter than keep plus four characters, or a
   * negative keep, are returned unchanged.
   */
  static maskKeep(id: string, keep: number): string {
    if (keep < 0) {
      return id;
    }
    if (id.length <= keep + 4) {
      return id;
    }
    let masked: string = id.substring(0, keep);
    const starCount: number = id.length - keep - 4;
    for (let i = 0; i < starCount; i++) {
      masked = masked + '*';
    }
    masked = masked + id.substring(id.length - 4, id.length);
    return masked;
  }

  /**
   * Returns the well-known two digit province level prefixes of the
   * Chinese administrative region table, ordered from the north-east
   * municipalities down to the north-west provinces. The table is rebuilt
   * on every call so callers can never mutate shared state.
   */
  static regionPrefixTable(): string[] {
    const table: string[] = [
      '11', '12', '13', '14', '15',
      '21', '22', '23',
      '31', '32', '33', '34', '35', '36', '37',
      '41', '42', '43', '44', '45', '46',
      '50', '51', '52', '53', '54',
      '61', '62', '63', '64', '65'
    ];
    return table;
  }

  /**
   * Convenience builder used by tests: glues a six digit region code, an
   * eight digit birthday and a three digit sequence into the first
   * seventeen characters and appends the computed checksum digit. Returns
   * '' when any part has the wrong length or contains a non-digit symbol.
   */
  static buildValidIdCard(region6: string, birth8: string, seq3: string): string {
    if (region6.length !== 6 || birth8.length !== 8 || seq3.length !== 3) {
      return '';
    }
    const first17: string = region6 + birth8 + seq3;
    if (!IdCardUtils.isAllDigits(first17)) {
      return '';
    }
    const check: string = IdCardUtils.checksumDigit(first17);
    if (check === '') {
      return '';
    }
    return first17 + check;
  }

  /**
   * Splits a valid identity card into its fixed width fields: a six digit
   * region code, an eight digit birthday, a three digit sequence number
   * and the final checksum character. Returns null when id is invalid.
   */
  static splitIdCard(id: string): IdCardParts | null {
    if (!IdCardUtils.isValidIdCard(id)) {
      return null;
    }
    const parts: IdCardParts = new IdCardParts();
    parts.region = id.substring(0, 6);
    parts.birthday = id.substring(6, 14);
    parts.seq = id.substring(14, 17);
    parts.check = id.substring(17, 18);
    return parts;
  }

  /**
   * Counts how many strings of the given array are valid eighteen digit
   * identity cards. Returns -1 when the array itself is empty so callers
   * can distinguish an empty sample set from an all-invalid one.
   */
  static countValidNumbers(samples: string[]): number {
    if (samples.length === 0) {
      return -1;
    }
    let count: number = 0;
    for (let i = 0; i < samples.length; i++) {
      if (IdCardUtils.isValidIdCard(samples[i])) {
        count = count + 1;
      }
    }
    return count;
  }

  /**
   * Accepts both current eighteen digit numbers and legacy fifteen digit
   * numbers. A fifteen digit input is only checked for being all digits;
   * an eighteen digit input delegates to isValidIdCard(); every other
   * length is rejected outright.
   */
  static isValidIdCardLoose(id: string): boolean {
    if (id.length === 15) {
      return IdCardUtils.isAllDigits(id);
    }
    if (id.length === 18) {
      return IdCardUtils.isValidIdCard(id);
    }
    return false;
  }
}

/**
 * Structured view of an identity card split into its fixed width fields.
 * Each field is stored as the raw substring so that leading zeros and the
 * letter X survive unchanged.
 */
export class IdCardParts {
  public region: string = '';
  public birthday: string = '';
  public seq: string = '';
  public check: string = '';
}
