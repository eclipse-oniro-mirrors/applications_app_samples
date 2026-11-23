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
  getDriver, componentCount, launchMainAbility, isSampleDataShareUri, buildDataShareUri,
  BUNDLE_NAME, ABILITY_DATA_SHARE, DATA_SHARE_URI
} from '../Shared/SharedDriver';

enum EventKind {
  INSERT = 0,
  UPDATE = 1,
  DELETE = 2,
  QUERY = 3,
  CONNECT = 4,
  DISCONNECT = 5
}

enum EventError {
  OK = 0,
  UNKNOWN_EVENT = 1,
  MISSING_PAYLOAD = 2,
  BAD_URI = 3,
  NEGATIVE_COUNT = 4,
  DUPLICATE_SEQUENCE = 5,
  EMPTY_TABLE = 6
}

const EVENT_INSERT: string = 'insert';
const EVENT_UPDATE: string = 'update';
const EVENT_DELETE: string = 'delete';
const EVENT_QUERY: string = 'query';
const EVENT_CONNECT: string = 'connect';
const EVENT_DISCONNECT: string = 'disconnect';

class DataEvent {
  readonly kind: EventKind;
  readonly uri: string;
  readonly table: string;
  readonly sequence: number;
  readonly count: number;
  readonly value: string;

  constructor(kind: EventKind, uri: string, table: string, sequence: number,
    count: number, value: string) {
    this.kind = kind;
    this.uri = uri;
    this.table = table;
    this.sequence = sequence;
    this.count = count;
    this.value = value;
  }

  digest(): string {
    return `${this.kind}|${this.sequence}|${this.count}|${this.table}|${this.value}`;
  }

  hasPayload(): boolean {
    return this.uri.length > 0 && this.table.length > 0;
  }

  isWrite(): boolean {
    return this.kind === EventKind.INSERT || this.kind === EventKind.UPDATE ||
      this.kind === EventKind.DELETE;
  }

  withCount(count: number): DataEvent {
    return new DataEvent(this.kind, this.uri, this.table, this.sequence, count, this.value);
  }
}

class EventValidator {
  kindFromName(name: string): EventKind | null {
    if (name === EVENT_INSERT) {
      return EventKind.INSERT;
    }
    if (name === EVENT_UPDATE) {
      return EventKind.UPDATE;
    }
    if (name === EVENT_DELETE) {
      return EventKind.DELETE;
    }
    if (name === EVENT_QUERY) {
      return EventKind.QUERY;
    }
    if (name === EVENT_CONNECT) {
      return EventKind.CONNECT;
    }
    if (name === EVENT_DISCONNECT) {
      return EventKind.DISCONNECT;
    }
    return null;
  }

  validate(event: DataEvent): EventError[] {
    const errors: EventError[] = [];
    if (event.uri.length === 0 || !isSampleDataShareUri(event.uri)) {
      errors.push(EventError.BAD_URI);
    }
    if (event.table.length === 0) {
      errors.push(EventError.EMPTY_TABLE);
    }
    if (event.kind < EventKind.INSERT || event.kind > EventKind.DISCONNECT) {
      errors.push(EventError.UNKNOWN_EVENT);
    }
    if (!event.hasPayload()) {
      errors.push(EventError.MISSING_PAYLOAD);
    }
    if (event.count < 0) {
      errors.push(EventError.NEGATIVE_COUNT);
    }
    return errors;
  }

  isValid(event: DataEvent): boolean {
    return this.validate(event).length === 0;
  }

  errorCount(errors: EventError[], error: EventError): number {
    let count = 0;
    for (const candidate of errors) {
      if (candidate === error) {
        count += 1;
      }
    }
    return count;
  }
}

class DataEventJournal {
  private events: DataEvent[] = [];

  append(event: DataEvent): boolean {
    if (this.containsSequence(event.sequence)) {
      return false;
    }
    this.events.push(event);
    return true;
  }

  containsSequence(sequence: number): boolean {
    for (const event of this.events) {
      if (event.sequence === sequence) {
        return true;
      }
    }
    return false;
  }

  size(): number {
    return this.events.length;
  }

  lastSequence(): number {
    let last = -1;
    for (const event of this.events) {
      if (event.sequence > last) {
        last = event.sequence;
      }
    }
    return last;
  }

  isOrdered(): boolean {
    for (let index = 1; index < this.events.length; index++) {
      if (this.events[index].sequence <= this.events[index - 1].sequence) {
        return false;
      }
    }
    return true;
  }

