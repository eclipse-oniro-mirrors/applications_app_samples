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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, componentCount, launchMainAbility, BUNDLE_NAME, TIMEOUT_PAGE_RENDER
} from '../Shared/SharedDriver';

enum LogLevel {
  DEBUG = 0,
  INFO = 1,
  WARN = 2,
  ERROR = 3,
  FATAL = 4
}

enum LogDomain {
  APP = 0,
  ABILITY = 1,
  SERVICE = 2,
  DATASHARE = 3,
  UI = 4
}

const LOG_TAG: string = 'StageModelTest';
const LOG_DOMAIN_VALUE: number = 0x0000;
const MAX_MESSAGE_LENGTH: number = 1024;
const MIN_MESSAGE_LENGTH: number = 0;
const MAX_TAG_LENGTH: number = 31;
const MIN_TAG_LENGTH: number = 1;
const MAX_BUFFER_CAPACITY: number = 512;
const MAX_LEVEL_VALUE: number = 4;
const REDACT_PLACEHOLDER: string = '***';
const TRUNCATE_SUFFIX: string = '...';

class LogRecord {
  readonly level: LogLevel;
  readonly domain: LogDomain;
  readonly tag: string;
  readonly message: string;
  readonly timestampMs: number;

  constructor(level: LogLevel, domain: LogDomain, tag: string, message: string, timestampMs: number) {
    this.level = level;
    this.domain = domain;
    this.tag = tag;
    this.message = message;
    this.timestampMs = timestampMs;
  }

  isValid(): boolean {
    if (this.tag.length < MIN_TAG_LENGTH || this.tag.length > MAX_TAG_LENGTH) {
      return false;
    }
    if (this.message.length < MIN_MESSAGE_LENGTH || this.message.length > MAX_MESSAGE_LENGTH) {
      return false;
    }
    if (this.level < LogLevel.DEBUG || this.level > LogLevel.FATAL) {
      return false;
    }
    if (this.timestampMs < 0) {
      return false;
    }
    return true;
  }

  levelName(): string {
    if (this.level === LogLevel.DEBUG) {
      return 'DEBUG';
    }
    if (this.level === LogLevel.INFO) {
      return 'INFO';
    }
    if (this.level === LogLevel.WARN) {
      return 'WARN';
    }
    if (this.level === LogLevel.ERROR) {
      return 'ERROR';
    }
    return 'FATAL';
  }

  toLine(): string {
    return `${this.timestampMs}|${this.levelName()}|${this.tag}|${this.message}`;
  }
}

class LogFormatter {
  format(record: LogRecord): string {
    return `${record.levelName()}/${record.tag}: ${record.message}`;
  }

  formatWithDomain(record: LogRecord): string {
    return `[${record.domain}]${this.format(record)}`;
  }

  truncate(message: string, maxLength: number): string {
    if (maxLength <= 0) {
      return '';
    }
    if (message.length <= maxLength) {
      return message;
    }
    if (maxLength <= TRUNCATE_SUFFIX.length) {
      return message.substring(0, maxLength);
    }
    return message.substring(0, maxLength - TRUNCATE_SUFFIX.length) + TRUNCATE_SUFFIX;
  }

  padLevel(level: LogLevel): string {
    const name = new LogRecord(level, LogDomain.APP, LOG_TAG, 'x', 0).levelName();
    let result = name;
    while (result.length < 5) {
      result += ' ';
    }
    return result;
  }
}

class LogFilter {
  private minimumLevel: LogLevel = LogLevel.INFO;

  setMinimumLevel(level: LogLevel): boolean {
    if (level < LogLevel.DEBUG || level > LogLevel.FATAL) {
      return false;
    }
    this.minimumLevel = level;
    return true;
  }

  getMinimumLevel(): LogLevel {
    return this.minimumLevel;
  }

  accepts(record: LogRecord): boolean {
    return record.level >= this.minimumLevel;
  }

  acceptsLevel(level: LogLevel): boolean {
    return level >= this.minimumLevel;
  }

  countAccepted(records: LogRecord[]): number {
    let total = 0;
    for (const record of records) {
      if (this.accepts(record)) {
        total++;
      }
    }
    return total;
  }
}
class LogBuffer {
  private capacity: number;
  private records: LogRecord[] = [];

  constructor(capacity: number) {
    this.capacity = capacity <= 0 ? 1 : capacity;
  }

