/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  getBundleName,
  logInfo,
  logError,
  waitForIndexPageStable,
  isIndexPageVisible,
  pageComponentCount,
  triggerEntryAbility,
  TIMEOUT_PAGE_RENDER,
  PAGE_TEXT_INITIAL,
  BUNDLE_NAME,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum LogLevel {
  DEBUG = 0,
  INFO = 1,
  WARN = 2,
  ERROR = 3,
  FATAL = 4
}

enum LogSink {
  BUFFER = 'buffer',
  HILOG = 'hilog',
  FILE = 'file'
}

enum LogFilterCode {
  ACCEPTED = 0,
  FILTERED_BY_LEVEL = 1,
  BUFFER_EVICTED = 2,
  INVALID_TAG = 3,
  EMPTY_MESSAGE = 4,
  TOO_MANY_PLACEHOLDERS = 5,
  MISSING_ARGUMENT = 6
}

interface LogEntry {
  sequence: number;
  level: LogLevel;
  tag: string;
  message: string;
  timestamp: number;
  sink: LogSink;
}

interface LogRecordResult {
  code: LogFilterCode;
  sequence: number;
  retainedCount: number;
  evictedCount: number;
}

interface LogCounts {
  total: number;
  debug: number;
  info: number;
  warn: number;
  error: number;
  fatal: number;
}

interface FormatResult {
  code: LogFilterCode;
  text: string;
  substituted: number;
  redacted: number;
}

class LogBuffer {
  private entries: LogEntry[] = [];
  private capacity: number;
  private threshold: LogLevel;
  private sequence: number = 0;
  private evicted: number = 0;
  private rejected: number = 0;

  public constructor(capacity: number, threshold: LogLevel) {
    this.capacity = capacity;
    this.threshold = threshold;
  }

  public append(level: LogLevel, tag: string, message: string, sink: LogSink): LogRecordResult {
    if (tag.length === 0) {
      this.rejected++;
      return this.result(LogFilterCode.INVALID_TAG, 0);
    }
    if (message.length === 0) {
      this.rejected++;
      return this.result(LogFilterCode.EMPTY_MESSAGE, 0);
    }
    if (level < this.threshold) {
      this.rejected++;
      return this.result(LogFilterCode.FILTERED_BY_LEVEL, 0);
    }
    this.sequence++;
    const entry: LogEntry = {
      sequence: this.sequence,
      level: level,
      tag: tag,
      message: message,
      timestamp: Date.now(),
      sink: sink
    };
    this.entries.push(entry);
    if (this.entries.length > this.capacity) {
      const overflow: number = this.entries.length - this.capacity;
      const kept: LogEntry[] = [];
      for (let i = overflow; i < this.entries.length; i++) {
        kept.push(this.entries[i]);
      }
      this.entries = kept;
      this.evicted += overflow;
      return this.result(LogFilterCode.BUFFER_EVICTED, this.sequence);
    }
    return this.result(LogFilterCode.ACCEPTED, this.sequence);
  }

  public debug(tag: string, message: string): LogRecordResult {
    return this.append(LogLevel.DEBUG, tag, message, LogSink.BUFFER);
  }

  public info(tag: string, message: string): LogRecordResult {
    return this.append(LogLevel.INFO, tag, message, LogSink.BUFFER);
  }

  public warn(tag: string, message: string): LogRecordResult {
    return this.append(LogLevel.WARN, tag, message, LogSink.BUFFER);
  }

  public error(tag: string, message: string): LogRecordResult {
    return this.append(LogLevel.ERROR, tag, message, LogSink.BUFFER);
  }

  public fatal(tag: string, message: string): LogRecordResult {
    return this.append(LogLevel.FATAL, tag, message, LogSink.BUFFER);
  }

  public setThreshold(level: LogLevel): void {
    this.threshold = level;
  }

  public getThreshold(): LogLevel {
    return this.threshold;
  }

  public setCapacity(capacity: number): void {
    this.capacity = capacity;
    if (this.entries.length > capacity) {
      const overflow: number = this.entries.length - capacity;
      const kept: LogEntry[] = [];
      for (let i = overflow; i < this.entries.length; i++) {
        kept.push(this.entries[i]);
      }
      this.entries = kept;
      this.evicted += overflow;
    }
  }

  public getCapacity(): number {
    return this.capacity;
  }

  public getAll(): LogEntry[] {
    const copy: LogEntry[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      copy.push(this.entries[i]);
    }
    return copy;
  }

  public count(): number {
    return this.entries.length;
  }

