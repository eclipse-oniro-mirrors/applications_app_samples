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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  TIMEOUT_PAGE_TRANSITION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  pressAndWait
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Log domain and tag of the production Logger, they are re-declared here because the test
// suite must not import from the main source tree.
const LOG_DOMAIN: number = 0xFF00;
const LOG_TAG: string = '[Sample_Assessment]';

// Privacy marker of the production Logger, every message is passed with this placeholder.
const PUBLIC_PLACEHOLDER: string = '%{public}s';
const PRIVATE_PLACEHOLDER: string = '%{private}s';
const NUMBER_PLACEHOLDER: string = '%{public}d';

// Message length caps.
const MAX_MESSAGE_LENGTH: number = 1024;
const TRUNCATED_SUFFIX: string = '...';
const MAX_RING_LINES: number = 50;

// Hex rendering of the domain.
const DOMAIN_HEX_WIDTH: number = 6;

/**
 * Severity of a log line.
 */
enum LogLevel {
  DEBUG = 0,
  INFO = 1,
  WARN = 2,
  ERROR = 3
}

/**
 * Destination of a log line.
 */
enum LogSink {
  HILOG = 'hilog',
  BUFFER = 'buffer',
  DROPPED = 'dropped'
}

/**
 * One rendered log line.
 */
interface LogLine {
  level: LogLevel;
  domain: number;
  tag: string;
  message: string;
  rendered: string;
  timestamp: number;
}

/**
 * Result of one log call.
 */
interface EmitResult {
  accepted: boolean;
  sink: LogSink;
  level: LogLevel;
  renderedLength: number;
}

/**
 * Filter configuration of the logger.
 */
interface LogFilter {
  minimumLevel: LogLevel;
  enabledTags: string[];
  includeDebug: boolean;
}

/**
 * Statistics of the logger.
 */
interface LogStatistics {
  total: number;
  debugCount: number;
  infoCount: number;
  warnCount: number;
  errorCount: number;
  droppedCount: number;
}

/**
 * Level ordering and naming helpers.
 */
class LogLevels {
  public static nameOf(level: LogLevel): string {
    if (level === LogLevel.DEBUG) {
      return 'DEBUG';
    }
    if (level === LogLevel.INFO) {
      return 'INFO';
    }
    if (level === LogLevel.WARN) {
      return 'WARN';
    }
    return 'ERROR';
  }

  public static isAtLeast(level: LogLevel, minimum: LogLevel): boolean {
    return level >= minimum;
  }

  public static all(): LogLevel[] {
    return [LogLevel.DEBUG, LogLevel.INFO, LogLevel.WARN, LogLevel.ERROR];
  }

  public static count(): number {
    return 4;
  }

  public static numericOf(level: LogLevel): number {
    return level;
  }

  public static fromNumeric(value: number): LogLevel {
    if (value <= 0) {
      return LogLevel.DEBUG;
    }
    if (value === 1) {
      return LogLevel.INFO;
    }
    if (value === 2) {
      return LogLevel.WARN;
    }
    return LogLevel.ERROR;
  }

  public static severityWeight(level: LogLevel): number {
    if (level === LogLevel.DEBUG) {
      return 1;
    }
    if (level === LogLevel.INFO) {
      return 2;
    }
    if (level === LogLevel.WARN) {
      return 3;
    }
    return 4;
  }

  public static isProblemLevel(level: LogLevel): boolean {
    return level === LogLevel.WARN || level === LogLevel.ERROR;
  }
}

/**
 * Message renderer of the logger.
 *
 * The renderer reproduces the hilog contract of the sample: the domain is rendered as a six
 * digit hex value, the tag is bracketed and the message is prefixed with the level name.
 */
class LogFormatter {
  public formatDomain(domain: number): string {
    const text: string = domain.toString(16).toUpperCase();
    return `0x${text.padStart(DOMAIN_HEX_WIDTH, '0')}`;
  }

  public formatTag(tag: string): string {
    if (tag.startsWith('[') && tag.endsWith(']')) {
      return tag;
    }
    return `[${tag}]`;
  }

  public formatLine(level: LogLevel, domain: number, tag: string, message: string): string {
    return `${LogLevels.nameOf(level)} ${this.formatDomain(domain)} ${this.formatTag(tag)} ${message}`;
  }

  public formatPlaceholder(line: string): string {
    return `${PUBLIC_PLACEHOLDER} ${line}`;
  }

  public formatWithNumber(template: string, value: number): string {
    return template.replace(NUMBER_PLACEHOLDER, `${value}`);
  }

  public isPublicPlaceholder(text: string): boolean {
    return text.indexOf(PUBLIC_PLACEHOLDER) >= 0;
  }

  public isPrivatePlaceholder(text: string): boolean {
    return text.indexOf(PRIVATE_PLACEHOLDER) >= 0;
  }

  public replacePrivateWithPublic(text: string): string {
    return text.split(PRIVATE_PLACEHOLDER).join(PUBLIC_PLACEHOLDER);
  }

  public countPlaceholders(text: string): number {
    let count: number = 0;
    let index: number = text.indexOf(PUBLIC_PLACEHOLDER);
    while (index >= 0) {
      count++;
      index = text.indexOf(PUBLIC_PLACEHOLDER, index + PUBLIC_PLACEHOLDER.length);
    }
    return count;
  }

  // The production Logger caps the message length before it hands it to hilog, the tail is
  // replaced by an ellipsis so that the log reader can see the truncation.
  public capMessage(message: string): string {
    if (message.length <= MAX_MESSAGE_LENGTH) {
      return message;
    }
    const keep: number = MAX_MESSAGE_LENGTH - TRUNCATED_SUFFIX.length;
    return `${message.substring(0, keep)}${TRUNCATED_SUFFIX}`;
  }

  public escapedMessage(message: string): string {
    return message.replace('\n', '\\n').replace('\t', '\\t');
  }

  public stripPlaceholders(message: string): string {
    return message.split(PUBLIC_PLACEHOLDER).join('').split(PRIVATE_PLACEHOLDER).join('');
  }
}

/**
 * Ring buffer of the most recent log lines.
 */
class LogRingBuffer {
  private lines: LogLine[] = [];
  private capacity: number;

  public constructor(capacity: number = MAX_RING_LINES) {
    this.capacity = capacity > 0 ? capacity : MAX_RING_LINES;
  }

  public append(line: LogLine): void {
    this.lines.push(line);
    while (this.lines.length > this.capacity) {
      this.lines.shift();
    }
  }

  public size(): number {
    return this.lines.length;
  }

  public capacityLimit(): number {
    return this.capacity;
  }

  public isFull(): boolean {
    return this.lines.length >= this.capacity;
  }

  public getAll(): LogLine[] {
    return this.lines.slice();
  }

  public at(index: number): LogLine | null {
    if (index < 0 || index >= this.lines.length) {
      return null;
    }
    return this.lines[index];
  }

  public latest(): LogLine | null {
    if (this.lines.length === 0) {
      return null;
    }
    return this.lines[this.lines.length - 1];
  }

  public earliest(): LogLine | null {
    if (this.lines.length === 0) {
      return null;
    }
    return this.lines[0];
  }

