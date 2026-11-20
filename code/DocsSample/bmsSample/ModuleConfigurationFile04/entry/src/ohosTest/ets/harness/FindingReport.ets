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

  /**
   * Returns the distinct finding paths in first seen order.
   */
  public paths(): string[] {
    return FindingUtils.paths(this.findings);
  }

  /**
   * Returns the most frequent codes limited by the requested count.
   */
  public topCodes(limit: number): string[] {
    const codes: string[] = FindingUtils.codes(this.findings);
    codes.sort((left: string, right: string): number => {
      const leftCount: number = this.countByCode(left);
      const rightCount: number = this.countByCode(right);
      if (leftCount !== rightCount) {
        return rightCount - leftCount;
      }
      return left.localeCompare(right);
    });
    if (limit < 0 || limit >= codes.length) {
      return codes;
    }
    return codes.slice(0, limit);
  }

  /**
   * Formats every finding as one readable line.
   */
  public formatLines(): string[] {
    const lines: string[] = [];
    for (let index: number = 0; index < this.findings.length; index++) {
      const finding: Finding = this.findings[index];
      lines.push(`${FindingReport.severityName(finding.severity)} ${finding.code} ${finding.path} ${finding.message}`);
    }
    return lines;
  }

  /**
   * Formats a one line summary of the report.
   */
  public summary(): string {
    return `findings=${this.count()} errors=${this.errorCount()} warnings=${this.warningCount()}`;
  }

  /**
   * Returns true when the finding codes are sorted in ascending order.
   */
  public isCodeOrdered(): boolean {
    const codes: string[] = FindingUtils.codes(this.findings);
    for (let index: number = 1; index < codes.length; index++) {
      if (codes[index - 1].localeCompare(codes[index]) > 0) {
        return false;
      }
    }
    return true;
  }

  /**
   * Returns true when every finding is well formed.
   */
  public allWellFormed(): boolean {
    return FindingUtils.allWellFormed(this.findings);
  }

  /**
   * Returns true when severity ordering is non increasing.
   */
  public isSeverityOrdered(): boolean {
    for (let index: number = 1; index < this.findings.length; index++) {
      if (this.findings[index - 1].severity < this.findings[index].severity) {
        return false;
      }
    }
    return true;
  }

  /**
   * Returns the textual severity label.
   */
  public static severityName(severity: Severity): string {
    if (severity === Severity.ERROR) {
      return 'ERROR';
    }
    if (severity === Severity.WARN) {
      return 'WARN';
    }
    return 'INFO';
  }

  /**
   * Builds a report over the union of the provided finding lists.
   */
  public static merge(lists: Finding[][]): FindingReport {
    const merged: Finding[] = [];
    for (let listIndex: number = 0; listIndex < lists.length; listIndex++) {
      for (let index: number = 0; index < lists[listIndex].length; index++) {
        merged.push(lists[listIndex][index]);
      }
    }
    return new FindingReport(merged);
  }
}