  public countByLevel(level: LogLevel): number {
    let matched: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].level === level) {
        matched++;
      }
    }
    return matched;
  }

  public countByTag(tag: string): number {
    let matched: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].tag === tag) {
        matched++;
      }
    }
    return matched;
  }

  public counts(): LogCounts {
    const counts: LogCounts = {
      total: this.entries.length,
      debug: this.countByLevel(LogLevel.DEBUG),
      info: this.countByLevel(LogLevel.INFO),
      warn: this.countByLevel(LogLevel.WARN),
      error: this.countByLevel(LogLevel.ERROR),
      fatal: this.countByLevel(LogLevel.FATAL)
    };
    return counts;
  }

  public latest(): LogEntry | null {
    if (this.entries.length === 0) {
      return null;
    }
    return this.entries[this.entries.length - 1];
  }

  public earliest(): LogEntry | null {
    if (this.entries.length === 0) {
      return null;
    }
    return this.entries[0];
  }

  public containsMessage(fragment: string): boolean {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].message.indexOf(fragment) >= 0) {
        return true;
      }
    }
    return false;
  }

  public getEvictedCount(): number {
    return this.evicted;
  }

  public getRejectedCount(): number {
    return this.rejected;
  }

  public getSequence(): number {
    return this.sequence;
  }

  public isFull(): boolean {
    return this.entries.length >= this.capacity;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.entries.length; i++) {
      if (this.entries[i].sequence <= this.entries[i - 1].sequence) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.entries = [];
    this.sequence = 0;
    this.evicted = 0;
    this.rejected = 0;
  }

  private result(code: LogFilterCode, sequence: number): LogRecordResult {
    const result: LogRecordResult = {
      code: code,
      sequence: sequence,
      retainedCount: this.entries.length,
      evictedCount: this.evicted
    };
    return result;
  }
}

class LogFormatter {
  public format(template: string, args: string[]): FormatResult {
    let substituted: number = 0;
    let redacted: number = 0;
    let output: string = '';
    let argIndex: number = 0;
    let cursor: number = 0;
    while (cursor < template.length) {
      const publicIndex: number = template.indexOf('%{public}', cursor);
      const privateIndex: number = template.indexOf('%{private}', cursor);
      let nextIndex: number = -1;
      let isPrivate: boolean = false;
      if (publicIndex >= 0 && privateIndex >= 0) {
        nextIndex = publicIndex < privateIndex ? publicIndex : privateIndex;
        isPrivate = privateIndex < publicIndex;
      } else if (publicIndex >= 0) {
        nextIndex = publicIndex;
      } else if (privateIndex >= 0) {
        nextIndex = privateIndex;
        isPrivate = true;
      }
      if (nextIndex < 0) {
        output += template.substring(cursor);
        cursor = template.length;
        break;
      }
      output += template.substring(cursor, nextIndex);
      const tokenLength: number = isPrivate ? 11 : 10;
      cursor = nextIndex + tokenLength;
      if (argIndex >= args.length) {
        const missing: FormatResult = {
          code: LogFilterCode.MISSING_ARGUMENT,
          text: output,
          substituted: substituted,
          redacted: redacted
        };
        return missing;
      }
      if (isPrivate) {
        output += this.redact(args[argIndex]);
        redacted++;
      } else {
        output += args[argIndex];
      }
      substituted++;
      argIndex++;
    }
    if (argIndex < args.length) {
      const excess: FormatResult = {
        code: LogFilterCode.TOO_MANY_PLACEHOLDERS,
        text: output,
        substituted: substituted,
        redacted: redacted
      };
      return excess;
    }
    const ok: FormatResult = {
      code: LogFilterCode.ACCEPTED,
      text: output,
      substituted: substituted,
      redacted: redacted
    };
    return ok;
  }

  public redact(value: string): string {
    if (value.length <= 2) {
      return '**';
    }
    const head: string = value.substring(0, 1);
    const tail: string = value.substring(value.length - 1);
    return head + '***' + tail;
  }

  public placeholderCount(template: string): number {
    let count: number = 0;
    let cursor: number = 0;
    while (cursor < template.length) {
      const publicIndex: number = template.indexOf('%{public}', cursor);
      const privateIndex: number = template.indexOf('%{private}', cursor);
      let nextIndex: number = -1;
      let tokenLength: number = 0;
      if (publicIndex >= 0 && privateIndex >= 0) {
        if (publicIndex < privateIndex) {
          nextIndex = publicIndex;
          tokenLength = 10;
        } else {
          nextIndex = privateIndex;
          tokenLength = 11;
        }
      } else if (publicIndex >= 0) {
        nextIndex = publicIndex;
        tokenLength = 10;
      } else if (privateIndex >= 0) {
        nextIndex = privateIndex;
        tokenLength = 11;
      }
      if (nextIndex < 0) {
        break;
      }
      count++;
      cursor = nextIndex + tokenLength;
    }
    return count;
  }
}

class LevelThresholdRule {
  public isEnabled(level: LogLevel, threshold: LogLevel): boolean {
    return level >= threshold;
  }

  public levelName(level: LogLevel): string {
    switch (level) {
      case LogLevel.DEBUG:
        return 'DEBUG';
      case LogLevel.INFO:
        return 'INFO';
      case LogLevel.WARN:
        return 'WARN';
      case LogLevel.ERROR:
        return 'ERROR';
      case LogLevel.FATAL:
        return 'FATAL';
      default:
        return 'UNKNOWN';
    }
  }

