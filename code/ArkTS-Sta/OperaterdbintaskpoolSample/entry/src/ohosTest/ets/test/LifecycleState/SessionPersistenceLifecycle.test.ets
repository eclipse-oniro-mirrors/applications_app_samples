'use static';
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

/**
 * SessionPersistenceLifecycle checks what survives a page session:
 *
 *   OperateRDBInTaskPool.ets:80      the page reloads its state from the manager
 *   OperateRDBInTaskPool.ets:130-135 the verification query reads the store back
 *   ContactManager.ets:41-48        getContacts returns a copy, setContacts stores a copy
 *   DatabaseConnection.ets:277-309  the result-set walk materializes fresh Contact rows
 *   Contact.ets:31-47               the six persisted columns
 *
 * PersistenceBook keeps the store, the manager and a list of labelled snapshot
 * captures so a later state can be compared with an earlier one.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  StoreDouble,
  ContactSnapshot,
  snapshotsOf,
  sameSnapshotArray,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  sameStringArray,
  joined,
  countOf,
  resetContactManager,
  TaskPoolQueue,
  SearchEngine,
  textFingerprint
} from '../Shared/SharedDriver';

/** Holds a store, a manager, and labelled captures of the visible rows. */
class PersistenceBook {
  public store: StoreDouble;
  public manager: ContactManager;
  public archive: ContactSnapshot[][] = [];
  public labels: string[] = [];

  constructor(manager: ContactManager, store: StoreDouble) {
    this.manager = manager;
    this.store = store;
  }

  /** Captures the current store rows and remembers them under a label. */
  public capture(label: string): ContactSnapshot[] {
    const snapshots: ContactSnapshot[] = snapshotsOf(this.store.query(true));
    this.archive.push(snapshots);
    this.labels.push(label);
    return snapshots;
  }

  public lastCapture(): ContactSnapshot[] {
    return this.archive.length === 0 ? new Array<ContactSnapshot>() : this.archive[this.archive.length - 1];
  }

  public firstCapture(): ContactSnapshot[] {
    return this.archive[0];
  }

  public archiveSize(): number {
    return this.archive.length;
  }

  public labelTrace(): string {
    return joined(this.labels, '>');
  }

  public clearArchive(): void {
    this.archive = [];
    this.labels = [];
  }

  /** Rebuilds the manager cache from the persisted store rows. */
  public reload(): Contact[] {
    const rows: Contact[] = this.store.query(true);
    this.manager.setContacts(rows);
    return this.manager.getContacts();
  }

  public storeSnapshot(): ContactSnapshot[] {
    return snapshotsOf(this.store.rows);
  }

  public managerSnapshot(): ContactSnapshot[] {
    return snapshotsOf(this.manager.getContacts());
  }

  public parity(): boolean {
    return sameSnapshotArray(this.storeSnapshot(), this.managerSnapshot());
  }

  public metricsFingerprint(snapshotRows: ContactSnapshot[]): number {
    let text = '';
    for (let index = 0; index < snapshotRows.length; index++) {
      text = text + snapshotRows[index].describe() + ';';
    }
    return textFingerprint(text);
  }

  public storeNames(): string[] {
    return contactNames(this.store.query(true));
  }
}

/** Seeds a store and a manager with the same payload. */
function seededBook(rows: Contact[]): PersistenceBook {
  const store = new StoreDouble();
  store.batchInsert(true, rows);
  const manager: ContactManager = resetContactManager(rows);
  return new PersistenceBook(manager, store);
}

