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

import { describe, it, expect } from '@ohos/hypium';

const MAX_LENGTH: number = 256;

const ELLIPSIS: string = '...';

const PAD_CHAR: string = ' ';

const SEPARATOR: string = ',';

interface TruncateResult {
  value: string;
  truncated: boolean;
}

// Common string operations used across the issue reporter
class StringUtil {
  public static empty(): string {
    return '';
  }

  public static trim(value: string): string {
    return value.trim();
  }

  public static isBlank(value: string): boolean {
    return StringUtil.trim(value).length === 0;
  }

  public static truncate(value: string, maxLength: number): TruncateResult {
    if (maxLength <= 0) {
      return { value: '', truncated: value.length > 0 };
    }
    if (value.length <= maxLength) {
      return { value: value, truncated: false };
    }
    return { value: value.substring(0, maxLength), truncated: true };
  }

  public static truncateWithEllipsis(value: string, maxLength: number): string {
    if (maxLength <= ELLIPSIS.length) {
      return ELLIPSIS.substring(0, maxLength);
    }
    if (value.length <= maxLength) {
      return value;
    }
    return value.substring(0, maxLength - ELLIPSIS.length) + ELLIPSIS;
  }

  public static padLeft(value: string, width: number): string {
    if (value.length >= width) {
      return value;
    }
    let result: string = value;
    for (let i = value.length; i < width; i++) {
      result = PAD_CHAR + result;
    }
    return result;
  }

  public static join(values: string[]): string {
    return values.join(SEPARATOR);
  }

  public static split(value: string): string[] {
    return value.length === 0 ? [] : value.split(SEPARATOR);
  }

  public static countOccurrences(value: string, fragment: string): number {
    if (fragment.length === 0) {
      return 0;
    }
    return value.split(fragment).length - 1;
  }

  public static replaceAll(value: string, from: string, to: string): string {
    if (from.length === 0) {
      return value;
    }
    return value.split(from).join(to);
  }

  public static capitalize(value: string): string {
    if (value.length === 0) {
      return value;
    }
    return value.substring(0, 1).toUpperCase() + value.substring(1);
  }

  public static normalizeWhitespace(value: string): string {
    return StringUtil.trim(value).split('\n').join(' ').split('\r').join(' ')
      .split('\t').join(' ');
  }
}

// Validates user-facing string inputs
class StringValidator {
  public static isWithinLength(value: string, maxLength: number): boolean {
    return value.length <= maxLength;
  }

  public static hasOnlyPrintable(value: string): boolean {
    for (let i = 0; i < value.length; i++) {
      const code = value.charCodeAt(i);
      if ((code < 32 && code !== 9 && code !== 10) || code === 127) {
        return false;
      }
    }
    return true;
  }

  public static isAscii(value: string): boolean {
    for (let i = 0; i < value.length; i++) {
      if (value.charCodeAt(i) > 127) {
        return false;
      }
    }
    return true;
  }

  public static isIdentifier(value: string): boolean {
    const pattern: RegExp = new RegExp('^[A-Za-z_][A-Za-z0-9_]*$');
    return pattern.test(value);
  }

  public static isEmailLike(value: string): boolean {
    const atIndex = value.indexOf('@');
    return atIndex > 0 && atIndex < value.length - 1 && value.indexOf('.', atIndex) > atIndex + 1;
  }
}

