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
 * Shared numeric fixture catalog for the logic suites.
 *
 * Every entry stores the raw input text or number together with the
 * expectation that the production code must produce. Suites therefore only
 * compare, they never recompute an expectation with the same algorithm the
 * class under test uses, which keeps the oracle independent.
 *
 * The catalog is intentionally data-only: it has no dependency on hilog,
 * hypium or any library under test, so it can be reused by every suite.
 */

/** One integer parsing expectation. */
export interface IntParseCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Raw input text handed to the parser. */
  text: string;
  /** Value the parser must return when the input is parseable. */
  expected: number;
  /** True when the input is expected to parse successfully. */
  valid: boolean;
}

/** One floating point parsing expectation. */
export interface FloatParseCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Raw input text handed to the parser. */
  text: string;
  /** Value the parser must return when the input is parseable. */
  expected: number;
  /** True when the input is expected to parse successfully. */
  valid: boolean;
}

/** One finite number expectation. */
export interface FiniteCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Value probed by isFiniteNumber. */
  value: number;
  /** Expected result of the probe. */
  expected: boolean;
}

/** One clamp expectation, including the swapped bound variants. */
export interface ClampCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Value handed to clamp. */
  value: number;
  /** Lower bound handed to clamp. */
  min: number;
  /** Upper bound handed to clamp. */
  max: number;
  /** Value clamp must return. */
  expected: number;
  /** True when the bounds are swapped, which the class normalizes. */
  swapped: boolean;
}

/** One inclusive range expectation. */
export interface RangeCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Value probed by isInRange. */
  value: number;
  /** Lower bound of the probe. */
  min: number;
  /** Upper bound of the probe. */
  max: number;
  /** Expected result of the probe. */
  expected: boolean;
}

/** One fixed fraction expectation. */
export interface FixedCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Value handed to toFixedString. */
  value: number;
  /** Requested fraction digits handed to toFixedString. */
  digits: number;
  /** Exact string toFixedString must return. */
  expected: string;
  /** True when the digit count is out of the supported range. */
  clampedDigits: boolean;
}

/** One human readable file size expectation. */
export interface SizeCase {
  /** Stable label used in assertion messages and log lines. */
  label: string;
  /** Byte count handed to formatFileSize. */
  bytes: number;
  /** Exact string formatFileSize must return. */
  expected: string;
  /** True when the byte count is negative or not finite. */
  invalidBytes: boolean;
}

/** Bytes of one kilobyte, mirrors the production constant. */
const BYTES_PER_KB: number = 1024;
/** Bytes of one megabyte. */
const BYTES_PER_MB: number = BYTES_PER_KB * BYTES_PER_KB;
/** Bytes of one gigabyte. */
const BYTES_PER_GB: number = BYTES_PER_MB * BYTES_PER_KB;
/** Bytes of one terabyte. */
const BYTES_PER_TB: number = BYTES_PER_GB * BYTES_PER_KB;
/** Bytes of one petabyte, beyond the supported unit range. */
const BYTES_PER_PB: number = BYTES_PER_TB * BYTES_PER_KB;
/** Maximum fraction digit count accepted by toFixedString. */
const MAX_FRACTION_DIGITS: number = 100;

/**
 * Builds the exact expected output of toFixedString(1, 100): the digit one,
 * a decimal separator and exactly one hundred zero characters.
 * Building the text avoids a fragile hand written literal.
 */
function buildMaxFractionText(): string {
  let text: string = '1.';
  for (let i: number = 0; i < MAX_FRACTION_DIGITS; i++) {
    text += '0';
  }
  return text;
}

/**
 * Static catalog of numeric expectations.
 * All methods are pure and return a freshly built array on every call so a
 * suite can mutate the result without affecting other suites.
 */
