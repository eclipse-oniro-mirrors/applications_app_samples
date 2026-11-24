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
 * BatchInsertPerformance exercises the bulk path with payloads well above the
 * fifteen row seed used by the page:
 *
 *   DatabaseConnection.ets:139-181  one batchInsert call per payload, bucket per row
 *   DatabaseConnection.ets:150-171  the bucket keys keep a fixed name, phone, email,
 *                                   address, avatar, category order
 *   TaskPool.ets:108-117            the wrapper returns the reported row count
 *   OperateRDBInTaskPool.ets:126-135 the verification query after a batch
 *   Contact.ets:31-47               the six fields each generated row carries
 *
 * The cases assert deterministic results: counts, order, metrics and
 * fingerprints. They never assert wall clock timings, which are device bound.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  StoreDouble,
  ContactMetrics,
  CATEGORIES,
  createSeedContacts,
  contactOf,
  cloneContact,
  contactNames,
  joined,
  countOf,
  uniqueStrings,
  sameStringArray,
  textFingerprint,
  SearchEngine,
  resetContactManager,
  expectedBatchCount,
  wrappedBatchCount
} from '../Shared/SharedDriver';

/** Builds a deterministic payload of the requested size from the seeded stems. */
function buildPayload(count: number): Contact[] {
  const stems: Contact[] = createSeedContacts();
  const rows: Contact[] = [];
  for (let index = 0; index < count; index++) {
    const base: Contact = stems[index % stems.length];
    const digits: string = String(10000000000 + index);
    rows.push(contactOf(
      base.name + String(index),
      digits,
      'bulk' + String(index) + '@example.com',
      base.address,
      '',
      base.category
    ));
  }
  return rows;
}

/** Records batch call counts and row counts for a sequence of payloads. */
class BatchBench {
  public batchSizes: number[] = [];
  public rowCounts: number[] = [];
  public returned: number[] = [];

  public run(store: StoreDouble, payload: Contact[]): number {
    const count: number = store.batchInsert(true, payload);
    this.batchSizes.push(payload.length);
    this.rowCounts.push(store.rowCount());
    this.returned.push(count);
    return count;
  }

  public runTimes(): number {
    return this.batchSizes.length;
  }

  public totalRows(): number {
    return this.rowCounts.length === 0 ? 0 : this.rowCounts[this.rowCounts.length - 1];
  }

  public rowTrace(): string {
    const text: string[] = [];
    for (let index = 0; index < this.rowCounts.length; index++) {
      text.push(String(this.rowCounts[index]));
    }
    return joined(text, ',');
  }

  public everyReturnMatchesPayload(): boolean {
    if (this.returned.length !== this.batchSizes.length) {
      return false;
    }
    for (let index = 0; index < this.returned.length; index++) {
      if (this.returned[index] !== this.batchSizes[index]) {
        return false;
      }
    }
    return true;
  }
}

/** Name fingerprint for one payload, used to compare two identical runs. */
function payloadFingerprint(rows: Contact[]): number {
  return textFingerprint(joined(contactNames(rows), ','));
}

