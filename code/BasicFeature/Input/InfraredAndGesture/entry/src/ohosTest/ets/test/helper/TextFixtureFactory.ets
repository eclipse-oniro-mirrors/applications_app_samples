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
 * Shared text fixture catalog for the string and validation suites.
 *
 * The catalog keeps every fixture next to its expectation so a suite only
 * compares instead of re-deriving the rule. Fixtures cover the legal input,
 * the boundary input and the rejected input of every regular expression used
 * by ValidateUtils.
 */

/** One boolean expectation over a string input. */
export interface FlagCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Input text handed to the predicate. */
  value: string;
  /** Expected predicate result. */
  expected: boolean;
}

/** One pair comparison expectation. */
export interface PairCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Left operand of the comparison. */
  first: string;
  /** Right operand of the comparison. */
  second: string;
  /** Expected comparison result. */
  expected: boolean;
}

/** One length range expectation, including invalid bound variants. */
export interface LengthRangeCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Input text probed by isLengthInRange. */
  value: string;
  /** Lower bound handed to isLengthInRange. */
  min: number;
  /** Upper bound handed to isLengthInRange. */
  max: number;
  /** Expected probe result. */
  expected: boolean;
  /** True when the bounds themselves are invalid. */
  invalidBounds: boolean;
}

/** One placeholder formatting expectation. */
export interface FormatCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Template text containing {0}, {1} and so on. */
  template: string;
  /** Replacement arguments in placeholder order. */
  args: string[];
  /** Expected formatted text. */
  expected: string;
}

/** One truncation expectation. */
export interface TruncateCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Input text handed to truncate. */
  value: string;
  /** Maximum length handed to truncate. */
  maxLength: number;
  /** Expected truncated text. */
  expected: string;
  /** True when the maximum length is not positive. */
  invalidLimit: boolean;
}

/** One capitalization expectation. */
export interface CapitalizeCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Input text handed to capitalize. */
  value: string;
  /** Expected capitalized text. */
  expected: string;
}

/** One string join expectation. */
export interface JoinCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Separator placed between two kept fragments. */
  separator: string;
  /** Fragments handed to join; empty fragments must be dropped. */
  parts: string[];
  /** Expected joined text. */
  expected: string;
}

/**
 * Static catalog of text expectations.
 * All methods are pure and return a freshly built array on every call.
 */
export class TextFixtureFactory {
  /**
   * Emptiness fixtures. Only a zero length text counts as empty, a single
   * space does not.
   */
  public static emptyCases(): FlagCase[] {
    return [
      { label: 'plain', value: 'room-a', expected: false },
      { label: 'single-char', value: 'x', expected: false },
      { label: 'empty', value: '', expected: true },
      { label: 'single-space', value: ' ', expected: false },
      { label: 'single-tab', value: '\t', expected: false },
      { label: 'single-newline', value: '\n', expected: false },
      { label: 'two-spaces', value: '  ', expected: false },
      { label: 'numeric-text', value: '0', expected: false },
      { label: 'cjk-text', value: '投影仪', expected: false }
    ];
  }

  /**
   * Blankness fixtures. Whitespace only texts are blank, any visible
   * character makes the text non blank.
   */
  public static blankCases(): FlagCase[] {
    return [
      { label: 'plain', value: 'room-a', expected: false },
      { label: 'padded', value: ' room ', expected: false },
      { label: 'padded-tab', value: '\troom\t', expected: false },
      { label: 'empty', value: '', expected: true },
      { label: 'single-space', value: ' ', expected: true },
      { label: 'single-tab', value: '\t', expected: true },
      { label: 'single-newline', value: '\n', expected: true },
      { label: 'single-carriage-return', value: '\r', expected: true },
      { label: 'mixed-whitespace', value: ' \t\n\r ', expected: true },
      { label: 'many-spaces', value: '        ', expected: true },
      { label: 'zero-char', value: '0', expected: false },
      { label: 'cjk-text', value: '灯光', expected: false }
    ];
  }

