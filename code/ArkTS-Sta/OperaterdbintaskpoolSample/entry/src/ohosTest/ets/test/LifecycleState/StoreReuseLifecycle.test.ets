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
 * StoreReuseLifecycle proves that one DatabaseConnection instance survives every
 * operation the page issues:
 *
 *   DatabaseConnection.ets:57-62   the connection is a lazy singleton
 *   DatabaseConnection.ets:69-89   the existing store short circuits re-initialization
 *   DatabaseConnection.ets:139-181 batch insert reuses the store when present
 *   DatabaseConnection.ets:187-221 insert appends through ON_CONFLICT_REPLACE
 *   DatabaseConnection.ets:226-236 delete by name
 *   DatabaseConnection.ets:241-272 update phone, email and address by name
 *   DatabaseConnection.ets:116-134 query returns copies of the stored rows
 *
 * ReuseTrace records the row count after each step so continuity can be checked
 * as a sequence rather than as isolated expectations.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  StoreDouble,
  ContactMetrics,
  ContactMapper,
  Bucket,
  CONFLICT_REPLACE,
  createSeedContacts,
  contactOf,
  cloneContact,
  contactNames,
  joined,
  countOf,
  sameStringArray,
  resetContactManager,
  SearchEngine,
  snapshotsOf,
  sameSnapshotArray,
  textFingerprint
} from '../Shared/SharedDriver';

/** Records the row count and the counters after each store step. */
class ReuseTrace {
  public steps: string[] = [];
  public counts: number[] = [];
  public batchCounts: number[] = [];

  public recordStep(label: string, store: StoreDouble): void {
    this.steps.push(label);
    this.counts.push(store.rowCount());
    this.batchCounts.push(store.batchCalls);
  }

  public size(): number {
    return this.steps.length;
  }

  public trace(): string {
    return joined(this.steps, '>');
  }

  public countTrace(): string {
    const text: string[] = [];
    for (let index = 0; index < this.counts.length; index++) {
      text.push(String(this.counts[index]));
    }
    return joined(text, ',');
  }

  public lastCount(): number {
    return this.counts[this.counts.length - 1];
  }

  public countGrowsMonotonically(): boolean {
    for (let index = 1; index < this.counts.length; index++) {
      if (this.counts[index] < this.counts[index - 1]) {
        return false;
      }
    }
    return true;
  }

  public totalBatchCalls(): number {
    return this.batchCounts[this.batchCounts.length - 1];
  }
}

/** Seeds a store lazily through one batch call. */
function seeded(rows: Contact[]): StoreDouble {
  const store = new StoreDouble();
  store.batchInsert(true, rows);
  return store;
}

/** A contact used for the append steps. */
function appended(name: string, phone: string, category: string): Contact {
  return contactOf(name, phone, name + '@example.com', '新增地址', '', category);
}

/** Compact counter string for reuse assertions. */
function probeCounters(store: StoreDouble): string {
  return String(store.initCalls) + '/' + String(store.queryCalls) + '/' + String(store.batchCalls) + '/' +
    String(store.insertCalls) + '/' + String(store.updateCalls) + '/' + String(store.deleteCalls);
}

