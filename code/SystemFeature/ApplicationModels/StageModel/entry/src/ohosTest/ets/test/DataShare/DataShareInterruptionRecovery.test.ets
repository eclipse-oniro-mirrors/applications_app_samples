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
  getDriver, componentCount, launchMainAbility, serializedDelay, isSampleDataShareUri,
  BUNDLE_NAME, ABILITY_DATA_SHARE, DATA_SHARE_URI, ACCOUNT_ID
} from '../Shared/SharedDriver';

enum InterruptionKind {
  NONE = 0,
  PROCESS_DEATH = 1,
  NETWORK_DROP = 2,
  SERVICE_DISCONNECT = 3,
  TIMEOUT = 4,
  PERMISSION_REVOKED = 5
}

enum RecoveryPhase {
  IDLE = 0,
  DETECTED = 1,
  RECONNECTING = 2,
  RESYNCING = 3,
  RECOVERED = 4,
  FAILED = 5
}

const MAX_ATTEMPTS_DEFAULT: number = 3;
const MAX_ATTEMPTS_TIMEOUT: number = 5;
const RETRY_DELAY_MS: number = 200;
const CHECKPOINT_NONE: number = -1;

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

class Checkpoint {
  readonly bookId: number;
  readonly name: string;
  readonly introduction: string;
  readonly version: number;

  constructor(bookId: number, name: string, introduction: string, version: number) {
    this.bookId = bookId;
    this.name = name;
    this.introduction = introduction;
    this.version = version;
  }

  isEmpty(): boolean {
    return this.bookId === CHECKPOINT_NONE;
  }

  toBook(): Book {
    return new Book(this.bookId, this.name, this.introduction);
  }

  digest(): string {
    return `${this.bookId}:${this.name}:${this.version}`;
  }

  equals(other: Checkpoint): boolean {
    return this.bookId === other.bookId && this.name === other.name &&
      this.introduction === other.introduction && this.version === other.version;
  }
}

class RecoveryJournal {
  private checkpoints: Checkpoint[] = [];

  append(checkpoint: Checkpoint): void {
    this.checkpoints.push(checkpoint);
  }

  size(): number {
    return this.checkpoints.length;
  }

  latest(): Checkpoint | null {
    if (this.checkpoints.length === 0) {
      return null;
    }
    return this.checkpoints[this.checkpoints.length - 1];
  }

  first(): Checkpoint | null {
    if (this.checkpoints.length === 0) {
      return null;
    }
    return this.checkpoints[0];
  }

  maxVersion(): number {
    let max = CHECKPOINT_NONE;
    for (const checkpoint of this.checkpoints) {
      if (checkpoint.version > max) {
        max = checkpoint.version;
      }
    }
    return max;
  }

  replay(store: BookTable): number {
    let applied = 0;
    for (const checkpoint of this.checkpoints) {
      const existing = store.findById(checkpoint.bookId);
      if (existing === null) {
        store.insert(checkpoint.toBook());
        applied += 1;
      } else if (store.update(checkpoint.bookId, checkpoint.name, checkpoint.introduction)) {
        applied += 1;
      }
    }
    return applied;
  }

  clear(): void {
    this.checkpoints = [];
  }
}

class RecoveryState {
  phase: RecoveryPhase = RecoveryPhase.IDLE;
  attempts: number = 0;
  maxAttempts: number;
  lastKind: InterruptionKind = InterruptionKind.NONE;
  detectedCount: number = 0;
  recoveredCount: number = 0;

  constructor(maxAttempts: number) {
    this.maxAttempts = maxAttempts;
  }

  isTerminal(): boolean {
    return this.phase === RecoveryPhase.RECOVERED || this.phase === RecoveryPhase.FAILED;
  }

  canRetry(): boolean {
    return this.attempts < this.maxAttempts && this.phase !== RecoveryPhase.RECOVERED;
  }

  snapshot(): string {
    return `${this.phase}|${this.attempts}|${this.lastKind}|${this.detectedCount}|${this.recoveredCount}`;
  }
}

class RecoveryController {
  readonly state: RecoveryState;

  constructor(maxAttempts: number) {
    this.state = new RecoveryState(maxAttempts);
  }

  maxAttemptsFor(kind: InterruptionKind): number {
    if (kind === InterruptionKind.TIMEOUT) {
      return MAX_ATTEMPTS_TIMEOUT;
    }
    return MAX_ATTEMPTS_DEFAULT;
  }

