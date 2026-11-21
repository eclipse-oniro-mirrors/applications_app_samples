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
 * DatabaseInitLifecycle pins the initialization contract of the sample:
 *
 *   DatabaseConnection.ets:69-89    a missing context returns before any work
 *   DatabaseConnection.ets:76-79    an existing store short circuits the call
 *   DatabaseConnection.ets:81-88    store creation is followed by createTable
 *   DatabaseConnection.ets:94-107   createTable executes SQL_CREATE_TABLE
 *   DatabaseConnection.ets:139-181  batch insert lazily initializes the store
 *   DatabaseConnection.ets:116-134  query returns [] on an invalid context
 *   RdbConstant.ets:31-38           table name, schema text and store config
 *
 * StoreDouble keeps the same observable counters, so each case can pin both
 * the boolean outcome and the number of side effects that produced it.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  StoreDouble,
  SchemaInfo,
  ContactMapper,
  Bucket,
  BUCKET_KEYS,
  SQL_CREATE_CONTACT,
  TABLE_CONTACT,
  INITIAL_STORE_VALUE,
  EXPECTED_INSERT_ROW,
  createSeedContacts,
  contactOf,
  cloneContact,
  contactNames,
  sameStringArray,
  joined,
  resetContactManager,
  wrappedBatchCount,
  wrappedQueryResult,
  expectedBatchCount,
  continuesWithoutContext,
  textFingerprint
} from '../Shared/SharedDriver';

/** One recorded init attempt, captured immediately after StoreDouble.init. */
class InitObservation {
  public label: string;
  public accepted: boolean;
  public attempts: number;
  public tables: number;
  public initialized: boolean;
  public contextValid: boolean;

  constructor(label: string, accepted: boolean, attempts: number, tables: number,
    initialized: boolean, contextValid: boolean) {
    this.label = label;
    this.accepted = accepted;
    this.attempts = attempts;
    this.tables = tables;
    this.initialized = initialized;
    this.contextValid = contextValid;
  }

  public describe(): string {
    return this.label + '|' + String(this.accepted) + '|' + String(this.attempts) + '|' +
      String(this.tables) + '|' + String(this.initialized);
  }
}

/** Records every init attempt of one store so sequences can be asserted. */
class InitLedger {
  public entries: InitObservation[] = [];

  public record(store: StoreDouble, label: string, contextValid: boolean): InitObservation {
    const accepted: boolean = store.init(contextValid);
    const entry = new InitObservation(label, accepted, store.initCalls, store.createTableCalls,
      store.initialized, contextValid);
    this.entries.push(entry);
    return entry;
  }

  public size(): number {
    return this.entries.length;
  }

  public acceptedCount(): number {
    let total = 0;
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].accepted) {
        total = total + 1;
      }
    }
    return total;
  }

  public rejectedCount(): number {
    return this.entries.length - this.acceptedCount();
  }

  public last(): InitObservation {
    return this.entries[this.entries.length - 1];
  }

  public labels(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.entries.length; index++) {
      result.push(this.entries[index].label);
    }
    return result;
  }

  public trace(): string {
    return joined(this.labels(), '>');
  }

  public clear(): void {
    this.entries = [];
  }
}

/** Writes the seeded rows through the lazy batch path and returns the count. */
function seedStore(store: StoreDouble, rows: Contact[]): number {
  return store.batchInsert(true, rows);
}

/** Builds a store that already accepted one valid initialization. */
function preparedStore(): StoreDouble {
  const store = new StoreDouble();
  store.init(true);
  return store;
}