  /**
   * ASCII digit fixtures used by isNumeric. Signs, decimal points, spaces and
   * full width digits must all be rejected.
   */
  public static numericTextCases(): FlagCase[] {
    return [
      { label: 'zero', value: '0', expected: true },
      { label: 'single', value: '7', expected: true },
      { label: 'multi', value: '12345', expected: true },
      { label: 'leading-zeros', value: '000123', expected: true },
      { label: 'long', value: '12345678901234567890', expected: true },
      { label: 'empty', value: '', expected: false },
      { label: 'letters', value: 'abc', expected: false },
      { label: 'mixed', value: '12a', expected: false },
      { label: 'decimal', value: '1.5', expected: false },
      { label: 'negative', value: '-1', expected: false },
      { label: 'explicit-positive', value: '+1', expected: false },
      { label: 'leading-space', value: ' 1', expected: false },
      { label: 'trailing-space', value: '1 ', expected: false },
      { label: 'full-width', value: '１２３', expected: false },
      { label: 'underscore', value: '1_0', expected: false }
    ];
  }

  /**
   * E-mail fixtures for ValidateUtils.isEmail.
   */
  public static emailCases(): FlagCase[] {
    return [
      { label: 'plain', value: 'user@example.com', expected: true },
      { label: 'dotted-local', value: 'user.name@example.com', expected: true },
      { label: 'underscore-local', value: 'user_name@example.com', expected: true },
      { label: 'hyphen-local', value: 'user-name@example.com', expected: true },
      { label: 'plus-local', value: 'user+tag@example.com', expected: true },
      { label: 'percent-local', value: 'user%tag@example.com', expected: true },
      { label: 'subdomain', value: 'a.b@sub.example.co', expected: true },
      { label: 'upper-case', value: 'USER@EXAMPLE.COM', expected: true },
      { label: 'digits', value: 'user123@example123.com', expected: true },
      { label: 'empty', value: '', expected: false },
      { label: 'no-at', value: 'user.example.com', expected: false },
      { label: 'no-domain', value: 'user@', expected: false },
      { label: 'no-local', value: '@example.com', expected: false },
      { label: 'double-at', value: 'user@@example.com', expected: false },
      { label: 'inner-space', value: 'user name@example.com', expected: false },
      { label: 'short-tld', value: 'user@example.c', expected: false },
      { label: 'numeric-tld', value: 'user@127.0.0.1', expected: false },
      { label: 'trailing-dot', value: 'user@example.com.', expected: false }
    ];
  }

  /**
   * Mainland China mobile number fixtures for ValidateUtils.isPhoneCN.
   */
  public static phoneCases(): FlagCase[] {
    return [
      { label: 'mobile-13', value: '13012345678', expected: true },
      { label: 'mobile-15', value: '15812345678', expected: true },
      { label: 'mobile-17', value: '17612345678', expected: true },
      { label: 'mobile-19', value: '19912345678', expected: true },
      { label: 'empty', value: '', expected: false },
      { label: 'short', value: '1381234567', expected: false },
      { label: 'long', value: '138123456789', expected: false },
      { label: 'bad-second-digit', value: '12812345678', expected: false },
      { label: 'bad-prefix', value: '23812345678', expected: false },
      { label: 'letters', value: '138abcd5678', expected: false },
      { label: 'spaced', value: '138 1234 5678', expected: false },
      { label: 'dashed', value: '138-1234-5678', expected: false },
      { label: 'plus-prefix', value: '+8613812345678', expected: false }
    ];
  }

