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

const LEVEL_DEBUG: number = 0;

const LEVEL_INFO: number = 1;

const LEVEL_WARN: number = 2;

const LEVEL_ERROR: number = 3;

const DEFAULT_LEVEL: number = LEVEL_INFO;

const MAX_RECORDS: number = 100;

const MAX_MESSAGE: number = 1024;

interface LogRecord {
  level: number;
  tag: string;
  message: string;
  timestamp: number;
}

// Filters log records by level and tag
class LogFilter {
  public static meetsLevel(record: LogRecord, minLevel: number): boolean {
    return record.level >= minLevel;
  }

  public static byTag(records: LogRecord[], tag: string): LogRecord[] {
    return records.filter((record: LogRecord) => record.tag === tag);
  }

  public static atLeastLevel(records: LogRecord[], minLevel: number): LogRecord[] {
    return records.filter((record: LogRecord) => LogFilter.meetsLevel(record, minLevel));
  }

  public static errors(records: LogRecord[]): LogRecord[] {
    return LogFilter.atLeastLevel(records, LEVEL_ERROR);
  }

  public static countLevel(records: LogRecord[], level: number): number {
    return records.filter((record: LogRecord) => record.level === level).length;
  }
}

// Formats records for file attachment
class LogFormatter {
  public static levelName(level: number): string {
    if (level === LEVEL_DEBUG) {
      return 'DEBUG';
    }
    if (level === LEVEL_INFO) {
      return 'INFO';
    }
    if (level === LEVEL_WARN) {
      return 'WARN';
    }
    if (level === LEVEL_ERROR) {
      return 'ERROR';
    }
    return 'UNKNOWN';
  }

  public static format(record: LogRecord): string {
    return `${record.timestamp} ${LogFormatter.levelName(record.level)} [${record.tag}] ${record.message}`;
  }

  public static sanitize(message: string): string {
    return message.split('\n').join(' ').split('\r').join(' ').substring(0, MAX_MESSAGE);
  }

  public static isSafe(message: string): boolean {
    return message.length <= MAX_MESSAGE && message.indexOf('\n') < 0 && message.indexOf('\r') < 0;
  }
}

// Buffers logs and applies the configured minimum level
class Logger {
  private records: LogRecord[] = [];
  private minLevel: number = DEFAULT_LEVEL;
  private dropped: number = 0;
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public setMinLevel(level: number): boolean {
    if (level < LEVEL_DEBUG || level > LEVEL_ERROR) {
      return false;
    }
    this.minLevel = level;
    return true;
  }

  public getMinLevel(): number {
    return this.minLevel;
  }

  public log(level: number, tag: string, message: string, now: number): boolean {
    if (level < this.minLevel || tag.length === 0 || message.length === 0) {
      if (level >= this.minLevel) {
        this.dropped++;
      }
      return false;
    }
    if (this.records.length >= this.capacity) {
      this.records.shift();
      this.dropped++;
    }
    this.records.push({
      level: level,
      tag: tag,
      message: LogFormatter.sanitize(message),
      timestamp: now
    });
    return true;
  }

  public debug(tag: string, message: string, now: number): boolean {
    return this.log(LEVEL_DEBUG, tag, message, now);
  }

  public info(tag: string, message: string, now: number): boolean {
    return this.log(LEVEL_INFO, tag, message, now);
  }

  public warn(tag: string, message: string, now: number): boolean {
    return this.log(LEVEL_WARN, tag, message, now);
  }

  public error(tag: string, message: string, now: number): boolean {
    return this.log(LEVEL_ERROR, tag, message, now);
  }

  public getRecords(): LogRecord[] {
    return [...this.records];
  }

  public count(): number {
    return this.records.length;
  }

  public getDropped(): number {
    return this.dropped;
  }

  public clear(): void {
    this.records = [];
    this.dropped = 0;
  }
}

// Summarizes logs per tag and level
class LogSummary {
  private byTag: Map<string, number> = new Map<string, number>();
  private byLevel: Map<number, number> = new Map<number, number>();