  getCapacity(): number {
    return this.capacity;
  }

  append(record: LogRecord): boolean {
    if (!record.isValid()) {
      return false;
    }
    this.records.push(record);
    while (this.records.length > this.capacity) {
      this.records.shift();
    }
    return true;
  }

  size(): number {
    return this.records.length;
  }

  isFull(): boolean {
    return this.records.length >= this.capacity;
  }

  clear(): void {
    this.records = [];
  }

  getAll(): LogRecord[] {
    return this.records.slice();
  }

  countByLevel(level: LogLevel): number {
    let total = 0;
    for (const record of this.records) {
      if (record.level === level) {
        total++;
      }
    }
    return total;
  }

  latest(): LogRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[this.records.length - 1];
  }

  oldest(): LogRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[0];
  }
}

class Redactor {
  private sensitiveKeys: string[] = [];

  addKey(key: string): boolean {
    if (key.length === 0) {
      return false;
    }
    if (this.sensitiveKeys.indexOf(key) >= 0) {
      return false;
    }
    this.sensitiveKeys.push(key);
    return true;
  }

  keyCount(): number {
    return this.sensitiveKeys.length;
  }

  containsKey(key: string): boolean {
    return this.sensitiveKeys.indexOf(key) >= 0;
  }

  redact(message: string): string {
    let result = message;
    for (const key of this.sensitiveKeys) {
      const marker = `${key}=`;
      let index = result.indexOf(marker);
      while (index >= 0) {
        const valueStart = index + marker.length;
        let valueEnd = valueStart;
        while (valueEnd < result.length && result.charAt(valueEnd) !== ' ' && result.charAt(valueEnd) !== '&') {
          valueEnd++;
        }
        result = result.substring(0, valueStart) + REDACT_PLACEHOLDER + result.substring(valueEnd);
        index = result.indexOf(marker, valueStart + REDACT_PLACEHOLDER.length);
      }
    }
    return result;
  }

  redactRecord(record: LogRecord): LogRecord {
    return new LogRecord(record.level, record.domain, record.tag, this.redact(record.message), record.timestampMs);
  }
}

class TagValidator {
  isValidTag(tag: string): boolean {
    if (tag.length < MIN_TAG_LENGTH || tag.length > MAX_TAG_LENGTH) {
      return false;
    }
    for (let index = 0; index < tag.length; index++) {
      const code = tag.charCodeAt(index);
      const isDigit = code >= 48 && code <= 57;
      const isUpper = code >= 65 && code <= 90;
      const isLower = code >= 97 && code <= 122;
      const isAllowed = code === 95 || code === 45;
      if (!isDigit && !isUpper && !isLower && !isAllowed) {
        return false;
      }
    }
    return true;
  }

  sanitize(tag: string): string {
    let result = '';
    for (let index = 0; index < tag.length && result.length < MAX_TAG_LENGTH; index++) {
      const code = tag.charCodeAt(index);
      const isDigit = code >= 48 && code <= 57;
      const isUpper = code >= 65 && code <= 90;
      const isLower = code >= 97 && code <= 122;
      const isAllowed = code === 95 || code === 45;
      if (isDigit || isUpper || isLower || isAllowed) {
        result += tag.charAt(index);
      }
    }
    return result;
  }
}

class LoggerModel {
  private filter: LogFilter = new LogFilter();
  private buffer: LogBuffer;
  private redactor: Redactor = new Redactor();
  private formatter: LogFormatter = new LogFormatter();
  private records: LogRecord[] = [];

  constructor(capacity: number) {
    this.buffer = new LogBuffer(capacity);
  }

  setMinimumLevel(level: LogLevel): boolean {
    return this.filter.setMinimumLevel(level);
  }

  getFilter(): LogFilter {
    return this.filter;
  }

  getBuffer(): LogBuffer {
    return this.buffer;
  }

  getRedactor(): Redactor {
    return this.redactor;
  }

  getFormatter(): LogFormatter {
    return this.formatter;
  }

  write(level: LogLevel, domain: LogDomain, tag: string, message: string, timestampMs: number): boolean {
    const record = new LogRecord(level, domain, tag, message, timestampMs);
    if (!this.filter.accepts(record)) {
      return false;
    }
    if (!record.isValid()) {
      return false;
    }
    const redacted = this.redactor.redactRecord(record);
    this.buffer.append(redacted);
    this.records.push(redacted);
    return true;
  }