export class NumericCaseCatalog {
  /**
   * Integer parsing expectations. Covers ASCII digits, signs, whitespace,
   * decimal prefixes, exponent text, hex text and unparseable text.
   */
  public static intParseCases(): IntParseCase[] {
    return [
      { label: 'zero', text: '0', expected: 0, valid: true },
      { label: 'single-digit', text: '7', expected: 7, valid: true },
      { label: 'multi-digit', text: '12345', expected: 12345, valid: true },
      { label: 'leading-zeros', text: '000123', expected: 123, valid: true },
      { label: 'leading-space', text: ' 42', expected: 42, valid: true },
      { label: 'trailing-space', text: '42 ', expected: 42, valid: true },
      { label: 'both-spaces', text: '   42   ', expected: 42, valid: true },
      { label: 'leading-tab', text: '\t42', expected: 42, valid: true },
      { label: 'negative', text: '-7', expected: -7, valid: true },
      { label: 'explicit-positive', text: '+9', expected: 9, valid: true },
      { label: 'trailing-letters', text: '12abc', expected: 12, valid: true },
      { label: 'trailing-dot', text: '12.', expected: 12, valid: true },
      { label: 'decimal-text', text: '3.9', expected: 3, valid: true },
      { label: 'exponent-text', text: '1e3', expected: 1, valid: true },
      { label: 'hex-text', text: '0x1f', expected: 0, valid: true },
      { label: 'underscore-text', text: '1_000', expected: 1, valid: true },
      { label: 'beyond-int32', text: '2147483648', expected: 2147483648, valid: true },
      { label: 'beyond-safe-int', text: '9007199254740993', expected: 9007199254740992, valid: true },
      { label: 'hyphen-only', text: '-', expected: 0, valid: false },
      { label: 'sign-then-space', text: '- 5', expected: 0, valid: false },
      { label: 'letters', text: 'abc', expected: 0, valid: false },
      { label: 'mixed-letters', text: 'room42', expected: 0, valid: false },
      { label: 'word-nan', text: 'NaN', expected: 0, valid: false },
      { label: 'word-infinity', text: 'Infinity', expected: 0, valid: false },
      { label: 'dot-only', text: '.', expected: 0, valid: false },
      { label: 'empty', text: '', expected: 0, valid: false },
      { label: 'spaces-only', text: '   ', expected: 0, valid: false }
    ];
  }

  /**
   * Floating point parsing expectations. Covers plain decimals, exponent
   * notation, leading dot, trailing junk and infinite literals.
   */
  public static floatParseCases(): FloatParseCase[] {
    return [
      { label: 'zero', text: '0', expected: 0, valid: true },
      { label: 'integer-text', text: '42', expected: 42, valid: true },
      { label: 'simple-decimal', text: '1.5', expected: 1.5, valid: true },
      { label: 'negative-decimal', text: '-0.5', expected: -0.5, valid: true },
      { label: 'leading-dot', text: '.5', expected: 0.5, valid: true },
      { label: 'trailing-dot', text: '5.', expected: 5, valid: true },
      { label: 'padded', text: '  2.25  ', expected: 2.25, valid: true },
      { label: 'exponent', text: '1e3', expected: 1000, valid: true },
      { label: 'negative-exponent', text: '2.5e-2', expected: 0.025, valid: true },
      { label: 'trailing-letters', text: '1.5abc', expected: 1.5, valid: true },
      { label: 'second-dot', text: '1.2.3', expected: 1.2, valid: true },
      { label: 'underscore-text', text: '1_000.5', expected: 1, valid: true },
      { label: 'hex-text', text: '0x10', expected: 0, valid: true },
      { label: 'tiny', text: '0.000001', expected: 0.000001, valid: true },
      { label: 'infinite-positive', text: 'Infinity', expected: Infinity, valid: true },
      { label: 'infinite-negative', text: '-Infinity', expected: -Infinity, valid: true },
      { label: 'letters', text: 'abc', expected: 0, valid: false },
      { label: 'word-nan', text: 'NaN', expected: 0, valid: false },
      { label: 'dot-only', text: '.', expected: 0, valid: false },
      { label: 'empty', text: '', expected: 0, valid: false },
      { label: 'spaces-only', text: ' \t ', expected: 0, valid: false }
    ];
  }

