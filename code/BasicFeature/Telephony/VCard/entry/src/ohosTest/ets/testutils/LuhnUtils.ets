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
 * Pure-logic helpers around the Luhn checksum algorithm and the card
 * number string hygiene used by the VCard unit tests.
 *
 * The test suites use these helpers to validate well known card samples,
 * to break numbers on purpose and to synthesise fresh valid numbers whose
 * correctness is guaranteed by construction. Every method is static and
 * side-effect free so the suites stay deterministic on any device.
 */
export class LuhnUtils {
  /**
   * Digit filler sequence used by makeValidCardNumber when the requested
   * body is longer than the given prefix. The sequence is deterministic
   * so generated numbers can be reproduced exactly across runs.
   */
  private static readonly FILL_SEQ: string = '1234567890';

  /**
   * Upper bound for the total length of generated card numbers. It keeps
   * the produced strings inside the range covered by real card schemes
   * and prevents accidental abuse of the generator.
   */
  private static readonly MAX_TOTAL_LEN: number = 19;

  /**
   * Returns true when every character of text is an ASCII digit. An empty
   * string yields true because it contains no offending character; callers
   * that need non-empty input check the length on their own.
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
   * Removes every space and dash from text and keeps all other characters
   * untouched. This mirrors the paste-friendly formatting used by card
   * entry fields: '4111 1111 1111 1111' and '4111-1111-1111-1111' both
   * collapse to the bare sixteen digit string.
   */
  static stripSeparators(text: string): string {
    let out: string = '';
    for (let i = 0; i < text.length; i++) {
      const ch: string = text.charAt(i);
      if (ch === ' ' || ch === '-') {
        continue;
      }
      out = out + ch;
    }
    return out;
  }

  /**
   * Computes the Luhn check digit for a payload that does not yet carry
   * its check digit. Starting from the rightmost payload digit every
   * second digit is doubled and values above nine are reduced by nine;
   * the final check digit equals (sum * 9) mod 10, which is equivalent to
   * (10 - sum mod 10) mod 10. Returns '' when payload is empty or contains
   * a character that is not an ASCII digit.
   */
  static luhnCheckDigit(payload: string): string {
    if (payload.length === 0) {
      return '';
    }
    if (!LuhnUtils.isAllDigits(payload)) {
      return '';
    }
    let sum: number = 0;
    let doubleIt: boolean = true;
    for (let i = payload.length - 1; i >= 0; i--) {
      let digit: number = payload.charCodeAt(i) - 48;
      if (doubleIt) {
        digit = digit * 2;
        if (digit > 9) {
          digit = digit - 9;
        }
      }
      sum = sum + digit;
      doubleIt = !doubleIt;
    }
    const check: number = (sum * 9) % 10;
    return '' + check;
  }

  /**
   * Validates a complete card number: the string must contain only ASCII
   * digits, must be at least two characters long and its final character
   * must equal the Luhn check digit computed from the leading digits.
   */
  static isValidCardNumber(cardNo: string): boolean {
    if (cardNo.length < 2) {
      return false;
    }
    if (!LuhnUtils.isAllDigits(cardNo)) {
      return false;
    }
    const payload: string = cardNo.substring(0, cardNo.length - 1);
    const check: string = LuhnUtils.luhnCheckDigit(payload);
    if (check === '') {
      return false;
    }
    return check === cardNo.charAt(cardNo.length - 1);
  }

  /**
   * Generates a card number that starts with prefix, has exactly totalLen
   * characters and passes isValidCardNumber. The gap between the prefix
   * and the check digit is filled with the deterministic FILL_SEQ pattern.
   * Returns '' when prefix is empty or non-digit, when totalLen is not an
   * integer between prefix length plus one and MAX_TOTAL_LEN, or when the
   * value is NaN.
   */
  static makeValidCardNumber(prefix: string, totalLen: number): string {
    if (prefix.length === 0) {
      return '';
    }
    if (!LuhnUtils.isAllDigits(prefix)) {
      return '';
    }
    if (totalLen !== Math.floor(totalLen)) {
      return '';
    }
    if (totalLen < 2 || totalLen > LuhnUtils.MAX_TOTAL_LEN) {
      return '';
    }
    if (totalLen <= prefix.length) {
      return '';
    }
    let body: string = prefix;
    while (body.length < totalLen - 1) {
      const fillIndex: number = body.length - prefix.length;
      body = body + LuhnUtils.FILL_SEQ.charAt(fillIndex % 10);
    }
    const check: string = LuhnUtils.luhnCheckDigit(body);
    if (check === '') {
      return '';
    }
    return body + check;
  }

  /**
   * Groups a bare digit string into blocks of four separated by single
   * spaces, the common display style for payment card numbers. The final
   * block keeps whatever remainder is left, so 15 and 16 digit numbers
   * both render naturally. An empty input returns an empty string.
   */
  static formatGrouped(cardNo: string): string {
    if (cardNo.length === 0) {
      return '';
    }
    let out: string = '';
    for (let i = 0; i < cardNo.length; i++) {
      if (i > 0 && i % 4 === 0) {
        out = out + ' ';
      }
      out = out + cardNo.charAt(i);
    }
    return out;
  }

  /**
   * Masks a card number for log or UI output: keeps the first four and
   * the last four characters and fills the middle with asterisks. Strings
   * shorter than eight characters are returned unchanged so a masked
   * result never reveals less than it should.
   */
  static maskCard(cardNo: string): string {
    if (cardNo.length < 8) {
      return cardNo;
    }
    let masked: string = cardNo.substring(0, 4);
    const starCount: number = cardNo.length - 8;
    for (let i = 0; i < starCount; i++) {
      masked = masked + '*';
    }
    masked = masked + cardNo.substring(cardNo.length - 4, cardNo.length);
    return masked;
  }

  /**
   * Computes the raw Luhn weighted sum of a digit string without applying
   * the final modulo step. Doubling starts at the rightmost digit and
   * values above nine are reduced by nine. Returns -1 when text is empty
   * or contains a character that is not an ASCII digit.
   */
  static luhnSum(text: string): number {
    if (text.length === 0) {
      return -1;
    }
    if (!LuhnUtils.isAllDigits(text)) {
      return -1;
    }
    let sum: number = 0;
    let doubleIt: boolean = true;
    for (let i = text.length - 1; i >= 0; i--) {
      let digit: number = text.charCodeAt(i) - 48;
      if (doubleIt) {
        digit = digit * 2;
        if (digit > 9) {
          digit = digit - 9;
        }
      }
      sum = sum + digit;
      doubleIt = !doubleIt;
    }
    return sum;
  }
}