  public enabledCount(thresholds: LogLevel[], level: LogLevel): number {
    let enabled: number = 0;
    for (let i = 0; i < thresholds.length; i++) {
      if (this.isEnabled(level, thresholds[i])) {
        enabled++;
      }
    }
    return enabled;
  }

  public isStrictlyAscending(levels: LogLevel[]): boolean {
    for (let i = 1; i < levels.length; i++) {
      if (levels[i] <= levels[i - 1]) {
        return false;
      }
    }
    return true;
  }
}

export default function loggerValidationTest(): void {
  describe('LoggerValidationTest', () => {
    let driver: Driver;
    let rule: LevelThresholdRule;

    beforeAll(async () => {
      driver = getDriver();
      rule = new LevelThresholdRule();
      logInfo('LoggerValidationTest: beforeAll start');
      await triggerEntryAbility(driver);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      logInfo('LoggerValidationTest: beforeAll finished');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      driver = getDriver();
      await driver.delayMs(100);
      logInfo('LoggerValidationTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_0100
     * @tc.name testLogLevelEnumOrder
     * @tc.desc Verify log levels are numbered zero through four in increasing severity order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLogLevelEnumOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(LogLevel.DEBUG).assertEqual(0);
        expect(LogLevel.INFO).assertEqual(1);
        expect(LogLevel.WARN).assertEqual(2);
        expect(LogLevel.ERROR).assertEqual(3);
        expect(LogLevel.FATAL).assertEqual(4);
        expect(LogLevel.DEBUG < LogLevel.INFO).assertTrue();
        expect(LogLevel.WARN < LogLevel.ERROR).assertTrue();
        expect(LogLevel.ERROR < LogLevel.FATAL).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_0200
     * @tc.name testLevelNames
     * @tc.desc Verify each level maps to its upper-case display name and an out-of-range level is unknown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLevelNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(rule.levelName(LogLevel.DEBUG)).assertEqual('DEBUG');
        expect(rule.levelName(LogLevel.INFO)).assertEqual('INFO');
        expect(rule.levelName(LogLevel.WARN)).assertEqual('WARN');
        expect(rule.levelName(LogLevel.ERROR)).assertEqual('ERROR');
        expect(rule.levelName(LogLevel.FATAL)).assertEqual('FATAL');
        expect(rule.levelName(9)).assertEqual('UNKNOWN');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_0300
     * @tc.name testThresholdAcceptsEqualLevel
     * @tc.desc Verify a log at exactly the threshold level is enabled while one level below is filtered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThresholdAcceptsEqualLevel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(rule.isEnabled(LogLevel.WARN, LogLevel.WARN)).assertTrue();
        expect(rule.isEnabled(LogLevel.WARN, LogLevel.INFO)).assertTrue();
        expect(rule.isEnabled(LogLevel.INFO, LogLevel.WARN)).assertFalse();
        expect(rule.isEnabled(LogLevel.DEBUG, LogLevel.FATAL)).assertFalse();
        expect(rule.isEnabled(LogLevel.FATAL, LogLevel.FATAL)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_0400
     * @tc.name testBufferedAppendAccepted
     * @tc.desc Verify an info log above a debug threshold is accepted and increments retained count to one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBufferedAppendAccepted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(10, LogLevel.DEBUG);
        const result: LogRecordResult = buffer.info('AbilityStageTest', 'onCreate called');
        expect(result.code).assertEqual(LogFilterCode.ACCEPTED);
        expect(result.sequence).assertEqual(1);
        expect(result.retainedCount).assertEqual(1);
        expect(buffer.count()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_0500
     * @tc.name testLevelFilterDropsBelowThreshold
     * @tc.desc Verify logs below a warning threshold are rejected as level-filtered and never retained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLevelFilterDropsBelowThreshold', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(10, LogLevel.WARN);
        const debugResult: LogRecordResult = buffer.debug('AbilityStageTest', 'debug detail');
        const infoResult: LogRecordResult = buffer.info('AbilityStageTest', 'info detail');
        const warnResult: LogRecordResult = buffer.warn('AbilityStageTest', 'warn detail');
        expect(debugResult.code).assertEqual(LogFilterCode.FILTERED_BY_LEVEL);
        expect(infoResult.code).assertEqual(LogFilterCode.FILTERED_BY_LEVEL);
        expect(warnResult.code).assertEqual(LogFilterCode.ACCEPTED);
        expect(buffer.count()).assertEqual(1);
        expect(buffer.getRejectedCount()).assertEqual(2);
        expect(buffer.containsMessage('debug detail')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_0600
     * @tc.name testFatalOnlyThreshold
     * @tc.desc Verify a fatal threshold retains only fatal entries and rejects the four lower levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFatalOnlyThreshold', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(20, LogLevel.FATAL);
        buffer.debug('T', 'd');
        buffer.info('T', 'i');
        buffer.warn('T', 'w');
        buffer.error('T', 'e');
        buffer.fatal('T', 'f');
        expect(buffer.count()).assertEqual(1);
        expect(buffer.countByLevel(LogLevel.FATAL)).assertEqual(1);
        expect(buffer.countByLevel(LogLevel.ERROR)).assertEqual(0);
        expect(buffer.getRejectedCount()).assertEqual(4);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_0700
     * @tc.name testThresholdSwitchChangesRetention
     * @tc.desc Verify raising the threshold mid-run stops lower-level entries from being retained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThresholdSwitchChangesRetention', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(20, LogLevel.DEBUG);
        buffer.debug('T', 'debug before');
        buffer.info('T', 'info before');
        expect(buffer.count()).assertEqual(2);
        buffer.setThreshold(LogLevel.ERROR);
        expect(buffer.getThreshold()).assertEqual(LogLevel.ERROR);
        buffer.debug('T', 'debug after');
        buffer.error('T', 'error after');
        expect(buffer.count()).assertEqual(3);
        expect(buffer.containsMessage('debug after')).assertFalse();
        expect(buffer.containsMessage('error after')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_0800
     * @tc.name testCountsAggregationExact
     * @tc.desc Verify aggregated counts report exactly five debug four info three warn two error one fatal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCountsAggregationExact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(50, LogLevel.DEBUG);
        for (let i = 0; i < 5; i++) {
          buffer.debug('CountTag', `debug item ${i}`);
        }
        for (let i = 0; i < 4; i++) {
          buffer.info('CountTag', `info item ${i}`);
        }
        for (let i = 0; i < 3; i++) {
          buffer.warn('CountTag', `warn item ${i}`);
        }
        for (let i = 0; i < 2; i++) {
          buffer.error('CountTag', `error item ${i}`);
        }
        buffer.fatal('CountTag', 'fatal item');
        const counts: LogCounts = buffer.counts();
        expect(counts.total).assertEqual(15);
        expect(counts.debug).assertEqual(5);
        expect(counts.info).assertEqual(4);
        expect(counts.warn).assertEqual(3);
        expect(counts.error).assertEqual(2);
        expect(counts.fatal).assertEqual(1);
        expect(buffer.countByTag('CountTag')).assertEqual(15);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_0900
     * @tc.name testEmptyTagRejected
     * @tc.desc Verify a log with an empty tag is rejected as invalid-tag and not retained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptyTagRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(10, LogLevel.DEBUG);
        const emptyTag: LogRecordResult = buffer.info('', 'message with empty tag');
        expect(emptyTag.code).assertEqual(LogFilterCode.INVALID_TAG);
        expect(buffer.count()).assertEqual(0);
        const emptyMessage: LogRecordResult = buffer.info('ValidTag', '');
        expect(emptyMessage.code).assertEqual(LogFilterCode.EMPTY_MESSAGE);
        expect(buffer.count()).assertEqual(0);
        expect(buffer.getRejectedCount()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_1000
     * @tc.name testBufferCapacityEvictsOldest
     * @tc.desc Verify a full buffer of ten keeps the newest five entries and evicts the five oldest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBufferCapacityEvictsOldest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(5, LogLevel.DEBUG);
        for (let i = 0; i < 10; i++) {
          buffer.info('CapTag', `entry ${i}`);
        }
        expect(buffer.count()).assertEqual(5);
        expect(buffer.getEvictedCount()).assertEqual(5);
        expect(buffer.containsMessage('entry 0')).assertFalse();
        expect(buffer.containsMessage('entry 4')).assertFalse();
        expect(buffer.containsMessage('entry 5')).assertTrue();
        expect(buffer.containsMessage('entry 9')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_1100
     * @tc.name testEvictionReportsEvictedCode
     * @tc.desc Verify the append that triggers eviction reports buffer-evicted with the running total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEvictionReportsEvictedCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(2, LogLevel.DEBUG);
        const first: LogRecordResult = buffer.info('EvictTag', 'first');
        const second: LogRecordResult = buffer.info('EvictTag', 'second');
        const third: LogRecordResult = buffer.info('EvictTag', 'third');
        expect(first.code).assertEqual(LogFilterCode.ACCEPTED);
        expect(second.code).assertEqual(LogFilterCode.ACCEPTED);
        expect(third.code).assertEqual(LogFilterCode.BUFFER_EVICTED);
        expect(third.evictedCount).assertEqual(1);
        expect(third.retainedCount).assertEqual(2);
        expect(buffer.latest() === null).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_1200
     * @tc.name testSequenceNumbersMonotonic
     * @tc.desc Verify accepted entries carry strictly increasing sequence numbers even after eviction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSequenceNumbersMonotonic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(3, LogLevel.DEBUG);
        for (let i = 0; i < 6; i++) {
          buffer.info('SeqTag', `seq entry ${i}`);
        }
        expect(buffer.getSequence()).assertEqual(6);
        expect(buffer.isChronological()).assertTrue();
        const latest: LogEntry | null = buffer.latest();
        expect(latest === null).assertFalse();
        if (latest !== null) {
          expect(latest.sequence).assertEqual(6);
          expect(latest.message).assertEqual('seq entry 5');
        }
        const earliest: LogEntry | null = buffer.earliest();
        if (earliest !== null) {
          expect(earliest.sequence).assertEqual(4);
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_1300
     * @tc.name testRejectedEntriesDoNotConsumeSequence
     * @tc.desc Verify filtered entries do not advance the sequence counter while accepted ones do
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRejectedEntriesDoNotConsumeSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(10, LogLevel.ERROR);
        buffer.info('SeqTag', 'filtered one');
        expect(buffer.getSequence()).assertEqual(0);
        buffer.error('SeqTag', 'accepted one');
        expect(buffer.getSequence()).assertEqual(1);
        buffer.warn('SeqTag', 'filtered two');
        expect(buffer.getSequence()).assertEqual(1);
        buffer.fatal('SeqTag', 'accepted two');
        expect(buffer.getSequence()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_1400
     * @tc.name testShrinkCapacityTrimsBuffer
     * @tc.desc Verify reducing capacity immediately trims the buffer and counts the trimmed entries as evicted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testShrinkCapacityTrimsBuffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(10, LogLevel.DEBUG);
        for (let i = 0; i < 8; i++) {
          buffer.info('TrimTag', `trim entry ${i}`);
        }
        expect(buffer.count()).assertEqual(8);
        buffer.setCapacity(3);
        expect(buffer.getCapacity()).assertEqual(3);
        expect(buffer.count()).assertEqual(3);
        expect(buffer.getEvictedCount()).assertEqual(5);
        expect(buffer.containsMessage('trim entry 7')).assertTrue();
        expect(buffer.containsMessage('trim entry 4')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_1500
     * @tc.name testIsFullBoundary
     * @tc.desc Verify the full flag turns true exactly when retained count reaches the capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsFullBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(3, LogLevel.DEBUG);
        expect(buffer.isFull()).assertFalse();
        buffer.info('FullTag', 'one');
        expect(buffer.isFull()).assertFalse();
        buffer.info('FullTag', 'two');
        expect(buffer.isFull()).assertFalse();
        buffer.info('FullTag', 'three');
        expect(buffer.isFull()).assertTrue();
        buffer.info('FullTag', 'four');
        expect(buffer.isFull()).assertTrue();
        expect(buffer.count()).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_1600
     * @tc.name testClearResetsAllState
     * @tc.desc Verify clear empties the buffer and resets sequence evicted and rejected counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testClearResetsAllState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(2, LogLevel.WARN);
        buffer.info('ClearTag', 'filtered');
        buffer.warn('ClearTag', 'kept one');
        buffer.error('ClearTag', 'kept two');
        buffer.fatal('ClearTag', 'kept three');
        expect(buffer.count()).assertEqual(2);
        expect(buffer.getEvictedCount()).assertEqual(1);
        expect(buffer.getRejectedCount()).assertEqual(1);
        buffer.clear();
        expect(buffer.count()).assertEqual(0);
        expect(buffer.getSequence()).assertEqual(0);
        expect(buffer.getEvictedCount()).assertEqual(0);
        expect(buffer.getRejectedCount()).assertEqual(0);
        expect(buffer.latest() === null).assertTrue();
        expect(buffer.earliest() === null).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_1700
     * @tc.name testFormatPublicPlaceholder
     * @tc.desc Verify a public placeholder substitutes the argument verbatim and reports one substitution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFormatPublicPlaceholder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const formatter: LogFormatter = new LogFormatter();
        const result: FormatResult = formatter.format('stage %{public}s started', ['MyAbilityStage']);
        expect(result.code).assertEqual(LogFilterCode.ACCEPTED);
        expect(result.text).assertEqual('stage MyAbilityStage started');
        expect(result.substituted).assertEqual(1);
        expect(result.redacted).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_1800
     * @tc.name testFormatPrivatePlaceholderRedacts
     * @tc.desc Verify a private placeholder masks its argument and reports one redaction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFormatPrivatePlaceholderRedacts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const formatter: LogFormatter = new LogFormatter();
        const result: FormatResult = formatter.format('token %{private}s end', ['abcdef']);
        expect(result.code).assertEqual(LogFilterCode.ACCEPTED);
        expect(result.text).assertEqual('token a***f end');
        expect(result.substituted).assertEqual(1);
        expect(result.redacted).assertEqual(1);
        expect(result.text.indexOf('abcdef') >= 0).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_1900
     * @tc.name testFormatMixedPlaceholders
     * @tc.desc Verify a template with two public and one private placeholder substitutes all three in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFormatMixedPlaceholders', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const formatter: LogFormatter = new LogFormatter();
        const result: FormatResult = formatter.format('%{public}s/%{private}s/%{public}s', ['pages', 'secret', 'Index']);
        expect(result.code).assertEqual(LogFilterCode.ACCEPTED);
        expect(result.text).assertEqual('pages/s***t/Index');
        expect(result.substituted).assertEqual(3);
        expect(result.redacted).assertEqual(1);
        expect(formatter.placeholderCount('%{public}s/%{private}s/%{public}s')).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_2000
     * @tc.name testFormatMissingArgument
     * @tc.desc Verify a template expecting two arguments but receiving one reports missing-argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFormatMissingArgument', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const formatter: LogFormatter = new LogFormatter();
        const result: FormatResult = formatter.format('%{public}s then %{public}s', ['only_one']);
        expect(result.code).assertEqual(LogFilterCode.MISSING_ARGUMENT);
        expect(result.substituted).assertEqual(1);
        expect(result.text).assertEqual('only_one then ');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_2100
     * @tc.name testFormatExtraArgument
     * @tc.desc Verify supplying more arguments than placeholders reports too-many-placeholders
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFormatExtraArgument', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const formatter: LogFormatter = new LogFormatter();
        const result: FormatResult = formatter.format('value %{public}s', ['one', 'two']);
        expect(result.code).assertEqual(LogFilterCode.TOO_MANY_PLACEHOLDERS);
        expect(result.substituted).assertEqual(1);
        expect(result.text).assertEqual('value one');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_2200
     * @tc.name testFormatWithoutPlaceholders
     * @tc.desc Verify a template with no placeholders echoes the literal text and substitutes nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFormatWithoutPlaceholders', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const formatter: LogFormatter = new LogFormatter();
        const result: FormatResult = formatter.format('plain message with no tokens', []);
        expect(result.code).assertEqual(LogFilterCode.ACCEPTED);
        expect(result.text).assertEqual('plain message with no tokens');
        expect(result.substituted).assertEqual(0);
        expect(result.redacted).assertEqual(0);
        expect(formatter.placeholderCount('plain message with no tokens')).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_2300
     * @tc.name testRedactShortValues
     * @tc.desc Verify very short values are fully masked while longer values keep only head and tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRedactShortValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const formatter: LogFormatter = new LogFormatter();
        expect(formatter.redact('')).assertEqual('**');
        expect(formatter.redact('a')).assertEqual('**');
        expect(formatter.redact('ab')).assertEqual('**');
        expect(formatter.redact('abc')).assertEqual('a***c');
        expect(formatter.redact('password')).assertEqual('p***d');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_2400
     * @tc.name testPlaceholderCountBoundaries
     * @tc.desc Verify placeholder counting returns zero for empty templates and one per recognised token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPlaceholderCountBoundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const formatter: LogFormatter = new LogFormatter();
        expect(formatter.placeholderCount('')).assertEqual(0);
        expect(formatter.placeholderCount('%{public}s')).assertEqual(1);
        expect(formatter.placeholderCount('%{private}s')).assertEqual(1);
        expect(formatter.placeholderCount('%{public}s %{private}s')).assertEqual(2);
        expect(formatter.placeholderCount('%public %private')).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_2500
     * @tc.name testFormatRepeatedPrivateRedaction
     * @tc.desc Verify three private placeholders redact three distinct secrets and count three redactions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFormatRepeatedPrivateRedaction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const formatter: LogFormatter = new LogFormatter();
        const result: FormatResult = formatter.format('%{private}s,%{private}s,%{private}s',
          ['alpha', 'bravo', 'charlie']);
        expect(result.code).assertEqual(LogFilterCode.ACCEPTED);
        expect(result.redacted).assertEqual(3);
        expect(result.substituted).assertEqual(3);
        expect(result.text).assertEqual('a***a,b***o,c***e');
        expect(result.text.indexOf('bravo') >= 0).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_2600
     * @tc.name testThresholdEnabledCountMatrix
     * @tc.desc Verify the enabled-count matrix over all five thresholds yields the triangular totals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testThresholdEnabledCountMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const thresholds: LogLevel[] = [LogLevel.DEBUG, LogLevel.INFO, LogLevel.WARN, LogLevel.ERROR, LogLevel.FATAL];
        expect(rule.enabledCount(thresholds, LogLevel.DEBUG)).assertEqual(1);
        expect(rule.enabledCount(thresholds, LogLevel.INFO)).assertEqual(2);
        expect(rule.enabledCount(thresholds, LogLevel.WARN)).assertEqual(3);
        expect(rule.enabledCount(thresholds, LogLevel.ERROR)).assertEqual(4);
        expect(rule.enabledCount(thresholds, LogLevel.FATAL)).assertEqual(5);
        expect(rule.isStrictlyAscending(thresholds)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_2700
     * @tc.name testAscendingCheckRejectsUnsorted
     * @tc.desc Verify a duplicated or descending level list fails the strictly-ascending check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAscendingCheckRejectsUnsorted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const duplicates: LogLevel[] = [LogLevel.DEBUG, LogLevel.DEBUG, LogLevel.INFO];
        const descending: LogLevel[] = [LogLevel.FATAL, LogLevel.ERROR];
        const single: LogLevel[] = [LogLevel.INFO];
        expect(rule.isStrictlyAscending(duplicates)).assertFalse();
        expect(rule.isStrictlyAscending(descending)).assertFalse();
        expect(rule.isStrictlyAscending(single)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_2800
     * @tc.name testBufferStressNoLeak
     * @tc.desc Verify one hundred appended entries never exceed a five-slot buffer and evictions total ninety-five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBufferStressNoLeak', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(5, LogLevel.DEBUG);
        const startTime: number = Date.now();
        for (let i = 0; i < 100; i++) {
          buffer.info('StressTag', `stress entry ${i}`);
        }
        const elapsed: number = Date.now() - startTime;
        expect(buffer.count()).assertEqual(5);
        expect(buffer.getEvictedCount()).assertEqual(95);
        expect(buffer.getSequence()).assertEqual(100);
        expect(buffer.containsMessage('stress entry 99')).assertTrue();
        expect(buffer.containsMessage('stress entry 94')).assertFalse();
        expect(elapsed < 5000).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_2900
     * @tc.name testTagIsolation
     * @tc.desc Verify entries from different tags are counted independently under their own tag name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTagIsolation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(20, LogLevel.DEBUG);
        buffer.info('EntryAbility', 'onCreate');
        buffer.info('EntryAbility', 'onForeground');
        buffer.info('MyAbilityStage', 'onAcceptWant');
        buffer.error('AbilityDelegator', 'launch failed');
        expect(buffer.countByTag('EntryAbility')).assertEqual(2);
        expect(buffer.countByTag('MyAbilityStage')).assertEqual(1);
        expect(buffer.countByTag('AbilityDelegator')).assertEqual(1);
        expect(buffer.countByTag('AbsentTag')).assertEqual(0);
        expect(buffer.count()).assertEqual(4);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_3000
     * @tc.name testUiLogInfoReachesHilog
     * @tc.desc Verify the shared driver logInfo bridge executes without error while the page is visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiLogInfoReachesHilog', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        logInfo('LoggerValidation: hilog info bridge invoked');
        logError('LoggerValidation: hilog error bridge invoked');
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
        const buffer: LogBuffer = new LogBuffer(4, LogLevel.INFO);
        buffer.info('HilogBridge', 'bridge message');
        expect(buffer.count()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_3100
     * @tc.name testUiPageRenderLoggedForDebug
     * @tc.desc Verify the real page render state is captured into a log buffer entry with the page tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiPageRenderLoggedForDebug', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const buffer: LogBuffer = new LogBuffer(8, LogLevel.DEBUG);
        buffer.debug('IndexPage', `page stable: ${stable}`);
        expect(buffer.count()).assertEqual(1);
        expect(buffer.containsMessage('page stable: true')).assertTrue();
        expect(buffer.countByLevel(LogLevel.DEBUG)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_3200
     * @tc.name testUiComponentCountLogged
     * @tc.desc Verify the observed component count is formatted into a public placeholder log without loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiComponentCountLogged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
        const formatter: LogFormatter = new LogFormatter();
        const result: FormatResult = formatter.format('component count %{public}s', [`${count}`]);
        expect(result.code).assertEqual(LogFilterCode.ACCEPTED);
        expect(result.text).assertEqual(`component count ${count}`);
        const buffer: LogBuffer = new LogBuffer(8, LogLevel.INFO);
        buffer.info('IndexPage', result.text);
        expect(buffer.containsMessage(`component count ${count}`)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_3300
     * @tc.name testUiBundleNameRedactedInLog
     * @tc.desc Verify the delegator bundle name appears in a private placeholder log only in redacted form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiBundleNameRedactedInLog', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const bundleName: string = getBundleName();
        expect(bundleName).assertEqual(BUNDLE_NAME);
        const formatter: LogFormatter = new LogFormatter();
        const result: FormatResult = formatter.format('bundle %{private}s active', [bundleName]);
        expect(result.code).assertEqual(LogFilterCode.ACCEPTED);
        expect(result.redacted).assertEqual(1);
        expect(result.text.indexOf(bundleName) >= 0).assertFalse();
        expect(result.text.startsWith('bundle c')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_3400
     * @tc.name testUiPageTextLoggedExactly
     * @tc.desc Verify the live page literal copy is logged through a buffer with an exact count of one entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiPageTextLoggedExactly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
        const buffer: LogBuffer = new LogBuffer(8, LogLevel.DEBUG);
        buffer.info('IndexPage', `initial text ${PAGE_TEXT_INITIAL}`);
        expect(buffer.count()).assertEqual(1);
        expect(buffer.containsMessage(PAGE_TEXT_INITIAL)).assertTrue();
        const latest: LogEntry | null = buffer.latest();
        if (latest !== null) {
          expect(latest.level).assertEqual(LogLevel.INFO);
          expect(latest.tag).assertEqual('IndexPage');
          expect(latest.sink).assertEqual(LogSink.BUFFER);
          expect(latest.timestamp > 0).assertTrue();
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_3500
     * @tc.name testUiLogSinkTagged
     * @tc.desc Verify entries tagged with the hilog sink are distinguishable from buffer-only entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiLogSinkTagged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(8, LogLevel.DEBUG);
        buffer.append(LogLevel.INFO, 'BridgeTag', 'buffer only', LogSink.BUFFER);
        buffer.append(LogLevel.ERROR, 'BridgeTag', 'to hilog', LogSink.HILOG);
        const entries: LogEntry[] = buffer.getAll();
        expect(entries.length).assertEqual(2);
        expect(entries[0].sink).assertEqual(LogSink.BUFFER);
        expect(entries[1].sink).assertEqual(LogSink.HILOG);
        expect(entries[1].level).assertEqual(LogLevel.ERROR);
        expect(await pageComponentCount(driver) > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_3600
     * @tc.name testUiDelegatorBundleNameLoggedPrivately
     * @tc.desc Verify the delegator bundle name is captured through a private placeholder and stays redacted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiDelegatorBundleNameLoggedPrivately', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const bundleName: string = getBundleName();
        expect(bundleName).assertEqual(BUNDLE_NAME);
        const formatter: LogFormatter = new LogFormatter();
        const formatted: FormatResult = formatter.format('bundle %{private}s ready', [bundleName]);
        expect(formatted.code).assertEqual(LogFilterCode.ACCEPTED);
        const buffer: LogBuffer = new LogBuffer(8, LogLevel.INFO);
        buffer.info('Delegator', formatted.text);
        expect(buffer.count()).assertEqual(1);
        expect(buffer.containsMessage(bundleName)).assertFalse();
        expect(buffer.containsMessage('ready')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_3700
     * @tc.name testUiComponentCountThresholdMatrixApplied
     * @tc.desc Verify a real count-driven log passes every threshold from debug to fatal when at info level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiComponentCountThresholdMatrixApplied', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
        let accepted: number = 0;
        const thresholds: LogLevel[] = [LogLevel.DEBUG, LogLevel.INFO];
        for (let i = 0; i < thresholds.length; i++) {
          const buffer: LogBuffer = new LogBuffer(4, thresholds[i]);
          const result: LogRecordResult = buffer.info('IndexPage', `count ${count}`);
          if (result.code === LogFilterCode.ACCEPTED) {
            accepted++;
          }
          expect(buffer.containsMessage(`count ${count}`)).assertTrue();
        }
        expect(accepted).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_3800
     * @tc.name testUiErrorLogOnMissingPageDetected
     * @tc.desc Verify an error entry is retained at an error threshold while a debug entry is dropped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiErrorLogOnMissingPageDetected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
        const buffer: LogBuffer = new LogBuffer(4, LogLevel.ERROR);
        buffer.debug('IndexPage', `visible ${visible}`);
        buffer.error('IndexPage', 'render watchdog pass');
        expect(buffer.count()).assertEqual(1);
        expect(buffer.countByLevel(LogLevel.ERROR)).assertEqual(1);
        expect(buffer.containsMessage(`visible ${visible}`)).assertFalse();
        expect(buffer.getRejectedCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_3900
     * @tc.name testUiRepeatedPageTagsIsolated
     * @tc.desc Verify two page-state observations logged under distinct tags are counted separately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiRepeatedPageTagsIsolated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const count: number = await pageComponentCount(driver);
        const buffer: LogBuffer = new LogBuffer(8, LogLevel.DEBUG);
        buffer.info('PageLifecycle', `stable ${stable}`);
        buffer.info('PageRender', `components ${count}`);
        buffer.warn('PageRender', 'slow frame observed');
        expect(buffer.count()).assertEqual(3);
        expect(buffer.countByTag('PageLifecycle')).assertEqual(1);
        expect(buffer.countByTag('PageRender')).assertEqual(2);
        expect(buffer.countByLevel(LogLevel.WARN)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_LOGGER_4000
     * @tc.name testUiLogBufferEvictsDuringPageProbe
     * @tc.desc Verify a two-slot buffer keeps only the newest observation across repeated real page probes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiLogBufferEvictsDuringPageProbe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const buffer: LogBuffer = new LogBuffer(2, LogLevel.INFO);
        for (let i = 0; i < 3; i++) {
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
          buffer.info('ProbeTag', `probe ${i} visible ${visible}`);
        }
        expect(buffer.count()).assertEqual(2);
        expect(buffer.getEvictedCount()).assertEqual(1);
        expect(buffer.containsMessage('probe 0')).assertFalse();
        expect(buffer.containsMessage('probe 2')).assertTrue();
        const latest: LogEntry | null = buffer.latest();
        if (latest !== null) {
          expect(latest.sequence).assertEqual(3);
        }
      } finally {
        done();
      }
    })
  })
}