  /**
   * Finite number expectations. NaN and both infinities are not finite.
   */
  public static finiteCases(): FiniteCase[] {
    return [
      { label: 'zero', value: 0, expected: true },
      { label: 'negative-zero', value: -0, expected: true },
      { label: 'one', value: 1, expected: true },
      { label: 'minus-one', value: -1, expected: true },
      { label: 'half', value: 0.5, expected: true },
      { label: 'small-negative', value: -0.125, expected: true },
      { label: 'max-value', value: Number.MAX_VALUE, expected: true },
      { label: 'min-value', value: Number.MIN_VALUE, expected: true },
      { label: 'max-safe-integer', value: Number.MAX_SAFE_INTEGER, expected: true },
      { label: 'min-safe-integer', value: Number.MIN_SAFE_INTEGER, expected: true },
      { label: 'nan', value: NaN, expected: false },
      { label: 'positive-infinity', value: Infinity, expected: false },
      { label: 'negative-infinity', value: -Infinity, expected: false },
      { label: 'infinity-minus-infinity', value: Infinity - Infinity, expected: false },
      { label: 'zero-times-infinity', value: 0 * Infinity, expected: false }
    ];
  }

  /**
   * Clamp expectations, including values outside the bounds and the
   * swapped-bound branch that the class normalizes before clamping.
   */
  public static clampCases(): ClampCase[] {
    return [
      { label: 'inside', value: 5, min: 0, max: 10, expected: 5, swapped: false },
      { label: 'at-min', value: 0, min: 0, max: 10, expected: 0, swapped: false },
      { label: 'at-max', value: 10, min: 0, max: 10, expected: 10, swapped: false },
      { label: 'below-min', value: -3, min: 0, max: 10, expected: 0, swapped: false },
      { label: 'above-max', value: 99, min: 0, max: 10, expected: 10, swapped: false },
      { label: 'negative-range-inside', value: -5, min: -10, max: 0, expected: -5, swapped: false },
      { label: 'negative-range-below', value: -11, min: -10, max: 0, expected: -10, swapped: false },
      { label: 'negative-range-above', value: 1, min: -10, max: 0, expected: 0, swapped: false },
      { label: 'degenerate-point', value: 7, min: 3, max: 3, expected: 3, swapped: false },
      { label: 'degenerate-point-low', value: -7, min: 3, max: 3, expected: 3, swapped: false },
      { label: 'fraction-inside', value: 0.25, min: 0, max: 1, expected: 0.25, swapped: false },
      { label: 'fraction-below', value: -0.25, min: 0, max: 1, expected: 0, swapped: false },
      { label: 'fraction-above', value: 1.25, min: 0, max: 1, expected: 1, swapped: false },
      { label: 'large-span', value: 1500, min: 1000, max: 2000, expected: 1500, swapped: false },
      { label: 'large-span-below', value: 500, min: 1000, max: 2000, expected: 1000, swapped: false },
      { label: 'large-span-above', value: 2500, min: 1000, max: 2000, expected: 2000, swapped: false },
      { label: 'swapped-inside', value: 5, min: 10, max: 0, expected: 5, swapped: true },
      { label: 'swapped-below', value: -3, min: 10, max: 0, expected: 0, swapped: true },
      { label: 'swapped-above', value: 99, min: 10, max: 0, expected: 10, swapped: true },
      { label: 'swapped-point', value: 3, min: 3, max: 3, expected: 3, swapped: true },
      { label: 'swapped-fraction', value: 0.75, min: 1, max: 0, expected: 0.75, swapped: true }
    ];
  }

  /**
   * Inclusive range expectations. Both bounds must count as inside.
   */
  public static rangeCases(): RangeCase[] {
    return [
      { label: 'inside', value: 5, min: 0, max: 10, expected: true },
      { label: 'at-min', value: 0, min: 0, max: 10, expected: true },
      { label: 'at-max', value: 10, min: 0, max: 10, expected: true },
      { label: 'below-min', value: -1, min: 0, max: 10, expected: false },
      { label: 'above-max', value: 11, min: 0, max: 10, expected: false },
      { label: 'degenerate-hit', value: 4, min: 4, max: 4, expected: true },
      { label: 'degenerate-miss', value: 5, min: 4, max: 4, expected: false },
      { label: 'empty-range-low', value: 4, min: 10, max: 0, expected: false },
      { label: 'negative-range-inside', value: -4, min: -10, max: -1, expected: true },
      { label: 'negative-range-at-max', value: -1, min: -10, max: -1, expected: true },
      { label: 'negative-range-outside', value: 0, min: -10, max: -1, expected: false },
      { label: 'fraction-inside', value: 0.5, min: 0, max: 1, expected: true },
      { label: 'fraction-at-max', value: 1, min: 0, max: 1, expected: true },
      { label: 'fraction-outside', value: 1.5, min: 0, max: 1, expected: false },
      { label: 'wide-range-inside', value: 1000000, min: 0, max: 2000000, expected: true },
      { label: 'wide-range-outside', value: 2000001, min: 0, max: 2000000, expected: false },
      { label: 'nan-probe', value: NaN, min: 0, max: 10, expected: false },
      { label: 'infinity-probe', value: Infinity, min: 0, max: 10, expected: false }
    ];
  }

