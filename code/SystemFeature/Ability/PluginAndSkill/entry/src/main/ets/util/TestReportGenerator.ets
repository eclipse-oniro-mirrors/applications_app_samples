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
const TAG: string = '[TestReportGenerator]';

export interface TestCaseReportEntry {
  caseId: string;
  caseName: string;
  caseDescription: string;
  suiteName: string;
  status: string;
  startTime: number;
  endTime: number;
  duration: number;
  errorMessage: string;
  assertionCount: number;
  passedAssertions: number;
  failedAssertions: number;
  tags: string[];
}

export interface SuiteReportSection {
  suiteName: string;
  totalCases: number;
  passedCases: number;
  failedCases: number;
  skippedCases: number;
  totalDuration: number;
  passRate: number;
  assertionDensity: number;
}

export interface FullTestReport {
  reportTitle: string;
  generatedAt: number;
  generatedAtFormatted: string;
  totalSuites: number;
  totalCases: number;
  totalPassed: number;
  totalFailed: number;
  totalSkipped: number;
  overallPassRate: number;
  totalDuration: number;
  suiteSections: SuiteReportSection[];
  caseEntries: TestCaseReportEntry[];
  qualityScore: number;
  qualityGrade: string;
}

export class TestReportGenerator {
  private entries: TestCaseReportEntry[] = [];
  private reportTitle: string = 'Test Report';

  public setReportTitle(title: string): void {
    this.reportTitle = title;
  }

  public addEntry(caseId: string, caseName: string, caseDescription: string,
    suiteName: string, status: string, startTime: number, endTime: number,
    errorMessage: string, assertionCount: number, passedAssertions: number,
    failedAssertions: number, tags: string[]): void {
    const entry: TestCaseReportEntry = {
      caseId: caseId,
      caseName: caseName,
      caseDescription: caseDescription,
      suiteName: suiteName,
      status: status,
      startTime: startTime,
      endTime: endTime,
      duration: endTime - startTime,
      errorMessage: errorMessage,
      assertionCount: assertionCount,
      passedAssertions: passedAssertions,
      failedAssertions: failedAssertions,
      tags: tags
    };
    this.entries.push(entry);
    hilog.debug(DOMAIN, TAG, 'Report entry added: %{public}s [%{public}s]', caseName, status);
  }

  public addPassedEntry(caseId: string, caseName: string, suiteName: string,
    duration: number, assertionCount: number): void {
    const now = Date.now();
    const tags: string[] = [];
    tags.push('passed');
    this.addEntry(caseId, caseName, `Test ${caseName}`, suiteName, 'passed',
      now - duration, now, '', assertionCount, assertionCount, 0, tags);
  }

  public addFailedEntry(caseId: string, caseName: string, suiteName: string,
    duration: number, errorMessage: string, assertionCount: number): void {
    const now = Date.now();
    const tags: string[] = [];
    tags.push('failed');
    this.addEntry(caseId, caseName, `Test ${caseName}`, suiteName, 'failed',
      now - duration, now, errorMessage, assertionCount, 0, assertionCount, tags);
  }

  private collectSuiteNames(): string[] {
    const suites: string[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      const suite = this.entries[i].suiteName;
      let found = false;
      for (let j = 0; j < suites.length; j++) {
        if (suites[j] === suite) {
          found = true;
          break;
        }
      }
      if (!found) {
        suites.push(suite);
      }
    }
    return suites;
  }