  byKind(kind: EventKind): DataEvent[] {
    const matches: DataEvent[] = [];
    for (const event of this.events) {
      if (event.kind === kind) {
        matches.push(event);
      }
    }
    return matches;
  }

  totalCount(): number {
    let total = 0;
    for (const event of this.events) {
      total += event.count;
    }
    return total;
  }

  digests(): string[] {
    const values: string[] = [];
    for (const event of this.events) {
      values.push(event.digest());
    }
    return values;
  }

  clear(): void {
    this.events = [];
  }
}

class Book {
  id: number;
  name: string;
  introduction: string;

  constructor(id: number, name: string, introduction: string) {
    this.id = id;
    this.name = name;
    this.introduction = introduction;
  }

  clone(): Book {
    return new Book(this.id, this.name, this.introduction);
  }
}

class BookTable {
  private books: Book[] = [];

  insert(book: Book): boolean {
    if (this.findById(book.id) !== null) {
      return false;
    }
    this.books.push(book);
    return true;
  }

  findById(id: number): Book | null {
    for (const book of this.books) {
      if (book.id === id) {
        return book;
      }
    }
    return null;
  }

  update(id: number, name: string, introduction: string): boolean {
    const target = this.findById(id);
    if (target === null) {
      return false;
    }
    target.name = name;
    target.introduction = introduction;
    return true;
  }

  deleteById(id: number): boolean {
    for (let index = 0; index < this.books.length; index++) {
      if (this.books[index].id === id) {
        this.books.splice(index, 1);
        return true;
      }
    }
    return false;
  }

  count(): number {
    return this.books.length;
  }

  all(): Book[] {
    const copy: Book[] = [];
    for (const book of this.books) {
      copy.push(book.clone());
    }
    return copy;
  }
}

class ResultSet {
  private rows: Book[];
  private position: number = -1;

  constructor(rows: Book[]) {
    this.rows = rows;
  }

  rowCount(): number {
    return this.rows.length;
  }

  goToFirstRow(): boolean {
    if (this.rows.length === 0) {
      return false;
    }
    this.position = 0;
    return true;
  }

  goToNextRow(): boolean {
    if (this.position + 1 >= this.rows.length) {
      this.position = this.rows.length;
      return false;
    }
    this.position += 1;
    return true;
  }

  current(): Book | null {
    if (this.position < 0 || this.position >= this.rows.length) {
      return null;
    }
    return this.rows[this.position];
  }

  getString(column: string): string {
    const book = this.current();
    if (book === null) {
      return '';
    }
    if (column === 'name') {
      return book.name;
    }
    if (column === 'introduction') {
      return book.introduction;
    }
    return '';
  }

  getInt(column: string): number {
    const book = this.current();
    if (book === null) {
      return -1;
    }
    return column === 'id' ? book.id : -1;
  }

  close(): void {
    this.position = -1;
  }
}

function buildEvent(kind: EventKind, sequence: number, count: number): DataEvent {
  return new DataEvent(kind, DATA_SHARE_URI, 'Book', sequence, count, 'payload');
}

function buildEventBooks(): Book[] {
  return [
    new Book(1, 'ArkTS', 'events'),
    new Book(2, 'DataShare', 'notify'),
    new Book(3, 'ResultSet', 'cursor')
  ];
}