  public clear(): void {
    this.lines = [];
  }

  public countOf(level: LogLevel): number {
    let count: number = 0;
    for (let i = 0; i < this.lines.length; i++) {
      if (this.lines[i].level === level) {
        count++;
      }
    }
    return count;
  }

  public messagesContaining(fragment: string): string[] {
    const matches: string[] = [];
    for (let i = 0; i < this.lines.length; i++) {
      if (this.lines[i].message.includes(fragment)) {
        matches.push(this.lines[i].message);
      }
    }
    return matches;
  }

  public lastMessage(): string {
    const latest: LogLine | null = this.latest();
    if (latest === null) {
      return '';
    }
    return latest.message;
  }
}

/**
 * Level filter of the logger.
 */
class LogFilterPolicy {
  private filter: LogFilter;

  public constructor(minimumLevel: LogLevel = LogLevel.DEBUG, enabledTags: string[] = [LOG_TAG]) {
    this.filter = {
      minimumLevel: minimumLevel,
      enabledTags: enabledTags.slice(),
      includeDebug: minimumLevel <= LogLevel.DEBUG
    };
  }

  public getFilter(): LogFilter {
    const copy: LogFilter = {
      minimumLevel: this.filter.minimumLevel,
      enabledTags: this.filter.enabledTags.slice(),
      includeDebug: this.filter.includeDebug
    };
    return copy;
  }

  public setMinimumLevel(level: LogLevel): void {
    this.filter.minimumLevel = level;
    this.filter.includeDebug = level <= LogLevel.DEBUG;
  }

  public getMinimumLevel(): LogLevel {
    return this.filter.minimumLevel;
  }

  public addTag(tag: string): void {
    if (this.filter.enabledTags.indexOf(tag) >= 0) {
      return;
    }
    this.filter.enabledTags.push(tag);
  }

  public removeTag(tag: string): boolean {
    const index: number = this.filter.enabledTags.indexOf(tag);
    if (index < 0) {
      return false;
    }
    this.filter.enabledTags.splice(index, 1);
    return true;
  }

  public isTagEnabled(tag: string): boolean {
    if (this.filter.enabledTags.length === 0) {
      return true;
    }
    return this.filter.enabledTags.indexOf(tag) >= 0;
  }

  public accepts(level: LogLevel, tag: string): boolean {
    if (!LogLevels.isAtLeast(level, this.filter.minimumLevel)) {
      return false;
    }
    if (level === LogLevel.DEBUG && !this.filter.includeDebug) {
      return false;
    }
    return this.isTagEnabled(tag);
  }

  public enabledTagCount(): number {
    return this.filter.enabledTags.length;
  }
}

/**
 * Simulated logger that reproduces the four static helpers of the production utility.
 *
 * The logger never writes to hilog itself, every call is recorded in the ring buffer and
 * the suite asserts the rendered shape of the line instead.
 */
class SampleLogger {
  private formatter: LogFormatter = new LogFormatter();
  private ring: LogRingBuffer;
  private filter: LogFilterPolicy;
  private droppedCount: number = 0;
  private totalCount: number = 0;

  public constructor(capacity: number = MAX_RING_LINES, minimumLevel: LogLevel = LogLevel.DEBUG) {
    this.ring = new LogRingBuffer(capacity);
    this.filter = new LogFilterPolicy(minimumLevel);
  }

  public getRing(): LogRingBuffer {
    return this.ring;
  }

  public getFilter(): LogFilterPolicy {
    return this.filter;
  }

  public debug(message: string): EmitResult {
    return this.emit(LogLevel.DEBUG, message);
  }

  public info(message: string): EmitResult {
    return this.emit(LogLevel.INFO, message);
  }

  public warn(message: string): EmitResult {
    return this.emit(LogLevel.WARN, message);
  }

  public error(message: string): EmitResult {
    return this.emit(LogLevel.ERROR, message);
  }

  private emit(level: LogLevel, message: string): EmitResult {
    this.totalCount++;
    if (!this.filter.accepts(level, LOG_TAG)) {
      this.droppedCount++;
      const dropped: EmitResult = {
        accepted: false,
        sink: LogSink.DROPPED,
        level: level,
        renderedLength: 0
      };
      return dropped;
    }
    const capped: string = this.formatter.capMessage(message);
    const rendered: string = this.formatter.formatLine(level, LOG_DOMAIN, LOG_TAG, capped);
    const line: LogLine = {
      level: level,
      domain: LOG_DOMAIN,
      tag: LOG_TAG,
      message: capped,
      rendered: rendered,
      timestamp: Date.now()
    };
    this.ring.append(line);
    const accepted: EmitResult = {
      accepted: true,
      sink: LogSink.HILOG,
      level: level,
      renderedLength: rendered.length
    };
    return accepted;
  }

  public lineCount(): number {
    return this.ring.size();
  }

  public dropped(): number {
    return this.droppedCount;
  }

  public total(): number {
    return this.totalCount;
  }

  public clear(): void {
    this.ring.clear();
    this.droppedCount = 0;
    this.totalCount = 0;
  }

  public statistics(): LogStatistics {
    const stats: LogStatistics = {
      total: this.totalCount,
      debugCount: this.ring.countOf(LogLevel.DEBUG),
      infoCount: this.ring.countOf(LogLevel.INFO),
      warnCount: this.ring.countOf(LogLevel.WARN),
      errorCount: this.ring.countOf(LogLevel.ERROR),
      droppedCount: this.droppedCount
    };
    return stats;
  }

  public hasMessage(message: string): boolean {
    return this.ring.messagesContaining(message).length > 0;
  }

  public lastRendered(): string {
    const latest: LogLine | null = this.ring.latest();
    if (latest === null) {
      return '';
    }
    return latest.rendered;
  }
}

/**
 * Audits a ring buffer of log lines.
 */
