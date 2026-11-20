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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '../Shared/MiracastDriver';
import { Log } from 'library';
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  waitForPageStable,
  miracastComponentCount,
  serializedDelay,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/MiracastDriver';

const TAG: string = 'LoggerSuite';

// Log severity used by the miracast Log wrapper.
enum LogLevel {
  DEBUG = 0,
  INFO = 1,
  WARN = 2,
  ERROR = 3,
  FATAL = 4
}

// Output format of one log line.
enum LogFormat {
  PLAIN = 'plain',
  JSON = 'json',
  STRUCTURED = 'structured',
  SYSLOG = 'syslog'
}

// Rotation policy of the in memory log buffer.
enum LogRotationPolicy {
  NONE = 'none',
  SIZE_BASED = 'size_based',
  COUNT_BASED = 'count_based'
}

// One stored log record.
interface LogEntry {
  level: LogLevel;
  tag: string;
  message: string;
  timestamp: number;
  sequence: number;
}

// Configuration of the log buffer.
interface LogConfig {
  format: LogFormat;
  rotationPolicy: LogRotationPolicy;
  maxSize: number;
  bufferSize: number;
  asyncWrite: boolean;
  dedupEnabled: boolean;
}

// Log wrapper of the miracast application. It mirrors the production Log class:
// level filtering, tag filtering, duplicate suppression and English formatting.
class LogWrapper {
  private static instance: LogWrapper | null = null;
  private entries: Array<LogEntry> = [];
  private maxSize: number = 10000;
  private currentLevel: LogLevel = LogLevel.DEBUG;
  private dedupEnabled: boolean = true;
  private duplicateCount: number = 0;
  private sequence: number = 0;

  public static getInstance(): LogWrapper {
    if (LogWrapper.instance === null) {
      LogWrapper.instance = new LogWrapper();
    }
    return LogWrapper.instance;
  }

  public setLogLevel(level: LogLevel): void {
    this.currentLevel = level;
  }

  public setDedupEnabled(enabled: boolean): void {
    this.dedupEnabled = enabled;
  }

  public isLevelEnabled(level: LogLevel): boolean {
    return level >= this.currentLevel;
  }

  public debug(tag: string, message: string): void {
    this.write(LogLevel.DEBUG, tag, message);
  }

  public info(tag: string, message: string): void {
    this.write(LogLevel.INFO, tag, message);
  }

  public warn(tag: string, message: string): void {
    this.write(LogLevel.WARN, tag, message);
  }

  public error(tag: string, message: string): void {
    this.write(LogLevel.ERROR, tag, message);
  }

  public fatal(tag: string, message: string): void {
    this.write(LogLevel.FATAL, tag, message);
  }

  private write(level: LogLevel, tag: string, message: string): void {
    if (!this.isLevelEnabled(level)) {
      return;
    }
    if (this.dedupEnabled && this.isDuplicateOfLast(level, tag, message)) {
      this.duplicateCount++;
      return;
    }
    this.sequence++;
    const entry: LogEntry = {
      level: level,
      tag: tag,
      message: message,
      timestamp: Date.now(),
      sequence: this.sequence
    };
    this.entries.push(entry);
    if (this.entries.length > this.maxSize) {
      this.entries = this.entries.slice(this.entries.length - this.maxSize);
    }
  }

  private isDuplicateOfLast(level: LogLevel, tag: string, message: string): boolean {
    if (this.entries.length === 0) {
      return false;
    }
    const last = this.entries[this.entries.length - 1];
    return last.level === level && last.tag === tag && last.message === message;
  }

  public getDuplicateCount(): number {
    return this.duplicateCount;
  }

  public getAllLogs(): Array<LogEntry> {
    return [...this.entries];
  }

