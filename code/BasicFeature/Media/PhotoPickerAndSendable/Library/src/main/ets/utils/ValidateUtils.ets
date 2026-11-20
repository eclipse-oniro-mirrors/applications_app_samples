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

// Mobile phone pattern of the mainland China numbering plan.
const PHONE_PATTERN: RegExp = new RegExp('^1[3-9][0-9]{9}$');
// Pragmatic e-mail pattern, one at sign, a dot inside the domain and no blanks.
const EMAIL_PATTERN: RegExp = new RegExp('^[A-Za-z0-9._%+-]+@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)+$');
// Http or https url pattern with a host and an optional path.
const URL_PATTERN: RegExp = new RegExp('^https?://[A-Za-z0-9.-]+(:[0-9]+)?(/[^\\s]*)?$');
// Decimal number pattern with an optional sign and an optional fraction.
const NUMBER_PATTERN: RegExp = new RegExp('^-?[0-9]+(\\.[0-9]+)?$');
// Six digit hexadecimal color pattern with the leading hash.
const HEX_COLOR_PATTERN: RegExp = new RegExp('^#([0-9A-Fa-f]{6})$');
// Length of the phone number of the mainland China numbering plan.
const PHONE_LENGTH: number = 11;
// Fastest digits of a mainland China mobile number.
const PHONE_PREFIX_SLOWEST: number = 3;
// Slowest digits of a mainland China mobile number.
const PHONE_PREFIX_FASTEST: number = 9;
// Length of the file:// scheme prefix.
const FILE_SCHEME: string = 'file://';
// Length of the picker uri prefix that grants temporary read access.
const PICKER_SCHEME: string = 'file://media/';
// Length of the sandbox uri prefix used by the file share kit.
const DATA_SCHEME: string = 'datashare://';
// Character that separates the directory part from the file name.
const PATH_SEPARATOR: string = '/';
// Character that introduces an extension inside a file name.
const EXTENSION_MARKER: string = '.';

/**
 * Validation helpers for the values entered or received by the sample screens.
 * Every method returns a boolean and never throws on malformed input.
 */
export class ValidateUtils {
  /**
   * Checks whether the text is a mainland China mobile phone number.
   * @param value Text to test, undefined and null are accepted.
   * @returns True when the text has eleven digits and a valid prefix.
   */
  static isPhone(value: string | undefined | null): boolean {
    // Missing text is never a phone number; the explicit null check also narrows the type to string.
    if (value === undefined || value === null || value.trim().length === 0) {
      return false;
    }
    // Trim the text before testing so that padded input still passes.
    const text: string = value.trim();
    // The regular expression is the authoritative check.
    return PHONE_PATTERN.test(text);
  }

  /**
   * Checks whether the text looks like an e-mail address.
   * @param value Text to test, undefined and null are accepted.
   * @returns True when the text matches the e-mail pattern.
   */
  static isEmail(value: string | undefined | null): boolean {
    // Missing text is never an address; the explicit null check also narrows the type to string.
    if (value === undefined || value === null || value.trim().length === 0) {
      return false;
    }
    // The regular expression is the authoritative check.
    return EMAIL_PATTERN.test(value.trim());
  }

  /**
   * Checks whether the text is an http or https url.
   * @param value Text to test, undefined and null are accepted.
   * @returns True when the text matches the url pattern.
   */
  static isUrl(value: string | undefined | null): boolean {
    // Missing text is never a url; the explicit null check also narrows the type to string.
    if (value === undefined || value === null || value.trim().length === 0) {
      return false;
    }
    // The regular expression is the authoritative check.
    return URL_PATTERN.test(value.trim());
  }

  /**
   * Checks whether the text holds a plain decimal number.
   * @param value Text to test, undefined and null are accepted.
   * @returns True when the text can be read as a decimal number.
   */
  static isNumber(value: string | undefined | null): boolean {
    // Missing text is never a number; the explicit null check also narrows the type to string.
    if (value === undefined || value === null || value.trim().length === 0) {
      return false;
    }
    // The regular expression rejects the exponent and hexadecimal forms on purpose.
    return NUMBER_PATTERN.test(value.trim());
  }

  /**
   * Checks whether the text is missing, empty or only whitespace.
   * @param value Text to test, undefined and null are accepted.
   * @returns True when the text carries no visible character.
   */
  static isEmptyString(value: string | undefined | null): boolean {
    // Missing text counts as empty.
    if (value === undefined || value === null) {
      return true;
    }
    // A trimmed text with zero length has no visible character.
    return value.trim().length === 0;
  }

  /**
   * Checks whether the text is a six digit hexadecimal color.
   * @param value Text to test, undefined and null are accepted.
   * @returns True when the text matches '#RRGGBB'.
   */
  static isHexColor(value: string | undefined | null): boolean {
    // Missing text is never a color; the explicit null check also narrows the type to string.
    if (value === undefined || value === null || value.trim().length === 0) {
      return false;
    }
    // The regular expression is the authoritative check.
    return HEX_COLOR_PATTERN.test(value.trim());
  }