class LogAuditor {
  public isChronological(ring: LogRingBuffer): boolean {
    const lines: LogLine[] = ring.getAll();
    for (let i = 1; i < lines.length; i++) {
      if (lines[i].timestamp < lines[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public allLinesHaveDomain(ring: LogRingBuffer, domain: number): boolean {
    const lines: LogLine[] = ring.getAll();
    for (let i = 0; i < lines.length; i++) {
      if (lines[i].domain !== domain) {
        return false;
      }
    }
    return true;
  }

  public allLinesHaveTag(ring: LogRingBuffer, tag: string): boolean {
    const lines: LogLine[] = ring.getAll();
    for (let i = 0; i < lines.length; i++) {
      if (lines[i].tag !== tag) {
        return false;
      }
    }
    return true;
  }

  public levelsNonDecreasing(ring: LogRingBuffer): boolean {
    const lines: LogLine[] = ring.getAll();
    for (let i = 1; i < lines.length; i++) {
      if (lines[i].level < lines[i - 1].level) {
        return false;
      }
    }
    return true;
  }

  public messagesWithinCap(ring: LogRingBuffer): boolean {
    const lines: LogLine[] = ring.getAll();
    for (let i = 0; i < lines.length; i++) {
      if (lines[i].message.length > MAX_MESSAGE_LENGTH) {
        return false;
      }
    }
    return true;
  }

  public renderedLinesStartWithLevel(ring: LogRingBuffer): boolean {
    const lines: LogLine[] = ring.getAll();
    for (let i = 0; i < lines.length; i++) {
      if (!lines[i].rendered.startsWith(LogLevels.nameOf(lines[i].level))) {
        return false;
      }
    }
    return true;
  }
}

/**
 * Builds synthetic log lines for the aggregations.
 */
class LogLineBuilder {
  public static build(count: number, level: LogLevel): LogLine[] {
    const lines: LogLine[] = [];
    for (let i = 0; i < count; i++) {
      lines.push({
        level: level,
        domain: LOG_DOMAIN,
        tag: LOG_TAG,
        message: `line ${i}`,
        rendered: `${LogLevels.nameOf(level)} 0xFF00 [Sample_Assessment] line ${i}`,
        timestamp: i
      });
    }
    return lines;
  }

  public static buildMixed(): LogLine[] {
    return [
      {
        level: LogLevel.DEBUG,
        domain: LOG_DOMAIN,
        tag: LOG_TAG,
        message: 'debug one',
        rendered: 'DEBUG 0xFF00 [Sample_Assessment] debug one',
        timestamp: 1
      },
      {
        level: LogLevel.INFO,
        domain: LOG_DOMAIN,
        tag: LOG_TAG,
        message: 'info one',
        rendered: 'INFO 0xFF00 [Sample_Assessment] info one',
        timestamp: 2
      },
      {
        level: LogLevel.WARN,
        domain: LOG_DOMAIN,
        tag: LOG_TAG,
        message: 'warn one',
        rendered: 'WARN 0xFF00 [Sample_Assessment] warn one',
        timestamp: 3
      },
      {
        level: LogLevel.ERROR,
        domain: LOG_DOMAIN,
        tag: LOG_TAG,
        message: 'error one',
        rendered: 'ERROR 0xFF00 [Sample_Assessment] error one',
        timestamp: 4
      }
    ];
  }
}

export default function loggerValidationTest() {
  describe('LoggerValidation_Test', () => {
    let driver: Driver;
    let formatter: LogFormatter;
    let auditor: LogAuditor;

    beforeAll(async () => {
      driver = getDriver();
      formatter = new LogFormatter();
      auditor = new LogAuditor();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_TRANSITION);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the four log levels of the production utility.
     * Expectation: the levels are ordered debug, info, warn and error.
     */
    it('Assessment_LoggerLevelOrder_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLevelOrder_001, begin');
      expect(LogLevels.count()).assertEqual(4);
      expect(LogLevels.numericOf(LogLevel.DEBUG)).assertEqual(0);
      expect(LogLevels.numericOf(LogLevel.INFO)).assertEqual(1);
      expect(LogLevels.numericOf(LogLevel.WARN)).assertEqual(2);
      expect(LogLevels.numericOf(LogLevel.ERROR)).assertEqual(3);
      expect(LogLevel.DEBUG < LogLevel.INFO).assertTrue();
      expect(LogLevel.ERROR > LogLevel.WARN).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLevelOrder_001, end');
    });

    /**
     * Scenario: the names of the four levels.
     * Expectation: every level answers its upper case name.
     */
    it('Assessment_LoggerLevelNames_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLevelNames_002, begin');
      expect(LogLevels.nameOf(LogLevel.DEBUG)).assertEqual('DEBUG');
      expect(LogLevels.nameOf(LogLevel.INFO)).assertEqual('INFO');
      expect(LogLevels.nameOf(LogLevel.WARN)).assertEqual('WARN');
      expect(LogLevels.nameOf(LogLevel.ERROR)).assertEqual('ERROR');
      expect(LogLevels.all().length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLevelNames_002, end');
    });

    /**
     * Scenario: the level ordering predicate.
     * Expectation: a level is at least itself and every lower level.
     */
    it('Assessment_LoggerLevelPredicate_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLevelPredicate_003, begin');
      expect(LogLevels.isAtLeast(LogLevel.ERROR, LogLevel.DEBUG)).assertTrue();
      expect(LogLevels.isAtLeast(LogLevel.WARN, LogLevel.INFO)).assertTrue();
      expect(LogLevels.isAtLeast(LogLevel.INFO, LogLevel.WARN)).assertFalse();
      expect(LogLevels.isAtLeast(LogLevel.DEBUG, LogLevel.DEBUG)).assertTrue();
      expect(LogLevels.isAtLeast(LogLevel.WARN, LogLevel.ERROR)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLevelPredicate_003, end');
    });

    /**
     * Scenario: the numeric round trip of the level conversion.
     * Expectation: the conversion is stable for documented values.
     */
    it('Assessment_LoggerLevelRoundTrip_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLevelRoundTrip_004, begin');
      expect(LogLevels.fromNumeric(0)).assertEqual(LogLevel.DEBUG);
      expect(LogLevels.fromNumeric(1)).assertEqual(LogLevel.INFO);
      expect(LogLevels.fromNumeric(2)).assertEqual(LogLevel.WARN);
      expect(LogLevels.fromNumeric(3)).assertEqual(LogLevel.ERROR);
      expect(LogLevels.fromNumeric(-5)).assertEqual(LogLevel.DEBUG);
      expect(LogLevels.fromNumeric(9)).assertEqual(LogLevel.ERROR);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLevelRoundTrip_004, end');
    });

    /**
     * Scenario: the severity weights of the levels.
     * Expectation: the weight increases by one per level.
     */
    it('Assessment_LoggerLevelWeights_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLevelWeights_005, begin');
      expect(LogLevels.severityWeight(LogLevel.DEBUG)).assertEqual(1);
      expect(LogLevels.severityWeight(LogLevel.INFO)).assertEqual(2);
      expect(LogLevels.severityWeight(LogLevel.WARN)).assertEqual(3);
      expect(LogLevels.severityWeight(LogLevel.ERROR)).assertEqual(4);
      expect(LogLevels.severityWeight(LogLevel.ERROR) >
        LogLevels.severityWeight(LogLevel.DEBUG)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLevelWeights_005, end');
    });