  /**
   * URL fixtures for ValidateUtils.isUrl. Only http and https are accepted.
   */
  public static urlCases(): FlagCase[] {
    return [
      { label: 'http-simple', value: 'http://example.com', expected: true },
      { label: 'https-simple', value: 'https://example.com', expected: true },
      { label: 'https-path', value: 'https://example.com/path', expected: true },
      { label: 'https-query', value: 'https://example.com/path?q=1', expected: true },
      { label: 'https-port', value: 'https://example.com:8080', expected: true },
      { label: 'https-port-path', value: 'https://a.b:8080/x', expected: true },
      { label: 'https-trailing-slash', value: 'http://example.com/', expected: true },
      { label: 'ip-host', value: 'http://127.0.0.1:8080/health', expected: true },
      { label: 'empty', value: '', expected: false },
      { label: 'no-scheme', value: 'example.com', expected: false },
      { label: 'ftp', value: 'ftp://example.com', expected: false },
      { label: 'file', value: 'file:///tmp/a.txt', expected: false },
      { label: 'scheme-only', value: 'http://', expected: false },
      { label: 'space-inside', value: 'http://exa mple.com', expected: false },
      { label: 'upper-scheme', value: 'HTTP://example.com', expected: false },
      { label: 'short-port', value: 'http://example.com:8', expected: false },
      { label: 'long-port', value: 'http://example.com:123456', expected: false }
    ];
  }

  /**
   * IPv4 fixtures for ValidateUtils.isIpv4.
   */
  public static ipv4Cases(): FlagCase[] {
    return [
      { label: 'all-zero', value: '0.0.0.0', expected: true },
      { label: 'all-max', value: '255.255.255.255', expected: true },
      { label: 'private', value: '192.168.1.1', expected: true },
      { label: 'low', value: '1.2.3.4', expected: true },
      { label: 'mixed', value: '10.0.0.254', expected: true },
      { label: 'empty', value: '', expected: false },
      { label: 'octet-overflow', value: '256.1.1.1', expected: false },
      { label: 'octet-overflow-last', value: '1.1.1.256', expected: false },
      { label: 'three-octets', value: '1.2.3', expected: false },
      { label: 'five-octets', value: '1.2.3.4.5', expected: false },
      { label: 'leading-zero', value: '01.2.3.4', expected: false },
      { label: 'trailing-zero', value: '1.2.3.04', expected: false },
      { label: 'letters', value: 'a.b.c.d', expected: false },
      { label: 'double-dot', value: '1..2.3', expected: false },
      { label: 'spaced', value: '1.2.3.4 ', expected: false },
      { label: 'negative', value: '-1.2.3.4', expected: false }
    ];
  }

  /**
   * Positive integer fixtures for ValidateUtils.isPositiveInteger.
   * The production code parses with parseInt, so a decimal text such as '1.5'
   * yields the integer one and is accepted.
   */
  public static positiveIntCases(): FlagCase[] {
    return [
      { label: 'one', value: '1', expected: true },
      { label: 'forty-two', value: '42', expected: true },
      { label: 'leading-zeros', value: '007', expected: true },
      { label: 'padded', value: ' 12', expected: true },
      { label: 'explicit-positive', value: '+5', expected: true },
      { label: 'decimal-text', value: '1.5', expected: true },
      { label: 'large', value: '123456789', expected: true },
      { label: 'empty', value: '', expected: false },
      { label: 'zero', value: '0', expected: false },
      { label: 'negative', value: '-1', expected: false },
      { label: 'letters', value: 'abc', expected: false },
      { label: 'mixed', value: 'room1', expected: false },
      { label: 'dot-only', value: '.', expected: false },
      { label: 'word-nan', value: 'NaN', expected: false }
    ];
  }

