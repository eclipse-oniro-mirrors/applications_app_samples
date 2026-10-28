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

const MIN_INDEX: number = 0;

const MAX_INDEX: number = 999;

const MIN_SIZE: number = 1;

const MAX_SIZE: number = 50;

const ERROR_NONE: string = 'none';

const ERROR_RANGE: string = 'range';

const ERROR_TYPE: string = 'type';

const ERROR_EMPTY: string = 'empty';

const ERROR_LENGTH: string = 'length';

// Checks numeric and string boundaries
class BoundaryChecker {
  public static isWithin(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  public static isEdge(value: number, min: number, max: number): boolean {
    return value === min || value === max;
  }

  public static clamp(value: number, min: number, max: number): number {
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }

  public static isIndexValid(value: number): boolean {
    return BoundaryChecker.isWithin(value, MIN_INDEX, MAX_INDEX);
  }

  public static isSizeValid(value: number): boolean {
    return BoundaryChecker.isWithin(value, MIN_SIZE, MAX_SIZE);
  }

  public static isEmpty(value: string): boolean {
    return value.length === 0;
  }

  public static isLengthWithin(value: string, maxLength: number): boolean {
    return value.length <= maxLength;
  }

  public static classifyNumber(value: number, min: number, max: number): string {
    if (!BoundaryChecker.isWithin(value, min, max)) {
      return ERROR_RANGE;
    }
    return ERROR_NONE;
  }

  public static classifyString(value: string, maxLength: number): string {
    if (BoundaryChecker.isEmpty(value)) {
      return ERROR_EMPTY;
    }
    if (!BoundaryChecker.isLengthWithin(value, maxLength)) {
      return ERROR_LENGTH;
    }
    return ERROR_NONE;
  }
}

// Maps error categories to recovery strategies
class ErrorRecoveryMatrix {
  public static readonly MATRIX: string[][] = [
    [ERROR_RANGE, 'clamp'],
    [ERROR_LENGTH, 'truncate'],
    [ERROR_EMPTY, 'default'],
    [ERROR_TYPE, 'cast']
  ];

  public static strategyFor(error: string): string {
    for (let i = 0; i < ErrorRecoveryMatrix.MATRIX.length; i++) {
      if (ErrorRecoveryMatrix.MATRIX[i][0] === error) {
        return ErrorRecoveryMatrix.MATRIX[i][1];
      }
    }
    return '';
  }

  public static recover(error: string): boolean {
    return ErrorRecoveryMatrix.strategyFor(error).length > 0;
  }

  public static isFatal(error: string): boolean {
    return error === ERROR_TYPE;
  }

  public static strategies(): string[] {
    const result: string[] = [];
    for (let i = 0; i < ErrorRecoveryMatrix.MATRIX.length; i++) {
      result.push(ErrorRecoveryMatrix.MATRIX[i][1]);
    }
    return result;
  }
}

// Runs boundary cases and counts pass/fail results
class BoundaryReport {
  private total: number = 0;
  private passed: number = 0;
  private failureItems: string[] = [];

  public record(name: string, passed: boolean): void {
    this.total++;
    if (passed) {
      this.passed++;
    } else {
      this.failureItems.push(name);
    }
  }

  public getTotal(): number {
    return this.total;
  }

  public getPassed(): number {
    return this.passed;
  }

  public getFailed(): number {
    return this.total - this.passed;
  }

  public passRate(): number {
    return this.total === 0 ? 0 : this.passed * 100 / this.total;
  }

  public getFailures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.total > 0 && this.failureItems.length === 0;
  }

  public reset(): void {
    this.total = 0;
    this.passed = 0;
    this.failureItems = [];
  }
}

// Applies the recovery action for a classification result
class BoundaryRecovery {
  public static applyNumber(value: number, min: number, max: number): number {
    const error = BoundaryChecker.classifyNumber(value, min, max);
    if (error === ERROR_NONE) {
      return value;
    }
    return BoundaryChecker.clamp(value, min, max);
  }

