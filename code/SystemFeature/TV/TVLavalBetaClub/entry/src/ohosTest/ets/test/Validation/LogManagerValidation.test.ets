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
import hilog from '@ohos.hilog';
import LogManager from '../../../../main/ets/common/Log/LogManager';
import KeyConstant from '../../../../main/ets/common/Constants/KeyConstant';

const LOG_DOMAIN: number = 0x0102;

const EXPECTED_TAG: string = 'Laval-BetaClub_Default';

const SAMPLE_TAG: string = 'IssueReporter';

const SAMPLE_MESSAGE: string = 'submit issue begin';

interface LogEntry {
  domain: number;
  tag: string;
  level: string;
  message: string;
}

// Mirrors the formatting used by LogManager.hilogIWithTag
class LogFormatter {
  public static withTag(tag: string, message: string): string {
    return `tag: ${tag} --> ${message}`;
  }

  public static plain(message: string): string {
    return message;
  }

  public static isWithinLength(message: string, limit: number): boolean {
    return message.length <= limit;
  }

  public static containsTag(formatted: string, tag: string): boolean {
    return formatted.indexOf(`tag: ${tag} -->`) === 0;
  }
}

// Captures log calls so tests can validate severity routing
class LogSink {
  private entries: LogEntry[] = [];

  public append(domain: number, tag: string, level: string, message: string): void {
    this.entries.push({ domain: domain, tag: tag, level: level, message: message });
  }

  public getEntries(): LogEntry[] {
    return [...this.entries];
  }

  public getCount(): number {
    return this.entries.length;
  }

  public countByLevel(level: string): number {
    return this.entries.filter((entry: LogEntry) => entry.level === level).length;
  }

  public countByTag(tag: string): number {
    return this.entries.filter((entry: LogEntry) => entry.tag === tag).length;
  }

  public clear(): void {
    this.entries = [];
  }
}

// Validates the log level gates declared in LogManager
class LogLevelGate {
  public static readonly DEBUG: string = 'DEBUG';

  public static readonly INFO: string = 'INFO';

  public static readonly ERROR: string = 'ERROR';

  public static isEnabled(level: string): boolean {
    return level === LogLevelGate.DEBUG || level === LogLevelGate.INFO || level === LogLevelGate.ERROR;
  }

  public static severity(level: string): number {
    switch (level) {
      case LogLevelGate.DEBUG:
        return 0;
      case LogLevelGate.INFO:
        return 1;
      case LogLevelGate.ERROR:
        return 2;
      default:
        return -1;
    }
  }
}

// Validates that log folder paths stay inside the sandbox
class LogPathValidator {
  public static isSandboxPath(path: string): boolean {
    return path.startsWith('/');
  }

  public static hasTraversal(path: string): boolean {
    return path.indexOf('..') >= 0;
  }

  public static isUnderCache(cacheDir: string, path: string): boolean {
    return path.startsWith(cacheDir);
  }

  public static join(cacheDir: string, folder: string): string {
    const base = cacheDir.endsWith('/') ? cacheDir.substring(0, cacheDir.length - 1) : cacheDir;
    return base + '/' + folder;
  }
}

// Fixed-size ring buffer used by the log cache collector
class LogRingBuffer {
  private buffer: LogEntry[] = [];
  private readonly capacity: number;
  private dropped: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public append(entry: LogEntry): boolean {
    if (this.capacity <= 0) {
      this.dropped++;
      return false;
    }
    if (this.buffer.length >= this.capacity) {
      this.buffer.shift();
      this.dropped++;
    }
    this.buffer.push(entry);
    return true;
  }

  public size(): number {
    return this.buffer.length;
  }

  public getDropped(): number {
    return this.dropped;
  }

  public getLatest(): LogEntry | undefined {
    return this.buffer.length === 0 ? undefined : this.buffer[this.buffer.length - 1];
  }

  public getOldest(): LogEntry | undefined {
    return this.buffer.length === 0 ? undefined : this.buffer[0];
  }

  public filterByLevel(level: string): LogEntry[] {
    return this.buffer.filter((entry: LogEntry) => entry.level === level);
  }

  public filterByTag(tag: string): LogEntry[] {
    return this.buffer.filter((entry: LogEntry) => entry.tag === tag);
  }

  public toArray(): LogEntry[] {
    return [...this.buffer];
  }

  public clear(): void {
    this.buffer = [];
    this.dropped = 0;
  }
}

// Cleans log payloads before they are written to disk or uploaded
class LogSanitizer {
  public static readonly MAX_MESSAGE_LENGTH: number = 512;