export default function batchInsertPerformanceTest(): void {
  describe('BatchInsertPerformance', () => {
    let store: StoreDouble = new StoreDouble();
    let bench: BatchBench = new BatchBench();
    let payload: Contact[] = [];

    beforeAll(() => {
      logSuite('BatchInsertPerformance', 'begin');
    });

    beforeEach(async () => {
      resetContactManager();
      store = new StoreDouble();
      bench = new BatchBench();
      payload = buildPayload(120);
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('BatchInsertPerformance', 'end');
    });

    /**
     * @tc.name   hundredRowBatchWritesAllRows
     * @tc.desc   A one hundred and twenty row payload lands in the store through one batch call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('hundredRowBatchWritesAllRows', 0, () => {
      const written: number = bench.run(store, payload);
      logStep('batch-120', String(written));
      expect(written).assertEqual(120);
      expect(store.rowCount()).assertEqual(120);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(payload.length > 100).assertTrue();
    });

    /**
     * @tc.name   hundredRowBatchReturnsPayloadLength
     * @tc.desc   The returned count equals the payload size and the bench ledger agrees.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('hundredRowBatchReturnsPayloadLength', 0, () => {
      const written: number = bench.run(store, payload);
      logStep('returned', String(written));
      expect(written).assertEqual(payload.length);
      expect(written).assertEqual(expectedBatchCount(payload));
      expect(bench.rowTrace()).assertEqual('120');
      expect(bench.everyReturnMatchesPayload()).assertTrue();
      expect(bench.totalRows()).assertEqual(120);
    });

    /**
     * @tc.name   rowOrderFollowsPayloadOrder
     * @tc.desc   The stored names reproduce the payload order without any reordering.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('rowOrderFollowsPayloadOrder', 0, () => {
      bench.run(store, payload);
      const stored: string[] = store.names();
      logStep('order-head', stored[0] + '/' + stored[1]);
      expect(stored.length).assertEqual(120);
      expect(sameStringArray(stored, contactNames(payload))).assertTrue();
      expect(stored[0]).assertEqual(payload[0].name);
      expect(stored[119]).assertEqual(payload[119].name);
      expect(stored[60]).assertEqual(payload[60].name);
    });

    /**
     * @tc.name   firstAndLastRowsMatchPayload
     * @tc.desc   The boundary rows keep every payload field, including the generated phone value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('firstAndLastRowsMatchPayload', 0, () => {
      bench.run(store, payload);
      const first: Contact = store.rows[0];
      const last: Contact = store.rows[119];
      logStep('boundaries', first.phone + '/' + last.phone);
      expect(first.name).assertEqual(payload[0].name);
      expect(first.phone).assertEqual(payload[0].phone);
      expect(first.email).assertEqual(payload[0].email);
      expect(last.name).assertEqual(payload[119].name);
      expect(last.category).assertEqual(payload[119].category);
    });

    /**
     * @tc.name   repeatedBatchesAccumulateRows
     * @tc.desc   Three fifty row batches accumulate to one hundred and fifty rows on one store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('repeatedBatchesAccumulateRows', 0, () => {
      bench.run(store, buildPayload(50));
      bench.run(store, buildPayload(50));
      bench.run(store, buildPayload(50));
      logStep('accumulate', bench.rowTrace());
      expect(bench.runTimes()).assertEqual(3);
      expect(bench.rowTrace()).assertEqual('50,100,150');
      expect(bench.totalRows()).assertEqual(150);
      expect(store.batchCalls).assertEqual(3);
      expect(bench.everyReturnMatchesPayload()).assertTrue();
    });

    /**
     * @tc.name   secondBatchDoesNotReinitialize
     * @tc.desc   A second batch reuses the initialized store instead of creating another table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondBatchDoesNotReinitialize', 0, () => {
      bench.run(store, buildPayload(100));
      const initAfterFirst: number = store.initCalls;
      bench.run(store, buildPayload(30));
      logStep('second-batch', String(initAfterFirst) + '/' + String(store.initCalls));
      expect(initAfterFirst).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(130);
      expect(store.batchCalls).assertEqual(2);
    });

    /**
     * @tc.name   threeBatchesRestoreSingleInit
     * @tc.desc   Even after three batches and a query the store keeps one init and one table step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('threeBatchesRestoreSingleInit', 0, () => {
      bench.run(store, buildPayload(40));
      bench.run(store, buildPayload(40));
      bench.run(store, buildPayload(40));
      const visible: Contact[] = store.query(true);
      logStep('single-init', String(store.initCalls) + ' rows=' + String(visible.length));
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(visible.length).assertEqual(120);
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(120);
    });

    /**
     * @tc.name   metricsTotalMatchesBatchRows
     * @tc.desc   ContactMetrics over the stored rows reports the full one hundred and twenty total.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsTotalMatchesBatchRows', 0, () => {
      bench.run(store, payload);
      const metrics: ContactMetrics = ContactMetrics.from(store.rows);
      logStep('metrics-total', String(metrics.total));
      expect(metrics.total).assertEqual(120);
      expect(metrics.total).assertEqual(store.rowCount());
      expect(metrics.uniqueNames).assertEqual(120);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.fillRatio()).assertEqual(1);
    });

    /**
     * @tc.name   metricsCategoryDistributionMatchesPayload
     * @tc.desc   Eight full seed cycles give each category its expected multiple of the payload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsCategoryDistributionMatchesPayload', 0, () => {
      bench.run(store, payload);
      const groups: string[] = SearchEngine.groupByCategory(store.rows);
      logStep('category-groups', joined(groups, ','));
      expect(groups.length).assertEqual(6);
      expect(SearchEngine.countCategory(store.rows, 'A')).assertEqual(16);
      expect(SearchEngine.countCategory(store.rows, 'B')).assertEqual(24);
      expect(SearchEngine.countCategory(store.rows, 'C')).assertEqual(24);
      expect(SearchEngine.countCategory(store.rows, 'D')).assertEqual(16);
      expect(SearchEngine.countCategory(store.rows, 'E')).assertEqual(24);
      expect(SearchEngine.countCategory(store.rows, 'F')).assertEqual(16);
    });

    /**
     * @tc.name   fingerprintStableForSamePayload
     * @tc.desc   Two stores fed the same payload produce the same name fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintStableForSamePayload', 0, () => {
      const other: StoreDouble = new StoreDouble();
      bench.run(store, payload);
      other.batchInsert(true, buildPayload(120));
      const first: number = payloadFingerprint(store.rows);
      const second: number = payloadFingerprint(other.rows);
      logStep('fingerprint-same', String(first));
      expect(first).assertEqual(second);
      expect(first > 0).assertTrue();
      expect(sameStringArray(store.names(), other.names())).assertTrue();
      expect(other.rowCount()).assertEqual(120);
    });

    /**
     * @tc.name   fingerprintDiffersForDifferentPayload
     * @tc.desc   A different payload size produces a different name fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintDiffersForDifferentPayload', 0, () => {
      bench.run(store, payload);
      const large: number = payloadFingerprint(store.rows);
      const smallStore: StoreDouble = new StoreDouble();
      smallStore.batchInsert(true, buildPayload(119));
      const small: number = payloadFingerprint(smallStore.rows);
      logStep('fingerprint-diff', String(large) + '/' + String(small));
      expect(large === small).assertFalse();
      expect(store.rowCount()).assertEqual(120);
      expect(smallStore.rowCount()).assertEqual(119);
      expect(large).assertEqual(textFingerprint(joined(contactNames(payload), ',')));
    });

    /**
     * @tc.name   phoneDigitTotalMatchesPayload
     * @tc.desc   The summed phone length over all stored rows equals eleven digits per row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('phoneDigitTotalMatchesPayload', 0, () => {
      bench.run(store, payload);
      const metrics: ContactMetrics = ContactMetrics.from(store.rows);
      logStep('phone-digits', String(metrics.totalPhoneDigits));
      expect(metrics.totalPhoneDigits).assertEqual(120 * 11);
      expect(metrics.totalPhoneDigits).assertEqual(1320);
      expect(store.rows[119].phone.length).assertEqual(11);
      expect(store.rows[0].phone.length).assertEqual(11);
    });

    /**
     * @tc.name   largeBatchQueriesBack
     * @tc.desc   The verification query after a large batch returns the same row count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('largeBatchQueriesBack', 0, () => {
      bench.run(store, payload);
      const visible: Contact[] = store.query(true);
      logStep('query-back', String(visible.length));
      expect(visible.length).assertEqual(120);
      expect(visible[0].name).assertEqual(payload[0].name);
      expect(visible[119].email).assertEqual(payload[119].email);
      expect(store.queryCalls).assertEqual(1);
      expect(visible.length).assertEqual(store.rowCount());
    });

    /**
     * @tc.name   insertAfterLargeBatchAppends
     * @tc.desc   An insert behind a one hundred row batch appends a single row at the tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertAfterLargeBatchAppends', 0, () => {
      bench.run(store, buildPayload(100));
      const extra: Contact = contactOf('追加行', '19999999999', 'tail@example.com', '尾部地址', '', 'F');
      const returned: number = store.insert(true, extra, 'ON_CONFLICT_REPLACE');
      logStep('append-tail', String(returned));
      expect(returned).assertEqual(101);
      expect(store.rowCount()).assertEqual(101);
      expect(store.names()[100]).assertEqual('追加行');
      expect(store.rows[100].category).assertEqual('F');
      expect(store.insertCalls).assertEqual(1);
    });

    /**
     * @tc.name   deleteAfterLargeBatchReducesCount
     * @tc.desc   Deleting one generated name removes exactly one row from the large payload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteAfterLargeBatchReducesCount', 0, () => {
      bench.run(store, payload);
      const target: string = payload[45].name;
      const removed: number = store.deleteByName(target);
      logStep('delete-large', target + ' removed=' + String(removed));
      expect(removed).assertEqual(1);
      expect(store.rowCount()).assertEqual(119);
      expect(countOf(store.names(), target)).assertEqual(0);
      expect(store.names()[45]).assertEqual(payload[46].name);
    });

    /**
     * @tc.name   updateAfterLargeBatchAffectsOne
     * @tc.desc   One update inside a large payload rewrites a single row and keeps the count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateAfterLargeBatchAffectsOne', 0, () => {
      bench.run(store, payload);
      const target: Contact = cloneContact(payload[30]);
      target.phone = '18888888888';
      target.address = '更新后的地址';
      const affected: number = store.updateContact(target);
      logStep('update-large', String(affected));
      expect(affected).assertEqual(1);
      expect(store.rows[30].phone).assertEqual('18888888888');
      expect(store.rows[30].address).assertEqual('更新后的地址');
      expect(store.rowCount()).assertEqual(120);
      expect(store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   largeBatchKeepsOrderAfterMutation
     * @tc.desc   After a delete and an append the surviving prefix order is untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('largeBatchKeepsOrderAfterMutation', 0, () => {
      bench.run(store, buildPayload(100));
      const namesBefore: string[] = store.names();
      store.deleteByName(namesBefore[10]);
      store.insert(true, contactOf('结尾行', '17777777777', 'end@example.com', '结尾地址', '', 'E'), 'ON_CONFLICT_REPLACE');
      const namesAfter: string[] = store.names();
      logStep('order-after', String(namesAfter.length));
      expect(namesAfter.length).assertEqual(100);
      expect(namesAfter[9]).assertEqual(namesBefore[9]);
      expect(namesAfter[10]).assertEqual(namesBefore[11]);
      expect(namesAfter[99]).assertEqual('结尾行');
      expect(store.rowCount()).assertEqual(100);
    });

    /**
     * @tc.name   payloadMutationAfterInsertDoesNotAffectStore
     * @tc.desc   The store clones every row, so editing the payload afterwards changes nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('payloadMutationAfterInsertDoesNotAffectStore', 0, () => {
      const local: Contact[] = buildPayload(100);
      bench.run(store, local);
      const originalName: string = local[0].name;
      local[0].name = '被改名';
      local[0].phone = '10000000001';
      local.splice(1, 10);
      logStep('payload-copy', store.names()[0]);
      expect(store.names()[0]).assertEqual(originalName);
      expect(store.rows[0].phone === '10000000001').assertFalse();
      expect(store.rowCount()).assertEqual(100);
      expect(countOf(store.names(), '被改名')).assertEqual(0);
      expect(local.length).assertEqual(90);
    });

    /**
     * @tc.name   metricsFillRatioDropsWithDuplicates
     * @tc.desc   Appending a duplicate name lowers the fill ratio below one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsFillRatioDropsWithDuplicates', 0, () => {
      const local: Contact[] = buildPayload(100);
      bench.run(store, local);
      const uniqueMetrics: ContactMetrics = ContactMetrics.from(store.rows);
      store.insert(true, cloneContact(local[0]), 'ON_CONFLICT_REPLACE');
      const duplicated: ContactMetrics = ContactMetrics.from(store.rows);
      logStep('fill-drop', String(uniqueMetrics.fillRatio()) + '->' + String(duplicated.fillRatio()));
      expect(uniqueMetrics.fillRatio()).assertEqual(1);
      expect(duplicated.fillRatio() < 1).assertTrue();
      expect(duplicated.duplicateNames).assertEqual(1);
      expect(duplicated.total).assertEqual(101);
      expect(store.rowCount()).assertEqual(101);
    });

    /**
     * @tc.name   batchSizesTraceRecordsEveryRun
     * @tc.desc   The bench ledger records each batch size and each resulting row count in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchSizesTraceRecordsEveryRun', 0, () => {
      bench.run(store, buildPayload(60));
      bench.run(store, buildPayload(60));
      bench.run(store, buildPayload(60));
      logStep('ledger', bench.rowTrace());
      expect(bench.runTimes()).assertEqual(3);
      expect(bench.batchSizes[0]).assertEqual(60);
      expect(bench.batchSizes[2]).assertEqual(60);
      expect(bench.rowTrace()).assertEqual('60,120,180');
      expect(bench.everyReturnMatchesPayload()).assertTrue();
      expect(bench.totalRows()).assertEqual(180);
    });

    /**
     * @tc.name   hundredRowBatchWithAllCategories
     * @tc.desc   A one hundred row payload still carries all six categories because of the stem cycle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredRowBatchWithAllCategories', 0, () => {
      bench.run(store, buildPayload(100));
      const groups: string[] = SearchEngine.groupByCategory(store.rows);
      logStep('hundred-categories', joined(groups, ','));
      expect(groups.length).assertEqual(6);
      expect(sameStringArray(groups, CATEGORIES)).assertTrue();
      expect(store.rowCount()).assertEqual(100);
      expect(SearchEngine.countCategory(store.rows, 'A') > 0).assertTrue();
      expect(SearchEngine.countCategory(store.rows, 'F') > 0).assertTrue();
    });

    /**
     * @tc.name   wrappedBatchCountReportsLargePayload
     * @tc.desc   The taskpool wrapper returns the exact large payload count without masking.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('wrappedBatchCountReportsLargePayload', 0, () => {
      const reported: number = wrappedBatchCount(true, store, buildPayload(130));
      logStep('wrapper-large', String(reported));
      expect(reported).assertEqual(130);
      expect(reported > 100).assertTrue();
      expect(store.rowCount()).assertEqual(130);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
    });

    /**
     * @tc.name   nameListLengthEqualsRowCountAcrossBatches
     * @tc.desc   Three batches keep names length, row count and query length in lockstep.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nameListLengthEqualsRowCountAcrossBatches', 0, () => {
      bench.run(store, buildPayload(45));
      bench.run(store, buildPayload(45));
      bench.run(store, buildPayload(45));
      const names: string[] = store.names();
      logStep('lockstep', String(names.length));
      expect(names.length).assertEqual(135);
      expect(names.length).assertEqual(store.rowCount());
      expect(names.length).assertEqual(store.query(true).length);
      expect(names.length).assertEqual(bench.totalRows());
      expect(countOf(names, names[0])).assertEqual(3);
    });

    /**
     * @tc.name   queryLoopKeepsRowCountStable
     * @tc.desc   Five consecutive queries over a large payload never change the stored row count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryLoopKeepsRowCountStable', 0, () => {
      bench.run(store, payload);
      for (let round = 0; round < 5; round++) {
        store.query(true);
      }
      logStep('query-loop', String(store.queryCalls));
      expect(store.queryCalls).assertEqual(5);
      expect(store.rowCount()).assertEqual(120);
      expect(store.batchCalls).assertEqual(1);
      expect(store.rows[0].name).assertEqual(payload[0].name);
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   metricsAfterDeleteDropsTotal
     * @tc.desc   Deleting rows from a large batch lowers every total metric by the removed amount.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsAfterDeleteDropsTotal', 0, () => {
      bench.run(store, buildPayload(120));
      const before: ContactMetrics = ContactMetrics.from(store.rows);
      const removedName: string = payload[0].name;
      store.deleteByName(removedName);
      const after: ContactMetrics = ContactMetrics.from(store.rows);
      logStep('metric-drop', String(before.total) + '->' + String(after.total));
      expect(before.total).assertEqual(120);
      expect(after.total).assertEqual(119);
      expect(after.uniqueNames).assertEqual(119);
      expect(after.totalPhoneDigits).assertEqual(before.totalPhoneDigits - 11);
      expect(store.rowCount()).assertEqual(119);
    });

    /**
     * @tc.name   fingerprintAfterAppendDiffers
     * @tc.desc   Appending one row changes the name fingerprint of the payload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintAfterAppendDiffers', 0, () => {
      bench.run(store, buildPayload(100));
      const before: number = payloadFingerprint(store.rows);
      store.insert(true, contactOf('尾部追加', '17777777777', 'tail@example.com', '尾部地址', '', 'A'), 'ON_CONFLICT_REPLACE');
      const after: number = payloadFingerprint(store.rows);
      logStep('append-fingerprint', String(before) + '/' + String(after));
      expect(before === after).assertFalse();
      expect(store.rowCount()).assertEqual(101);
      expect(store.names()[100]).assertEqual('尾部追加');
      expect(before).assertEqual(payloadFingerprint(buildPayload(100)));
    });

    /**
     * @tc.name   batchOfOneHundredFortyRows
     * @tc.desc   A one hundred and forty row payload is written and counted without truncation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchOfOneHundredFortyRows', 0, () => {
      const large: Contact[] = buildPayload(140);
      const written: number = bench.run(store, large);
      logStep('batch-140', String(written));
      expect(written).assertEqual(140);
      expect(store.rowCount()).assertEqual(140);
      expect(store.names()[139]).assertEqual(large[139].name);
      expect(store.names().length).assertEqual(140);
      expect(ContactMetrics.from(store.rows).uniqueNames).assertEqual(140);
    });

    /**
     * @tc.name   rowCountAfterFiveBatches
     * @tc.desc   Five twenty five row batches end at one hundred and twenty five rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rowCountAfterFiveBatches', 0, () => {
      for (let round = 0; round < 5; round++) {
        bench.run(store, buildPayload(25));
      }
      logStep('five-batches', bench.rowTrace());
      expect(bench.runTimes()).assertEqual(5);
      expect(bench.rowTrace()).assertEqual('25,50,75,100,125');
      expect(bench.totalRows()).assertEqual(125);
      expect(store.batchCalls).assertEqual(5);
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   expectedBatchCountOracleForSizes
     * @tc.desc   The batch oracle agrees with the actual count for four payload sizes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('expectedBatchCountOracleForSizes', 0, () => {
      const sizes: number[] = [1, 15, 100, 120];
      let matched = 0;
      for (let index = 0; index < sizes.length; index++) {
        const local: Contact[] = buildPayload(sizes[index]);
        const oracle: number = expectedBatchCount(local);
        const storeInner: StoreDouble = new StoreDouble();
        const actual: number = storeInner.batchInsert(true, local);
        if (oracle === actual && oracle === sizes[index]) {
          matched = matched + 1;
        }
      }
      logStep('oracle-sizes', String(matched));
      expect(matched).assertEqual(4);
      expect(matched).assertEqual(sizes.length);
      expect(expectedBatchCount(buildPayload(120))).assertEqual(120);
      expect(expectedBatchCount([])).assertEqual(0);
    });

    /**
     * @tc.name   emptyPayloadBatchReturnsZero
     * @tc.desc   A zero row batch still initializes the store and reports zero rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyPayloadBatchReturnsZero', 0, () => {
      const written: number = bench.run(store, []);
      logStep('empty-payload', String(written));
      expect(written).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(bench.everyReturnMatchesPayload()).assertTrue();
      expect(store.createTableCalls).assertEqual(1);
    });

    /**
     * @tc.name   insertDuplicateNameKeepsBothRows
     * @tc.desc   A duplicate insert through the large store appends a second row with the same name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertDuplicateNameKeepsBothRows', 0, () => {
      bench.run(store, buildPayload(100));
      const duplicate: Contact = cloneContact(store.rows[7]);
      const returned: number = store.insert(true, duplicate, 'ON_CONFLICT_REPLACE');
      logStep('duplicate-insert', String(returned));
      expect(returned).assertEqual(101);
      expect(store.rowCount()).assertEqual(101);
      expect(countOf(store.names(), duplicate.name)).assertEqual(2);
      expect(store.rows[100].name).assertEqual(duplicate.name);
      expect(ContactMetrics.from(store.rows).duplicateNames).assertEqual(1);
    });

    /**
     * @tc.name   categoryCountsSumToTotal
     * @tc.desc   The six per category counts of the payload add up to the stored row total.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryCountsSumToTotal', 0, () => {
      bench.run(store, payload);
      let sum = 0;
      for (let index = 0; index < CATEGORIES.length; index++) {
        sum = sum + SearchEngine.countCategory(store.rows, CATEGORIES[index]);
      }
      logStep('category-sum', String(sum));
      expect(sum).assertEqual(120);
      expect(sum).assertEqual(store.rowCount());
      expect(sum).assertEqual(ContactMetrics.from(store.rows).total);
      expect(SearchEngine.countCategory(store.rows, 'Z')).assertEqual(0);
      expect(CATEGORIES.length).assertEqual(6);
    });

    /**
     * @tc.name   fingerprintOfSameTextIsStable
     * @tc.desc   The text fingerprint helper is a pure function over the joined name string.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fingerprintOfSameTextIsStable', 0, () => {
      const names: string[] = contactNames(buildPayload(120));
      const first: string = joined(names, ',');
      const second: string = joined(contactNames(buildPayload(120)), ',');
      const hashA: number = textFingerprint(first);
      const hashB: number = textFingerprint(second);
      logStep('text-hash', String(hashA));
      expect(first).assertEqual(second);
      expect(hashA).assertEqual(hashB);
      expect(textFingerprint('contact') === textFingerprint('contacts')).assertFalse();
      expect(uniqueStrings(names).length).assertEqual(120);
    });

    /**
     * @tc.name   hundredRowBatchKeepsSixBucketFields
     * @tc.desc   Every generated row keeps six populated columns, so no bucket field is lost in bulk.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredRowBatchKeepsSixBucketFields', 0, () => {
      bench.run(store, payload);
      let complete = 0;
      for (let index = 0; index < store.rows.length; index++) {
        const row: Contact = store.rows[index];
        if (row.name.length > 0 && row.phone.length > 0 && row.email.length > 0 &&
          row.address.length > 0 && row.category.length === 1) {
          complete = complete + 1;
        }
      }
      logStep('complete-rows', String(complete));
      expect(complete).assertEqual(120);
      expect(complete).assertEqual(store.rowCount());
      expect(store.rows[50].avatar).assertEqual('');
      expect(store.rows[50].email.indexOf('@') >= 0).assertTrue();
    });

    /**
     * @tc.name   largeBatchThenResetClearsAllRows
     * @tc.desc   A reset after a large batch clears every row and returns the counters to zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('largeBatchThenResetClearsAllRows', 0, () => {
      bench.run(store, payload);
      expect(store.rowCount()).assertEqual(120);
      store.reset();
      logStep('reset-large', String(store.rowCount()));
      expect(store.rowCount()).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
      expect(store.initCalls).assertEqual(0);
      expect(ContactMetrics.from(store.rows).total).assertEqual(0);
    });

    /**
     * @tc.name   expectedBatchCountOfFifteenMatchesSeed
     * @tc.desc   The oracle also holds for the fifteen row page seed used before the bulk cases.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('expectedBatchCountOfFifteenMatchesSeed', 0, () => {
      const seed: Contact[] = createSeedContacts();
      const oracle: number = expectedBatchCount(seed);
      const written: number = bench.run(store, seed);
      logStep('seed-oracle', String(oracle));
      expect(oracle).assertEqual(15);
      expect(written).assertEqual(oracle);
      expect(store.rowCount()).assertEqual(15);
      expect(store.initCalls).assertEqual(1);
      expect(bench.totalRows()).assertEqual(15);
    });

    /**
     * @tc.name   categoryStemOrderDeterministic
     * @tc.desc   A fifteen row generated payload reproduces the seeded category order exactly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryStemOrderDeterministic', 0, () => {
      const fifteen: Contact[] = buildPayload(15);
      const groups: string[] = SearchEngine.groupByCategory(fifteen);
      const seedGroups: string[] = SearchEngine.groupByCategory(createSeedContacts());
      logStep('stem-order', joined(groups, ','));
      expect(sameStringArray(groups, seedGroups)).assertTrue();
      expect(groups.length).assertEqual(6);
      expect(fifteen.length).assertEqual(15);
      expect(fifteen[0].category).assertEqual('A');
      expect(fifteen[14].category).assertEqual('F');
    });

    /**
     * @tc.name   payloadBuildsAreDeterministic
     * @tc.desc   Two builds of the same size produce identical names, and one build has no duplicate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('payloadBuildsAreDeterministic', 0, () => {
      const first: string[] = contactNames(buildPayload(120));
      const second: string[] = contactNames(buildPayload(120));
      let shared = 0;
      for (let index = 0; index < first.length; index++) {
        if (second.indexOf(first[index]) >= 0) {
          shared = shared + 1;
        }
      }
      logStep('shared-names', String(shared));
      expect(shared).assertEqual(120);
      expect(uniqueStrings(first).length).assertEqual(120);
      expect(first.length).assertEqual(second.length);
      expect(textFingerprint(joined(first, ','))).assertEqual(textFingerprint(joined(second, ',')));
    });

    /**
     * @tc.name   hundredRowBatchKeepsInitializationCounter
     * @tc.desc   A single large batch leaves one init, one table and one batch call in the ledger.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredRowBatchKeepsInitializationCounter', 0, () => {
      bench.run(store, buildPayload(110));
      logStep('init-ledger', String(store.initCalls) + '/' + String(store.batchCalls));
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(110);
      expect(bench.everyReturnMatchesPayload()).assertTrue();
    });
  });
}
