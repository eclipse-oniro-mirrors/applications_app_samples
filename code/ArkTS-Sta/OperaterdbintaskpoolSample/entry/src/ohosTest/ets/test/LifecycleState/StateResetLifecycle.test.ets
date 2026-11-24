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
 * StateResetLifecycle pins what a reset must clear and what it must not touch:
 *
 *   ContactManager.ets:41-48   getContacts and setContacts both copy the array
 *   ContactManager.ets:68-70   deleteContact filters by name
 *   DatabaseConnection.ets:57-62 the connection singleton is stable across resets
 *   DatabaseConnection.ets:69-89 init counters and the rdbStore guard
 *   TaskPool.ets:69-117        the queue wrappers and their fallback values
 *   RdbConstant.ets:33-34      the schema survives every reset cycle
 *
 * ResetProbe bundles the three resettable holders so one case can assert the
 * manager, the store and the queue side by side.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  StoreDouble,
  TaskPoolQueue,
  ContactMetrics,
  ContactSnapshot,
  snapshotsOf,
  createSeedContacts,
  contactOf,
  cloneContact,
  contactNames,
  countOf,
  joined,
  sameStringArray,
  resetContactManager,
  SearchEngine,
  textFingerprint,
  SQL_CREATE_CONTACT,
  TABLE_CONTACT
} from '../Shared/SharedDriver';

/** Bundles the manager, the store and the task queue used by reset cases. */
class ResetProbe {
  public manager: ContactManager;
  public store: StoreDouble;
  public queue: TaskPoolQueue;

  constructor(manager: ContactManager, store: StoreDouble, queue: TaskPoolQueue) {
    this.manager = manager;
    this.store = store;
    this.queue = queue;
  }

  public rebuild(rows: Contact[]): void {
    this.store.batchInsert(true, rows);
    this.manager.setContacts(rows);
  }

  public metrics(): ContactMetrics {
    return ContactMetrics.from(this.manager.getContacts());
  }

  public storeMetrics(): ContactMetrics {
    return ContactMetrics.from(this.store.rows);
  }

  public counters(): string {
    return String(this.store.initCalls) + '/' + String(this.store.queryCalls) + '/' +
      String(this.store.insertCalls) + '/' + String(this.store.batchCalls) + '/' +
      String(this.store.deleteCalls) + '/' + String(this.store.updateCalls);
  }

  public allCountersZero(): boolean {
    return this.store.initCalls === 0 && this.store.queryCalls === 0 && this.store.insertCalls === 0 &&
      this.store.batchCalls === 0 && this.store.deleteCalls === 0 && this.store.updateCalls === 0;
  }

  public queueEmpty(): boolean {
    return this.queue.pending.length === 0 && this.queue.running.length === 0;
  }

  public submitAll(names: string[]): void {
    for (let index = 0; index < names.length; index++) {
      this.queue.submit(names[index]);
    }
  }
}

/** Fingerprint of the whole visible row list, used to detect stale rows. */
function rowsFingerprint(rows: Contact[]): number {
  return textFingerprint(joined(contactNames(rows), ','));
}