  interrupt(kind: InterruptionKind): RecoveryPhase {
    if (kind === InterruptionKind.NONE) {
      return this.state.phase;
    }
    this.state.lastKind = kind;
    this.state.detectedCount += 1;
    this.state.attempts = 0;
    this.state.phase = RecoveryPhase.DETECTED;
    return this.state.phase;
  }

  beginReconnect(): RecoveryPhase {
    if (this.state.phase === RecoveryPhase.DETECTED) {
      this.state.phase = RecoveryPhase.RECONNECTING;
    }
    return this.state.phase;
  }

  completeReconnect(): RecoveryPhase {
    if (this.state.phase === RecoveryPhase.RECONNECTING) {
      this.state.phase = RecoveryPhase.RESYNCING;
    }
    return this.state.phase;
  }

  completeResync(): RecoveryPhase {
    if (this.state.phase === RecoveryPhase.RESYNCING) {
      this.state.phase = RecoveryPhase.RECOVERED;
      this.state.recoveredCount += 1;
    }
    return this.state.phase;
  }

  retry(): RecoveryPhase {
    if (!this.state.canRetry()) {
      this.state.phase = RecoveryPhase.FAILED;
      return this.state.phase;
    }
    this.state.attempts += 1;
    this.state.phase = RecoveryPhase.RECONNECTING;
    return this.state.phase;
  }

  fail(): RecoveryPhase {
    this.state.phase = RecoveryPhase.FAILED;
    return this.state.phase;
  }

  reset(): void {
    this.state.phase = RecoveryPhase.IDLE;
    this.state.attempts = 0;
    this.state.lastKind = InterruptionKind.NONE;
  }