  /**
   * Fixed fraction expectations. Only exactly representable values are used
   * so the expectation is stable across engines.
   */
  public static fixedCases(): FixedCase[] {
    return [
      { label: 'zero-no-digits', value: 0, digits: 0, expected: '0', clampedDigits: false },
      { label: 'zero-two-digits', value: 0, digits: 2, expected: '0.00', clampedDigits: false },
      { label: 'half-two-digits', value: 0.5, digits: 2, expected: '0.50', clampedDigits: false },
      { label: 'one-and-half', value: 1.5, digits: 2, expected: '1.50', clampedDigits: false },
      { label: 'two-and-half', value: 2.5, digits: 2, expected: '2.50', clampedDigits: false },
      { label: 'three-decimals', value: 1.25, digits: 3, expected: '1.250', clampedDigits: false },
      { label: 'quarter', value: 0.75, digits: 2, expected: '0.75', clampedDigits: false },
      { label: 'negative-quarter', value: -0.75, digits: 2, expected: '-0.75', clampedDigits: false },
      { label: 'hundred-without-digits', value: 100, digits: 0, expected: '100', clampedDigits: false },
      { label: 'hundred-with-digits', value: 100, digits: 1, expected: '100.0', clampedDigits: false },
      { label: 'thousand', value: 1000, digits: 2, expected: '1000.00', clampedDigits: false },
      { label: 'rounds-up', value: 7.8, digits: 0, expected: '8', clampedDigits: false },
      { label: 'rounds-down', value: 2.4, digits: 0, expected: '2', clampedDigits: false },
      { label: 'negative-rounds-down', value: -2.4, digits: 0, expected: '-2', clampedDigits: false },
      { label: 'negative-digits', value: 7.8, digits: -1, expected: '8', clampedDigits: true },
      { label: 'nan-digits', value: 2.4, digits: NaN, expected: '2', clampedDigits: true },
      { label: 'infinite-digits', value: 2.4, digits: Infinity, expected: '2', clampedDigits: true },
      { label: 'hundred-digits', value: 1, digits: 100, expected: buildMaxFractionText(), clampedDigits: false },
      { label: 'over-limit-digits', value: 1, digits: 101, expected: buildMaxFractionText(), clampedDigits: true }
    ];
  }

  /**
   * Looks up a single fixed fraction case by label.
   * @returns the matching case or null when the label is unknown.
   */
  public static fixedCase(label: string): FixedCase | null {
    for (const item of NumericCaseCatalog.fixedCases()) {
      if (item.label === label) {
        return item;
      }
    }
    return null;
  }