  public add(record: LogRecord): void {
    this.byTag.set(record.tag, (this.byTag.get(record.tag) ?? 0) + 1);
    this.byLevel.set(record.level, (this.byLevel.get(record.level) ?? 0) + 1);
  }

  public countOfTag(tag: string): number {
    const value = this.byTag.get(tag);
    return value === undefined ? 0 : value;
  }

  public countOfLevel(level: number): number {
    const value = this.byLevel.get(level);
    return value === undefined ? 0 : value;
  }

  public tagCount(): number {
    return this.byTag.size;
  }

  public total(): number {
    let total: number = 0;
    this.byTag.forEach((count: number) => {
      total += count;
    });
    return total;
  }

  public reset(): void {
    this.byTag = new Map<string, number>();
    this.byLevel = new Map<number, number>();
  }
}

export default function loggerValidationTest() {
  describe('LoggerValidation_Test', () => {

    it('filter_should_apply_level', 0, () => {
      const record: LogRecord = { level: LEVEL_WARN, tag: 'a', message: 'm', timestamp: 0 };
      expect(LogFilter.meetsLevel(record, LEVEL_DEBUG)).assertTrue();
      expect(LogFilter.meetsLevel(record, LEVEL_WARN)).assertTrue();
      expect(LogFilter.meetsLevel(record, LEVEL_ERROR)).assertFalse();
      expect(LogFilter.countLevel([record], LEVEL_WARN)).assertEqual(1);
    });

    it('filter_should_filter_records', 0, () => {
      const records: LogRecord[] = [
        { level: LEVEL_DEBUG, tag: 'a', message: 'd', timestamp: 1 },
        { level: LEVEL_INFO, tag: 'b', message: 'i', timestamp: 2 },
        { level: LEVEL_ERROR, tag: 'a', message: 'e', timestamp: 3 }
      ];
      expect(LogFilter.byTag(records, 'a').length).assertEqual(2);
      expect(LogFilter.byTag(records, 'missing').length).assertEqual(0);
      expect(LogFilter.atLeastLevel(records, LEVEL_INFO).length).assertEqual(2);
      expect(LogFilter.errors(records).length).assertEqual(1);
    });

    it('formatter_should_map_levels', 0, () => {
      expect(LogFormatter.levelName(LEVEL_DEBUG)).assertEqual('DEBUG');
      expect(LogFormatter.levelName(LEVEL_INFO)).assertEqual('INFO');
      expect(LogFormatter.levelName(LEVEL_WARN)).assertEqual('WARN');
      expect(LogFormatter.levelName(LEVEL_ERROR)).assertEqual('ERROR');
      expect(LogFormatter.levelName(99)).assertEqual('UNKNOWN');
    });

    it('formatter_should_render_records', 0, () => {
      const record: LogRecord = {
        level: LEVEL_INFO, tag: 'IssueReporter', message: 'submitted', timestamp: 1000
      };
      const line = LogFormatter.format(record);
      expect(line).assertContain('1000');
      expect(line).assertContain('INFO');
      expect(line).assertContain('IssueReporter');
      expect(line).assertContain('submitted');
    });

    it('formatter_should_sanitize_messages', 0, () => {
      expect(LogFormatter.sanitize('line1\nline2')).assertEqual('line1 line2');
      expect(LogFormatter.sanitize('carriage\rreturn')).assertEqual('carriage return');
      expect(LogFormatter.sanitize('a'.repeat(MAX_MESSAGE + 10)).length).assertEqual(MAX_MESSAGE);
      expect(LogFormatter.isSafe('plain')).assertTrue();
      expect(LogFormatter.isSafe('line1\nline2')).assertFalse();
    });

    it('logger_should_filter_by_min_level', 0, () => {
      const logger = new Logger(MAX_RECORDS);
      expect(logger.getMinLevel()).assertEqual(DEFAULT_LEVEL);
      expect(logger.debug('tag', 'debug', 1)).assertFalse();
      expect(logger.info('tag', 'info', 2)).assertTrue();
      expect(logger.warn('tag', 'warn', 3)).assertTrue();
      expect(logger.error('tag', 'error', 4)).assertTrue();
      expect(logger.count()).assertEqual(3);
    });

    it('logger_should_change_min_level', 0, () => {
      const logger = new Logger(MAX_RECORDS);
      expect(logger.setMinLevel(LEVEL_DEBUG)).assertTrue();
      expect(logger.debug('tag', 'debug', 1)).assertTrue();
      expect(logger.setMinLevel(LEVEL_ERROR)).assertTrue();
      expect(logger.warn('tag', 'warn', 2)).assertFalse();
      expect(logger.error('tag', 'error', 3)).assertTrue();
      expect(logger.count()).assertEqual(2);
      expect(logger.setMinLevel(9)).assertFalse();
    });

    it('logger_should_reject_invalid_input', 0, () => {
      const logger = new Logger(MAX_RECORDS);
      expect(logger.info('', 'message', 1)).assertFalse();
      expect(logger.info('tag', '', 1)).assertFalse();
      expect(logger.count()).assertEqual(0);
      expect(logger.getDropped()).assertEqual(2);
    });

    it('logger_should_bound_capacity', 0, () => {
      const logger = new Logger(2);
      logger.info('tag', 'a', 1);
      logger.info('tag', 'b', 2);
      logger.info('tag', 'c', 3);
      expect(logger.count()).assertEqual(2);
      expect(logger.getDropped()).assertEqual(1);
      expect(logger.getRecords()[1].message).assertEqual('c');
      logger.clear();
      expect(logger.count()).assertEqual(0);
      expect(logger.getDropped()).assertEqual(0);
    });

    it('logger_should_sanitize_on_write', 0, () => {
      const logger = new Logger(MAX_RECORDS);
      logger.info('tag', 'line1\nline2', 1);
      const record = logger.getRecords()[0];
      expect(record.message).assertEqual('line1 line2');
      expect(LogFormatter.isSafe(record.message)).assertTrue();
    });

    it('summary_should_aggregate_records', 0, () => {
      const summary = new LogSummary();
      const records: LogRecord[] = [
        { level: LEVEL_INFO, tag: 'a', message: '1', timestamp: 1 },
        { level: LEVEL_INFO, tag: 'a', message: '2', timestamp: 2 },
        { level: LEVEL_ERROR, tag: 'b', message: '3', timestamp: 3 }
      ];
      for (let i = 0; i < records.length; i++) {
        summary.add(records[i]);
      }
      expect(summary.countOfTag('a')).assertEqual(2);
      expect(summary.countOfTag('b')).assertEqual(1);
      expect(summary.countOfLevel(LEVEL_INFO)).assertEqual(2);
      expect(summary.countOfLevel(LEVEL_ERROR)).assertEqual(1);
      expect(summary.tagCount()).assertEqual(2);
      expect(summary.total()).assertEqual(3);
      summary.reset();
      expect(summary.total()).assertEqual(0);
    });

    it('logger_flow_should_emit_and_summarize', 0, () => {
      const logger = new Logger(MAX_RECORDS);
      const summary = new LogSummary();
      logger.setMinLevel(LEVEL_DEBUG);
      logger.debug('flow', 'started', 1);
      logger.info('flow', 'processing', 2);
      logger.error('flow', 'failed', 3);
      const records = logger.getRecords();
      for (let i = 0; i < records.length; i++) {
        summary.add(records[i]);
      }
      expect(records.length).assertEqual(3);
      expect(summary.countOfTag('flow')).assertEqual(3);
      expect(summary.countOfLevel(LEVEL_ERROR)).assertEqual(1);
      expect(LogFormatter.format(records[2])).assertContain('failed');
    });

    it('logger_constants_should_be_stable', 0, () => {
      expect(LEVEL_DEBUG).assertEqual(0);
      expect(LEVEL_INFO).assertEqual(1);
      expect(LEVEL_WARN).assertEqual(2);
      expect(LEVEL_ERROR).assertEqual(3);
      expect(DEFAULT_LEVEL).assertEqual(1);
      expect(MAX_RECORDS).assertEqual(100);
      expect(MAX_MESSAGE).assertEqual(1024);
    });
  });
}

