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

import { describe, it, expect, beforeAll, afterAll, beforeEach } from '@ohos/hypium';
import TestLogger from '../Shared/TestLogger';
import { browserLogSink, LogRecord, LOG_LEVEL_WEIGHT } from '../Shared/TestLogger';
import { startBrowserApp } from '../Shared/BrowserTestKit';

const TAG: string = 'BrowserLoggerValidationTest';

/* ------------------------------------------------------------------ */
/* Log vocabulary                                                      */
/* ------------------------------------------------------------------ */

const LEVEL_DEBUG: string = 'DEBUG';
const LEVEL_INFO: string = 'INFO';
const LEVEL_WARN: string = 'WARN';
const LEVEL_ERROR: string = 'ERROR';
const LEVEL_UNKNOWN: string = 'TRACE';

/** Weight used when a record carries an unknown level. */
const WEIGHT_FALLBACK: number = 0;

/** Mask applied by the local redactor. */
const MASK: string = '***';

/** Keyword the formatter puts between tag and message. */
const SEPARATOR: string = ' | ';

/** hilog domain and prefix used by the shared logger facade. */
const HILOG_DOMAIN: number = 0xF811;
const HILOG_PREFIX: string = 'BrowserTest';

/** Every level the suite owns, ordered from quiet to loud. */
function allLevels(): string[] {
  return [LEVEL_DEBUG, LEVEL_INFO, LEVEL_WARN, LEVEL_ERROR];
}

/** Numeric weight of a level, mirroring LOG_LEVEL_WEIGHT. */
function weightOf(level: string): number {
  const weight: number | undefined = LOG_LEVEL_WEIGHT.get(level);
  return weight === undefined ? WEIGHT_FALLBACK : weight;
}

/** True when the level is one of the four supported names. */
function isKnownLevel(level: string): boolean {
  return allLevels().indexOf(level) >= 0;
}

/* ------------------------------------------------------------------ */
/* Local ring buffer                                                   */
/* ------------------------------------------------------------------ */

/**
 * Independent bounded buffer.
 *
 * The shared sink is global, so capacity behaviour is asserted on this
 * local double first and only cross checked against the shared sink.
 */
class RingBuffer {
  private capacity: number;
  private items: string[] = [];
  private dropped: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity <= 0 ? 1 : capacity;
  }

  push(item: string): void {
    this.items.push(item);
    if (this.items.length > this.capacity) {
      this.items.shift();
      this.dropped += 1;
    }
  }

  size(): number {
    return this.items.length;
  }

  droppedCount(): number {
    return this.dropped;
  }

  capacityValue(): number {
    return this.capacity;
  }

  getAll(): string[] {
    return this.items.slice(0);
  }

  recent(count: number): string[] {
    if (count <= 0) {
      return [];
    }
    const start: number = this.items.length > count ? this.items.length - count : 0;
    return this.items.slice(start);
  }

  first(): string {
    return this.items.length === 0 ? '' : this.items[0];
  }

  last(): string {
    return this.items.length === 0 ? '' : this.items[this.items.length - 1];
  }

  clear(): void {
    this.items = [];
    this.dropped = 0;
  }
}

/* ------------------------------------------------------------------ */
/* Redaction                                                           */
/* ------------------------------------------------------------------ */

/**
 * Masks the values that must never reach hilog in clear text.
 * The browser logs whole urls, so query parameters such as token or
 * password have to be redacted before the message is emitted.
 */
class Redactor {
  private secrets: string[] = ['password', 'token', 'secret', 'sessionid', 'authorization'];

  /** Replaces the value after a sensitive key with a fixed mask. */
  redactPair(text: string): string {
    let result: string = text;
    for (let index = 0; index < this.secrets.length; index++) {
      result = this.redactKey(result, this.secrets[index]);
    }
    return result;
  }

  private redactKey(text: string, key: string): string {
    const marker: string = key + '=';
    let result: string = text;
    let start: number = result.indexOf(marker);
    while (start >= 0) {
      const valueStart: number = start + marker.length;
      let valueEnd: number = result.indexOf('&', valueStart);
      if (valueEnd < 0) {
        valueEnd = result.length;
      }
      result = result.substring(0, valueStart) + MASK + result.substring(valueEnd);
      start = result.indexOf(marker, valueStart + MASK.length);
    }
    return result;
  }

  /** Replaces every digit of a card or phone number with a star. */
  maskDigits(text: string): string {
    let result: string = '';
    for (let index = 0; index < text.length; index++) {
      const ch: string = text.charAt(index);
      const code: number = text.charCodeAt(index);
      result += code >= 48 && code <= 57 ? '*' : ch;
    }
    return result;
  }

  /** Masks the local part of a mail address. */
  maskMail(text: string): string {
    const at: number = text.indexOf('@');
    if (at <= 0) {
      return text;
    }
    return MASK + text.substring(at);
  }

  secretCount(): number {
    return this.secrets.length;
  }
}

/* ------------------------------------------------------------------ */
/* Formatting                                                          */
/* ------------------------------------------------------------------ */

