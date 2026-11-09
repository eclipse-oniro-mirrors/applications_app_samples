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

// Pure validation helpers expressed as regular expressions and character checks.
export class ValidateUtils {
  // The regular expression that accepts mainland China mobile numbers.
  private static readonly MOBILE_PATTERN: RegExp = /^1[3-9]\d{9}$/;
  // The regular expression that accepts common email shapes.
  private static readonly EMAIL_PATTERN: RegExp = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
  // The regular expression that accepts IPv4 dotted quad addresses.
  private static readonly IPV4_PATTERN: RegExp = /^(\d{1,3}\.){3}\d{1,3}$/;
  // The regular expression that accepts hexadecimal color codes of 3, 6 or 8 digits.
  private static readonly HEX_COLOR_PATTERN: RegExp = /^#([0-9A-Fa-f]{3}|[0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$/;

  // Returns true when the text is a valid mainland China mobile number.
  static isMobile(text: string): boolean {
    // Match the text against the mobile pattern.
    return ValidateUtils.MOBILE_PATTERN.test(text);
  }

  // Returns true when the text looks like a valid email address.
  static isEmail(text: string): boolean {
    // Match the text against the email pattern.
    return ValidateUtils.EMAIL_PATTERN.test(text);
  }

  // Returns true when the text is a valid IPv4 address.
  static isIpv4(text: string): boolean {
    // Reject shapes that do not match the dotted quad pattern first.
    if (!ValidateUtils.IPV4_PATTERN.test(text)) {
      // The shape itself is invalid.
      return false;
    }
    // Split the text into its four decimal octets.
    const parts: string[] = text.split('.');
    // Validate each octet independently.
    for (let i: number = 0; i < parts.length; i++) {
      // Parse the octet into a number.
      const value: number = parseInt(parts[i], 10);
      // Reject octets outside the 0..255 range or with leading zeros.
      if (isNaN(value) || value < 0 || value > 255 || (parts[i].length > 1 && parts[i].charAt(0) === '0')) {
        // The octet is invalid.
        return false;
      }
    }
    // Every octet passed the validation.
    return true;
  }

  // Returns true when the text is a hexadecimal color code.
  static isHexColor(text: string): boolean {
    // Match the text against the hex color pattern.
    return ValidateUtils.HEX_COLOR_PATTERN.test(text);
  }

  // Returns true when every character of the text is a decimal digit.
  static isDigits(text: string): boolean {
    // An empty string is not considered digit-only.
    if (text.length === 0) {
      // Reject the empty case.
      return false;
    }
    // Inspect every character in order.
    for (let i: number = 0; i < text.length; i++) {
      // Read the character code of the current position.
      const code: number = text.charCodeAt(i);
      // Compare the code against the digit range.
      if (code < 48 || code > 57) {
        // A non-digit character was found.
        return false;
      }
    }
    // Every character was a decimal digit.
    return true;
  }

  // Returns true when the text contains only ASCII letters.
  static isAlpha(text: string): boolean {
    // An empty string is not considered alphabetic.
    if (text.length === 0) {
      // Reject the empty case.
      return false;
    }
    // Inspect every character in order.
    for (let i: number = 0; i < text.length; i++) {
      // Read the character code of the current position.
      const code: number = text.charCodeAt(i);
      // Compare the code against both letter ranges.
      if (!((code >= 65 && code <= 90) || (code >= 97 && code <= 122))) {
        // A non-letter character was found.
        return false;
      }
    }
    // Every character was an ASCII letter.
    return true;
  }

  // Returns true when the text is a syntactically valid 18-digit mainland ID number.
  static isIdCard18(text: string): boolean {
    // Reject strings whose length is not exactly 18.
    if (text.length !== 18) {
      // The length is wrong.
      return false;
    }
    // Validate the first 17 characters as digits.
    for (let i: number = 0; i < 17; i++) {
      // Read the character code of the current position.
      const code: number = text.charCodeAt(i);
      // Compare the code against the digit range.
      if (code < 48 || code > 57) {
        // A non-digit appeared inside the number body.
        return false;
      }
    }
    // Accept either a digit or an uppercase X as the checksum character.
    const last: string = text.charAt(17);
    // Compare the final character against the allowed set.
    return (last >= '0' && last <= '9') || last === 'X';
  }

  // Returns true when the text length lies inside the inclusive range.
  static lengthBetween(text: string, min: number, max: number): boolean {
    // Compare the length against both bounds.
    return text.length >= min && text.length <= max;
  }
}
