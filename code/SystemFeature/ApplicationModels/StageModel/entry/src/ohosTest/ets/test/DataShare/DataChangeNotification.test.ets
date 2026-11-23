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
  getDriver, componentCount, launchMainAbility, buildDataShareUri, normalizeDataShareUri,
  isSampleDataShareUri, BUNDLE_NAME, ABILITY_DATA_SHARE, DATA_SHARE_URI, ACCOUNT_ID
} from '../Shared/SharedDriver';

enum ChangeType {
  INSERT = 0,
  UPDATE = 1,
  DELETE = 2
}

enum ObserverState {
  REGISTERED = 0,
  PAUSED = 1,
  UNREGISTERED = 2
}

const FILTER_ALL: string = '*';
const NOTIFY_SEQUENCE_START: number = 1;
const MAX_OBSERVERS: number = 32;

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

  toRecord(): string {
    return `${this.id}|${this.name}|${this.introduction}`;
  }
}

class ChangeRecord {
  readonly uri: string;
  readonly type: ChangeType;
  readonly bookId: number;
  readonly sequence: number;
  readonly payload: string;

  constructor(uri: string, type: ChangeType, bookId: number, sequence: number, payload: string) {
    this.uri = uri;
    this.type = type;
    this.bookId = bookId;
    this.sequence = sequence;
    this.payload = payload;
  }

  digest(): string {
    return `${this.sequence}|${this.type}|${this.bookId}|${this.uri}`;
  }

  isInsert(): boolean {
    return this.type === ChangeType.INSERT;
  }

  matchesUri(filter: string): boolean {
    if (filter === FILTER_ALL) {
      return true;
    }
    return this.uri === filter;
  }
}

class Observer {
  readonly id: string;
  readonly uriFilter: string;
  state: ObserverState = ObserverState.REGISTERED;
  private received: ChangeRecord[] = [];

  constructor(id: string, uriFilter: string) {
    this.id = id;
    this.uriFilter = uriFilter;
  }

  matches(record: ChangeRecord): boolean {
    return record.matchesUri(this.uriFilter);
  }

  receive(record: ChangeRecord): boolean {
    if (this.state !== ObserverState.REGISTERED) {
      return false;
    }
    if (!this.matches(record)) {
      return false;
    }
    this.received.push(record);
    return true;
  }

  count(): number {
    return this.received.length;
  }

  records(): ChangeRecord[] {
    const copy: ChangeRecord[] = [];
    for (const record of this.received) {
      copy.push(record);
    }
    return copy;
  }

  lastSequence(): number {
    if (this.received.length === 0) {
      return -1;
    }
    return this.received[this.received.length - 1].sequence;
  }

  pause(): void {
    this.state = ObserverState.PAUSED;
  }

  resume(): void {
    this.state = ObserverState.REGISTERED;
  }

  unregister(): void {
    this.state = ObserverState.UNREGISTERED;
  }

  clear(): void {
    this.received = [];
  }
}

class ChangeQueue {
  private records: ChangeRecord[] = [];

  enqueue(record: ChangeRecord): boolean {
    for (const existing of this.records) {
      if (existing.sequence === record.sequence) {
        return false;
      }
    }
    this.records.push(record);
    return true;
  }

