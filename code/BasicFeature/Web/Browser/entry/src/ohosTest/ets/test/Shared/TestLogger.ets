/*
 * Copyright (c) 2026 Sample Device Co., Ltd.
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

import hilog from '@ohos.hilog';

/**
 * Unified logging facade for the browser ohosTest project.
 *
 * The project rule forbids stdout printing inside test code, therefore every
 * assertion step, wait loop and failure branch reports through hilog.
 * All messages are expected to be English so that log collection tools can
 * aggregate results without encoding problems.
 */
export type LogLevel = 'DEBUG' | 'INFO' | 'WARN' | 'ERROR';

const DOMAIN: number = 0xF811;
const PREFIX: string = 'BrowserTest';
const FORMAT: string = '%{public}s';
const DEFAULT_TAG: string = 'Browser';

/** Severity ordering used by the in-memory sink when filtering entries. */
export const LOG_LEVEL_WEIGHT: Map<string, number> = new Map<string, number>([
  ['DEBUG', 0],
  ['INFO', 1],
  ['WARN', 2],
  ['ERROR', 3]
]);

/** One captured log record. Useful to validate Logger behaviour itself. */
export interface LogRecord {
  level: string;
  tag: string;
  message: string;
  timestamp: number;
}

/**
 * Bounded in-memory log sink.
 *
 * Large UI suites run thousands of steps, a ring buffer keeps the memory
 * footprint constant while still allowing a recent-history assertion.
 */
export class LogSink {
  private capacity: number;
  private records: LogRecord[] = [];
  private dropped: number = 0;
  private minLevel: number = 0;

  constructor(capacity: number = 512) {
    this.capacity = capacity <= 0 ? 1 : capacity;
  }

  setMinLevel(level: string): void {
    this.minLevel = LOG_LEVEL_WEIGHT.get(level) ?? 0;
  }

  getMinLevel(): string {
    let result: string = 'DEBUG';
    LOG_LEVEL_WEIGHT.forEach((weight: number, name: string) => {
      if (weight === this.minLevel) {
        result = name;
      }
    });
    return result;
  }

  push(record: LogRecord): void {
    const weight: number = LOG_LEVEL_WEIGHT.get(record.level) ?? 0;
    if (weight < this.minLevel) {
      return;
    }
    this.records.push(record);
    if (this.records.length > this.capacity) {
      this.records.shift();
      this.dropped += 1;
    }
  }

  getAll(): LogRecord[] {
    return this.records.slice(0);
  }

  getByLevel(level: string): LogRecord[] {
    return this.records.filter((record: LogRecord) => record.level === level);
  }

  getByTag(tag: string): LogRecord[] {
    return this.records.filter((record: LogRecord) => record.tag === tag);
  }

  getRecent(count: number): LogRecord[] {
    if (count <= 0) {
      return [];
    }
    const start: number = this.records.length > count ? this.records.length - count : 0;
    return this.records.slice(start);
  }

  contains(keyword: string): boolean {
    return this.records.some((record: LogRecord) => record.message.indexOf(keyword) >= 0);
  }

  size(): number {
    return this.records.length;
  }

  droppedCount(): number {
    return this.dropped;
  }

  clear(): void {
    this.records = [];
    this.dropped = 0;
  }
}

/** Process-wide sink shared by every suite of the browser test module. */
export const browserLogSink: LogSink = new LogSink(1024);

/**
 * Static logger with step counters per suite.
 *
 * The step counter makes the hilog stream readable when a suite fails in the
 * middle: the last printed "step N" immediately points at the failing action.
 */
export class TestLogger {
  private static steps: Map<string, number> = new Map<string, number>();
  private static failures: LogRecord[] = [];
  private static silent: boolean = false;

  static setSilent(silent: boolean): void {
    TestLogger.silent = silent;
  }

  static isSilent(): boolean {
    return TestLogger.silent;
  }

  static debug(tag: string, message: string): void {
    if (TestLogger.silent) {
      return;
    }
    hilog.debug(DOMAIN, PREFIX, FORMAT, `[${tag}] ${message}`);
    browserLogSink.push({ level: 'DEBUG', tag: tag, message: message, timestamp: Date.now() });
  }

  static info(tag: string, message: string): void {
    if (TestLogger.silent) {
      return;
    }
    hilog.info(DOMAIN, PREFIX, FORMAT, `[${tag}] ${message}`);
    browserLogSink.push({ level: 'INFO', tag: tag, message: message, timestamp: Date.now() });
  }

  static warn(tag: string, message: string): void {
    if (TestLogger.silent) {
      return;
    }
    hilog.warn(DOMAIN, PREFIX, FORMAT, `[${tag}] ${message}`);
    browserLogSink.push({ level: 'WARN', tag: tag, message: message, timestamp: Date.now() });
  }

  static error(tag: string, message: string): void {
    hilog.error(DOMAIN, PREFIX, FORMAT, `[${tag}] ${message}`);
    const record: LogRecord = {
      level: 'ERROR', tag: tag, message: message, timestamp: Date.now()
    };
    browserLogSink.push(record);
    TestLogger.failures.push(record);
  }

  /** Prints "step N" and returns the incremented counter. */
  static step(suite: string, action: string): number {
    const current: number = (TestLogger.steps.get(suite) ?? 0) + 1;
    TestLogger.steps.set(suite, current);
    TestLogger.info(suite, `step ${current} - ${action}`);
    return current;
  }

  static stepCount(suite: string): number {
    return TestLogger.steps.get(suite) ?? 0;
  }

  static resetSteps(suite: string): void {
    TestLogger.steps.set(suite, 0);
  }

  static caseBegin(suite: string, caseName: string): void {
    TestLogger.info(suite, `case begin: ${caseName}`);
  }

  static caseEnd(suite: string, caseName: string, elapsedMs: number): void {
    TestLogger.info(suite, `case end: ${caseName}, elapsed ${elapsedMs} ms`);
  }

  static pass(suite: string, caseName: string): void {
    TestLogger.info(suite, `case passed: ${caseName}`);
  }

  static fail(suite: string, caseName: string, reason: string): void {
    TestLogger.error(suite, `case failed: ${caseName}, reason: ${reason}`);
  }

  /** Logs the thrown value, never rethrows: the caller still owns control flow. */
  static exception(suite: string, stage: string, error: Error | string): void {
    const detail: string = typeof error === 'string' ? error : `${error.name}: ${error.message}`;
    TestLogger.error(suite, `${stage} threw ${detail}`);
  }

  static getFailureCount(): number {
    return TestLogger.failures.length;
  }

  static getFailures(): LogRecord[] {
    return TestLogger.failures.slice(0);
  }

  static clearFailures(): void {
    TestLogger.failures = [];
  }

  static summary(suite: string): string {
    const steps: number = TestLogger.stepCount(suite);
    const failures: number = TestLogger.getFailureCount();
    return `suite=${suite} steps=${steps} failures=${failures}`;
  }
}

/** Convenience wrapper so a suite can log with a fixed tag. */
export class TaggedLogger {
  private tag: string;

  constructor(tag: string = DEFAULT_TAG) {
    this.tag = tag;
  }

  info(message: string): void {
    TestLogger.info(this.tag, message);
  }

  warn(message: string): void {
    TestLogger.warn(this.tag, message);
  }

  error(message: string): void {
    TestLogger.error(this.tag, message);
  }

  debug(message: string): void {
    TestLogger.debug(this.tag, message);
  }

  step(action: string): number {
    return TestLogger.step(this.tag, action);
  }
}

export default TestLogger;