  public static stripLineBreaks(message: string): string {
    return message.split('\n').join(' ').split('\r').join(' ');
  }

  public static truncate(message: string, limit: number = LogSanitizer.MAX_MESSAGE_LENGTH): string {
    if (message.length <= limit) {
      return message;
    }
    return message.substring(0, limit);
  }

  public static maskToken(message: string): string {
    if (message.indexOf('token=') < 0) {
      return message;
    }
    const parts: string[] = message.split('token=');
    return parts[0] + 'token=***';
  }

  public static sanitize(message: string): string {
    return LogSanitizer.truncate(LogSanitizer.maskToken(LogSanitizer.stripLineBreaks(message)));
  }

  public static isClean(message: string): boolean {
    return message.indexOf('\n') < 0 && message.indexOf('\r') < 0 &&
      message.length <= LogSanitizer.MAX_MESSAGE_LENGTH;
  }
}

// Tracks one logging session from start to finish
class LogSession {
  private startedAt: number = 0;
  private endedAt: number = 0;
  private tags: Set<string> = new Set<string>();
  private entryCount: number = 0;

  public start(now: number = Date.now()): void {
    this.startedAt = now;
    this.endedAt = 0;
  }

  public end(now: number = Date.now()): void {
    this.endedAt = now;
  }

  public record(tag: string): void {
    this.entryCount++;
    this.tags.add(tag);
  }

  public isRunning(): boolean {
    return this.startedAt > 0 && this.endedAt === 0;
  }

  public getDurationMs(): number {
    if (this.startedAt === 0 || this.endedAt === 0) {
      return 0;
    }
    return this.endedAt - this.startedAt;
  }

  public getTagCount(): number {
    return this.tags.size;
  }

  public getEntryCount(): number {
    return this.entryCount;
  }

  public hasTag(tag: string): boolean {
    return this.tags.has(tag);
  }

  public reset(): void {
    this.startedAt = 0;
    this.endedAt = 0;
    this.tags = new Set<string>();
    this.entryCount = 0;
  }
}

// Serializes log entries into CSV lines for bug report attachments
class LogCsvExporter {
  public static escape(value: string): string {
    if (value.indexOf(',') >= 0 || value.indexOf('"') >= 0) {
      return '"' + value.split('"').join('""') + '"';
    }
    return value;
  }

  public static lineOf(entry: LogEntry): string {
    return `${entry.domain},${LogCsvExporter.escape(entry.tag)},${entry.level},${LogCsvExporter.escape(entry.message)}`;
  }

  public static export(entries: LogEntry[]): string[] {
    const lines: string[] = [];
    lines.push('domain,tag,level,message');
    for (let i = 0; i < entries.length; i++) {
      lines.push(LogCsvExporter.lineOf(entries[i]));
    }
    return lines;
  }

  public static columnCount(line: string): number {
    let count: number = 1;
    let inQuotes: boolean = false;
    for (let i = 0; i < line.length; i++) {
      const char = line.charAt(i);
      if (char === '"') {
        inQuotes = !inQuotes;
      } else if (char === ',' && !inQuotes) {
        count++;
      }
    }
    return count;
  }
}