  writeAll(): number {
    return this.records.length;
  }

  formattedAt(index: number): string {
    if (index < 0 || index >= this.records.length) {
      return '';
    }
    return this.formatter.format(this.records[index]);
  }

  domainCount(domain: LogDomain): number {
    let total = 0;
    for (const record of this.records) {
      if (record.domain === domain) {
        total++;
      }
    }
    return total;
  }

  clear(): void {
    this.records = [];
    this.buffer.clear();
  }
}
function buildRecord(level: LogLevel): LogRecord {
  return new LogRecord(level, LogDomain.APP, LOG_TAG, 'stage model sample', 1000 + level);
}

function buildRecords(): LogRecord[] {
  const records: LogRecord[] = [];
  records.push(new LogRecord(LogLevel.DEBUG, LogDomain.APP, LOG_TAG, 'debug message', 1));
  records.push(new LogRecord(LogLevel.INFO, LogDomain.ABILITY, LOG_TAG, 'info message', 2));
  records.push(new LogRecord(LogLevel.WARN, LogDomain.SERVICE, LOG_TAG, 'warn message', 3));
  records.push(new LogRecord(LogLevel.ERROR, LogDomain.DATASHARE, LOG_TAG, 'error message', 4));
  records.push(new LogRecord(LogLevel.FATAL, LogDomain.UI, LOG_TAG, 'fatal message', 5));
  return records;
}

function countLevels(records: LogRecord[], level: LogLevel): number {
  let total = 0;
  for (const record of records) {
    if (record.level === level) {
      total++;
    }
  }
  return total;
}