  /**
   * Length range fixtures, including the invalid bound variants that must
   * fail without touching the value.
   */
  public static lengthCases(): LengthRangeCase[] {
    return [
      { label: 'at-min', value: 'ab', min: 2, max: 5, expected: true, invalidBounds: false },
      { label: 'at-max', value: 'abcde', min: 2, max: 5, expected: true, invalidBounds: false },
      { label: 'inside', value: 'abc', min: 2, max: 5, expected: true, invalidBounds: false },
      { label: 'below-min', value: 'a', min: 2, max: 5, expected: false, invalidBounds: false },
      { label: 'above-max', value: 'abcdef', min: 2, max: 5, expected: false, invalidBounds: false },
      { label: 'empty-inside', value: '', min: 0, max: 5, expected: true, invalidBounds: false },
      { label: 'empty-below', value: '', min: 1, max: 5, expected: false, invalidBounds: false },
      { label: 'zero-both', value: '', min: 0, max: 0, expected: true, invalidBounds: false },
      { label: 'degenerate-hit', value: 'a', min: 1, max: 1, expected: true, invalidBounds: false },
      { label: 'negative-min', value: 'abc', min: -1, max: 5, expected: false, invalidBounds: true },
      { label: 'max-below-min', value: 'abc', min: 5, max: 2, expected: false, invalidBounds: true },
      { label: 'negative-both', value: 'abc', min: -5, max: -1, expected: false, invalidBounds: true }
    ];
  }

  /**
   * Placeholder formatting fixtures.
   */
  public static formatCases(): FormatCase[] {
    return [
      { label: 'two-holes', template: '{0}-{1}', args: ['a', 'b'], expected: 'a-b' },
      { label: 'reversed', template: '{1}{0}', args: ['a', 'b'], expected: 'ba' },
      { label: 'repeated', template: '{0}{0}', args: ['x'], expected: 'xx' },
      { label: 'no-hole', template: 'room', args: ['a'], expected: 'room' },
      { label: 'no-args', template: 'room', args: [], expected: 'room' },
      { label: 'missing-arg', template: '{2}', args: ['a', 'b'], expected: '{2}' },
      { label: 'partial-args', template: '{0}-{1}', args: ['a'], expected: 'a-{1}' },
      { label: 'empty-template', template: '', args: ['a'], expected: '' },
      { label: 'empty-arg', template: '{0}', args: [''], expected: '' },
      { label: 'space-arg', template: '{0}', args: [' '], expected: ' ' },
      { label: 'three-holes', template: '{0}/{1}/{2}', args: ['x', 'y', 'z'], expected: 'x/y/z' },
      { label: 'cjk-args', template: '{0}的{1}', args: ['会议室', '灯'], expected: '会议室的灯' }
    ];
  }

  /**
   * Truncation fixtures. A non-positive limit returns an empty string; the
   * suffix is appended only when the input is actually shortened.
   */
  public static truncateCases(): TruncateCase[] {
    return [
      { label: 'shorter-than-limit', value: 'abc', maxLength: 5, expected: 'abc', invalidLimit: false },
      { label: 'equal-to-limit', value: 'abc', maxLength: 3, expected: 'abc', invalidLimit: false },
      { label: 'one-over-limit', value: 'abcd', maxLength: 3, expected: 'abc...', invalidLimit: false },
      { label: 'far-over-limit', value: 'abcdefgh', maxLength: 2, expected: 'ab...', invalidLimit: false },
      { label: 'single-char-limit', value: 'abcdef', maxLength: 1, expected: 'a...', invalidLimit: false },
      { label: 'empty-value', value: '', maxLength: 3, expected: '', invalidLimit: false },
      { label: 'empty-value-zero-limit', value: '', maxLength: 0, expected: '', invalidLimit: true },
      { label: 'zero-limit', value: 'abcdef', maxLength: 0, expected: '', invalidLimit: true },
      { label: 'negative-limit', value: 'abcdef', maxLength: -3, expected: '', invalidLimit: true },
      { label: 'large-limit', value: 'abcdef', maxLength: 1000, expected: 'abcdef', invalidLimit: false }
    ];
  }

  /**
   * Capitalization fixtures.
   */
  public static capitalizeCases(): CapitalizeCase[] {
    return [
      { label: 'lower', value: 'abc', expected: 'Abc' },
      { label: 'already-upper', value: 'ABC', expected: 'ABC' },
      { label: 'single', value: 'a', expected: 'A' },
      { label: 'single-upper', value: 'A', expected: 'A' },
      { label: 'digit-first', value: '1abc', expected: '1abc' },
      { label: 'empty', value: '', expected: '' },
      { label: 'leading-space', value: ' abc', expected: ' abc' },
      { label: 'cjk', value: '投影仪', expected: '投影仪' },
      { label: 'mixed', value: 'roomKey', expected: 'RoomKey' }
    ];
  }

