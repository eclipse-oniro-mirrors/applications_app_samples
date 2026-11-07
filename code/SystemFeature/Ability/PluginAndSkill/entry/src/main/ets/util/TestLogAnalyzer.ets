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
const TAG: string = '[TestLogAnalyzer]';

export enum LogLevel {
  DEBUG = 3,
  INFO = 4,
  WARN = 5,
  ERROR = 6,
  FATAL = 7
}

export interface LogEntry {
  timestamp: number;
  level: LogLevel;
  tag: string;
  message: string;
  domain: number;
}

export interface LogAnalysisResult {
  totalEntries: number;
  errorCount: number;
  warningCount: number;
  infoCount: number;
  debugCount: number;
  uniqueTags: number;
  timeSpan: number;
  errorsByTag: Map<string, number>;
  testCaseResults: Map<string, boolean>;
}

export class TestLogAnalyzer {
  private entries: LogEntry[] = [];
  private maxEntries: number = 10000;

  constructor(maxEntries?: number) {
    if (maxEntries !== undefined) {
      this.maxEntries = maxEntries;
    }
  }

  public addEntry(level: LogLevel, tag: string, message: string, domain: number = DOMAIN): void {
    if (this.entries.length >= this.maxEntries) {
      this.entries.shift();
    }
    const entry: LogEntry = {
      timestamp: Date.now(),
      level: level,
      tag: tag,
      message: message,
      domain: domain
    };
    this.entries.push(entry);
  }

  public logDebug(tag: string, message: string): void {
    this.addEntry(LogLevel.DEBUG, tag, message);
    hilog.debug(DOMAIN, tag, message);
  }

  public logInfo(tag: string, message: string): void {
    this.addEntry(LogLevel.INFO, tag, message);
    hilog.info(DOMAIN, tag, message);
  }

  public logWarn(tag: string, message: string): void {
    this.addEntry(LogLevel.WARN, tag, message);
    hilog.warn(DOMAIN, tag, message);
  }

  public logError(tag: string, message: string): void {
    this.addEntry(LogLevel.ERROR, tag, message);
    hilog.error(DOMAIN, tag, message);
  }

  public getEntries(): LogEntry[] {
    const result: LogEntry[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      const entry = this.entries[i];
      const copy: LogEntry = {
        timestamp: entry.timestamp,
        level: entry.level,
        tag: entry.tag,
        message: entry.message,
        domain: entry.domain
      };
      result.push(copy);
    }
    return result;
  }