export default function stateResetLifecycleTest(): void {
  describe('StateResetLifecycle', () => {
    let manager: ContactManager = resetContactManager();
    let store: StoreDouble = new StoreDouble();
    let queue: TaskPoolQueue = new TaskPoolQueue();
    let probe: ResetProbe = new ResetProbe(manager, store, queue);

    beforeAll(() => {
      logSuite('StateResetLifecycle', 'begin');
    });

    beforeEach(async () => {
      manager = resetContactManager();
      store = new StoreDouble();
      queue = new TaskPoolQueue();
      probe = new ResetProbe(manager, store, queue);
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('StateResetLifecycle', 'end');
    });

    /**
     * @tc.name   managerResetClearsContacts
     * @tc.desc   resetContactManager without a seed leaves the singleton holding an empty list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('managerResetClearsContacts', 0, () => {
      manager = resetContactManager(createSeedContacts());
      const before: number = manager.getContacts().length;
      resetContactManager();
      logStep('manager-reset', String(before) + '->' + String(manager.getContacts().length));
      expect(before).assertEqual(15);
      expect(manager.getContacts().length).assertEqual(0);
      expect(manager.getContacts().length >= 0).assertTrue();
      expect(countOf(contactNames(manager.getContacts()), '艾德里安')).assertEqual(0);
    });

    /**
     * @tc.name   managerResetReturnsSameSingleton
     * @tc.desc   A reset never replaces the singleton, so every holder keeps observing the same cache.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('managerResetReturnsSameSingleton', 0, () => {
      const first: ContactManager = ContactManager.getInstance();
      const second: ContactManager = resetContactManager();
      logStep('singleton', String(first === second));
      expect(first === second).assertTrue();
      expect(second === ContactManager.getInstance()).assertTrue();
      expect(first.getContacts().length).assertEqual(0);
      second.setContacts(createSeedContacts().slice(0, 3));
      expect(first.getContacts().length).assertEqual(3);
    });

    /**
     * @tc.name   managerSetContactsCopiesInput
     * @tc.desc   Mutating the array handed to setContacts cannot change the cached list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerSetContactsCopiesInput', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 4);
      manager = resetContactManager(rows);
      rows.splice(0, 2);
      rows.push(contactOf('外部', '10000000000', 'out@example.com', '外部地址'));
      logStep('set-copy', String(manager.getContacts().length));
      expect(manager.getContacts().length).assertEqual(4);
      expect(manager.getContacts()[0].name).assertEqual('艾德里安');
      expect(countOf(contactNames(manager.getContacts()), '外部')).assertEqual(0);
      expect(rows.length).assertEqual(3);
    });

    /**
     * @tc.name   managerGetContactsReturnsCopy
     * @tc.desc   Splicing the array returned by getContacts leaves the cache untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerGetContactsReturnsCopy', 0, () => {
      manager = resetContactManager(createSeedContacts().slice(0, 5));
      const published: Contact[] = manager.getContacts();
      published.splice(0, published.length);
      const second: Contact[] = manager.getContacts();
      logStep('get-copy', String(published.length) + '/' + String(second.length));
      expect(published.length).assertEqual(0);
      expect(second.length).assertEqual(5);
      expect(second[0].name).assertEqual('艾德里安');
      expect(second[4].name).assertEqual('本杰明');
      expect(manager.getContacts() === second).assertFalse();
    });

    /**
     * @tc.name   storeResetClearsRows
     * @tc.desc   StoreDouble.reset drops every row and every name from the in-memory table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('storeResetClearsRows', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const before: number = store.rowCount();
      store.reset();
      logStep('store-reset', String(before) + '->' + String(store.rowCount()));
      expect(before).assertEqual(15);
      expect(store.rowCount()).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(store.query(true).length).assertEqual(0);
      expect(store.rows.length).assertEqual(0);
    });

    /**
     * @tc.name   storeResetClearsInitializedFlag
     * @tc.desc   A reset store reports uninitialized and accepts a fresh initialization.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('storeResetClearsInitializedFlag', 0, () => {
      store.init(true);
      store.reset();
      const accepted: boolean = store.init(true);
      logStep('reinit', String(accepted));
      expect(store.initialized).assertTrue();
      expect(accepted).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.lastContextValid).assertTrue();
    });

    /**
     * @tc.name   storeResetZeroesInitCounters
     * @tc.desc   The init attempt and table creation counters return to zero after a reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('storeResetZeroesInitCounters', 0, () => {
      store.init(true);
      store.init(true);
      store.init(false);
      logStep('init-before', String(store.initCalls) + '/' + String(store.createTableCalls));
      expect(store.initCalls).assertEqual(3);
      expect(store.createTableCalls).assertEqual(1);
      store.reset();
      expect(store.initCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(probe.allCountersZero()).assertTrue();
    });

    /**
     * @tc.name   storeResetZeroesQueryCounter
     * @tc.desc   Query calls recorded before a reset are not carried into the rebuilt store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeResetZeroesQueryCounter', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      store.query(true);
      store.query(false);
      const before: number = store.queryCalls;
      store.reset();
      store.query(true);
      logStep('query-reset', String(before) + '->' + String(store.queryCalls));
      expect(before).assertEqual(2);
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.query(true).length).assertEqual(0);
      expect(store.queryCalls).assertEqual(2);
    });

    /**
     * @tc.name   storeResetZeroesMutationCounters
     * @tc.desc   Insert, batch, update and delete counters all restart from zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeResetZeroesMutationCounters', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 4);
      store.batchInsert(true, rows);
      store.insert(true, contactOf('新增', '10000000000', 'new@example.com', '新地址'), 'ON_CONFLICT_REPLACE');
      store.updateContact(rows[0]);
      store.deleteByName('本');
      const before: string = probe.counters();
      store.reset();
      logStep('mutation-reset', before + '->' + probe.counters());
      expect(store.batchCalls).assertEqual(0);
      expect(store.insertCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(probe.allCountersZero()).assertTrue();
      expect(before).assertEqual('1/0/1/1/1/1');
    });

    /**
     * @tc.name   storeResetClearsLastContextValid
     * @tc.desc   The remembered context validity flag is reset to false by StoreDouble.reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeResetClearsLastContextValid', 0, () => {
      store.init(true);
      expect(store.lastContextValid).assertTrue();
      store.reset();
      logStep('context-flag', String(store.lastContextValid));
      expect(store.lastContextValid).assertFalse();
      expect(store.initialized).assertFalse();
      expect(store.init(false)).assertFalse();
      expect(store.lastContextValid).assertFalse();
      expect(store.createTableCalls).assertEqual(0);
    });

    /**
     * @tc.name   queueResetClearsPendingAndRunning
     * @tc.desc   A reset queue has no pending or running work left to schedule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queueResetClearsPendingAndRunning', 0, () => {
      probe.submitAll(['query-all', 'batch-insert', 'insert-one']);
      const started: string = queue.runNext();
      logStep('queue-reset', started + ' pending=' + String(queue.pending.length));
      expect(queue.pending.length).assertEqual(2);
      expect(queue.running.length).assertEqual(1);
      queue.reset();
      expect(queue.pending.length).assertEqual(0);
      expect(queue.running.length).assertEqual(0);
      expect(probe.queueEmpty()).assertTrue();
      expect(queue.size()).assertEqual(0);
    });

    /**
     * @tc.name   queueResetClearsCompletedAndFailed
     * @tc.desc   Completion and failure histories are discarded by a queue reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queueResetClearsCompletedAndFailed', 0, () => {
      probe.submitAll(['query-all', 'insert-one', 'delete-one']);
      const first: string = queue.runNext();
      queue.complete(first);
      const second: string = queue.runNext();
      queue.fail(second);
      logStep('queue-history', String(queue.completed.length) + '/' + String(queue.failed.length));
      expect(queue.completed.length).assertEqual(1);
      expect(queue.failed.length).assertEqual(1);
      queue.reset();
      expect(queue.completed.length).assertEqual(0);
      expect(queue.failed.length).assertEqual(0);
      expect(queue.pending.length).assertEqual(0);
      expect(queue.size()).assertEqual(0);
      expect(queue.completionOrder.length).assertEqual(0);
    });

    /**
     * @tc.name   queueResetClearsTrace
     * @tc.desc   The completion trace string becomes empty once the queue is reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queueResetClearsTrace', 0, () => {
      probe.submitAll(['query-all', 'update-one', 'batch-insert']);
      const drained: number = queue.drain();
      logStep('trace-before', queue.trace());
      expect(drained).assertEqual(3);
      expect(queue.trace()).assertEqual('query-all>update-one>batch-insert');
      queue.reset();
      expect(queue.trace()).assertEqual('');
      expect(queue.completionOrder.length).assertEqual(0);
      expect(queue.completed.length).assertEqual(0);
    });

    /**
     * @tc.name   queueResetSizeZero
     * @tc.desc   Queue size counts pending plus running work, and both drop to zero after reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queueResetSizeZero', 0, () => {
      probe.submitAll(['query-all', 'insert-one']);
      queue.runNext();
      const before: number = queue.size();
      queue.reset();
      logStep('size-reset', String(before) + '->' + String(queue.size()));
      expect(before).assertEqual(2);
      expect(queue.size()).assertEqual(0);
      expect(queue.runNext()).assertEqual('');
      expect(queue.drain()).assertEqual(0);
      expect(probe.queueEmpty()).assertTrue();
    });

    /**
     * @tc.name   metricsAfterManagerResetAreZero
     * @tc.desc   ContactMetrics over an empty cache reports zero totals and zero duplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('metricsAfterManagerResetAreZero', 0, () => {
      manager = resetContactManager(createSeedContacts());
      resetContactManager();
      const metrics: ContactMetrics = probe.metrics();
      logStep('metrics-zero', String(metrics.total));
      expect(metrics.total).assertEqual(0);
      expect(metrics.uniqueNames).assertEqual(0);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.categories).assertEqual(0);
      expect(metrics.totalPhoneDigits).assertEqual(0);
    });

    /**
     * @tc.name   metricsFillRatioZeroOnEmpty
     * @tc.desc   The fill ratio guard returns zero instead of dividing by a zero total.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsFillRatioZeroOnEmpty', 0, () => {
      const empty: ContactMetrics = ContactMetrics.from([]);
      const savedRatio: number = empty.fillRatio();
      logStep('fill-ratio', String(savedRatio));
      expect(savedRatio).assertEqual(0);
      expect(savedRatio === 1).assertFalse();
      expect(empty.total).assertEqual(0);
      expect(empty.fingerprint() === 0).assertFalse();
      expect(ContactMetrics.from([createSeedContacts()[0], createSeedContacts()[0]]).fillRatio() < 1).assertTrue();
    });

    /**
     * @tc.name   metricsFingerprintAfterResetMatchesEmpty
     * @tc.desc   The reset metrics fingerprint equals the fingerprint of any other empty row list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsFingerprintAfterResetMatchesEmpty', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const fullHash: number = ContactMetrics.from(store.rows).fingerprint();
      store.reset();
      const emptyHash: number = ContactMetrics.from(store.rows).fingerprint();
      logStep('fingerprint-reset', String(fullHash) + '->' + String(emptyHash));
      expect(fullHash === emptyHash).assertFalse();
      expect(emptyHash).assertEqual(ContactMetrics.from([]).fingerprint());
      expect(ContactMetrics.from(store.rows).total).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   resetThenSeedRestoresFifteen
     * @tc.desc   A reset followed by a rebuild restores the fifteen seeded rows on both sides.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetThenSeedRestoresFifteen', 0, () => {
      probe.rebuild(createSeedContacts());
      store.reset();
      resetContactManager();
      probe.rebuild(createSeedContacts());
      logStep('rebuild', String(store.rowCount()) + '/' + String(manager.getContacts().length));
      expect(store.rowCount()).assertEqual(15);
      expect(manager.getContacts().length).assertEqual(15);
      expect(store.names()[0]).assertEqual('艾德里安');
      expect(manager.getContacts()[14].name).assertEqual('法里');
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   noStaleRowsAfterResetAndReinsert
     * @tc.desc   Rebuilding with a two row payload leaves no trace of the earlier fifteen rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('noStaleRowsAfterResetAndReinsert', 0, () => {
      probe.rebuild(createSeedContacts());
      const oldHash: number = rowsFingerprint(store.rows);
      store.reset();
      resetContactManager();
      const fresh: Contact[] = [createSeedContacts()[0], createSeedContacts()[14]];
      probe.rebuild(fresh);
      const newHash: number = rowsFingerprint(store.rows);
      logStep('stale-check', String(oldHash) + '->' + String(newHash));
      expect(store.rowCount()).assertEqual(2);
      expect(manager.getContacts().length).assertEqual(2);
      expect(countOf(store.names(), '阿诺德')).assertEqual(0);
      expect(countOf(store.names(), '法里')).assertEqual(1);
      expect(oldHash === newHash).assertFalse();
    });

    /**
     * @tc.name   doubleResetIsIdempotent
     * @tc.desc   Calling reset twice leaves the same empty state as a single reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('doubleResetIsIdempotent', 0, () => {
      store.batchInsert(true, createSeedContacts());
      store.reset();
      const afterFirst: number = store.rowCount();
      store.reset();
      logStep('double-reset', String(afterFirst) + '->' + String(store.rowCount()));
      expect(afterFirst).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(probe.allCountersZero()).assertTrue();
    });

    /**
     * @tc.name   tableCountReturnsToOneAfterRebuild
     * @tc.desc   The rebuilt store creates its table once, not once per reset cycle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('tableCountReturnsToOneAfterRebuild', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      expect(store.createTableCalls).assertEqual(1);
      store.reset();
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      logStep('table-rebuild', String(store.createTableCalls));
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(5);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   resetContactManagerWithSeedSetsRows
     * @tc.desc   A seeded reset installs the supplied rows instead of an empty list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetContactManagerWithSeedSetsRows', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 3);
      manager = resetContactManager(seed);
      logStep('seeded-reset', String(manager.getContacts().length));
      expect(manager.getContacts().length).assertEqual(3);
      expect(manager.getContacts()[0].name).assertEqual('艾德里安');
      expect(manager.getContacts()[2].name).assertEqual('贝拉');
      expect(manager === ContactManager.getInstance()).assertTrue();
      resetContactManager();
      expect(manager.getContacts().length).assertEqual(0);
    });

    /**
     * @tc.name   independentStoresDoNotShareReset
     * @tc.desc   Resetting one store instance cannot clear the rows held by another instance.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('independentStoresDoNotShareReset', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const other = new StoreDouble();
      other.batchInsert(true, createSeedContacts().slice(0, 2));
      store.reset();
      logStep('independent', String(store.rowCount()) + '/' + String(other.rowCount()));
      expect(store.rowCount()).assertEqual(0);
      expect(other.rowCount()).assertEqual(2);
      expect(other.initialized).assertTrue();
      expect(other.initCalls).assertEqual(1);
      expect(rowsFingerprint(other.rows) === rowsFingerprint(store.rows)).assertFalse();
    });

    /**
     * @tc.name   queueResetDuringRunningDropsRunning
     * @tc.desc   A reset while a task is running discards both the running entry and the pending ones.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queueResetDuringRunningDropsRunning', 0, () => {
      probe.submitAll(['batch-insert', 'query-all', 'update-one']);
      const started: string = queue.runNext();
      queue.reset();
      probe.submitAll(['delete-one']);
      logStep('running-reset', started + ' pending=' + String(queue.pending.length));
      expect(started).assertEqual('batch-insert');
      expect(queue.running.length).assertEqual(0);
      expect(queue.pending.length).assertEqual(1);
      expect(queue.size()).assertEqual(1);
      expect(queue.failed.length).assertEqual(0);
      expect(queue.completed.length).assertEqual(0);
    });

    /**
     * @tc.name   fingerprintChangesAcrossResetRebuild
     * @tc.desc   The manager fingerprint differs between the seeded state and the rebuilt state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintChangesAcrossResetRebuild', 0, () => {
      probe.rebuild(createSeedContacts());
      const seeded: number = probe.metrics().fingerprint();
      store.reset();
      resetContactManager();
      probe.rebuild(createSeedContacts().slice(0, 4));
      const rebuilt: number = probe.metrics().fingerprint();
      logStep('fingerprint-change', String(seeded) + '/' + String(rebuilt));
      expect(seeded === rebuilt).assertFalse();
      expect(probe.metrics().total).assertEqual(4);
      expect(probe.metrics().uniqueNames).assertEqual(4);
      expect(probe.storeMetrics().total).assertEqual(4);
    });

    /**
     * @tc.name   defaultsRestoredOnFreshStore
     * @tc.desc   A brand new StoreDouble has the same field defaults as a reset one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultsRestoredOnFreshStore', 0, () => {
      const fresh = new StoreDouble();
      const used = new StoreDouble();
      used.init(true);
      used.batchInsert(true, createSeedContacts().slice(0, 3));
      used.reset();
      logStep('defaults', probe.counters());
      expect(fresh.initCalls).assertEqual(used.initCalls);
      expect(fresh.createTableCalls).assertEqual(used.createTableCalls);
      expect(fresh.initialized).assertEqual(used.initialized);
      expect(fresh.lastContextValid).assertEqual(used.lastContextValid);
      expect(fresh.rowCount()).assertEqual(used.rowCount());
      expect(fresh.queryCalls).assertEqual(used.queryCalls);
    });

    /**
     * @tc.name   managerDeleteAfterResetIsNoop
     * @tc.desc   Deleting from an empty cache changes nothing and keeps it empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerDeleteAfterResetIsNoop', 0, () => {
      resetContactManager();
      manager.deleteContact(createSeedContacts()[0]);
      logStep('delete-noop', String(manager.getContacts().length));
      expect(manager.getContacts().length).assertEqual(0);
      expect(manager.getContacts()).assertDeepEquals(new Array<Contact>());
      manager.addContact(createSeedContacts()[1]);
      expect(manager.getContacts().length).assertEqual(1);
      expect(manager.getContacts()[0].name).assertEqual('阿诺德');
    });

    /**
     * @tc.name   managerAndStoreResetAreIndependent
     * @tc.desc   Resetting the store leaves the cache untouched, and resetting the cache leaves the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerAndStoreResetAreIndependent', 0, () => {
      probe.rebuild(createSeedContacts());
      store.reset();
      logStep('store-only-reset', String(manager.getContacts().length) + '/' + String(store.rowCount()));
      expect(manager.getContacts().length).assertEqual(15);
      expect(store.rowCount()).assertEqual(0);
      probe.rebuild(createSeedContacts().slice(0, 5));
      resetContactManager();
      expect(manager.getContacts().length).assertEqual(0);
      expect(store.rowCount()).assertEqual(5);
      expect(store.names()[0]).assertEqual('艾德里安');
    });

    /**
     * @tc.name   metricsAfterRebuildMatchSeedMetrics
     * @tc.desc   Rebuilding with the seed reproduces the metrics of a store seeded without a reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsAfterRebuildMatchSeedMetrics', 0, () => {
      const baseline: StoreDouble = new StoreDouble();
      baseline.batchInsert(true, createSeedContacts());
      const baselineMetrics: ContactMetrics = ContactMetrics.from(baseline.rows);
      probe.rebuild(createSeedContacts().slice(0, 2));
      store.reset();
      probe.rebuild(createSeedContacts());
      const rebuiltMetrics: ContactMetrics = probe.storeMetrics();
      logStep('metrics-match', String(rebuiltMetrics.total));
      expect(rebuiltMetrics.total).assertEqual(15);
      expect(rebuiltMetrics.uniqueNames).assertEqual(baselineMetrics.uniqueNames);
      expect(rebuiltMetrics.categories).assertEqual(6);
      expect(rebuiltMetrics.fingerprint()).assertEqual(baselineMetrics.fingerprint());
      expect(rebuiltMetrics.duplicateNames).assertEqual(baselineMetrics.duplicateNames);
    });

    /**
     * @tc.name   queueRefillAfterResetCountsFromZero
     * @tc.desc   Work submitted after a reset starts a brand new completion trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('queueRefillAfterResetCountsFromZero', 0, () => {
      probe.submitAll(['query-all', 'insert-one']);
      queue.drain();
      queue.reset();
      probe.submitAll(['delete-one', 'update-one']);
      const drained: number = queue.drain();
      logStep('refill', queue.trace());
      expect(drained).assertEqual(2);
      expect(queue.trace()).assertEqual('delete-one>update-one');
      expect(queue.completed.length).assertEqual(2);
      expect(queue.completionOrder.length).assertEqual(2);
      expect(probe.queueEmpty()).assertTrue();
    });

    /**
     * @tc.name   repeatedResetCyclesKeepCountsAtOne
     * @tc.desc   Three reset and rebuild cycles each create exactly one table and one init call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedResetCyclesKeepCountsAtOne', 0, () => {
      for (let round = 0; round < 3; round++) {
        probe.store.reset();
        probe.store.batchInsert(true, createSeedContacts().slice(0, 3));
        logStep('cycle', 'round=' + String(round) + ' init=' + String(probe.store.initCalls));
      }
      const cycles: number = probe.store.initCalls;
      expect(cycles).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(3);
      expect(store.batchCalls).assertEqual(1);
      expect(probe.allCountersZero()).assertFalse();
    });

    /**
     * @tc.name   schemaConstantSurvivesReset
     * @tc.desc   The table name and CREATE TABLE literal are unaffected by any number of resets.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('schemaConstantSurvivesReset', 0, () => {
      const before: string = SQL_CREATE_CONTACT;
      store.reset();
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      store.reset();
      logStep('schema', TABLE_CONTACT);
      expect(TABLE_CONTACT).assertEqual('contact');
      expect(SQL_CREATE_CONTACT).assertEqual(before);
      expect(SQL_CREATE_CONTACT.indexOf('CREATE TABLE IF NOT EXISTS')).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertFalse();
    });

    /**
     * @tc.name   storeResetAllowsDifferentPayload
     * @tc.desc   After a reset the store accepts a payload of a different size and shape.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeResetAllowsDifferentPayload', 0, () => {
      store.batchInsert(true, createSeedContacts());
      store.reset();
      const replacement: Contact[] = [
        contactOf('替换甲', '13111111111', 'a@example.com', '甲地', '', 'A'),
        contactOf('替换乙', '13222222222', 'b@example.com', '乙地', '', 'B'),
        contactOf('替换丙', '13333333333', 'c@example.com', '丙地', '', 'C')
      ];
      const written: number = store.batchInsert(true, replacement);
      logStep('replacement', joined(store.names(), ','));
      expect(written).assertEqual(3);
      expect(store.rowCount()).assertEqual(3);
      expect(sameStringArray(store.names(), ['替换甲', '替换乙', '替换丙'])).assertTrue();
      expect(countOf(store.names(), '艾德里安')).assertEqual(0);
      expect(store.rows[2].category).assertEqual('C');
    });

    /**
     * @tc.name   managerUpdateAfterResetFindsNoRow
     * @tc.desc   Updating a cleared cache inserts nothing and keeps the list empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerUpdateAfterResetFindsNoRow', 0, () => {
      resetContactManager();
      const edited: Contact = contactOf('艾德里安', '10000000001', 'ghost@example.com', '幽灵地址', '', 'A');
      manager.updateContact(edited);
      logStep('update-noop', String(manager.getContacts().length));
      expect(manager.getContacts().length).assertEqual(0);
      expect(contactNames(manager.getContacts()).indexOf('艾德里安')).assertEqual(-1);
      manager.addContact(edited);
      expect(manager.getContacts().length).assertEqual(1);
      expect(manager.getContacts()[0].email).assertEqual('ghost@example.com');
    });

    /**
     * @tc.name   probeCountersStringAfterFreshStore
     * @tc.desc   The probe counter string reports six zeros for a freshly constructed store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('probeCountersStringAfterFreshStore', 0, () => {
      const freshProbe: ResetProbe = new ResetProbe(resetContactManager(), new StoreDouble(), new TaskPoolQueue());
      logStep('fresh-counters', freshProbe.counters());
      expect(freshProbe.counters()).assertEqual('0/0/0/0/0/0');
      expect(freshProbe.allCountersZero()).assertTrue();
      expect(freshProbe.queueEmpty()).assertTrue();
      expect(freshProbe.metrics().total).assertEqual(0);
      expect(freshProbe.storeMetrics().total).assertEqual(0);
      expect(freshProbe.store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   resetStoreDropsRowReferences
     * @tc.desc   A reset replaces the row array, so a previously captured reference stays empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('resetStoreDropsRowReferences', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      const capturedRef: Contact[] = store.rows;
      const capturedLength: number = capturedRef.length;
      store.reset();
      logStep('row-ref', String(capturedLength) + '/' + String(store.rows.length));
      expect(capturedLength).assertEqual(4);
      expect(store.rows.length).assertEqual(0);
      expect(store.rows === capturedRef).assertFalse();
      expect(store.names().length).assertEqual(0);
      expect(store.initCalls).assertEqual(0);
    });

    /**
     * @tc.name   duplicateMetricsRestoredAfterRebuild
     * @tc.desc   The seed contains repeated names, and a rebuild reproduces the duplicate count exactly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateMetricsRestoredAfterRebuild', 0, () => {
      probe.rebuild(createSeedContacts());
      const first: ContactMetrics = probe.metrics();
      store.reset();
      resetContactManager();
      probe.rebuild(createSeedContacts());
      const second: ContactMetrics = probe.metrics();
      logStep('duplicates', String(second.duplicateNames));
      expect(first.duplicateNames).assertEqual(second.duplicateNames);
      expect(second.duplicateNames).assertEqual(0);
      expect(second.uniqueNames).assertEqual(15);
      expect(second.categories).assertEqual(6);
      expect(first.fingerprint()).assertEqual(second.fingerprint());
    });

    /**
     * @tc.name   queueResetAfterFailureAllowsFreshDrain
     * @tc.desc   A queue that recorded a failure still drains correctly once it is reset and refilled.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queueResetAfterFailureAllowsFreshDrain', 0, () => {
      probe.submitAll(['query-all']);
      const failedName: string = queue.runNext();
      queue.fail(failedName);
      queue.reset();
      probe.submitAll(['batch-insert', 'query-all']);
      const drained: number = queue.drain();
      logStep('failure-reset', queue.trace());
      expect(queue.failed.length).assertEqual(0);
      expect(drained).assertEqual(2);
      expect(queue.trace()).assertEqual('batch-insert>query-all');
      expect(queue.completed.length).assertEqual(2);
      expect(probe.queueEmpty()).assertTrue();
      expect(queue.size()).assertEqual(0);
    });

    /**
     * @tc.name   resetClearsBothHoldersInOneStep
     * @tc.desc   Clearing the manager and the store together leaves two empty holders with zero counters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetClearsBothHoldersInOneStep', 0, () => {
      probe.rebuild(createSeedContacts());
      resetContactManager();
      store.reset();
      const cacheAfter: number = manager.getContacts().length;
      const rowsAfter: number = store.rowCount();
      logStep('both-holders', String(cacheAfter) + '/' + String(rowsAfter));
      expect(cacheAfter).assertEqual(0);
      expect(rowsAfter).assertEqual(0);
      expect(sameStringArray(contactNames(store.rows), contactNames(manager.getContacts()))).assertTrue();
      expect(probe.allCountersZero()).assertTrue();
      expect(store.initialized).assertFalse();
    });

    /**
     * @tc.name   managerResetKeepsDuplicateSeedRows
     * @tc.desc   A seeded reset keeps both duplicate rows, and the next unseeded reset clears them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerResetKeepsDuplicateSeedRows', 0, () => {
      const source: Contact = createSeedContacts()[2];
      manager = resetContactManager([source, cloneContact(source)]);
      const duplicateCount: number = countOf(contactNames(manager.getContacts()), '贝拉');
      resetContactManager([source]);
      const singleCount: number = manager.getContacts().length;
      resetContactManager();
      logStep('duplicate-reset', String(duplicateCount) + '/' + String(singleCount));
      expect(duplicateCount).assertEqual(2);
      expect(singleCount).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(manager === ContactManager.getInstance()).assertTrue();
    });

    /**
     * @tc.name   resetThenReuseCounterTuple
     * @tc.desc   After a reset one batch and one query produce a clean init, query and batch tuple.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetThenReuseCounterTuple', 0, () => {
      probe.rebuild(createSeedContacts().slice(0, 3));
      store.reset();
      resetContactManager();
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      store.query(true);
      logStep('reuse-tuple', probe.counters());
      expect(probe.counters()).assertEqual('1/1/0/1/0/0');
      expect(store.rowCount()).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(0);
      expect(store.initialized).assertTrue();
    });

    /**
     * @tc.name   queueResetIsIdempotentOnEmptyQueue
     * @tc.desc   Resetting an already empty queue three times keeps size zero and yields no next task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StateResetLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('queueResetIsIdempotentOnEmptyQueue', 0, () => {
      queue.reset();
      queue.reset();
      queue.reset();
      logStep('idempotent-reset', String(queue.size()));
      expect(queue.size()).assertEqual(0);
      expect(queue.pending.length).assertEqual(0);
      expect(queue.completionOrder.length).assertEqual(0);
      expect(queue.runNext()).assertEqual('');
      expect(queue.drain()).assertEqual(0);
    });
  });
}