  private buildSuiteSection(suiteName: string): SuiteReportSection {
    let total = 0;
    let passed = 0;
    let failed = 0;
    let skipped = 0;
    let totalDuration = 0;
    let totalAssertions = 0;

    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].suiteName === suiteName) {
        total++;
        totalDuration += this.entries[i].duration;
        totalAssertions += this.entries[i].assertionCount;
        if (this.entries[i].status === 'passed') {
          passed++;
        } else if (this.entries[i].status === 'failed') {
          failed++;
        } else {
          skipped++;
        }
      }
    }

    const passRate = total > 0 ? Math.round((passed / total) * 100) : 0;
    const assertionDensity = total > 0 ? Math.round((totalAssertions / total) * 10) / 10 : 0;

    return {
      suiteName: suiteName,
      totalCases: total,
      passedCases: passed,
      failedCases: failed,
      skippedCases: skipped,
      totalDuration: totalDuration,
      passRate: passRate,
      assertionDensity: assertionDensity
    };
  }

  private calculateQualityScore(totalPassed: number, totalFailed: number,
    totalCases: number, avgAssertions: number): number {
    if (totalCases === 0) {
      return 0;
    }
    const passRateScore = (totalPassed / totalCases) * 50;
    const coverageScore = Math.min(avgAssertions / 5, 1) * 30;
    const reliabilityScore = totalFailed === 0 ? 20 : Math.max(0, 20 - totalFailed * 5);
    return Math.round(passRateScore + coverageScore + reliabilityScore);
  }

  private getQualityGrade(score: number): string {
    if (score >= 90) {
      return 'A';
    } else if (score >= 80) {
      return 'B';
    } else if (score >= 70) {
      return 'C';
    } else if (score >= 60) {
      return 'D';
    }
    return 'F';
  }

  private formatTimestamp(timestamp: number): string {
    const date = new Date(timestamp);
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    const hours = String(date.getHours()).padStart(2, '0');
    const minutes = String(date.getMinutes()).padStart(2, '0');
    const seconds = String(date.getSeconds()).padStart(2, '0');
    return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
  }

  public generateReport(): FullTestReport {
    const suiteNames = this.collectSuiteNames();
    const sections: SuiteReportSection[] = [];
    for (let i = 0; i < suiteNames.length; i++) {
      sections.push(this.buildSuiteSection(suiteNames[i]));
    }

    let totalPassed = 0;
    let totalFailed = 0;
    let totalSkipped = 0;
    let totalDuration = 0;
    let totalAssertions = 0;

    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].status === 'passed') {
        totalPassed++;
      } else if (this.entries[i].status === 'failed') {
        totalFailed++;
      } else {
        totalSkipped++;
      }
      totalDuration += this.entries[i].duration;
      totalAssertions += this.entries[i].assertionCount;
    }

    const totalCases = this.entries.length;
    const overallPassRate = totalCases > 0 ? Math.round((totalPassed / totalCases) * 100) : 0;
    const avgAssertions = totalCases > 0 ? totalAssertions / totalCases : 0;
    const qualityScore = this.calculateQualityScore(totalPassed, totalFailed, totalCases, avgAssertions);

    return {
      reportTitle: this.reportTitle,
      generatedAt: Date.now(),
      generatedAtFormatted: this.formatTimestamp(Date.now()),
      totalSuites: suiteNames.length,
      totalCases: totalCases,
      totalPassed: totalPassed,
      totalFailed: totalFailed,
      totalSkipped: totalSkipped,
      overallPassRate: overallPassRate,
      totalDuration: totalDuration,
      suiteSections: sections,
      caseEntries: this.getEntriesCopy(),
      qualityScore: qualityScore,
      qualityGrade: this.getQualityGrade(qualityScore)
    };
  }

  private getEntriesCopy(): TestCaseReportEntry[] {
    const copy: TestCaseReportEntry[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      const e = this.entries[i];
      const tags: string[] = [];
      for (let j = 0; j < e.tags.length; j++) {
        tags.push(e.tags[j]);
      }
      const entryCopy: TestCaseReportEntry = {
        caseId: e.caseId,
        caseName: e.caseName,
        caseDescription: e.caseDescription,
        suiteName: e.suiteName,
        status: e.status,
        startTime: e.startTime,
        endTime: e.endTime,
        duration: e.duration,
        errorMessage: e.errorMessage,
        assertionCount: e.assertionCount,
        passedAssertions: e.passedAssertions,
        failedAssertions: e.failedAssertions,
        tags: tags
      };
      copy.push(entryCopy);
    }
    return copy;
  }

  public generateTextReport(): string {
    const report = this.generateReport();
    const lines: string[] = [];
    lines.push('========================================');
    lines.push(`  ${report.reportTitle}`);
    lines.push('========================================');
    lines.push(`Generated: ${report.generatedAtFormatted}`);
    lines.push('');
    lines.push('--- Overall Summary ---');
    lines.push(`Total Suites: ${report.totalSuites}`);
    lines.push(`Total Cases: ${report.totalCases}`);
    lines.push(`Passed: ${report.totalPassed}`);
    lines.push(`Failed: ${report.totalFailed}`);
    lines.push(`Skipped: ${report.totalSkipped}`);
    lines.push(`Pass Rate: ${report.overallPassRate}%`);
    lines.push(`Total Duration: ${report.totalDuration}ms`);
    lines.push(`Quality Score: ${report.qualityScore}/100 (${report.qualityGrade})`);
    lines.push('');

    if (report.suiteSections.length > 0) {
      lines.push('--- Suite Details ---');
      for (let i = 0; i < report.suiteSections.length; i++) {
        const section = report.suiteSections[i];
        lines.push(`  [${section.suiteName}]`);
        lines.push(`    Cases: ${section.totalCases} (Pass: ${section.passedCases}, Fail: ${section.failedCases})`);
        lines.push(`    Pass Rate: ${section.passRate}%`);
        lines.push(`    Duration: ${section.totalDuration}ms`);
        lines.push(`    Assertion Density: ${section.assertionDensity}`);
      }
      lines.push('');
    }

    if (report.totalFailed > 0) {
      lines.push('--- Failed Cases ---');
      for (let i = 0; i < report.caseEntries.length; i++) {
        const entry = report.caseEntries[i];
        if (entry.status === 'failed') {
          lines.push(`  [FAIL] ${entry.caseName}: ${entry.errorMessage}`);
        }
      }
      lines.push('');
    }

    lines.push('========================================');
    lines.push('  End of Report');
    lines.push('========================================');
    return lines.join('\n');
  }

  public clear(): void {
    this.entries = [];
    hilog.info(DOMAIN, TAG, 'Report generator cleared');
  }

  public getEntryCount(): number {
    return this.entries.length;
  }
}
