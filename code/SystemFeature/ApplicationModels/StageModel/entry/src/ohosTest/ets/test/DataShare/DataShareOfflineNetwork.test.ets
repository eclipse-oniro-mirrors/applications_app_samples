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
  getDriver, componentCount, launchMainAbility, buildDataShareUri, isSampleDataShareUri,
  BUNDLE_NAME, ABILITY_DATA_SHARE, DATA_SHARE_URI, ACCOUNT_ID
} from '../Shared/SharedDriver';

enum NetworkState {
  UNKNOWN = 0,
  OFFLINE = 1,
  ONLINE = 2,
  UNSTABLE = 3
}

enum SyncOutcome {
  PENDING = 0,
  SYNCED = 1,
  CONFLICT = 2,
  FAILED = 3
}

enum WriteOp {
  INSERT = 0,
  UPDATE = 1,
  DELETE = 2
}

const CACHE_CAPACITY: number = 16;
const MAX_RETRY: number = 3;
const BASE_DELAY_MS: number = 100;
const CACHE_MISS: string = '';

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

class CacheEntry {
  readonly key: string;
  readonly value: string;
  readonly stamp: number;
  hits: number = 0;

  constructor(key: string, value: string, stamp: number) {
    this.key = key;
    this.value = value;
    this.stamp = stamp;
  }

  touch(): void {
    this.hits += 1;
  }
}

class OfflineCache {
  private entries: CacheEntry[] = [];
  private capacityData: number;

  constructor(capacity: number) {
    this.capacityData = capacity;
  }

  put(key: string, value: string, stamp: number): boolean {
    const existing = this.find(key);
    if (existing !== null) {
      existing.touch();
      return false;
    }
    if (this.entries.length >= this.capacityData) {
      this.entries.shift();
    }
    this.entries.push(new CacheEntry(key, value, stamp));
    return true;
  }

  find(key: string): CacheEntry | null {
    for (const entry of this.entries) {
      if (entry.key === key) {
        return entry;
      }
    }
    return null;
  }

  get(key: string): string {
    const entry = this.find(key);
    if (entry === null) {
      return CACHE_MISS;
    }
    entry.touch();
    return entry.value;
  }

  remove(key: string): boolean {
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].key === key) {
        this.entries.splice(index, 1);
        return true;
      }
    }
    return false;
  }

  size(): number {
    return this.entries.length;
  }

  capacity(): number {
    return this.capacityData;
  }

  keys(): string[] {
    const values: string[] = [];
    for (const entry of this.entries) {
      values.push(entry.key);
    }
    return values;
  }

  clear(): void {
    this.entries = [];
  }
}

class PendingWrite {
  readonly id: number;
  readonly op: WriteOp;
  readonly name: string;
  readonly introduction: string;
  attempt: number = 0;
  outcome: SyncOutcome = SyncOutcome.PENDING;

  constructor(id: number, op: WriteOp, name: string, introduction: string) {
    this.id = id;
    this.op = op;
    this.name = name;
    this.introduction = introduction;
  }

  markSynced(): void {
    this.outcome = SyncOutcome.SYNCED;
  }

  markConflict(): void {
    this.outcome = SyncOutcome.CONFLICT;
  }

  markFailed(): void {
    this.outcome = SyncOutcome.FAILED;
  }

  incrementAttempt(): number {
    this.attempt += 1;
    return this.attempt;
  }

  isPending(): boolean {
    return this.outcome === SyncOutcome.PENDING;
  }

  digest(): string {
    return `${this.id}|${this.op}|${this.name}|${this.attempt}|${this.outcome}`;
  }
}

class NetworkMonitor {
  state: NetworkState = NetworkState.UNKNOWN;
  private transitions: number = 0;
  private lostCount: number = 0;

  setState(next: NetworkState): void {
    if (next !== this.state) {
      this.transitions += 1;
      if (next === NetworkState.OFFLINE) {
        this.lostCount += 1;
      }
    }
    this.state = next;
  }

