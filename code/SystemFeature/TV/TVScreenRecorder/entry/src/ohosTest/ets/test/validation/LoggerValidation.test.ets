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
import { delay } from '../shared/RecordingDriver';

// Log levels exposed by the project logger. The numeric values follow the
// hilog severity order so that `level >= minLevel` works as the filter.
enum LoggerLevel {
  DEBUG = 3,
  INFO = 4,
  WARN = 5,
  ERROR = 6,
  FATAL = 7
}

// One captured log record. `prefix` is the module prefix of the project logger
// and `tag` is the business tag such as `[SRManager]-->`.
interface RecorderLogEntry {
  level: LoggerLevel;
  domain: number;
  prefix: string;
  tag: string;
  message: string;
  timestamp: number;
}

// Aggregated metric of a single write, used by the metrics calculator.
interface LogMetrics {
  level: LoggerLevel;
  messageLength: number;
  writeTime: number;
  succeeded: boolean;
}

// Statistics of a captured log buffer.
interface LogStatistics {
  totalEntries: number;
  averageMessageLength: number;
  maxMessageLength: number;
  minMessageLength: number;
  errorCount: number;
  warnCount: number;
}

// Log destination of the project logger. The sample only writes into hilog but
// the model keeps the sink so the configuration is auditable.
enum LogSink {
  HILOG = 'hilog',
  FILE = 'file',
  MEMORY = 'memory'
}

// Rotation policy applied when the buffer exceeds its capacity.
enum LogRotationPolicy {
  NONE = 'none',
  COUNT_BASED = 'count_based'
}

// Configuration of the logger model.
interface LogConfig {
  sink: LogSink;
  rotationPolicy: LogRotationPolicy;
  maxSize: number;
  bufferSize: number;
  asyncWrite: boolean;
}

// Domain and prefix of the production logger (`common/Logger.ets`).
const LOGGER_DOMAIN: number = 0x0001;

const LOGGER_PREFIX: string = '[Sample_ScreenRecorder]';

const LOGGER_FORMAT: string = '%{public}s, %{public}s';

// Model of the project logger. It exposes the same API surface as
// `common/Logger.ets` (debug / info / warn / error / fatal / isLoggable) plus
// the query helpers that the validation scenarios need.
class RecorderLoggerModel {
  private static instance: RecorderLoggerModel;
  private domain: number = LOGGER_DOMAIN;
  private prefix: string = LOGGER_PREFIX;
  private format: string = LOGGER_FORMAT;
  private minLevel: LoggerLevel = LoggerLevel.DEBUG;
  private entries: RecorderLogEntry[] = [];
  private maxEntries: number = 10000;

  public static getInstance(): RecorderLoggerModel {
    if (!RecorderLoggerModel.instance) {
      RecorderLoggerModel.instance = new RecorderLoggerModel();
    }
    return RecorderLoggerModel.instance;
  }

  public getDomain(): number {
    return this.domain;
  }

  public getPrefix(): string {
    return this.prefix;
  }

  public getFormat(): string {
    return this.format;
  }

  public setMinLevel(level: LoggerLevel): void {
    this.minLevel = level;
  }

  public getMinLevel(): LoggerLevel {
    return this.minLevel;
  }

  // Mirrors `hilog.isLoggable(domain, prefix, level)`.
  public isLoggable(level: number): boolean {
    if (!Number.isInteger(level)) {
      return false;
    }
    return level >= this.minLevel && level <= LoggerLevel.FATAL;
  }

  public debug(tag: string, message: string): void {
    this.write(LoggerLevel.DEBUG, tag, message);
  }

  public info(tag: string, message: string): void {
    this.write(LoggerLevel.INFO, tag, message);
  }

  public warn(tag: string, message: string): void {
    this.write(LoggerLevel.WARN, tag, message);
  }

  public error(tag: string, message: string): void {
    this.write(LoggerLevel.ERROR, tag, message);
  }

  public fatal(tag: string, message: string): void {
    this.write(LoggerLevel.FATAL, tag, message);
  }