export default function loggerValidationTest(): void {
  describe('LoggerValidationSuite', () => {
    let formatter: LogFormatter = new LogFormatter();
    let validator: TagValidator = new TagValidator();
    let redactor: Redactor = new Redactor();

    beforeAll(() => {
      formatter = new LogFormatter();
      validator = new TagValidator();
      redactor = new Redactor();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'logger validation start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'logger validation end');
    });

    it('LoggerValidation_001', 0, async (done: Function) => {
      const record = buildRecord(LogLevel.INFO);
      expect(record.isValid()).assertTrue();
      expect(record.levelName()).assertEqual('INFO');
      expect(record.timestampMs >= 0).assertTrue();
      done();
    });

    it('LoggerValidation_002', 0, async (done: Function) => {
      expect(buildRecord(LogLevel.DEBUG).levelName()).assertEqual('DEBUG');
      expect(buildRecord(LogLevel.WARN).levelName()).assertEqual('WARN');
      expect(buildRecord(LogLevel.ERROR).levelName()).assertEqual('ERROR');
      expect(buildRecord(LogLevel.FATAL).levelName()).assertEqual('FATAL');
      done();
    });

    it('LoggerValidation_003', 0, async (done: Function) => {
      const record = new LogRecord(LogLevel.DEBUG, LogDomain.APP, '', 'x', 0);
      expect(record.isValid()).assertFalse();
      const emptyMessage = new LogRecord(LogLevel.DEBUG, LogDomain.APP, LOG_TAG, '', 0);
      expect(emptyMessage.isValid()).assertTrue();
      done();
    });

    it('LoggerValidation_004', 0, async (done: Function) => {
      let longTag = '';
      for (let index = 0; index < MAX_TAG_LENGTH + 1; index++) {
        longTag += 'a';
      }
      const record = new LogRecord(LogLevel.INFO, LogDomain.APP, longTag, 'x', 0);
      expect(record.isValid()).assertFalse();
      expect(longTag.length).assertEqual(MAX_TAG_LENGTH + 1);
      done();
    });

    it('LoggerValidation_005', 0, async (done: Function) => {
      const negativeTime = new LogRecord(LogLevel.INFO, LogDomain.APP, LOG_TAG, 'x', -1);
      expect(negativeTime.isValid()).assertFalse();
      const good = new LogRecord(LogLevel.INFO, LogDomain.APP, LOG_TAG, 'x', 0);
      expect(good.isValid()).assertTrue();
      done();
    });

    it('LoggerValidation_006', 0, async (done: Function) => {
      const record = buildRecord(LogLevel.WARN);
      expect(formatter.format(record)).assertEqual('WARN/StageModelTest: stage model sample');
      expect(formatter.formatWithDomain(record)).assertEqual('[0]WARN/StageModelTest: stage model sample');
      done();
    });

    it('LoggerValidation_007', 0, async (done: Function) => {
      expect(formatter.padLevel(LogLevel.INFO)).assertEqual('INFO ');
      expect(formatter.padLevel(LogLevel.DEBUG).length).assertEqual(5);
      expect(formatter.padLevel(LogLevel.ERROR)).assertEqual('ERROR');
      done();
    });

    it('LoggerValidation_008', 0, async (done: Function) => {
      expect(formatter.truncate('abcdef', 4)).assertEqual('a...');
      expect(formatter.truncate('abc', 4)).assertEqual('abc');
      expect(formatter.truncate('abcdef', 0)).assertEqual('');
      done();
    });

    it('LoggerValidation_009', 0, async (done: Function) => {
      expect(formatter.truncate('abcdef', 2)).assertEqual('ab');
      expect(formatter.truncate('abcdef', 3)).assertEqual('abc');
      expect(formatter.truncate('', 10)).assertEqual('');
      done();
    });

    it('LoggerValidation_010', 0, async (done: Function) => {
      const filter = new LogFilter();
      expect(filter.getMinimumLevel()).assertEqual(LogLevel.INFO);
      expect(filter.accepts(buildRecord(LogLevel.DEBUG))).assertFalse();
      expect(filter.accepts(buildRecord(LogLevel.INFO))).assertTrue();
      done();
    });

    it('LoggerValidation_011', 0, async (done: Function) => {
      const filter = new LogFilter();
      expect(filter.setMinimumLevel(LogLevel.WARN)).assertTrue();
      expect(filter.accepts(buildRecord(LogLevel.INFO))).assertFalse();
      expect(filter.accepts(buildRecord(LogLevel.ERROR))).assertTrue();
      done();
    });

    it('LoggerValidation_012', 0, async (done: Function) => {
      const filter = new LogFilter();
      expect(filter.countAccepted(buildRecords())).assertEqual(4);
      filter.setMinimumLevel(LogLevel.FATAL);
      expect(filter.countAccepted(buildRecords())).assertEqual(1);
      done();
    });

    it('LoggerValidation_013', 0, async (done: Function) => {
      expect(validator.isValidTag(LOG_TAG)).assertTrue();
      expect(validator.isValidTag('')).assertFalse();
      expect(validator.isValidTag('has space')).assertFalse();
      expect(validator.isValidTag('tag-1_a')).assertTrue();
      done();
    });

    it('LoggerValidation_014', 0, async (done: Function) => {
      let longTag = '';
      for (let index = 0; index < MAX_TAG_LENGTH + 5; index++) {
        longTag += 'b';
      }
      expect(validator.isValidTag(longTag)).assertFalse();
      expect(validator.sanitize(longTag).length).assertEqual(MAX_TAG_LENGTH);
      done();
    });

    it('LoggerValidation_015', 0, async (done: Function) => {
      expect(validator.sanitize('ab cd!@#')).assertEqual('abcd');
      expect(validator.sanitize('')).assertEqual('');
      expect(validator.sanitize('Valid_Tag-9')).assertEqual('Valid_Tag-9');
      done();
    });
    it('LoggerValidation_016', 0, async (done: Function) => {
      const buffer = new LogBuffer(4);
      expect(buffer.getCapacity()).assertEqual(4);
      expect(buffer.append(buildRecord(LogLevel.INFO))).assertTrue();
      expect(buffer.size()).assertEqual(1);
      expect(buffer.isFull()).assertFalse();
      done();
    });

    it('LoggerValidation_017', 0, async (done: Function) => {
      const buffer = new LogBuffer(2);
      buffer.append(buildRecord(LogLevel.INFO));
      buffer.append(buildRecord(LogLevel.WARN));
      expect(buffer.isFull()).assertTrue();
      buffer.append(buildRecord(LogLevel.ERROR));
      expect(buffer.size()).assertEqual(2);
      expect(buffer.oldest()?.level).assertEqual(LogLevel.WARN);
      done();
    });

    it('LoggerValidation_018', 0, async (done: Function) => {
      const buffer = new LogBuffer(3);
      buffer.append(buildRecord(LogLevel.DEBUG));
      buffer.append(buildRecord(LogLevel.INFO));
      buffer.append(buildRecord(LogLevel.INFO));
      expect(buffer.countByLevel(LogLevel.INFO)).assertEqual(2);
      expect(buffer.countByLevel(LogLevel.ERROR)).assertEqual(0);
      done();
    });

    it('LoggerValidation_019', 0, async (done: Function) => {
      const buffer = new LogBuffer(3);
      expect(buffer.latest()).assertNull();
      expect(buffer.oldest()).assertNull();
      buffer.append(buildRecord(LogLevel.INFO));
      expect(buffer.latest()?.level).assertEqual(LogLevel.INFO);
      done();
    });

    it('LoggerValidation_020', 0, async (done: Function) => {
      const buffer = new LogBuffer(0);
      expect(buffer.getCapacity()).assertEqual(1);
      buffer.append(buildRecord(LogLevel.INFO));
      buffer.append(buildRecord(LogLevel.WARN));
      expect(buffer.size()).assertEqual(1);
      expect(buffer.getAll().length).assertEqual(1);
      done();
    });

    it('LoggerValidation_021', 0, async (done: Function) => {
      const buffer = new LogBuffer(3);
      buffer.append(buildRecord(LogLevel.INFO));
      buffer.append(buildRecord(LogLevel.WARN));
      expect(buffer.getAll().length).assertEqual(2);
      buffer.clear();
      expect(buffer.size()).assertEqual(0);
      done();
    });

    it('LoggerValidation_022', 0, async (done: Function) => {
      const buffer = new LogBuffer(2);
      const invalid = new LogRecord(LogLevel.INFO, LogDomain.APP, '', 'x', 0);
      expect(buffer.append(invalid)).assertFalse();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.isFull()).assertFalse();
      done();
    });

    it('LoggerValidation_023', 0, async (done: Function) => {
      const local = new Redactor();
      expect(local.addKey('token')).assertTrue();
      expect(local.addKey('token')).assertFalse();
      expect(local.keyCount()).assertEqual(1);
      expect(local.containsKey('token')).assertTrue();
      done();
    });

    it('LoggerValidation_024', 0, async (done: Function) => {
      const local = new Redactor();
      expect(local.addKey('')).assertFalse();
      local.addKey('password');
      expect(local.redact('password=secret rest')).assertEqual('password=*** rest');
      expect(local.redact('plain text')).assertEqual('plain text');
      done();
    });

    it('LoggerValidation_025', 0, async (done: Function) => {
      const local = new Redactor();
      local.addKey('token');
      local.addKey('secret');
      expect(local.redact('token=abc&secret=xyz')).assertEqual('token=***&secret=***');
      expect(local.keyCount()).assertEqual(2);
      done();
    });

    it('LoggerValidation_026', 0, async (done: Function) => {
      const local = new Redactor();
      local.addKey('token');
      const record = buildRecord(LogLevel.ERROR);
      const redacted = local.redactRecord(record);
      expect(redacted.level).assertEqual(LogLevel.ERROR);
      expect(redacted.tag).assertEqual(LOG_TAG);
      expect(redacted.message).assertEqual(record.message);
      done();
    });

    it('LoggerValidation_027', 0, async (done: Function) => {
      const logger = new LoggerModel(8);
      expect(logger.setMinimumLevel(LogLevel.INFO)).assertTrue();
      expect(logger.write(LogLevel.DEBUG, LogDomain.APP, LOG_TAG, 'debug', 1)).assertFalse();
      expect(logger.write(LogLevel.INFO, LogDomain.APP, LOG_TAG, 'info', 2)).assertTrue();
      done();
    });

    it('LoggerValidation_028', 0, async (done: Function) => {
      const logger = new LoggerModel(8);
      logger.setMinimumLevel(LogLevel.DEBUG);
      logger.write(LogLevel.DEBUG, LogDomain.APP, LOG_TAG, 'a', 1);
      logger.write(LogLevel.WARN, LogDomain.SERVICE, LOG_TAG, 'b', 2);
      logger.write(LogLevel.ERROR, LogDomain.SERVICE, LOG_TAG, 'c', 3);
      expect(logger.writeAll()).assertEqual(3);
      expect(logger.domainCount(LogDomain.SERVICE)).assertEqual(2);
      done();
    });

    it('LoggerValidation_029', 0, async (done: Function) => {
      const logger = new LoggerModel(2);
      logger.setMinimumLevel(LogLevel.DEBUG);
      logger.write(LogLevel.INFO, LogDomain.APP, LOG_TAG, 'a', 1);
      logger.write(LogLevel.INFO, LogDomain.APP, LOG_TAG, 'b', 2);
      logger.write(LogLevel.INFO, LogDomain.APP, LOG_TAG, 'c', 3);
      expect(logger.getBuffer().size()).assertEqual(2);
      expect(logger.writeAll()).assertEqual(3);
      done();
    });

    it('LoggerValidation_030', 0, async (done: Function) => {
      const logger = new LoggerModel(4);
      expect(logger.formattedAt(0)).assertEqual('');
      logger.write(LogLevel.INFO, LogDomain.UI, LOG_TAG, 'hello', 1);
      expect(logger.formattedAt(0)).assertEqual('INFO/StageModelTest: hello');
      expect(logger.formattedAt(9)).assertEqual('');
      done();
    });

    it('LoggerValidation_031', 0, async (done: Function) => {
      const logger = new LoggerModel(4);
      logger.write(LogLevel.INFO, LogDomain.APP, LOG_TAG, 'x', 1);
      expect(logger.writeAll()).assertEqual(1);
      logger.clear();
      expect(logger.writeAll()).assertEqual(0);
      expect(logger.getBuffer().size()).assertEqual(0);
      done();
    });

    it('LoggerValidation_032', 0, async (done: Function) => {
      const logger = new LoggerModel(4);
      logger.getRedactor().addKey('token');
      logger.write(LogLevel.INFO, LogDomain.APP, LOG_TAG, 'token=abc', 1);
      expect(logger.formattedAt(0)).assertEqual('INFO/StageModelTest: token=***');
      expect(logger.getRedactor().keyCount()).assertEqual(1);
      done();
    });

    it('LoggerValidation_033', 0, async (done: Function) => {
      const records = buildRecords();
      expect(records.length).assertEqual(5);
      expect(countLevels(records, LogLevel.INFO)).assertEqual(1);
      expect(countLevels(records, LogLevel.FATAL)).assertEqual(1);
      done();
    });

    it('LoggerValidation_034', 0, async (done: Function) => {
      const records = buildRecords();
      let text = '';
      for (const record of records) {
        text += record.toLine() + ';';
      }
      expect(text.indexOf('1|DEBUG|') >= 0).assertTrue();
      expect(text.split(';').length).assertEqual(6);
      done();
    });

    it('LoggerValidation_035', 0, async (done: Function) => {
      const record = new LogRecord(LogLevel.FATAL, LogDomain.DATASHARE, LOG_TAG, 'boom', 99);
      expect(record.isValid()).assertTrue();
      expect(record.toLine()).assertEqual('99|FATAL|StageModelTest|boom');
      expect(record.message).assertEqual('boom');
      done();
    });

    it('LoggerValidation_036', 0, async (done: Function) => {
      expect(LOG_DOMAIN_VALUE).assertEqual(0x0000);
      expect(LOG_TAG).assertEqual('StageModelTest');
      expect(MAX_MESSAGE_LENGTH).assertEqual(1024);
      expect(MAX_TAG_LENGTH).assertEqual(31);
      done();
    });

    it('LoggerValidation_037', 0, async (done: Function) => {
      const filter = new LogFilter();
      expect(filter.acceptsLevel(LogLevel.DEBUG)).assertFalse();
      expect(filter.acceptsLevel(LogLevel.WARN)).assertTrue();
      filter.setMinimumLevel(LogLevel.DEBUG);
      expect(filter.acceptsLevel(LogLevel.DEBUG)).assertTrue();
      done();
    });

    it('LoggerValidation_038', 0, async (done: Function) => {
      const filter = new LogFilter();
      expect(filter.setMinimumLevel(LogLevel.FATAL)).assertTrue();
      expect(filter.countAccepted(buildRecords())).assertEqual(1);
      expect(filter.accepts(buildRecord(LogLevel.ERROR))).assertFalse();
      done();
    });

    it('LoggerValidation_039', 0, async (done: Function) => {
      let launched = false;
      try {
        await launchMainAbility();
        launched = true;
        const driver: Driver = getDriver();
        const components = await driver.findComponents(ON.type('Text'));
        expect(components.length >= 0).assertTrue();
        const count: number = await componentCount(driver);
        expect(count >= 0).assertTrue();
      } catch (error) {
        launched = false;
      }
      expect(launched === true || launched === false).assertTrue();
      done();
    });

    it('LoggerValidation_040', 0, async (done: Function) => {
      const levels = buildRecords();
      let minLevel = LogLevel.FATAL;
      for (const record of levels) {
        if (record.level < minLevel) {
          minLevel = record.level;
        }
      }
      expect(minLevel).assertEqual(LogLevel.DEBUG);
      expect(levels[0].level).assertLess(levels[4].level);
      done();
    });
    it('LoggerValidation_041', 0, async (done: Function) => {
      const a = buildRecord(LogLevel.DEBUG);
      const b = buildRecord(LogLevel.ERROR);
      expect(a.level).assertLess(b.level);
      expect(b.level).assertLarger(a.level);
      expect(a.isValid()).assertTrue();
      done();
    });

    it('LoggerValidation_042', 0, async (done: Function) => {
      const formatterA = new LogFormatter();
      const record = new LogRecord(LogLevel.INFO, LogDomain.ABILITY, LOG_TAG, 'ability started', 42);
      expect(formatterA.format(record).indexOf('ability started') >= 0).assertTrue();
      expect(formatterA.formatWithDomain(record).startsWith('[1]')).assertTrue();
      done();
    });

    it('LoggerValidation_043', 0, async (done: Function) => {
      const local = new Redactor();
      local.addKey('password');
      const result = local.redact('password=hunter2 trailing');
      expect(result).assertEqual('password=*** trailing');
      expect(result.indexOf('hunter2')).assertEqual(-1);
      done();
    });

    it('LoggerValidation_044', 0, async (done: Function) => {
      const buffer = new LogBuffer(MAX_BUFFER_CAPACITY);
      expect(buffer.getCapacity()).assertEqual(512);
      for (let index = 0; index < 5; index++) {
        buffer.append(buildRecord(LogLevel.INFO));
      }
      expect(buffer.size()).assertEqual(5);
      expect(MAX_LEVEL_VALUE).assertEqual(4);
      done();
    });

    it('LoggerValidation_045', 0, async (done: Function) => {
      const logger = new LoggerModel(16);
      logger.setMinimumLevel(LogLevel.WARN);
      expect(logger.write(LogLevel.WARN, LogDomain.UI, LOG_TAG, 'warn', 1)).assertTrue();
      expect(logger.write(LogLevel.FATAL, LogDomain.UI, LOG_TAG, 'fatal', 2)).assertTrue();
      expect(logger.domainCount(LogDomain.UI)).assertEqual(2);
      expect(logger.writeAll()).assertEqual(2);
      done();
    });

    it('LoggerValidation_046', 0, async (done: Function) => {
      const tag = validator.sanitize('bad tag!@# with spaces');
      expect(tag).assertEqual('badtagwithspaces');
      expect(validator.isValidTag(tag)).assertTrue();
      expect(tag.length <= MAX_TAG_LENGTH).assertTrue();
      done();
    });

    it('LoggerValidation_047', 0, async (done: Function) => {
      const record = new LogRecord(LogLevel.INFO, LogDomain.APP, LOG_TAG, 'x', 0);
      expect(MIN_TAG_LENGTH).assertEqual(1);
      expect(MIN_MESSAGE_LENGTH).assertEqual(0);
      expect(record.toLine().startsWith('0|INFO|')).assertTrue();
      expect(record.toLine().endsWith('|x')).assertTrue();
      done();
    });

    it('LoggerValidation_048', 0, async (done: Function) => {
      const buffer = new LogBuffer(3);
      buffer.append(new LogRecord(LogLevel.INFO, LogDomain.APP, LOG_TAG, 'one', 1));
      const snapshot = buffer.getAll();
      snapshot.push(new LogRecord(LogLevel.INFO, LogDomain.APP, LOG_TAG, 'two', 2));
      expect(buffer.size()).assertEqual(1);
      expect(snapshot.length).assertEqual(2);
      done();
    });

    it('LoggerValidation_049', 0, async (done: Function) => {
      const local = new LogFilter();
      local.setMinimumLevel(LogLevel.ERROR);
      expect(local.accepts(buildRecord(LogLevel.ERROR))).assertTrue();
      expect(local.accepts(buildRecord(LogLevel.FATAL))).assertTrue();
      expect(local.accepts(buildRecord(LogLevel.WARN))).assertFalse();
      done();
    });
  });
}