  public getEntriesByLevel(level: LogLevel): LogEntry[] {
    const result: LogEntry[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].level === level) {
        result.push(this.entries[i]);
      }
    }
    return result;
  }

  public getEntriesByTag(tag: string): LogEntry[] {
    const result: LogEntry[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].tag === tag) {
        result.push(this.entries[i]);
      }
    }
    return result;
  }

  public getEntriesByTimeRange(startTime: number, endTime: number): LogEntry[] {
    const result: LogEntry[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].timestamp >= startTime && this.entries[i].timestamp <= endTime) {
        result.push(this.entries[i]);
      }
    }
    return result;
  }

  public searchEntries(keyword: string): LogEntry[] {
    const result: LogEntry[] = [];
    const lowerKeyword = keyword.toLowerCase();
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].message.toLowerCase().includes(lowerKeyword) ||
        this.entries[i].tag.toLowerCase().includes(lowerKeyword)) {
        result.push(this.entries[i]);
      }
    }
    return result;
  }

  public analyze(): LogAnalysisResult {
    let errorCount = 0;
    let warningCount = 0;
    let infoCount = 0;
    let debugCount = 0;
    const tagSet: Set<string> = new Set();
    const errorsByTag: Map<string, number> = new Map();
    const testCaseResults: Map<string, boolean> = new Map();
    let minTime = Number.MAX_VALUE;
    let maxTime = 0;

    for (let i = 0; i < this.entries.length; i++) {
      const entry = this.entries[i];
      tagSet.add(entry.tag);

      if (entry.timestamp < minTime) {
        minTime = entry.timestamp;
      }
      if (entry.timestamp > maxTime) {
        maxTime = entry.timestamp;
      }

      switch (entry.level) {
        case LogLevel.ERROR:
          errorCount++;
          const currentErrorCount = errorsByTag.get(entry.tag);
          if (currentErrorCount !== undefined) {
            errorsByTag.set(entry.tag, currentErrorCount + 1);
          } else {
            errorsByTag.set(entry.tag, 1);
          }
          break;
        case LogLevel.WARN:
          warningCount++;
          break;
        case LogLevel.INFO:
          infoCount++;
          break;
        case LogLevel.DEBUG:
          debugCount++;
          break;
        default:
          break;
      }

      const beginPattern = new RegExp('^(\\w+) begin$');
      const beginMatch = entry.message.match(beginPattern);
      if (beginMatch !== null && beginMatch.length > 1) {
        const caseName = beginMatch[1];
        if (!testCaseResults.has(caseName)) {
          testCaseResults.set(caseName, true);
        }
      }

      const failPattern = new RegExp('^(\\w+) failed');
      const failMatch = entry.message.match(failPattern);
      if (failMatch !== null && failMatch.length > 1) {
        testCaseResults.set(failMatch[1], false);
      }
    }

    const timeSpan = (minTime === Number.MAX_VALUE) ? 0 : (maxTime - minTime);

    const result: LogAnalysisResult = {
      totalEntries: this.entries.length,
      errorCount: errorCount,
      warningCount: warningCount,
      infoCount: infoCount,
      debugCount: debugCount,
      uniqueTags: tagSet.size,
      timeSpan: timeSpan,
      errorsByTag: errorsByTag,
      testCaseResults: testCaseResults
    };

    return result;
  }

  public getTestPassRate(): number {
    const analysis = this.analyze();
    const total = analysis.testCaseResults.size;
    if (total === 0) {
      return 0;
    }
    let passed = 0;
    analysis.testCaseResults.forEach((value: boolean, key: string) => {
      if (value) {
        passed++;
      }
    });
    return Math.round((passed / total) * 100);
  }

  public clear(): void {
    this.entries = [];
  }

  public getEntryCount(): number {
    return this.entries.length;
  }

  public getErrorCount(): number {
    let count = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].level === LogLevel.ERROR) {
        count++;
      }
    }
    return count;
  }

  public getWarningCount(): number {
    let count = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].level === LogLevel.WARN) {
        count++;
      }
    }
    return count;
  }

  public generateReport(): string {
    const analysis = this.analyze();
    const lines: string[] = [];
    lines.push('=== Test Log Analysis Report ===');
    lines.push(`Total entries: ${analysis.totalEntries}`);
    lines.push(`Time span: ${analysis.timeSpan}ms`);
    lines.push(`Unique tags: ${analysis.uniqueTags}`);
    lines.push(`DEBUG: ${analysis.debugCount}`);
    lines.push(`INFO: ${analysis.infoCount}`);
    lines.push(`WARN: ${analysis.warningCount}`);
    lines.push(`ERROR: ${analysis.errorCount}`);
    lines.push(`Test pass rate: ${this.getTestPassRate()}%`);

    if (analysis.errorsByTag.size > 0) {
      lines.push('');
      lines.push('--- Errors by Tag ---');
      analysis.errorsByTag.forEach((count: number, tag: string) => {
        lines.push(`  ${tag}: ${count} errors`);
      });
    }

    if (analysis.testCaseResults.size > 0) {
      lines.push('');
      lines.push('--- Test Case Results ---');
      analysis.testCaseResults.forEach((passed: boolean, name: string) => {
        const status = passed ? 'PASS' : 'FAIL';
        lines.push(`  ${name}: ${status}`);
      });
    }

    lines.push('');
    lines.push('=== End of Report ===');
    return lines.join('\n');
  }
}