  private write(level: LoggerLevel, tag: string, message: string): void {
    if (!this.isLoggable(level)) {
      return;
    }
    const entry: RecorderLogEntry = {
      level: level,
      domain: this.domain,
      prefix: this.prefix,
      tag: tag,
      message: message,
      timestamp: Date.now()
    };
    this.entries.push(entry);
    if (this.entries.length > this.maxEntries) {
      this.entries.splice(0, this.entries.length - this.maxEntries);
    }
  }

  public getAllLogs(): RecorderLogEntry[] {
    const copied: RecorderLogEntry[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      copied.push(this.entries[i]);
    }
    return copied;
  }

  public getLogsByLevel(level: LoggerLevel): RecorderLogEntry[] {
    return this.entries.filter((entry: RecorderLogEntry) => entry.level === level);
  }

  public getLogsByTag(tag: string): RecorderLogEntry[] {
    return this.entries.filter((entry: RecorderLogEntry) => entry.tag === tag);
  }

  public getLogsByPrefix(prefix: string): RecorderLogEntry[] {
    return this.entries.filter((entry: RecorderLogEntry) => entry.prefix === prefix);
  }

  public getLogsByTimeRange(startTime: number, endTime: number): RecorderLogEntry[] {
    return this.entries.filter((entry: RecorderLogEntry) => entry.timestamp >= startTime && entry.timestamp <= endTime);
  }

  public getLogCount(): number {
    return this.entries.length;
  }

  public clearLogs(): void {
    this.entries = [];
  }

  public containsMessage(message: string): boolean {
    return this.entries.some((entry: RecorderLogEntry) => entry.message.includes(message));
  }

  public getLevelName(level: LoggerLevel): string {
    if (level === LoggerLevel.DEBUG) {
      return 'DEBUG';
    }
    if (level === LoggerLevel.INFO) {
      return 'INFO';
    }
    if (level === LoggerLevel.WARN) {
      return 'WARN';
    }
    if (level === LoggerLevel.ERROR) {
      return 'ERROR';
    }
    if (level === LoggerLevel.FATAL) {
      return 'FATAL';
    }
    return 'UNKNOWN';
  }

  // The report is the textual summary asserted by the report scenario.
  public generateLogReport(): string {
    const debugCount = this.getLogsByLevel(LoggerLevel.DEBUG).length;
    const infoCount = this.getLogsByLevel(LoggerLevel.INFO).length;
    const warnCount = this.getLogsByLevel(LoggerLevel.WARN).length;
    const errorCount = this.getLogsByLevel(LoggerLevel.ERROR).length;
    const fatalCount = this.getLogsByLevel(LoggerLevel.FATAL).length;
    return 'log report total=' + this.getLogCount() + ' DEBUG=' + debugCount + ' INFO=' + infoCount +
      ' WARN=' + warnCount + ' ERROR=' + errorCount + ' FATAL=' + fatalCount;
  }

  public getAverageMessageLength(): number {
    if (this.entries.length === 0) {
      return 0;
    }
    let total = 0;
    for (let i = 0; i < this.entries.length; i++) {
      total += this.entries[i].message.length;
    }
    return total / this.entries.length;
  }

  public getLogCountByTag(tag: string): number {
    return this.getLogsByTag(tag).length;
  }

  public getLatestLog(): RecorderLogEntry | undefined {
    if (this.entries.length === 0) {
      return undefined;
    }
    return this.entries[this.entries.length - 1];
  }

