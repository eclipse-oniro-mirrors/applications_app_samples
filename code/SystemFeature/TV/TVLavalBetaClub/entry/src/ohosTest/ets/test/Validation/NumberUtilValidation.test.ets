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

const MAX_INT: number = 2147483647;

const MIN_SAFE_PERCENT: number = 0;

const MAX_SAFE_PERCENT: number = 100;

const DISPLAY_DECIMALS: number = 2;

// Numeric helpers used by layout and progress calculations
class NumberUtil {
  public static clamp(value: number, min: number, max: number): number {
    if (Number.isNaN(value)) {
      return min;
    }
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }

  public static round(value: number, decimals: number): number {
    if (decimals < 0) {
      return Math.round(value);
    }
    const factor = Math.pow(10, decimals);
    return Math.round(value * factor) / factor;
  }

  public static percent(part: number, total: number): number {
    if (total <= 0) {
      return 0;
    }
    return NumberUtil.clamp(part * 100 / total, MIN_SAFE_PERCENT, MAX_SAFE_PERCENT);
  }

  public static toDisplay(value: number): string {
    return NumberUtil.round(value, DISPLAY_DECIMALS).toString();
  }

  public static absDiff(first: number, second: number): number {
    return Math.abs(first - second);
  }

  public static isClose(first: number, second: number, tolerance: number): boolean {
    return NumberUtil.absDiff(first, second) <= Math.abs(tolerance);
  }

  public static safeDivide(numerator: number, denominator: number): number {
    return denominator === 0 ? 0 : numerator / denominator;
  }

  public static sum(values: number[]): number {
    let total: number = 0;
    for (let i = 0; i < values.length; i++) {
      total += values[i];
    }
    return total;
  }

  public static average(values: number[]): number {
    return values.length === 0 ? 0 : NumberUtil.sum(values) / values.length;
  }
}

// Validates numeric inputs from forms and config
class NumberValidator {
  public static isInteger(value: number): boolean {
    return Number.isFinite(value) && Math.floor(value) === value;
  }

  public static isWithin(value: number, min: number, max: number): boolean {
    return Number.isFinite(value) && value >= min && value <= max;
  }

  public static isPositive(value: number): boolean {
    return Number.isFinite(value) && value > 0;
  }

  public static isInt32(value: number): boolean {
    return NumberValidator.isInteger(value) && value >= -MAX_INT - 1 && value <= MAX_INT;
  }

  public static isPercent(value: number): boolean {
    return NumberValidator.isWithin(value, MIN_SAFE_PERCENT, MAX_SAFE_PERCENT);
  }

  public static isValidPageIndex(value: number): boolean {
    return NumberValidator.isInteger(value) && value >= 0;
  }

  public static isValidPageSize(value: number): boolean {
    return NumberValidator.isInteger(value) && value >= 1 && value <= 50;
  }
}