export default function databaseInitLifecycleTest(): void {
  describe('DatabaseInitLifecycle', () => {
    let store: StoreDouble = new StoreDouble();
    let ledger: InitLedger = new InitLedger();
    let manager: ContactManager = resetContactManager();

    beforeAll(() => {
      logSuite('DatabaseInitLifecycle', 'begin');
    });

    beforeEach(async () => {
      manager = resetContactManager();
      store = new StoreDouble();
      ledger = new InitLedger();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('DatabaseInitLifecycle', 'end');
    });

    /**
     * @tc.name   validContextInitializesStoreAndCreatesTable
     * @tc.desc   A valid context flips the initialized flag and runs createTable exactly once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('validContextInitializesStoreAndCreatesTable', 0, () => {
      const accepted: boolean = store.init(true);
      logStep('init', 'accepted=' + String(accepted));
      expect(accepted).assertTrue();
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.lastContextValid).assertTrue();
      expect(store.rowCount()).assertEqual(INITIAL_STORE_VALUE);
      expect(TABLE_CONTACT).assertEqual('contact');
    });

    /**
     * @tc.name   invalidContextLeavesStoreUninitialized
     * @tc.desc   A missing context returns false before the table step in initRdbStore.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('invalidContextLeavesStoreUninitialized', 0, () => {
      const accepted: boolean = store.init(false);
      logStep('init-reject', 'accepted=' + String(accepted));
      expect(accepted).assertFalse();
      expect(store.initialized).assertFalse();
      expect(store.lastContextValid).assertFalse();
      expect(store.createTableCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   invalidAttemptStillCountsAndRecordsContext
     * @tc.desc   The attempt counter advances even when the context guard rejects the call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('invalidAttemptStillCountsAndRecordsContext', 0, () => {
      store.init(false);
      store.init(false);
      logStep('init-counters', 'attempts=' + String(store.initCalls));
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.lastContextValid).assertFalse();
      expect(store.queryCalls).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
    });

    /**
     * @tc.name   secondValidInitIsRejectedAndKeepsTableCount
     * @tc.desc   The rdbStore is exist early return keeps initCalls counting but createTable at one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('secondValidInitIsRejectedAndKeepsTableCount', 0, () => {
      const first: boolean = store.init(true);
      const second: boolean = store.init(true);
      logStep('init-twice', 'first=' + String(first) + ' second=' + String(second));
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.lastContextValid).assertTrue();
    });

    /**
     * @tc.name   initAfterSuccessWithInvalidContextKeepsFlagAndRows
     * @tc.desc   A later invalid attempt cannot uninitialize a store that already holds rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('initAfterSuccessWithInvalidContextKeepsFlagAndRows', 0, () => {
      const prepared: StoreDouble = preparedStore();
      seedStore(prepared, createSeedContacts());
      const before: number = prepared.rowCount();
      const rejected: boolean = prepared.init(false);
      const rows: Contact[] = prepared.query(true);
      logStep('init-guard', 'before=' + String(before) + ' after=' + String(prepared.rowCount()));
      expect(rejected).assertFalse();
      expect(prepared.initialized).assertTrue();
      expect(prepared.rowCount()).assertEqual(before);
      expect(rows.length).assertEqual(before);
      expect(prepared.initCalls).assertEqual(2);
      expect(prepared.lastContextValid).assertFalse();
    });

    /**
     * @tc.name   ledgerRecordsMixedAttemptSequence
     * @tc.desc   A recorded sequence of four attempts keeps order, labels and acceptance counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('ledgerRecordsMixedAttemptSequence', 0, () => {
      ledger.record(store, 'cold', false);
      ledger.record(store, 'retry', true);
      ledger.record(store, 'warm', true);
      ledger.record(store, 'lost', false);
      logStep('ledger', ledger.trace());
      expect(ledger.size()).assertEqual(4);
      expect(ledger.acceptedCount()).assertEqual(1);
      expect(ledger.rejectedCount()).assertEqual(3);
      expect(ledger.last().label).assertEqual('lost');
      expect(ledger.last().initialized).assertTrue();
      expect(ledger.trace()).assertEqual('cold>retry>warm>lost');
      expect(store.createTableCalls).assertEqual(1);
    });

    /**
     * @tc.name   batchInsertOnFreshStoreInitializesImplicitly
     * @tc.desc   batchInsertData initializes a missing store and then writes every seeded row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchInsertOnFreshStoreInitializesImplicitly', 0, () => {
      const rows: Contact[] = createSeedContacts();
      const written: number = seedStore(store, rows);
      logStep('lazy-init', 'written=' + String(written));
      expect(written).assertEqual(rows.length);
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(rows.length);
      expect(store.lastContextValid).assertTrue();
    });

    /**
     * @tc.name   batchInsertAfterExplicitInitSkipsSecondInitialization
     * @tc.desc   A store that was initialized by hand is reused by the batch path without a new table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertAfterExplicitInitSkipsSecondInitialization', 0, () => {
      store.init(true);
      const written: number = seedStore(store, createSeedContacts());
      logStep('reuse-init', 'written=' + String(written));
      expect(written).assertEqual(15);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.rowCount()).assertEqual(15);
    });

    /**
     * @tc.name   batchInsertWithInvalidContextReturnsMinusOne
     * @tc.desc   The lazy initialization inside batchInsertData fails, so the negative count surfaces.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertWithInvalidContextReturnsMinusOne', 0, () => {
      const written: number = store.batchInsert(false, createSeedContacts());
      logStep('batch-reject', 'written=' + String(written));
      expect(written).assertEqual(-1);
      expect(store.initialized).assertFalse();
      expect(store.batchCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   batchInsertWithInvalidContextWritesNoRows
     * @tc.desc   Even a fifteen row payload leaves the row list empty when the context guard rejects it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertWithInvalidContextWritesNoRows', 0, () => {
      const rows: Contact[] = createSeedContacts();
      const written: number = store.batchInsert(false, rows);
      logStep('batch-reject-rows', 'requested=' + String(rows.length) + ' written=' + String(written));
      expect(written).assertEqual(-1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.lastContextValid).assertFalse();
      expect(store.createTableCalls).assertEqual(0);
    });

    /**
     * @tc.name   queryBeforeAnyInitReturnsEmptyArray
     * @tc.desc   A valid-context query on a never-initialized store yields no rows and no table work.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryBeforeAnyInitReturnsEmptyArray', 0, () => {
      const rows: Contact[] = store.query(true);
      logStep('query-cold', 'length=' + String(rows.length));
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   queryCounterAdvancesForEveryQuery
     * @tc.desc   Each query call increments queryCalls regardless of how many rows are visible.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryCounterAdvancesForEveryQuery', 0, () => {
      store.init(true);
      seedStore(store, createSeedContacts().slice(0, 4));
      store.query(true);
      store.query(true);
      store.query(false);
      logStep('query-counters', 'calls=' + String(store.queryCalls));
      expect(store.queryCalls).assertEqual(3);
      expect(store.rowCount()).assertEqual(4);
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
    });

    /**
     * @tc.name   queryWithInvalidContextShortCircuitsToEmpty
     * @tc.desc   DatabaseConnection.query returns an empty array before it touches a stale store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryWithInvalidContextShortCircuitsToEmpty', 0, () => {
      const prepared: StoreDouble = preparedStore();
      seedStore(prepared, createSeedContacts());
      const visible: Contact[] = prepared.query(false);
      logStep('query-invalid', 'visible=' + String(visible.length));
      expect(visible.length).assertEqual(0);
      expect(prepared.rowCount()).assertEqual(15);
      expect(prepared.queryCalls).assertEqual(1);
      expect(prepared.batchCalls).assertEqual(1);
      expect(prepared.initialized).assertTrue();
      expect(prepared.lastContextValid).assertTrue();
    });

    /**
     * @tc.name   queryAfterInitReturnsClonedRows
     * @tc.desc   The materialized rows match the seeded payload field by field after a valid init.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryAfterInitReturnsClonedRows', 0, () => {
      const payload: Contact[] = createSeedContacts();
      store.init(true);
      seedStore(store, payload);
      const visible: Contact[] = store.query(true);
      logStep('query-warm', 'visible=' + String(visible.length));
      expect(visible.length).assertEqual(payload.length);
      expect(visible[0].name).assertEqual(payload[0].name);
      expect(visible[14].phone).assertEqual(payload[14].phone);
      expect(visible[6].category).assertEqual('C');
      expect(sameStringArray(contactNames(visible), contactNames(payload))).assertTrue();
      expect(store.queryCalls).assertEqual(1);
    });

    /**
     * @tc.name   queryResultMutationDoesNotAffectStore
     * @tc.desc   Rows returned by query are copies, so editing one cannot rewrite the stored row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryResultMutationDoesNotAffectStore', 0, () => {
      const payload: Contact[] = createSeedContacts();
      store.init(true);
      seedStore(store, payload);
      const first: Contact[] = store.query(true);
      first[0].phone = '00000000000';
      first[0].name = 'mutated';
      const second: Contact[] = store.query(true);
      logStep('query-copy', 'storeName=' + second[0].name);
      expect(second[0].phone).assertEqual(payload[0].phone);
      expect(second[0].name).assertEqual(payload[0].name);
      expect(store.rows[0].phone).assertEqual(payload[0].phone);
      expect(store.rowCount()).assertEqual(payload.length);
      expect(store.queryCalls).assertEqual(2);
    });

    /**
     * @tc.name   initThenBatchInsertThenQueryRoundTripKeepsOrder
     * @tc.desc   The full cold start sequence preserves the seeded row order end to end.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('initThenBatchInsertThenQueryRoundTripKeepsOrder', 0, () => {
      const payload: Contact[] = createSeedContacts();
      const accepted: boolean = store.init(true);
      const written: number = seedStore(store, payload);
      const visible: Contact[] = store.query(true);
      logStep('round-trip', 'accepted=' + String(accepted) + ' written=' + String(written));
      expect(accepted).assertTrue();
      expect(written).assertEqual(15);
      expect(visible.length).assertEqual(15);
      expect(visible[1].name).assertEqual('阿诺德');
      expect(visible[3].category).assertEqual('B');
      expect(sameStringArray(contactNames(visible), contactNames(payload))).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(1);
    });

    /**
     * @tc.name   rowCountStaysZeroAfterInitOnly
     * @tc.desc   Initializing the store creates the table but does not seed any contact row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rowCountStaysZeroAfterInitOnly', 0, () => {
      const accepted: boolean = store.init(true);
      const names: string[] = store.names();
      logStep('init-empty', 'rows=' + String(store.rowCount()));
      expect(accepted).assertTrue();
      expect(store.rowCount()).assertEqual(0);
      expect(names.length).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
      expect(store.insertCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(1);
    });

    /**
     * @tc.name   wrappedBatchCountMasksNegativeResultAsZero
     * @tc.desc   taskPoolExecuteBatchInsert returns 0 when the inner call reports a failure.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('wrappedBatchCountMasksNegativeResultAsZero', 0, () => {
      const failed: number = wrappedBatchCount(false, store, createSeedContacts());
      const visible: number = store.rowCount();
      logStep('wrapper-mask', 'failed=' + String(failed) + ' rows=' + String(visible));
      expect(failed).assertEqual(0);
      expect(visible).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.batchCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   wrappedQueryResultSkipsStoreWhenContextMissing
     * @tc.desc   taskPoolExecuteQuery falls back to an empty array without reading the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('wrappedQueryResultSkipsStoreWhenContextMissing', 0, () => {
      const prepared: StoreDouble = preparedStore();
      seedStore(prepared, createSeedContacts());
      const rows: Contact[] = wrappedQueryResult(false, prepared);
      logStep('wrapper-query', 'length=' + String(rows.length));
      expect(rows.length).assertEqual(0);
      expect(prepared.queryCalls).assertEqual(0);
      expect(prepared.rowCount()).assertEqual(15);
      expect(prepared.initialized).assertTrue();
      expect(continuesWithoutContext(false)).assertTrue();
    });

    /**
     * @tc.name   ledgerClearEmptiesRecordedAttempts
     * @tc.desc   Clearing the ledger drops every observation while the store keeps its own counters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('ledgerClearEmptiesRecordedAttempts', 0, () => {
      ledger.record(store, 'cold', false);
      ledger.record(store, 'retry', true);
      const before: number = ledger.size();
      ledger.clear();
      logStep('ledger-clear', 'before=' + String(before) + ' after=' + String(ledger.size()));
      expect(before).assertEqual(2);
      expect(ledger.size()).assertEqual(0);
      expect(ledger.acceptedCount()).assertEqual(0);
      expect(store.initCalls).assertEqual(2);
      expect(store.initialized).assertTrue();
      expect(store.createTableCalls).assertEqual(1);
    });

    /**
     * @tc.name   resetClearsInitCountersToDefaults
     * @tc.desc   StoreDouble.reset returns every init related field to its zero default.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetClearsInitCountersToDefaults', 0, () => {
      store.init(true);
      seedStore(store, createSeedContacts().slice(0, 3));
      store.reset();
      logStep('reset-counters', 'init=' + String(store.initCalls) + ' table=' + String(store.createTableCalls));
      expect(store.initCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.lastContextValid).assertFalse();
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   initAfterResetSucceedsAgain
     * @tc.desc   A reset store behaves like a cold store, so the next valid init is accepted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('initAfterResetSucceedsAgain', 0, () => {
      store.init(true);
      store.reset();
      const accepted: boolean = store.init(true);
      logStep('init-after-reset', 'accepted=' + String(accepted));
      expect(accepted).assertTrue();
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.lastContextValid).assertTrue();
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   schemaColumnsMatchBucketKeys
     * @tc.desc   The parsed CREATE TABLE columns line up with the six data keys used by every bucket.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaColumnsMatchBucketKeys', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      const dataColumns: string[] = schema.columns.slice(1);
      logStep('schema-columns', joined(dataColumns, ','));
      expect(schema.table).assertEqual(TABLE_CONTACT);
      expect(schema.columnCount()).assertEqual(7);
      expect(sameStringArray(dataColumns, BUCKET_KEYS)).assertTrue();
      expect(schema.hasColumn('avatar')).assertTrue();
      expect(schema.hasColumn('category')).assertTrue();
      expect(schema.hasColumn('id')).assertTrue();
    });

    /**
     * @tc.name   schemaNotNullColumnsAreSixDataColumns
     * @tc.desc   Only the six payload columns are declared NOT NULL, so a bucket must always fill them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaNotNullColumnsAreSixDataColumns', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      logStep('schema-not-null', joined(schema.notNullColumns, ','));
      expect(schema.notNullColumns.length).assertEqual(6);
      expect(sameStringArray(schema.notNullColumns, BUCKET_KEYS)).assertTrue();
      expect(schema.isNotNull('name')).assertTrue();
      expect(schema.isNotNull('address')).assertTrue();
      expect(schema.isNotNull('id')).assertFalse();
    });

    /**
     * @tc.name   schemaPrimaryKeyAndAutoincrementAreStable
     * @tc.desc   The id column stays the autoincrement primary key after re-parsing the literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaPrimaryKeyAndAutoincrementAreStable', 0, () => {
      const first: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);
      const second: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);
      const contact: Contact = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'D');
      const bucket: Bucket = ContactMapper.toBucket(contact);
      logStep('schema-key', first.primaryKey + '|' + String(first.autoincrement));
      expect(first.primaryKey).assertEqual('id');
      expect(second.primaryKey).assertEqual(first.primaryKey);
      expect(first.autoincrement).assertTrue();
      expect(second.autoincrement).assertTrue();
      expect(first.describe()).assertEqual(second.describe());
      expect(bucket.size()).assertEqual(first.notNullColumns.length);
    });

    /**
     * @tc.name   schemaFingerprintIsDeterministicAcrossParses
     * @tc.desc   Hashing the schema description twice produces one value, so drift is detectable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaFingerprintIsDeterministicAcrossParses', 0, () => {
      const first = new SchemaInfo(SQL_CREATE_CONTACT);
      const second = new SchemaInfo(SQL_CREATE_CONTACT);
      const firstHash: number = textFingerprint(first.describe());
      const secondHash: number = textFingerprint(second.describe());
      logStep('schema-hash', String(firstHash));
      expect(firstHash).assertEqual(secondHash);
      expect(firstHash > 0).assertTrue();
      expect(first.describe().indexOf(TABLE_CONTACT)).assertEqual(0);
      expect(SQL_CREATE_CONTACT.indexOf('IF NOT EXISTS') >= 0).assertTrue();
      expect(TABLE_CONTACT).assertEqual('contact');
      expect(EXPECTED_INSERT_ROW).assertEqual(1);
    });

    /**
     * @tc.name   expectedBatchCountMatchesSeedLength
     * @tc.desc   The batch oracle mirrors the fifteen rows seeded by aboutToAppear.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('expectedBatchCountMatchesSeedLength', 0, () => {
      const rows: Contact[] = createSeedContacts();
      const oracle: number = expectedBatchCount(rows);
      const written: number = seedStore(store, rows);
      logStep('batch-oracle', 'oracle=' + String(oracle) + ' written=' + String(written));
      expect(oracle).assertEqual(15);
      expect(written).assertEqual(oracle);
      expect(store.batchCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(oracle);
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   continuesWithoutContextMatchesInvalidContext
     * @tc.desc   The page guard mirrors the context check: only a missing context lets the flow continue.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('continuesWithoutContextMatchesInvalidContext', 0, () => {
      const invalid: boolean = continuesWithoutContext(false);
      const valid: boolean = continuesWithoutContext(true);
      logStep('context-guard', 'invalid=' + String(invalid) + ' valid=' + String(valid));
      expect(invalid).assertTrue();
      expect(valid).assertFalse();
      expect(store.init(true)).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
    });

    /**
     * @tc.name   managerSeedIsIndependentOfStoreInit
     * @tc.desc   Seeding the ContactManager singleton neither initializes nor fills the relational store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerSeedIsIndependentOfStoreInit', 0, () => {
      const seeded: ContactManager = resetContactManager(createSeedContacts());
      const before: number = seeded.getContacts().length;
      const accepted: boolean = store.init(true);
      logStep('manager-seed', 'manager=' + String(before) + ' accepted=' + String(accepted));
      expect(before).assertEqual(15);
      expect(seeded.getContacts()[0].name).assertEqual('艾德里安');
      expect(store.initCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(accepted).assertTrue();
      expect(ContactManager.getInstance() === seeded).assertTrue();
    });

    /**
     * @tc.name   batchInsertDoesNotTouchContactManager
     * @tc.desc   The store write path is independent from the in-memory manager cache.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertDoesNotTouchContactManager', 0, () => {
      const cached: ContactManager = resetContactManager(createSeedContacts().slice(0, 2));
      const written: number = seedStore(store, createSeedContacts());
      logStep('batch-manager', 'written=' + String(written) + ' cached=' + String(cached.getContacts().length));
      expect(written).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(cached.getContacts().length).assertEqual(2);
      expect(manager.getContacts().length).assertEqual(2);
      expect(store.query(true).length).assertEqual(15);
    });

    /**
     * @tc.name   initObservationDescribeCarriesLabelAndFlags
     * @tc.desc   The ledger observation keeps the label, the acceptance flag and the side effect counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('initObservationDescribeCarriesLabelAndFlags', 0, () => {
      const observation: InitObservation = ledger.record(store, 'first-boot', true);
      logStep('observation', observation.describe());
      expect(observation.label).assertEqual('first-boot');
      expect(observation.accepted).assertTrue();
      expect(observation.attempts).assertEqual(1);
      expect(observation.tables).assertEqual(1);
      expect(observation.describe()).assertEqual('first-boot|true|1|1|true');
      expect(ledger.last() === observation).assertTrue();
      expect(store.initialized).assertTrue();
    });

    /**
     * @tc.name   repeatedBatchInsertKeepsSingleInitialization
     * @tc.desc   Two batch writes over one store share the first initialization and append in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedBatchInsertKeepsSingleInitialization', 0, () => {
      const firstPayload: Contact[] = createSeedContacts().slice(0, 5);
      const secondPayload: Contact[] = createSeedContacts().slice(5, 9);
      const first: number = seedStore(store, firstPayload);
      const second: number = seedStore(store, secondPayload);
      logStep('batch-twice', 'first=' + String(first) + ' second=' + String(second));
      expect(first).assertEqual(5);
      expect(second).assertEqual(4);
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(9);
      expect(store.names()[5]).assertEqual('卡梅隆');
    });

    /**
     * @tc.name   queryAfterInitWithoutBatchReturnsEmptyAndCounts
     * @tc.desc   A warmed but unseeded store answers an empty query and still records the call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryAfterInitWithoutBatchReturnsEmptyAndCounts', 0, () => {
      const accepted: boolean = store.init(true);
      const rows: Contact[] = store.query(true);
      logStep('query-empty-warm', 'accepted=' + String(accepted) + ' rows=' + String(rows.length));
      expect(accepted).assertTrue();
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertTrue();
    });

    /**
     * @tc.name   ledgerRecordsInitTransitionsWithSharedStore
     * @tc.desc   A valid, invalid then valid sequence leaves three attempts and one table creation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('ledgerRecordsInitTransitionsWithSharedStore', 0, () => {
      ledger.record(store, 'boot', true);
      ledger.record(store, 'suspend', false);
      ledger.record(store, 'resume', true);
      logStep('ledger-transitions', ledger.trace());
      expect(ledger.size()).assertEqual(3);
      expect(ledger.acceptedCount()).assertEqual(1);
      expect(ledger.rejectedCount()).assertEqual(2);
      expect(store.initCalls).assertEqual(3);
      expect(store.createTableCalls).assertEqual(1);
      expect(ledger.entries[1].accepted).assertFalse();
      expect(ledger.entries[1].initialized).assertTrue();
    });

    /**
     * @tc.name   wrappedBatchCountPassesThroughPositiveCount
     * @tc.desc   The taskpool wrapper keeps the real row count when the batch write succeeds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('wrappedBatchCountPassesThroughPositiveCount', 0, () => {
      const payload: Contact[] = createSeedContacts().slice(0, 6);
      const reported: number = wrappedBatchCount(true, store, payload);
      logStep('wrapper-pass', 'reported=' + String(reported));
      expect(reported).assertEqual(6);
      expect(reported).assertEqual(payload.length);
      expect(store.rowCount()).assertEqual(6);
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(wrappedBatchCount(true, store, createSeedContacts().slice(6, 10))).assertEqual(4);
      expect(store.rowCount()).assertEqual(10);
    });

    /**
     * @tc.name   batchInsertOfEmptyArrayCountsButWritesNothing
     * @tc.desc   An empty payload still executes the batch path, initializing the store with zero rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('batchInsertOfEmptyArrayCountsButWritesNothing', 0, () => {
      const empty: Contact[] = [];
      const written: number = store.batchInsert(true, empty);
      logStep('batch-empty', 'written=' + String(written));
      expect(written).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   consecutiveQueriesReturnIndependentSnapshots
     * @tc.desc   Each query materializes its own array, so clearing one never affects the next.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('consecutiveQueriesReturnIndependentSnapshots', 0, () => {
      const payload: Contact[] = createSeedContacts().slice(0, 5);
      seedStore(store, payload);
      const first: Contact[] = store.query(true);
      const removed: Contact[] = first.splice(0, 2);
      const second: Contact[] = store.query(true);
      logStep('query-independent', 'removed=' + String(removed.length) + ' second=' + String(second.length));
      expect(removed.length).assertEqual(2);
      expect(first.length).assertEqual(3);
      expect(second.length).assertEqual(5);
      expect(store.rowCount()).assertEqual(5);
      expect(second[0].name).assertEqual(payload[0].name);
      expect(store.queryCalls).assertEqual(2);
    });

    /**
     * @tc.name   managerResetDoesNotClearStoreRows
     * @tc.desc   Clearing the ContactManager cache leaves the relational store contents untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerResetDoesNotClearStoreRows', 0, () => {
      seedStore(store, createSeedContacts());
      manager = resetContactManager(createSeedContacts());
      const cachedBefore: number = manager.getContacts().length;
      resetContactManager();
      const cachedAfter: number = manager.getContacts().length;
      const storedRows: number = store.query(true).length;
      logStep('manager-reset', 'before=' + String(cachedBefore) + ' after=' + String(cachedAfter));
      expect(cachedBefore).assertEqual(15);
      expect(cachedAfter).assertEqual(0);
      expect(storedRows).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
    });
  });
}