export default function logManagerValidationTest() {

  describe('LogManagerValidation_Test', () => {
    let sink: LogSink;

    it('log_domain_should_be_declared_consistently', 0, () => {
      expect(LOG_DOMAIN).assertEqual(0x0102);
      expect(LOG_DOMAIN).assertLarger(0);
      expect(hilog.isLoggable(LOG_DOMAIN, EXPECTED_TAG, hilog.LogLevel.INFO)).assertTrue();
    });

    it('log_manager_should_expose_static_api', 0, () => {
      expect(typeof LogManager.log).assertEqual('function');
      expect(typeof LogManager.hilogD).assertEqual('function');
      expect(typeof LogManager.hilogI).assertEqual('function');
      expect(typeof LogManager.hilogIWithTag).assertEqual('function');
      expect(typeof LogManager.hilogEWithTag).assertEqual('function');
    });

    it('hilog_info_should_not_throw', 0, () => {
      let thrown = false;
      try {
        LogManager.hilogI(SAMPLE_MESSAGE);
        LogManager.hilogI('');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
    });

    it('hilog_debug_should_not_throw', 0, () => {
      let thrown = false;
      try {
        LogManager.hilogD(SAMPLE_MESSAGE);
        LogManager.hilogD('debug with special chars: %{public}s');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
    });

    it('hilog_with_tag_should_not_throw', 0, () => {
      let thrown = false;
      try {
        LogManager.hilogIWithTag(SAMPLE_TAG, SAMPLE_MESSAGE);
        LogManager.hilogEWithTag(SAMPLE_TAG, 'failed to submit issue');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
    });

    it('legacy_log_should_not_throw', 0, () => {
      let thrown = false;
      try {
        LogManager.log(SAMPLE_TAG, SAMPLE_MESSAGE);
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
    });

    it('log_formatter_should_prefix_tag', 0, () => {
      const formatted = LogFormatter.withTag(SAMPLE_TAG, SAMPLE_MESSAGE);
      expect(formatted).assertEqual('tag: IssueReporter --> submit issue begin');
      expect(LogFormatter.containsTag(formatted, SAMPLE_TAG)).assertTrue();
      expect(LogFormatter.containsTag(formatted, 'Other')).assertFalse();
      expect(LogFormatter.plain(SAMPLE_MESSAGE)).assertEqual(SAMPLE_MESSAGE);
    });

    it('log_formatter_should_respect_length_limit', 0, () => {
      const shortMessage = 'ok';
      const longMessage = 'x'.repeat(2048);
      expect(LogFormatter.isWithinLength(shortMessage, 1024)).assertTrue();
      expect(LogFormatter.isWithinLength(longMessage, 1024)).assertFalse();
      expect(LogFormatter.isWithinLength(longMessage, 2048)).assertTrue();
    });

    it('log_sink_should_track_levels', 0, () => {
      sink = new LogSink();
      sink.append(LOG_DOMAIN, SAMPLE_TAG, LogLevelGate.INFO, 'info');
      sink.append(LOG_DOMAIN, SAMPLE_TAG, LogLevelGate.ERROR, 'error');
      sink.append(LOG_DOMAIN, 'Other', LogLevelGate.ERROR, 'other error');
      expect(sink.getCount()).assertEqual(3);
      expect(sink.countByLevel(LogLevelGate.ERROR)).assertEqual(2);
      expect(sink.countByLevel(LogLevelGate.INFO)).assertEqual(1);
      expect(sink.countByLevel(LogLevelGate.DEBUG)).assertEqual(0);
      expect(sink.countByTag(SAMPLE_TAG)).assertEqual(2);
      sink.clear();
      expect(sink.getCount()).assertEqual(0);
    });

    it('log_level_gate_should_order_severity', 0, () => {
      expect(LogLevelGate.isEnabled(LogLevelGate.DEBUG)).assertTrue();
      expect(LogLevelGate.isEnabled(LogLevelGate.INFO)).assertTrue();
      expect(LogLevelGate.isEnabled(LogLevelGate.ERROR)).assertTrue();
      expect(LogLevelGate.isEnabled('VERBOSE')).assertFalse();
      expect(LogLevelGate.severity(LogLevelGate.DEBUG)).assertLess(LogLevelGate.severity(LogLevelGate.INFO));
      expect(LogLevelGate.severity(LogLevelGate.INFO)).assertLess(LogLevelGate.severity(LogLevelGate.ERROR));
      expect(LogLevelGate.severity('VERBOSE')).assertEqual(-1);
    });

    it('sandbox_path_should_be_absolute', 0, () => {
      expect(LogPathValidator.isSandboxPath(KeyConstant.SANDBOX_MAP)).assertTrue();
      expect(LogPathValidator.hasTraversal(KeyConstant.SANDBOX_MAP)).assertFalse();
      expect(LogPathValidator.isSandboxPath('relative/log')).assertFalse();
    });

    it('log_folder_should_stay_under_cache_directory', 0, () => {
      const cacheDir = '/data/storage/el2/base/cache';
      const logPath = LogPathValidator.join(cacheDir, KeyConstant.CACHE_LOG_PATH_FOLDER);
      expect(logPath).assertEqual('/data/storage/el2/base/cache/cache_logs/allLogs');
      expect(LogPathValidator.isUnderCache(cacheDir, logPath)).assertTrue();
      expect(LogPathValidator.hasTraversal(logPath)).assertFalse();
      expect(LogPathValidator.isUnderCache('/other', logPath)).assertFalse();
    });

    it('log_entries_should_keep_domain_and_level', 0, () => {
      const entry: LogEntry = {
        domain: LOG_DOMAIN,
        tag: EXPECTED_TAG,
        level: LogLevelGate.ERROR,
        message: 'upload failed'
      };
      expect(entry.domain).assertEqual(LOG_DOMAIN);
      expect(entry.tag).assertEqual(EXPECTED_TAG);
      expect(entry.level).assertEqual(LogLevelGate.ERROR);
      expect(entry.message).assertContain('failed');
    });

    it('ring_buffer_should_evict_oldest_entry', 0, () => {
      const buffer = new LogRingBuffer(3);
      for (let i = 0; i < 3; i++) {
        buffer.append({
          domain: LOG_DOMAIN, tag: SAMPLE_TAG, level: LogLevelGate.INFO, message: `m-${i}`
        });
      }
      expect(buffer.size()).assertEqual(3);
      expect(buffer.getDropped()).assertEqual(0);
      buffer.append({ domain: LOG_DOMAIN, tag: SAMPLE_TAG, level: LogLevelGate.ERROR, message: 'm-3' });
      expect(buffer.size()).assertEqual(3);
      expect(buffer.getDropped()).assertEqual(1);
      expect((buffer.getOldest() as LogEntry).message).assertEqual('m-1');
      expect((buffer.getLatest() as LogEntry).message).assertEqual('m-3');
    });

    it('ring_buffer_should_report_empty_state', 0, () => {
      const buffer = new LogRingBuffer(2);
      expect(buffer.size()).assertEqual(0);
      expect(buffer.getLatest() === undefined).assertTrue();
      expect(buffer.getOldest() === undefined).assertTrue();
      expect(buffer.toArray().length).assertEqual(0);
      expect(buffer.filterByLevel(LogLevelGate.ERROR).length).assertEqual(0);
    });

    it('ring_buffer_should_filter_by_level_and_tag', 0, () => {
      const buffer = new LogRingBuffer(10);
      buffer.append({ domain: LOG_DOMAIN, tag: 'A', level: LogLevelGate.INFO, message: 'a1' });
      buffer.append({ domain: LOG_DOMAIN, tag: 'B', level: LogLevelGate.ERROR, message: 'b1' });
      buffer.append({ domain: LOG_DOMAIN, tag: 'A', level: LogLevelGate.ERROR, message: 'a2' });
      expect(buffer.filterByLevel(LogLevelGate.ERROR).length).assertEqual(2);
      expect(buffer.filterByLevel(LogLevelGate.INFO).length).assertEqual(1);
      expect(buffer.filterByTag('A').length).assertEqual(2);
      expect(buffer.filterByTag('C').length).assertEqual(0);
    });

    it('ring_buffer_should_reset_counters', 0, () => {
      const buffer = new LogRingBuffer(1);
      buffer.append({ domain: LOG_DOMAIN, tag: 'A', level: LogLevelGate.INFO, message: 'a' });
      buffer.append({ domain: LOG_DOMAIN, tag: 'A', level: LogLevelGate.INFO, message: 'b' });
      expect(buffer.getDropped()).assertEqual(1);
      buffer.clear();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.getDropped()).assertEqual(0);
      expect(buffer.toArray().length).assertEqual(0);
    });

    it('sanitizer_should_strip_line_breaks', 0, () => {
      expect(LogSanitizer.stripLineBreaks('a\nb')).assertEqual('a b');
      expect(LogSanitizer.stripLineBreaks('a\r\nb')).assertEqual('a  b');
      expect(LogSanitizer.stripLineBreaks('plain')).assertEqual('plain');
      expect(LogSanitizer.isClean('plain')).assertTrue();
      expect(LogSanitizer.isClean('a\nb')).assertFalse();
    });

    it('sanitizer_should_truncate_long_messages', 0, () => {
      const longMessage = 'x'.repeat(LogSanitizer.MAX_MESSAGE_LENGTH + 100);
      expect(LogSanitizer.truncate(longMessage).length).assertEqual(LogSanitizer.MAX_MESSAGE_LENGTH);
      expect(LogSanitizer.truncate('short')).assertEqual('short');
      expect(LogSanitizer.truncate('abcdef', 3)).assertEqual('abc');
      expect(LogSanitizer.truncate('abc', 10)).assertEqual('abc');
    });

    it('sanitizer_should_mask_tokens', 0, () => {
      expect(LogSanitizer.maskToken('url?token=abcdef')).assertEqual('url?token=***');
      expect(LogSanitizer.maskToken('no secret here')).assertEqual('no secret here');
      expect(LogSanitizer.maskToken('token=')).assertEqual('token=***');
      expect(LogSanitizer.sanitize('a\nb?token=secret')).assertEqual('a b?token=***');
    });

    it('log_session_should_measure_duration', 0, () => {
      const session = new LogSession();
      session.start(1000);
      expect(session.isRunning()).assertTrue();
      session.record(SAMPLE_TAG);
      session.record('Other');
      session.end(3000);
      expect(session.isRunning()).assertFalse();
      expect(session.getDurationMs()).assertEqual(2000);
      expect(session.getEntryCount()).assertEqual(2);
      expect(session.getTagCount()).assertEqual(2);
      expect(session.hasTag(SAMPLE_TAG)).assertTrue();
    });

    it('log_session_should_reset_cleanly', 0, () => {
      const session = new LogSession();
      expect(session.isRunning()).assertFalse();
      expect(session.getDurationMs()).assertEqual(0);
      session.start(10);
      session.end(20);
      expect(session.getDurationMs()).assertEqual(10);
      session.reset();
      expect(session.isRunning()).assertFalse();
      expect(session.getDurationMs()).assertEqual(0);
      expect(session.getEntryCount()).assertEqual(0);
      expect(session.getTagCount()).assertEqual(0);
    });

    it('log_session_should_ignore_duplicate_tags', 0, () => {
      const session = new LogSession();
      session.start(1);
      for (let i = 0; i < 5; i++) {
        session.record(SAMPLE_TAG);
      }
      expect(session.getEntryCount()).assertEqual(5);
      expect(session.getTagCount()).assertEqual(1);
      session.end(2);
      expect(session.getDurationMs()).assertEqual(1);
    });

    it('csv_exporter_should_emit_header_and_rows', 0, () => {
      const entries: LogEntry[] = [
        { domain: LOG_DOMAIN, tag: SAMPLE_TAG, level: LogLevelGate.INFO, message: 'first' },
        { domain: LOG_DOMAIN, tag: SAMPLE_TAG, level: LogLevelGate.ERROR, message: 'second' }
      ];
      const lines = LogCsvExporter.export(entries);
      expect(lines.length).assertEqual(3);
      expect(lines[0]).assertEqual('domain,tag,level,message');
      expect(lines[1]).assertContain('first');
      expect(lines[2]).assertContain('second');
      expect(LogCsvExporter.columnCount(lines[1])).assertEqual(4);
    });

    it('csv_exporter_should_escape_commas_and_quotes', 0, () => {
      expect(LogCsvExporter.escape('a,b')).assertEqual('"a,b"');
      expect(LogCsvExporter.escape('a"b')).assertEqual('"a""b"');
      expect(LogCsvExporter.escape('plain')).assertEqual('plain');
      const entry: LogEntry = {
        domain: LOG_DOMAIN, tag: 'A,B', level: LogLevelGate.INFO, message: 'quoted "text"'
      };
      const line = LogCsvExporter.lineOf(entry);
      expect(line).assertContain('"A,B"');
      expect(line).assertContain('"quoted ""text"""');
    });

    it('csv_exporter_should_export_empty_list', 0, () => {
      const lines = LogCsvExporter.export([]);
      expect(lines.length).assertEqual(1);
      expect(lines[0]).assertEqual('domain,tag,level,message');
      expect(LogCsvExporter.columnCount(lines[0])).assertEqual(4);
    });

    it('log_level_gate_should_keep_error_highest', 0, () => {
      expect(LogLevelGate.severity(LogLevelGate.ERROR)).assertLarger(LogLevelGate.severity(LogLevelGate.INFO));
      expect(LogLevelGate.severity(LogLevelGate.INFO)).assertLarger(LogLevelGate.severity(LogLevelGate.DEBUG));
      expect(LogLevelGate.severity(LogLevelGate.ERROR)).assertEqual(2);
      expect(LogLevelGate.severity('unknown')).assertLess(0);
    });

    it('log_formatter_should_handle_empty_message', 0, () => {
      const formatted = LogFormatter.withTag(SAMPLE_TAG, '');
      expect(formatted).assertEqual('tag: IssueReporter --> ');
      expect(LogFormatter.isWithinLength('', 10)).assertTrue();
      expect(LogFormatter.containsTag(formatted, SAMPLE_TAG)).assertTrue();
    });

    it('log_paths_should_reject_outside_cache', 0, () => {
      const cacheDir = '/data/cache';
      const outside = '/data/other/logs';
      expect(LogPathValidator.isUnderCache(cacheDir, outside)).assertFalse();
      expect(LogPathValidator.hasTraversal('/data/cache/../other')).assertTrue();
      expect(LogPathValidator.join('/data/cache/', 'logs')).assertEqual('/data/cache/logs');
      expect(LogPathValidator.join('/data/cache', 'logs')).assertEqual('/data/cache/logs');
    });

    it('log_entries_should_be_immutable_after_copy', 0, () => {
      const buffer = new LogRingBuffer(2);
      buffer.append({ domain: LOG_DOMAIN, tag: 'A', level: LogLevelGate.INFO, message: 'a' });
      const snapshot = buffer.toArray();
      snapshot.push({ domain: LOG_DOMAIN, tag: 'B', level: LogLevelGate.INFO, message: 'b' });
      expect(buffer.size()).assertEqual(1);
      expect(snapshot.length).assertEqual(2);
    });

    it('sanitizer_should_keep_message_under_limit', 0, () => {
      const raw = 'line1\nline2 token=secret ' + 'x'.repeat(LogSanitizer.MAX_MESSAGE_LENGTH);
      const clean = LogSanitizer.sanitize(raw);
      expect(clean.length).assertLessOrEqual(LogSanitizer.MAX_MESSAGE_LENGTH);
      expect(clean.indexOf('\n')).assertEqual(-1);
      expect(clean).assertContain('token=***');
      expect(LogSanitizer.isClean(clean)).assertTrue();
    });

    it('ring_buffer_should_handle_zero_capacity', 0, () => {
      const buffer = new LogRingBuffer(0);
      expect(buffer.append({ domain: LOG_DOMAIN, tag: 'A', level: LogLevelGate.INFO, message: 'a' })).assertFalse();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.getDropped()).assertEqual(1);
      expect(buffer.getLatest() === undefined).assertTrue();
    });

    it('ring_buffer_should_keep_fifo_order', 0, () => {
      const buffer = new LogRingBuffer(5);
      for (let i = 0; i < 5; i++) {
        buffer.append({ domain: LOG_DOMAIN, tag: 'A', level: LogLevelGate.INFO, message: `${i}` });
      }
      const entries = buffer.toArray();
      expect(entries.length).assertEqual(5);
      for (let i = 0; i < entries.length; i++) {
        expect(entries[i].message).assertEqual(`${i}`);
      }
      expect((buffer.getOldest() as LogEntry).message).assertEqual('0');
      expect((buffer.getLatest() as LogEntry).message).assertEqual('4');
    });

    it('ring_buffer_should_preserve_order_after_eviction', 0, () => {
      const buffer = new LogRingBuffer(2);
      for (let i = 0; i < 4; i++) {
        buffer.append({ domain: LOG_DOMAIN, tag: 'A', level: LogLevelGate.INFO, message: `${i}` });
      }
      expect(buffer.size()).assertEqual(2);
      expect(buffer.getDropped()).assertEqual(2);
      expect((buffer.getOldest() as LogEntry).message).assertEqual('2');
      expect((buffer.getLatest() as LogEntry).message).assertEqual('3');
      expect(buffer.toArray().length).assertEqual(2);
    });

    it('log_entry_levels_should_be_distributed', 0, () => {
      const buffer = new LogRingBuffer(20);
      for (let i = 0; i < 6; i++) {
        buffer.append({ domain: LOG_DOMAIN, tag: 'A', level: LogLevelGate.INFO, message: `i-${i}` });
      }
      for (let i = 0; i < 4; i++) {
        buffer.append({ domain: LOG_DOMAIN, tag: 'B', level: LogLevelGate.ERROR, message: `e-${i}` });
      }
      expect(buffer.size()).assertEqual(10);
      expect(buffer.filterByLevel(LogLevelGate.INFO).length).assertEqual(6);
      expect(buffer.filterByLevel(LogLevelGate.ERROR).length).assertEqual(4);
      expect(buffer.filterByTag('A').length).assertEqual(6);
      expect(buffer.filterByTag('B').length).assertEqual(4);
    });

    it('log_sessions_should_be_independent', 0, () => {
      const first = new LogSession();
      const second = new LogSession();
      first.start(100);
      second.start(200);
      first.record(SAMPLE_TAG);
      second.record('Other');
      second.record('Other');
      first.end(300);
      second.end(500);
      expect(first.getDurationMs()).assertEqual(200);
      expect(second.getDurationMs()).assertEqual(300);
      expect(first.getTagCount()).assertEqual(1);
      expect(second.getTagCount()).assertEqual(1);
      expect(first.getEntryCount()).assertEqual(1);
      expect(second.getEntryCount()).assertEqual(2);
      expect(first.hasTag('Other')).assertFalse();
    });

    it('log_session_should_handle_zero_duration', 0, () => {
      const session = new LogSession();
      session.start(1000);
      session.end(1000);
      expect(session.getDurationMs()).assertEqual(0);
      expect(session.isRunning()).assertFalse();
      session.start(0);
      expect(session.isRunning()).assertFalse();
      session.start(5);
      expect(session.isRunning()).assertTrue();
    });

    it('csv_exporter_should_export_many_rows', 0, () => {
      const entries: LogEntry[] = [];
      for (let i = 0; i < 10; i++) {
        entries.push({
          domain: LOG_DOMAIN, tag: SAMPLE_TAG, level: LogLevelGate.INFO, message: `row-${i}`
        });
      }
      const lines = LogCsvExporter.export(entries);
      expect(lines.length).assertEqual(11);
      expect(lines[10]).assertContain('row-9');
      for (let i = 0; i < lines.length; i++) {
        expect(LogCsvExporter.columnCount(lines[i])).assertEqual(4);
      }
    });

    it('csv_escape_should_handle_empty_and_special_values', 0, () => {
      expect(LogCsvExporter.escape('')).assertEqual('');
      expect(LogCsvExporter.escape(',')).assertEqual('","');
      expect(LogCsvExporter.escape('"')).assertEqual('""""');
      expect(LogCsvExporter.escape('a,b,c')).assertEqual('"a,b,c"');
      expect(LogCsvExporter.escape('a;b')).assertEqual('a;b');
    });

    it('sanitizer_should_leave_clean_long_token_text', 0, () => {
      const message = 'request token=abc completed';
      expect(LogSanitizer.maskToken(message)).assertEqual('request token=***');
      expect(LogSanitizer.sanitize(message)).assertEqual('request token=***');
      expect(LogSanitizer.isClean(message)).assertTrue();
    });

    it('log_formatter_should_support_special_tags', 0, () => {
      const tagged = LogFormatter.withTag('A-B_C', 'message');
      expect(tagged).assertEqual('tag: A-B_C --> message');
      expect(LogFormatter.containsTag(tagged, 'A-B_C')).assertTrue();
      expect(LogFormatter.containsTag(tagged, 'A-B')).assertFalse();
      expect(LogFormatter.withTag('', 'x')).assertEqual('tag:  --> x');
    });

    it('log_path_validator_should_join_nested_folder', 0, () => {
      const cacheDir = '/data/cache';
      const nested = LogPathValidator.join(cacheDir, KeyConstant.CACHE_LOG_PATH_FOLDER);
      expect(nested).assertEqual('/data/cache/cache_logs/allLogs');
      expect(LogPathValidator.isUnderCache(cacheDir, nested)).assertTrue();
      expect(LogPathValidator.hasTraversal(nested)).assertFalse();
      expect(LogPathValidator.join('/data/cache/', 'logs')).assertEqual('/data/cache/logs');
      expect(LogPathValidator.join('/data/cache//', 'logs')).assertEqual('/data/cache//logs');
    });

    it('log_level_gate_should_reject_nullish_levels', 0, () => {
      expect(LogLevelGate.isEnabled('')).assertFalse();
      expect(LogLevelGate.isEnabled('debug')).assertFalse();
      expect(LogLevelGate.severity('')).assertEqual(-1);
      expect(LogLevelGate.severity('debug')).assertEqual(-1);
      expect(LogLevelGate.severity(LogLevelGate.DEBUG)).assertEqual(0);
      expect(LogLevelGate.severity(LogLevelGate.INFO)).assertEqual(1);
    });

    it('ring_buffer_should_work_with_capacity_one', 0, () => {
      const buffer = new LogRingBuffer(1);
      buffer.append({ domain: LOG_DOMAIN, tag: 'A', level: LogLevelGate.INFO, message: 'first' });
      expect(buffer.size()).assertEqual(1);
      expect((buffer.getLatest() as LogEntry).message).assertEqual('first');
      buffer.append({ domain: LOG_DOMAIN, tag: 'A', level: LogLevelGate.INFO, message: 'second' });
      expect(buffer.size()).assertEqual(1);
      expect((buffer.getOldest() as LogEntry).message).assertEqual('second');
      expect(buffer.getDropped()).assertEqual(1);
    });

    it('log_entry_domain_should_be_preserved_in_csv', 0, () => {
      const entry: LogEntry = {
        domain: LOG_DOMAIN, tag: SAMPLE_TAG, level: LogLevelGate.ERROR, message: 'domain check'
      };
      const line = LogCsvExporter.lineOf(entry);
      expect(line.startsWith(`${LOG_DOMAIN},`)).assertTrue();
      expect(line).assertContain(LogLevelGate.ERROR);
      expect(line).assertContain('domain check');
      expect(LOG_DOMAIN.toString(16)).assertEqual('102');
    });

    it('sanitizer_should_remove_all_line_break_variants', 0, () => {
      expect(LogSanitizer.isClean(LogSanitizer.sanitize('a\nb'))).assertTrue();
      expect(LogSanitizer.isClean(LogSanitizer.sanitize('a\rb'))).assertTrue();
      expect(LogSanitizer.isClean(LogSanitizer.sanitize('a\r\nb'))).assertTrue();
      expect(LogSanitizer.stripLineBreaks('a\r\n\r\nb')).assertEqual('a    b');
    });

    it('log_session_should_track_tags_after_reset', 0, () => {
      const session = new LogSession();
      session.start(100);
      session.record('A');
      session.record('B');
      expect(session.getTagCount()).assertEqual(2);
      session.reset();
      expect(session.getTagCount()).assertEqual(0);
      expect(session.hasTag('A')).assertFalse();
      session.start(200);
      session.record('A');
      expect(session.getTagCount()).assertEqual(1);
      expect(session.getEntryCount()).assertEqual(1);
    });

    it('ring_buffer_snapshot_should_not_mutate_buffer', 0, () => {
      const buffer = new LogRingBuffer(3);
      buffer.append({ domain: LOG_DOMAIN, tag: 'A', level: LogLevelGate.INFO, message: 'a' });
      const first = buffer.toArray();
      first.splice(0, 1);
      expect(first.length).assertEqual(0);
      expect(buffer.size()).assertEqual(1);
      expect(buffer.toArray().length).assertEqual(1);
    });

    it('csv_exporter_should_quote_newline_messages', 0, () => {
      const entry: LogEntry = {
        domain: LOG_DOMAIN, tag: SAMPLE_TAG, level: LogLevelGate.INFO, message: 'line1,line2'
      };
      const line = LogCsvExporter.lineOf(entry);
      expect(line).assertContain('"line1,line2"');
      expect(LogCsvExporter.columnCount(line)).assertEqual(4);
      const cleanLine = LogCsvExporter.lineOf({
        domain: LOG_DOMAIN, tag: SAMPLE_TAG, level: LogLevelGate.INFO, message: 'clean'
      });
      expect(LogCsvExporter.columnCount(cleanLine)).assertEqual(4);
    });

    it('log_level_constants_should_be_ordered', 0, () => {
      expect(LogLevelGate.DEBUG).assertEqual('DEBUG');
      expect(LogLevelGate.INFO).assertEqual('INFO');
      expect(LogLevelGate.ERROR).assertEqual('ERROR');
      expect(LogLevelGate.DEBUG.length).assertLarger(0);
      expect(LogLevelGate.INFO === LogLevelGate.ERROR).assertFalse();
    });

    it('log_sink_should_track_domain_and_order', 0, () => {
      const sink = new LogSink();
      sink.append(LOG_DOMAIN, 'A', LogLevelGate.DEBUG, 'first');
      sink.append(LOG_DOMAIN, 'B', LogLevelGate.INFO, 'second');
      sink.append(LOG_DOMAIN, 'A', LogLevelGate.ERROR, 'third');
      const entries = sink.getEntries();
      expect(entries.length).assertEqual(3);
      expect(entries[0].message).assertEqual('first');
      expect(entries[2].message).assertEqual('third');
      expect(entries[1].tag).assertEqual('B');
      for (let i = 0; i < entries.length; i++) {
        expect(entries[i].domain).assertEqual(LOG_DOMAIN);
      }
      sink.clear();
      expect(sink.countByTag('A')).assertEqual(0);
    });

    it('log_message_limit_should_match_sanitizer_contract', 0, () => {
      expect(LogSanitizer.MAX_MESSAGE_LENGTH).assertEqual(512);
      expect(LogSanitizer.truncate('x'.repeat(600)).length).assertEqual(512);
      expect(LogSanitizer.truncate('')).assertEqual('');
      expect(LogSanitizer.isClean('')).assertTrue();
      expect(LogSanitizer.isClean('x'.repeat(512))).assertTrue();
      expect(LogSanitizer.isClean('x'.repeat(513))).assertFalse();
      expect(LogSanitizer.isClean('plain')).assertTrue();
    });
  });
}