    /**
     * Scenario: the problem level predicate.
     * Expectation: only warn and error count as problem levels.
     */
    it('Assessment_LoggerProblemLevels_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerProblemLevels_006, begin');
      expect(LogLevels.isProblemLevel(LogLevel.WARN)).assertTrue();
      expect(LogLevels.isProblemLevel(LogLevel.ERROR)).assertTrue();
      expect(LogLevels.isProblemLevel(LogLevel.INFO)).assertFalse();
      expect(LogLevels.isProblemLevel(LogLevel.DEBUG)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerProblemLevels_006, end');
    });

    /**
     * Scenario: the domain formatting of the logger.
     * Expectation: the domain renders as six hex digits with the 0x prefix.
     */
    it('Assessment_LoggerDomainFormat_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerDomainFormat_007, begin');
      expect(LOG_DOMAIN).assertEqual(0xFF00);
      expect(formatter.formatDomain(LOG_DOMAIN)).assertEqual('0x00FF00');
      expect(formatter.formatDomain(0)).assertEqual('0x000000');
      expect(formatter.formatDomain(0xFFFFFF)).assertEqual('0xFFFFFF');
      expect(formatter.formatDomain(0xF811)).assertEqual('0x00F811');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerDomainFormat_007, end');
    });

    /**
     * Scenario: the tag formatting of the logger.
     * Expectation: an unbracketed tag is bracketed exactly once.
     */
    it('Assessment_LoggerTagFormat_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerTagFormat_008, begin');
      expect(formatter.formatTag('Sample_Assessment')).assertEqual('[Sample_Assessment]');
      expect(formatter.formatTag(LOG_TAG)).assertEqual(LOG_TAG);
      expect(LOG_TAG).assertEqual('[Sample_Assessment]');
      expect(LOG_TAG.length).assertEqual(19);
      expect(formatter.formatTag(LOG_TAG)).assertEqual(LOG_TAG);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerTagFormat_008, end');
    });

    /**
     * Scenario: a fully rendered log line.
     * Expectation: the line starts with the level, then the domain and the tag.
     */
    it('Assessment_LoggerLineFormat_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLineFormat_009, begin');
      const line: string = formatter.formatLine(LogLevel.INFO, LOG_DOMAIN, LOG_TAG, 'begin called');
      expect(line).assertEqual('INFO 0x00FF00 [Sample_Assessment] begin called');
      expect(line.startsWith('INFO')).assertTrue();
      expect(line.includes('0x00FF00')).assertTrue();
      expect(line.includes(LOG_TAG)).assertTrue();
      expect(line.endsWith('begin called')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLineFormat_009, end');
    });

    /**
     * Scenario: the rendered line of every level.
     * Expectation: the level prefix changes while the rest of the line stays the same.
     */
    it('Assessment_LoggerLineFormatPerLevel_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLineFormatPerLevel_010, begin');
      const levels: LogLevel[] = LogLevels.all();
      for (let i = 0; i < levels.length; i++) {
        const line: string = formatter.formatLine(levels[i], LOG_DOMAIN, LOG_TAG, 'message');
        expect(line.startsWith(LogLevels.nameOf(levels[i]))).assertTrue();
        expect(line.endsWith('message')).assertTrue();
        expect(line.includes('0x00FF00')).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLineFormatPerLevel_010, end');
    });

    /**
     * Scenario: the privacy marker of the production Logger.
     * Expectation: the public placeholder is detected and the private one is distinct.
     */
    it('Assessment_LoggerPrivacyMarker_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerPrivacyMarker_011, begin');
      expect(PUBLIC_PLACEHOLDER).assertEqual('%{public}s');
      expect(PRIVATE_PLACEHOLDER).assertEqual('%{private}s');
      expect(formatter.isPublicPlaceholder(PUBLIC_PLACEHOLDER)).assertTrue();
      expect(formatter.isPublicPlaceholder(PRIVATE_PLACEHOLDER)).assertFalse();
      expect(formatter.isPrivatePlaceholder(PRIVATE_PLACEHOLDER)).assertTrue();
      expect(formatter.isPublicPlaceholder('plain message')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerPrivacyMarker_011, end');
    });

    /**
     * Scenario: converting a private placeholder to a public one.
     * Expectation: every occurrence is replaced.
     */
    it('Assessment_LoggerPrivacyConversion_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerPrivacyConversion_012, begin');
      expect(formatter.replacePrivateWithPublic('%{private}s')).assertEqual(PUBLIC_PLACEHOLDER);
      expect(formatter.replacePrivateWithPublic('%{private}s and %{private}s'))
        .assertEqual('%{public}s and %{public}s');
      expect(formatter.replacePrivateWithPublic('plain')).assertEqual('plain');
      expect(formatter.isPrivatePlaceholder(formatter.replacePrivateWithPublic('%{private}s'))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerPrivacyConversion_012, end');
    });

    /**
     * Scenario: counting the public placeholders of a template.
     * Expectation: every occurrence is counted.
     */
    it('Assessment_LoggerPlaceholderCount_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerPlaceholderCount_013, begin');
      expect(formatter.countPlaceholders('plain')).assertEqual(0);
      expect(formatter.countPlaceholders(PUBLIC_PLACEHOLDER)).assertEqual(1);
      expect(formatter.countPlaceholders(`${PUBLIC_PLACEHOLDER} ${PUBLIC_PLACEHOLDER}`)).assertEqual(2);
      expect(formatter.countPlaceholders('begin')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerPlaceholderCount_013, end');
    });

    /**
     * Scenario: the placeholder wrapper of a log line.
     * Expectation: the marker is put in front of the line exactly once.
     */
    it('Assessment_LoggerPlaceholderWrap_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerPlaceholderWrap_014, begin');
      expect(formatter.formatPlaceholder('begin called')).assertEqual('%{public}s begin called');
      expect(formatter.formatPlaceholder('')).assertEqual('%{public}s ');
      expect(formatter.countPlaceholders(formatter.formatPlaceholder('x'))).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerPlaceholderWrap_014, end');
    });

    /**
     * Scenario: removing the placeholders from a template.
     * Expectation: both marker kinds disappear and the text survives.
     */
    it('Assessment_LoggerPlaceholderStrip_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerPlaceholderStrip_015, begin');
      expect(formatter.stripPlaceholders(`${PUBLIC_PLACEHOLDER} begin`)).assertEqual(' begin');
      expect(formatter.stripPlaceholders(`${PRIVATE_PLACEHOLDER} begin`)).assertEqual(' begin');
      expect(formatter.stripPlaceholders('begin')).assertEqual('begin');
      expect(formatter.stripPlaceholders('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerPlaceholderStrip_015, end');
    });

    /**
     * Scenario: the numeric placeholder substitution.
     * Expectation: the documented number placeholder is replaced by the value.
     */
    it('Assessment_LoggerNumberPlaceholder_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerNumberPlaceholder_016, begin');
      expect(formatter.formatWithNumber('count %{public}d', 7)).assertEqual('count 7');
      expect(formatter.formatWithNumber('code %{public}d', 0)).assertEqual('code 0');
      expect(formatter.formatWithNumber('no marker', 3)).assertEqual('no marker');
      expect(NUMBER_PLACEHOLDER).assertEqual('%{public}d');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerNumberPlaceholder_016, end');
    });

    /**
     * Scenario: capping a short message.
     * Expectation: a message below the cap is returned unchanged.
     */
    it('Assessment_LoggerCapShort_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerCapShort_017, begin');
      expect(formatter.capMessage('short')).assertEqual('short');
      expect(formatter.capMessage('')).assertEqual('');
      const exact: string = 'a'.repeat(MAX_MESSAGE_LENGTH);
      expect(formatter.capMessage(exact)).assertEqual(exact);
      expect(formatter.capMessage(exact).length).assertEqual(MAX_MESSAGE_LENGTH);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerCapShort_017, end');
    });

    /**
     * Scenario: capping a long message.
     * Expectation: the message is cut to the cap and ends with the truncation suffix.
     */
    it('Assessment_LoggerCapLong_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerCapLong_018, begin');
      const long: string = 'a'.repeat(MAX_MESSAGE_LENGTH + 500);
      const capped: string = formatter.capMessage(long);
      expect(capped.length).assertEqual(MAX_MESSAGE_LENGTH);
      expect(capped.endsWith(TRUNCATED_SUFFIX)).assertTrue();
      expect(formatter.capMessage(`${long}${long}`).length).assertEqual(MAX_MESSAGE_LENGTH);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerCapLong_018, end');
    });

    /**
     * Scenario: escaping line breaks and tabs of a multi line message.
     * Expectation: the escaped message stays a single line.
     */
    it('Assessment_LoggerEscape_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerEscape_019, begin');
      expect(formatter.escapedMessage('line one\nline two')).assertEqual('line one\\nline two');
      expect(formatter.escapedMessage('a\tb')).assertEqual('a\\tb');
      expect(formatter.escapedMessage('plain')).assertEqual('plain');
      expect(formatter.escapedMessage('a\nb').indexOf('\n')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerEscape_019, end');
    });

    /**
     * Scenario: a fresh ring buffer.
     * Expectation: it is empty and every accessor answers the sentinel.
     */
    it('Assessment_LoggerRingFresh_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingFresh_020, begin');
      const ring: LogRingBuffer = new LogRingBuffer();
      expect(ring.size()).assertEqual(0);
      expect(ring.capacityLimit()).assertEqual(MAX_RING_LINES);
      expect(ring.isFull()).assertFalse();
      expect(ring.latest() === null).assertTrue();
      expect(ring.earliest() === null).assertTrue();
      expect(ring.at(0) === null).assertTrue();
      expect(ring.lastMessage()).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingFresh_020, end');
    });

    /**
     * Scenario: appending a line to the ring buffer.
     * Expectation: the line becomes the earliest and the latest entry at once.
     */
    it('Assessment_LoggerRingAppend_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingAppend_021, begin');
      const ring: LogRingBuffer = new LogRingBuffer(4);
      ring.append(LogLineBuilder.build(1, LogLevel.INFO)[0]);
      expect(ring.size()).assertEqual(1);
      expect(ring.isFull()).assertFalse();
      const latest: LogLine | null = ring.latest();
      expect(latest !== null).assertTrue();
      if (latest !== null) {
        expect(latest.level).assertEqual(LogLevel.INFO);
        expect(latest.message).assertEqual('line 0');
      }
      expect(ring.lastMessage()).assertEqual('line 0');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingAppend_021, end');
    });

    /**
     * Scenario: the ring buffer drops the oldest line once it is full.
     * Expectation: the size stays at the capacity and the newest line survives.
     */
    it('Assessment_LoggerRingOverflow_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingOverflow_022, begin');
      const ring: LogRingBuffer = new LogRingBuffer(3);
      for (let i = 0; i < 7; i++) {
        ring.append({
          level: LogLevel.INFO,
          domain: LOG_DOMAIN,
          tag: LOG_TAG,
          message: `line ${i}`,
          rendered: `INFO 0x00FF00 [Sample_Assessment] line ${i}`,
          timestamp: i
        });
      }
      expect(ring.size()).assertEqual(3);
      expect(ring.isFull()).assertTrue();
      const earliest: LogLine | null = ring.earliest();
      expect(earliest !== null).assertTrue();
      if (earliest !== null) {
        expect(earliest.message).assertEqual('line 4');
      }
      expect(ring.lastMessage()).assertEqual('line 6');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingOverflow_022, end');
    });

    /**
     * Scenario: the per level counters of the ring buffer.
     * Expectation: every level is counted separately.
     */
    it('Assessment_LoggerRingLevelCounts_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingLevelCounts_023, begin');
      const ring: LogRingBuffer = new LogRingBuffer(10);
      ring.append(LogLineBuilder.build(1, LogLevel.DEBUG)[0]);
      ring.append(LogLineBuilder.build(1, LogLevel.INFO)[0]);
      ring.append(LogLineBuilder.build(1, LogLevel.WARN)[0]);
      ring.append(LogLineBuilder.build(1, LogLevel.ERROR)[0]);
      ring.append(LogLineBuilder.build(1, LogLevel.ERROR)[0]);
      expect(ring.countOf(LogLevel.DEBUG)).assertEqual(1);
      expect(ring.countOf(LogLevel.INFO)).assertEqual(1);
      expect(ring.countOf(LogLevel.WARN)).assertEqual(1);
      expect(ring.countOf(LogLevel.ERROR)).assertEqual(2);
      expect(ring.size()).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingLevelCounts_023, end');
    });

    /**
     * Scenario: the message search of the ring buffer.
     * Expectation: the search matches substrings and is case sensitive.
     */
    it('Assessment_LoggerRingSearch_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingSearch_024, begin');
      const ring: LogRingBuffer = new LogRingBuffer(10);
      ring.append({
        level: LogLevel.INFO,
        domain: LOG_DOMAIN,
        tag: LOG_TAG,
        message: 'begin called',
        rendered: 'INFO',
        timestamp: 1
      });
      ring.append({
        level: LogLevel.ERROR,
        domain: LOG_DOMAIN,
        tag: LOG_TAG,
        message: 'end failed',
        rendered: 'ERROR',
        timestamp: 2
      });
      expect(ring.messagesContaining('begin').length).assertEqual(1);
      expect(ring.messagesContaining('BEGIN').length).assertEqual(0);
      expect(ring.messagesContaining('failed').length).assertEqual(1);
      expect(ring.messagesContaining('').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingSearch_024, end');
    });

    /**
     * Scenario: the line getter is a defensive copy.
     * Expectation: mutating the copy leaves the ring untouched.
     */
    it('Assessment_LoggerRingCopy_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingCopy_025, begin');
      const ring: LogRingBuffer = new LogRingBuffer(4);
      ring.append(LogLineBuilder.build(1, LogLevel.INFO)[0]);
      const copy: LogLine[] = ring.getAll();
      copy.push(LogLineBuilder.build(1, LogLevel.ERROR)[0]);
      expect(ring.size()).assertEqual(1);
      expect(ring.getAll().length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingCopy_025, end');
    });

    /**
     * Scenario: clearing the ring buffer.
     * Expectation: the buffer becomes empty and accepts new lines again.
     */
    it('Assessment_LoggerRingClear_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingClear_026, begin');
      const ring: LogRingBuffer = new LogRingBuffer(4);
      ring.append(LogLineBuilder.build(1, LogLevel.WARN)[0]);
      ring.append(LogLineBuilder.build(1, LogLevel.WARN)[0]);
      expect(ring.size()).assertEqual(2);
      ring.clear();
      expect(ring.size()).assertEqual(0);
      expect(ring.latest() === null).assertTrue();
      ring.append(LogLineBuilder.build(1, LogLevel.INFO)[0]);
      expect(ring.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingClear_026, end');
    });

    /**
     * Scenario: a custom capacity of the ring buffer.
     * Expectation: a non positive capacity falls back to the documented default.
     */
    it('Assessment_LoggerRingCapacity_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingCapacity_027, begin');
      const custom: LogRingBuffer = new LogRingBuffer(2);
      expect(custom.capacityLimit()).assertEqual(2);
      const fallback: LogRingBuffer = new LogRingBuffer(0);
      expect(fallback.capacityLimit()).assertEqual(MAX_RING_LINES);
      const negative: LogRingBuffer = new LogRingBuffer(-3);
      expect(negative.capacityLimit()).assertEqual(MAX_RING_LINES);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingCapacity_027, end');
    });

    /**
     * Scenario: the default filter of the logger.
     * Expectation: the sample tag is enabled and debug passes at the lowest minimum.
     */
    it('Assessment_LoggerFilterDefault_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFilterDefault_028, begin');
      const policy: LogFilterPolicy = new LogFilterPolicy();
      expect(policy.getMinimumLevel()).assertEqual(LogLevel.DEBUG);
      expect(policy.enabledTagCount()).assertEqual(1);
      expect(policy.isTagEnabled(LOG_TAG)).assertTrue();
      expect(policy.accepts(LogLevel.DEBUG, LOG_TAG)).assertTrue();
      expect(policy.accepts(LogLevel.ERROR, LOG_TAG)).assertTrue();
      expect(policy.getFilter().includeDebug).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFilterDefault_028, end');
    });

    /**
     * Scenario: a minimum level above debug.
     * Expectation: debug lines are rejected while the higher levels pass.
     */
    it('Assessment_LoggerFilterMinimum_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFilterMinimum_029, begin');
      const policy: LogFilterPolicy = new LogFilterPolicy(LogLevel.WARN);
      expect(policy.accepts(LogLevel.DEBUG, LOG_TAG)).assertFalse();
      expect(policy.accepts(LogLevel.INFO, LOG_TAG)).assertFalse();
      expect(policy.accepts(LogLevel.WARN, LOG_TAG)).assertTrue();
      expect(policy.accepts(LogLevel.ERROR, LOG_TAG)).assertTrue();
      expect(policy.getFilter().includeDebug).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFilterMinimum_029, end');
    });

    /**
     * Scenario: changing the minimum level at runtime.
     * Expectation: the decision changes with the new minimum.
     */
    it('Assessment_LoggerFilterChange_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFilterChange_030, begin');
      const policy: LogFilterPolicy = new LogFilterPolicy(LogLevel.ERROR);
      expect(policy.accepts(LogLevel.INFO, LOG_TAG)).assertFalse();
      policy.setMinimumLevel(LogLevel.INFO);
      expect(policy.getMinimumLevel()).assertEqual(LogLevel.INFO);
      expect(policy.accepts(LogLevel.INFO, LOG_TAG)).assertTrue();
      expect(policy.accepts(LogLevel.DEBUG, LOG_TAG)).assertFalse();
      policy.setMinimumLevel(LogLevel.DEBUG);
      expect(policy.accepts(LogLevel.DEBUG, LOG_TAG)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFilterChange_030, end');
    });

    /**
     * Scenario: the tag allow list of the filter.
     * Expectation: an unknown tag is rejected while a listed tag passes.
     */
    it('Assessment_LoggerFilterTags_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFilterTags_031, begin');
      const policy: LogFilterPolicy = new LogFilterPolicy(LogLevel.INFO, [LOG_TAG]);
      expect(policy.isTagEnabled(LOG_TAG)).assertTrue();
      expect(policy.isTagEnabled('[Other_Tag]')).assertFalse();
      expect(policy.accepts(LogLevel.INFO, '[Other_Tag]')).assertFalse();
      policy.addTag('[Other_Tag]');
      expect(policy.isTagEnabled('[Other_Tag]')).assertTrue();
      expect(policy.accepts(LogLevel.INFO, '[Other_Tag]')).assertTrue();
      expect(policy.enabledTagCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFilterTags_031, end');
    });

    /**
     * Scenario: removing a tag from the filter.
     * Expectation: the tag is rejected once it is removed and adding it twice is a no operation.
     */
    it('Assessment_LoggerFilterTagRemoval_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFilterTagRemoval_032, begin');
      const policy: LogFilterPolicy = new LogFilterPolicy(LogLevel.INFO, [LOG_TAG, '[Second_Tag]']);
      policy.addTag('[Second_Tag]');
      expect(policy.enabledTagCount()).assertEqual(2);
      expect(policy.removeTag('[Second_Tag]')).assertTrue();
      expect(policy.enabledTagCount()).assertEqual(1);
      expect(policy.isTagEnabled('[Second_Tag]')).assertFalse();
      expect(policy.removeTag('[Second_Tag]')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFilterTagRemoval_032, end');
    });

    /**
     * Scenario: an empty tag allow list.
     * Expectation: every tag passes because an empty list means no restriction.
     */
    it('Assessment_LoggerFilterEmptyAllowList_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFilterEmptyAllowList_033, begin');
      const policy: LogFilterPolicy = new LogFilterPolicy(LogLevel.INFO, []);
      expect(policy.enabledTagCount()).assertEqual(0);
      expect(policy.isTagEnabled(LOG_TAG)).assertTrue();
      expect(policy.isTagEnabled('[Anything]')).assertTrue();
      expect(policy.accepts(LogLevel.ERROR, '[Anything]')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFilterEmptyAllowList_033, end');
    });

    /**
     * Scenario: the filter getter returns a copy.
     * Expectation: mutating the copy does not change the policy.
     */
    it('Assessment_LoggerFilterCopy_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFilterCopy_034, begin');
      const policy: LogFilterPolicy = new LogFilterPolicy(LogLevel.INFO, [LOG_TAG]);
      const copy: LogFilter = policy.getFilter();
      copy.enabledTags.push('[Injected]');
      copy.minimumLevel = LogLevel.ERROR;
      expect(policy.enabledTagCount()).assertEqual(1);
      expect(policy.getMinimumLevel()).assertEqual(LogLevel.INFO);
      expect(policy.isTagEnabled('[Injected]')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFilterCopy_034, end');
    });

    /**
     * Scenario: a fresh simulated logger.
     * Expectation: no line is recorded and no counter is raised.
     */
    it('Assessment_LoggerFresh_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFresh_035, begin');
      const logger: SampleLogger = new SampleLogger();
      expect(logger.lineCount()).assertEqual(0);
      expect(logger.total()).assertEqual(0);
      expect(logger.dropped()).assertEqual(0);
      expect(logger.lastRendered()).assertEqual('');
      expect(logger.hasMessage('anything')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFresh_035, end');
    });

    /**
     * Scenario: the info helper of the simulated logger.
     * Expectation: the line is accepted and rendered with the info prefix.
     */
    it('Assessment_LoggerInfo_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerInfo_036, begin');
      const logger: SampleLogger = new SampleLogger();
      const result: EmitResult = logger.info('begin called');
      expect(result.accepted).assertTrue();
      expect(result.sink).assertEqual(LogSink.HILOG);
      expect(result.level).assertEqual(LogLevel.INFO);
      expect(logger.lineCount()).assertEqual(1);
      expect(logger.total()).assertEqual(1);
      expect(logger.lastRendered()).assertEqual('INFO 0x00FF00 [Sample_Assessment] begin called');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerInfo_036, end');
    });

    /**
     * Scenario: the debug helper of the simulated logger.
     * Expectation: the line is accepted at the default minimum level.
     */
    it('Assessment_LoggerDebug_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerDebug_037, begin');
      const logger: SampleLogger = new SampleLogger();
      const result: EmitResult = logger.debug('tick');
      expect(result.accepted).assertTrue();
      expect(result.level).assertEqual(LogLevel.DEBUG);
      expect(logger.lastRendered().startsWith('DEBUG')).assertTrue();
      expect(logger.hasMessage('tick')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerDebug_037, end');
    });

    /**
     * Scenario: the warn and error helpers of the simulated logger.
     * Expectation: both lines are accepted and counted per level.
     */
    it('Assessment_LoggerWarnError_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerWarnError_038, begin');
      const logger: SampleLogger = new SampleLogger();
      logger.warn('whitelist is full');
      logger.error('begin failed');
      expect(logger.lineCount()).assertEqual(2);
      const stats: LogStatistics = logger.statistics();
      expect(stats.warnCount).assertEqual(1);
      expect(stats.errorCount).assertEqual(1);
      expect(stats.infoCount).assertEqual(0);
      expect(logger.lastRendered().startsWith('ERROR')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerWarnError_038, end');
    });

    /**
     * Scenario: a debug line below the minimum level.
     * Expectation: the line is dropped and the drop counter rises.
     */
    it('Assessment_LoggerDropped_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerDropped_039, begin');
      const logger: SampleLogger = new SampleLogger(10, LogLevel.WARN);
      const result: EmitResult = logger.debug('dropped line');
      expect(result.accepted).assertFalse();
      expect(result.sink).assertEqual(LogSink.DROPPED);
      expect(logger.lineCount()).assertEqual(0);
      expect(logger.dropped()).assertEqual(1);
      expect(logger.total()).assertEqual(1);
      expect(logger.hasMessage('dropped line')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerDropped_039, end');
    });

    /**
     * Scenario: every level under a warn minimum.
     * Expectation: only warn and error lines reach the ring buffer.
     */
    it('Assessment_LoggerLevelFiltering_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLevelFiltering_040, begin');
      const logger: SampleLogger = new SampleLogger(10, LogLevel.WARN);
      logger.debug('d');
      logger.info('i');
      logger.warn('w');
      logger.error('e');
      expect(logger.lineCount()).assertEqual(2);
      expect(logger.dropped()).assertEqual(2);
      expect(logger.getRing().countOf(LogLevel.WARN)).assertEqual(1);
      expect(logger.getRing().countOf(LogLevel.ERROR)).assertEqual(1);
      expect(logger.getRing().countOf(LogLevel.DEBUG)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLevelFiltering_040, end');
    });

    /**
     * Scenario: the statistics of a mixed logging session.
     * Expectation: the counters match the accepted and dropped calls.
     */
    it('Assessment_LoggerStatistics_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerStatistics_041, begin');
      const logger: SampleLogger = new SampleLogger(20, LogLevel.INFO);
      logger.debug('d1');
      logger.info('i1');
      logger.info('i2');
      logger.warn('w1');
      logger.error('e1');
      const stats: LogStatistics = logger.statistics();
      expect(stats.total).assertEqual(5);
      expect(stats.debugCount).assertEqual(0);
      expect(stats.infoCount).assertEqual(2);
      expect(stats.warnCount).assertEqual(1);
      expect(stats.errorCount).assertEqual(1);
      expect(stats.droppedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerStatistics_041, end');
    });

    /**
     * Scenario: the ring capacity of the simulated logger.
     * Expectation: the ring keeps only the newest lines.
     */
    it('Assessment_LoggerRingCapacityApplied_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingCapacityApplied_042, begin');
      const logger: SampleLogger = new SampleLogger(3, LogLevel.DEBUG);
      for (let i = 0; i < 6; i++) {
        logger.info(`message ${i}`);
      }
      expect(logger.lineCount()).assertEqual(3);
      expect(logger.getRing().isFull()).assertTrue();
      expect(logger.getRing().lastMessage()).assertEqual('message 5');
      expect(logger.getRing().earliest()?.message).assertEqual('message 3');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRingCapacityApplied_042, end');
    });

    /**
     * Scenario: a long message passing through the simulated logger.
     * Expectation: the stored message respects the cap.
     */
    it('Assessment_LoggerMessageCapApplied_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerMessageCapApplied_043, begin');
      const logger: SampleLogger = new SampleLogger();
      const long: string = 'x'.repeat(MAX_MESSAGE_LENGTH * 2);
      logger.info(long);
      const latest: LogLine | null = logger.getRing().latest();
      expect(latest !== null).assertTrue();
      if (latest !== null) {
        expect(latest.message.length).assertEqual(MAX_MESSAGE_LENGTH);
        expect(latest.message.endsWith(TRUNCATED_SUFFIX)).assertTrue();
      }
      expect(auditor.messagesWithinCap(logger.getRing())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerMessageCapApplied_043, end');
    });

    /**
     * Scenario: every line carries the production domain and tag.
     * Expectation: the auditor confirms both for the whole buffer.
     */
    it('Assessment_LoggerDomainTagApplied_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerDomainTagApplied_044, begin');
      const logger: SampleLogger = new SampleLogger();
      logger.debug('one');
      logger.info('two');
      logger.warn('three');
      logger.error('four');
      expect(auditor.allLinesHaveDomain(logger.getRing(), LOG_DOMAIN)).assertTrue();
      expect(auditor.allLinesHaveTag(logger.getRing(), LOG_TAG)).assertTrue();
      expect(auditor.allLinesHaveDomain(logger.getRing(), DOMAIN)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerDomainTagApplied_044, end');
    });

    /**
     * Scenario: the chronological order of the recorded lines.
     * Expectation: the timestamps never decrease.
     */
    it('Assessment_LoggerChronology_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerChronology_045, begin');
      const logger: SampleLogger = new SampleLogger();
      for (let i = 0; i < 10; i++) {
        logger.info(`line ${i}`);
      }
      expect(auditor.isChronological(logger.getRing())).assertTrue();
      expect(logger.getRing().size()).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerChronology_045, end');
    });

    /**
     * Scenario: the level ordering of a session.
     * Expectation: a session written in ascending severity stays non decreasing.
     */
    it('Assessment_LoggerLevelOrderPreserved_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLevelOrderPreserved_046, begin');
      const logger: SampleLogger = new SampleLogger();
      logger.debug('d');
      logger.info('i');
      logger.warn('w');
      logger.error('e');
      expect(auditor.levelsNonDecreasing(logger.getRing())).assertTrue();
      logger.debug('d2');
      expect(auditor.levelsNonDecreasing(logger.getRing())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerLevelOrderPreserved_046, end');
    });

    /**
     * Scenario: the rendered lines start with their level name.
     * Expectation: the auditor confirms the prefix for the whole buffer.
     */
    it('Assessment_LoggerRenderedPrefix_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRenderedPrefix_047, begin');
      const logger: SampleLogger = new SampleLogger();
      logger.debug('d');
      logger.info('i');
      logger.warn('w');
      logger.error('e');
      expect(auditor.renderedLinesStartWithLevel(logger.getRing())).assertTrue();
      const rendered: string = logger.lastRendered();
      expect(rendered).assertEqual('ERROR 0x00FF00 [Sample_Assessment] e');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerRenderedPrefix_047, end');
    });

    /**
     * Scenario: clearing the simulated logger.
     * Expectation: the ring and both counters return to zero.
     */
    it('Assessment_LoggerClear_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerClear_048, begin');
      const logger: SampleLogger = new SampleLogger(10, LogLevel.WARN);
      logger.info('dropped');
      logger.warn('kept');
      expect(logger.lineCount()).assertEqual(1);
      expect(logger.dropped()).assertEqual(1);
      logger.clear();
      expect(logger.lineCount()).assertEqual(0);
      expect(logger.dropped()).assertEqual(0);
      expect(logger.total()).assertEqual(0);
      expect(logger.lastRendered()).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerClear_048, end');
    });

    /**
     * Scenario: the auditor over an empty buffer.
     * Expectation: every check passes vacuously.
     */
    it('Assessment_LoggerAuditEmpty_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerAuditEmpty_049, begin');
      const ring: LogRingBuffer = new LogRingBuffer();
      expect(auditor.isChronological(ring)).assertTrue();
      expect(auditor.allLinesHaveDomain(ring, LOG_DOMAIN)).assertTrue();
      expect(auditor.allLinesHaveTag(ring, LOG_TAG)).assertTrue();
      expect(auditor.levelsNonDecreasing(ring)).assertTrue();
      expect(auditor.messagesWithinCap(ring)).assertTrue();
      expect(auditor.renderedLinesStartWithLevel(ring)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerAuditEmpty_049, end');
    });

    /**
     * Scenario: the auditor detects a foreign domain.
     * Expectation: the domain check fails once one line carries another domain.
     */
    it('Assessment_LoggerAuditForeignDomain_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerAuditForeignDomain_050, begin');
      const ring: LogRingBuffer = new LogRingBuffer(4);
      ring.append(LogLineBuilder.build(1, LogLevel.INFO)[0]);
      ring.append({
        level: LogLevel.INFO,
        domain: DOMAIN,
        tag: LOG_TAG,
        message: 'foreign',
        rendered: 'INFO 0x00F811 [Sample_Assessment] foreign',
        timestamp: 2
      });
      expect(auditor.allLinesHaveDomain(ring, LOG_DOMAIN)).assertFalse();
      expect(auditor.allLinesHaveDomain(ring, DOMAIN)).assertFalse();
      expect(ring.size()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerAuditForeignDomain_050, end');
    });

    /**
     * Scenario: the synthetic mixed log lines.
     * Expectation: the builder produces one line per level in ascending order.
     */
    it('Assessment_LoggerBuilderMixed_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerBuilderMixed_051, begin');
      const lines: LogLine[] = LogLineBuilder.buildMixed();
      expect(lines.length).assertEqual(4);
      expect(lines[0].level).assertEqual(LogLevel.DEBUG);
      expect(lines[1].level).assertEqual(LogLevel.INFO);
      expect(lines[2].level).assertEqual(LogLevel.WARN);
      expect(lines[3].level).assertEqual(LogLevel.ERROR);
      expect(lines[0].timestamp < lines[3].timestamp).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerBuilderMixed_051, end');
    });

    /**
     * Scenario: the synthetic builder with a single level.
     * Expectation: every produced line carries the requested level.
     */
    it('Assessment_LoggerBuilderSingleLevel_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerBuilderSingleLevel_052, begin');
      const lines: LogLine[] = LogLineBuilder.build(5, LogLevel.WARN);
      expect(lines.length).assertEqual(5);
      for (let i = 0; i < lines.length; i++) {
        expect(lines[i].level).assertEqual(LogLevel.WARN);
        expect(lines[i].message).assertEqual(`line ${i}`);
        expect(lines[i].domain).assertEqual(LOG_DOMAIN);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerBuilderSingleLevel_052, end');
    });

    /**
     * Scenario: a session that fills the ring buffer completely.
     * Expectation: the buffer is full and the auditor still passes on the retained lines.
     */
    it('Assessment_LoggerFullBuffer_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFullBuffer_053, begin');
      const logger: SampleLogger = new SampleLogger(MAX_RING_LINES);
      for (let i = 0; i < MAX_RING_LINES; i++) {
        logger.info(`line ${i}`);
      }
      expect(logger.getRing().isFull()).assertTrue();
      expect(logger.lineCount()).assertEqual(MAX_RING_LINES);
      expect(logger.getRing().lastMessage()).assertEqual(`line ${MAX_RING_LINES - 1}`);
      expect(auditor.isChronological(logger.getRing())).assertTrue();
      expect(auditor.messagesWithinCap(logger.getRing())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerFullBuffer_053, end');
    });

    /**
     * Scenario: the message search of the simulated logger.
     * Expectation: only present messages are reported.
     */
    it('Assessment_LoggerHasMessage_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerHasMessage_055, begin');
      const logger: SampleLogger = new SampleLogger();
      logger.info('begin called');
      logger.error('end failed');
      expect(logger.hasMessage('begin')).assertTrue();
      expect(logger.hasMessage('failed')).assertTrue();
      expect(logger.hasMessage('missing')).assertFalse();
      expect(logger.hasMessage('BEGIN')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerHasMessage_055, end');
    });

    /**
     * Scenario: an end to end logging scenario.
     * Expectation: filtering, formatting, capping and auditing agree with each other.
     */
    it('Assessment_LoggerComprehensive_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerComprehensive_057, begin');
      const logger: SampleLogger = new SampleLogger(8, LogLevel.INFO);
      expect(logger.debug('dropped').accepted).assertFalse();
      expect(logger.info('begin called').accepted).assertTrue();
      expect(logger.warn('user canceled').accepted).assertTrue();
      expect(logger.error('end failed').accepted).assertTrue();
      const stats: LogStatistics = logger.statistics();
      expect(stats.total).assertEqual(4);
      expect(stats.droppedCount).assertEqual(1);
      expect(stats.debugCount).assertEqual(0);
      expect(stats.infoCount).assertEqual(1);
      expect(logger.getRing().countOf(LogLevel.WARN)).assertEqual(1);
      expect(logger.getRing().countOf(LogLevel.ERROR)).assertEqual(1);
      expect(auditor.allLinesHaveDomain(logger.getRing(), LOG_DOMAIN)).assertTrue();
      expect(auditor.renderedLinesStartWithLevel(logger.getRing())).assertTrue();
      const rendered: string = logger.getRing().at(0)?.rendered ?? '';
      expect(rendered).assertEqual('INFO 0x00FF00 [Sample_Assessment] begin called');
      expect(formatter.formatDomain(LOG_DOMAIN)).assertEqual('0x00FF00');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerComprehensive_057, end');
    });

    /**
     * Scenario: the logger survives a message with markup characters.
     * Expectation: the rendered line keeps the characters untouched.
     */
    it('Assessment_LoggerMarkupMessage_063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerMarkupMessage_063, begin');
      const logger: SampleLogger = new SampleLogger();
      const message: string = 'begin called, duration: 1800000, allowedApps: com.samples.assessment';
      logger.info(message);
      expect(logger.hasMessage('duration: 1800000')).assertTrue();
      expect(logger.getRing().lastMessage()).assertEqual(message);
      expect(logger.lastRendered().includes(message)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LoggerMarkupMessage_063, end');
    });
  });
}
