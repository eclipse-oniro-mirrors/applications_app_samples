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
 * ConcurrentMutationStability interleaves the three mutation paths that the
 * sample can issue from different taskpool callbacks:
 *
 *   OperateRDBInTaskPool.ets:91-97   add resolves then appends to the manager
 *   OperateRDBInTaskPool.ets:102-108 edit resolves then updates the manager
 *   OperateRDBInTaskPool.ets:113-119 delete resolves then filters the manager
 *   ContactManager.ets:51-53         add always appends
 *   ContactManager.ets:56-65         update replaces the first name match
 *   ContactManager.ets:68-70         delete filters every matching row
 *   DatabaseConnection.ets:187-221   insert appends because the bucket has no id
 *
 * DualLedger applies each routed operation to both holders and records the
 * step, so order and final consistency can be asserted without real threads.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  StoreDouble,
  ContactMetrics,
  ContactSnapshot,
  snapshotsOf,
  sameSnapshotArray,
  CONFLICT_REPLACE,
  createSeedContacts,
  contactOf,
  cloneContact,
  contactNames,
  joined,
  countOf,
  sameStringArray,
  resetContactManager,
  textFingerprint
} from '../Shared/SharedDriver';

/** Applies routed mutations to the manager and the store, recording every step. */
class DualLedger {
  public manager: ContactManager;
  public store: StoreDouble;
  public steps: string[] = [];

  constructor(manager: ContactManager, store: StoreDouble) {
    this.manager = manager;
    this.store = store;
  }

  public add(contact: Contact): void {
    this.store.insert(true, cloneContact(contact), CONFLICT_REPLACE);
    this.manager.addContact(cloneContact(contact));
    this.steps.push('add:' + contact.name);
  }

  public update(contact: Contact): void {
    this.store.updateContact(cloneContact(contact));
    this.manager.updateContact(cloneContact(contact));
    this.steps.push('update:' + contact.name);
  }

  public remove(name: string): void {
    this.store.deleteByName(name);
    this.manager.deleteContact(new Contact(name));
    this.steps.push('delete:' + name);
  }

  public cacheOnlyUpdate(contact: Contact): void {
    this.manager.updateContact(cloneContact(contact));
    this.steps.push('cache:' + contact.name);
  }

  public reload(): void {
    this.manager.setContacts(this.store.query(true));
    this.steps.push('reload');
  }

  public stepCount(): number {
    return this.steps.length;
  }

  public trace(): string {
    return joined(this.steps, '>');
  }

  public namesEqual(): boolean {
    return sameStringArray(contactNames(this.store.rows), contactNames(this.manager.getContacts()));
  }

  public countEqual(): boolean {
    return this.store.rowCount() === this.manager.getContacts().length;
  }

  public snapshotEqual(): boolean {
    return sameSnapshotArray(snapshotsOf(this.store.rows), snapshotsOf(this.manager.getContacts()));
  }

  public fingerprint(): number {
    return textFingerprint(joined(contactNames(this.store.rows), ','));
  }

  public clearTrace(): void {
    this.steps = [];
  }
}

/** A seeded ledger with the first five payload rows on both sides. */
function seededLedger(count: int): DualLedger {
  const rows: Contact[] = createSeedContacts().slice(0, count);
  const store = new StoreDouble();
  store.batchInsert(true, rows);
  const manager: ContactManager = resetContactManager(rows);
  return new DualLedger(manager, store);
}

/** A routed contact for one of the mutation operations. */
function routed(name: string, phone: string, email: string, category: string): Contact {
  return contactOf(name, phone, email, '交错地址', '', category);
}