  public getEarliestLog(): RecorderLogEntry | undefined {
    if (this.entries.length === 0) {
      return undefined;
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

  public getDistinctTags(): Set<string> {
    const tags = new Set<string>();
    for (let i = 0; i < this.entries.length; i++) {
      tags.add(this.entries[i].tag);
    }
    return tags;
  }

  public getDistinctLevels(): Set<LoggerLevel> {
    const levels = new Set<LoggerLevel>();
    for (let i = 0; i < this.entries.length; i++) {
      levels.add(this.entries[i].level);
    }
    return levels;
  }

  public getMaxEntries(): number {
    return this.maxEntries;
  }

  public setMaxEntries(maxEntries: number): void {
    this.maxEntries = maxEntries;
    if (this.entries.length > maxEntries) {
      this.entries.splice(0, this.entries.length - maxEntries);
    }
  }

  public isFull(): boolean {
    return this.entries.length >= this.maxEntries;
  }

  public resetLogger(): void {
    this.entries = [];
    this.minLevel = LoggerLevel.DEBUG;
    this.maxEntries = 10000;
  }

  public getConfig(): LogConfig {
    const config: LogConfig = {
      sink: LogSink.HILOG,
      rotationPolicy: LogRotationPolicy.COUNT_BASED,
      maxSize: this.maxEntries,
      bufferSize: 4096,
      asyncWrite: false
    };
    return config;
  }
}
// Buffered rotator used by the count based rotation policy.
class LogRotator {
  private policy: LogRotationPolicy;
  private maxEntries: number;
  private entries: RecorderLogEntry[] = [];

  constructor(policy: LogRotationPolicy, maxEntries: number) {
    this.policy = policy;
    this.maxEntries = maxEntries;
  }

  public addEntry(entry: RecorderLogEntry): void {
    this.entries.push(entry);
    if (this.entries.length > this.maxEntries) {
      this.rotate();
    }
  }

  public getEntries(): RecorderLogEntry[] {
    const copied: RecorderLogEntry[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      copied.push(this.entries[i]);
    }
    return copied;
  }

  public getEntryCount(): number {
    return this.entries.length;
  }

  public needsRotation(): boolean {
    return this.entries.length >= this.maxEntries;
  }

  public clear(): void {
    this.entries = [];
  }

  private rotate(): void {
    if (this.policy === LogRotationPolicy.NONE) {
      return;
    }
    const overflow = this.entries.length - this.maxEntries;
    if (overflow > 0) {
      this.entries.splice(0, overflow);
    }
  }
}

// Immediate configuration validator of the logger model.
class LogConfigValidator {
  private config: LogConfig;

  constructor(config: LogConfig) {
    this.config = config;
  }

  public isMaxSizeValid(): boolean {
    return this.config.maxSize > 0;
  }

  public isBufferSizeValid(): boolean {
    return this.config.bufferSize > 0;
  }

  public isValid(): boolean {
    return this.isMaxSizeValid() && this.isBufferSizeValid();
  }

  public generateValidationReport(): string {
    return 'LogConfig(sink=' + this.config.sink + ', rotation=' + this.config.rotationPolicy +
      ', maxSize=' + this.config.maxSize + ', bufferSize=' + this.config.bufferSize + ')';
  }
}

// Reusable log value model with clone / equals semantics.
class LogModel {
  private level: LoggerLevel;
  private tag: string;
  private message: string;
  private timestamp: number;

  constructor() {
    this.level = LoggerLevel.DEBUG;
    this.tag = '';
    this.message = '';
    this.timestamp = 0;
  }

  public setLevel(level: LoggerLevel): void {
    this.level = level;
  }

  public getLevel(): LoggerLevel {
    return this.level;
  }

  public setTag(tag: string): void {
    this.tag = tag;
  }

  public getTag(): string {
    return this.tag;
  }

  public setMessage(message: string): void {
    this.message = message;
  }

  public getMessage(): string {
    return this.message;
  }

  public setTimestamp(timestamp: number): void {
    this.timestamp = timestamp;
  }

  public getTimestamp(): number {
    return this.timestamp;
  }

  // ERROR and FATAL entries require operator attention.
  public isError(): boolean {
    return this.level === LoggerLevel.ERROR || this.level === LoggerLevel.FATAL;
  }

  public hasEmptyMessage(): boolean {
    return this.message.length === 0;
  }

  public clone(): LogModel {
    const copied = new LogModel();
    copied.level = this.level;
    copied.tag = this.tag;
    copied.message = this.message;
    copied.timestamp = this.timestamp;
    return copied;
  }

  public equals(other: LogModel): boolean {
    return this.level === other.level && this.tag === other.tag && this.message === other.message &&
      this.timestamp === other.timestamp;
  }

  public toString(): string {
    return 'LogModel(level=' + this.level + ', tag=' + this.tag + ', message=' + this.message + ')';
  }
}

// Statistics helper over a list of write metrics.
class LogMetricsCalculator {
  private metrics: LogMetrics[];

  constructor(metrics: LogMetrics[]) {
    this.metrics = metrics;
  }

  public averageMessageLength(): number {
    if (this.metrics.length === 0) {
      return 0;
    }
    let total = 0;
    for (let i = 0; i < this.metrics.length; i++) {
      total += this.metrics[i].messageLength;
    }
    return total / this.metrics.length;
  }

  public maxMessageLength(): number {
    let maxValue = 0;
    for (let i = 0; i < this.metrics.length; i++) {
      if (this.metrics[i].messageLength > maxValue) {
        maxValue = this.metrics[i].messageLength;
      }
    }
    return maxValue;
  }

  public minMessageLength(): number {
    if (this.metrics.length === 0) {
      return 0;
    }
    let minValue = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < this.metrics.length; i++) {
      if (this.metrics[i].messageLength < minValue) {
        minValue = this.metrics[i].messageLength;
      }
    }
    return minValue;
  }

  public succeededCount(): number {
    return this.metrics.filter((metric: LogMetrics) => metric.succeeded).length;
  }

  public countByLevel(level: LoggerLevel): number {
    return this.metrics.filter((metric: LogMetrics) => metric.level === level).length;
  }

  public buildStatistics(): LogStatistics {
    const statistics: LogStatistics = {
      totalEntries: this.metrics.length,
      averageMessageLength: this.averageMessageLength(),
      maxMessageLength: this.maxMessageLength(),
      minMessageLength: this.minMessageLength(),
      errorCount: this.countByLevel(LoggerLevel.ERROR),
      warnCount: this.countByLevel(LoggerLevel.WARN)
    };
    return statistics;
  }
}

export default function loggerValidationTest(): void {
  describe('LoggerValidation_Test', () => {
    let logger: RecorderLoggerModel;

    beforeAll(async () => {
      logger = RecorderLoggerModel.getInstance();
      logger.resetLogger();
      await delay(100);
    });

    afterAll(async () => {
      logger.resetLogger();
      await delay(100);
    });

    it('logger_level_enum_should_follow_hilog_severity', 0, () => {
      expect(LoggerLevel.DEBUG).assertEqual(3);
      expect(LoggerLevel.INFO).assertEqual(4);
      expect(LoggerLevel.WARN).assertEqual(5);
      expect(LoggerLevel.ERROR).assertEqual(6);
      expect(LoggerLevel.FATAL).assertEqual(7);
    });

    it('logger_domain_and_prefix_should_match_production', 0, () => {
      expect(logger.getDomain()).assertEqual(0x0001);
      expect(logger.getDomain()).assertEqual(1);
      expect(logger.getPrefix()).assertEqual('[Sample_ScreenRecorder]');
      expect(logger.getFormat()).assertEqual('%{public}s, %{public}s');
    });

    it('logger_initial_state_should_be_empty', 0, () => {
      logger.resetLogger();
      expect(logger.getLogCount()).assertEqual(0);
      expect(logger.getAllLogs().length).assertEqual(0);
      expect(logger.getMinLevel()).assertEqual(LoggerLevel.DEBUG);
      expect(logger.getMaxEntries()).assertEqual(10000);
      expect(logger.getLatestLog()).assertUndefined();
      expect(logger.getEarliestLog()).assertUndefined();
    });
    it('basic_logging_should_write_all_levels', 0, () => {
      logger.resetLogger();
      logger.debug('[SRManager]-->', 'debug message');
      logger.info('[SRManager]-->', 'info message');
      logger.warn('[ScreenRecorderTimer]-->', 'warn message');
      logger.error('[ScreenRecorderAbility]-->', 'error message');
      logger.fatal('[ScreenRecorderAbility]-->', 'fatal message');
      expect(logger.getLogCount()).assertEqual(5);
      expect(logger.containsMessage('debug message')).assertTrue();
      expect(logger.containsMessage('fatal message')).assertTrue();
      expect(logger.getLogsByLevel(LoggerLevel.INFO).length).assertEqual(1);
      expect(logger.getLogsByLevel(LoggerLevel.ERROR).length).assertEqual(1);
    });

    it('logger_entry_should_carry_domain_and_prefix', 0, () => {
      logger.resetLogger();
      logger.info('[WindowMgr]-->', 'window created');
      const entry = logger.getLatestLog();
      expect(entry?.domain).assertEqual(LOGGER_DOMAIN);
      expect(entry?.prefix).assertEqual(LOGGER_PREFIX);
      expect(entry?.tag).assertEqual('[WindowMgr]-->');
      expect(entry?.message).assertEqual('window created');
      expect(entry?.timestamp).assertLargerOrEqual(0);
      expect(entry?.level).assertEqual(LoggerLevel.INFO);
    });

    it('log_level_filtering_should_suppress_lower_levels', 0, () => {
      logger.resetLogger();
      logger.setMinLevel(LoggerLevel.WARN);
      logger.debug('[Tag]', 'debug message');
      logger.info('[Tag]', 'info message');
      logger.warn('[Tag]', 'warn message');
      logger.error('[Tag]', 'error message');
      logger.fatal('[Tag]', 'fatal message');
      expect(logger.getLogCount()).assertEqual(3);
      expect(logger.containsMessage('warn message')).assertTrue();
      expect(logger.containsMessage('error message')).assertTrue();
      expect(logger.containsMessage('fatal message')).assertTrue();
      expect(logger.containsMessage('debug message')).assertFalse();
      expect(logger.containsMessage('info message')).assertFalse();
    });

    it('is_loggable_should_follow_min_level', 0, () => {
      logger.resetLogger();
      logger.setMinLevel(LoggerLevel.ERROR);
      expect(logger.isLoggable(LoggerLevel.DEBUG)).assertFalse();
      expect(logger.isLoggable(LoggerLevel.INFO)).assertFalse();
      expect(logger.isLoggable(LoggerLevel.ERROR)).assertTrue();
      expect(logger.isLoggable(LoggerLevel.FATAL)).assertTrue();
      expect(logger.isLoggable(LoggerLevel.FATAL + 1)).assertFalse();
      expect(logger.isLoggable(3.5)).assertFalse();
    });

    it('query_logs_by_level_should_return_correct_entries', 0, () => {
      logger.resetLogger();
      logger.info('[Tag1]', 'info one');
      logger.error('[Tag2]', 'error one');
      logger.info('[Tag3]', 'info two');
      logger.warn('[Tag4]', 'warn one');
      logger.error('[Tag5]', 'error two');
      expect(logger.getLogsByLevel(LoggerLevel.INFO).length).assertEqual(2);
      expect(logger.getLogsByLevel(LoggerLevel.ERROR).length).assertEqual(2);
      expect(logger.getLogsByLevel(LoggerLevel.WARN).length).assertEqual(1);
      expect(logger.getLogsByLevel(LoggerLevel.DEBUG).length).assertEqual(0);
      expect(logger.getLogsByLevel(LoggerLevel.FATAL).length).assertEqual(0);
    });

    it('tag_filtering_should_be_accurate', 0, () => {
      logger.resetLogger();
      logger.info('[SRManager]-->', 'start recording');
      logger.info('[WindowMgr]-->', 'timer window created');
      logger.info('[SRManager]-->', 'stop recording');
      logger.error('[WindowMgr]-->', 'tip window failed');
      expect(logger.getLogsByTag('[SRManager]-->').length).assertEqual(2);
      expect(logger.getLogsByTag('[WindowMgr]-->').length).assertEqual(2);
      expect(logger.getLogsByTag('[InputConsumer]-->').length).assertEqual(0);
      expect(logger.getLogCountByTag('[SRManager]-->')).assertEqual(2);
      expect(logger.getDistinctTags().size).assertEqual(2);
    });

    it('prefix_filtering_should_match_project_prefix', 0, () => {
      logger.resetLogger();
      logger.info('[SRManager]-->', 'one');
      logger.warn('[ScreenRecorderAbility]-->', 'two');
      expect(logger.getLogsByPrefix(LOGGER_PREFIX).length).assertEqual(2);
      expect(logger.getLogsByPrefix('[Other]').length).assertEqual(0);
      logger.resetLogger();
      logger.info('[SRManager]-->', 'no capture');
      expect(logger.getLogsByPrefix(LOGGER_PREFIX).length).assertEqual(1);
    });

    it('query_logs_by_time_range_should_return_correct_entries', 0, async () => {
      logger.resetLogger();
      const startTime = Date.now();
      logger.info('[Tag]', 'message one');
      await delay(30);
      logger.info('[Tag]', 'message two');
      await delay(30);
      logger.info('[Tag]', 'message three');
      const endTime = Date.now();
      expect(logger.getLogsByTimeRange(startTime, endTime).length).assertEqual(3);
      expect(logger.getLogsByTimeRange(startTime + 1000, endTime + 1000).length).assertEqual(0);
    });

    it('level_name_lookup_should_return_expected_names', 0, () => {
      expect(logger.getLevelName(LoggerLevel.DEBUG)).assertEqual('DEBUG');
      expect(logger.getLevelName(LoggerLevel.INFO)).assertEqual('INFO');
      expect(logger.getLevelName(LoggerLevel.WARN)).assertEqual('WARN');
      expect(logger.getLevelName(LoggerLevel.ERROR)).assertEqual('ERROR');
      expect(logger.getLevelName(LoggerLevel.FATAL)).assertEqual('FATAL');
    });

    it('log_report_should_summarise_level_counts', 0, () => {
      logger.resetLogger();
      for (let i = 0; i < 5; i++) {
        logger.debug('[Tag]', 'debug ' + i);
      }
      for (let i = 0; i < 10; i++) {
        logger.info('[Tag]', 'info ' + i);
      }
      for (let i = 0; i < 3; i++) {
        logger.warn('[Tag]', 'warn ' + i);
      }
      for (let i = 0; i < 2; i++) {
        logger.error('[Tag]', 'error ' + i);
      }
      const report = logger.generateLogReport();
      expect(report.includes('total=20')).assertTrue();
      expect(report.includes('DEBUG=5')).assertTrue();
      expect(report.includes('INFO=10')).assertTrue();
      expect(report.includes('WARN=3')).assertTrue();
      expect(report.includes('ERROR=2')).assertTrue();
      expect(report.includes('FATAL=0')).assertTrue();
    });

    it('log_size_limit_should_be_enforced', 0, () => {
      logger.resetLogger();
      logger.setMaxEntries(100);
      for (let i = 0; i < 250; i++) {
        logger.info('[Tag]', 'message ' + i);
      }
      expect(logger.getLogCount()).assertEqual(100);
      const logs = logger.getAllLogs();
      expect(logs[logs.length - 1].message).assertEqual('message 249');
      expect(logs[0].message).assertEqual('message 150');
      expect(logger.isFull()).assertTrue();
    });

    it('clear_logs_should_remove_all_entries', 0, () => {
      logger.resetLogger();
      logger.info('[Tag]', 'one');
      logger.error('[Tag]', 'two');
      expect(logger.getLogCount()).assertEqual(2);
      logger.clearLogs();
      expect(logger.getLogCount()).assertEqual(0);
      expect(logger.getAllLogs().length).assertEqual(0);
      expect(logger.getLatestLog()).assertUndefined();
    });

    it('log_entry_timestamps_should_be_chronological', 0, async () => {
      logger.resetLogger();
      logger.info('[Tag]', 'first');
      await delay(20);
      logger.info('[Tag]', 'second');
      await delay(20);
      logger.info('[Tag]', 'third');
      const logs = logger.getAllLogs();
      expect(logs[0].timestamp).assertLessOrEqual(logs[1].timestamp);
      expect(logs[1].timestamp).assertLessOrEqual(logs[2].timestamp);
      expect(logger.isChronological()).assertTrue();
    });

    it('logger_singleton_should_return_same_instance', 0, () => {
      const first = RecorderLoggerModel.getInstance();
      const second = RecorderLoggerModel.getInstance();
      expect(first === second).assertTrue();
      first.resetLogger();
      first.info('[Tag]', 'shared state');
      expect(second.getLogCount()).assertEqual(1);
      expect(second.containsMessage('shared state')).assertTrue();
    });

    it('level_switching_should_affect_logging_behaviour', 0, () => {
      logger.resetLogger();
      logger.setMinLevel(LoggerLevel.DEBUG);
      logger.debug('[Tag]', 'debug one');
      logger.info('[Tag]', 'info one');
      expect(logger.getLogCount()).assertEqual(2);
      logger.setMinLevel(LoggerLevel.ERROR);
      logger.debug('[Tag]', 'debug two');
      logger.info('[Tag]', 'info two');
      logger.error('[Tag]', 'error one');
      expect(logger.getLogCount()).assertEqual(3);
      expect(logger.containsMessage('debug two')).assertFalse();
      expect(logger.containsMessage('error one')).assertTrue();
    });

    it('special_characters_should_be_preserved_in_messages', 0, () => {
      logger.resetLogger();
      logger.info('[Tag]', 'message with !@#$%^&*()');
      logger.info('[Tag]', 'message with 特殊字符');
      logger.info('[Tag]', 'message with "quotes"');
      expect(logger.getLogCount()).assertEqual(3);
      expect(logger.containsMessage('!@#$%^&*()')).assertTrue();
      expect(logger.containsMessage('特殊字符')).assertTrue();
      expect(logger.containsMessage('"quotes"')).assertTrue();
    });

    it('distinct_levels_should_be_tracked', 0, () => {
      logger.resetLogger();
      logger.info('[Tag]', 'one');
      logger.info('[Tag]', 'two');
      logger.warn('[Tag]', 'three');
      expect(logger.getDistinctLevels().size).assertEqual(2);
      expect(logger.getDistinctLevels().has(LoggerLevel.INFO)).assertTrue();
      expect(logger.getDistinctLevels().has(LoggerLevel.ERROR)).assertFalse();
      expect(logger.getAverageMessageLength()).assertLarger(0);
    });
    it('log_entry_data_structure_should_be_complete', 0, () => {
      logger.resetLogger();
      logger.info('[StructTag]', 'structure test');
      const logs = logger.getAllLogs();
      expect(logs.length).assertEqual(1);
      expect(logs[0].level).assertEqual(LoggerLevel.INFO);
      expect(logs[0].tag).assertEqual('[StructTag]');
      expect(logs[0].message).assertEqual('structure test');
      expect(logs[0].domain).assertEqual(1);
      expect(logs[0].prefix).assertEqual('[Sample_ScreenRecorder]');
      expect(logs[0].timestamp).assertLargerOrEqual(0);
    });

    it('logger_should_recover_from_abnormal_states', 0, () => {
      logger.resetLogger();
      logger.info('[Tag]', 'normal one');
      logger.info('[Tag]', '');
      logger.info('', 'empty tag message');
      expect(logger.getLogCount()).assertEqual(3);
      logger.info('[Tag]', 'normal two');
      expect(logger.getLogCount()).assertEqual(4);
      logger.setMinLevel(LoggerLevel.DEBUG);
      expect(logger.isLoggable(LoggerLevel.DEBUG)).assertTrue();
    });

    it('log_model_should_clone_and_compare', 0, () => {
      const model = new LogModel();
      expect(model.hasEmptyMessage()).assertTrue();
      model.setLevel(LoggerLevel.ERROR);
      model.setTag('[SRManager]-->');
      model.setMessage('recording failed');
      model.setTimestamp(1000);
      expect(model.isError()).assertTrue();
      expect(model.hasEmptyMessage()).assertFalse();
      const copied = model.clone();
      expect(copied.equals(model)).assertTrue();
      copied.setMessage('changed');
      expect(copied.equals(model)).assertFalse();
      expect(model.toString().includes('recording failed')).assertTrue();
    });

    it('log_rotator_should_keep_latest_entries', 0, () => {
      const rotator = new LogRotator(LogRotationPolicy.COUNT_BASED, 3);
      for (let i = 0; i < 6; i++) {
        const entry: RecorderLogEntry = {
          level: LoggerLevel.INFO,
          domain: LOGGER_DOMAIN,
          prefix: LOGGER_PREFIX,
          tag: '[Tag]',
          message: 'entry ' + i,
          timestamp: i
        };
        rotator.addEntry(entry);
      }
      expect(rotator.getEntryCount()).assertEqual(3);
      expect(rotator.getEntries()[0].message).assertEqual('entry 3');
      expect(rotator.needsRotation()).assertTrue();
      rotator.clear();
      expect(rotator.getEntryCount()).assertEqual(0);
    });

    it('log_config_validator_should_validate_limits', 0, () => {
      const validConfig: LogConfig = {
        sink: LogSink.HILOG,
        rotationPolicy: LogRotationPolicy.COUNT_BASED,
        maxSize: 10000,
        bufferSize: 4096,
        asyncWrite: false
      };
      const validator = new LogConfigValidator(validConfig);
      expect(validator.isMaxSizeValid()).assertTrue();
      expect(validator.isBufferSizeValid()).assertTrue();
      expect(validator.isValid()).assertTrue();
      expect(validator.generateValidationReport().includes('hilog')).assertTrue();
      const invalidConfig: LogConfig = {
        sink: LogSink.MEMORY,
        rotationPolicy: LogRotationPolicy.NONE,
        maxSize: 0,
        bufferSize: 0,
        asyncWrite: true
      };
      expect(new LogConfigValidator(invalidConfig).isValid()).assertFalse();
    });

    it('log_metrics_calculator_should_aggregate', 0, () => {
      const first: LogMetrics = { level: LoggerLevel.INFO, messageLength: 10, writeTime: 1, succeeded: true };
      const second: LogMetrics = { level: LoggerLevel.ERROR, messageLength: 20, writeTime: 2, succeeded: true };
      const third: LogMetrics = { level: LoggerLevel.WARN, messageLength: 5, writeTime: 3, succeeded: false };
      const metrics: LogMetrics[] = [first, second, third];
      const calculator = new LogMetricsCalculator(metrics);
      expect(calculator.averageMessageLength()).assertEqual(35 / 3);
      expect(calculator.maxMessageLength()).assertEqual(20);
      expect(calculator.minMessageLength()).assertEqual(5);
      expect(calculator.succeededCount()).assertEqual(2);
      expect(calculator.countByLevel(LoggerLevel.INFO)).assertEqual(1);
      const statistics = calculator.buildStatistics();
      expect(statistics.totalEntries).assertEqual(3);
      expect(statistics.errorCount).assertEqual(1);
      expect(statistics.warnCount).assertEqual(1);
      expect(new LogMetricsCalculator([]).averageMessageLength()).assertEqual(0);
    });

    it('logger_config_should_be_readable', 0, () => {
      logger.resetLogger();
      const config = logger.getConfig();
      expect(config.sink).assertEqual(LogSink.HILOG);
      expect(config.rotationPolicy).assertEqual(LogRotationPolicy.COUNT_BASED);
      expect(config.maxSize).assertEqual(10000);
      expect(config.bufferSize).assertEqual(4096);
      expect(config.asyncWrite).assertFalse();
    });

    it('logger_performance_should_meet_requirements', 0, () => {
      logger.resetLogger();
      logger.setMaxEntries(6000);
      const startTime = Date.now();
      for (let i = 0; i < 5000; i++) {
        logger.info('[PerfTag]', 'performance message ' + i);
      }
      const elapsed = Date.now() - startTime;
      expect(elapsed).assertLessOrEqual(5000);
      expect(logger.getLogCount()).assertEqual(5000);
      expect(logger.isChronological()).assertTrue();
    });

    it('comprehensive_logging_scenario_should_demonstrate_full_functionality', 0, () => {
      logger.resetLogger();
      logger.info('[SRManager]-->', 'recording started');
      logger.debug('[SRManager]-->', 'video asset created');
      logger.info('[WindowMgr]-->', 'timer window opened');
      logger.debug('[WindowMgr]-->', 'window focusable set to false');
      logger.info('[InputConsumer]-->', 'stop combination detected');
      logger.warn('[SRManager]-->', 'recording takes longer than expected');
      logger.info('[WindowMgr]-->', 'tip window reused');
      logger.error('[SRManager]-->', 'recording completed with warnings');
      expect(logger.getLogCount()).assertEqual(8);
      expect(logger.getLogsByTag('[SRManager]-->').length).assertEqual(4);
      expect(logger.getLogsByTag('[WindowMgr]-->').length).assertEqual(3);
      expect(logger.getLogsByTag('[InputConsumer]-->').length).assertEqual(1);
      expect(logger.getLogsByLevel(LoggerLevel.DEBUG).length).assertEqual(2);
      expect(logger.getLogsByLevel(LoggerLevel.INFO).length).assertEqual(4);
      expect(logger.getLogsByLevel(LoggerLevel.WARN).length).assertEqual(1);
      expect(logger.getLogsByLevel(LoggerLevel.ERROR).length).assertEqual(1);
      expect(logger.generateLogReport().includes('total=8')).assertTrue();
      expect(logger.getDistinctTags().size).assertEqual(3);
    });
  });
}