export default function storeReuseLifecycleTest(): void {
  describe('StoreReuseLifecycle', () => {
    let store: StoreDouble = new StoreDouble();
    let manager: ContactManager = resetContactManager();
    let trace: ReuseTrace = new ReuseTrace();

    beforeAll(() => {
      logSuite('StoreReuseLifecycle', 'begin');
    });

    beforeEach(async () => {
      manager = resetContactManager();
      store = new StoreDouble();
      trace = new ReuseTrace();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('StoreReuseLifecycle', 'end');
    });

    /**
     * @tc.name   oneStoreServesBatchAndQuery
     * @tc.desc   A single store accepts the batch write and answers the following query with the same rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('oneStoreServesBatchAndQuery', 0, () => {
      const written: number = store.batchInsert(true, createSeedContacts());
      const visible: Contact[] = store.query(true);
      logStep('batch-query', String(written) + '/' + String(visible.length));
      expect(written).assertEqual(15);
      expect(visible.length).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(store.batchCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
    });

    /**
     * @tc.name   initCallsStayOneAcrossOperations
     * @tc.desc   Five different operations over one store perform exactly one initialization.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('initCallsStayOneAcrossOperations', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 6));
      store.query(true);
      store.insert(true, appended('林岸', '13800138000', 'A'), CONFLICT_REPLACE);
      store.updateContact(createSeedContacts()[0]);
      store.deleteByName('贝拉');
      logStep('init-one', String(store.initCalls));
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(6);
    });

    /**
     * @tc.name   createTableCallsStayOne
     * @tc.desc   The table step runs once even after every mutation path has been exercised.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('createTableCallsStayOne', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      store.batchInsert(true, createSeedContacts().slice(4, 7));
      store.insert(true, appended('苏木', '13922223333', 'D'), CONFLICT_REPLACE);
      store.updateContact(createSeedContacts()[0]);
      store.deleteByName('阿诺德');
      store.query(true);
      logStep('table-one', String(store.createTableCalls));
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(7);
    });

    /**
     * @tc.name   batchThenInsertRowCountGrows
     * @tc.desc   A batch of five followed by one insert leaves six rows in one reused store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchThenInsertRowCountGrows', 0, () => {
      const written: number = store.batchInsert(true, createSeedContacts().slice(0, 5));
      trace.recordStep('batch', store);
      const returned: number = store.insert(true, appended('林岸', '13800138000', 'A'), CONFLICT_REPLACE);
      trace.recordStep('insert', store);
      logStep('grow', trace.countTrace());
      expect(written).assertEqual(5);
      expect(returned).assertEqual(6);
      expect(store.rowCount()).assertEqual(6);
      expect(trace.countGrowsMonotonically()).assertTrue();
      expect(trace.lastCount()).assertEqual(6);
    });

    /**
     * @tc.name   insertThenUpdateKeepsRowCount
     * @tc.desc   Updating a row replaces values in place, so the count does not change.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertThenUpdateKeepsRowCount', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      store.insert(true, appended('闻笛', '13911112222', 'C'), CONFLICT_REPLACE);
      const before: number = store.rowCount();
      const affected: number = store.updateContact(contactOf('闻笛', '13911113333', 'wendi.new@example.com', '浙江省杭州市西湖区', '', 'C'));
      logStep('update-count', String(before) + '/' + String(store.rowCount()));
      expect(before).assertEqual(4);
      expect(affected).assertEqual(1);
      expect(store.rowCount()).assertEqual(4);
      expect(store.rows[3].phone).assertEqual('13911113333');
      expect(store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   updateThenDeleteReducesRowCount
     * @tc.desc   A delete after an update removes one row and leaves the remaining three intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateThenDeleteReducesRowCount', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      store.updateContact(createSeedContacts()[0]);
      const removed: number = store.deleteByName('本');
      logStep('delete-count', String(removed) + '/' + String(store.rowCount()));
      expect(removed).assertEqual(1);
      expect(store.rowCount()).assertEqual(3);
      expect(store.names()[0]).assertEqual('艾德里安');
      expect(store.names()[2]).assertEqual('贝拉');
      expect(store.deleteCalls).assertEqual(1);
    });

    /**
     * @tc.name   deleteByNameRemovesAllMatchingRows
     * @tc.desc   Two rows share a name, and one delete call removes both of them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteByNameRemovesAllMatchingRows', 0, () => {
      store.batchInsert(true, [
        contactOf('贝拉', '11111111111', 'bella@example.com', '湖北省武汉市江汉区', '', 'B'),
        contactOf('贝拉', '12222222222', 'bella.alt@example.com', '湖北省武汉市江汉区', '', 'B'),
        createSeedContacts()[3]
      ]);
      const before: number = store.rowCount();
      const removed: number = store.deleteByName('贝拉');
      logStep('delete-dupes', String(before) + ' removed=' + String(removed));
      expect(before).assertEqual(3);
      expect(removed).assertEqual(2);
      expect(store.rowCount()).assertEqual(1);
      expect(countOf(store.names(), '贝拉')).assertEqual(0);
      expect(store.names()[0]).assertEqual('本');
    });

    /**
     * @tc.name   queryDoesNotChangeRowCount
     * @tc.desc   Three queries leave the row count and the stored values untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryDoesNotChangeRowCount', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      const first: Contact[] = store.query(true);
      const second: Contact[] = store.query(true);
      const third: Contact[] = store.query(true);
      logStep('query-three', String(store.queryCalls));
      expect(store.queryCalls).assertEqual(3);
      expect(first.length).assertEqual(5);
      expect(second.length).assertEqual(5);
      expect(third.length).assertEqual(5);
      expect(store.rowCount()).assertEqual(5);
      expect(store.updateCalls).assertEqual(0);
    });

    /**
     * @tc.name   batchCounterTracksCalls
     * @tc.desc   Each batch insert increments batchCalls without re-initializing the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchCounterTracksCalls', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      store.batchInsert(true, createSeedContacts().slice(2, 5));
      store.batchInsert(true, createSeedContacts().slice(5, 6));
      logStep('batch-calls', String(store.batchCalls));
      expect(store.batchCalls).assertEqual(3);
      expect(store.rowCount()).assertEqual(6);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.names()[5]).assertEqual('卡梅隆');
    });

    /**
     * @tc.name   insertCounterTracksCalls
     * @tc.desc   Repeated inserts through the same store advance insertCalls one per call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertCounterTracksCalls', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 1));
      store.insert(true, appended('林岸', '13800138000', 'A'), CONFLICT_REPLACE);
      store.insert(true, appended('闻笛', '13911112222', 'C'), CONFLICT_REPLACE);
      store.insert(true, appended('苏木', '13922223333', 'D'), CONFLICT_REPLACE);
      logStep('insert-calls', String(store.insertCalls));
      expect(store.insertCalls).assertEqual(3);
      expect(store.rowCount()).assertEqual(4);
      expect(store.names()[3]).assertEqual('苏木');
      expect(store.insert(true, appended('重复', '13933334444', 'E'), CONFLICT_REPLACE)).assertEqual(5);
      expect(store.rowCount()).assertEqual(5);
    });

    /**
     * @tc.name   updateCounterTracksCalls
     * @tc.desc   Every update call counts once, even when no row matches the name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateCounterTracksCalls', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      store.updateContact(createSeedContacts()[0]);
      store.updateContact(contactOf('不存在', '10000000000', 'none@example.com', '未知'));
      store.updateContact(createSeedContacts()[1]);
      logStep('update-calls', String(store.updateCalls));
      expect(store.updateCalls).assertEqual(3);
      expect(store.rowCount()).assertEqual(3);
      expect(store.rows[0].name).assertEqual('艾德里安');
      expect(countOf(store.names(), '不存在')).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
    });

    /**
     * @tc.name   deleteCounterTracksCalls
     * @tc.desc   Delete calls are counted even when the requested name is absent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteCounterTracksCalls', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      const first: number = store.deleteByName('本');
      const second: number = store.deleteByName('未登记');
      logStep('delete-calls', String(first) + '/' + String(second));
      expect(first).assertEqual(1);
      expect(second).assertEqual(0);
      expect(store.deleteCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(3);
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   queryCounterTracksCalls
     * @tc.desc   Query calls are counted independently of how many rows are visible.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryCounterTracksCalls', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      store.query(true);
      store.query(false);
      store.query(true);
      store.query(false);
      logStep('query-calls', String(store.queryCalls));
      expect(store.queryCalls).assertEqual(4);
      expect(store.rowCount()).assertEqual(2);
      expect(store.initCalls).assertEqual(1);
      expect(store.names()[1]).assertEqual('阿诺德');
      expect(store.query(true).length).assertEqual(2);
    });

    /**
     * @tc.name   rowCountContinuityAcrossMixedSequence
     * @tc.desc   The traced row count follows the expected batch, insert, delete and update sequence.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rowCountContinuityAcrossMixedSequence', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      trace.recordStep('batch', store);
      store.insert(true, appended('林岸', '13800138000', 'A'), CONFLICT_REPLACE);
      trace.recordStep('insert', store);
      store.updateContact(createSeedContacts()[0]);
      trace.recordStep('update', store);
      store.deleteByName('本');
      trace.recordStep('delete', store);
      store.insert(true, appended('闻笛', '13911112222', 'C'), CONFLICT_REPLACE);
      trace.recordStep('insert2', store);
      logStep('sequence', trace.countTrace());
      expect(trace.trace()).assertEqual('batch>insert>update>delete>insert2');
      expect(trace.countTrace()).assertEqual('5,6,6,5,6');
      expect(trace.lastCount()).assertEqual(6);
      expect(trace.size()).assertEqual(5);
      expect(trace.countGrowsMonotonically()).assertFalse();
    });

    /**
     * @tc.name   namesStayInInsertionOrder
     * @tc.desc   Batch, insert and update steps never reorder the stored names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('namesStayInInsertionOrder', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      store.insert(true, appended('林岸', '13800138000', 'A'), CONFLICT_REPLACE);
      store.updateContact(createSeedContacts()[1]);
      store.deleteByName('贝拉');
      logStep('order', joined(store.names(), ','));
      expect(sameStringArray(store.names(), ['艾德里安', '阿诺德', '本', '林岸'])).assertTrue();
      expect(store.rowCount()).assertEqual(4);
      expect(store.names()[3]).assertEqual('林岸');
      expect(store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   batchAfterInsertAppendsAtEnd
     * @tc.desc   A batch issued after a single insert appends its rows behind the inserted row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchAfterInsertAppendsAtEnd', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      store.insert(true, appended('林岸', '13800138000', 'A'), CONFLICT_REPLACE);
      const written: number = store.batchInsert(true, createSeedContacts().slice(2, 5));
      logStep('append', joined(store.names(), ','));
      expect(written).assertEqual(3);
      expect(store.rowCount()).assertEqual(6);
      expect(store.names()[2]).assertEqual('林岸');
      expect(store.names()[3]).assertEqual('贝拉');
      expect(store.names()[5]).assertEqual('本杰明');
    });

    /**
     * @tc.name   updateAffectsOnlyMatchingName
     * @tc.desc   Updating one name rewrites its phone but leaves the other rows byte identical.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateAffectsOnlyMatchingName', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const neighbourPhone: string = store.rows[2].phone;
      const affected: number = store.updateContact(
        contactOf('阿诺德', '16600006666', 'arnold.new@example.com', '上海市黄浦区', '', 'A'));
      logStep('update-scope', String(affected));
      expect(affected).assertEqual(1);
      expect(store.rows[1].phone).assertEqual('16600006666');
      expect(store.rows[0].phone).assertEqual('13333333333');
      expect(store.rows[2].phone).assertEqual(neighbourPhone);
      expect(store.rowCount()).assertEqual(3);
    });

    /**
     * @tc.name   updateDoesNotInsertMissingName
     * @tc.desc   An update for an absent name returns zero and does not append a new row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateDoesNotInsertMissingName', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const affected: number = store.updateContact(
        contactOf('未登记', '13500001111', 'ghost@example.com', '未知', '', 'A'));
      logStep('missing-update', String(affected));
      expect(affected).assertEqual(0);
      expect(store.rowCount()).assertEqual(3);
      expect(store.insertCalls).assertEqual(0);
      expect(countOf(store.names(), '未登记')).assertEqual(0);
      expect(store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   deleteUnknownNameReturnsZero
     * @tc.desc   Deleting a name that is not present is a no-op that still counts the call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteUnknownNameReturnsZero', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      const removed: number = store.deleteByName('幽灵');
      logStep('unknown-delete', String(removed));
      expect(removed).assertEqual(0);
      expect(store.rowCount()).assertEqual(5);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.names()[4]).assertEqual('本杰明');
    });

    /**
     * @tc.name   queryReturnsIndependentCopies
     * @tc.desc   Mutating a query result does not change the store, and a later query still sees the originals.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryReturnsIndependentCopies', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const first: Contact[] = store.query(true);
      first[0].phone = '10000000077';
      first.splice(1, 1);
      const second: Contact[] = store.query(true);
      logStep('copy', String(second.length) + '/' + second[0].phone);
      expect(second.length).assertEqual(3);
      expect(second[0].phone).assertEqual('13333333333');
      expect(store.rows[0].phone).assertEqual('13333333333');
      expect(store.rowCount()).assertEqual(3);
      expect(store.queryCalls).assertEqual(2);
    });

    /**
     * @tc.name   mixedSequenceFingerprintDeterministic
     * @tc.desc   Replaying the same mixed sequence on two stores produces the same row fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mixedSequenceFingerprintDeterministic', 0, () => {
      const other: StoreDouble = new StoreDouble();
      const payload: Contact[] = createSeedContacts().slice(0, 4);
      store.batchInsert(true, payload);
      other.batchInsert(true, payload);
      store.insert(true, appended('林岸', '13800138000', 'A'), CONFLICT_REPLACE);
      other.insert(true, appended('林岸', '13800138000', 'A'), CONFLICT_REPLACE);
      store.deleteByName('本');
      other.deleteByName('本');
      const first: number = textFingerprint(joined(store.names(), ','));
      const second: number = textFingerprint(joined(other.names(), ','));
      logStep('replay', String(first));
      expect(first).assertEqual(second);
      expect(store.rowCount()).assertEqual(other.rowCount());
      expect(sameStringArray(store.names(), other.names())).assertTrue();
      expect(store.batchCalls).assertEqual(other.batchCalls);
    });

    /**
     * @tc.name   storeRowsMatchManagerAfterReload
     * @tc.desc   After a reload the cached manager rows equal the store rows snapshot by snapshot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeRowsMatchManagerAfterReload', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 6));
      store.insert(true, appended('林岸', '13800138000', 'A'), CONFLICT_REPLACE);
      store.deleteByName('贝拉');
      manager = resetContactManager(store.query(true));
      logStep('reload-parity', String(manager.getContacts().length));
      expect(manager.getContacts().length).assertEqual(store.rowCount());
      expect(sameSnapshotArray(snapshotsOf(store.rows), snapshotsOf(manager.getContacts()))).assertTrue();
      expect(store.rowCount()).assertEqual(6);
      expect(countOf(contactNames(manager.getContacts()), '贝拉')).assertEqual(0);
    });

    /**
     * @tc.name   resetThenReuseStartsCountersOver
     * @tc.desc   A reset store reused for a new batch starts every counter from zero again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetThenReuseStartsCountersOver', 0, () => {
      store.batchInsert(true, createSeedContacts());
      store.query(true);
      store.deleteByName('本');
      store.reset();
      const written: number = store.batchInsert(true, createSeedContacts().slice(0, 2));
      logStep('reuse-reset', probeCounters(store));
      expect(written).assertEqual(2);
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(1);
    });

    /**
     * @tc.name   rowCountFormulaHolds
     * @tc.desc   Row count equals batch rows plus inserts minus deleted matches at every checkpoint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rowCountFormulaHolds', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      store.insert(true, appended('林岸', '13800138000', 'A'), CONFLICT_REPLACE);
      store.insert(true, appended('闻笛', '13911112222', 'C'), CONFLICT_REPLACE);
      const removed: number = store.deleteByName('本');
      logStep('formula', '5+2-' + String(removed) + '=' + String(store.rowCount()));
      expect(removed).assertEqual(1);
      expect(store.rowCount()).assertEqual(5 + 2 - removed);
      expect(store.insertCalls).assertEqual(2);
      expect(store.batchCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(6);
    });

    /**
     * @tc.name   batchOfEmptyArrayKeepsCount
     * @tc.desc   An empty batch still counts as a call but adds no rows to the reused store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('batchOfEmptyArrayKeepsCount', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const before: number = store.rowCount();
      const written: number = store.batchInsert(true, []);
      logStep('empty-batch', String(before) + ' written=' + String(written));
      expect(written).assertEqual(0);
      expect(store.rowCount()).assertEqual(before);
      expect(store.batchCalls).assertEqual(2);
      expect(store.initCalls).assertEqual(1);
      expect(store.names()[2]).assertEqual('贝拉');
    });

    /**
     * @tc.name   insertWithConflictReplaceAppendsRow
     * @tc.desc   ON_CONFLICT_REPLACE cannot deduplicate because the bucket carries no id, so a row is appended.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertWithConflictReplaceAppendsRow', 0, () => {
      const first: Contact = createSeedContacts()[0];
      store.batchInsert(true, [first]);
      const returned: number = store.insert(true, cloneContact(first), CONFLICT_REPLACE);
      logStep('conflict-replace', String(returned));
      expect(returned).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
      expect(countOf(store.names(), first.name)).assertEqual(2);
      expect(store.rows[0].phone).assertEqual(store.rows[1].phone);
      expect(store.insertCalls).assertEqual(1);
    });

    /**
     * @tc.name   multipleBatchesKeepSingleInit
     * @tc.desc   Four batches over one store share the initialization and the table creation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('multipleBatchesKeepSingleInit', 0, () => {
      for (let round = 0; round < 4; round++) {
        store.batchInsert(true, createSeedContacts().slice(round * 2, round * 2 + 2));
        trace.recordStep('batch-' + String(round), store);
      }
      logStep('four-batches', 'init=' + String(store.initCalls) + ' rows=' + String(store.rowCount()));
      expect(store.batchCalls).assertEqual(4);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(8);
      expect(trace.totalBatchCalls()).assertEqual(4);
      expect(trace.countGrowsMonotonically()).assertTrue();
    });

    /**
     * @tc.name   storeReuseAcrossTenOperations
     * @tc.desc   Ten operations over one store keep a single initialization and a predictable count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeReuseAcrossTenOperations', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      store.query(true);
      store.insert(true, appended('林岸', '13800138000', 'A'), CONFLICT_REPLACE);
      store.updateContact(createSeedContacts()[0]);
      store.deleteByName('本');
      store.batchInsert(true, createSeedContacts().slice(5, 7));
      store.query(true);
      store.insert(true, appended('闻笛', '13911112222', 'C'), CONFLICT_REPLACE);
      store.updateContact(createSeedContacts()[1]);
      store.query(true);
      logStep('ten-ops', probeCounters(store));
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(2);
      expect(store.insertCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(8);
      expect(store.queryCalls).assertEqual(3);
    });

    /**
     * @tc.name   queryAfterDeleteOmitsRow
     * @tc.desc   A query issued after a delete no longer returns the removed row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryAfterDeleteOmitsRow', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const before: Contact[] = store.query(true);
      store.deleteByName('贝拉');
      const after: Contact[] = store.query(true);
      logStep('delete-query', String(before.length) + '->' + String(after.length));
      expect(before.length).assertEqual(3);
      expect(after.length).assertEqual(2);
      expect(countOf(contactNames(after), '贝拉')).assertEqual(0);
      expect(after[1].name).assertEqual('阿诺德');
      expect(store.rowCount()).assertEqual(2);
    });

    /**
     * @tc.name   updateTwiceLastValueWins
     * @tc.desc   Two updates on the same name leave the second value in both the row and the query.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateTwiceLastValueWins', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      store.updateContact(contactOf('阿诺德', '16600001111', 'first@example.com', '上海市浦东新区', '', 'A'));
      const middle: string = store.query(true)[1].phone;
      store.updateContact(contactOf('阿诺德', '16600002222', 'second@example.com', '上海市静安区', '', 'A'));
      const last: string = store.query(true)[1].email;
      logStep('last-wins', middle + '->' + last);
      expect(middle).assertEqual('16600001111');
      expect(last).assertEqual('second@example.com');
      expect(store.query(true)[1].phone).assertEqual('16600002222');
      expect(store.updateCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
    });

    /**
     * @tc.name   namesListMatchesRowCount
     * @tc.desc   The names helper always returns exactly one entry per stored row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('namesListMatchesRowCount', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      store.insert(true, appended('林岸', '13800138000', 'A'), CONFLICT_REPLACE);
      const names: string[] = store.names();
      logStep('names-count', String(names.length) + '/' + String(store.rowCount()));
      expect(names.length).assertEqual(5);
      expect(names.length).assertEqual(store.rowCount());
      expect(names.length).assertEqual(store.query(true).length);
      expect(names[4]).assertEqual('林岸');
      expect(names.length).assertEqual(contactNames(store.rows).length);
    });

    /**
     * @tc.name   fingerprintChangesAfterMutation
     * @tc.desc   A mutation changes the row-name fingerprint while a read does not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintChangesAfterMutation', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      const before: number = textFingerprint(joined(store.names(), ','));
      store.query(true);
      const afterRead: number = textFingerprint(joined(store.names(), ','));
      store.deleteByName('贝拉');
      const afterDelete: number = textFingerprint(joined(store.names(), ','));
      logStep('fingerprint', String(before) + '/' + String(afterDelete));
      expect(before).assertEqual(afterRead);
      expect(before === afterDelete).assertFalse();
      expect(store.rowCount()).assertEqual(3);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   reuseAfterResetWithDifferentPayload
     * @tc.desc   A reset store handles a payload of a different size without stale rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reuseAfterResetWithDifferentPayload', 0, () => {
      store.batchInsert(true, createSeedContacts());
      store.reset();
      const replacement: Contact[] = [
        contactOf('替换甲', '13111111111', 'a@example.com', '甲地', '', 'A'),
        contactOf('替换乙', '13222222222', 'b@example.com', '乙地', '', 'B')
      ];
      const written: number = store.batchInsert(true, replacement);
      logStep('reuse-payload', joined(store.names(), ','));
      expect(written).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
      expect(countOf(store.names(), '艾德里安')).assertEqual(0);
      expect(store.names()[1]).assertEqual('替换乙');
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   countersIndependentOfRowCount
     * @tc.desc   Counter values depend on call counts, not on how many rows those calls touched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('countersIndependentOfRowCount', 0, () => {
      store.batchInsert(true, []);
      const emptyCounters: string = probeCounters(store);
      store.batchInsert(true, createSeedContacts());
      logStep('counter-independent', emptyCounters + '->' + probeCounters(store));
      expect(emptyCounters).assertEqual('1/0/1/0/0/0');
      expect(store.batchCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(15);
      expect(store.initCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(0);
    });

    /**
     * @tc.name   deleteThenReinsertAppendsAtEnd
     * @tc.desc   A name deleted and inserted again reappears at the tail with a fresh row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteThenReinsertAppendsAtEnd', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      store.deleteByName('阿诺德');
      store.insert(true, appended('阿诺德', '16600009999', 'A'), CONFLICT_REPLACE);
      logStep('reinsert', joined(store.names(), ','));
      expect(sameStringArray(store.names(), ['艾德里安', '贝拉', '阿诺德'])).assertTrue();
      expect(store.names()[2]).assertEqual('阿诺德');
      expect(store.rows[2].phone).assertEqual('16600009999');
      expect(store.rowCount()).assertEqual(3);
      expect(store.deleteCalls).assertEqual(1);
    });

    /**
     * @tc.name   metricsAfterReuseMatchRows
     * @tc.desc   Metrics computed from the reused store match the store row list exactly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsAfterReuseMatchRows', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 7));
      store.insert(true, appended('林岸', '13800138000', 'A'), CONFLICT_REPLACE);
      store.deleteByName('本');
      const metrics: ContactMetrics = ContactMetrics.from(store.query(true));
      const categories: string[] = SearchEngine.groupByCategory(store.rows);
      logStep('metrics', String(metrics.total) + '/' + String(metrics.categories));
      expect(metrics.total).assertEqual(7);
      expect(metrics.total).assertEqual(store.rowCount());
      expect(metrics.categories).assertEqual(categories.length);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.totalPhoneDigits).assertEqual(7 * 11);
    });

    /**
     * @tc.name   counterTupleAfterReusedBatchAndQuery
     * @tc.desc   The six counters read as one tuple after two batches and one query on a single store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreReuseLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('counterTupleAfterReusedBatchAndQuery', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      store.batchInsert(true, createSeedContacts().slice(3, 5));
      store.query(true);
      logStep('tuple', probeCounters(store));
      expect(probeCounters(store)).assertEqual('1/1/2/0/0/0');
      expect(store.rowCount()).assertEqual(5);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
    });
  });
}