export default function concurrentMutationStabilityTest(): void {
  describe('ConcurrentMutationStability', () => {
    let manager: ContactManager = resetContactManager();
    let store: StoreDouble = new StoreDouble();
    let ledger: DualLedger = new DualLedger(manager, store);

    beforeAll(() => {
      logSuite('ConcurrentMutationStability', 'begin');
    });

    beforeEach(async () => {
      manager = resetContactManager();
      store = new StoreDouble();
      ledger = new DualLedger(manager, store);
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('ConcurrentMutationStability', 'end');
    });

    /**
     * @tc.name   interleavedAddThenUpdateKeepsParity
     * @tc.desc   An add followed by an update on different names keeps store and cache in step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('interleavedAddThenUpdateKeepsParity', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.add(routed('林岸', '13800138000', 'lin@example.com', 'A'));
      ledger.update(routed('阿诺德', '16600001111', 'arnold.new@example.com', 'A'));
      logStep('add-update', ledger.trace());
      expect(ledger.stepCount()).assertEqual(2);
      expect(ledger.countEqual()).assertTrue();
      expect(ledger.snapshotEqual()).assertTrue();
      expect(store.rowCount()).assertEqual(4);
      expect(manager.getContacts().length).assertEqual(4);
    });

    /**
     * @tc.name   interleavedDeleteThenAddKeepsParity
     * @tc.desc   Deleting an existing name and adding a new one leaves both holders at the same size.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('interleavedDeleteThenAddKeepsParity', 0, () => {
      ledger = seededLedger(4);
      store = ledger.store;
      manager = ledger.manager;
      ledger.remove('贝拉');
      ledger.add(routed('苏木', '13922223333', 'sumu@example.com', 'D'));
      logStep('delete-add', ledger.trace());
      expect(store.rowCount()).assertEqual(4);
      expect(manager.getContacts().length).assertEqual(4);
      expect(countOf(store.names(), '贝拉')).assertEqual(0);
      expect(store.names()[3]).assertEqual('苏木');
      expect(ledger.snapshotEqual()).assertTrue();
    });

    /**
     * @tc.name   finalCountsMatchAfterTenOps
     * @tc.desc   Ten interleaved operations leave a count that both holders agree on.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('finalCountsMatchAfterTenOps', 0, () => {
      ledger = seededLedger(5);
      store = ledger.store;
      manager = ledger.manager;
      ledger.add(routed('甲', '13111111111', 'a@example.com', 'A'));
      ledger.add(routed('乙', '13222222222', 'b@example.com', 'B'));
      ledger.update(routed('甲', '13100000001', 'a.new@example.com', 'A'));
      ledger.remove('丙');
      ledger.add(routed('丙', '13333333333', 'c@example.com', 'C'));
      ledger.remove('艾德里安');
      ledger.update(routed('乙', '13200000002', 'b.new@example.com', 'B'));
      ledger.add(routed('丁', '13444444444', 'd@example.com', 'D'));
      ledger.remove('未登记');
      ledger.update(routed('甲', '13100000009', 'a.last@example.com', 'A'));
      logStep('ten-steps', String(ledger.stepCount()));
      expect(ledger.stepCount()).assertEqual(10);
      expect(ledger.countEqual()).assertTrue();
      expect(store.rowCount()).assertEqual(8);
      expect(manager.getContacts().length).assertEqual(8);
      expect(ledger.snapshotEqual()).assertTrue();
    });

    /**
     * @tc.name   managerOrderAfterInterleaving
     * @tc.desc   The cached list keeps seed order and appends later adds at the tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerOrderAfterInterleaving', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.add(routed('林岸', '13800138000', 'lin@example.com', 'A'));
      ledger.update(routed('凯', '13555555555', 'kai@example.com', 'B'));
      ledger.remove('阿诺德');
      ledger.add(routed('闻笛', '13911112222', 'wendi@example.com', 'C'));
      logStep('manager-order', joined(contactNames(manager.getContacts()), ','));
      expect(sameStringArray(contactNames(manager.getContacts()),
        ['艾德里安', '贝拉', '林岸', '闻笛'])).assertTrue();
      expect(manager.getContacts().length).assertEqual(4);
      expect(manager.getContacts()[0].name).assertEqual('艾德里安');
      expect(manager.getContacts()[3].name).assertEqual('闻笛');
    });

    /**
     * @tc.name   storeOrderAfterInterleaving
     * @tc.desc   The relational rows follow the same surviving order as the cache.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeOrderAfterInterleaving', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.add(routed('林岸', '13800138000', 'lin@example.com', 'A'));
      ledger.update(routed('凯', '13555555555', 'kai@example.com', 'B'));
      ledger.remove('阿诺德');
      ledger.add(routed('闻笛', '13911112222', 'wendi@example.com', 'C'));
      logStep('store-order', joined(store.names(), ','));
      expect(sameStringArray(store.names(), ['艾德里安', '贝拉', '林岸', '闻笛'])).assertTrue();
      expect(ledger.namesEqual()).assertTrue();
      expect(store.names()[2]).assertEqual('林岸');
      expect(store.rowCount()).assertEqual(4);
    });

    /**
     * @tc.name   duplicateAddKeepsBothSidesInStep
     * @tc.desc   Adding an existing name appends a duplicate on both sides, not a replacement.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateAddKeepsBothSidesInStep', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.add(routed('贝拉', '11111111111', 'bella.dup@example.com', 'B'));
      logStep('duplicate-add', String(countOf(store.names(), '贝拉')));
      expect(countOf(store.names(), '贝拉')).assertEqual(2);
      expect(countOf(contactNames(manager.getContacts()), '贝拉')).assertEqual(2);
      expect(store.rowCount()).assertEqual(4);
      expect(manager.getContacts().length).assertEqual(4);
      expect(store.insertCalls).assertEqual(1);
    });

    /**
     * @tc.name   storeDeleteRemovesAllDuplicates
     * @tc.desc   The SQL delete filters every row with the name, including duplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeDeleteRemovesAllDuplicates', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.add(routed('贝拉', '12222222222', 'bella.alt@example.com', 'B'));
      const before: number = store.rowCount();
      ledger.remove('贝拉');
      logStep('store-dupes', String(before) + '->' + String(store.rowCount()));
      expect(before).assertEqual(4);
      expect(store.rowCount()).assertEqual(2);
      expect(countOf(store.names(), '贝拉')).assertEqual(0);
      expect(store.deleteCalls).assertEqual(1);
      expect(ledger.countEqual()).assertTrue();
    });

    /**
     * @tc.name   managerDeleteRemovesAllDuplicates
     * @tc.desc   The manager filter also drops every duplicate, so the cache matches the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerDeleteRemovesAllDuplicates', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.add(routed('贝拉', '12222222222', 'bella.alt@example.com', 'B'));
      ledger.remove('贝拉');
      const cached: Contact[] = manager.getContacts();
      logStep('manager-dupes', String(cached.length));
      expect(cached.length).assertEqual(2);
      expect(countOf(contactNames(cached), '贝拉')).assertEqual(0);
      expect(cached[0].name).assertEqual('艾德里安');
      expect(ledger.namesEqual()).assertTrue();
      expect(ledger.snapshotEqual()).assertTrue();
    });

    /**
     * @tc.name   updateFirstManagerMatchOnly
     * @tc.desc   With duplicate names the manager replaces only the first match, as the loop breaks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateFirstManagerMatchOnly', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.add(routed('贝拉', '12222222222', 'bella.alt@example.com', 'B'));
      ledger.update(routed('贝拉', '13300003333', 'bella.first@example.com', 'B'));
      const cached: Contact[] = manager.getContacts();
      logStep('first-match', cached[2].phone + '/' + cached[3].phone);
      expect(cached.length).assertEqual(4);
      expect(cached[2].phone).assertEqual('13300003333');
      expect(cached[3].phone).assertEqual('12222222222');
      expect(cached[3].email).assertEqual('bella.alt@example.com');
      expect(countOf(contactNames(cached), '贝拉')).assertEqual(2);
    });

    /**
     * @tc.name   updateStoreAllMatches
     * @tc.desc   The store update matches by name, so both duplicate rows receive the new phone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateStoreAllMatches', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.add(routed('贝拉', '12222222222', 'bella.alt@example.com', 'B'));
      ledger.update(routed('贝拉', '13300003333', 'bella.first@example.com', 'B'));
      logStep('store-matches', store.rows[2].phone + '/' + store.rows[3].phone);
      expect(store.rows[2].phone).assertEqual('13300003333');
      expect(store.rows[3].phone).assertEqual('13300003333');
      expect(store.rows[3].email).assertEqual('bella.first@example.com');
      expect(store.updateCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(4);
    });

    /**
     * @tc.name   updateThenDeleteOnSameNameConverges
     * @tc.desc   An update followed by a delete of that name removes the row from both holders.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateThenDeleteOnSameNameConverges', 0, () => {
      ledger = seededLedger(4);
      store = ledger.store;
      manager = ledger.manager;
      ledger.update(routed('本', '14400004444', 'ben.new@example.com', 'B'));
      ledger.remove('本');
      logStep('update-delete', ledger.trace());
      expect(store.rowCount()).assertEqual(3);
      expect(manager.getContacts().length).assertEqual(3);
      expect(countOf(store.names(), '本')).assertEqual(0);
      expect(countOf(contactNames(manager.getContacts()), '本')).assertEqual(0);
      expect(ledger.snapshotEqual()).assertTrue();
    });

    /**
     * @tc.name   deleteThenUpdateLeavesNoRow
     * @tc.desc   Updating a name right after deleting it finds no row and inserts nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteThenUpdateLeavesNoRow', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.remove('阿诺德');
      ledger.update(routed('阿诺德', '16600004444', 'arnold.back@example.com', 'A'));
      logStep('delete-update', String(store.rowCount()));
      expect(store.rowCount()).assertEqual(2);
      expect(manager.getContacts().length).assertEqual(2);
      expect(countOf(store.names(), '阿诺德')).assertEqual(0);
      expect(store.insertCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   addDeleteAddSymmetricSequence
     * @tc.desc   Adding, deleting and re-adding one name ends with a single appended row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addDeleteAddSymmetricSequence', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.add(routed('林岸', '13800138000', 'lin@example.com', 'A'));
      ledger.remove('林岸');
      ledger.add(routed('林岸', '13800138001', 'lin2@example.com', 'A'));
      logStep('add-delete-add', joined(store.names(), ','));
      expect(store.rowCount()).assertEqual(4);
      expect(manager.getContacts().length).assertEqual(4);
      expect(countOf(store.names(), '林岸')).assertEqual(1);
      expect(store.rows[3].phone).assertEqual('13800138001');
      expect(ledger.snapshotEqual()).assertTrue();
    });

    /**
     * @tc.name   alternatingAddDeleteKeepsCountStable
     * @tc.desc   Three add and delete pairs leave the original seeded count untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('alternatingAddDeleteKeepsCountStable', 0, () => {
      ledger = seededLedger(5);
      store = ledger.store;
      manager = ledger.manager;
      const names: string[] = ['甲', '乙', '丙'];
      for (let index = 0; index < names.length; index++) {
        ledger.add(routed(names[index], '1300000000' + String(index), 'pair@example.com', 'A'));
        ledger.remove(names[index]);
      }
      logStep('pairs', String(ledger.stepCount()) + ' rows=' + String(store.rowCount()));
      expect(ledger.stepCount()).assertEqual(6);
      expect(store.rowCount()).assertEqual(5);
      expect(manager.getContacts().length).assertEqual(5);
      expect(ledger.namesEqual()).assertTrue();
      expect(ledger.snapshotEqual()).assertTrue();
    });

    /**
     * @tc.name   managerDoubleUpdateLastWins
     * @tc.desc   Two cache updates on one name leave the second phone in the manager.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerDoubleUpdateLastWins', 0, () => {
      ledger = seededLedger(2);
      store = ledger.store;
      manager = ledger.manager;
      ledger.cacheOnlyUpdate(routed('艾德里安', '13300000001', 'first@example.com', 'A'));
      ledger.cacheOnlyUpdate(routed('艾德里安', '13300000002', 'second@example.com', 'A'));
      logStep('cache-last', manager.getContacts()[0].phone);
      expect(manager.getContacts()[0].phone).assertEqual('13300000002');
      expect(manager.getContacts()[0].email).assertEqual('second@example.com');
      expect(store.rows[0].phone).assertEqual('13333333333');
      expect(store.updateCalls).assertEqual(0);
      expect(ledger.namesEqual()).assertTrue();
    });

    /**
     * @tc.name   storeDoubleUpdateLastWins
     * @tc.desc   Two store updates on one name leave the second address in the relational row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeDoubleUpdateLastWins', 0, () => {
      ledger = seededLedger(2);
      store = ledger.store;
      manager = ledger.manager;
      ledger.update(routed('阿诺德', '16600000001', 'first@example.com', 'A'));
      ledger.update(routed('阿诺德', '16600000002', 'second@example.com', 'A'));
      logStep('store-last', store.rows[1].phone);
      expect(store.rows[1].phone).assertEqual('16600000002');
      expect(store.rows[1].email).assertEqual('second@example.com');
      expect(store.updateCalls).assertEqual(2);
      expect(manager.getContacts()[1].phone).assertEqual('16600000002');
      expect(ledger.snapshotEqual()).assertTrue();
    });

    /**
     * @tc.name   ledgerTraceRecordsEveryStep
     * @tc.desc   The ledger trace lists the routed steps in call order with their names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('ledgerTraceRecordsEveryStep', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.add(routed('林岸', '13800138000', 'lin@example.com', 'A'));
      ledger.update(routed('阿诺德', '16600001111', 'arnold.new@example.com', 'A'));
      ledger.remove('贝拉');
      logStep('trace', ledger.trace());
      expect(ledger.trace()).assertEqual('add:林岸>update:阿诺德>delete:贝拉');
      expect(ledger.stepCount()).assertEqual(3);
      expect(ledger.steps[0]).assertEqual('add:林岸');
      expect(ledger.steps[2]).assertEqual('delete:贝拉');
      ledger.clearTrace();
      expect(ledger.stepCount()).assertEqual(0);
      expect(store.rowCount()).assertEqual(3);
    });

    /**
     * @tc.name   finalSnapshotEquality
     * @tc.desc   After a mixed run the store snapshot and the cache snapshot compare element by element.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('finalSnapshotEquality', 0, () => {
      ledger = seededLedger(5);
      store = ledger.store;
      manager = ledger.manager;
      ledger.add(routed('林岸', '13800138000', 'lin@example.com', 'A'));
      ledger.update(routed('贝拉', '13300001111', 'bella.new@example.com', 'B'));
      ledger.remove('本');
      ledger.add(routed('闻笛', '13911112222', 'wendi@example.com', 'C'));
      const storeSnapshots: ContactSnapshot[] = snapshotsOf(store.rows);
      const cacheSnapshots: ContactSnapshot[] = snapshotsOf(manager.getContacts());
      logStep('snapshot-parity', String(storeSnapshots.length));
      expect(sameSnapshotArray(storeSnapshots, cacheSnapshots)).assertTrue();
      expect(storeSnapshots.length).assertEqual(6);
      expect(cacheSnapshots[5].name).assertEqual('闻笛');
      expect(storeSnapshots[5].sameAs(cacheSnapshots[5])).assertTrue();
    });

    /**
     * @tc.name   cacheOnlyUpdateDivergesFromStore
     * @tc.desc   A cache-only edit is visible in the manager but not in the store until a reload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cacheOnlyUpdateDivergesFromStore', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.cacheOnlyUpdate(routed('贝拉', '13300002222', 'cache.only@example.com', 'B'));
      logStep('diverged', manager.getContacts()[2].phone + '/' + store.rows[2].phone);
      expect(manager.getContacts()[2].phone).assertEqual('13300002222');
      expect(store.rows[2].phone).assertEqual('11111111111');
      expect(ledger.countEqual()).assertTrue();
      expect(ledger.snapshotEqual()).assertFalse();
      expect(store.updateCalls).assertEqual(0);
    });

    /**
     * @tc.name   reloadConvergesAfterCacheOnlyUpdate
     * @tc.desc   A reload after a cache-only edit restores parity from the persisted rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reloadConvergesAfterCacheOnlyUpdate', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.cacheOnlyUpdate(routed('贝拉', '13300002222', 'cache.only@example.com', 'B'));
      expect(ledger.snapshotEqual()).assertFalse();
      ledger.reload();
      logStep('converged', manager.getContacts()[2].phone);
      expect(ledger.snapshotEqual()).assertTrue();
      expect(manager.getContacts()[2].phone).assertEqual('11111111111');
      expect(store.rows[2].phone).assertEqual('11111111111');
      expect(ledger.stepCount()).assertEqual(2);
      expect(ledger.steps[1]).assertEqual('reload');
    });

    /**
     * @tc.name   rowCountParityAfterTwelveRoutedOps
     * @tc.desc   Twelve routed operations end with identical counts on both holders.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rowCountParityAfterTwelveRoutedOps', 0, () => {
      ledger = seededLedger(6);
      store = ledger.store;
      manager = ledger.manager;
      const names: string[] = ['甲', '乙', '丙', '丁'];
      for (let index = 0; index < names.length; index++) {
        ledger.add(routed(names[index], '1300000000' + String(index), 'routed@example.com', 'A'));
      }
      for (let index = 0; index < names.length; index++) {
        ledger.update(routed(names[index], '1310000000' + String(index), 'routed.new@example.com', 'B'));
      }
      for (let index = 0; index < 4; index++) {
        ledger.remove(names[index]);
      }
      logStep('twelve', String(ledger.stepCount()) + ' rows=' + String(store.rowCount()));
      expect(ledger.stepCount()).assertEqual(12);
      expect(store.rowCount()).assertEqual(6);
      expect(manager.getContacts().length).assertEqual(6);
      expect(ledger.countEqual()).assertTrue();
      expect(ledger.snapshotEqual()).assertTrue();
    });

    /**
     * @tc.name   threeDuplicateAddsCount
     * @tc.desc   Three duplicate adds create three extra rows on each side because add never replaces.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('threeDuplicateAddsCount', 0, () => {
      ledger = seededLedger(2);
      store = ledger.store;
      manager = ledger.manager;
      for (let index = 0; index < 3; index++) {
        ledger.add(routed('艾德里安', '1330000000' + String(index), 'dup@example.com', 'A'));
      }
      logStep('triple-dup', String(countOf(store.names(), '艾德里安')));
      expect(store.rowCount()).assertEqual(5);
      expect(countOf(store.names(), '艾德里安')).assertEqual(4);
      expect(countOf(contactNames(manager.getContacts()), '艾德里安')).assertEqual(4);
      expect(store.insertCalls).assertEqual(3);
      expect(ledger.snapshotEqual()).assertTrue();
    });

    /**
     * @tc.name   deleteUnknownDuringInterleaveNoop
     * @tc.desc   A delete for a name that was never added leaves counts and order unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteUnknownDuringInterleaveNoop', 0, () => {
      ledger = seededLedger(4);
      store = ledger.store;
      manager = ledger.manager;
      const namesBefore: string[] = store.names();
      ledger.remove('从未存在');
      logStep('unknown-delete', String(store.rowCount()));
      expect(store.rowCount()).assertEqual(4);
      expect(manager.getContacts().length).assertEqual(4);
      expect(sameStringArray(store.names(), namesBefore)).assertTrue();
      expect(store.deleteCalls).assertEqual(1);
      expect(ledger.snapshotEqual()).assertTrue();
    });

    /**
     * @tc.name   updateUnknownDuringInterleaveNoop
     * @tc.desc   An update for an unknown name hits zero rows and appends nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateUnknownDuringInterleaveNoop', 0, () => {
      ledger = seededLedger(4);
      store = ledger.store;
      manager = ledger.manager;
      const namesBefore: string[] = store.names();
      ledger.update(routed('未知联系人', '13500001111', 'ghost@example.com', 'A'));
      logStep('unknown-update', String(store.rowCount()));
      expect(store.rowCount()).assertEqual(4);
      expect(countOf(store.names(), '未知联系人')).assertEqual(0);
      expect(store.updateCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(0);
      expect(sameStringArray(store.names(), namesBefore)).assertTrue();
    });

    /**
     * @tc.name   newRowsKeepInsertionOrderAfterDeletes
     * @tc.desc   Adds issued after deletes still append at the tail, preserving the surviving prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('newRowsKeepInsertionOrderAfterDeletes', 0, () => {
      ledger = seededLedger(5);
      store = ledger.store;
      manager = ledger.manager;
      ledger.remove('阿诺德');
      ledger.remove('本');
      ledger.add(routed('林岸', '13800138000', 'lin@example.com', 'A'));
      ledger.add(routed('苏木', '13922223333', 'sumu@example.com', 'D'));
      logStep('order', joined(store.names(), ','));
      expect(sameStringArray(store.names(), ['艾德里安', '贝拉', '本杰明', '林岸', '苏木'])).assertTrue();
      expect(store.names()[3]).assertEqual('林岸');
      expect(store.rowCount()).assertEqual(5);
      expect(manager.getContacts()[4].name).assertEqual('苏木');
      expect(ledger.namesEqual()).assertTrue();
    });

    /**
     * @tc.name   fingerprintParityAfterInterleave
     * @tc.desc   The store name fingerprint is unchanged by the manager side of each routed step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintParityAfterInterleave', 0, () => {
      ledger = seededLedger(4);
      store = ledger.store;
      manager = ledger.manager;
      const before: number = ledger.fingerprint();
      ledger.update(routed('贝拉', '13300001111', 'bella.new@example.com', 'B'));
      const afterUpdate: number = ledger.fingerprint();
      ledger.add(routed('林岸', '13800138000', 'lin@example.com', 'A'));
      const afterAdd: number = ledger.fingerprint();
      logStep('fingerprint-steps', String(before) + '/' + String(afterAdd));
      expect(before).assertEqual(afterUpdate);
      expect(before === afterAdd).assertFalse();
      expect(afterAdd).assertEqual(textFingerprint(joined(store.names(), ',')));
      expect(store.rowCount()).assertEqual(5);
    });

    /**
     * @tc.name   seededLedgerStartsWithParity
     * @tc.desc   A freshly seeded ledger already has equal counts, names and snapshots.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seededLedgerStartsWithParity', 0, () => {
      ledger = seededLedger(5);
      store = ledger.store;
      manager = ledger.manager;
      logStep('seed-parity', String(store.rowCount()));
      expect(store.rowCount()).assertEqual(5);
      expect(manager.getContacts().length).assertEqual(5);
      expect(ledger.countEqual()).assertTrue();
      expect(ledger.namesEqual()).assertTrue();
      expect(ledger.snapshotEqual()).assertTrue();
      expect(ledger.stepCount()).assertEqual(0);
    });

    /**
     * @tc.name   roundTripAddUpdateDelete
     * @tc.desc   One add, one update and one delete on distinct names return to the seeded count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('roundTripAddUpdateDelete', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.add(routed('林岸', '13800138000', 'lin@example.com', 'A'));
      ledger.update(routed('本', '14400004444', 'ben.new@example.com', 'B'));
      ledger.remove('林岸');
      logStep('round-trip', joined(store.names(), ','));
      expect(store.rowCount()).assertEqual(3);
      expect(manager.getContacts().length).assertEqual(3);
      expect(sameStringArray(store.names(), ['艾德里安', '阿诺德', '贝拉'])).assertTrue();
      expect(store.rows.length).assertEqual(3);
      expect(ledger.snapshotEqual()).assertTrue();
    });

    /**
     * @tc.name   metricsMatchBetweenSides
     * @tc.desc   ContactMetrics computed from the store and from the cache report the same totals.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsMatchBetweenSides', 0, () => {
      ledger = seededLedger(5);
      store = ledger.store;
      manager = ledger.manager;
      ledger.add(routed('林岸', '13800138000', 'lin@example.com', 'A'));
      ledger.remove('本');
      const storeMetrics: ContactMetrics = ContactMetrics.from(store.rows);
      const cacheMetrics: ContactMetrics = ContactMetrics.from(manager.getContacts());
      logStep('metrics-sides', String(storeMetrics.total));
      expect(storeMetrics.total).assertEqual(cacheMetrics.total);
      expect(storeMetrics.uniqueNames).assertEqual(cacheMetrics.uniqueNames);
      expect(storeMetrics.categories).assertEqual(cacheMetrics.categories);
      expect(storeMetrics.totalPhoneDigits).assertEqual(cacheMetrics.totalPhoneDigits);
      expect(storeMetrics.fingerprint()).assertEqual(cacheMetrics.fingerprint());
    });

    /**
     * @tc.name   deleteAllRowsThenAddRestoresParity
     * @tc.desc   Deleting every seeded name and adding one row leaves a single row on both sides.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteAllRowsThenAddRestoresParity', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.remove('艾德里安');
      ledger.remove('阿诺德');
      ledger.remove('贝拉');
      const empty: number = store.rowCount();
      ledger.add(routed('唯一', '13666666666', 'only@example.com', 'E'));
      logStep('sweep', String(empty) + '->' + String(store.rowCount()));
      expect(empty).assertEqual(0);
      expect(store.rowCount()).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(1);
      expect(manager.getContacts()[0].name).assertEqual('唯一');
      expect(ledger.snapshotEqual()).assertTrue();
    });

    /**
     * @tc.name   freshLedgerTraceEmpty
     * @tc.desc   A ledger built directly from a store has an empty trace and unmatched holders.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('freshLedgerTraceEmpty', 0, () => {
      store = new StoreDouble();
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      manager = resetContactManager();
      ledger = new DualLedger(manager, store);
      logStep('fresh-trace', ledger.trace());
      expect(ledger.stepCount()).assertEqual(0);
      expect(ledger.trace()).assertEqual('');
      expect(ledger.countEqual()).assertFalse();
      expect(store.rowCount()).assertEqual(3);
      expect(manager.getContacts().length).assertEqual(0);
      ledger.reload();
      expect(ledger.snapshotEqual()).assertTrue();
    });

    /**
     * @tc.name   firstSeedRowSurvivesInterleaving
     * @tc.desc   The oldest cached row keeps its field values through five unrelated steps.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('firstSeedRowSurvivesInterleaving', 0, () => {
      ledger = seededLedger(6);
      store = ledger.store;
      manager = ledger.manager;
      const firstBefore: Contact = cloneContact(store.rows[0]);
      ledger.add(routed('林岸', '13800138000', 'lin@example.com', 'A'));
      ledger.update(routed('阿诺德', '16600001111', 'arnold.new@example.com', 'A'));
      ledger.remove('贝拉');
      ledger.add(routed('苏木', '13922223333', 'sumu@example.com', 'D'));
      ledger.update(routed('本', '14400004444', 'ben.new@example.com', 'B'));
      logStep('survivor', store.rows[0].name);
      expect(store.rows[0].name).assertEqual(firstBefore.name);
      expect(store.rows[0].phone).assertEqual(firstBefore.phone);
      expect(store.rows[0].email).assertEqual(firstBefore.email);
      expect(manager.getContacts()[0].phone).assertEqual(firstBefore.phone);
      expect(store.rowCount()).assertEqual(7);
    });

    /**
     * @tc.name   duplicateUpdateThenDeleteClearsBothSides
     * @tc.desc   Updating duplicates rewrites both store rows and one delete clears all of them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateUpdateThenDeleteClearsBothSides', 0, () => {
      ledger = seededLedger(3);
      store = ledger.store;
      manager = ledger.manager;
      ledger.add(routed('贝拉', '12222222222', 'bella.alt@example.com', 'B'));
      ledger.update(routed('贝拉', '13300007777', 'bella.both@example.com', 'B'));
      const updatedPhones: string = store.rows[2].phone + '/' + store.rows[3].phone;
      ledger.remove('贝拉');
      logStep('dupes-clear', updatedPhones);
      expect(updatedPhones).assertEqual('13300007777/13300007777');
      expect(countOf(store.names(), '贝拉')).assertEqual(0);
      expect(countOf(contactNames(manager.getContacts()), '贝拉')).assertEqual(0);
      expect(store.rowCount()).assertEqual(2);
      expect(ledger.snapshotEqual()).assertTrue();
    });

    /**
     * @tc.name   alternatingUpdateDeleteKeepsNameParity
     * @tc.desc   Two updates and two deletes on distinct names keep the name lists identical.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('alternatingUpdateDeleteKeepsNameParity', 0, () => {
      ledger = seededLedger(6);
      store = ledger.store;
      manager = ledger.manager;
      ledger.update(routed('艾德里安', '13300000011', 'aidelian.new@example.com', 'A'));
      ledger.remove('阿诺德');
      ledger.update(routed('贝拉', '13300000022', 'bella.new@example.com', 'B'));
      ledger.remove('本');
      logStep('alternating', String(store.rowCount()));
      expect(store.rowCount()).assertEqual(4);
      expect(ledger.namesEqual()).assertTrue();
      expect(store.names()[0]).assertEqual('艾德里安');
      expect(manager.getContacts()[0].phone).assertEqual('13300000011');
      expect(ledger.countEqual()).assertTrue();
    });

    /**
     * @tc.name   seededLedgerCountMatchesSlice
     * @tc.desc   The seeded ledger count equals the requested slice size for two different sizes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seededLedgerCountMatchesSlice', 0, () => {
      const small: DualLedger = seededLedger(2);
      const smallCount: number = small.store.rowCount();
      const smallParity: boolean = small.snapshotEqual();
      const large: DualLedger = seededLedger(9);
      const largeCount: number = large.store.rowCount();
      logStep('slices', String(smallCount) + '/' + String(largeCount));
      expect(smallCount).assertEqual(2);
      expect(largeCount).assertEqual(9);
      expect(small.store.batchCalls).assertEqual(1);
      expect(large.store.batchCalls).assertEqual(1);
      expect(smallParity).assertTrue();
    });
  });
}