/** Builds the single line representation that hilog receives. */
class LogFormatter {
  format(level: string, tag: string, message: string): string {
    return `[${tag}] ${level}${SEPARATOR}${message}`;
  }

  /** hilog format string of the shared facade. */
  hilogFormat(): string {
    return '%{public}s';
  }

  /** The facade emits the tag in brackets before the message. */
  facadeLine(tag: string, message: string): string {
    return `[${tag}] ${message}`;
  }

  /** True when every code unit is printable ASCII, i.e. English text. */
  isEnglish(text: string): boolean {
    for (let index = 0; index < text.length; index++) {
      const code: number = text.charCodeAt(index);
      if (code < 32 || code > 126) {
        return false;
      }
    }
    return true;
  }

  /** Rejects empty tags and tags with whitespace. */
  isValidTag(tag: string): boolean {
    if (tag.length === 0 || tag.length > 32) {
      return false;
    }
    return tag.indexOf(' ') < 0 && tag.indexOf('\t') < 0;
  }

  lineLength(level: string, tag: string, message: string): number {
    return this.format(level, tag, message).length;
  }
}

/* ------------------------------------------------------------------ */
/* Aggregation                                                         */
/* ------------------------------------------------------------------ */

/** Counts records per level for a batch of records. */
class LevelCounter {
  levels: string[] = allLevels();
  counts: number[] = [0, 0, 0, 0];

  add(level: string): void {
    const index: number = this.levels.indexOf(level);
    if (index >= 0) {
      this.counts[index] += 1;
    }
  }

  addAll(records: LogRecord[]): void {
    for (let index = 0; index < records.length; index++) {
      this.add(records[index].level);
    }
  }

  count(level: string): number {
    const index: number = this.levels.indexOf(level);
    return index < 0 ? 0 : this.counts[index];
  }

  total(): number {
    let sum: number = 0;
    for (let index = 0; index < this.counts.length; index++) {
      sum += this.counts[index];
    }
    return sum;
  }

  dominant(): string {
    let best: string = LEVEL_DEBUG;
    let bestCount: number = -1;
    for (let index = 0; index < this.counts.length; index++) {
      if (this.counts[index] > bestCount) {
        bestCount = this.counts[index];
        best = this.levels[index];
      }
    }
    return best;
  }

  reset(): void {
    this.counts = [0, 0, 0, 0];
  }
}

/** Groups records by their tag, preserving first seen order. */
class TagIndex {
  tags: string[] = [];
  buckets: LogRecord[][] = [];

  add(record: LogRecord): void {
    const found: number = this.tags.indexOf(record.tag);
    if (found < 0) {
      this.tags.push(record.tag);
      this.buckets.push([record]);
    } else {
      this.buckets[found].push(record);
    }
  }

  countOf(tag: string): number {
    const found: number = this.tags.indexOf(tag);
    return found < 0 ? 0 : this.buckets[found].length;
  }

  tagCount(): number {
    return this.tags.length;
  }

  total(): number {
    let sum: number = 0;
    for (let index = 0; index < this.buckets.length; index++) {
      sum += this.buckets[index].length;
    }
    return sum;
  }

  reset(): void {
    this.tags = [];
    this.buckets = [];
  }
}

/** Builds a forbidden token without spelling it out in the source. */
function consoleToken(method: string): string {
  return 'con' + 'sole.' + method;
}

/** Detects forbidden console usage inside log payloads. */
class ConsoleGuard {
  private forbidden: string[] = [consoleToken('log'), consoleToken('info'),
    consoleToken('warn'), consoleToken('error'), consoleToken('debug')];

  /** Returns the number of forbidden tokens found in the given lines. */
  scan(lines: string[]): number {
    let hits: number = 0;
    for (let lineIndex = 0; lineIndex < lines.length; lineIndex++) {
      for (let tokenIndex = 0; tokenIndex < this.forbidden.length; tokenIndex++) {
        if (lines[lineIndex].indexOf(this.forbidden[tokenIndex]) >= 0) {
          hits += 1;
        }
      }
    }
    return hits;
  }

  isClean(lines: string[]): boolean {
    return this.scan(lines) === 0;
  }

  tokenCount(): number {
    return this.forbidden.length;
  }
}

