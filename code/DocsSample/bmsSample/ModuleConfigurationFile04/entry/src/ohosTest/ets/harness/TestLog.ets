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
import { DOMAIN, TAG } from './TestConstants';
import type { Finding } from './FindingTypes';

/**
 * Logging helper used before assertions inside the test suites.
 */
export class TestLog {
  /**
   * Logs a test step together with its textual detail.
   */
  public static step(testName: string, detail: string): void {
    hilog.info(DOMAIN, TAG, '%{public}s step: %{public}s', testName, detail);
  }

  /**
   * Logs a numeric value used by an assertion.
   */
  public static number(testName: string, label: string, value: number): void {
    hilog.info(DOMAIN, TAG, '%{public}s %{public}s=%{public}d', testName, label, value);
  }

  /**
   * Logs a textual value used by an assertion.
   */
  public static text(testName: string, label: string, value: string): void {
    hilog.info(DOMAIN, TAG, '%{public}s %{public}s=%{public}s', testName, label, value);
  }

  /**
   * Logs a boolean value used by an assertion.
   */
  public static flag(testName: string, label: string, value: boolean): void {
    hilog.info(DOMAIN, TAG, '%{public}s %{public}s=%{public}s', testName, label, String(value));
  }

  /**
   * Logs the size and the codes of a finding list.
   */
  public static findings(testName: string, label: string, findings: Finding[]): void {
    hilog.info(DOMAIN, TAG, '%{public}s %{public}s count=%{public}d', testName, label, findings.length);
  }

  /**
   * Logs the expected and the actual value of an assertion.
   */
  public static compare(testName: string, label: string, expected: string, actual: string): void {
    hilog.info(DOMAIN, TAG, '%{public}s %{public}s expected=%{public}s actual=%{public}s',
      testName, label, expected, actual);
  }
}