  public getLogsByLevel(level: LogLevel): Array<LogEntry> {
    const result: Array<LogEntry> = [];
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].level === level) {
        result.push(this.entries[i]);
      }
    }
    return result;
  }

  public getLogsByTag(tag: string): Array<LogEntry> {
    const result: Array<LogEntry> = [];
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].tag === tag) {
        result.push(this.entries[i]);
      }
    }
    return result;
  }

  public getLogCount(): number {
    return this.entries.length;
  }

  public getLogCountByTag(tag: string): number {
    return this.getLogsByTag(tag).length;
  }

  public getLogCountByLevel(level: LogLevel): number {
    return this.getLogsByLevel(level).length;
  }

  public containsMessage(message: string): boolean {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].message.includes(message)) {
        return true;
      }
    }
    return false;
  }

  public containsTag(tag: string): boolean {
    return this.getLogsByTag(tag).length > 0;
  }

  public getLevelName(level: LogLevel): string {
    if (level === LogLevel.DEBUG) {
      return 'DEBUG';
    }
    if (level === LogLevel.INFO) {
      return 'INFO';
    }
    if (level === LogLevel.WARN) {
      return 'WARN';
    }
    if (level === LogLevel.ERROR) {
      return 'ERROR';
    }
    if (level === LogLevel.FATAL) {
      return 'FATAL';
    }
    return 'UNKNOWN';
  }

  public formatEntry(entry: LogEntry): string {
    return `${this.getLevelName(entry.level)} ${entry.tag}: ${entry.message}`;
  }

  public formatLatest(): string {
    if (this.entries.length === 0) {
      return '';
    }
    return this.formatEntry(this.entries[this.entries.length - 1]);
  }

  public getDistinctTags(): Set<string> {
    const tags: Set<string> = new Set<string>();
    for (let i = 0; i < this.entries.length; i++) {
      tags.add(this.entries[i].tag);
    }
    return tags;
  }

  public getDistinctLevels(): Set<LogLevel> {
    const levels: Set<LogLevel> = new Set<LogLevel>();
    for (let i = 0; i < this.entries.length; i++) {
      levels.add(this.entries[i].level);
    }
    return levels;
  }

  public getLatestLog(): LogEntry | null {
    if (this.entries.length === 0) {
      return null;
    }
    return this.entries[this.entries.length - 1];
  }

  public getEarliestLog(): LogEntry | null {
    if (this.entries.length === 0) {
      return null;
    }
    return this.entries[0];
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.entries.length; i++) {
      if (this.entries[i].timestamp < this.entries[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public isFull(): boolean {
    return this.entries.length >= this.maxSize;
  }

  public getMaxLogSize(): number {
    return this.maxSize;
  }

  public setMaxLogSize(maxSize: number): void {
    this.maxSize = maxSize > 0 ? maxSize : 1;
  }

  public clear(): void {
    this.entries = [];
    this.duplicateCount = 0;
    this.sequence = 0;
  }

  public generateReport(): string {
    return `log report total=${this.getLogCount()} debug=${this.getLogCountByLevel(LogLevel.DEBUG)} ` +
      `info=${this.getLogCountByLevel(LogLevel.INFO)} warn=${this.getLogCountByLevel(LogLevel.WARN)} ` +
      `error=${this.getLogCountByLevel(LogLevel.ERROR)} fatal=${this.getLogCountByLevel(LogLevel.FATAL)}`;
  }

  public toString(): string {
    return `LogWrapper{count=${this.entries.length}, level=${this.getLevelName(this.currentLevel)}, ` +
      `max=${this.maxSize}, dedup=${this.dedupEnabled}}`;
  }
}

// Formats one entry into the four supported output styles.
class LogFormatter {
  public formatPlain(entry: LogEntry): string {
    return `${this.levelName(entry.level)} ${entry.tag}: ${entry.message}`;
  }

  public formatJson(entry: LogEntry): string {
    return `{"level":"${this.levelName(entry.level)}","tag":"${entry.tag}","message":"${entry.message}"}`;
  }

  public formatStructured(entry: LogEntry): string {
    return `level=${this.levelName(entry.level)}|tag=${entry.tag}|message=${entry.message}`;
  }

  public formatSyslog(entry: LogEntry): string {
    return `<${entry.level}>${entry.tag}[${entry.sequence}]: ${entry.message}`;
  }

  public format(entry: LogEntry, format: LogFormat): string {
    if (format === LogFormat.JSON) {
      return this.formatJson(entry);
    }
    if (format === LogFormat.STRUCTURED) {
      return this.formatStructured(entry);
    }
    if (format === LogFormat.SYSLOG) {
      return this.formatSyslog(entry);
    }
    return this.formatPlain(entry);
  }

  public levelName(level: LogLevel): string {
    if (level === LogLevel.DEBUG) {
      return 'DEBUG';
    }
    if (level === LogLevel.INFO) {
      return 'INFO';
    }
    if (level === LogLevel.WARN) {
      return 'WARN';
    }
    if (level === LogLevel.ERROR) {
      return 'ERROR';
    }
    if (level === LogLevel.FATAL) {
      return 'FATAL';
    }
    return 'UNKNOWN';
  }

  public isAsciiText(text: string): boolean {
    for (let i = 0; i < text.length; i++) {
      const code = text.charCodeAt(i);
      const printable = code >= 32 && code <= 126;
      const whitespace = code === 9 || code === 10 || code === 13;
      if (!printable && !whitespace) {
        return false;
      }
    }
    return true;
  }

}

// Rotates the buffered entries when the capacity is exceeded.
class LogRotator {
  private policy: LogRotationPolicy;
  private maxEntries: number;
  private entries: Array<LogEntry> = [];

  public constructor(policy: LogRotationPolicy, maxEntries: number) {
    this.policy = policy;
    this.maxEntries = maxEntries > 0 ? maxEntries : 1;
  }

  public addEntry(entry: LogEntry): void {
    this.entries.push(entry);
    if (this.entries.length > this.maxEntries) {
      this.rotate();
    }
  }

  public getEntries(): Array<LogEntry> {
    return [...this.entries];
  }

  public getEntryCount(): number {
    return this.entries.length;
  }

  public needsRotation(): boolean {
    return this.entries.length >= this.maxEntries;
  }

  public isRetainingPolicy(): boolean {
    return this.policy !== LogRotationPolicy.NONE;
  }

  private rotate(): void {
    if (this.policy === LogRotationPolicy.NONE) {
      return;
    }
    const overflow = this.entries.length - this.maxEntries;
    this.entries = this.entries.slice(overflow);
  }

  public clear(): void {
    this.entries = [];
  }
}

// Validates the log configuration before the buffer is created.
class LogConfigValidator {
  private config: LogConfig;

  public constructor(config: LogConfig) {
    this.config = config;
  }

  public isMaxSizeValid(): boolean {
    return this.config.maxSize > 0;
  }

  public isBufferSizeValid(): boolean {
    return this.config.bufferSize > 0;
  }

  public isDedupConsistent(): boolean {
    return !this.config.dedupEnabled || this.config.bufferSize > 0;
  }

  public isValid(): boolean {
    return this.isMaxSizeValid() && this.isBufferSizeValid() && this.isDedupConsistent();
  }

  public generateValidationReport(): string {
    return `LogConfig{format=${this.config.format}, rotation=${this.config.rotationPolicy}, ` +
      `maxSize=${this.config.maxSize}, buffer=${this.config.bufferSize}, ` +
      `async=${this.config.asyncWrite}, dedup=${this.config.dedupEnabled}}`;
  }
}

export default function loggerValidationSuite(): void {
  describe('LoggerValidation_Suite', () => {
    let driver: Driver;
    let logger: LogWrapper;

    beforeAll(async () => {
      driver = getDriver();
      logger = LogWrapper.getInstance();
      logger.clear();
      logger.setLogLevel(LogLevel.DEBUG);
      Log.info(TAG, 'suite start');
      await serializedDelay(driver, 800);
    });

    afterAll(async () => {
      Log.info(TAG, 'suite end');
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 300);
    });

    it('log_level_enum_should_be_defined_correctly', 0, async () => {
      expect(LogLevel.DEBUG).assertEqual(0);
      expect(LogLevel.INFO).assertEqual(1);
      expect(LogLevel.WARN).assertEqual(2);
      expect(LogLevel.ERROR).assertEqual(3);
      expect(LogLevel.FATAL).assertEqual(4);
      expect(LogLevel.FATAL > LogLevel.DEBUG).assertTrue();
    });

    it('log_format_and_rotation_enums_should_be_defined', 0, async () => {
      expect(LogFormat.PLAIN).assertEqual('plain');
      expect(LogFormat.JSON).assertEqual('json');
      expect(LogFormat.STRUCTURED).assertEqual('structured');
      expect(LogFormat.SYSLOG).assertEqual('syslog');
      expect(LogRotationPolicy.NONE).assertEqual('none');
      expect(LogRotationPolicy.SIZE_BASED).assertEqual('size_based');
      expect(LogRotationPolicy.COUNT_BASED).assertEqual('count_based');
    });

    it('basic_write_should_store_all_five_levels', 0, async () => {
      logger.clear();
      logger.setLogLevel(LogLevel.DEBUG);
      logger.setDedupEnabled(false);
      logger.debug('IndexPage', 'debug message for tab focus');
      logger.info('IndexPage', 'info message for tab focus');
      logger.warn('IndexPage', 'warn message for tab focus');
      logger.error('IndexPage', 'error message for tab focus');
      logger.fatal('IndexPage', 'fatal message for tab focus');
      expect(logger.getLogCount()).assertEqual(5);
      expect(logger.containsMessage('debug message for tab focus')).assertTrue();
      expect(logger.containsMessage('fatal message for tab focus')).assertTrue();
      expect(logger.getDistinctLevels().size).assertEqual(5);
    });

    it('level_filter_should_drop_lower_levels', 0, async () => {
      logger.clear();
      logger.setDedupEnabled(false);
      logger.setLogLevel(LogLevel.WARN);
      logger.debug('PlayerPage', 'debug should be filtered');
      logger.info('PlayerPage', 'info should be filtered');
      logger.warn('PlayerPage', 'warn should be stored');
      logger.error('PlayerPage', 'error should be stored');
      logger.fatal('PlayerPage', 'fatal should be stored');
      expect(logger.getLogCount()).assertEqual(3);
      expect(logger.containsMessage('debug should be filtered')).assertFalse();
      expect(logger.containsMessage('info should be filtered')).assertFalse();
      expect(logger.containsMessage('warn should be stored')).assertTrue();
      expect(logger.isLevelEnabled(LogLevel.WARN)).assertTrue();
      expect(logger.isLevelEnabled(LogLevel.INFO)).assertFalse();
    });

    it('dedup_should_suppress_repeated_adjacent_message', 0, async () => {
      logger.clear();
      logger.setLogLevel(LogLevel.DEBUG);
      logger.setDedupEnabled(true);
      logger.info('CastService', 'device attached to session');
      logger.info('CastService', 'device attached to session');
      logger.info('CastService', 'device attached to session');
      expect(logger.getLogCount()).assertEqual(1);
      expect(logger.getDuplicateCount()).assertEqual(2);
      logger.info('CastService', 'device detached from session');
      expect(logger.getLogCount()).assertEqual(2);
      expect(logger.getDuplicateCount()).assertEqual(2);
    });

    it('query_by_level_should_be_accurate', 0, async () => {
      logger.clear();
      logger.setDedupEnabled(false);
      logger.setLogLevel(LogLevel.DEBUG);
      logger.info('TagOne', 'info one');
      logger.error('TagTwo', 'error one');
      logger.info('TagThree', 'info two');
      logger.warn('TagFour', 'warn one');
      logger.error('TagFive', 'error two');
      expect(logger.getLogsByLevel(LogLevel.INFO).length).assertEqual(2);
      expect(logger.getLogsByLevel(LogLevel.ERROR).length).assertEqual(2);
      expect(logger.getLogsByLevel(LogLevel.WARN).length).assertEqual(1);
      expect(logger.getLogsByLevel(LogLevel.DEBUG).length).assertEqual(0);
      expect(logger.getLogCountByLevel(LogLevel.FATAL)).assertEqual(0);
    });

    it('query_by_tag_should_be_accurate', 0, async () => {
      logger.clear();
      logger.setDedupEnabled(false);
      logger.setLogLevel(LogLevel.DEBUG);
      logger.info('IndexPage', 'tab focus moved to settings');
      logger.info('CastService', 'session created');
      logger.info('IndexPage', 'switch turned on');
      logger.error('CastService', 'session create failed');
      logger.info('IndexPage', 'switch turned off');
      expect(logger.getLogsByTag('IndexPage').length).assertEqual(3);
      expect(logger.getLogsByTag('CastService').length).assertEqual(2);
      expect(logger.getLogCountByTag('PlayerPage')).assertEqual(0);
      expect(logger.containsTag('IndexPage')).assertTrue();
      expect(logger.containsTag('PlayerPage')).assertFalse();
    });

    it('level_name_lookup_should_be_complete', 0, async () => {
      expect(logger.getLevelName(LogLevel.DEBUG)).assertEqual('DEBUG');
      expect(logger.getLevelName(LogLevel.INFO)).assertEqual('INFO');
      expect(logger.getLevelName(LogLevel.WARN)).assertEqual('WARN');
      expect(logger.getLevelName(LogLevel.ERROR)).assertEqual('ERROR');
      expect(logger.getLevelName(LogLevel.FATAL)).assertEqual('FATAL');
      expect(logger.getLevelName(9)).assertEqual('UNKNOWN');
    });

    it('clear_should_reset_buffer_and_counters', 0, async () => {
      logger.clear();
      logger.setDedupEnabled(false);
      logger.setLogLevel(LogLevel.DEBUG);
      logger.info('Tag', 'message before clear');
      logger.error('Tag', 'another message before clear');
      expect(logger.getLogCount()).assertEqual(2);
      logger.clear();
      expect(logger.getLogCount()).assertEqual(0);
      expect(logger.getAllLogs().length).assertEqual(0);
      expect(logger.getDuplicateCount()).assertEqual(0);
      expect(logger.getDistinctTags().size).assertEqual(0);
    });

    it('logger_singleton_should_share_state', 0, async () => {
      const first = LogWrapper.getInstance();
      const second = LogWrapper.getInstance();
      expect(first === second).assertTrue();
      first.clear();
      first.setDedupEnabled(false);
      first.info('SingletonTag', 'shared logger state');
      expect(second.getLogCount()).assertEqual(1);
      expect(second.containsMessage('shared logger state')).assertTrue();
      expect(second.toString().includes('dedup=false')).assertTrue();
    });

    it('latest_and_earliest_log_should_be_correct', 0, async () => {
      logger.clear();
      logger.setDedupEnabled(false);
      logger.setLogLevel(LogLevel.DEBUG);
      expect(logger.getLatestLog() === null).assertTrue();
      expect(logger.getEarliestLog() === null).assertTrue();
      logger.info('Tag', 'earliest entry');
      logger.warn('Tag', 'latest entry');
      const earliest = logger.getEarliestLog();
      const latest = logger.getLatestLog();
      expect(earliest === null).assertFalse();
      expect(latest === null).assertFalse();
      if (earliest !== null && latest !== null) {
        expect(earliest.message).assertEqual('earliest entry');
        expect(latest.message).assertEqual('latest entry');
        expect(earliest.sequence).assertEqual(1);
        expect(latest.sequence).assertEqual(2);
      }
    });

    it('report_should_summarize_counts', 0, async () => {
      logger.clear();
      logger.setDedupEnabled(false);
      logger.setLogLevel(LogLevel.DEBUG);
      for (let i = 0; i < 5; i++) {
        logger.debug('ReportTag', `debug entry ${i}`);
      }
      for (let i = 0; i < 4; i++) {
        logger.info('ReportTag', `info entry ${i}`);
      }
      logger.warn('ReportTag', 'warn entry');
      logger.error('ReportTag', 'error entry');
      const report: string = logger.generateReport();
      expect(report.includes('total=11')).assertTrue();
      expect(report.includes('debug=5')).assertTrue();
      expect(report.includes('info=4')).assertTrue();
      expect(report.includes('warn=1')).assertTrue();
      expect(report.includes('error=1')).assertTrue();
      expect(report.includes('fatal=0')).assertTrue();
    });

    it('max_size_should_trim_the_buffer', 0, async () => {
      logger.clear();
      logger.setDedupEnabled(false);
      logger.setLogLevel(LogLevel.DEBUG);
      logger.setMaxLogSize(5);
      expect(logger.getMaxLogSize()).assertEqual(5);
      for (let i = 0; i < 12; i++) {
        logger.info('TrimTag', `trim entry ${i}`);
      }
      expect(logger.getLogCount()).assertEqual(5);
      const logs = logger.getAllLogs();
      expect(logs[0].message).assertEqual('trim entry 7');
      expect(logs[4].message).assertEqual('trim entry 11');
      expect(logger.isFull()).assertTrue();
      logger.setMaxLogSize(0);
      expect(logger.getMaxLogSize()).assertEqual(1);
      logger.setMaxLogSize(10000);
      expect(logger.getMaxLogSize()).assertEqual(10000);
    });

    it('formatter_plain_should_contain_level_and_tag', 0, async () => {
      const formatter = new LogFormatter();
      const entry: LogEntry = {
        level: LogLevel.WARN,
        tag: 'CastService',
        message: 'session paused',
        timestamp: 10,
        sequence: 1
      };
      const text: string = formatter.formatPlain(entry);
      expect(text.includes('WARN')).assertTrue();
      expect(text.includes('CastService')).assertTrue();
      expect(text.includes('session paused')).assertTrue();
    });

    it('formatter_json_should_contain_all_fields', 0, async () => {
      const formatter = new LogFormatter();
      const entry: LogEntry = {
        level: LogLevel.ERROR,
        tag: 'PermissionPage',
        message: 'window load failed',
        timestamp: 20,
        sequence: 2
      };
      const text: string = formatter.formatJson(entry);
      expect(text.includes('"level":"ERROR"')).assertTrue();
      expect(text.includes('"tag":"PermissionPage"')).assertTrue();
      expect(text.includes('"message":"window load failed"')).assertTrue();
      expect(text.startsWith('{')).assertTrue();
      expect(text.endsWith('}')).assertTrue();
    });

    it('formatter_dispatch_should_honor_format', 0, async () => {
      const formatter = new LogFormatter();
      const entry: LogEntry = {
        level: LogLevel.DEBUG,
        tag: 'IndexPage',
        message: 'tab strip ready',
        timestamp: 40,
        sequence: 3
      };
      expect(formatter.format(entry, LogFormat.PLAIN).includes('DEBUG IndexPage')).assertTrue();
      expect(formatter.format(entry, LogFormat.JSON).includes('"tag":"IndexPage"')).assertTrue();
      expect(formatter.format(entry, LogFormat.STRUCTURED).includes('level=DEBUG')).assertTrue();
      expect(formatter.format(entry, LogFormat.SYSLOG).includes('[3]')).assertTrue();
    });

    it('rotator_should_trim_entries_by_policy', 0, async () => {
      const rotator = new LogRotator(LogRotationPolicy.COUNT_BASED, 3);
      for (let i = 0; i < 6; i++) {
        const entry: LogEntry = {
          level: LogLevel.INFO,
          tag: 'RotateTag',
          message: `rotate entry ${i}`,
          timestamp: i,
          sequence: i + 1
        };
        rotator.addEntry(entry);
      }
      expect(rotator.getEntryCount()).assertEqual(3);
      const entries = rotator.getEntries();
      expect(entries[0].message).assertEqual('rotate entry 3');
      expect(entries[2].message).assertEqual('rotate entry 5');
      expect(rotator.isRetainingPolicy()).assertTrue();
    });

    it('rotator_should_report_capacity_and_reset', 0, async () => {
      const rotator = new LogRotator(LogRotationPolicy.SIZE_BASED, 4);
      expect(rotator.needsRotation()).assertFalse();
      rotator.addEntry({
        level: LogLevel.INFO,
        tag: 'RotateTag',
        message: 'capacity entry',
        timestamp: 1,
        sequence: 1
      });
      expect(rotator.needsRotation()).assertFalse();
      for (let i = 0; i < 3; i++) {
        rotator.addEntry({
          level: LogLevel.INFO,
          tag: 'RotateTag',
          message: `capacity entry ${i}`,
          timestamp: i,
          sequence: i + 2
        });
      }
      expect(rotator.needsRotation()).assertTrue();
      rotator.clear();
      expect(rotator.getEntryCount()).assertEqual(0);
      expect(rotator.needsRotation()).assertFalse();
    });

    it('config_validator_should_validate_buffer_sizes', 0, async () => {
      const valid: LogConfig = {
        format: LogFormat.PLAIN,
        rotationPolicy: LogRotationPolicy.COUNT_BASED,
        maxSize: 1000,
        bufferSize: 100,
        asyncWrite: false,
        dedupEnabled: true
      };
      const zeroMax: LogConfig = {
        format: LogFormat.PLAIN,
        rotationPolicy: LogRotationPolicy.NONE,
        maxSize: 0,
        bufferSize: 100,
        asyncWrite: false,
        dedupEnabled: false
      };
      const zeroBuffer: LogConfig = {
        format: LogFormat.JSON,
        rotationPolicy: LogRotationPolicy.NONE,
        maxSize: 100,
        bufferSize: 0,
        asyncWrite: true,
        dedupEnabled: false
      };
      expect(new LogConfigValidator(valid).isMaxSizeValid()).assertTrue();
      expect(new LogConfigValidator(valid).isBufferSizeValid()).assertTrue();
      expect(new LogConfigValidator(valid).isValid()).assertTrue();
      expect(new LogConfigValidator(zeroMax).isValid()).assertFalse();
      expect(new LogConfigValidator(zeroBuffer).isValid()).assertFalse();
    });

    it('config_validator_should_validate_dedup_consistency', 0, async () => {
      const inconsistent: LogConfig = {
        format: LogFormat.PLAIN,
        rotationPolicy: LogRotationPolicy.NONE,
        maxSize: 10,
        bufferSize: 0,
        asyncWrite: false,
        dedupEnabled: true
      };
      const consistent: LogConfig = {
        format: LogFormat.PLAIN,
        rotationPolicy: LogRotationPolicy.NONE,
        maxSize: 10,
        bufferSize: 0,
        asyncWrite: false,
        dedupEnabled: false
      };
      expect(new LogConfigValidator(inconsistent).isDedupConsistent()).assertFalse();
      expect(new LogConfigValidator(inconsistent).isValid()).assertFalse();
      expect(new LogConfigValidator(consistent).isDedupConsistent()).assertTrue();
      expect(new LogConfigValidator(consistent).isValid()).assertFalse();
    });

    it('config_validator_report_should_contain_fields', 0, async () => {
      const config: LogConfig = {
        format: LogFormat.STRUCTURED,
        rotationPolicy: LogRotationPolicy.SIZE_BASED,
        maxSize: 2048,
        bufferSize: 64,
        asyncWrite: true,
        dedupEnabled: true
      };
      const report: string = new LogConfigValidator(config).generateValidationReport();
      expect(report.includes('structured')).assertTrue();
      expect(report.includes('size_based')).assertTrue();
      expect(report.includes('maxSize=2048')).assertTrue();
      expect(report.includes('async=true')).assertTrue();
      expect(report.includes('dedup=true')).assertTrue();
    });

    it('log_messages_with_special_characters_should_be_preserved', 0, async () => {
      logger.clear();
      logger.setDedupEnabled(false);
      logger.setLogLevel(LogLevel.DEBUG);
      logger.info('SpecialTag', 'message with !@#$%^&*()');
      logger.info('SpecialTag', 'message with "quotes" and apostrophe');
      logger.info('SpecialTag', 'message with newline and tab separated');
      expect(logger.getLogCount()).assertEqual(3);
      expect(logger.containsMessage('!@#$%^&*()')).assertTrue();
      expect(logger.containsMessage('"quotes"')).assertTrue();
      expect(logger.isChronological()).assertTrue();
    });

    it('empty_tag_and_message_should_not_break_logger', 0, async () => {
      logger.clear();
      logger.setDedupEnabled(false);
      logger.setLogLevel(LogLevel.DEBUG);
      logger.info('EmptyTagProbe', '');
      logger.info('', 'message without tag');
      logger.info('', '');
      expect(logger.getLogCount()).assertEqual(3);
      expect(logger.getLogsByTag('').length).assertEqual(2);
      expect(logger.containsTag('EmptyTagProbe')).assertTrue();
      const logs = logger.getAllLogs();
      expect(logs[0].message.length).assertEqual(0);
      expect(logs[1].tag.length).assertEqual(0);
    });

    it('logger_performance_should_meet_requirements', 0, async () => {
      logger.clear();
      logger.setDedupEnabled(false);
      logger.setLogLevel(LogLevel.DEBUG);
      logger.setMaxLogSize(6000);
      const startTime = Date.now();
      for (let i = 0; i < 3000; i++) {
        logger.info('PerfTag', `performance message ${i}`);
      }
      const elapsed = Date.now() - startTime;
      expect(elapsed).assertLessOrEqual(5000);
      expect(logger.getLogCount()).assertEqual(3000);
      expect(logger.getDuplicateCount()).assertEqual(0);
    });

    it('comprehensive_logging_scenario_should_cover_all_pages', 0, async () => {
      logger.clear();
      logger.setDedupEnabled(false);
      logger.setLogLevel(LogLevel.DEBUG);
      logger.info('IndexPage', 'index page shown');
      logger.debug('IndexPage', 'tab focus moved to settings tab');
      logger.info('CastService', 'miracast service started');
      logger.info('PermissionPage', 'permission dialog shown for device');
      logger.warn('PermissionPage', 'device requests permanent trust');
      logger.info('PlayerPage', 'player page created with one tile');
      logger.debug('PlayerPage', 'screen bound to player item');
      logger.error('PlayerPage', 'screen bind failed for second tile');
      logger.info('CastService', 'session released after disconnect');
      expect(logger.getLogCount()).assertEqual(9);
      expect(logger.getLogsByTag('IndexPage').length).assertEqual(2);
      expect(logger.getLogsByTag('PermissionPage').length).assertEqual(2);
      expect(logger.getLogsByTag('PlayerPage').length).assertEqual(3);
      expect(logger.getLogsByTag('CastService').length).assertEqual(2);
      expect(logger.getLogsByLevel(LogLevel.INFO).length).assertEqual(5);
      expect(logger.generateReport().includes('total=9')).assertTrue();
    });

    it('device_logging_should_correlate_with_page_state', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      logger.clear();
      logger.setDedupEnabled(false);
      logger.setLogLevel(LogLevel.DEBUG);
      const count = await miracastComponentCount(driver);
      logger.info('DeviceTag', `component count observed ${count}`);
      Log.info(TAG, 'device logging correlation executed');
      expect(logger.getLogCount()).assertEqual(1);
      expect(logger.containsMessage('component count observed')).assertTrue();
      expect(count).assertLargerOrEqual(0);
      expect(logger.formatLatest().includes('INFO DeviceTag')).assertTrue();
    });

    it('logger_report_should_be_readable_english', 0, async () => {
      logger.clear();
      logger.setDedupEnabled(false);
      logger.setLogLevel(LogLevel.DEBUG);
      logger.info('IndexPage', 'index page ready');
      logger.warn('CastService', 'session still connecting');
      const report = logger.generateReport();
      const formatter = new LogFormatter();
      expect(formatter.isAsciiText(report)).assertTrue();
      expect(report.startsWith('log report')).assertTrue();
      expect(report.includes('total=2')).assertTrue();
    });

  });
}