  /**
   * Checks whether the index can address an entry of a list of the given size.
   * @param index Index to test.
   * @param length Number of entries of the target list.
   * @returns True when the index is a whole number inside the list bounds.
   */
  static isValidIndex(index: number, length: number): boolean {
    // The index has to be a whole number.
    if (!Number.isFinite(index) || Math.floor(index) !== index) {
      return false;
    }
    // Zero is the first valid index.
    if (index < 0) {
      return false;
    }
    // The last valid index is one below the length.
    return index < length;
  }

  /**
   * Checks whether the value is a strictly positive whole number.
   * @param value Number to test.
   * @returns True when the value is a positive integer.
   */
  static isPositiveInteger(value: number): boolean {
    // Finite is required so that Infinity is rejected.
    if (!Number.isFinite(value)) {
      return false;
    }
    // Strictly positive and without a fractional part.
    return value > 0 && Math.floor(value) === value;
  }

  /**
   * Checks whether the text is a media uri that the sample can read.
   * Supported forms are the picker granted 'file://media/...' uri,
   * the sandbox 'file://<sandbox path>' uri and the share 'datashare://' uri.
   * @param value Text to test, undefined and null are accepted.
   * @returns True when the text starts with a supported media scheme.
   */
  static isMediaUri(value: string | undefined | null): boolean {
    // Missing text is never a media uri; the explicit null check also narrows the type to string.
    if (value === undefined || value === null || value.trim().length === 0) {
      return false;
    }
    // Trim the text before inspecting the scheme.
    const text: string = value.trim();
    // The picker grants temporary read access through the media path.
    if (text.indexOf(PICKER_SCHEME) === 0) {
      return true;
    }
    // The share kit exposes media through the datashare scheme.
    if (text.indexOf(DATA_SCHEME) === 0) {
      return true;
    }
    // Sandbox copies are plain file uris and need a file name with an extension.
    if (text.indexOf(FILE_SCHEME) === 0) {
      return ValidateUtils.hasFileExtension(text);
    }
    // Any other scheme is rejected.
    return false;
  }

  /**
   * Checks whether the path part of a uri ends with a short file extension.
   * @param uri Full uri text.
   * @returns True when the last path segment carries an extension of one to five characters.
   */
  private static hasFileExtension(uri: string): boolean {
    // Take the last path segment of the uri.
    const lastSlash: number = uri.lastIndexOf(PATH_SEPARATOR);
    // An uri without separator has no file name at all.
    if (lastSlash < 0 || lastSlash === uri.length - 1) {
      return false;
    }
    // Extract the file name from the uri.
    const fileName: string = uri.substring(lastSlash + 1);
    // Locate the extension marker inside the file name.
    const dotIndex: number = fileName.lastIndexOf(EXTENSION_MARKER);
    // The marker has to sit after the first character and before the end.
    if (dotIndex <= 0 || dotIndex === fileName.length - 1) {
      return false;
    }
    // Measure the extension text.
    const extension: string = fileName.substring(dotIndex + 1);
    // Keep the accepted extension length tight to avoid false positives.
    return extension.length >= 1 && extension.length <= 5;
  }

  /**
   * Checks whether the text is a main land China phone number without the regular expression.
   * Kept as a fallback for call sites that need to stay deterministic.
   * @param value Text to test, undefined and null are accepted.
   * @returns True when the text is a valid phone number.
   */
  static isPhoneByDigits(value: string | undefined | null): boolean {
    // Missing text is never a phone number; the explicit null check also narrows the type to string.
    if (value === undefined || value === null || value.trim().length === 0) {
      return false;
    }
    // Trim the text before inspecting the digits.
    const text: string = value.trim();
    // The numbering plan uses eleven digits.
    if (text.length !== PHONE_LENGTH) {
      return false;
    }
    // The first digit is always one.
    if (text.charAt(0) !== '1') {
      return false;
    }
    // The second digit selects the carrier prefix.
    const second: number = Number(text.charAt(1));
    // Only the 3 to 9 block is assigned to mobile numbers.
    if (second < PHONE_PREFIX_SLOWEST || second > PHONE_PREFIX_FASTEST) {
      return false;
    }
    // Every remaining character has to be a digit.
    for (let index: number = 2; index < PHONE_LENGTH; index++) {
      // Read the current character.
      const character: string = text.charAt(index);
      // A single non digit rejects the whole number.
      if (!ValidateUtils.isDigit(character)) {
        return false;
      }
    }
    // All checks passed.
    return true;
  }

  /**
   * Checks whether the character sits inside the decimal digit block.
   * @param character Single character text.
   * @returns True when the character is '0' to '9'.
   */
  private static isDigit(character: string): boolean {
    // Compare the character against the two ends of the digit block.
    return character >= '0' && character <= '9';
  }
}