// Aggregates string validation checks
class StringReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public count(): number {
    return this.checks.length;
  }

  public failures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function stringUtilValidationTest() {
  describe('StringUtilValidation_Test', () => {

    it('util_should_handle_blank_values', 0, () => {
      expect(StringUtil.empty()).assertEqual('');
      expect(StringUtil.trim('  abc  ')).assertEqual('abc');
      expect(StringUtil.isBlank('')).assertTrue();
      expect(StringUtil.isBlank('   ')).assertTrue();
      expect(StringUtil.isBlank('\n\t')).assertTrue();
      expect(StringUtil.isBlank('x')).assertFalse();
    });

    it('util_should_truncate_values', 0, () => {
      const short = StringUtil.truncate('abc', 5);
      expect(short.value).assertEqual('abc');
      expect(short.truncated).assertFalse();
      const long = StringUtil.truncate('abcdef', 3);
      expect(long.value).assertEqual('abc');
      expect(long.truncated).assertTrue();
      const zero = StringUtil.truncate('abc', 0);
      expect(zero.value).assertEqual('');
      expect(zero.truncated).assertTrue();
    });

    it('util_should_truncate_with_ellipsis', 0, () => {
      expect(StringUtil.truncateWithEllipsis('abc', 5)).assertEqual('abc');
      expect(StringUtil.truncateWithEllipsis('abcdef', 6)).assertEqual('abcdef');
      expect(StringUtil.truncateWithEllipsis('abcdef', 5)).assertEqual('ab...');
      expect(StringUtil.truncateWithEllipsis('abcdef', 3)).assertEqual('...');
      expect(StringUtil.truncateWithEllipsis('abcdef', 2)).assertEqual('..');
    });

    it('util_should_pad_values', 0, () => {
      expect(StringUtil.padLeft('7', 3)).assertEqual('  7');
      expect(StringUtil.padLeft('abc', 3)).assertEqual('abc');
      expect(StringUtil.padLeft('abcd', 2)).assertEqual('abcd');
      expect(StringUtil.padLeft('', 2)).assertEqual('  ');
    });

    it('util_should_join_and_split', 0, () => {
      expect(StringUtil.join(['a', 'b', 'c'])).assertEqual('a,b,c');
      expect(StringUtil.join([])).assertEqual('');
      expect(StringUtil.split('a,b,c')).assertDeepEquals(['a', 'b', 'c']);
      expect(StringUtil.split('')).assertDeepEquals([]);
      expect(StringUtil.split('single')).assertDeepEquals(['single']);
    });

    it('util_should_count_and_replace', 0, () => {
      expect(StringUtil.countOccurrences('a-b-c', '-')).assertEqual(2);
      expect(StringUtil.countOccurrences('abc', '-')).assertEqual(0);
      expect(StringUtil.countOccurrences('abc', '')).assertEqual(0);
      expect(StringUtil.replaceAll('a.b.c', '.', '/')).assertEqual('a/b/c');
      expect(StringUtil.replaceAll('abc', '', '/')).assertEqual('abc');
    });

    it('util_should_capitalize_and_normalize', 0, () => {
      expect(StringUtil.capitalize('abc')).assertEqual('Abc');
      expect(StringUtil.capitalize('')).assertEqual('');
      expect(StringUtil.capitalize('ABC')).assertEqual('ABC');
      expect(StringUtil.normalizeWhitespace('  a\nb\rc\td  ')).assertEqual('a b c d');
    });

    it('validator_should_check_length', 0, () => {
      expect(StringValidator.isWithinLength('abc', 3)).assertTrue();
      expect(StringValidator.isWithinLength('abcd', 3)).assertFalse();
      expect(StringValidator.isWithinLength('', 0)).assertTrue();
      expect(StringValidator.isWithinLength('a'.repeat(MAX_LENGTH), MAX_LENGTH)).assertTrue();
    });

    it('validator_should_check_printable_and_ascii', 0, () => {
      expect(StringValidator.hasOnlyPrintable('abc')).assertTrue();
      expect(StringValidator.hasOnlyPrintable('line\nbreak')).assertTrue();
      expect(StringValidator.hasOnlyPrintable('bell' + String.fromCharCode(7))).assertFalse();
      expect(StringValidator.hasOnlyPrintable('del' + String.fromCharCode(127))).assertFalse();
      expect(StringValidator.isAscii('abc')).assertTrue();
      expect(StringValidator.isAscii('中文')).assertFalse();
    });

    it('validator_should_check_identifier_and_email', 0, () => {
      expect(StringValidator.isIdentifier('issue_1')).assertTrue();
      expect(StringValidator.isIdentifier('_private')).assertTrue();
      expect(StringValidator.isIdentifier('1bad')).assertFalse();
      expect(StringValidator.isIdentifier('has space')).assertFalse();
      expect(StringValidator.isEmailLike('dev@example.com')).assertTrue();
      expect(StringValidator.isEmailLike('dev@')).assertFalse();
      expect(StringValidator.isEmailLike('@example.com')).assertFalse();
    });

    it('report_should_aggregate_checks', 0, () => {
      const report = new StringReport();
      report.check('trim', StringUtil.trim(' a ') === 'a');
      report.check('ascii', StringValidator.isAscii('abc'));
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      report.check('blank', !StringUtil.isBlank('x'));
      expect(report.isPassed()).assertTrue();
      report.check('force', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['force']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('string_flow_should_sanitize_description', 0, () => {
      const raw = '  screen   flickers\nwhen switching\rchannel  ';
      const normalized = StringUtil.normalizeWhitespace(raw);
      expect(StringUtil.isBlank(normalized)).assertFalse();
      expect(StringValidator.hasOnlyPrintable(normalized)).assertTrue();
      expect(StringUtil.truncate(normalized, MAX_LENGTH).truncated).assertFalse();
      expect(StringUtil.countOccurrences(normalized, ' ')).assertLarger(0);
      const shortened = StringUtil.truncateWithEllipsis(normalized, 20);
      expect(shortened.length).assertEqual(20);
      expect(shortened.endsWith(ELLIPSIS)).assertTrue();
    });

    it('string_constants_should_be_stable', 0, () => {
      expect(MAX_LENGTH).assertEqual(256);
      expect(ELLIPSIS).assertEqual('...');
      expect(PAD_CHAR).assertEqual(' ');
      expect(SEPARATOR).assertEqual(',');
    });
  });
}