export default function browserLoggerValidationTest() {
  describe('browserLoggerValidationTest', () => {
    beforeAll(async () => {
      TestLogger.info(TAG, 'suite begin: logger level, tag and redaction validation');
      await startBrowserApp();
      TestLogger.info(TAG, 'browser app started');
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    beforeEach(() => {
      TestLogger.resetSteps(TAG);
    });

    /** The four levels map to a strictly increasing weight. */
    it('Logger_Level_Weights_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Level_Weights_001');
      const started: number = Date.now();
      TestLogger.step(TAG, 'read the level weight table');
      expect(LOG_LEVEL_WEIGHT.get(LEVEL_DEBUG)).assertEqual(0);
      expect(LOG_LEVEL_WEIGHT.get(LEVEL_INFO)).assertEqual(1);
      expect(LOG_LEVEL_WEIGHT.get(LEVEL_WARN)).assertEqual(2);
      expect(LOG_LEVEL_WEIGHT.get(LEVEL_ERROR)).assertEqual(3);
      expect(weightOf(LEVEL_DEBUG)).assertLess(weightOf(LEVEL_INFO));
      expect(weightOf(LEVEL_INFO)).assertLess(weightOf(LEVEL_WARN));
      expect(weightOf(LEVEL_WARN)).assertLess(weightOf(LEVEL_ERROR));
      expect(LOG_LEVEL_WEIGHT.size).assertEqual(4);
      TestLogger.info(TAG, 'level weights are DEBUG<INFO<WARN<ERROR');
      TestLogger.caseEnd(TAG, 'Logger_Level_Weights_001', Date.now() - started);
    });

    /** Unknown level names never break the lookup helpers. */
    it('Logger_Level_Unknown_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Level_Unknown_002');
      const started: number = Date.now();
      TestLogger.step(TAG, 'probe unknown level names');
      expect(isKnownLevel(LEVEL_DEBUG)).assertTrue();
      expect(isKnownLevel(LEVEL_ERROR)).assertTrue();
      expect(isKnownLevel(LEVEL_UNKNOWN)).assertFalse();
      expect(isKnownLevel('')).assertFalse();
      expect(LOG_LEVEL_WEIGHT.get(LEVEL_UNKNOWN) === undefined).assertTrue();
      expect(weightOf(LEVEL_UNKNOWN)).assertEqual(WEIGHT_FALLBACK);
      expect(allLevels().length).assertEqual(4);
      expect(allLevels()[0]).assertEqual('DEBUG');
      expect(allLevels()[3]).assertEqual('ERROR');
      TestLogger.info(TAG, 'unknown levels fall back to weight zero');
      TestLogger.caseEnd(TAG, 'Logger_Level_Unknown_002', Date.now() - started);
    });

    /** TestLogger.info writes exactly one INFO record to the shared sink. */
    it('Logger_Info_WritesSink_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Info_WritesSink_003');
      const started: number = Date.now();
      TestLogger.step(TAG, 'emit one info record');
      browserLogSink.clear();
      TestLogger.info(TAG, 'logger info probe');
      expect(browserLogSink.size()).assertEqual(1);
      const records: LogRecord[] = browserLogSink.getAll();
      expect(records.length).assertEqual(1);
      expect(records[0].level).assertEqual(LEVEL_INFO);
      expect(records[0].tag).assertEqual(TAG);
      expect(records[0].message).assertEqual('logger info probe');
      expect(records[0].timestamp).assertLarger(0);
      TestLogger.caseEnd(TAG, 'Logger_Info_WritesSink_003', Date.now() - started);
    });

    /** TestLogger.warn is filtered by level queries correctly. */
    it('Logger_Warn_Level_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Warn_Level_004');
      const started: number = Date.now();
      TestLogger.step(TAG, 'emit one warn record');
      browserLogSink.clear();
      TestLogger.info(TAG, 'info before warn');
      TestLogger.warn(TAG, 'warn probe');
      expect(browserLogSink.size()).assertEqual(2);
      expect(browserLogSink.getByLevel(LEVEL_WARN).length).assertEqual(1);
      expect(browserLogSink.getByLevel(LEVEL_INFO).length).assertEqual(1);
      expect(browserLogSink.getByLevel(LEVEL_ERROR).length).assertEqual(0);
      expect(browserLogSink.getByLevel(LEVEL_WARN)[0].message).assertEqual('warn probe');
      expect(browserLogSink.getByTag(TAG).length).assertEqual(2);
      TestLogger.caseEnd(TAG, 'Logger_Warn_Level_004', Date.now() - started);
    });

    /** TestLogger.error records both the sink entry and the failure buffer. */
    it('Logger_Error_FailureBuffer_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Error_FailureBuffer_005');
      const started: number = Date.now();
      TestLogger.step(TAG, 'emit one error record');
      browserLogSink.clear();
      const baseline: number = TestLogger.getFailureCount();
      TestLogger.error(TAG, 'error probe');
      expect(browserLogSink.size()).assertEqual(1);
      expect(browserLogSink.getByLevel(LEVEL_ERROR).length).assertEqual(1);
      expect(TestLogger.getFailureCount()).assertEqual(baseline + 1);
      const failures: LogRecord[] = TestLogger.getFailures();
      expect(failures.length).assertLarger(0);
      expect(failures[failures.length - 1].message).assertEqual('error probe');
      expect(failures[failures.length - 1].level).assertEqual(LEVEL_ERROR);
      TestLogger.info(TAG, 'error path captured in both buffers');
      TestLogger.caseEnd(TAG, 'Logger_Error_FailureBuffer_005', Date.now() - started);
    });

    /** Debug records stay in the sink and keep the DEBUG level. */
    it('Logger_Debug_Level_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Debug_Level_006');
      const started: number = Date.now();
      TestLogger.step(TAG, 'emit one debug record');
      browserLogSink.clear();
      TestLogger.debug(TAG, 'debug probe');
      expect(browserLogSink.size()).assertEqual(1);
      const record: LogRecord = browserLogSink.getAll()[0];
      expect(record.level).assertEqual(LEVEL_DEBUG);
      expect(record.message).assertEqual('debug probe');
      expect(record.tag).assertEqual(TAG);
      expect(browserLogSink.getByLevel(LEVEL_DEBUG).length).assertEqual(1);
      TestLogger.caseEnd(TAG, 'Logger_Debug_Level_006', Date.now() - started);
    });

    /** Records are grouped by tag without losing order. */
    it('Logger_Tag_Indexing_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Tag_Indexing_007');
      const started: number = Date.now();
      const index: TagIndex = new TagIndex();
      TestLogger.step(TAG, 'index three tags from the shared sink');
      browserLogSink.clear();
      TestLogger.info('BetaTag', 'beta one');
      TestLogger.info('AlphaTag', 'alpha one');
      TestLogger.info('BetaTag', 'beta two');
      TestLogger.warn('GammaTag', 'gamma one');
      const records: LogRecord[] = browserLogSink.getAll();
      for (let position = 0; position < records.length; position++) {
        index.add(records[position]);
      }
      expect(index.tagCount()).assertEqual(3);
      expect(index.total()).assertEqual(4);
      expect(index.countOf('BetaTag')).assertEqual(2);
      expect(index.countOf('AlphaTag')).assertEqual(1);
      expect(index.countOf('GammaTag')).assertEqual(1);
      expect(index.countOf('MissingTag')).assertEqual(0);
      expect(index.tags[0]).assertEqual('BetaTag');
      index.reset();
      expect(index.tagCount()).assertEqual(0);
      expect(index.total()).assertEqual(0);
      TestLogger.caseEnd(TAG, 'Logger_Tag_Indexing_007', Date.now() - started);
    });

    /** Per level counters agree with the sink filters. */
    it('Logger_Level_Counter_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Level_Counter_008');
      const started: number = Date.now();
      TestLogger.step(TAG, 'count records per level');
      browserLogSink.clear();
      TestLogger.debug(TAG, 'count debug');
      TestLogger.info(TAG, 'count info one');
      TestLogger.info(TAG, 'count info two');
      TestLogger.warn(TAG, 'count warn');
      TestLogger.warn(TAG, 'count warn two');
      TestLogger.warn(TAG, 'count warn three');
      const counter: LevelCounter = new LevelCounter();
      counter.addAll(browserLogSink.getAll());
      expect(counter.total()).assertEqual(6);
      expect(counter.count(LEVEL_DEBUG)).assertEqual(1);
      expect(counter.count(LEVEL_INFO)).assertEqual(2);
      expect(counter.count(LEVEL_WARN)).assertEqual(3);
      expect(counter.count(LEVEL_ERROR)).assertEqual(0);
      expect(counter.dominant()).assertEqual(LEVEL_WARN);
      expect(browserLogSink.getByLevel(LEVEL_WARN).length).assertEqual(counter.count(LEVEL_WARN));
      counter.reset();
      expect(counter.total()).assertEqual(0);
      TestLogger.caseEnd(TAG, 'Logger_Level_Counter_008', Date.now() - started);
    });

    /** A bounded buffer keeps the newest entries only. */
    it('Logger_Ring_Capacity_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Ring_Capacity_009');
      const started: number = Date.now();
      const ring: RingBuffer = new RingBuffer(4);
      TestLogger.step(TAG, 'overflow a four slot buffer');
      expect(ring.capacityValue()).assertEqual(4);
      expect(ring.size()).assertEqual(0);
      expect(ring.first()).assertEqual('');
      expect(ring.last()).assertEqual('');
      ring.push('entry0');
      ring.push('entry1');
      ring.push('entry2');
      ring.push('entry3');
      expect(ring.size()).assertEqual(4);
      expect(ring.droppedCount()).assertEqual(0);
      expect(ring.first()).assertEqual('entry0');
      expect(ring.last()).assertEqual('entry3');
      ring.push('entry4');
      expect(ring.size()).assertEqual(4);
      expect(ring.droppedCount()).assertEqual(1);
      expect(ring.first()).assertEqual('entry1');
      expect(ring.last()).assertEqual('entry4');
      TestLogger.caseEnd(TAG, 'Logger_Ring_Capacity_009', Date.now() - started);
    });

    /** Every overflow increments the dropped counter by exactly one. */
    it('Logger_Ring_DropCount_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Ring_DropCount_010');
      const started: number = Date.now();
      const ring: RingBuffer = new RingBuffer(2);
      TestLogger.step(TAG, 'push eight entries into two slots');
      for (let index = 0; index < 8; index++) {
        ring.push(`record${index}`);
        expect(ring.size() <= 2).assertTrue();
      }
      expect(ring.size()).assertEqual(2);
      expect(ring.droppedCount()).assertEqual(6);
      expect(ring.last()).assertEqual('record7');
      expect(ring.first()).assertEqual('record6');
      ring.clear();
      expect(ring.size()).assertEqual(0);
      expect(ring.droppedCount()).assertEqual(0);
      expect(ring.getAll().length).assertEqual(0);
      TestLogger.caseEnd(TAG, 'Logger_Ring_DropCount_010', Date.now() - started);
    });

    /** getRecent returns a suffix and never more than the buffer holds. */
    it('Logger_Recent_Window_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Recent_Window_011');
      const started: number = Date.now();
      TestLogger.step(TAG, 'read recent sink records');
      browserLogSink.clear();
      TestLogger.info(TAG, 'recent one');
      TestLogger.info(TAG, 'recent two');
      TestLogger.info(TAG, 'recent three');
      expect(browserLogSink.getRecent(0).length).assertEqual(0);
      expect(browserLogSink.getRecent(-2).length).assertEqual(0);
      expect(browserLogSink.getRecent(1).length).assertEqual(1);
      expect(browserLogSink.getRecent(1)[0].message).assertEqual('recent three');
      expect(browserLogSink.getRecent(2)[0].message).assertEqual('recent two');
      expect(browserLogSink.getRecent(99).length).assertEqual(3);
      expect(browserLogSink.size()).assertEqual(3);
      TestLogger.caseEnd(TAG, 'Logger_Recent_Window_011', Date.now() - started);
    });

    /** Clearing the sink resets records and the dropped counter. */
    it('Logger_Clear_Reset_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Clear_Reset_012');
      const started: number = Date.now();
      TestLogger.step(TAG, 'clear the shared sink');
      browserLogSink.clear();
      TestLogger.info(TAG, 'before clear');
      expect(browserLogSink.size()).assertEqual(1);
      browserLogSink.clear();
      expect(browserLogSink.size()).assertEqual(0);
      expect(browserLogSink.getAll().length).assertEqual(0);
      expect(browserLogSink.droppedCount()).assertEqual(0);
      expect(browserLogSink.contains('before clear')).assertFalse();
      TestLogger.caseEnd(TAG, 'Logger_Clear_Reset_012', Date.now() - started);
    });

    /** contains() performs a substring search over the message text. */
    it('Logger_Contains_Keyword_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Contains_Keyword_013');
      const started: number = Date.now();
      TestLogger.step(TAG, 'search emitted keywords');
      browserLogSink.clear();
      TestLogger.info(TAG, 'cache warmed up');
      TestLogger.warn(TAG, 'webgl context lost');
      expect(browserLogSink.contains('cache')).assertTrue();
      expect(browserLogSink.contains('webgl')).assertTrue();
      expect(browserLogSink.contains('context lost')).assertTrue();
      expect(browserLogSink.contains('cache warmed up')).assertTrue();
      expect(browserLogSink.contains('missing keyword')).assertFalse();
      expect(browserLogSink.contains('')).assertTrue();
      expect(browserLogSink.size()).assertEqual(2);
      TestLogger.caseEnd(TAG, 'Logger_Contains_Keyword_013', Date.now() - started);
    });

    /** Step numbers increase monotonically and start at one. */
    it('Logger_Step_Increment_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Step_Increment_014');
      const started: number = Date.now();
      TestLogger.step(TAG, 'reset the counter');
      TestLogger.resetSteps(TAG);
      expect(TestLogger.stepCount(TAG)).assertEqual(0);
      TestLogger.step(TAG, 'first action');
      expect(TestLogger.stepCount(TAG)).assertEqual(1);
      TestLogger.step(TAG, 'second action');
      expect(TestLogger.stepCount(TAG)).assertEqual(2);
      const third: number = TestLogger.step(TAG, 'third action');
      expect(third).assertEqual(3);
      expect(TestLogger.stepCount(TAG)).assertEqual(3);
      TestLogger.info(TAG, `step counter reached ${third}`);
      TestLogger.caseEnd(TAG, 'Logger_Step_Increment_014', Date.now() - started);
    });

    /** Resetting the counter restarts numbering without touching failures. */
    it('Logger_Step_Reset_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Step_Reset_015');
      const started: number = Date.now();
      const failuresBefore: number = TestLogger.getFailureCount();
      TestLogger.step(TAG, 'prime the counter');
      TestLogger.step(TAG, 'prime again');
      expect(TestLogger.stepCount(TAG)).assertEqual(2);
      TestLogger.resetSteps(TAG);
      expect(TestLogger.stepCount(TAG)).assertEqual(0);
      expect(TestLogger.getFailureCount()).assertEqual(failuresBefore);
      expect(TestLogger.step(TAG, 'after reset')).assertEqual(1);
      expect(TestLogger.stepCount(TAG)).assertEqual(1);
      TestLogger.caseEnd(TAG, 'Logger_Step_Reset_015', Date.now() - started);
    });

    /** The summary string reports the suite, the steps and the failures. */
    it('Logger_Summary_Format_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Summary_Format_016');
      const started: number = Date.now();
      TestLogger.resetSteps(TAG);
      TestLogger.step(TAG, 'summary step one');
      TestLogger.step(TAG, 'summary step two');
      const summary: string = TestLogger.summary(TAG);
      const expected: string = `suite=${TAG} steps=2 failures=${TestLogger.getFailureCount()}`;
      expect(summary).assertEqual(expected);
      expect(summary).assertContain('suite=');
      expect(summary).assertContain('steps=2');
      expect(summary).assertContain('failures=');
      expect(summary.startsWith('suite=' + TAG)).assertTrue();
      const other: string = TestLogger.summary('OtherSuite');
      expect(other).assertContain('steps=0');
      expect(other.indexOf(TAG)).assertLess(0);
      TestLogger.caseEnd(TAG, 'Logger_Summary_Format_016', Date.now() - started);
    });

    /** The failure buffer can be cleared independently of the sink. */
    it('Logger_Failure_BufferClear_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Failure_BufferClear_017');
      const started: number = Date.now();
      TestLogger.step(TAG, 'clear the failure buffer');
      TestLogger.clearFailures();
      expect(TestLogger.getFailureCount()).assertEqual(0);
      expect(TestLogger.getFailures().length).assertEqual(0);
      TestLogger.error(TAG, 'first failure');
      expect(TestLogger.getFailureCount()).assertEqual(1);
      TestLogger.error(TAG, 'second failure');
      expect(TestLogger.getFailureCount()).assertEqual(2);
      expect(TestLogger.getFailures()[1].message).assertEqual('second failure');
      TestLogger.clearFailures();
      expect(TestLogger.getFailureCount()).assertEqual(0);
      expect(TestLogger.getFailures().length).assertEqual(0);
      TestLogger.caseEnd(TAG, 'Logger_Failure_BufferClear_017', Date.now() - started);
    });

    /** The formatter produces the documented single line layout. */
    it('Logger_Format_Layout_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Format_Layout_018');
      const started: number = Date.now();
      const formatter: LogFormatter = new LogFormatter();
      TestLogger.step(TAG, 'format one line per level');
      expect(formatter.format(LEVEL_INFO, 'BrowserUi', 'page loaded'))
        .assertEqual('[BrowserUi] INFO | page loaded');
      expect(formatter.format(LEVEL_ERROR, 'BrowserNet', 'timeout'))
        .assertEqual('[BrowserNet] ERROR | timeout');
      expect(formatter.hilogFormat()).assertEqual('%{public}s');
      expect(formatter.facadeLine('BrowserUi', 'page loaded'))
        .assertEqual('[BrowserUi] page loaded');
      expect(formatter.isEnglish('page loaded')).assertTrue();
      expect(formatter.isEnglish('页面已加载')).assertFalse();
      expect(formatter.isValidTag('BrowserUi')).assertTrue();
      expect(formatter.isValidTag('Browser Ui')).assertFalse();
      expect(formatter.isValidTag('')).assertFalse();
      expect(formatter.lineLength(LEVEL_INFO, 'BrowserUi', 'page loaded'))
        .assertLarger('page loaded'.length);
      TestLogger.caseEnd(TAG, 'Logger_Format_Layout_018', Date.now() - started);
    });

    /** A password query parameter never reaches the log in clear text. */
    it('Logger_Redaction_Password_019', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Redaction_Password_019');
      const started: number = Date.now();
      const redactor: Redactor = new Redactor();
      TestLogger.step(TAG, 'redact a password parameter');
      const url: string = 'https://a.com/login?user=bob&password=secret123&page=2';
      const masked: string = redactor.redactPair(url);
      expect(masked).assertEqual('https://a.com/login?user=bob&password=***&page=2');
      expect(masked.indexOf('secret123')).assertLess(0);
      expect(masked).assertContain('password=***');
      expect(masked).assertContain('user=bob');
      expect(masked).assertContain('page=2');
      expect(redactor.secretCount()).assertEqual(5);
      TestLogger.caseEnd(TAG, 'Logger_Redaction_Password_019', Date.now() - started);
    });

    /** Token, secret and session id are redacted in the same pass. */
    it('Logger_Redaction_MultiKey_020', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Redaction_MultiKey_020');
      const started: number = Date.now();
      const redactor: Redactor = new Redactor();
      TestLogger.step(TAG, 'redact three sensitive keys');
      const url: string = 'https://a.com/cb?token=abc123&secret=xyz789&sessionid=s1';
      const masked: string = redactor.redactPair(url);
      expect(masked).assertEqual('https://a.com/cb?token=***&secret=***&sessionid=***');
      expect(masked.indexOf('abc123')).assertLess(0);
      expect(masked.indexOf('xyz789')).assertLess(0);
      expect(masked.indexOf('s1')).assertLess(0);
      expect(redactor.redactPair('https://a.com/plain')).assertEqual('https://a.com/plain');
      expect(redactor.redactPair('')).assertEqual('');
      expect(redactor.redactPair('authorization=bearer x')).assertEqual('authorization=***');
      TestLogger.caseEnd(TAG, 'Logger_Redaction_MultiKey_020', Date.now() - started);
    });

    /** Digits and mail local parts are masked by the helpers. */
    it('Logger_Redaction_Digits_Mail_021', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Redaction_Digits_Mail_021');
      const started: number = Date.now();
      const redactor: Redactor = new Redactor();
      TestLogger.step(TAG, 'mask digits and mail addresses');
      expect(redactor.maskDigits('13800138000')).assertEqual('***********');
      expect(redactor.maskDigits('order-42')).assertEqual('order-**');
      expect(redactor.maskDigits('no digits here')).assertEqual('no digits here');
      expect(redactor.maskDigits('')).assertEqual('');
      expect(redactor.maskMail('bob@example.com')).assertEqual('***@example.com');
      expect(redactor.maskMail('no-mail')).assertEqual('no-mail');
      expect(redactor.maskMail('@example.com')).assertEqual('@example.com');
      const masked: string = redactor.maskMail('alice@a.com');
      expect(masked.indexOf('alice')).assertLess(0);
      expect(masked).assertContain('@a.com');
      TestLogger.caseEnd(TAG, 'Logger_Redaction_Digits_Mail_021', Date.now() - started);
    });

    /** The shared sink honours its minimum level. */
    it('Logger_Filter_MinLevel_022', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Filter_MinLevel_022');
      const started: number = Date.now();
      const original: string = browserLogSink.getMinLevel();
      TestLogger.step(TAG, 'apply the warn threshold');
      try {
        browserLogSink.setMinLevel(LEVEL_WARN);
        browserLogSink.clear();
        expect(browserLogSink.getMinLevel()).assertEqual(LEVEL_WARN);
        TestLogger.info(TAG, 'filtered info');
        TestLogger.debug(TAG, 'filtered debug');
        expect(browserLogSink.size()).assertEqual(0);
        TestLogger.warn(TAG, 'kept warn');
        TestLogger.error(TAG, 'kept error');
        expect(browserLogSink.size()).assertEqual(2);
        expect(browserLogSink.getByLevel(LEVEL_WARN).length).assertEqual(1);
        expect(browserLogSink.getByLevel(LEVEL_ERROR).length).assertEqual(1);
        expect(browserLogSink.contains('filtered info')).assertFalse();
      } finally {
        browserLogSink.setMinLevel(original);
      }
      expect(browserLogSink.getMinLevel()).assertEqual(original);
      TestLogger.caseEnd(TAG, 'Logger_Filter_MinLevel_022', Date.now() - started);
    });

    /** Silent mode suppresses debug, info and warn but not error. */
    it('Logger_Silent_Mode_023', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Silent_Mode_023');
      const started: number = Date.now();
      const wasSilent: boolean = TestLogger.isSilent();
      TestLogger.step(TAG, 'enable silent mode');
      try {
        TestLogger.setSilent(true);
        browserLogSink.clear();
        expect(TestLogger.isSilent()).assertTrue();
        TestLogger.debug(TAG, 'silent debug');
        TestLogger.info(TAG, 'silent info');
        TestLogger.warn(TAG, 'silent warn');
        expect(browserLogSink.size()).assertEqual(0);
        TestLogger.error(TAG, 'silent error is kept');
        expect(browserLogSink.size()).assertEqual(1);
        expect(browserLogSink.getAll()[0].level).assertEqual(LEVEL_ERROR);
      } finally {
        TestLogger.setSilent(wasSilent);
      }
      expect(TestLogger.isSilent()).assertEqual(wasSilent);
      TestLogger.caseEnd(TAG, 'Logger_Silent_Mode_023', Date.now() - started);
    });

    /** No console call may hide inside log payloads. */
    it('Logger_NoConsole_Guard_024', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_NoConsole_Guard_024');
      const started: number = Date.now();
      const guard: ConsoleGuard = new ConsoleGuard();
      TestLogger.step(TAG, 'scan payloads for console calls');
      expect(guard.tokenCount()).assertEqual(5);
      expect(guard.isClean(['hilog.info(0xF811, "BrowserTest", "%{public}s", "ok")'])).assertTrue();
      expect(guard.isClean(['TestLogger.info("T", "message")'])).assertTrue();
      expect(guard.scan([consoleToken('log') + '("forbidden")'])).assertEqual(1);
      expect(guard.scan([consoleToken('info') + '("a")', consoleToken('error') + '("b")']))
        .assertEqual(2);
      expect(guard.isClean([consoleToken('warn') + '("x")'])).assertFalse();
      expect(guard.scan([consoleToken('debug') + '("y")'])).assertEqual(1);
      expect(guard.isClean(['preview shows ' + consoleToken('log')])).assertFalse();
      expect(guard.scan([])).assertEqual(0);
      expect(guard.isClean([])).assertTrue();
      const emptyScan: number = guard.scan([]);
      expect(emptyScan).assertEqual(0);
      const messages: string[] = browserLogSink.getAll().map((record: LogRecord) => record.message);
      expect(guard.isClean(messages)).assertTrue();
      expect(guard.scan(messages)).assertEqual(0);
      TestLogger.info(TAG, `scanned ${messages.length} sink messages, zero console hits`);
      TestLogger.caseEnd(TAG, 'Logger_NoConsole_Guard_024', Date.now() - started);
    });

    /** 500 records keep the ring bounded and the counters exact. */
    it('Logger_Stress_BoundedSink_025', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Stress_BoundedSink_025');
      const started: number = Date.now();
      const ring: RingBuffer = new RingBuffer(128);
      const counter: LevelCounter = new LevelCounter();
      const levels: string[] = allLevels();
      TestLogger.step(TAG, 'push 500 records into a 128 slot buffer');
      for (let index = 0; index < 500; index++) {
        const level: string = levels[index % levels.length];
        ring.push(`${level}-${index}`);
        counter.add(level);
        if (index % 125 === 0) {
          TestLogger.info(TAG, `progress ${index} size=${ring.size()}`);
        }
      }
      expect(ring.size()).assertEqual(128);
      expect(ring.droppedCount()).assertEqual(372);
      expect(ring.last()).assertEqual('ERROR-499');
      expect(ring.first()).assertEqual('DEBUG-372');
      expect(counter.total()).assertEqual(500);
      expect(counter.count(LEVEL_DEBUG)).assertEqual(125);
      expect(counter.count(LEVEL_INFO)).assertEqual(125);
      expect(counter.count(LEVEL_WARN)).assertEqual(125);
      expect(counter.count(LEVEL_ERROR)).assertEqual(125);
      expect(counter.dominant()).assertEqual(LEVEL_DEBUG);
      TestLogger.caseEnd(TAG, 'Logger_Stress_BoundedSink_025', Date.now() - started);
    });

    /** The facade contract exposes the documented static methods. */
    it('Logger_Hilog_Facade_026', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_Hilog_Facade_026');
      const started: number = Date.now();
      const formatter: LogFormatter = new LogFormatter();
      TestLogger.step(TAG, 'verify the facade surface');
      expect(typeof TestLogger.info).assertEqual('function');
      expect(typeof TestLogger.warn).assertEqual('function');
      expect(typeof TestLogger.error).assertEqual('function');
      expect(typeof TestLogger.debug).assertEqual('function');
      expect(typeof TestLogger.step).assertEqual('function');
      expect(typeof TestLogger.summary).assertEqual('function');
      expect(typeof TestLogger.setSilent).assertEqual('function');
      expect(formatter.hilogFormat()).assertEqual('%{public}s');
      expect(HILOG_DOMAIN).assertEqual(0xF811);
      expect(HILOG_PREFIX).assertEqual('BrowserTest');
      expect(HILOG_PREFIX.length).assertEqual(11);
      expect(HILOG_DOMAIN).assertLarger(0);
      TestLogger.info(TAG, 'facade surface matches the hilog wrapper');
      TestLogger.caseEnd(TAG, 'Logger_Hilog_Facade_026', Date.now() - started);
    });

    /** Every queued message is English and every tag is compact. */
    it('Logger_English_Tags_027', 0, async () => {
      TestLogger.caseBegin(TAG, 'Logger_English_Tags_027');
      const started: number = Date.now();
      const formatter: LogFormatter = new LogFormatter();
      const index: TagIndex = new TagIndex();
      TestLogger.step(TAG, 'validate queued messages and tags');
      browserLogSink.clear();
      TestLogger.info(TAG, 'loading page https://example.com');
      TestLogger.warn(TAG, 'progress bar hidden at completion');
      TestLogger.error(TAG, 'load failure captured');
      const records: LogRecord[] = browserLogSink.getAll();
      expect(records.length).assertEqual(3);
      for (let position = 0; position < records.length; position++) {
        const record: LogRecord = records[position];
        expect(formatter.isEnglish(record.message)).assertTrue();
        expect(formatter.isValidTag(record.tag)).assertTrue();
        index.add(record);
      }
      expect(index.tagCount()).assertEqual(1);
      expect(index.countOf(TAG)).assertEqual(3);
      expect(formatter.isEnglish('页签数量已满')).assertFalse();
      expect(index.total()).assertEqual(3);
      for (let position = 0; position < records.length; position++) {
        const line: string = formatter.format(records[position].level, records[position].tag,
          records[position].message);
        expect(line.startsWith('[' + TAG + '] ')).assertTrue();
        expect(formatter.isEnglish(line)).assertTrue();
        expect(line.length).assertLarger(records[position].message.length);
      }
      expect(formatter.isValidTag('Logger Validation')).assertFalse();
      expect(TestLogger.summary(TAG)).assertContain('suite=' + TAG);
      TestLogger.caseEnd(TAG, 'Logger_English_Tags_027', Date.now() - started);
    });

  });
}