  /**
   * File size formatting expectations. Includes exact unit boundaries, one
   * byte below a boundary and values beyond the supported unit range.
   */
  public static sizeCases(): SizeCase[] {
    return [
      { label: 'zero-byte', bytes: 0, expected: '0.00B', invalidBytes: false },
      { label: 'one-byte', bytes: 1, expected: '1.00B', invalidBytes: false },
      { label: 'hundred-bytes', bytes: 100, expected: '100.00B', invalidBytes: false },
      { label: 'last-byte', bytes: BYTES_PER_KB - 1, expected: '1023.00B', invalidBytes: false },
      { label: 'exactly-one-kb', bytes: BYTES_PER_KB, expected: '1.00KB', invalidBytes: false },
      { label: 'one-and-half-kb', bytes: BYTES_PER_KB + BYTES_PER_KB / 2, expected: '1.50KB', invalidBytes: false },
      { label: 'one-and-quarter-kb', bytes: BYTES_PER_KB + BYTES_PER_KB / 4, expected: '1.25KB', invalidBytes: false },
      { label: 'two-kb', bytes: BYTES_PER_KB * 2, expected: '2.00KB', invalidBytes: false },
      { label: 'byte-before-mb', bytes: BYTES_PER_MB - 1, expected: '1024.00KB', invalidBytes: false },
      { label: 'exactly-one-mb', bytes: BYTES_PER_MB, expected: '1.00MB', invalidBytes: false },
      { label: 'one-and-half-mb', bytes: BYTES_PER_MB + BYTES_PER_MB / 2, expected: '1.50MB', invalidBytes: false },
      { label: 'byte-before-gb', bytes: BYTES_PER_GB - 1, expected: '1024.00MB', invalidBytes: false },
      { label: 'exactly-one-gb', bytes: BYTES_PER_GB, expected: '1.00GB', invalidBytes: false },
      { label: 'byte-before-tb', bytes: BYTES_PER_TB - 1, expected: '1024.00GB', invalidBytes: false },
      { label: 'exactly-one-tb', bytes: BYTES_PER_TB, expected: '1.00TB', invalidBytes: false },
      { label: 'two-tb', bytes: BYTES_PER_TB * 2, expected: '2.00TB', invalidBytes: false },
      { label: 'beyond-tb-range', bytes: BYTES_PER_PB, expected: '1024.00TB', invalidBytes: false },
      { label: 'negative-byte', bytes: -1, expected: '0.00B', invalidBytes: true },
      { label: 'large-negative-byte', bytes: -BYTES_PER_MB, expected: '0.00B', invalidBytes: true },
      { label: 'nan-byte', bytes: NaN, expected: '0.00B', invalidBytes: true },
      { label: 'infinite-byte', bytes: Infinity, expected: '0.00B', invalidBytes: true },
      { label: 'negative-infinite-byte', bytes: -Infinity, expected: '0.00B', invalidBytes: true }
    ];
  }

  /**
   * Looks up a single integer case by label.
   * @returns the matching case or null when the label is unknown.
   */
  public static intCase(label: string): IntParseCase | null {
    for (const item of NumericCaseCatalog.intParseCases()) {
      if (item.label === label) {
        return item;
      }
    }
    return null;
  }

  /**
   * Looks up a single float case by label.
   * @returns the matching case or null when the label is unknown.
   */
  public static floatCase(label: string): FloatParseCase | null {
    for (const item of NumericCaseCatalog.floatParseCases()) {
      if (item.label === label) {
        return item;
      }
    }
    return null;
  }

  /**
   * Looks up a single clamp case by label.
   * @returns the matching case or null when the label is unknown.
   */
  public static clampCase(label: string): ClampCase | null {
    for (const item of NumericCaseCatalog.clampCases()) {
      if (item.label === label) {
        return item;
      }
    }
    return null;
  }

  /**
   * Looks up a single file size case by label.
   * @returns the matching case or null when the label is unknown.
   */
  public static sizeCase(label: string): SizeCase | null {
    for (const item of NumericCaseCatalog.sizeCases()) {
      if (item.label === label) {
        return item;
      }
    }
    return null;
  }

  /**
   * Returns only the valid integer cases, useful for compact loops.
   */
  public static validIntCases(): IntParseCase[] {
    const result: IntParseCase[] = [];
    for (const item of NumericCaseCatalog.intParseCases()) {
      if (item.valid) {
        result.push(item);
      }
    }
    return result;
  }

  /**
   * Returns only the invalid integer cases, useful for fallback checks.
   */
  public static invalidIntCases(): IntParseCase[] {
    const result: IntParseCase[] = [];
    for (const item of NumericCaseCatalog.intParseCases()) {
      if (!item.valid) {
        result.push(item);
      }
    }
    return result;
  }

  /**
   * Returns only the clamp cases whose bounds are swapped.
   */
  public static swappedClampCases(): ClampCase[] {
    const result: ClampCase[] = [];
    for (const item of NumericCaseCatalog.clampCases()) {
      if (item.swapped) {
        result.push(item);
      }
    }
    return result;
  }
}