// Aggregates numeric validation checks
class NumberReport {
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

export default function numberUtilValidationTest() {
  describe('NumberUtilValidation_Test', () => {

    it('util_should_clamp_values', 0, () => {
      expect(NumberUtil.clamp(-5, 0, 10)).assertEqual(0);
      expect(NumberUtil.clamp(15, 0, 10)).assertEqual(10);
      expect(NumberUtil.clamp(5, 0, 10)).assertEqual(5);
      expect(NumberUtil.clamp(Number.NaN, 0, 10)).assertEqual(0);
      expect(NumberUtil.clamp(0, 0, 0)).assertEqual(0);
    });

    it('util_should_round_to_decimals', 0, () => {
      expect(NumberUtil.round(1.2345, 2)).assertEqual(1.23);
      expect(NumberUtil.round(1.2355, 2)).assertEqual(1.24);
      expect(NumberUtil.round(1.5, 0)).assertEqual(2);
      expect(NumberUtil.round(1.5, -1)).assertEqual(2);
      expect(NumberUtil.toDisplay(2)).assertEqual('2');
      expect(NumberUtil.toDisplay(1.234)).assertEqual('1.23');
    });

    it('util_should_compute_percent', 0, () => {
      expect(NumberUtil.percent(50, 100)).assertEqual(50);
      expect(NumberUtil.percent(0, 100)).assertEqual(0);
      expect(NumberUtil.percent(100, 100)).assertEqual(100);
      expect(NumberUtil.percent(150, 100)).assertEqual(100);
      expect(NumberUtil.percent(-10, 100)).assertEqual(0);
      expect(NumberUtil.percent(10, 0)).assertEqual(0);
    });

    it('util_should_compare_with_tolerance', 0, () => {
      expect(NumberUtil.absDiff(3, 5)).assertEqual(2);
      expect(NumberUtil.isClose(10, 10.5, 0.5)).assertTrue();
      expect(NumberUtil.isClose(10, 10.51, 0.5)).assertFalse();
      expect(NumberUtil.isClose(10, 9.5, 0.5)).assertTrue();
      expect(NumberUtil.isClose(10, 10, 0)).assertTrue();
    });

    it('util_should_divide_safely', 0, () => {
      expect(NumberUtil.safeDivide(10, 2)).assertEqual(5);
      expect(NumberUtil.safeDivide(0, 2)).assertEqual(0);
      expect(NumberUtil.safeDivide(10, 0)).assertEqual(0);
      expect(NumberUtil.safeDivide(-10, 2)).assertEqual(-5);
    });

    it('util_should_aggregate_values', 0, () => {
      expect(NumberUtil.sum([1, 2, 3])).assertEqual(6);
      expect(NumberUtil.sum([])).assertEqual(0);
      expect(NumberUtil.average([2, 4, 6])).assertEqual(4);
      expect(NumberUtil.average([])).assertEqual(0);
      expect(NumberUtil.average([1, 2])).assertEqual(1.5);
    });

    it('validator_should_check_integers', 0, () => {
      expect(NumberValidator.isInteger(0)).assertTrue();
      expect(NumberValidator.isInteger(-5)).assertTrue();
      expect(NumberValidator.isInteger(1.5)).assertFalse();
      expect(NumberValidator.isInteger(Number.NaN)).assertFalse();
      expect(NumberValidator.isInteger(Number.POSITIVE_INFINITY)).assertFalse();
    });

    it('validator_should_check_ranges', 0, () => {
      expect(NumberValidator.isWithin(5, 0, 10)).assertTrue();
      expect(NumberValidator.isWithin(-1, 0, 10)).assertFalse();
      expect(NumberValidator.isWithin(11, 0, 10)).assertFalse();
      expect(NumberValidator.isWithin(Number.NaN, 0, 10)).assertFalse();
      expect(NumberValidator.isPositive(1)).assertTrue();
      expect(NumberValidator.isPositive(0)).assertFalse();
      expect(NumberValidator.isInt32(MAX_INT)).assertTrue();
    });

    it('validator_should_check_percent_and_paging', 0, () => {
      expect(NumberValidator.isPercent(0)).assertTrue();
      expect(NumberValidator.isPercent(100)).assertTrue();
      expect(NumberValidator.isPercent(-1)).assertFalse();
      expect(NumberValidator.isPercent(101)).assertFalse();
      expect(NumberValidator.isValidPageIndex(0)).assertTrue();
      expect(NumberValidator.isValidPageIndex(-1)).assertFalse();
      expect(NumberValidator.isValidPageIndex(1.5)).assertFalse();
      expect(NumberValidator.isValidPageSize(1)).assertTrue();
      expect(NumberValidator.isValidPageSize(50)).assertTrue();
      expect(NumberValidator.isValidPageSize(0)).assertFalse();
      expect(NumberValidator.isValidPageSize(51)).assertFalse();
    });

    it('report_should_aggregate_checks', 0, () => {
      const report = new NumberReport();
      report.check('percent', NumberValidator.isPercent(NumberUtil.percent(50, 100)));
      report.check('page', NumberValidator.isValidPageSize(10));
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      report.check('force', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['force']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('number_flow_should_validate_upload_progress', 0, () => {
      const total = 4096;
      const uploaded = 2048;
      const percent = NumberUtil.percent(uploaded, total);
      expect(percent).assertEqual(50);
      expect(NumberValidator.isPercent(percent)).assertTrue();
      expect(NumberUtil.toDisplay(percent)).assertEqual('50');
      expect(NumberUtil.isClose(percent, 50, 0)).assertTrue();
      expect(NumberUtil.safeDivide(uploaded, total)).assertEqual(0.5);
      expect(NumberUtil.average([16, 16, 32])).assertClose(21.333, 0.01);
    });

    it('number_constants_should_be_stable', 0, () => {
      expect(MAX_INT).assertEqual(2147483647);
      expect(MIN_SAFE_PERCENT).assertEqual(0);
      expect(MAX_SAFE_PERCENT).assertEqual(100);
      expect(DISPLAY_DECIMALS).assertEqual(2);
    });
  });
}