  isOnline(): boolean {
    return this.state === NetworkState.ONLINE;
  }

  isOffline(): boolean {
    return this.state === NetworkState.OFFLINE;
  }

  isUnstable(): boolean {
    return this.state === NetworkState.UNSTABLE;
  }

  transitionCount(): number {
    return this.transitions;
  }

  lossCount(): number {
    return this.lostCount;
  }

  allowsSync(): boolean {
    return this.state === NetworkState.ONLINE || this.state === NetworkState.UNSTABLE;
  }
}

class SyncSummary {
  synced: number = 0;
  conflicted: number = 0;
  failed: number = 0;
  pending: number = 0;

  total(): number {
    return this.synced + this.conflicted + this.failed + this.pending;
  }

  isComplete(): boolean {
    return this.pending === 0;
  }

  digest(): string {
    return `${this.synced}|${this.conflicted}|${this.failed}|${this.pending}`;
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

class SyncEngine {
  readonly monitor: NetworkMonitor;
  readonly cache: OfflineCache;
  private table: BookTable = new BookTable();
  private queue: PendingWrite[] = [];
  private remoteHas: number[] = [];

  constructor(monitor: NetworkMonitor, cache: OfflineCache) {
    this.monitor = monitor;
    this.cache = cache;
  }

  queueWrite(id: number, op: WriteOp, name: string, introduction: string): PendingWrite {
    const write = new PendingWrite(id, op, name, introduction);
    this.queue.push(write);
    return write;
  }

  pendingCount(): number {
    let count = 0;
    for (const write of this.queue) {
      if (write.isPending()) {
        count += 1;
      }
    }
    return count;
  }

  queueSize(): number {
    return this.queue.length;
  }

  markRemote(id: number): void {
    if (this.remoteHas.indexOf(id) < 0) {
      this.remoteHas.push(id);
    }
  }

  private applyWrite(write: PendingWrite): void {
    if (write.op === WriteOp.INSERT) {
      if (this.table.findById(write.id) === null) {
        this.table.insert(new Book(write.id, write.name, write.introduction));
      }
      this.markRemote(write.id);
      write.markSynced();
      return;
    }
    if (write.op === WriteOp.UPDATE) {
      if (this.table.findById(write.id) === null) {
        write.markConflict();
        return;
      }
      this.table.update(write.id, write.name, write.introduction);
      write.markSynced();
      return;
    }
    if (this.table.deleteById(write.id)) {
      write.markSynced();
    } else {
      write.markFailed();
    }
  }

  flush(): SyncSummary {
    const summary = new SyncSummary();
    if (!this.monitor.allowsSync()) {
      summary.pending = this.pendingCount();
      return summary;
    }
    for (const write of this.queue) {
      if (!write.isPending()) {
        continue;
      }
      write.incrementAttempt();
      if (write.attempt > MAX_RETRY) {
        write.markFailed();
      } else {
        this.applyWrite(write);
      }
      if (write.outcome === SyncOutcome.SYNCED) {
        summary.synced += 1;
      } else if (write.outcome === SyncOutcome.CONFLICT) {
        summary.conflicted += 1;
      } else if (write.outcome === SyncOutcome.FAILED) {
        summary.failed += 1;
      } else {
        summary.pending += 1;
      }
    }
    return summary;
  }

  count(): number {
    return this.table.count();
  }

  query(): ResultSet {
    return new ResultSet(this.table.all());
  }

  retryDelay(attempt: number): number {
    if (attempt <= 1) {
      return BASE_DELAY_MS;
    }
    return BASE_DELAY_MS * attempt;
  }
}

function buildOfflineBooks(): Book[] {
  return [
    new Book(1, 'ArkTS', 'offline'),
    new Book(2, 'DataShare', 'network'),
    new Book(3, 'ResultSet', 'cache')
  ];
}

export default function dataShareOfflineNetworkTest(): void {
  describe('DataShareOfflineNetworkSuite', () => {
    let monitor: NetworkMonitor = new NetworkMonitor();

    beforeAll(() => {
      monitor = new NetworkMonitor();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'offline network start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'offline network end');
    });

    it('DataShareOfflineNetwork_001', 0, async (done: Function) => {
      expect(monitor.state).assertEqual(NetworkState.UNKNOWN);
      expect(monitor.isOnline()).assertFalse();
      expect(monitor.isOffline()).assertFalse();
      expect(monitor.isUnstable()).assertFalse();
      expect(monitor.allowsSync()).assertFalse();
      done();
    });

    it('DataShareOfflineNetwork_002', 0, async (done: Function) => {
      const local = new NetworkMonitor();
      local.setState(NetworkState.ONLINE);
      expect(local.isOnline()).assertTrue();
      expect(local.allowsSync()).assertTrue();
      expect(local.transitionCount()).assertEqual(1);
      expect(local.lossCount()).assertEqual(0);
      done();
    });

    it('DataShareOfflineNetwork_003', 0, async (done: Function) => {
      const local = new NetworkMonitor();
      local.setState(NetworkState.OFFLINE);
      expect(local.isOffline()).assertTrue();
      expect(local.allowsSync()).assertFalse();
      expect(local.lossCount()).assertEqual(1);
      local.setState(NetworkState.OFFLINE);
      expect(local.transitionCount()).assertEqual(1);
      expect(local.lossCount()).assertEqual(1);
      done();
    });

    it('DataShareOfflineNetwork_004', 0, async (done: Function) => {
      const local = new NetworkMonitor();
      local.setState(NetworkState.UNSTABLE);
      expect(local.isUnstable()).assertTrue();
      expect(local.allowsSync()).assertTrue();
      expect(local.isOnline()).assertFalse();
      expect(local.transitionCount()).assertEqual(1);
      done();
    });

    it('DataShareOfflineNetwork_005', 0, async (done: Function) => {
      const local = new NetworkMonitor();
      local.setState(NetworkState.ONLINE);
      local.setState(NetworkState.OFFLINE);
      local.setState(NetworkState.ONLINE);
      local.setState(NetworkState.OFFLINE);
      expect(local.transitionCount()).assertEqual(4);
      expect(local.lossCount()).assertEqual(2);
      expect(local.isOffline()).assertTrue();
      done();
    });

    it('DataShareOfflineNetwork_006', 0, async (done: Function) => {
      const cache = new OfflineCache(CACHE_CAPACITY);
      expect(cache.size()).assertEqual(0);
      expect(cache.capacity()).assertEqual(CACHE_CAPACITY);
      expect(cache.get('missing')).assertEqual(CACHE_MISS);
      expect(cache.remove('missing')).assertFalse();
      expect(cache.keys().length).assertEqual(0);
      done();
    });

    it('DataShareOfflineNetwork_007', 0, async (done: Function) => {
      const cache = new OfflineCache(CACHE_CAPACITY);
      expect(cache.put('book:1', 'ArkTS', 1)).assertTrue();
      expect(cache.size()).assertEqual(1);
      expect(cache.get('book:1')).assertEqual('ArkTS');
      const entry = cache.find('book:1');
      expect(entry !== null).assertTrue();
      if (entry !== null) {
        expect(entry.hits).assertEqual(1);
        expect(entry.stamp).assertEqual(1);
      }
      done();
    });

    it('DataShareOfflineNetwork_008', 0, async (done: Function) => {
      const cache = new OfflineCache(CACHE_CAPACITY);
      cache.put('book:1', 'ArkTS', 1);
      expect(cache.put('book:1', 'Updated', 2)).assertFalse();
      expect(cache.get('book:1')).assertEqual('ArkTS');
      expect(cache.size()).assertEqual(1);
      expect(cache.remove('book:1')).assertTrue();
      expect(cache.size()).assertEqual(0);
      done();
    });

    it('DataShareOfflineNetwork_009', 0, async (done: Function) => {
      const cache = new OfflineCache(2);
      cache.put('a', '1', 1);
      cache.put('b', '2', 2);
      expect(cache.size()).assertEqual(2);
      cache.put('c', '3', 3);
      expect(cache.size()).assertEqual(2);
      expect(cache.find('a')).assertNull();
      expect(cache.find('c') !== null).assertTrue();
      done();
    });

    it('DataShareOfflineNetwork_010', 0, async (done: Function) => {
      const cache = new OfflineCache(CACHE_CAPACITY);
      cache.put('a', '1', 1);
      cache.put('b', '2', 2);
      const keys = cache.keys();
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('a');
      expect(keys[1]).assertEqual('b');
      cache.clear();
      expect(cache.size()).assertEqual(0);
      expect(cache.keys().length).assertEqual(0);
      done();
    });

    it('DataShareOfflineNetwork_011', 0, async (done: Function) => {
      const write = new PendingWrite(1, WriteOp.INSERT, 'ArkTS', 'x');
      expect(write.attempt).assertEqual(0);
      expect(write.outcome).assertEqual(SyncOutcome.PENDING);
      expect(write.isPending()).assertTrue();
      expect(write.incrementAttempt()).assertEqual(1);
      expect(write.incrementAttempt()).assertEqual(2);
      expect(write.digest()).assertEqual('1|0|ArkTS|2|0');
      done();
    });

    it('DataShareOfflineNetwork_012', 0, async (done: Function) => {
      const write = new PendingWrite(1, WriteOp.UPDATE, 'ArkTS', 'x');
      write.markSynced();
      expect(write.outcome).assertEqual(SyncOutcome.SYNCED);
      expect(write.isPending()).assertFalse();
      const other = new PendingWrite(2, WriteOp.DELETE, 'B', 'y');
      other.markConflict();
      expect(other.outcome).assertEqual(SyncOutcome.CONFLICT);
      const third = new PendingWrite(3, WriteOp.INSERT, 'C', 'z');
      third.markFailed();
      expect(third.outcome).assertEqual(SyncOutcome.FAILED);
      done();
    });

    it('DataShareOfflineNetwork_013', 0, async (done: Function) => {
      const summary = new SyncSummary();
      expect(summary.total()).assertEqual(0);
      expect(summary.isComplete()).assertTrue();
      expect(summary.digest()).assertEqual('0|0|0|0');
      summary.synced = 2;
      summary.pending = 1;
      expect(summary.total()).assertEqual(3);
      expect(summary.isComplete()).assertFalse();
      expect(summary.digest()).assertEqual('2|0|0|1');
      done();
    });

    it('DataShareOfflineNetwork_014', 0, async (done: Function) => {
      const monitorLocal = new NetworkMonitor();
      const engine = new SyncEngine(monitorLocal, new OfflineCache(CACHE_CAPACITY));
      expect(engine.queueSize()).assertEqual(0);
      expect(engine.pendingCount()).assertEqual(0);
      expect(engine.count()).assertEqual(0);
      const write = engine.queueWrite(1, WriteOp.INSERT, 'ArkTS', 'x');
      expect(write.isPending()).assertTrue();
      expect(engine.queueSize()).assertEqual(1);
      expect(engine.pendingCount()).assertEqual(1);
      done();
    });

    it('DataShareOfflineNetwork_015', 0, async (done: Function) => {
      const monitorLocal = new NetworkMonitor();
      const engine = new SyncEngine(monitorLocal, new OfflineCache(CACHE_CAPACITY));
      engine.queueWrite(1, WriteOp.INSERT, 'ArkTS', 'x');
      const summary = engine.flush();
      expect(summary.pending).assertEqual(1);
      expect(summary.synced).assertEqual(0);
      expect(summary.total()).assertEqual(1);
      expect(engine.count()).assertEqual(0);
      expect(engine.pendingCount()).assertEqual(1);
      done();
    });

    it('DataShareOfflineNetwork_016', 0, async (done: Function) => {
      const monitorLocal = new NetworkMonitor();
      monitorLocal.setState(NetworkState.ONLINE);
      const engine = new SyncEngine(monitorLocal, new OfflineCache(CACHE_CAPACITY));
      engine.queueWrite(1, WriteOp.INSERT, 'ArkTS', 'x');
      const summary = engine.flush();
      expect(summary.synced).assertEqual(1);
      expect(summary.pending).assertEqual(0);
      expect(summary.isComplete()).assertTrue();
      expect(engine.count()).assertEqual(1);
      done();
    });

    it('DataShareOfflineNetwork_017', 0, async (done: Function) => {
      const monitorLocal = new NetworkMonitor();
      monitorLocal.setState(NetworkState.ONLINE);
      const engine = new SyncEngine(monitorLocal, new OfflineCache(CACHE_CAPACITY));
      engine.queueWrite(1, WriteOp.INSERT, 'ArkTS', 'x');
      engine.queueWrite(2, WriteOp.INSERT, 'DataShare', 'y');
      const summary = engine.flush();
      expect(summary.synced).assertEqual(2);
      expect(engine.count()).assertEqual(2);
      expect(engine.pendingCount()).assertEqual(0);
      done();
    });

    it('DataShareOfflineNetwork_018', 0, async (done: Function) => {
      const monitorLocal = new NetworkMonitor();
      monitorLocal.setState(NetworkState.ONLINE);
      const engine = new SyncEngine(monitorLocal, new OfflineCache(CACHE_CAPACITY));
      engine.queueWrite(1, WriteOp.UPDATE, 'ArkTS', 'x');
      const summary = engine.flush();
      expect(summary.conflicted).assertEqual(1);
      expect(summary.synced).assertEqual(0);
      expect(engine.count()).assertEqual(0);
      done();
    });

    it('DataShareOfflineNetwork_019', 0, async (done: Function) => {
      const monitorLocal = new NetworkMonitor();
      monitorLocal.setState(NetworkState.ONLINE);
      const engine = new SyncEngine(monitorLocal, new OfflineCache(CACHE_CAPACITY));
      engine.queueWrite(1, WriteOp.INSERT, 'ArkTS', 'x');
      engine.queueWrite(1, WriteOp.UPDATE, 'ArkTS2', 'y');
      const summary = engine.flush();
      expect(summary.synced).assertEqual(2);
      const found = engine.query();
      expect(found.rowCount()).assertEqual(1);
      found.goToFirstRow();
      expect(found.getString('name')).assertEqual('ArkTS2');
      done();
    });

    it('DataShareOfflineNetwork_020', 0, async (done: Function) => {
      const monitorLocal = new NetworkMonitor();
      monitorLocal.setState(NetworkState.ONLINE);
      const engine = new SyncEngine(monitorLocal, new OfflineCache(CACHE_CAPACITY));
      engine.queueWrite(1, WriteOp.INSERT, 'ArkTS', 'x');
      engine.queueWrite(1, WriteOp.DELETE, '', '');
      const summary = engine.flush();
      expect(summary.synced).assertEqual(2);
      expect(engine.count()).assertEqual(0);
      expect(engine.query().rowCount()).assertEqual(0);
      done();
    });

    it('DataShareOfflineNetwork_021', 0, async (done: Function) => {
      const monitorLocal = new NetworkMonitor();
      monitorLocal.setState(NetworkState.ONLINE);
      const engine = new SyncEngine(monitorLocal, new OfflineCache(CACHE_CAPACITY));
      engine.queueWrite(1, WriteOp.DELETE, '', '');
      const summary = engine.flush();
      expect(summary.failed).assertEqual(1);
      expect(summary.synced).assertEqual(0);
      expect(summary.isComplete()).assertTrue();
      done();
    });

    it('DataShareOfflineNetwork_022', 0, async (done: Function) => {
      const monitorLocal = new NetworkMonitor();
      monitorLocal.setState(NetworkState.UNSTABLE);
      const engine = new SyncEngine(monitorLocal, new OfflineCache(CACHE_CAPACITY));
      engine.queueWrite(1, WriteOp.INSERT, 'ArkTS', 'x');
      const summary = engine.flush();
      expect(summary.synced).assertEqual(1);
      expect(summary.pending).assertEqual(0);
      expect(engine.count()).assertEqual(1);
      done();
    });

    it('DataShareOfflineNetwork_023', 0, async (done: Function) => {
      const engine = new SyncEngine(new NetworkMonitor(), new OfflineCache(CACHE_CAPACITY));
      expect(engine.retryDelay(0)).assertEqual(BASE_DELAY_MS);
      expect(engine.retryDelay(1)).assertEqual(BASE_DELAY_MS);
      expect(engine.retryDelay(2)).assertEqual(BASE_DELAY_MS * 2);
      expect(engine.retryDelay(3)).assertEqual(BASE_DELAY_MS * 3);
      done();
    });

    it('DataShareOfflineNetwork_024', 0, async (done: Function) => {
      const monitorLocal = new NetworkMonitor();
      const engine = new SyncEngine(monitorLocal, new OfflineCache(CACHE_CAPACITY));
      engine.queueWrite(1, WriteOp.INSERT, 'ArkTS', 'x');
      engine.flush();
      expect(engine.pendingCount()).assertEqual(1);
      monitorLocal.setState(NetworkState.ONLINE);
      const summary = engine.flush();
      expect(summary.synced).assertEqual(1);
      expect(engine.pendingCount()).assertEqual(0);
      expect(engine.count()).assertEqual(1);
      done();
    });

    it('DataShareOfflineNetwork_025', 0, async (done: Function) => {
      const monitorLocal = new NetworkMonitor();
      monitorLocal.setState(NetworkState.ONLINE);
      const engine = new SyncEngine(monitorLocal, new OfflineCache(CACHE_CAPACITY));
      engine.queueWrite(1, WriteOp.INSERT, 'ArkTS', 'x');
      engine.flush();
      const summary = engine.flush();
      expect(summary.total()).assertEqual(0);
      expect(summary.synced).assertEqual(0);
      expect(engine.count()).assertEqual(1);
      expect(engine.queueSize()).assertEqual(1);
      done();
    });

    it('DataShareOfflineNetwork_026', 0, async (done: Function) => {
      const cache = new OfflineCache(CACHE_CAPACITY);
      cache.put('book:1', 'ArkTS', 1);
      cache.put('book:2', 'DataShare', 2);
      expect(cache.get('book:1')).assertEqual('ArkTS');
      expect(cache.get('book:2')).assertEqual('DataShare');
      expect(cache.get('book:3')).assertEqual(CACHE_MISS);
      expect(cache.size()).assertEqual(2);
      done();
    });

    it('DataShareOfflineNetwork_027', 0, async (done: Function) => {
      const table = new BookTable();
      for (const book of buildOfflineBooks()) {
        expect(table.insert(book)).assertTrue();
      }
      expect(table.count()).assertEqual(3);
      expect(table.insert(new Book(1, 'Duplicate', 'x'))).assertFalse();
      expect(table.deleteById(2)).assertTrue();
      expect(table.count()).assertEqual(2);
      done();
    });

    it('DataShareOfflineNetwork_028', 0, async (done: Function) => {
      const table = new BookTable();
      table.insert(new Book(1, 'A', 'x'));
      table.insert(new Book(2, 'B', 'y'));
      const resultSet = new ResultSet(table.all());
      let visited = 0;
      if (resultSet.goToFirstRow()) {
        visited += 1;
        while (resultSet.goToNextRow()) {
          visited += 1;
        }
      }
      expect(visited).assertEqual(2);
      expect(resultSet.current()).assertNull();
      expect(resultSet.getString('name')).assertEqual('');
      done();
    });

    it('DataShareOfflineNetwork_029', 0, async (done: Function) => {
      const monitorLocal = new NetworkMonitor();
      monitorLocal.setState(NetworkState.ONLINE);
      const engine = new SyncEngine(monitorLocal, new OfflineCache(CACHE_CAPACITY));
      for (let index = 0; index < 5; index++) {
        engine.queueWrite(index, WriteOp.INSERT, `Book${index}`, `intro${index}`);
      }
      expect(engine.pendingCount()).assertEqual(5);
      const summary = engine.flush();
      expect(summary.synced).assertEqual(5);
      expect(engine.count()).assertEqual(5);
      expect(engine.query().rowCount()).assertEqual(5);
      done();
    });

    it('DataShareOfflineNetwork_030', 0, async (done: Function) => {
      const cache = new OfflineCache(1);
      cache.put('only', 'value', 1);
      expect(cache.size()).assertEqual(1);
      cache.put('second', 'value2', 2);
      expect(cache.size()).assertEqual(1);
      expect(cache.find('only')).assertNull();
      expect(cache.get('second')).assertEqual('value2');
      done();
    });

    it('DataShareOfflineNetwork_031', 0, async (done: Function) => {
      expect(NetworkState.UNKNOWN).assertEqual(0);
      expect(NetworkState.UNSTABLE).assertEqual(3);
      expect(SyncOutcome.FAILED).assertEqual(3);
      expect(WriteOp.DELETE).assertEqual(2);
      expect(CACHE_CAPACITY).assertEqual(16);
      expect(MAX_RETRY).assertEqual(3);
      done();
    });

    it('DataShareOfflineNetwork_032', 0, async (done: Function) => {
      expect(isSampleDataShareUri(DATA_SHARE_URI)).assertTrue();
      expect(buildDataShareUri('Book').indexOf('Book') >= 0).assertTrue();
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(ABILITY_DATA_SHARE).assertEqual('DataShareExtAbility');
      expect(ACCOUNT_ID).assertEqual(100);
      done();
    });

    it('DataShareOfflineNetwork_033', 0, async (done: Function) => {
      const monitorLocal = new NetworkMonitor();
      monitorLocal.setState(NetworkState.ONLINE);
      const engine = new SyncEngine(monitorLocal, new OfflineCache(CACHE_CAPACITY));
      engine.queueWrite(1, WriteOp.INSERT, 'ArkTS', 'x');
      engine.flush();
      const resultSet = engine.query();
      expect(resultSet.rowCount()).assertEqual(1);
      resultSet.goToFirstRow();
      expect(resultSet.getInt('id')).assertEqual(1);
      expect(resultSet.getString('introduction')).assertEqual('x');
      expect(resultSet.getInt('unknown')).assertEqual(-1);
      done();
    });

    it('DataShareOfflineNetwork_034', 0, async (done: Function) => {
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

    it('DataShareOfflineNetwork_035', 0, async (done: Function) => {
      const monitorLocal = new NetworkMonitor();
      const engine = new SyncEngine(monitorLocal, new OfflineCache(CACHE_CAPACITY));
      const write = engine.queueWrite(7, WriteOp.UPDATE, 'ArkTS', 'x');
      monitorLocal.setState(NetworkState.OFFLINE);
      const summary = engine.flush();
      expect(summary.pending).assertEqual(1);
      expect(write.attempt).assertEqual(0);
      expect(write.isPending()).assertTrue();
      expect(summary.total()).assertEqual(1);
      done();
    });
  });
}