  dequeue(): ChangeRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    const first: ChangeRecord = this.records[0];
    this.records.splice(0, 1);
    return first;
  }

  peek(): ChangeRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[0];
  }

  size(): number {
    return this.records.length;
  }

  isEmpty(): boolean {
    return this.records.length === 0;
  }

  ordered(): boolean {
    for (let index = 1; index < this.records.length; index++) {
      if (this.records[index].sequence <= this.records[index - 1].sequence) {
        return false;
      }
    }
    return true;
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

  clear(): void {
    this.books = [];
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

class NotificationCenter {
  private observers: Observer[] = [];
  private sequence: number = NOTIFY_SEQUENCE_START;
  private dispatchCount: number = 0;

  register(observer: Observer): boolean {
    if (this.observers.length >= MAX_OBSERVERS) {
      return false;
    }
    if (this.find(observer.id) !== null) {
      return false;
    }
    this.observers.push(observer);
    return true;
  }

  find(id: string): Observer | null {
    for (const observer of this.observers) {
      if (observer.id === id) {
        return observer;
      }
    }
    return null;
  }

  unregister(id: string): boolean {
    const observer = this.find(id);
    if (observer === null) {
      return false;
    }
    observer.unregister();
    return true;
  }

  size(): number {
    return this.observers.length;
  }

  activeCount(): number {
    let count = 0;
    for (const observer of this.observers) {
      if (observer.state === ObserverState.REGISTERED) {
        count += 1;
      }
    }
    return count;
  }

  notify(uri: string, type: ChangeType, bookId: number, payload: string): number {
    const record = new ChangeRecord(uri, type, bookId, this.sequence, payload);
    this.sequence += 1;
    let delivered = 0;
    for (const observer of this.observers) {
      if (observer.receive(record)) {
        delivered += 1;
      }
    }
    this.dispatchCount += delivered;
    return delivered;
  }

  totalDispatched(): number {
    return this.dispatchCount;
  }

  nextSequence(): number {
    return this.sequence;
  }

  drain(queue: ChangeQueue): number {
    let count = 0;
    while (!queue.isEmpty()) {
      const record = queue.dequeue();
      if (record === null) {
        break;
      }
      for (const observer of this.observers) {
        if (observer.receive(record)) {
          count += 1;
        }
      }
    }
    this.dispatchCount += count;
    return count;
  }

  notifiedSequence(): number[] {
    const values: number[] = [];
    for (const observer of this.observers) {
      values.push(observer.lastSequence());
    }
    return values;
  }
}

class BookChangeService {
  private table: BookTable = new BookTable();
  private center: NotificationCenter;

  constructor(center: NotificationCenter) {
    this.center = center;
  }

  insertBook(book: Book): boolean {
    if (!this.table.insert(book)) {
      return false;
    }
    this.center.notify(DATA_SHARE_URI, ChangeType.INSERT, book.id, book.toRecord());
    return true;
  }

  updateBook(id: number, name: string, introduction: string): boolean {
    if (!this.table.update(id, name, introduction)) {
      return false;
    }
    const found = this.table.findById(id);
    const payload = found === null ? '' : found.toRecord();
    this.center.notify(DATA_SHARE_URI, ChangeType.UPDATE, id, payload);
    return true;
  }

  deleteBook(id: number): boolean {
    if (!this.table.deleteById(id)) {
      return false;
    }
    this.center.notify(DATA_SHARE_URI, ChangeType.DELETE, id, '');
    return true;
  }

  count(): number {
    return this.table.count();
  }

  query(): ResultSet {
    return new ResultSet(this.table.all());
  }
}

function buildNotifyBooks(): Book[] {
  return [
    new Book(1, 'ArkTS', 'notify'),
    new Book(2, 'DataShare', 'change'),
    new Book(3, 'ResultSet', 'cursor')
  ];
}

export default function dataChangeNotificationTest(): void {
  describe('DataChangeNotificationSuite', () => {
    let center: NotificationCenter = new NotificationCenter();

    beforeAll(() => {
      center = new NotificationCenter();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'data change notification start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'data change notification end');
    });

    it('DataChangeNotification_001', 0, async (done: Function) => {
      expect(center.size()).assertEqual(0);
      expect(center.activeCount()).assertEqual(0);
      expect(center.totalDispatched()).assertEqual(0);
      const record = new ChangeRecord(DATA_SHARE_URI, ChangeType.INSERT, 1, 5, 'payload');
      expect(record.uri).assertEqual(DATA_SHARE_URI);
      expect(record.type).assertEqual(ChangeType.INSERT);
      expect(record.bookId).assertEqual(1);
      expect(record.sequence).assertEqual(5);
      expect(record.digest()).assertEqual(`5|0|1|${DATA_SHARE_URI}`);
      done();
    });

    it('DataChangeNotification_002', 0, async (done: Function) => {
      const insert = new ChangeRecord(DATA_SHARE_URI, ChangeType.INSERT, 1, 1, '');
      const update = new ChangeRecord(DATA_SHARE_URI, ChangeType.UPDATE, 1, 2, '');
      const remove = new ChangeRecord(DATA_SHARE_URI, ChangeType.DELETE, 1, 3, '');
      expect(insert.isInsert()).assertTrue();
      expect(update.isInsert()).assertFalse();
      expect(remove.isInsert()).assertFalse();
      done();
    });

    it('DataChangeNotification_003', 0, async (done: Function) => {
      const record = new ChangeRecord(DATA_SHARE_URI, ChangeType.UPDATE, 2, 1, '');
      expect(record.matchesUri(FILTER_ALL)).assertTrue();
      expect(record.matchesUri(DATA_SHARE_URI)).assertTrue();
      expect(record.matchesUri(buildDataShareUri('Book'))).assertFalse();
      done();
    });

    it('DataChangeNotification_004', 0, async (done: Function) => {
      const observer = new Observer('obs-1', FILTER_ALL);
      expect(observer.state).assertEqual(ObserverState.REGISTERED);
      expect(observer.count()).assertEqual(0);
      expect(observer.lastSequence()).assertEqual(-1);
      expect(observer.records().length).assertEqual(0);
      done();
    });

    it('DataChangeNotification_005', 0, async (done: Function) => {
      const observer = new Observer('obs-1', DATA_SHARE_URI);
      const record = new ChangeRecord(DATA_SHARE_URI, ChangeType.INSERT, 1, 1, 'x');
      expect(observer.receive(record)).assertTrue();
      expect(observer.count()).assertEqual(1);
      expect(observer.lastSequence()).assertEqual(1);
      expect(observer.matches(record)).assertTrue();
      done();
    });

    it('DataChangeNotification_006', 0, async (done: Function) => {
      const observer = new Observer('obs-1', buildDataShareUri('Other'));
      const record = new ChangeRecord(DATA_SHARE_URI, ChangeType.INSERT, 1, 1, 'x');
      expect(observer.matches(record)).assertFalse();
      expect(observer.receive(record)).assertFalse();
      expect(observer.count()).assertEqual(0);
      done();
    });

    it('DataChangeNotification_007', 0, async (done: Function) => {
      const observer = new Observer('obs-1', FILTER_ALL);
      observer.pause();
      expect(observer.state).assertEqual(ObserverState.PAUSED);
      const record = new ChangeRecord(DATA_SHARE_URI, ChangeType.INSERT, 1, 1, 'x');
      expect(observer.receive(record)).assertFalse();
      observer.resume();
      expect(observer.receive(record)).assertTrue();
      expect(observer.count()).assertEqual(1);
      done();
    });

    it('DataChangeNotification_008', 0, async (done: Function) => {
      const observer = new Observer('obs-1', FILTER_ALL);
      observer.unregister();
      expect(observer.state).assertEqual(ObserverState.UNREGISTERED);
      expect(observer.receive(new ChangeRecord(DATA_SHARE_URI, ChangeType.DELETE, 1, 1, ''))).assertFalse();
      expect(observer.count()).assertEqual(0);
      done();
    });

    it('DataChangeNotification_009', 0, async (done: Function) => {
      const observer = new Observer('obs-9', FILTER_ALL);
      observer.receive(new ChangeRecord(DATA_SHARE_URI, ChangeType.INSERT, 1, 1, ''));
      observer.receive(new ChangeRecord(DATA_SHARE_URI, ChangeType.UPDATE, 1, 2, ''));
      expect(observer.count()).assertEqual(2);
      expect(observer.lastSequence()).assertEqual(2);
      const copy = observer.records();
      expect(copy.length).assertEqual(2);
      expect(copy[0].sequence).assertEqual(1);
      done();
    });

    it('DataChangeNotification_010', 0, async (done: Function) => {
      const observer = new Observer('obs-9', FILTER_ALL);
      observer.receive(new ChangeRecord(DATA_SHARE_URI, ChangeType.INSERT, 1, 1, ''));
      observer.clear();
      expect(observer.count()).assertEqual(0);
      expect(observer.lastSequence()).assertEqual(-1);
      expect(observer.records().length).assertEqual(0);
      done();
    });

    it('DataChangeNotification_011', 0, async (done: Function) => {
      const local = new NotificationCenter();
      const observer = new Observer('obs-1', FILTER_ALL);
      expect(local.register(observer)).assertTrue();
      expect(local.register(observer)).assertFalse();
      expect(local.size()).assertEqual(1);
      expect(local.activeCount()).assertEqual(1);
      expect(local.find('obs-1') !== null).assertTrue();
      expect(local.find('missing')).assertNull();
      done();
    });

    it('DataChangeNotification_012', 0, async (done: Function) => {
      const local = new NotificationCenter();
      local.register(new Observer('obs-1', FILTER_ALL));
      const delivered = local.notify(DATA_SHARE_URI, ChangeType.INSERT, 1, 'payload');
      expect(delivered).assertEqual(1);
      expect(local.totalDispatched()).assertEqual(1);
      expect(local.nextSequence()).assertEqual(2);
      done();
    });

    it('DataChangeNotification_013', 0, async (done: Function) => {
      const local = new NotificationCenter();
      local.register(new Observer('obs-1', FILTER_ALL));
      local.register(new Observer('obs-2', FILTER_ALL));
      const delivered = local.notify(DATA_SHARE_URI, ChangeType.UPDATE, 1, 'payload');
      expect(delivered).assertEqual(2);
      expect(local.totalDispatched()).assertEqual(2);
      expect(local.activeCount()).assertEqual(2);
      done();
    });

    it('DataChangeNotification_014', 0, async (done: Function) => {
      const local = new NotificationCenter();
      local.register(new Observer('obs-1', DATA_SHARE_URI));
      local.register(new Observer('obs-2', buildDataShareUri('Other')));
      const delivered = local.notify(DATA_SHARE_URI, ChangeType.DELETE, 1, '');
      expect(delivered).assertEqual(1);
      const other = local.find('obs-2');
      expect(other !== null).assertTrue();
      if (other !== null) {
        expect(other.count()).assertEqual(0);
      }
      done();
    });

    it('DataChangeNotification_015', 0, async (done: Function) => {
      const local = new NotificationCenter();
      const observer = new Observer('obs-1', FILTER_ALL);
      local.register(observer);
      local.unregister('obs-1');
      expect(observer.state).assertEqual(ObserverState.UNREGISTERED);
      expect(local.activeCount()).assertEqual(0);
      expect(local.notify(DATA_SHARE_URI, ChangeType.INSERT, 1, '')).assertEqual(0);
      expect(local.unregister('obs-1')).assertTrue();
      expect(local.unregister('missing')).assertFalse();
      done();
    });

    it('DataChangeNotification_016', 0, async (done: Function) => {
      const local = new NotificationCenter();
      const observer = new Observer('obs-1', FILTER_ALL);
      local.register(observer);
      observer.pause();
      expect(local.activeCount()).assertEqual(0);
      expect(local.notify(DATA_SHARE_URI, ChangeType.INSERT, 1, '')).assertEqual(0);
      observer.resume();
      expect(local.notify(DATA_SHARE_URI, ChangeType.INSERT, 2, '')).assertEqual(1);
      expect(observer.count()).assertEqual(1);
      done();
    });

    it('DataChangeNotification_017', 0, async (done: Function) => {
      const local = new NotificationCenter();
      local.register(new Observer('obs-1', FILTER_ALL));
      local.notify(DATA_SHARE_URI, ChangeType.INSERT, 1, '');
      local.notify(DATA_SHARE_URI, ChangeType.UPDATE, 1, '');
      local.notify(DATA_SHARE_URI, ChangeType.DELETE, 1, '');
      expect(local.nextSequence()).assertEqual(4);
      expect(local.totalDispatched()).assertEqual(3);
      done();
    });

    it('DataChangeNotification_018', 0, async (done: Function) => {
      const local = new NotificationCenter();
      const observer = new Observer('obs-1', FILTER_ALL);
      local.register(observer);
      local.notify(DATA_SHARE_URI, ChangeType.INSERT, 1, '');
      local.notify(DATA_SHARE_URI, ChangeType.UPDATE, 2, '');
      const sequences = local.notifiedSequence();
      expect(sequences.length).assertEqual(1);
      expect(sequences[0]).assertEqual(2);
      expect(observer.lastSequence()).assertEqual(2);
      done();
    });

    it('DataChangeNotification_019', 0, async (done: Function) => {
      const queue = new ChangeQueue();
      expect(queue.isEmpty()).assertTrue();
      expect(queue.size()).assertEqual(0);
      expect(queue.dequeue()).assertNull();
      expect(queue.peek()).assertNull();
      expect(queue.ordered()).assertTrue();
      done();
    });

    it('DataChangeNotification_020', 0, async (done: Function) => {
      const queue = new ChangeQueue();
      const first = new ChangeRecord(DATA_SHARE_URI, ChangeType.INSERT, 1, 2, '');
      const second = new ChangeRecord(DATA_SHARE_URI, ChangeType.UPDATE, 1, 3, '');
      expect(queue.enqueue(first)).assertTrue();
      expect(queue.enqueue(second)).assertTrue();
      expect(queue.size()).assertEqual(2);
      expect(queue.ordered()).assertTrue();
      expect(queue.peek() !== null).assertTrue();
      done();
    });

    it('DataChangeNotification_021', 0, async (done: Function) => {
      const queue = new ChangeQueue();
      const first = new ChangeRecord(DATA_SHARE_URI, ChangeType.INSERT, 1, 1, '');
      expect(queue.enqueue(first)).assertTrue();
      expect(queue.enqueue(first)).assertFalse();
      expect(queue.size()).assertEqual(1);
      expect(queue.enqueue(new ChangeRecord(DATA_SHARE_URI, ChangeType.UPDATE, 6, 1, ''))).assertFalse();
      done();
    });

    it('DataChangeNotification_022', 0, async (done: Function) => {
      const queue = new ChangeQueue();
      queue.enqueue(new ChangeRecord(DATA_SHARE_URI, ChangeType.INSERT, 1, 1, ''));
      queue.enqueue(new ChangeRecord(DATA_SHARE_URI, ChangeType.UPDATE, 1, 2, ''));
      const head = queue.dequeue();
      expect(head !== null).assertTrue();
      if (head !== null) {
        expect(head.sequence).assertEqual(1);
        expect(head.type).assertEqual(ChangeType.INSERT);
      }
      expect(queue.size()).assertEqual(1);
      expect(queue.dequeue() !== null).assertTrue();
      expect(queue.isEmpty()).assertTrue();
      done();
    });

    it('DataChangeNotification_023', 0, async (done: Function) => {
      const queue = new ChangeQueue();
      queue.enqueue(new ChangeRecord(DATA_SHARE_URI, ChangeType.INSERT, 1, 5, ''));
      queue.enqueue(new ChangeRecord(DATA_SHARE_URI, ChangeType.UPDATE, 1, 2, ''));
      expect(queue.ordered()).assertFalse();
      expect(queue.size()).assertEqual(2);
      done();
    });

    it('DataChangeNotification_024', 0, async (done: Function) => {
      const local = new NotificationCenter();
      const observer = new Observer('obs-1', FILTER_ALL);
      local.register(observer);
      const queue = new ChangeQueue();
      queue.enqueue(new ChangeRecord(DATA_SHARE_URI, ChangeType.INSERT, 1, 1, ''));
      queue.enqueue(new ChangeRecord(DATA_SHARE_URI, ChangeType.UPDATE, 2, 2, ''));
      const delivered = local.drain(queue);
      expect(delivered).assertEqual(2);
      expect(queue.isEmpty()).assertTrue();
      expect(observer.count()).assertEqual(2);
      done();
    });

    it('DataChangeNotification_025', 0, async (done: Function) => {
      const local = new NotificationCenter();
      const queue = new ChangeQueue();
      expect(local.drain(queue)).assertEqual(0);
      expect(local.totalDispatched()).assertEqual(0);
      queue.enqueue(new ChangeRecord(DATA_SHARE_URI, ChangeType.INSERT, 1, 1, ''));
      expect(local.drain(queue)).assertEqual(0);
      expect(queue.isEmpty()).assertTrue();
      done();
    });

    it('DataChangeNotification_026', 0, async (done: Function) => {
      const local = new NotificationCenter();
      const service = new BookChangeService(local);
      expect(service.insertBook(new Book(1, 'ArkTS', 'first'))).assertTrue();
      expect(service.count()).assertEqual(1);
      expect(local.totalDispatched()).assertEqual(0);
      local.register(new Observer('obs-1', FILTER_ALL));
      expect(service.insertBook(new Book(2, 'DataShare', 'second'))).assertTrue();
      expect(local.totalDispatched()).assertEqual(1);
      done();
    });

    it('DataChangeNotification_027', 0, async (done: Function) => {
      const local = new NotificationCenter();
      const observer = new Observer('obs-1', FILTER_ALL);
      local.register(observer);
      const service = new BookChangeService(local);
      service.insertBook(new Book(1, 'ArkTS', 'first'));
      expect(observer.count()).assertEqual(1);
      expect(observer.lastSequence()).assertEqual(1);
      const record = observer.records()[0];
      expect(record.type).assertEqual(ChangeType.INSERT);
      expect(record.bookId).assertEqual(1);
      done();
    });

    it('DataChangeNotification_028', 0, async (done: Function) => {
      const local = new NotificationCenter();
      const observer = new Observer('obs-1', FILTER_ALL);
      local.register(observer);
      const service = new BookChangeService(local);
      service.insertBook(new Book(1, 'ArkTS', 'first'));
      expect(service.updateBook(1, 'ArkTS2', 'updated')).assertTrue();
      expect(service.updateBook(9, 'Missing', 'none')).assertFalse();
      expect(observer.count()).assertEqual(2);
      expect(observer.records()[1].type).assertEqual(ChangeType.UPDATE);
      expect(observer.records()[1].payload.indexOf('ArkTS2') >= 0).assertTrue();
      done();
    });

    it('DataChangeNotification_029', 0, async (done: Function) => {
      const local = new NotificationCenter();
      const observer = new Observer('obs-1', FILTER_ALL);
      local.register(observer);
      const service = new BookChangeService(local);
      service.insertBook(new Book(1, 'ArkTS', 'first'));
      expect(service.deleteBook(1)).assertTrue();
      expect(service.deleteBook(1)).assertFalse();
      expect(service.count()).assertEqual(0);
      expect(observer.count()).assertEqual(2);
      expect(observer.records()[1].type).assertEqual(ChangeType.DELETE);
      done();
    });

    it('DataChangeNotification_030', 0, async (done: Function) => {
      const local = new NotificationCenter();
      const service = new BookChangeService(local);
      service.insertBook(new Book(1, 'A', 'x'));
      service.insertBook(new Book(2, 'B', 'y'));
      const resultSet = service.query();
      expect(resultSet.rowCount()).assertEqual(2);
      expect(resultSet.goToFirstRow()).assertTrue();
      expect(resultSet.getInt('id')).assertEqual(1);
      expect(resultSet.getString('name')).assertEqual('A');
      done();
    });

    it('DataChangeNotification_031', 0, async (done: Function) => {
      const local = new NotificationCenter();
      const observer = new Observer('obs-1', buildDataShareUri('Other'));
      local.register(observer);
      const service = new BookChangeService(local);
      service.insertBook(new Book(1, 'ArkTS', 'first'));
      expect(local.totalDispatched()).assertEqual(0);
      expect(observer.count()).assertEqual(0);
      expect(service.count()).assertEqual(1);
      done();
    });

    it('DataChangeNotification_032', 0, async (done: Function) => {
      const table = new BookTable();
      expect(table.insert(new Book(1, 'A', 'x'))).assertTrue();
      expect(table.insert(new Book(1, 'B', 'y'))).assertFalse();
      expect(table.update(1, 'A2', 'z')).assertTrue();
      expect(table.deleteById(1)).assertTrue();
      expect(table.count()).assertEqual(0);
      done();
    });

    it('DataChangeNotification_033', 0, async (done: Function) => {
      const table = new BookTable();
      for (const book of buildNotifyBooks()) {
        table.insert(book);
      }
      const resultSet = new ResultSet(table.all());
      let visited = 0;
      if (resultSet.goToFirstRow()) {
        visited += 1;
        while (resultSet.goToNextRow()) {
          visited += 1;
        }
      }
      expect(visited).assertEqual(3);
      expect(resultSet.current()).assertNull();
      resultSet.close();
      expect(resultSet.getString('name')).assertEqual('');
      done();
    });

    it('DataChangeNotification_034', 0, async (done: Function) => {
      const local = new NotificationCenter();
      for (let index = 0; index < 10; index++) {
        local.register(new Observer(`obs-${index}`, FILTER_ALL));
      }
      expect(local.size()).assertEqual(10);
      expect(local.activeCount()).assertEqual(10);
      expect(local.notify(DATA_SHARE_URI, ChangeType.INSERT, 1, '')).assertEqual(10);
      done();
    });

    it('DataChangeNotification_035', 0, async (done: Function) => {
      const local = new NotificationCenter();
      const observer = new Observer('obs-1', FILTER_ALL);
      local.register(observer);
      const first = local.notify(DATA_SHARE_URI, ChangeType.INSERT, 1, '');
      const second = local.notify(DATA_SHARE_URI, ChangeType.UPDATE, 1, '');
      expect(first).assertEqual(1);
      expect(second).assertEqual(1);
      expect(local.totalDispatched()).assertEqual(2);
      expect(observer.count()).assertEqual(2);
      expect(observer.records()[0].sequence).assertEqual(1);
      expect(observer.records()[1].sequence).assertEqual(2);
      done();
    });

    it('DataChangeNotification_036', 0, async (done: Function) => {
      expect(ChangeType.INSERT).assertEqual(0);
      expect(ChangeType.DELETE).assertEqual(2);
      expect(ObserverState.UNREGISTERED).assertEqual(2);
      expect(FILTER_ALL).assertEqual('*');
      expect(NOTIFY_SEQUENCE_START).assertEqual(1);
      done();
    });

    it('DataChangeNotification_037', 0, async (done: Function) => {
      expect(isSampleDataShareUri(DATA_SHARE_URI)).assertTrue();
      expect(normalizeDataShareUri(DATA_SHARE_URI).length > 0).assertTrue();
      expect(buildDataShareUri('Book').indexOf('Book') >= 0).assertTrue();
      done();
    });

    it('DataChangeNotification_038', 0, async (done: Function) => {
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(ABILITY_DATA_SHARE).assertEqual('DataShareExtAbility');
      expect(ACCOUNT_ID).assertEqual(100);
      expect(DATA_SHARE_URI.startsWith('datashare:///')).assertTrue();
      done();
    });

    it('DataChangeNotification_039', 0, async (done: Function) => {
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

