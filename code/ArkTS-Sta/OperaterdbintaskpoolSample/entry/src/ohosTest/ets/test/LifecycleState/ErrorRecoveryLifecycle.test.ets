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
 * ErrorRecoveryLifecycle pins the failure contract of the taskpool wrappers:
 *
 *   TaskPool.ets:69-79    a thrown query is converted to an empty array
 *   TaskPool.ets:108-117  a thrown batch insert is converted to zero
 *   DatabaseConnection.ets:69-89    a missing context skips the store entirely
 *   DatabaseConnection.ets:116-134  query has its own empty-array fallback
 *   OperateRDBInTaskPool.ets:91-119 the manager is only touched after a resolved task
 *   ContactManager.ets:55-65        manager update is a replace by first name match
 *
 * CommitGate models the "resolve, then update the cache" ordering so a failed
 * write can be shown to leave the manager exactly as it was.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep, logWarn } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  StoreDouble,
  OperationCatalog,
  ERROR_NONE,
  ERROR_CONTEXT_MISSING,
  ERROR_STORE_INIT,
  ERROR_SQL_EXECUTION,
  ERROR_TABLE_MISSING,
  fallbackForOperation,
  continuesWithoutContext,
  createSeedContacts,
  contactOf,
  cloneContact,
  contactNames,
  joined,
  countOf,
  uniqueStrings,
  resetContactManager,
  expectedAfterUpdate,
  sameContact,
  sameStringArray,
  wrappedBatchCount,
  wrappedQueryResult
} from '../Shared/SharedDriver';

/** Ordered record of recovery steps for one scenario. */
class RecoveryLog {
  public steps: string[] = [];

  public record(step: string): void {
    this.steps.push(step);
  }

  public size(): number {
    return this.steps.length;
  }

  public contains(step: string): boolean {
    return this.steps.indexOf(step) >= 0;
  }

  public trace(): string {
    return joined(this.steps, '>');
  }

  public clear(): void {
    this.steps = [];
  }

  public last(): string {
    return this.steps.length === 0 ? '' : this.steps[this.steps.length - 1];
  }
}

/**
 * Wraps the resolved-promise ordering: the store write happens first and the
 * manager update only runs when the task reports success.
 */
class CommitGate {
  public store: StoreDouble;
  public manager: ContactManager;
  public attempts: number = 0;
  public failures: number = 0;
  public successes: number = 0;
  public lastCode: number = ERROR_NONE;
  public log: RecoveryLog = new RecoveryLog();

  constructor(manager: ContactManager, store: StoreDouble) {
    this.manager = manager;
    this.store = store;
  }

  public attempt(contact: Contact, errorCode: number): boolean {
    this.attempts = this.attempts + 1;
    this.lastCode = errorCode;
    if (errorCode !== ERROR_NONE) {
      this.failures = this.failures + 1;
      this.log.record('failed:' + String(errorCode));
      return false;
    }
    this.store.updateContact(contact);
    this.manager.updateContact(cloneContact(contact));
    this.successes = this.successes + 1;
    this.log.record('committed:' + contact.name);
    return true;
  }

  public describe(): string {
    return String(this.attempts) + '/' + String(this.failures) + '/' + String(this.successes);
  }
}

/** One recorded fallback decision. */
class FallbackRecord {
  public operation: string;
  public code: number;
  public result: number;

  constructor(operation: string, code: number) {
    this.operation = operation;
    this.code = code;
    this.result = fallbackForOperation(operation, code);
  }

  public describe(): string {
    return this.operation + ':' + String(this.result);
  }
}

/** Builds the fallback table for every catalog operation at one error code. */
function fallbackTable(code: number): FallbackRecord[] {
  const operations: string[] = OperationCatalog.all();
  const records: FallbackRecord[] = [];
  for (let index = 0; index < operations.length; index++) {
    records.push(new FallbackRecord(operations[index], code));
  }
  return records;
}

