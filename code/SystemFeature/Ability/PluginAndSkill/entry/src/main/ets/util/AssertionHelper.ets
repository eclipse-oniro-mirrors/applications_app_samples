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

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[AssertionHelper]';

export interface AssertionResult {
  passed: boolean;
  message: string;
  expected: string;
  actual: string;
  assertionType: string;
  timestamp: number;
}

export interface AssertionSummary {
  totalAssertions: number;
  passedAssertions: number;
  failedAssertions: number;
  passRate: number;
  results: AssertionResult[];
}

export class AssertionHelper {
  private results: AssertionResult[] = [];
  private static instance: AssertionHelper | undefined = undefined;

  private constructor() {
  }

  public static getInstance(): AssertionHelper {
    if (AssertionHelper.instance === undefined) {
      AssertionHelper.instance = new AssertionHelper();
    }
    return AssertionHelper.instance;
  }

  private createResult(passed: boolean, message: string, expected: string,
    actual: string, assertionType: string): AssertionResult {
    const result: AssertionResult = {
      passed: passed,
      message: message,
      expected: expected,
      actual: actual,
      assertionType: assertionType,
      timestamp: Date.now()
    };
    return result;
  }

  private recordResult(result: AssertionResult): void {
    this.results.push(result);
    if (result.passed) {
      hilog.debug(DOMAIN, TAG, '[PASS] %{public}s: %{public}s', result.assertionType, result.message);
    } else {
      hilog.error(DOMAIN, TAG, '[FAIL] %{public}s: %{public}s', result.assertionType, result.message);
    }
  }