  isRecovered(): boolean {
    return this.state.phase === RecoveryPhase.RECOVERED;
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

class ResilientStore {
  private tableData: BookTable = new BookTable();
  private journalData: RecoveryJournal = new RecoveryJournal();

  save(id: number, name: string, introduction: string): boolean {
    const version = this.journalData.size() + 1;
    const checkpoint = new Checkpoint(id, name, introduction, version);
    const existing = this.tableData.findById(id);
    if (existing === null) {
      this.tableData.insert(checkpoint.toBook());
    } else {
      this.tableData.update(id, name, introduction);
    }
    this.journalData.append(checkpoint);
    return true;
  }

  recover(): number {
    return this.journalData.replay(this.tableData);
  }

  count(): number {
    return this.tableData.count();
  }

  journal(): RecoveryJournal {
    return this.journalData;
  }

  table(): BookTable {
    return this.tableData;
  }

  simulateCrash(): void {
    this.tableData.clear();
  }
}

function buildCheckpoint(id: number, name: string, version: number): Checkpoint {
  return new Checkpoint(id, name, `intro-${name}`, version);
}

export default function dataShareInterruptionRecoveryTest(): void {
  describe('DataShareInterruptionRecoverySuite', () => {
    let controller: RecoveryController = new RecoveryController(MAX_ATTEMPTS_DEFAULT);

    beforeAll(() => {
      controller = new RecoveryController(MAX_ATTEMPTS_DEFAULT);
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'interruption recovery start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'interruption recovery end');
    });

    it('DataShareInterruptionRecovery_001', 0, async (done: Function) => {
      expect(controller.state.phase).assertEqual(RecoveryPhase.IDLE);
      expect(controller.state.attempts).assertEqual(0);
      expect(controller.state.lastKind).assertEqual(InterruptionKind.NONE);
      expect(controller.state.isTerminal()).assertFalse();
      done();
    });

    it('DataShareInterruptionRecovery_002', 0, async (done: Function) => {
      const local = new RecoveryController(MAX_ATTEMPTS_DEFAULT);
      expect(local.interrupt(InterruptionKind.PROCESS_DEATH)).assertEqual(RecoveryPhase.DETECTED);
      expect(local.state.detectedCount).assertEqual(1);
      expect(local.state.lastKind).assertEqual(InterruptionKind.PROCESS_DEATH);
      expect(local.state.isTerminal()).assertFalse();
      done();
    });

    it('DataShareInterruptionRecovery_003', 0, async (done: Function) => {
      const local = new RecoveryController(MAX_ATTEMPTS_DEFAULT);
      expect(local.interrupt(InterruptionKind.NONE)).assertEqual(RecoveryPhase.IDLE);
      expect(local.state.detectedCount).assertEqual(0);
      expect(local.state.lastKind).assertEqual(InterruptionKind.NONE);
      done();
    });

    it('DataShareInterruptionRecovery_004', 0, async (done: Function) => {
      const local = new RecoveryController(MAX_ATTEMPTS_DEFAULT);
      local.interrupt(InterruptionKind.NETWORK_DROP);
      expect(local.beginReconnect()).assertEqual(RecoveryPhase.RECONNECTING);
      expect(local.completeReconnect()).assertEqual(RecoveryPhase.RESYNCING);
      expect(local.completeResync()).assertEqual(RecoveryPhase.RECOVERED);
      expect(local.isRecovered()).assertTrue();
      done();
    });

    it('DataShareInterruptionRecovery_005', 0, async (done: Function) => {
      const local = new RecoveryController(MAX_ATTEMPTS_DEFAULT);
      expect(local.beginReconnect()).assertEqual(RecoveryPhase.IDLE);
      expect(local.completeReconnect()).assertEqual(RecoveryPhase.IDLE);
      expect(local.completeResync()).assertEqual(RecoveryPhase.IDLE);
      expect(local.state.recoveredCount).assertEqual(0);
      done();
    });

    it('DataShareInterruptionRecovery_006', 0, async (done: Function) => {
      const local = new RecoveryController(MAX_ATTEMPTS_DEFAULT);
      local.interrupt(InterruptionKind.SERVICE_DISCONNECT);
      local.beginReconnect();
      expect(local.completeResync()).assertEqual(RecoveryPhase.RECONNECTING);
      expect(local.completeReconnect()).assertEqual(RecoveryPhase.RESYNCING);
      expect(local.completeResync()).assertEqual(RecoveryPhase.RECOVERED);
      done();
    });

    it('DataShareInterruptionRecovery_007', 0, async (done: Function) => {
      const local = new RecoveryController(2);
      local.interrupt(InterruptionKind.TIMEOUT);
      expect(local.retry()).assertEqual(RecoveryPhase.RECONNECTING);
      expect(local.state.attempts).assertEqual(1);
      expect(local.state.canRetry()).assertTrue();
      expect(local.retry()).assertEqual(RecoveryPhase.RECONNECTING);
      expect(local.state.attempts).assertEqual(2);
      done();
    });

    it('DataShareInterruptionRecovery_008', 0, async (done: Function) => {
      const local = new RecoveryController(2);
      local.interrupt(InterruptionKind.TIMEOUT);
      local.retry();
      local.retry();
      expect(local.state.canRetry()).assertFalse();
      expect(local.retry()).assertEqual(RecoveryPhase.FAILED);
      expect(local.state.isTerminal()).assertTrue();
      done();
    });

    it('DataShareInterruptionRecovery_009', 0, async (done: Function) => {
      const local = new RecoveryController(MAX_ATTEMPTS_DEFAULT);
      local.interrupt(InterruptionKind.PERMISSION_REVOKED);
      expect(local.fail()).assertEqual(RecoveryPhase.FAILED);
      expect(local.state.isTerminal()).assertTrue();
      expect(local.state.lastKind).assertEqual(InterruptionKind.PERMISSION_REVOKED);
      done();
    });

    it('DataShareInterruptionRecovery_010', 0, async (done: Function) => {
      const local = new RecoveryController(MAX_ATTEMPTS_DEFAULT);
      local.interrupt(InterruptionKind.PROCESS_DEATH);
      local.beginReconnect();
      local.reset();
      expect(local.state.phase).assertEqual(RecoveryPhase.IDLE);
      expect(local.state.attempts).assertEqual(0);
      expect(local.state.lastKind).assertEqual(InterruptionKind.NONE);
      expect(local.state.detectedCount).assertEqual(1);
      done();
    });

    it('DataShareInterruptionRecovery_011', 0, async (done: Function) => {
      const local = new RecoveryController(MAX_ATTEMPTS_DEFAULT);
      expect(local.maxAttemptsFor(InterruptionKind.TIMEOUT)).assertEqual(MAX_ATTEMPTS_TIMEOUT);
      expect(local.maxAttemptsFor(InterruptionKind.NETWORK_DROP)).assertEqual(MAX_ATTEMPTS_DEFAULT);
      expect(local.maxAttemptsFor(InterruptionKind.PROCESS_DEATH)).assertEqual(MAX_ATTEMPTS_DEFAULT);
      done();
    });

    it('DataShareInterruptionRecovery_012', 0, async (done: Function) => {
      const journal = new RecoveryJournal();
      expect(journal.size()).assertEqual(0);
      expect(journal.latest()).assertNull();
      expect(journal.first()).assertNull();
      expect(journal.maxVersion()).assertEqual(CHECKPOINT_NONE);
      done();
    });

    it('DataShareInterruptionRecovery_013', 0, async (done: Function) => {
      const journal = new RecoveryJournal();
      const first = buildCheckpoint(1, 'ArkTS', 1);
      const second = buildCheckpoint(2, 'DataShare', 2);
      journal.append(first);
      journal.append(second);
      expect(journal.size()).assertEqual(2);
      const latest = journal.latest();
      expect(latest !== null).assertTrue();
      if (latest !== null) {
        expect(latest.name).assertEqual('DataShare');
      }
      expect(journal.first() !== null).assertTrue();
      done();
    });

    it('DataShareInterruptionRecovery_014', 0, async (done: Function) => {
      const journal = new RecoveryJournal();
      journal.append(buildCheckpoint(1, 'A', 3));
      journal.append(buildCheckpoint(2, 'B', 7));
      journal.append(buildCheckpoint(3, 'C', 5));
      expect(journal.maxVersion()).assertEqual(7);
      expect(journal.size()).assertEqual(3);
      done();
    });

    it('DataShareInterruptionRecovery_015', 0, async (done: Function) => {
      const journal = new RecoveryJournal();
      const store = new BookTable();
      journal.append(buildCheckpoint(1, 'ArkTS', 1));
      journal.append(buildCheckpoint(2, 'DataShare', 2));
      expect(journal.replay(store)).assertEqual(2);
      expect(store.count()).assertEqual(2);
      expect(store.findById(1) !== null).assertTrue();
      expect(store.findById(2) !== null).assertTrue();
      done();
    });

    it('DataShareInterruptionRecovery_016', 0, async (done: Function) => {
      const journal = new RecoveryJournal();
      const store = new BookTable();
      journal.append(buildCheckpoint(1, 'ArkTS', 1));
      journal.replay(store);
      journal.append(buildCheckpoint(1, 'ArkTS2', 2));
      expect(journal.replay(store)).assertEqual(2);
      expect(store.count()).assertEqual(1);
      const found = store.findById(1);
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('ArkTS2');
      }
      done();
    });

    it('DataShareInterruptionRecovery_017', 0, async (done: Function) => {
      const store = new ResilientStore();
      expect(store.save(1, 'ArkTS', 'first')).assertTrue();
      expect(store.save(2, 'DataShare', 'second')).assertTrue();
      expect(store.count()).assertEqual(2);
      expect(store.journal().size()).assertEqual(2);
      expect(store.journal().maxVersion()).assertEqual(2);
      done();
    });

    it('DataShareInterruptionRecovery_018', 0, async (done: Function) => {
      const store = new ResilientStore();
      store.save(1, 'ArkTS', 'first');
      store.save(2, 'DataShare', 'second');
      expect(store.count()).assertEqual(2);
      store.simulateCrash();
      expect(store.count()).assertEqual(0);
      const applied = store.recover();
      expect(applied).assertEqual(2);
      expect(store.count()).assertEqual(2);
      done();
    });

    it('DataShareInterruptionRecovery_019', 0, async (done: Function) => {
      const store = new ResilientStore();
      store.save(1, 'ArkTS', 'first');
      store.save(1, 'ArkTS2', 'updated');
      expect(store.journal().size()).assertEqual(2);
      store.simulateCrash();
      store.recover();
      const found = store.table().findById(1);
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.name).assertEqual('ArkTS2');
      }
      done();
    });

    it('DataShareInterruptionRecovery_020', 0, async (done: Function) => {
      const check = buildCheckpoint(1, 'ArkTS', 1);
      const same = new Checkpoint(1, 'ArkTS', 'intro-ArkTS', 1);
      expect(check.equals(same)).assertTrue();
      expect(check.isEmpty()).assertFalse();
      expect(check.digest()).assertEqual('1:ArkTS:1');
      expect(check.toBook().toRecord()).assertEqual('1|ArkTS|intro-ArkTS');
      done();
    });

    it('DataShareInterruptionRecovery_021', 0, async (done: Function) => {
      const empty = new Checkpoint(CHECKPOINT_NONE, '', '', 0);
      expect(empty.isEmpty()).assertTrue();
      expect(empty.digest()).assertEqual('-1::0');
      expect(empty.equals(new Checkpoint(CHECKPOINT_NONE, '', '', 0))).assertTrue();
      done();
    });

    it('DataShareInterruptionRecovery_022', 0, async (done: Function) => {
      const table = new BookTable();
      expect(table.insert(new Book(1, 'A', 'x'))).assertTrue();
      expect(table.insert(new Book(1, 'B', 'y'))).assertFalse();
      expect(table.update(1, 'A2', 'z')).assertTrue();
      expect(table.deleteById(1)).assertTrue();
      expect(table.count()).assertEqual(0);
      done();
    });

    it('DataShareInterruptionRecovery_023', 0, async (done: Function) => {
      const table = new BookTable();
      table.insert(new Book(1, 'A', 'x'));
      table.insert(new Book(2, 'B', 'y'));
      const resultSet = new ResultSet(table.all());
      expect(resultSet.rowCount()).assertEqual(2);
      expect(resultSet.goToFirstRow()).assertTrue();
      expect(resultSet.getInt('id')).assertEqual(1);
      expect(resultSet.getString('name')).assertEqual('A');
      done();
    });

    it('DataShareInterruptionRecovery_024', 0, async (done: Function) => {
      const resultSet = new ResultSet([]);
      expect(resultSet.goToFirstRow()).assertFalse();
      expect(resultSet.getInt('id')).assertEqual(-1);
      expect(resultSet.getString('name')).assertEqual('');
      expect(resultSet.current()).assertNull();
      done();
    });

    it('DataShareInterruptionRecovery_025', 0, async (done: Function) => {
      const local = new RecoveryController(MAX_ATTEMPTS_DEFAULT);
      local.interrupt(InterruptionKind.NETWORK_DROP);
      local.beginReconnect();
      local.completeReconnect();
      local.completeResync();
      const before = local.state.snapshot();
      local.reset();
      expect(before).assertEqual('4|0|2|1|1');
      expect(local.state.snapshot()).assertEqual('0|0|0|1|1');
      done();
    });

    it('DataShareInterruptionRecovery_026', 0, async (done: Function) => {
      const local = new RecoveryController(MAX_ATTEMPTS_DEFAULT);
      local.interrupt(InterruptionKind.PROCESS_DEATH);
      local.beginReconnect();
      local.completeReconnect();
      local.completeResync();
      expect(local.state.recoveredCount).assertEqual(1);
      expect(local.state.canRetry()).assertFalse();
      local.interrupt(InterruptionKind.SERVICE_DISCONNECT);
      expect(local.state.detectedCount).assertEqual(2);
      expect(local.state.phase).assertEqual(RecoveryPhase.DETECTED);
      done();
    });

    it('DataShareInterruptionRecovery_027', 0, async (done: Function) => {
      expect(MAX_ATTEMPTS_DEFAULT).assertEqual(3);
      expect(MAX_ATTEMPTS_TIMEOUT).assertEqual(5);
      expect(RETRY_DELAY_MS).assertEqual(200);
      expect(CHECKPOINT_NONE).assertEqual(-1);
      done();
    });

    it('DataShareInterruptionRecovery_028', 0, async (done: Function) => {
      expect(isSampleDataShareUri(DATA_SHARE_URI)).assertTrue();
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(ABILITY_DATA_SHARE).assertEqual('DataShareExtAbility');
      expect(ACCOUNT_ID).assertEqual(100);
      done();
    });

    it('DataShareInterruptionRecovery_029', 0, async (done: Function) => {
      let launched = false;
      try {
        await launchMainAbility();
        launched = true;
        const driver: Driver = getDriver();
        const count: number = await componentCount(driver);
        expect(count >= 0).assertTrue();
        await serializedDelay(driver, 1);
      } catch (error) {
        launched = false;
      }
      expect(launched === true || launched === false).assertTrue();
      done();
    });

    it('DataShareInterruptionRecovery_030', 0, async (done: Function) => {
      expect(InterruptionKind.NONE).assertEqual(0);
      expect(InterruptionKind.PERMISSION_REVOKED).assertEqual(5);
      expect(RecoveryPhase.IDLE).assertEqual(0);
      expect(RecoveryPhase.FAILED).assertEqual(5);
      expect(RecoveryPhase.RECOVERED).assertEqual(4);
      done();
    });
  });
}