export default function sessionPersistenceLifecycleTest(): void {
  describe('SessionPersistenceLifecycle', () => {
    let manager: ContactManager = resetContactManager();
    let store: StoreDouble = new StoreDouble();
    let book: PersistenceBook = new PersistenceBook(manager, store);

    beforeAll(() => {
      logSuite('SessionPersistenceLifecycle', 'begin');
    });

    beforeEach(async () => {
      manager = resetContactManager();
      store = new StoreDouble();
      book = new PersistenceBook(manager, store);
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('SessionPersistenceLifecycle', 'end');
    });

    /**
     * @tc.name   snapshotCapturesAllFields
     * @tc.desc   A snapshot records name, phone, email, address and category for one contact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotCapturesAllFields', 0, () => {
      const source: Contact = createSeedContacts()[5];
      const snapshot: ContactSnapshot = new ContactSnapshot(source);
      logStep('snapshot-fields', snapshot.describe());
      expect(snapshot.name).assertEqual('卡梅隆');
      expect(snapshot.phone).assertEqual('17777777777');
      expect(snapshot.email).assertEqual('cameron@example.com');
      expect(snapshot.address).assertEqual('陕西省西安市雁塔区');
      expect(snapshot.category).assertEqual('C');
    });

    /**
     * @tc.name   snapshotDescribeUsesSlashSeparators
     * @tc.desc   The snapshot description joins the five persisted fields with slashes in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotDescribeUsesSlashSeparators', 0, () => {
      const source: Contact = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', 'avatar-a', 'A');
      const snapshot: ContactSnapshot = new ContactSnapshot(source);
      const parts: string[] = snapshot.describe().split('/');
      logStep('snapshot-describe', snapshot.describe());
      expect(parts.length).assertEqual(5);
      expect(parts[0]).assertEqual('林岸');
      expect(parts[1]).assertEqual('13800138000');
      expect(parts[2]).assertEqual('lin@example.com');
      expect(parts[3]).assertEqual('上海市徐汇区');
      expect(parts[4]).assertEqual('A');
    });

    /**
     * @tc.name   snapshotsOfPreservesRowOrder
     * @tc.desc   Materializing a snapshot array keeps the exact order of the source rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotsOfPreservesRowOrder', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const snapshots: ContactSnapshot[] = snapshotsOf(store.query(true));
      logStep('snapshot-order', snapshots[0].name + '..' + snapshots[14].name);
      expect(snapshots.length).assertEqual(15);
      expect(snapshots[0].name).assertEqual('艾德里安');
      expect(snapshots[6].name).assertEqual('康纳');
      expect(snapshots[14].name).assertEqual('法里');
      expect(snapshots[3].phone).assertEqual('12222222222');
      expect(snapshots[10].category).assertEqual('E');
    });

    /**
     * @tc.name   snapshotArrayEqualityForClonedRows
     * @tc.desc   Two snapshot arrays built from identical rows compare equal element by element.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotArrayEqualityForClonedRows', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 6);
      const left: ContactSnapshot[] = snapshotsOf(rows);
      const right: ContactSnapshot[] = snapshotsOf(rows);
      logStep('snapshot-equal', String(sameSnapshotArray(left, right)));
      expect(sameSnapshotArray(left, right)).assertTrue();
      expect(left.length).assertEqual(6);
      expect(left[2].sameAs(right[2])).assertTrue();
      expect(left[5].describe()).assertEqual(right[5].describe());
      expect(left[0] === right[0]).assertFalse();
    });

    /**
     * @tc.name   snapshotEqualityFailsOnAddressChange
     * @tc.desc   Changing only the address is enough to make two snapshots unequal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotEqualityFailsOnAddressChange', 0, () => {
      const source: Contact = createSeedContacts()[1];
      const before: ContactSnapshot = new ContactSnapshot(source);
      const moved: Contact = cloneContact(source);
      moved.address = '广东省深圳市南山区';
      const after: ContactSnapshot = new ContactSnapshot(moved);
      logStep('snapshot-address', after.address);
      expect(before.sameAs(after)).assertFalse();
      expect(before.name).assertEqual(after.name);
      expect(before.phone).assertEqual(after.phone);
      expect(before.address === after.address).assertFalse();
      expect(sameSnapshotArray([before], [after])).assertFalse();
    });

    /**
     * @tc.name   snapshotEqualityFailsOnLengthMismatch
     * @tc.desc   Arrays of different lengths never compare equal even when the prefix matches.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotEqualityFailsOnLengthMismatch', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 4);
      const full: ContactSnapshot[] = snapshotsOf(rows);
      const shortRows: ContactSnapshot[] = snapshotsOf(rows.slice(0, 3));
      logStep('snapshot-length', String(full.length) + '/' + String(shortRows.length));
      expect(full.length).assertEqual(4);
      expect(shortRows.length).assertEqual(3);
      expect(sameSnapshotArray(full, shortRows)).assertFalse();
      expect(sameSnapshotArray(shortRows, shortRows)).assertTrue();
      expect(full[0].sameAs(shortRows[0])).assertTrue();
    });

    /**
     * @tc.name   managerSnapshotMatchesStoreAfterReload
     * @tc.desc   Reloading from the store makes the manager snapshot identical to the store snapshot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('managerSnapshotMatchesStoreAfterReload', 0, () => {
      book = seededBook(createSeedContacts());
      store = book.store;
      manager = book.manager;
      resetContactManager();
      const reloaded: Contact[] = book.reload();
      logStep('reload-parity', String(reloaded.length));
      expect(reloaded.length).assertEqual(15);
      expect(book.parity()).assertTrue();
      expect(sameSnapshotArray(book.storeSnapshot(), book.managerSnapshot())).assertTrue();
      expect(book.storeSnapshot().length).assertEqual(15);
      expect(book.managerSnapshot()[8].name).assertEqual('丹尼尔');
    });

    /**
     * @tc.name   managerResetEmptiesCacheOnly
     * @tc.desc   resetContactManager clears the singleton cache but leaves the relational rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('managerResetEmptiesCacheOnly', 0, () => {
      book = seededBook(createSeedContacts());
      store = book.store;
      manager = book.manager;
      resetContactManager();
      logStep('reset-manager-only', 'cache=' + String(manager.getContacts().length));
      expect(manager.getContacts().length).assertEqual(0);
      expect(store.rowCount()).assertEqual(15);
      expect(book.storeSnapshot().length).assertEqual(15);
      expect(store.query(true).length).assertEqual(15);
      expect(book.parity()).assertFalse();
    });

    /**
     * @tc.name   reloadFromStoreRestoresManagerCount
     * @tc.desc   One reload after a reset brings the cached count back to fifteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reloadFromStoreRestoresManagerCount', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 7));
      store = book.store;
      manager = book.manager;
      resetContactManager();
      const cachedBefore: number = manager.getContacts().length;
      book.reload();
      logStep('reload-count', String(cachedBefore) + '->' + String(manager.getContacts().length));
      expect(cachedBefore).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(7);
      expect(store.rowCount()).assertEqual(7);
      expect(manager.getContacts()[0].name).assertEqual('艾德里安');
      expect(manager.getContacts()[6].name).assertEqual('康纳');
    });

    /**
     * @tc.name   reloadTwiceIsIdempotent
     * @tc.desc   A second reload produces the same cache and does not duplicate any row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reloadTwiceIsIdempotent', 0, () => {
      book = seededBook(createSeedContacts());
      store = book.store;
      manager = book.manager;
      const first: Contact[] = book.reload();
      const second: Contact[] = book.reload();
      logStep('reload-idempotent', String(first.length) + '/' + String(second.length));
      expect(first.length).assertEqual(15);
      expect(second.length).assertEqual(15);
      expect(sameStringArray(contactNames(first), contactNames(second))).assertTrue();
      expect(sameSnapshotArray(snapshotsOf(first), snapshotsOf(second))).assertTrue();
      expect(book.store.rowCount()).assertEqual(15);
      expect(countOf(contactNames(second), '艾德里安')).assertEqual(1);
    });

    /**
     * @tc.name   snapshotsPersistAcrossManagerReset
     * @tc.desc   A capture taken before a manager reset still matches the store after reload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotsPersistAcrossManagerReset', 0, () => {
      book = seededBook(createSeedContacts());
      store = book.store;
      manager = book.manager;
      const captured: ContactSnapshot[] = book.capture('before-reset');
      resetContactManager();
      book.reload();
      const after: ContactSnapshot[] = book.capture('after-reload');
      logStep('persist-reset', book.labelTrace());
      expect(captured.length).assertEqual(15);
      expect(sameSnapshotArray(captured, after)).assertTrue();
      expect(captured[4].sameAs(after[4])).assertTrue();
      expect(book.archiveSize()).assertEqual(2);
      expect(book.labelTrace()).assertEqual('before-reset>after-reload');
    });

    /**
     * @tc.name   snapshotsPersistAcrossOperations
     * @tc.desc   A snapshot of the untouched rows remains valid while later rows are added.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotsPersistAcrossOperations', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 5));
      store = book.store;
      manager = book.manager;
      const baseline: ContactSnapshot[] = book.capture('baseline');
      store.insert(true, contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'A'), 'ON_CONFLICT_REPLACE');
      store.insert(true, contactOf('苏木', '13922223333', 'sumu@example.com', '苏州', '', 'D'), 'ON_CONFLICT_REPLACE');
      const grown: ContactSnapshot[] = book.capture('grown');
      logStep('persist-ops', String(baseline.length) + '/' + String(grown.length));
      expect(baseline.length).assertEqual(5);
      expect(grown.length).assertEqual(7);
      expect(sameSnapshotArray(baseline, grown.slice(0, 5))).assertTrue();
      expect(grown[5].name).assertEqual('林岸');
      expect(book.archiveSize()).assertEqual(2);
    });

    /**
     * @tc.name   archiveStoresIndependentCaptures
     * @tc.desc   The archive keeps every capture as its own array, unaffected by later captures.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('archiveStoresIndependentCaptures', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 3));
      store = book.store;
      manager = book.manager;
      const first: ContactSnapshot[] = book.capture('three');
      store.deleteByName('贝拉');
      const second: ContactSnapshot[] = book.capture('two');
      logStep('archive', String(book.archiveSize()));
      expect(book.archiveSize()).assertEqual(2);
      expect(first.length).assertEqual(3);
      expect(second.length).assertEqual(2);
      expect(book.firstCapture().length).assertEqual(3);
      expect(book.lastCapture().length).assertEqual(2);
      expect(book.firstCapture()[2].name).assertEqual('贝拉');
    });

    /**
     * @tc.name   labelTraceListsCaptureOrder
     * @tc.desc   Capture labels are appended in call order and joined with the trace separator.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('labelTraceListsCaptureOrder', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 2));
      store = book.store;
      manager = book.manager;
      book.capture('open');
      book.capture('edited');
      book.capture('closed');
      logStep('label-trace', book.labelTrace());
      expect(book.labelTrace()).assertEqual('open>edited>closed');
      expect(book.archiveSize()).assertEqual(3);
      expect(book.labels[0]).assertEqual('open');
      expect(book.labels[2]).assertEqual('closed');
      expect(book.lastCapture().length).assertEqual(2);
    });

    /**
     * @tc.name   reloadAfterAddKeepsRow
     * @tc.desc   A row inserted after the last reload appears in the cache on the next reload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('reloadAfterAddKeepsRow', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 4));
      store = book.store;
      manager = book.manager;
      book.reload();
      const added: Contact = contactOf('闻笛', '13911112222', 'wendi@example.com', '浙江省杭州市西湖区', '', 'C');
      store.insert(true, added, 'ON_CONFLICT_REPLACE');
      const cached: Contact[] = book.reload();
      logStep('reload-add', cached[cached.length - 1].name);
      expect(cached.length).assertEqual(5);
      expect(cached[4].name).assertEqual('闻笛');
      expect(cached[4].category).assertEqual('C');
      expect(sameContact(cached[4], added)).assertTrue();
      expect(book.parity()).assertTrue();
    });

    /**
     * @tc.name   reloadAfterDeleteOmitsRow
     * @tc.desc   A deleted store row disappears from the cache after the reload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('reloadAfterDeleteOmitsRow', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 5));
      store = book.store;
      manager = book.manager;
      book.reload();
      const removed: number = store.deleteByName('本');
      const cached: Contact[] = book.reload();
      logStep('reload-delete', 'removed=' + String(removed));
      expect(removed).assertEqual(1);
      expect(cached.length).assertEqual(4);
      expect(countOf(contactNames(cached), '本')).assertEqual(0);
      expect(cached[2].name).assertEqual('贝拉');
      expect(book.store.rowCount()).assertEqual(4);
    });

    /**
     * @tc.name   reloadAfterUpdateSeesNewPhone
     * @tc.desc   The reload reads the updated phone, email and address from the store rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reloadAfterUpdateSeesNewPhone', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 3));
      store = book.store;
      manager = book.manager;
      book.reload();
      const edited: Contact = contactOf('阿诺德', '16600006666', 'arnold.new@example.com', '上海市黄浦区', '', 'A');
      store.updateContact(edited);
      const cached: Contact[] = book.reload();
      logStep('reload-update', cached[1].phone);
      expect(cached[1].phone).assertEqual('16600006666');
      expect(cached[1].email).assertEqual('arnold.new@example.com');
      expect(cached[1].address).assertEqual('上海市黄浦区');
      expect(cached[1].name).assertEqual('阿诺德');
      expect(book.parity()).assertTrue();
    });

    /**
     * @tc.name   queryCopyMutationDoesNotPersist
     * @tc.desc   Editing a row returned by query is not persisted, so the next reload sees old values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryCopyMutationDoesNotPersist', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 3));
      store = book.store;
      manager = book.manager;
      book.reload();
      const copy: Contact[] = store.query(true);
      copy[0].phone = '10000000099';
      copy[0].name = '被改坏';
      const cached: Contact[] = book.reload();
      logStep('copy-mutation', cached[0].name);
      expect(cached[0].phone).assertEqual('13333333333');
      expect(cached[0].name).assertEqual('艾德里安');
      expect(store.rows[0].name).assertEqual('艾德里安');
      expect(countOf(book.storeNames(), '被改坏')).assertEqual(0);
      expect(book.parity()).assertTrue();
    });

    /**
     * @tc.name   clearSemanticsStoreResetDropsRows
     * @tc.desc   Resetting the store clears the persisted rows while the archive keeps its copies.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clearSemanticsStoreResetDropsRows', 0, () => {
      book = seededBook(createSeedContacts());
      store = book.store;
      manager = book.manager;
      const captured: ContactSnapshot[] = book.capture('full');
      store.reset();
      logStep('store-reset', 'rows=' + String(store.rowCount()));
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.names().length).assertEqual(0);
      expect(captured.length).assertEqual(15);
      expect(book.storeSnapshot().length).assertEqual(0);
    });

    /**
     * @tc.name   clearSemanticsManagerResetKeepsStore
     * @tc.desc   Clearing the manager cache is not a persistence clear; the store keeps every row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clearSemanticsManagerResetKeepsStore', 0, () => {
      book = seededBook(createSeedContacts());
      store = book.store;
      manager = book.manager;
      const storeRows: number = store.rowCount();
      resetContactManager();
      logStep('manager-clear', 'store=' + String(store.rowCount()));
      expect(manager.getContacts().length).assertEqual(0);
      expect(store.rowCount()).assertEqual(storeRows);
      expect(storeRows).assertEqual(15);
      expect(store.query(true).length).assertEqual(15);
      expect(book.storeSnapshot()[0].name).assertEqual('艾德里安');
    });

    /**
     * @tc.name   clearAfterReloadStartsEmpty
     * @tc.desc   Clearing both sides after a reload yields an empty cache and an empty store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clearAfterReloadStartsEmpty', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 6));
      store = book.store;
      manager = book.manager;
      book.reload();
      store.reset();
      resetContactManager();
      const cached: Contact[] = book.reload();
      logStep('clear-all', String(cached.length));
      expect(cached.length).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(book.storeSnapshot().length).assertEqual(0);
      expect(book.parity()).assertTrue();
    });

    /**
     * @tc.name   persistenceAfterTwoBatches
     * @tc.desc   Two batch writes accumulate in the store and survive a manager reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('persistenceAfterTwoBatches', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 8));
      store.batchInsert(true, createSeedContacts().slice(8, 15));
      book = new PersistenceBook(resetContactManager(), store);
      book.reload();
      logStep('two-batches', 'rows=' + String(store.rowCount()));
      expect(store.rowCount()).assertEqual(15);
      expect(store.batchCalls).assertEqual(2);
      expect(store.initCalls).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(15);
      expect(book.parity()).assertTrue();
    });

    /**
     * @tc.name   snapshotOfFifteenRowsHasFifteenEntries
     * @tc.desc   The seeded payload materializes into exactly fifteen snapshots with unique described rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotOfFifteenRowsHasFifteenEntries', 0, () => {
      book = seededBook(createSeedContacts());
      store = book.store;
      manager = book.manager;
      const snapshots: ContactSnapshot[] = book.storeSnapshot();
      const descriptions: string[] = [];
      for (let index = 0; index < snapshots.length; index++) {
        descriptions.push(snapshots[index].describe());
      }
      const repeatFirst: number = countOf(descriptions, descriptions[0]);
      logStep('snapshot-entries', String(snapshots.length));
      expect(snapshots.length).assertEqual(15);
      expect(descriptions.length).assertEqual(15);
      expect(repeatFirst).assertEqual(1);
      expect(snapshots[14].name).assertEqual('法里');
      expect(snapshots[0].sameAs(snapshots[14])).assertFalse();
    });

    /**
     * @tc.name   snapshotCategoryDistributionPreserved
     * @tc.desc   The snapshot rows keep the two two three three three two category distribution.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotCategoryDistributionPreserved', 0, () => {
      book = seededBook(createSeedContacts());
      store = book.store;
      manager = book.manager;
      const snapshots: ContactSnapshot[] = book.storeSnapshot();
      const categories: string[] = [];
      for (let index = 0; index < snapshots.length; index++) {
        categories.push(snapshots[index].category);
      }
      logStep('category-dist', joined(categories, ','));
      expect(countOf(categories, 'A')).assertEqual(2);
      expect(countOf(categories, 'B')).assertEqual(3);
      expect(countOf(categories, 'C')).assertEqual(3);
      expect(countOf(categories, 'D')).assertEqual(2);
      expect(countOf(categories, 'E')).assertEqual(3);
      expect(countOf(categories, 'F')).assertEqual(2);
    });

    /**
     * @tc.name   snapshotReorderFailsEquality
     * @tc.desc   The snapshot comparison is order sensitive, so a reversed list is not equal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotReorderFailsEquality', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 4);
      const forward: ContactSnapshot[] = snapshotsOf(rows);
      const reversed: ContactSnapshot[] = snapshotsOf(rows.slice().reverse());
      logStep('snapshot-reorder', reversed[0].name);
      expect(forward.length).assertEqual(4);
      expect(reversed.length).assertEqual(4);
      expect(sameSnapshotArray(forward, reversed)).assertFalse();
      expect(forward[0].name).assertEqual(reversed[3].name);
      expect(forward[0].sameAs(reversed[0])).assertFalse();
    });

    /**
     * @tc.name   reloadFromBadContextKeepsManager
     * @tc.desc   A query with an invalid context returns nothing, so a guarded reload keeps the cache.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reloadFromBadContextKeepsManager', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 5));
      store = book.store;
      manager = book.manager;
      book.reload();
      const cachedBefore: number = manager.getContacts().length;
      const rejected: Contact[] = store.query(false);
      if (rejected.length === 0) {
        logStep('bad-context', 'keep cache');
      }
      const cachedAfter: number = manager.getContacts().length;
      logStep('bad-context-count', String(cachedBefore) + '/' + String(cachedAfter));
      expect(rejected.length).assertEqual(0);
      expect(cachedBefore).assertEqual(5);
      expect(cachedAfter).assertEqual(5);
      expect(store.rowCount()).assertEqual(5);
      expect(store.queryCalls).assertEqual(2);
    });

    /**
     * @tc.name   storeRowsSurviveTaskQueueDrain
     * @tc.desc   Draining the taskpool queue does not disturb persisted rows or counters beyond init.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('storeRowsSurviveTaskQueueDrain', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 4));
      store = book.store;
      manager = book.manager;
      const queue = new TaskPoolQueue();
      queue.submit('query-all');
      queue.submit('insert-one');
      queue.submit('update-one');
      const drained: number = queue.drain();
      book.reload();
      logStep('queue-drain', queue.trace());
      expect(drained).assertEqual(3);
      expect(queue.trace()).assertEqual('query-all>insert-one>update-one');
      expect(store.rowCount()).assertEqual(4);
      expect(manager.getContacts().length).assertEqual(4);
      expect(book.parity()).assertTrue();
      expect(queue.size()).assertEqual(0);
    });

    /**
     * @tc.name   archiveLatestMatchesCurrentStore
     * @tc.desc   The most recent capture always equals a fresh snapshot of the store rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('archiveLatestMatchesCurrentStore', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 6));
      store = book.store;
      manager = book.manager;
      book.capture('first');
      store.deleteByName('贝拉');
      book.capture('second');
      const fresh: ContactSnapshot[] = book.storeSnapshot();
      logStep('archive-latest', String(book.lastCapture().length));
      expect(book.lastCapture().length).assertEqual(5);
      expect(sameSnapshotArray(book.lastCapture(), fresh)).assertTrue();
      expect(book.firstCapture().length).assertEqual(6);
      expect(sameSnapshotArray(book.firstCapture(), fresh)).assertFalse();
      expect(book.archiveSize()).assertEqual(2);
    });

    /**
     * @tc.name   clearArchiveDropsHistory
     * @tc.desc   Clearing the archive removes captures and labels while the store keeps its rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clearArchiveDropsHistory', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 4));
      store = book.store;
      manager = book.manager;
      book.capture('a');
      book.capture('b');
      const before: number = book.archiveSize();
      book.clearArchive();
      logStep('archive-clear', String(before) + '->' + String(book.archiveSize()));
      expect(before).assertEqual(2);
      expect(book.archiveSize()).assertEqual(0);
      expect(book.labelTrace()).assertEqual('');
      expect(store.rowCount()).assertEqual(4);
      expect(book.storeSnapshot().length).assertEqual(4);
    });

    /**
     * @tc.name   capturedSnapshotUnaffectedByStoreReset
     * @tc.desc   Snapshot objects are value copies, so a store reset cannot rewrite an old capture.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('capturedSnapshotUnaffectedByStoreReset', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 3));
      store = book.store;
      manager = book.manager;
      const captured: ContactSnapshot[] = book.capture('before-clear');
      const described: string = captured[0].describe();
      store.reset();
      resetContactManager();
      logStep('capture-copy', captured[0].name);
      expect(captured.length).assertEqual(3);
      expect(captured[0].name).assertEqual('艾德里安');
      expect(captured[0].describe()).assertEqual(described);
      expect(store.rowCount()).assertEqual(0);
      expect(book.storeSnapshot().length).assertEqual(0);
    });

    /**
     * @tc.name   persistedRowsKeepAvatarAndCategory
     * @tc.desc   Reloading preserves the avatar and category columns even though update ignores them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('persistedRowsKeepAvatarAndCategory', 0, () => {
      const custom: Contact = contactOf('留影', '13500001111', 'photo@example.com', '福建省厦门市思明区', 'avatar/x.png', 'E');
      book = seededBook([custom, createSeedContacts()[0]]);
      store = book.store;
      manager = book.manager;
      book.reload();
      const cached: Contact = manager.getContacts()[0];
      logStep('avatar-category', cached.avatar + '/' + cached.category);
      expect(cached.avatar).assertEqual('avatar/x.png');
      expect(cached.category).assertEqual('E');
      expect(cached.name).assertEqual('留影');
      expect(manager.getContacts().length).assertEqual(2);
      expect(book.parity()).assertTrue();
    });

    /**
     * @tc.name   reloadFromEmptyStoreLeavesManagerEmpty
     * @tc.desc   Reloading an initialized but empty store replaces the cache with an empty list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reloadFromEmptyStoreLeavesManagerEmpty', 0, () => {
      manager = resetContactManager(createSeedContacts().slice(0, 5));
      const emptyStore = new StoreDouble();
      emptyStore.init(true);
      book = new PersistenceBook(manager, emptyStore);
      const cached: Contact[] = book.reload();
      logStep('empty-reload', String(cached.length));
      expect(cached.length).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(0);
      expect(emptyStore.rowCount()).assertEqual(0);
      expect(emptyStore.initialized).assertTrue();
      expect(book.parity()).assertTrue();
    });

    /**
     * @tc.name   fingerprintStableAcrossReloadCycle
     * @tc.desc   Metrics computed before and after a manager reset plus reload stay identical.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintStableAcrossReloadCycle', 0, () => {
      book = seededBook(createSeedContacts());
      store = book.store;
      manager = book.manager;
      const before: number = book.metricsFingerprint(book.storeSnapshot());
      resetContactManager();
      book.reload();
      const after: number = book.metricsFingerprint(book.managerSnapshot());
      logStep('fingerprint-cycle', String(before));
      expect(before).assertEqual(after);
      expect(before > 0).assertTrue();
      expect(book.managerSnapshot().length).assertEqual(15);
      expect(countOf(book.storeNames(), '法比而')).assertEqual(1);
    });

    /**
     * @tc.name   managerEditWithoutStoreLeavesRowsStale
     * @tc.desc   Updating only the manager cache does not persist, so a reload reverts the value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerEditWithoutStoreLeavesRowsStale', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 4));
      store = book.store;
      manager = book.manager;
      book.reload();
      const edited: Contact = contactOf('贝拉', '13300007777', 'cache.only@example.com', '湖北省武汉市江汉区', '', 'B');
      manager.updateContact(edited);
      const cachedPhone: string = manager.getContacts()[2].phone;
      book.reload();
      logStep('stale-cache', 'cached=' + cachedPhone + ' reloaded=' + manager.getContacts()[2].phone);
      expect(cachedPhone).assertEqual('13300007777');
      expect(manager.getContacts()[2].phone).assertEqual('11111111111');
      expect(store.rows[2].phone).assertEqual('11111111111');
      expect(book.parity()).assertTrue();
    });

    /**
     * @tc.name   snapshotParityAfterDeleteAndAdd
     * @tc.desc   One delete and one add keep the store and reloaded cache in exact snapshot parity.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotParityAfterDeleteAndAdd', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 5));
      store = book.store;
      manager = book.manager;
      store.deleteByName('阿诺德');
      store.insert(true, contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'A'), 'ON_CONFLICT_REPLACE');
      book.reload();
      logStep('parity-mixed', String(store.rowCount()));
      expect(store.rowCount()).assertEqual(5);
      expect(countOf(book.storeNames(), '阿诺德')).assertEqual(0);
      expect(countOf(book.storeNames(), '林岸')).assertEqual(1);
      expect(book.storeNames()[4]).assertEqual('林岸');
      expect(book.parity()).assertTrue();
      expect(manager.getContacts()[4].name).assertEqual('林岸');
    });

    /**
     * @tc.name   archiveLabelsClearedWithArchive
     * @tc.desc   Clearing the archive also clears the label list that described it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SessionPersistenceLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('archiveLabelsClearedWithArchive', 0, () => {
      book = seededBook(createSeedContacts().slice(0, 2));
      store = book.store;
      manager = book.manager;
      book.capture('capture-one');
      const labelsBefore: number = book.labels.length;
      book.clearArchive();
      logStep('labels-clear', String(labelsBefore) + '->' + String(book.labels.length));
      expect(labelsBefore).assertEqual(1);
      expect(book.labels.length).assertEqual(0);
      expect(book.archive.length).assertEqual(0);
      expect(book.archiveSize()).assertEqual(0);
      expect(store.rowCount()).assertEqual(2);
      expect(store.query(true).length).assertEqual(2);
    });
  });
}