  /**
   * Looks up a single capitalization case by label.
   * @returns the matching case or null when the label is unknown.
   */
  public static capitalizeCase(label: string): CapitalizeCase | null {
    for (const item of TextFixtureFactory.capitalizeCases()) {
      if (item.label === label) {
        return item;
      }
    }
    return null;
  }

  /**
   * Join fixtures. Empty fragments must be dropped, separators must not be
   * duplicated.
   */
  public static joinCases(): JoinCase[] {
    return [
      { label: 'three-parts', separator: '-', parts: ['a', 'b', 'c'], expected: 'a-b-c' },
      { label: 'empty-separator', separator: '', parts: ['a', 'b'], expected: 'ab' },
      { label: 'skip-middle-empty', separator: ',', parts: ['a', '', 'b'], expected: 'a,b' },
      { label: 'skip-leading-empty', separator: ',', parts: ['', 'a'], expected: 'a' },
      { label: 'skip-trailing-empty', separator: ',', parts: ['a', ''], expected: 'a' },
      { label: 'all-empty', separator: '/', parts: ['', '', ''], expected: '' },
      { label: 'no-parts', separator: '/', parts: [], expected: '' },
      { label: 'single-part', separator: '/', parts: ['a'], expected: 'a' },
      { label: 'multi-char-separator', separator: '::', parts: ['a', 'b'], expected: 'a::b' },
      { label: 'space-parts', separator: ' ', parts: ['a', 'b'], expected: 'a b' }
    ];
  }

  /**
   * Case-sensitive equality fixtures.
   */
  public static equalsPairs(): PairCase[] {
    return [
      { label: 'identical', first: 'room-a', second: 'room-a', expected: true },
      { label: 'both-empty', first: '', second: '', expected: true },
      { label: 'different', first: 'room-a', second: 'room-b', expected: false },
      { label: 'case-mismatch', first: 'Room', second: 'room', expected: false },
      { label: 'space-mismatch', first: 'room', second: ' room', expected: false },
      { label: 'empty-vs-text', first: '', second: 'a', expected: false },
      { label: 'cjk-identical', first: '会议室', second: '会议室', expected: true }
    ];
  }

  /**
   * Case-insensitive equality fixtures.
   */
  public static ignoreCasePairs(): PairCase[] {
    return [
      { label: 'case-insensitive', first: 'Room', second: 'ROOM', expected: true },
      { label: 'identical', first: 'room', second: 'room', expected: true },
      { label: 'both-empty', first: '', second: '', expected: true },
      { label: 'different', first: 'room', second: 'hall', expected: false },
      { label: 'space-mismatch', first: 'room', second: ' room', expected: false },
      { label: 'empty-vs-text', first: '', second: 'a', expected: false },
      { label: 'mixed-case-cjk', first: 'Room一', second: 'rOOM一', expected: true }
    ];
  }

  /**
   * Looks up a single flag case by label.
   * @returns the matching case or null when the label is unknown.
   */
  public static flagCase(cases: FlagCase[], label: string): FlagCase | null {
    for (const item of cases) {
      if (item.label === label) {
        return item;
      }
    }
    return null;
  }

  /**
   * Returns only the flag cases whose expected value is true.
   */
  public static acceptedCases(cases: FlagCase[]): FlagCase[] {
    const result: FlagCase[] = [];
    for (const item of cases) {
      if (item.expected) {
        result.push(item);
      }
    }
    return result;
  }

  /**
   * Returns only the flag cases whose expected value is false.
   */
  public static rejectedCases(cases: FlagCase[]): FlagCase[] {
    const result: FlagCase[] = [];
    for (const item of cases) {
      if (!item.expected) {
        result.push(item);
      }
    }
    return result;
  }
}