export default function errorRecoveryLifecycleTest(): void {
  describe('ErrorRecoveryLifecycle', () => {
    let store: StoreDouble = new StoreDouble();
    let manager: ContactManager = resetContactManager();
    let log: RecoveryLog = new RecoveryLog();
    let gate: CommitGate = new CommitGate(manager, store);

    beforeAll(() => {
      logSuite('ErrorRecoveryLifecycle', 'begin');
    });

    beforeEach(async () => {
      manager = resetContactManager();
      store = new StoreDouble();
      log = new RecoveryLog();
      gate = new CommitGate(manager, store);
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('ErrorRecoveryLifecycle', 'end');
    });

    /**
     * @tc.name   errorNoneMapsToZeroFallbackForQuery
     * @tc.desc   A successful query reports zero as its fallback marker, not a negative sentinel.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('errorNoneMapsToZeroFallbackForQuery', 0, () => {
      const result: number = fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_NONE);
      const batch: number = fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_NONE);
      logStep('none-code', String(result) + '/' + String(batch));
      expect(result).assertEqual(0);
      expect(batch).assertEqual(0);
      expect(ERROR_NONE).assertEqual(0);
      expect(result === -1).assertFalse();
      expect(fallbackForOperation(OperationCatalog.DELETE_ONE, ERROR_NONE)).assertEqual(0);
    });

    /**
     * @tc.name   batchInsertFailureFallsBackToZero
     * @tc.desc   A failed batch insert reports zero rows, matching taskPoolExecuteBatchInsert.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchInsertFailureFallsBackToZero', 0, () => {
      const sql: number = fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_SQL_EXECUTION);
      const init: number = fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_STORE_INIT);
      const table: number = fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_TABLE_MISSING);
      logStep('batch-fallback', String(sql) + '/' + String(init) + '/' + String(table));
      expect(sql).assertEqual(0);
      expect(init).assertEqual(0);
      expect(table).assertEqual(0);
      expect(sql === -1).assertFalse();
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   queryFailureFallsBackToMinusOne
     * @tc.desc   A non-batch operation reports the negative sentinel for any non-zero error code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryFailureFallsBackToMinusOne', 0, () => {
      const result: number = fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_SQL_EXECUTION);
      const rows: Contact[] = wrappedQueryResult(false, store);
      logStep('query-fallback', String(result) + ' rows=' + String(rows.length));
      expect(result).assertEqual(-1);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
      expect(continuesWithoutContext(false)).assertTrue();
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_CONTEXT_MISSING)).assertEqual(-1);
    });

    /**
     * @tc.name   insertFailureFallsBackToMinusOne
     * @tc.desc   Insert failures are reported with the negative sentinel while rows stay untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertFailureFallsBackToMinusOne', 0, () => {
      const result: number = fallbackForOperation(OperationCatalog.INSERT_ONE, ERROR_TABLE_MISSING);
      const cold: StoreDouble = new StoreDouble();
      cold.init(false);
      const rejected: number = cold.insert(false, contactOf('失败', '10000000000', 'f@example.com', '某地'), 'ON_CONFLICT_REPLACE');
      logStep('insert-fallback', String(result) + '/' + String(rejected));
      expect(result).assertEqual(-1);
      expect(rejected).assertEqual(-1);
      expect(cold.rowCount()).assertEqual(0);
      expect(cold.insertCalls).assertEqual(1);
      expect(cold.initialized).assertFalse();
      expect(cold.initCalls).assertEqual(2);
    });

    /**
     * @tc.name   updateFailureFallsBackToMinusOne
     * @tc.desc   An update failure leaves the previous phone value and reports the sentinel.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateFailureFallsBackToMinusOne', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      const before: string = store.rows[0].phone;
      const result: number = fallbackForOperation(OperationCatalog.UPDATE_ONE, ERROR_SQL_EXECUTION);
      gate.attempt(contactOf('艾德里安', '10000009999', 'x@example.com', '新地址'), ERROR_SQL_EXECUTION);
      logStep('update-fallback', 'before=' + before);
      expect(result).assertEqual(-1);
      expect(store.rows[0].phone).assertEqual(before);
      expect(gate.successes).assertEqual(0);
      expect(gate.failures).assertEqual(1);
      expect(store.updateCalls).assertEqual(0);
    });

    /**
     * @tc.name   deleteFailureFallsBackToMinusOne
     * @tc.desc   A delete failure keeps every row, so the count is unchanged after the attempt.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteFailureFallsBackToMinusOne', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const before: number = store.rowCount();
      const result: number = fallbackForOperation(OperationCatalog.DELETE_ONE, ERROR_CONTEXT_MISSING);
      logWarn('delete-fallback', 'code=' + String(ERROR_CONTEXT_MISSING));
      logStep('delete-rows', String(before));
      expect(result).assertEqual(-1);
      expect(store.rowCount()).assertEqual(before);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.names()[0]).assertEqual('艾德里安');
      expect(ERROR_CONTEXT_MISSING).assertEqual(401);
    });

    /**
     * @tc.name   everyFailureCodeIsDistinct
     * @tc.desc   The five codes used by the recovery paths never collide with each other.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everyFailureCodeIsDistinct', 0, () => {
      const codes: number[] = [
        ERROR_NONE, ERROR_CONTEXT_MISSING, ERROR_STORE_INIT, ERROR_SQL_EXECUTION, ERROR_TABLE_MISSING
      ];
      const text: string[] = [];
      for (let index = 0; index < codes.length; index++) {
        text.push(String(codes[index]));
      }
      const distinct: string[] = uniqueStrings(text);
      logStep('codes', joined(text, ','));
      expect(codes.length).assertEqual(5);
      expect(distinct.length).assertEqual(5);
      expect(uniqueStrings(text).length).assertEqual(codes.length);
      expect(ERROR_STORE_INIT === ERROR_SQL_EXECUTION).assertFalse();
      expect(ERROR_TABLE_MISSING === ERROR_CONTEXT_MISSING).assertFalse();
    });

    /**
     * @tc.name   contextMissingCodeIsFourZeroOne
     * @tc.desc   The context guard publishes 401, distinct from the relational store codes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contextMissingCodeIsFourZeroOne', 0, () => {
      const rejected: boolean = store.init(false);
      logWarn('context-code', String(ERROR_CONTEXT_MISSING));
      expect(ERROR_CONTEXT_MISSING).assertEqual(401);
      expect(rejected).assertFalse();
      expect(store.createTableCalls).assertEqual(0);
      expect(ERROR_CONTEXT_MISSING < ERROR_STORE_INIT).assertTrue();
      expect(store.lastContextValid).assertFalse();
    });

    /**
     * @tc.name   storeInitErrorCodeValue
     * @tc.desc   The store initialization failure code keeps the documented 14800011 value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeInitErrorCodeValue', 0, () => {
      const result: number = fallbackForOperation(OperationCatalog.INIT_STORE, ERROR_STORE_INIT);
      logWarn('init-code', String(ERROR_STORE_INIT));
      expect(ERROR_STORE_INIT).assertEqual(14800011);
      expect(result).assertEqual(-1);
      expect(ERROR_STORE_INIT > ERROR_CONTEXT_MISSING).assertTrue();
      expect(fallbackForOperation(OperationCatalog.CREATE_TABLE, ERROR_STORE_INIT)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_STORE_INIT)).assertEqual(0);
    });

    /**
     * @tc.name   sqlExecutionErrorCodeValue
     * @tc.desc   The SQL execution failure code keeps the documented 14800015 value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sqlExecutionErrorCodeValue', 0, () => {
      logWarn('sql-code', String(ERROR_SQL_EXECUTION));
      expect(ERROR_SQL_EXECUTION).assertEqual(14800015);
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.UPDATE_ONE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(ERROR_SQL_EXECUTION > ERROR_STORE_INIT).assertTrue();
      expect(ERROR_SQL_EXECUTION === ERROR_NONE).assertFalse();
      expect(store.queryCalls).assertEqual(0);
    });

    /**
     * @tc.name   tableMissingErrorCodeValue
     * @tc.desc   The table-missing code is 14800001 and still produces the negative sentinel.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('tableMissingErrorCodeValue', 0, () => {
      logWarn('table-code', String(ERROR_TABLE_MISSING));
      expect(ERROR_TABLE_MISSING).assertEqual(14800001);
      expect(fallbackForOperation(OperationCatalog.DELETE_ONE, ERROR_TABLE_MISSING)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.DEDUPE_ROWS, ERROR_TABLE_MISSING)).assertEqual(-1);
      expect(ERROR_TABLE_MISSING < ERROR_STORE_INIT).assertTrue();
      expect(ERROR_TABLE_MISSING > ERROR_CONTEXT_MISSING).assertTrue();
      expect(store.deleteCalls).assertEqual(0);
    });

    /**
     * @tc.name   fallbackTableUsesZeroOnlyForBatchInsert
     * @tc.desc   Across all catalog operations only batch insert survives a failure with zero rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fallbackTableUsesZeroOnlyForBatchInsert', 0, () => {
      const records: FallbackRecord[] = fallbackTable(ERROR_SQL_EXECUTION);
      let zeroCount = 0;
      let negativeCount = 0;
      for (let index = 0; index < records.length; index++) {
        if (records[index].result === 0) {
          zeroCount = zeroCount + 1;
        } else {
          negativeCount = negativeCount + 1;
        }
      }
      logStep('fallback-table', joined(records.map((item: FallbackRecord) => item.describe()), ','));
      expect(records.length).assertEqual(8);
      expect(zeroCount).assertEqual(1);
      expect(negativeCount).assertEqual(7);
      expect(records[2].operation).assertEqual(OperationCatalog.BATCH_INSERT);
      expect(records[2].result).assertEqual(0);
      expect(records[0].result).assertEqual(-1);
    });

    /**
     * @tc.name   unknownOperationFallsBackToMinusOne
     * @tc.desc   An operation name outside the catalog still receives the negative sentinel.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('unknownOperationFallsBackToMinusOne', 0, () => {
      const result: number = fallbackForOperation('vacuum-store', ERROR_SQL_EXECUTION);
      const empty: number = fallbackForOperation('', ERROR_SQL_EXECUTION);
      logStep('unknown-op', String(result) + '/' + String(empty));
      expect(result).assertEqual(-1);
      expect(empty).assertEqual(-1);
      expect(OperationCatalog.all().indexOf('vacuum-store')).assertEqual(-1);
      expect(fallbackForOperation('vacuum-store', ERROR_NONE)).assertEqual(0);
      expect(fallbackForOperation('', ERROR_NONE)).assertEqual(0);
    });

    /**
     * @tc.name   fallbackTableAtNoErrorIsAllZero
     * @tc.desc   With no error every catalog operation reports the zero success marker.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fallbackTableAtNoErrorIsAllZero', 0, () => {
      const records: FallbackRecord[] = fallbackTable(ERROR_NONE);
      let nonZero = 0;
      for (let index = 0; index < records.length; index++) {
        if (records[index].result !== 0) {
          nonZero = nonZero + 1;
        }
      }
      logStep('fallback-none', String(nonZero));
      expect(records.length).assertEqual(OperationCatalog.all().length);
      expect(nonZero).assertEqual(0);
      expect(records[5].result).assertEqual(0);
      expect(records[7].operation).assertEqual(OperationCatalog.DEDUPE_ROWS);
      expect(fallbackForOperation(OperationCatalog.DEDUPE_ROWS, ERROR_NONE)).assertEqual(0);
    });

    /**
     * @tc.name   retryAfterInvalidInitSucceeds
     * @tc.desc   A rejected init followed by a valid context flips the store into the ready state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryAfterInvalidInitSucceeds', 0, () => {
      const first: boolean = store.init(false);
      log.record('init-rejected');
      const second: boolean = store.init(true);
      log.record('init-accepted');
      logStep('retry-init', log.trace());
      expect(first).assertFalse();
      expect(second).assertTrue();
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(log.size()).assertEqual(2);
      expect(log.last()).assertEqual('init-accepted');
    });

    /**
     * @tc.name   retryCountsBothInitAttempts
     * @tc.desc   The failed attempt remains visible in the counters after the successful retry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryCountsBothInitAttempts', 0, () => {
      store.init(false);
      store.init(false);
      store.init(true);
      const written: number = store.batchInsert(true, createSeedContacts().slice(0, 2));
      logStep('retry-counters', 'init=' + String(store.initCalls) + ' written=' + String(written));
      expect(store.initCalls).assertEqual(3);
      expect(store.createTableCalls).assertEqual(1);
      expect(written).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
      expect(store.lastContextValid).assertTrue();
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   failedBatchLeavesNoRowsThenRecovers
     * @tc.desc   A rejected batch leaves zero rows, and the next valid batch writes the full payload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedBatchLeavesNoRowsThenRecovers', 0, () => {
      const payload: Contact[] = createSeedContacts().slice(0, 4);
      const failed: number = store.batchInsert(false, payload);
      log.record('batch-failed');
      const failedRows: number = store.rowCount();
      const recovered: number = store.batchInsert(true, payload);
      log.record('batch-recovered');
      logStep('batch-recovery', 'failed=' + String(failed) + ' recovered=' + String(recovered));
      expect(failed).assertEqual(-1);
      expect(failedRows).assertEqual(0);
      expect(recovered).assertEqual(4);
      expect(store.rowCount()).assertEqual(4);
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(log.contains('batch-recovered')).assertTrue();
    });

    /**
     * @tc.name   failedInsertLeavesStoreUsable
     * @tc.desc   After a rejected insert a valid insert still succeeds and appends one row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedInsertLeavesStoreUsable', 0, () => {
      const contact: Contact = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'A');
      const failed: number = store.insert(false, contact, 'ON_CONFLICT_REPLACE');
      const recovered: number = store.insert(true, contact, 'ON_CONFLICT_REPLACE');
      logStep('insert-recovery', String(failed) + '->' + String(recovered));
      expect(failed).assertEqual(-1);
      expect(recovered).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
      expect(store.insertCalls).assertEqual(2);
      expect(store.rows[0].name).assertEqual('林岸');
      expect(store.initialized).assertTrue();
    });

    /**
     * @tc.name   queryAfterInvalidContextStillReadsStore
     * @tc.desc   A rejected query does not damage the store; the following valid query returns all rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryAfterInvalidContextStillReadsStore', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 6));
      const rejected: Contact[] = store.query(false);
      const visible: Contact[] = store.query(true);
      logStep('query-recovery', String(rejected.length) + '->' + String(visible.length));
      expect(rejected.length).assertEqual(0);
      expect(visible.length).assertEqual(6);
      expect(store.queryCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(6);
      expect(visible[0].name).assertEqual('艾德里安');
      expect(visible[5].name).assertEqual('卡梅隆');
    });

    /**
     * @tc.name   managerUnchangedWhenCommitFails
     * @tc.desc   A failed task leaves the cached manager rows exactly as they were before the attempt.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('managerUnchangedWhenCommitFails', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 3);
      manager = resetContactManager(rows);
      store = new StoreDouble();
      store.batchInsert(true, rows);
      gate = new CommitGate(manager, store);
      const edited: Contact = contactOf('阿诺德', '16600000000', 'changed@example.com', '新地址', '', 'A');
      const accepted: boolean = gate.attempt(edited, ERROR_SQL_EXECUTION);
      logWarn('commit-failed', gate.log.trace());
      expect(accepted).assertFalse();
      expect(manager.getContacts().length).assertEqual(3);
      expect(manager.getContacts()[1].phone).assertEqual('16666666666');
      expect(manager.getContacts()[1].email).assertEqual('arnold@example.com');
      expect(store.rows[1].phone).assertEqual('16666666666');
      expect(gate.successes).assertEqual(0);
    });

    /**
     * @tc.name   failedCommitSkipsStoreUpdateCall
     * @tc.desc   The store update counter stays at zero when the gate rejects the task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedCommitSkipsStoreUpdateCall', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 2);
      manager = resetContactManager(rows);
      store = new StoreDouble();
      store.batchInsert(true, rows);
      gate = new CommitGate(manager, store);
      gate.attempt(contactOf('贝拉', '10000000009', 'b@example.com', '地址'), ERROR_TABLE_MISSING);
      gate.attempt(contactOf('贝拉', '10000000008', 'b@example.com', '地址'), ERROR_STORE_INIT);
      logStep('gate-describe', gate.describe());
      expect(store.updateCalls).assertEqual(0);
      expect(gate.attempts).assertEqual(2);
      expect(gate.failures).assertEqual(2);
      expect(gate.describe()).assertEqual('2/2/0');
      expect(gate.lastCode).assertEqual(ERROR_STORE_INIT);
      expect(store.rows[0].phone).assertEqual('13333333333');
    });

    /**
     * @tc.name   successfulRetryAfterFailureUpdatesManager
     * @tc.desc   One failed attempt then one success leaves the manager holding the retried values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('successfulRetryAfterFailureUpdatesManager', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 3);
      manager = resetContactManager(rows);
      store = new StoreDouble();
      store.batchInsert(true, rows);
      gate = new CommitGate(manager, store);
      const target: Contact = contactOf('贝拉', '13300001234', 'retry@example.com', '湖北省武汉市江汉区', '', 'B');
      const failed: boolean = gate.attempt(target, ERROR_SQL_EXECUTION);
      const recovered: boolean = gate.attempt(target, ERROR_NONE);
      logStep('retry-commit', gate.log.trace());
      expect(failed).assertFalse();
      expect(recovered).assertTrue();
      expect(manager.getContacts()[2].phone).assertEqual('13300001234');
      expect(store.rows[2].phone).assertEqual('13300001234');
      expect(gate.successes).assertEqual(1);
      expect(gate.failures).assertEqual(1);
      expect(store.rowCount()).assertEqual(3);
    });

    /**
     * @tc.name   failureLogRecordsStepsInOrder
     * @tc.desc   The recovery log preserves the chronological order of failed and accepted steps.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failureLogRecordsStepsInOrder', 0, () => {
      log.record('open');
      log.record('write-failed');
      log.record('retry');
      log.record('write-accepted');
      logStep('log-trace', log.trace());
      expect(log.size()).assertEqual(4);
      expect(log.trace()).assertEqual('open>write-failed>retry>write-accepted');
      expect(log.contains('retry')).assertTrue();
      expect(log.contains('rollback')).assertFalse();
      expect(log.last()).assertEqual('write-accepted');
      expect(log.trace().indexOf('open')).assertEqual(0);
    });

    /**
     * @tc.name   recoveryLogClearResetsSteps
     * @tc.desc   Clearing the log drops the history while the store counters remain intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('recoveryLogClearResetsSteps', 0, () => {
      log.record('failed:14800015');
      log.record('committed:林岸');
      const before: number = log.size();
      log.clear();
      logStep('log-clear', String(before) + '->' + String(log.size()));
      expect(before).assertEqual(2);
      expect(log.size()).assertEqual(0);
      expect(log.last()).assertEqual('');
      expect(log.trace()).assertEqual('');
      expect(store.initCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
    });

    /**
     * @tc.name   continuesWithoutContextOnlyForMissingContext
     * @tc.desc   The guard that mirrors the page lets only an absent context continue.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('continuesWithoutContextOnlyForMissingContext', 0, () => {
      const missing: boolean = continuesWithoutContext(false);
      const present: boolean = continuesWithoutContext(true);
      const rejected: boolean = store.init(false);
      logStep('context-continue', String(missing) + '/' + String(present));
      expect(missing).assertTrue();
      expect(present).assertFalse();
      expect(rejected).assertFalse();
      expect(store.initialized).assertFalse();
      expect(store.initCalls).assertEqual(1);
      expect(continuesWithoutContext(false) === continuesWithoutContext(true)).assertFalse();
    });

    /**
     * @tc.name   recoveryKeepsRowOrder
     * @tc.desc   A failed then successful write leaves the seeded row order untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoveryKeepsRowOrder', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 5);
      store.batchInsert(true, rows);
      const cold: StoreDouble = new StoreDouble();
      const failed: number = cold.batchInsert(false, createSeedContacts().slice(5, 7));
      const namesBefore: string[] = contactNames(store.query(true));
      const recovered: number = store.batchInsert(true, createSeedContacts().slice(7, 8));
      const namesAfter: string[] = contactNames(store.query(true));
      logStep('order-recovery', joined(namesAfter, ','));
      expect(failed).assertEqual(-1);
      expect(cold.rowCount()).assertEqual(0);
      expect(namesBefore.length).assertEqual(5);
      expect(recovered).assertEqual(1);
      expect(namesAfter.length).assertEqual(6);
      expect(sameStringArray(namesBefore, namesAfter.slice(0, 5))).assertTrue();
      expect(namesAfter[5]).assertEqual('卡特琳娜');
    });

    /**
     * @tc.name   secondFailureCountsAgainAfterSuccess
     * @tc.desc   Gate counters keep accumulating across failure, success and failure rounds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('secondFailureCountsAgainAfterSuccess', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 2);
      manager = resetContactManager(rows);
      store = new StoreDouble();
      store.batchInsert(true, rows);
      gate = new CommitGate(manager, store);
      gate.attempt(rows[0], ERROR_SQL_EXECUTION);
      gate.attempt(rows[0], ERROR_NONE);
      gate.attempt(rows[1], ERROR_TABLE_MISSING);
      logStep('gate-mixed', gate.describe());
      expect(gate.attempts).assertEqual(3);
      expect(gate.failures).assertEqual(2);
      expect(gate.successes).assertEqual(1);
      expect(gate.describe()).assertEqual('3/2/1');
      expect(gate.log.size()).assertEqual(3);
      expect(manager.getContacts().length).assertEqual(2);
    });

    /**
     * @tc.name   failureBeforeInitDoesNotCreateTable
     * @tc.desc   A batch on a missing context fails before the createTable side effect runs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failureBeforeInitDoesNotCreateTable', 0, () => {
      const failed: number = store.batchInsert(false, createSeedContacts());
      logWarn('pre-init-failure', 'table=' + String(store.createTableCalls));
      expect(failed).assertEqual(-1);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initCalls).assertEqual(1);
      expect(store.initialized).assertFalse();
      expect(store.rowCount()).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   batchAfterInitIgnoresContextArgument
     * @tc.desc   An initialized store accepts a batch even when the caller passes an invalid context flag.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchAfterInitIgnoresContextArgument', 0, () => {
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const accepted: number = store.batchInsert(false, createSeedContacts().slice(3, 5));
      logStep('warm-context', 'accepted=' + String(accepted));
      expect(accepted).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(5);
      expect(store.batchCalls).assertEqual(2);
      expect(store.names()[2]).assertEqual('贝拉');
    });

    /**
     * @tc.name   failedCommitLeavesStoreRowCountStable
     * @tc.desc   A rejected task cannot change the store row count, even for a duplicate name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedCommitLeavesStoreRowCountStable', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 4);
      store.batchInsert(true, rows);
      manager = resetContactManager(rows);
      gate = new CommitGate(manager, store);
      const before: number = store.rowCount();
      gate.attempt(contactOf('本', '10000000000', 'dup@example.com', '四川省成都市锦江区'), ERROR_SQL_EXECUTION);
      logStep('failed-count', String(before) + '->' + String(store.rowCount()));
      expect(store.rowCount()).assertEqual(before);
      expect(before).assertEqual(4);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.insertCalls).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(4);
      expect(store.rows[3].email).assertEqual('ben@example.com');
    });

    /**
     * @tc.name   resetAfterFailureRestoresCounters
     * @tc.desc   StoreDouble.reset wipes the failure counters so a rebuilt store starts clean.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetAfterFailureRestoresCounters', 0, () => {
      store.batchInsert(false, createSeedContacts());
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      const beforeReset: number = store.initCalls;
      store.reset();
      logStep('reset-failure', String(beforeReset) + '->' + String(store.initCalls));
      expect(beforeReset).assertEqual(2);
      expect(store.initCalls).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.rowCount()).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
    });

    /**
     * @tc.name   fallbackForNoneIsZeroAcrossCatalog
     * @tc.desc   Every catalog operation maps the zero code to zero, regardless of its position.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fallbackForNoneIsZeroAcrossCatalog', 0, () => {
      const operations: string[] = OperationCatalog.all();
      let zeroCount = 0;
      for (let index = 0; index < operations.length; index++) {
        if (fallbackForOperation(operations[index], ERROR_NONE) === 0) {
          zeroCount = zeroCount + 1;
        }
      }
      logStep('none-across', String(zeroCount));
      expect(zeroCount).assertEqual(operations.length);
      expect(zeroCount).assertEqual(8);
      expect(fallbackForOperation(operations[6], ERROR_NONE)).assertEqual(0);
      expect(fallbackForOperation(operations[7], ERROR_NONE)).assertEqual(0);
      expect(operations[6]).assertEqual(OperationCatalog.DELETE_ONE);
    });

    /**
     * @tc.name   gateDescribeFormatAfterMixedAttempts
     * @tc.desc   The gate description encodes attempts, failures and successes in a fixed order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('gateDescribeFormatAfterMixedAttempts', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 1);
      manager = resetContactManager(rows);
      store = new StoreDouble();
      store.batchInsert(true, rows);
      gate = new CommitGate(manager, store);
      gate.attempt(rows[0], ERROR_CONTEXT_MISSING);
      gate.attempt(rows[0], ERROR_NONE);
      gate.attempt(rows[0], ERROR_NONE);
      logStep('gate-format', gate.describe());
      expect(gate.describe()).assertEqual('3/1/2');
      expect(gate.log.size()).assertEqual(3);
      expect(gate.log.last()).assertEqual('committed:' + rows[0].name);
      expect(store.updateCalls).assertEqual(2);
      expect(manager.getContacts()[0].name).assertEqual('艾德里安');
      expect(sameContact(store.rows[0], manager.getContacts()[0])).assertTrue();
    });

    /**
     * @tc.name   batchFallbackZeroAfterRecovery
     * @tc.desc   After a successful recovery a second failing batch still reports the zero fallback.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchFallbackZeroAfterRecovery', 0, () => {
      const first: number = wrappedBatchCount(true, store, createSeedContacts().slice(0, 3));
      const failed: number = wrappedBatchCount(false, new StoreDouble(), createSeedContacts());
      const third: number = wrappedBatchCount(true, store, createSeedContacts().slice(3, 4));
      logStep('batch-zero', String(first) + '/' + String(failed) + '/' + String(third));
      expect(first).assertEqual(3);
      expect(failed).assertEqual(0);
      expect(third).assertEqual(1);
      expect(store.rowCount()).assertEqual(4);
      expect(countOf(store.names(), '本')).assertEqual(1);
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_SQL_EXECUTION)).assertEqual(0);
    });

    /**
     * @tc.name   catalogOperationNamesAreUnique
     * @tc.desc   The catalog lists eight distinct operation names before any fallback is requested.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogOperationNamesAreUnique', 0, () => {
      const operations: string[] = OperationCatalog.all();
      const distinct: string[] = uniqueStrings(operations);
      logStep('catalog', joined(operations, ','));
      expect(operations.length).assertEqual(8);
      expect(distinct.length).assertEqual(operations.length);
      expect(operations.indexOf(OperationCatalog.BATCH_INSERT)).assertEqual(2);
      expect(operations[7]).assertEqual(OperationCatalog.DEDUPE_ROWS);
      expect(operations.indexOf(OperationCatalog.UPDATE_ONE)).assertEqual(5);
    });

    /**
     * @tc.name   onlyNoneCodeIsZero
     * @tc.desc   Four failure codes are strictly positive and only ERROR_NONE holds the zero value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('onlyNoneCodeIsZero', 0, () => {
      const codes: number[] = [ERROR_CONTEXT_MISSING, ERROR_STORE_INIT, ERROR_SQL_EXECUTION, ERROR_TABLE_MISSING];
      let positive = 0;
      for (let index = 0; index < codes.length; index++) {
        if (codes[index] > 0) {
          positive = positive + 1;
        }
      }
      const distinct: string[] = uniqueStrings([
        String(codes[0]), String(codes[1]), String(codes[2]), String(codes[3])
      ]);
      logStep('positive-codes', String(positive));
      expect(positive).assertEqual(4);
      expect(positive).assertEqual(codes.length);
      expect(distinct.length).assertEqual(4);
      expect(ERROR_NONE).assertEqual(0);
      expect(ERROR_NONE < codes[0]).assertTrue();
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_NONE)).assertEqual(0);
    });

    /**
     * @tc.name   gateFailureLogKeepsErrorCode
     * @tc.desc   Every rejected attempt writes its numeric code into the gate log and skips the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecoveryLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('gateFailureLogKeepsErrorCode', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 2);
      manager = resetContactManager(rows);
      store = new StoreDouble();
      store.batchInsert(true, rows);
      gate = new CommitGate(manager, store);
      gate.attempt(contactOf('阿诺德', '16600000000', 'a@example.com', '甲地'), ERROR_SQL_EXECUTION);
      gate.attempt(contactOf('贝拉', '11100000000', 'b@example.com', '乙地'), ERROR_TABLE_MISSING);
      logStep('gate-log', gate.log.trace());
      expect(gate.log.size()).assertEqual(2);
      expect(gate.log.steps[0]).assertEqual('failed:14800015');
      expect(gate.log.steps[1]).assertEqual('failed:14800001');
      expect(gate.log.last()).assertEqual('failed:14800001');
      expect(gate.successes).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
    });
  });
}