  public static applyString(value: string, maxLength: number): string {
    const error = BoundaryChecker.classifyString(value, maxLength);
    if (error === ERROR_NONE) {
      return value;
    }
    if (error === ERROR_EMPTY) {
      return '';
    }
    return value.substring(0, maxLength);
  }

  public static isRecoverable(error: string): boolean {
    return ErrorRecoveryMatrix.recover(error) && !ErrorRecoveryMatrix.isFatal(error);
  }
}

export default function boundaryErrorTestingTest() {
  describe('BoundaryErrorTesting_Test', () => {

    it('checker_should_validate_range', 0, () => {
      expect(BoundaryChecker.isWithin(0, 0, 100)).assertTrue();
      expect(BoundaryChecker.isWithin(100, 0, 100)).assertTrue();
      expect(BoundaryChecker.isWithin(-1, 0, 100)).assertFalse();
      expect(BoundaryChecker.isWithin(101, 0, 100)).assertFalse();
      expect(BoundaryChecker.isEdge(0, 0, 100)).assertTrue();
      expect(BoundaryChecker.isEdge(100, 0, 100)).assertTrue();
      expect(BoundaryChecker.isEdge(50, 0, 100)).assertFalse();
    });

    it('checker_should_clamp_values', 0, () => {
      expect(BoundaryChecker.clamp(-10, 0, 100)).assertEqual(0);
      expect(BoundaryChecker.clamp(110, 0, 100)).assertEqual(100);
      expect(BoundaryChecker.clamp(50, 0, 100)).assertEqual(50);
      expect(BoundaryChecker.clamp(0, 0, 0)).assertEqual(0);
    });

    it('checker_should_validate_index_and_size', 0, () => {
      expect(BoundaryChecker.isIndexValid(MIN_INDEX)).assertTrue();
      expect(BoundaryChecker.isIndexValid(MAX_INDEX)).assertTrue();
      expect(BoundaryChecker.isIndexValid(MIN_INDEX - 1)).assertFalse();
      expect(BoundaryChecker.isIndexValid(MAX_INDEX + 1)).assertFalse();
      expect(BoundaryChecker.isSizeValid(MIN_SIZE)).assertTrue();
      expect(BoundaryChecker.isSizeValid(MAX_SIZE)).assertTrue();
      expect(BoundaryChecker.isSizeValid(0)).assertFalse();
      expect(BoundaryChecker.isSizeValid(MAX_SIZE + 1)).assertFalse();
    });

    it('checker_should_validate_strings', 0, () => {
      expect(BoundaryChecker.isEmpty('')).assertTrue();
      expect(BoundaryChecker.isEmpty(' ')).assertFalse();
      expect(BoundaryChecker.isLengthWithin('abc', 3)).assertTrue();
      expect(BoundaryChecker.isLengthWithin('abcd', 3)).assertFalse();
      expect(BoundaryChecker.isLengthWithin('', 0)).assertTrue();
    });

    it('checker_should_classify_numbers', 0, () => {
      expect(BoundaryChecker.classifyNumber(50, 0, 100)).assertEqual(ERROR_NONE);
      expect(BoundaryChecker.classifyNumber(-1, 0, 100)).assertEqual(ERROR_RANGE);
      expect(BoundaryChecker.classifyNumber(101, 0, 100)).assertEqual(ERROR_RANGE);
      expect(BoundaryChecker.classifyNumber(0, 0, 100)).assertEqual(ERROR_NONE);
    });

    it('checker_should_classify_strings', 0, () => {
      expect(BoundaryChecker.classifyString('ok', 10)).assertEqual(ERROR_NONE);
      expect(BoundaryChecker.classifyString('', 10)).assertEqual(ERROR_EMPTY);
      expect(BoundaryChecker.classifyString('a'.repeat(11), 10)).assertEqual(ERROR_LENGTH);
      expect(BoundaryChecker.classifyString('a'.repeat(10), 10)).assertEqual(ERROR_NONE);
    });

    it('matrix_should_map_errors_to_strategies', 0, () => {
      expect(ErrorRecoveryMatrix.strategyFor(ERROR_RANGE)).assertEqual('clamp');
      expect(ErrorRecoveryMatrix.strategyFor(ERROR_LENGTH)).assertEqual('truncate');
      expect(ErrorRecoveryMatrix.strategyFor(ERROR_EMPTY)).assertEqual('default');
      expect(ErrorRecoveryMatrix.strategyFor(ERROR_TYPE)).assertEqual('cast');
      expect(ErrorRecoveryMatrix.strategyFor('unknown')).assertEqual('');
      expect(ErrorRecoveryMatrix.strategies().length).assertEqual(4);
    });

    it('matrix_should_flag_fatal_errors', 0, () => {
      expect(ErrorRecoveryMatrix.isFatal(ERROR_TYPE)).assertTrue();
      expect(ErrorRecoveryMatrix.isFatal(ERROR_RANGE)).assertFalse();
      expect(ErrorRecoveryMatrix.recover(ERROR_RANGE)).assertTrue();
      expect(ErrorRecoveryMatrix.recover('unknown')).assertFalse();
      expect(BoundaryRecovery.isRecoverable(ERROR_TYPE)).assertFalse();
      expect(BoundaryRecovery.isRecoverable(ERROR_LENGTH)).assertTrue();
    });

    it('recovery_should_apply_number_clamp', 0, () => {
      expect(BoundaryRecovery.applyNumber(50, 0, 100)).assertEqual(50);
      expect(BoundaryRecovery.applyNumber(-5, 0, 100)).assertEqual(0);
      expect(BoundaryRecovery.applyNumber(150, 0, 100)).assertEqual(100);
      expect(BoundaryRecovery.applyNumber(MAX_INDEX + 1, MIN_INDEX, MAX_INDEX)).assertEqual(MAX_INDEX);
    });

    it('recovery_should_apply_string_trim', 0, () => {
      expect(BoundaryRecovery.applyString('ok', 10)).assertEqual('ok');
      expect(BoundaryRecovery.applyString('', 10)).assertEqual('');
      expect(BoundaryRecovery.applyString('abcdef', 3)).assertEqual('abc');
      expect(BoundaryRecovery.applyString('a'.repeat(10), 10).length).assertEqual(10);
    });

    it('report_should_track_boundary_cases', 0, () => {
      const report = new BoundaryReport();
      report.record('min', BoundaryChecker.isIndexValid(MIN_INDEX));
      report.record('max', BoundaryChecker.isIndexValid(MAX_INDEX));
      report.record('below', !BoundaryChecker.isIndexValid(MIN_INDEX - 1));
      expect(report.getTotal()).assertEqual(3);
      expect(report.getPassed()).assertEqual(3);
      expect(report.getFailed()).assertEqual(0);
      expect(report.passRate()).assertEqual(100);
      expect(report.isPassed()).assertTrue();
      report.record('fail', false);
      expect(report.isPassed()).assertFalse();
      expect(report.getFailures()).assertDeepEquals(['fail']);
      report.reset();
      expect(report.getTotal()).assertEqual(0);
    });

    it('boundary_flow_should_recover_invalid_input', 0, () => {
      const report = new BoundaryReport();
      const inputs: number[] = [-100, 0, 500, MAX_INDEX, MAX_INDEX + 1];
      for (let i = 0; i < inputs.length; i++) {
        const recovered = BoundaryRecovery.applyNumber(inputs[i], MIN_INDEX, MAX_INDEX);
        report.record(`input-${i}`, BoundaryChecker.isIndexValid(recovered));
      }
      expect(report.isPassed()).assertTrue();
      expect(report.getPassed()).assertEqual(inputs.length);
      expect(BoundaryRecovery.applyNumber(500, 0, 100)).assertEqual(100);
    });

    it('boundary_constants_should_be_stable', 0, () => {
      expect(MIN_INDEX).assertEqual(0);
      expect(MAX_INDEX).assertEqual(999);
      expect(MIN_SIZE).assertEqual(1);
      expect(MAX_SIZE).assertEqual(50);
      expect(ERROR_NONE).assertEqual('none');
      expect(ERROR_LENGTH).assertEqual('length');
    });
  });
}