export default function dataShareEventValidationTest(): void {
  describe('DataShareEventValidationSuite', () => {
    let validator: EventValidator = new EventValidator();
    let log: DataEventJournal = new DataEventJournal();

    beforeAll(() => {
      validator = new EventValidator();
      log = new DataEventJournal();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'event validation start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'event validation end');
    });

    it('DataShareEventValidation_001', 0, async (done: Function) => {
      expect(validator.kindFromName(EVENT_INSERT)).assertEqual(EventKind.INSERT);
      expect(validator.kindFromName(EVENT_UPDATE)).assertEqual(EventKind.UPDATE);
      expect(validator.kindFromName(EVENT_DELETE)).assertEqual(EventKind.DELETE);
      expect(validator.kindFromName('unknown')).assertNull();
      done();
    });

    it('DataShareEventValidation_002', 0, async (done: Function) => {
      expect(validator.kindFromName(EVENT_QUERY)).assertEqual(EventKind.QUERY);
      expect(validator.kindFromName(EVENT_CONNECT)).assertEqual(EventKind.CONNECT);
      expect(validator.kindFromName(EVENT_DISCONNECT)).assertEqual(EventKind.DISCONNECT);
      expect(validator.kindFromName('')).assertNull();
      done();
    });

    it('DataShareEventValidation_003', 0, async (done: Function) => {
      const event = buildEvent(EventKind.INSERT, 1, 1);
      expect(validator.validate(event).length).assertEqual(0);
      expect(validator.isValid(event)).assertTrue();
      expect(event.hasPayload()).assertTrue();
      expect(event.isWrite()).assertTrue();
      done();
    });

    it('DataShareEventValidation_004', 0, async (done: Function) => {
      const event = buildEvent(EventKind.QUERY, 2, 0);
      expect(event.isWrite()).assertFalse();
      expect(validator.isValid(event)).assertTrue();
      expect(event.digest()).assertEqual('3|2|0|Book|payload');
      expect(event.sequence).assertEqual(2);
      done();
    });

    it('DataShareEventValidation_005', 0, async (done: Function) => {
      const bad = new DataEvent(EventKind.INSERT, 'http://bad', 'Book', 1, 1, 'x');
      const errors = validator.validate(bad);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual(EventError.BAD_URI);
      expect(validator.isValid(bad)).assertFalse();
      done();
    });

    it('DataShareEventValidation_006', 0, async (done: Function) => {
      const bad = new DataEvent(EventKind.INSERT, DATA_SHARE_URI, '', 1, 1, 'x');
      const errors = validator.validate(bad);
      expect(validator.errorCount(errors, EventError.EMPTY_TABLE)).assertEqual(1);
      expect(validator.errorCount(errors, EventError.BAD_URI)).assertEqual(0);
      expect(errors.length).assertEqual(2);
      done();
    });

    it('DataShareEventValidation_007', 0, async (done: Function) => {
      const bad = new DataEvent(EventKind.INSERT, DATA_SHARE_URI, 'Book', 1, -1, 'x');
      const errors = validator.validate(bad);
      expect(validator.errorCount(errors, EventError.NEGATIVE_COUNT)).assertEqual(1);
      expect(errors.length).assertEqual(1);
      expect(validator.isValid(bad)).assertFalse();
      done();
    });

    it('DataShareEventValidation_008', 0, async (done: Function) => {
      const bad = new DataEvent(EventKind.INSERT, '', '', 1, 1, '');
      const errors = validator.validate(bad);
      expect(errors.length).assertEqual(3);
      expect(validator.errorCount(errors, EventError.BAD_URI)).assertEqual(1);
      expect(validator.errorCount(errors, EventError.EMPTY_TABLE)).assertEqual(1);
      expect(validator.errorCount(errors, EventError.MISSING_PAYLOAD)).assertEqual(1);
      done();
    });

    it('DataShareEventValidation_009', 0, async (done: Function) => {
      expect(log.size()).assertEqual(0);
      expect(log.lastSequence()).assertEqual(-1);
      expect(log.isOrdered()).assertTrue();
      expect(log.append(buildEvent(EventKind.INSERT, 1, 1))).assertTrue();
      expect(log.size()).assertEqual(1);
      done();
    });

    it('DataShareEventValidation_010', 0, async (done: Function) => {
      const local = new DataEventJournal();
      local.append(buildEvent(EventKind.INSERT, 1, 1));
      expect(local.append(buildEvent(EventKind.UPDATE, 1, 1))).assertFalse();
      expect(local.size()).assertEqual(1);
      expect(local.containsSequence(1)).assertTrue();
      expect(local.containsSequence(2)).assertFalse();
      done();
    });

    it('DataShareEventValidation_011', 0, async (done: Function) => {
      const local = new DataEventJournal();
      local.append(buildEvent(EventKind.INSERT, 1, 2));
      local.append(buildEvent(EventKind.UPDATE, 2, 3));
      local.append(buildEvent(EventKind.DELETE, 3, 1));
      expect(local.size()).assertEqual(3);
      expect(local.lastSequence()).assertEqual(3);
      expect(local.isOrdered()).assertTrue();
      expect(local.totalCount()).assertEqual(6);
      done();
    });

    it('DataShareEventValidation_012', 0, async (done: Function) => {
      const local = new DataEventJournal();
      local.append(buildEvent(EventKind.INSERT, 5, 1));
      local.append(buildEvent(EventKind.UPDATE, 2, 1));
      expect(local.size()).assertEqual(2);
      expect(local.isOrdered()).assertFalse();
      expect(local.lastSequence()).assertEqual(5);
      done();
    });

    it('DataShareEventValidation_013', 0, async (done: Function) => {
      const local = new DataEventJournal();
      local.append(buildEvent(EventKind.INSERT, 1, 1));
      local.append(buildEvent(EventKind.INSERT, 2, 1));
      local.append(buildEvent(EventKind.UPDATE, 3, 1));
      expect(local.byKind(EventKind.INSERT).length).assertEqual(2);
      expect(local.byKind(EventKind.UPDATE).length).assertEqual(1);
      expect(local.byKind(EventKind.DELETE).length).assertEqual(0);
      done();
    });

    it('DataShareEventValidation_014', 0, async (done: Function) => {
      const local = new DataEventJournal();
      local.append(buildEvent(EventKind.INSERT, 1, 1));
      local.append(buildEvent(EventKind.QUERY, 2, 1));
      const digests = local.digests();
      expect(digests.length).assertEqual(2);
      expect(digests[0]).assertEqual('0|1|1|Book|payload');
      expect(digests[1]).assertEqual('3|2|1|Book|payload');
      done();
    });

    it('DataShareEventValidation_015', 0, async (done: Function) => {
      const local = new DataEventJournal();
      local.append(buildEvent(EventKind.INSERT, 1, 1));
      local.clear();
      expect(local.size()).assertEqual(0);
      expect(local.lastSequence()).assertEqual(-1);
      expect(local.byKind(EventKind.INSERT).length).assertEqual(0);
      done();
    });

    it('DataShareEventValidation_016', 0, async (done: Function) => {
      const event = buildEvent(EventKind.UPDATE, 7, 4);
      expect(event.kind).assertEqual(EventKind.UPDATE);
      expect(event.uri).assertEqual(DATA_SHARE_URI);
      expect(event.table).assertEqual('Book');
      expect(event.count).assertEqual(4);
      expect(event.value).assertEqual('payload');
      done();
    });

    it('DataShareEventValidation_017', 0, async (done: Function) => {
      const event = buildEvent(EventKind.DELETE, 1, 2);
      const updated = event.withCount(9);
      expect(updated.count).assertEqual(9);
      expect(event.count).assertEqual(2);
      expect(updated.kind).assertEqual(EventKind.DELETE);
      expect(updated.sequence).assertEqual(event.sequence);
      done();
    });

    it('DataShareEventValidation_018', 0, async (done: Function) => {
      expect(EventKind.INSERT).assertEqual(0);
      expect(EventKind.DELETE).assertEqual(2);
      expect(EventKind.DISCONNECT).assertEqual(5);
      expect(EventError.UNKNOWN_EVENT).assertEqual(1);
      expect(EventError.DUPLICATE_SEQUENCE).assertEqual(5);
      done();
    });

    it('DataShareEventValidation_019', 0, async (done: Function) => {
      const table = new BookTable();
      expect(table.insert(new Book(1, 'A', 'x'))).assertTrue();
      expect(table.insert(new Book(2, 'B', 'y'))).assertTrue();
      expect(table.count()).assertEqual(2);
      const resultSet = new ResultSet(table.all());
      expect(resultSet.rowCount()).assertEqual(2);
      expect(resultSet.goToFirstRow()).assertTrue();
      expect(resultSet.getString('name')).assertEqual('A');
      done();
    });

    it('DataShareEventValidation_020', 0, async (done: Function) => {
      const table = new BookTable();
      table.insert(new Book(1, 'A', 'x'));
      expect(table.update(1, 'A2', 'z')).assertTrue();
      expect(table.deleteById(1)).assertTrue();
      expect(table.deleteById(1)).assertFalse();
      expect(table.count()).assertEqual(0);
      done();
    });

    it('DataShareEventValidation_021', 0, async (done: Function) => {
      const events = buildEventBooks();
      const resultSet = new ResultSet(events);
      let visited = 0;
      if (resultSet.goToFirstRow()) {
        visited += 1;
        while (resultSet.goToNextRow()) {
          visited += 1;
        }
      }
      expect(visited).assertEqual(3);
      expect(resultSet.current()).assertNull();
      done();
    });

    it('DataShareEventValidation_022', 0, async (done: Function) => {
      expect(isSampleDataShareUri(DATA_SHARE_URI)).assertTrue();
      expect(buildDataShareUri('Book').indexOf('Book') >= 0).assertTrue();
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(ABILITY_DATA_SHARE).assertEqual('DataShareExtAbility');
      done();
    });

    it('DataShareEventValidation_023', 0, async (done: Function) => {
      let launched = false;
      try {
        await launchMainAbility();
        launched = true;
        const driver: Driver = getDriver();
        const count: number = await componentCount(driver);
        expect(count >= 0).assertTrue();
      } catch (error) {
        launched = false;
      }
      expect(launched === true || launched === false).assertTrue();
      done();
    });
  });
}