  public assertEqual(actual: string, expected: string, message: string = ''): AssertionResult {
    const passed: boolean = actual === expected;
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected '${expected}' but got '${actual}'`,
      expected,
      actual,
      'assertEqual'
    );
    this.recordResult(result);
    return result;
  }

  public assertNotEqual(actual: string, expected: string, message: string = ''): AssertionResult {
    const passed: boolean = actual !== expected;
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected not '${expected}'`,
      `not ${expected}`,
      actual,
      'assertNotEqual'
    );
    this.recordResult(result);
    return result;
  }

  public assertTrue(value: boolean, message: string = ''): AssertionResult {
    const passed: boolean = value === true;
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected true but got ${value}`,
      'true',
      `${value}`,
      'assertTrue'
    );
    this.recordResult(result);
    return result;
  }

  public assertFalse(value: boolean, message: string = ''): AssertionResult {
    const passed: boolean = value === false;
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected false but got ${value}`,
      'false',
      `${value}`,
      'assertFalse'
    );
    this.recordResult(result);
    return result;
  }

  public assertContains(text: string, substring: string, message: string = ''): AssertionResult {
    const passed: boolean = text.includes(substring);
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected '${text}' to contain '${substring}'`,
      `contains '${substring}'`,
      text,
      'assertContains'
    );
    this.recordResult(result);
    return result;
  }

  public assertNotContains(text: string, substring: string, message: string = ''): AssertionResult {
    const passed: boolean = !text.includes(substring);
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected '${text}' to not contain '${substring}'`,
      `not contains '${substring}'`,
      text,
      'assertNotContains'
    );
    this.recordResult(result);
    return result;
  }

  public assertGreaterThan(actual: number, expected: number, message: string = ''): AssertionResult {
    const passed: boolean = actual > expected;
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected ${actual} > ${expected}`,
      `> ${expected}`,
      `${actual}`,
      'assertGreaterThan'
    );
    this.recordResult(result);
    return result;
  }

  public assertGreaterOrEqual(actual: number, expected: number, message: string = ''): AssertionResult {
    const passed: boolean = actual >= expected;
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected ${actual} >= ${expected}`,
      `>= ${expected}`,
      `${actual}`,
      'assertGreaterOrEqual'
    );
    this.recordResult(result);
    return result;
  }

  public assertLessThan(actual: number, expected: number, message: string = ''): AssertionResult {
    const passed: boolean = actual < expected;
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected ${actual} < ${expected}`,
      `< ${expected}`,
      `${actual}`,
      'assertLessThan'
    );
    this.recordResult(result);
    return result;
  }

  public assertLessOrEqual(actual: number, expected: number, message: string = ''): AssertionResult {
    const passed: boolean = actual <= expected;
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected ${actual} <= ${expected}`,
      `<= ${expected}`,
      `${actual}`,
      'assertLessOrEqual'
    );
    this.recordResult(result);
    return result;
  }

  public assertNotEmpty(value: string, message: string = ''): AssertionResult {
    const passed: boolean = value.length > 0;
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected non-empty but got '${value}'`,
      'non-empty',
      value,
      'assertNotEmpty'
    );
    this.recordResult(result);
    return result;
  }

  public assertEmpty(value: string, message: string = ''): AssertionResult {
    const passed: boolean = value.length === 0;
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected empty but got '${value}'`,
      'empty',
      value,
      'assertEmpty'
    );
    this.recordResult(result);
    return result;
  }

  public assertNull(value: string | undefined | null, message: string = ''): AssertionResult {
    const passed: boolean = value === null || value === undefined;
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected null but got '${value}'`,
      'null',
      `${value}`,
      'assertNull'
    );
    this.recordResult(result);
    return result;
  }

  public assertNotNull(value: string | undefined | null, message: string = ''): AssertionResult {
    const passed: boolean = value !== null && value !== undefined;
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected non-null but got null/undefined`,
      'non-null',
      `${value}`,
      'assertNotNull'
    );
    this.recordResult(result);
    return result;
  }

  public assertMatchesPattern(text: string, pattern: string, message: string = ''): AssertionResult {
    const regex: RegExp = new RegExp(pattern);
    const passed: boolean = regex.test(text);
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected '${text}' to match /${pattern}/`,
      `matches /${pattern}/`,
      text,
      'assertMatchesPattern'
    );
    this.recordResult(result);
    return result;
  }

  public assertStartsWith(text: string, prefix: string, message: string = ''): AssertionResult {
    const passed: boolean = text.indexOf(prefix) === 0;
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected '${text}' to start with '${prefix}'`,
      `starts with '${prefix}'`,
      text,
      'assertStartsWith'
    );
    this.recordResult(result);
    return result;
  }

  public assertEndsWith(text: string, suffix: string, message: string = ''): AssertionResult {
    const startIndex: number = text.length - suffix.length;
    const passed: boolean = startIndex >= 0 && text.indexOf(suffix, startIndex) === startIndex;
    const result: AssertionResult = this.createResult(
      passed,
      message.length > 0 ? message : `Expected '${text}' to end with '${suffix}'`,
      `ends with '${suffix}'`,
      text,
      'assertEndsWith'
    );
    this.recordResult(result);
    return result;
  }

  public getResults(): AssertionResult[] {
    const copy: AssertionResult[] = [];
    for (let i: number = 0; i < this.results.length; i++) {
      const r: AssertionResult = this.results[i];
      const resultCopy: AssertionResult = {
        passed: r.passed,
        message: r.message,
        expected: r.expected,
        actual: r.actual,
        assertionType: r.assertionType,
        timestamp: r.timestamp
      };
      copy.push(resultCopy);
    }
    return copy;
  }

  public getFailedResults(): AssertionResult[] {
    const failed: AssertionResult[] = [];
    for (let i: number = 0; i < this.results.length; i++) {
      if (!this.results[i].passed) {
        failed.push(this.results[i]);
      }
    }
    return failed;
  }

  public summarize(): AssertionSummary {
    let passedCount: number = 0;
    for (let i: number = 0; i < this.results.length; i++) {
      if (this.results[i].passed) {
        passedCount++;
      }
    }
    const failedCount: number = this.results.length - passedCount;
    const passRate: number = this.results.length > 0
      ? Math.round((passedCount / this.results.length) * 100)
      : 0;

    return {
      totalAssertions: this.results.length,
      passedAssertions: passedCount,
      failedAssertions: failedCount,
      passRate: passRate,
      results: this.getResults()
    };
  }

  public generateReport(): string {
    const summary: AssertionSummary = this.summarize();
    const lines: string[] = [];
    lines.push('=== Assertion Report ===');
    lines.push(`Total assertions: ${summary.totalAssertions}`);
    lines.push(`Passed: ${summary.passedAssertions}`);
    lines.push(`Failed: ${summary.failedAssertions}`);
    lines.push(`Pass rate: ${summary.passRate}%`);

    if (summary.failedAssertions > 0) {
      lines.push('');
      lines.push('--- Failed Assertions ---');
      const failed: AssertionResult[] = this.getFailedResults();
      for (let i: number = 0; i < failed.length; i++) {
        const f: AssertionResult = failed[i];
        lines.push(`  [${f.assertionType}] ${f.message}`);
        lines.push(`    Expected: ${f.expected}`);
        lines.push(`    Actual: ${f.actual}`);
      }
    }

    lines.push('');
    lines.push('=== End of Report ===');
    return lines.join('\n');
  }

  public clear(): void {
    this.results = [];
  }

  public getTotalCount(): number {
    return this.results.length;
  }

  public getPassCount(): number {
    let count: number = 0;
    for (let i: number = 0; i < this.results.length; i++) {
      if (this.results[i].passed) {
        count++;
      }
    }
    return count;
  }

  public getFailCount(): number {
    return this.getTotalCount() - this.getPassCount();
  }

  public getPassRate(): number {
    if (this.getTotalCount() === 0) {
      return 0;
    }
    return Math.round((this.getPassCount() / this.getTotalCount()) * 100);
  }
}
