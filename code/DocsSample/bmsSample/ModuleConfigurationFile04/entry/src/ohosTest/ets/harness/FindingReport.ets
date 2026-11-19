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

import type { Finding } from './FindingTypes';
import { FindingUtils, Severity } from './FindingTypes';

/**
 * Aggregated view over a list of findings.
 */
export class FindingReport {
  private findings: Finding[];

  constructor(findings: Finding[]) {
    this.findings = FindingUtils.sort(findings);
  }

  /**
   * Returns the number of findings in the report.
   */
  public count(): number {
    return this.findings.length;
  }

  /**
   * Returns the number of findings carrying the requested severity.
   */
  public countBySeverity(severity: Severity): number {
    return FindingUtils.filterBySeverity(this.findings, severity).length;
  }

  /**
   * Returns the number of findings carrying the requested code.
   */
  public countByCode(code: string): number {
    return FindingUtils.countCode(this.findings, code);
  }

  /**
   * Returns the number of error findings.
   */
  public errorCount(): number {
    return this.countBySeverity(Severity.ERROR);
  }

  /**
   * Returns the number of warning findings.
   */
  public warningCount(): number {
    return this.countBySeverity(Severity.WARN);
  }

  /**
   * Returns the number of info findings.
   */
  public infoCount(): number {
    return this.countBySeverity(Severity.INFO);
  }

  /**
   * Returns true when the report contains at least one error.
   */
  public hasErrors(): boolean {
    return this.errorCount() > 0;
  }

  /**
   * Returns true when the report contains at least one warning.
   */
  public hasWarnings(): boolean {
    return this.warningCount() > 0;
  }

  /**
   * Returns true when the report is empty.
   */
  public isEmpty(): boolean {
    return this.findings.length === 0;
  }

  /**
   * Returns the highest severity present in the report.
   */
  public maxSeverity(): Severity {
    return FindingUtils.maxSeverity(this.findings);
  }

  /**
   * Returns the sorted findings of the report.
   */
  public sortedFindings(): Finding[] {
    return this.findings;
  }

  /**
   * Returns the distinct finding codes in ascending order.
   */
  public codes(): string[] {
    const codes: string[] = FindingUtils.codes(this.findings);
    codes.sort();
    return codes;
  }
