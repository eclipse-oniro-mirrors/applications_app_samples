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

import { Logger } from './Logger';

// IPv4 address made of four dotted decimal octets.
const IPV4_PATTERN: RegExp = /^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/;
// IPv6 covering full eight group forms and every "::" compression position;
// each alternative pins the group count implied by the compressed side.
const IPV6_PATTERN: RegExp =
  /^(?:(?:[0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4}|(?:[0-9A-Fa-f]{1,4}:){1,7}:|(?:[0-9A-Fa-f]{1,4}:){1,6}:[0-9A-Fa-f]{1,4}|(?:[0-9A-Fa-f]{1,4}:){1,5}(?::[0-9A-Fa-f]{1,4}){1,2}|(?:[0-9A-Fa-f]{1,4}:){1,4}(?::[0-9A-Fa-f]{1,4}){1,3}|(?:[0-9A-Fa-f]{1,4}:){1,3}(?::[0-9A-Fa-f]{1,4}){1,4}|(?:[0-9A-Fa-f]{1,4}:){1,2}(?::[0-9A-Fa-f]{1,4}){1,5}|[0-9A-Fa-f]{1,4}:(?::[0-9A-Fa-f]{1,4}){1,6}|:(?:(?::[0-9A-Fa-f]{1,4}){1,7}|:))$/;
// Domain of dot separated labels that must end with a two-letter-or-longer TLD.
const DOMAIN_PATTERN: RegExp = /^(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,}$/;
// Absolute http or https URL with host and optional path.
const URL_PATTERN: RegExp = /^https?:\/\/[a-zA-Z0-9.-]+(?::\d{1,5})?(?:\/[^\s]*)?$/;
// Practical e-mail shape of local part, at sign and dotted domain.
const EMAIL_PATTERN: RegExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
// Lowest valid TCP/UDP port number.
const MIN_PORT: number = 1;
// Highest valid TCP/UDP port number.
const MAX_PORT: number = 65535;
// Highest value a single IPv4 octet may take.
const MAX_OCTET: number = 255;
// Number of octets in a dotted IPv4 address.
const OCTET_COUNT: number = 4;

/**
 * Validation and encoding helpers for common network literals: IPv4 and
 * IPv6 addresses, domains, URLs, ports, e-mail addresses plus percent
 * encoding helpers. All methods are stateless and return plain booleans.
 */
export class ValidateUtils {
  /**
   * Check whether a value is a syntactically valid IPv4 address with every
   * octet inside the 0 to 255 range.
   * @param value text to validate.
   * @returns true when the value is a dotted IPv4 address.
   */
  static isValidIPv4(value: string): boolean {
    const tag: string = '[ValidateUtils#isValidIPv4]';
    Logger.enter(tag, 'value: ' + value);
    Logger.beginTrace('NetworkSecurity.utils.isValidIPv4', 1);
    // Match the dotted shape first, then verify each octet numerically.
    let result: boolean = false;
    const matched: RegExpMatchArray | null = value.match(IPV4_PATTERN);
    if (matched !== null && matched.length === OCTET_COUNT + 1) {
      // Validate all four captured octets before accepting the address.
      result = true;
      for (let index = 1; index <= OCTET_COUNT; index++) {
        const octet: number = Number.parseInt(matched[index], 10);
        if (Number.isNaN(octet) || octet < 0 || octet > MAX_OCTET) {
          result = false;
          break;
        }
      }
    }
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.isValidIPv4', 1);
    return result;
  }

  /**
   * Check whether a value is a syntactically valid IPv6 address, including
   * full groups, the "::" compression forms and the loopback address.
   * @param value text to validate.
   * @returns true when the value looks like an IPv6 address.
   */
  static isValidIPv6(value: string): boolean {
    const tag: string = '[ValidateUtils#isValidIPv6]';
    Logger.enter(tag, 'value: ' + value);
    Logger.beginTrace('NetworkSecurity.utils.isValidIPv6', 1);
    // A single anchored regex keeps the check short and stateless.
    const result: boolean = IPV6_PATTERN.test(value);
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.isValidIPv6', 1);
    return result;
  }

  /**
   * Check whether a value is a plausible domain name of dot separated
   * labels ending in a two-letter-or-longer top level domain.
   * @param value text to validate.
   * @returns true when the value looks like a domain name.
   */
  static isValidDomain(value: string): boolean {
    const tag: string = '[ValidateUtils#isValidDomain]';
    Logger.enter(tag, 'value: ' + value);
    Logger.beginTrace('NetworkSecurity.utils.isValidDomain', 1);
    // Labels, hyphens and a real TLD suffix are covered by the pattern.
    const result: boolean = DOMAIN_PATTERN.test(value);
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.isValidDomain', 1);
    return result;
  }

  /**
   * Check whether a value is an absolute http or https URL with a host and
   * an optional port and path.
   * @param value text to validate.
   * @returns true when the value looks like an http or https URL.
   */
  static isValidUrl(value: string): boolean {
    const tag: string = '[ValidateUtils#isValidUrl]';
    Logger.enter(tag, 'value: ' + value);
    Logger.beginTrace('NetworkSecurity.utils.isValidUrl', 1);
    // Only cleartext http and https schemes are considered valid here.
    const result: boolean = URL_PATTERN.test(value);
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.isValidUrl', 1);
    return result;
  }

  /**
   * Check whether a number is a valid TCP or UDP port.
   * @param value candidate port number.
   * @returns true when the value is an integer from 1 to 65535.
   */
  static isValidPort(value: number): boolean {
    const tag: string = '[ValidateUtils#isValidPort]';
    Logger.enter(tag, 'value: ' + value.toString());
    Logger.beginTrace('NetworkSecurity.utils.isValidPort', 1);
    // Ports are integers between 1 and 65535; zero is reserved.
    const result: boolean = Number.isInteger(value) && value >= MIN_PORT && value <= MAX_PORT;
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.isValidPort', 1);
    return result;
  }

  /**
   * Check whether a value is a plausible e-mail address.
   * @param value text to validate.
   * @returns true when the value matches the simplified e-mail pattern.
   */
  static isValidEmail(value: string): boolean {
    const tag: string = '[ValidateUtils#isValidEmail]';
    Logger.enter(tag, 'value: ' + value);
    Logger.beginTrace('NetworkSecurity.utils.isValidEmail', 1);
    // The pattern covers common shapes but is intentionally not RFC complete.
    const result: boolean = EMAIL_PATTERN.test(value);
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.isValidEmail', 1);
    return result;
  }

  /**
   * Percent-encode a value so it can be embedded safely in a URL.
   * @param value text to encode.
   * @returns the encoded text, or the original when encoding fails.
   */
  static encodeUriComponent(value: string): string {
    const tag: string = '[ValidateUtils#encodeUriComponent]';
    Logger.enter(tag, 'value: ' + value);
    Logger.beginTrace('NetworkSecurity.utils.encodeUriComponent', 1);
    // Delegate to the global encoder; it throws only on lone surrogates.
    let result: string = value;
    try {
      result = encodeURIComponent(value);
    } catch (error) {
      // The global encoder throws a plain URIError without a code, so log its message.
      const err: Error = error as Error;
      const detail: string = typeof err.message === 'string' ? err.message : 'unknown error';
      Logger.error(tag + ' encode failed: ' + detail);
      result = value;
    }
    Logger.exit(tag, 'result: ' + result);
    Logger.endTrace('NetworkSecurity.utils.encodeUriComponent', 1);
    return result;
  }

  /**
   * Decode a percent-encoded value back to plain text.
   * @param value text to decode.
   * @returns the decoded text, or the original when decoding fails.
   */
  static decodeUri(value: string): string {
    const tag: string = '[ValidateUtils#decodeUri]';
    Logger.enter(tag, 'value: ' + value);
    Logger.beginTrace('NetworkSecurity.utils.decodeUri', 1);
    // Malformed escapes throw inside the global decoder, so guard them.
    let result: string = value;
    try {
      result = decodeURIComponent(value);
    } catch (error) {
      // The global decoder throws a plain URIError without a code, so log its message.
      const err: Error = error as Error;
      const detail: string = typeof err.message === 'string' ? err.message : 'unknown error';
      Logger.error(tag + ' decode failed: ' + detail);
      result = value;
    }
    Logger.exit(tag, 'result: ' + result);
    Logger.endTrace('NetworkSecurity.utils.decodeUri', 1);
    return result;
  }

  /**
   * Check whether a number is strictly positive.
   * @param value candidate number.
   * @returns true when the value is a finite number greater than zero.
   */
  static isPositiveNumber(value: number): boolean {
    const tag: string = '[ValidateUtils#isPositiveNumber]';
    Logger.enter(tag, 'value: ' + value.toString());
    Logger.beginTrace('NetworkSecurity.utils.isPositiveNumber', 1);
    // NaN and infinity are rejected by the finite test first.
    const result: boolean = Number.isFinite(value) && value > 0;
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.isPositiveNumber', 1);
    return result;
  }
}
