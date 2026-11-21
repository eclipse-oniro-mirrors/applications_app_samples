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

/*
 * Database initialization and operation accounting. Anchors:
 *   DatabaseConnection.ets:69-89    initRdbStore early return, store reuse, createTable
 *   DatabaseConnection.ets:94-107   CREATE TABLE execution
 *   DatabaseConnection.ets:116-134  querySql fallback to an empty array
 *   DatabaseConnection.ets:139-181  batch insert and row count
 *   DatabaseConnection.ets:187-221  insert with ON_CONFLICT_REPLACE
 *   DatabaseConnection.ets:226-236  delete by name
 *   DatabaseConnection.ets:241-272  update binds phone, email and address
 *   RdbConstant.ets:31-38           table, schema and store configuration
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  TABLE_CONTACT,
  STORE_NAME,
  STORE_ABILITY,
  SQL_CREATE_CONTACT,
  BUCKET_KEYS,
  SchemaInfo,
  StoreDouble,
  CursorResultSet,
  readContactsFromResultSet,
  expectedVisibleRows,
  expectedBatchCount,
  expectedAfterDelete,
  wrappedBatchCount,
  wrappedQueryResult,
  fallbackForOperation,
  continuesWithoutContext,
  ContactMapper,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  sameStringArray,
  countOf,
  joined,
  resetContactManager,
  OperationCatalog,
  ERROR_NONE,
  ERROR_CONTEXT_MISSING,
  ERROR_STORE_INIT,
  ERROR_SQL_EXECUTION,
  ERROR_TABLE_MISSING
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

export default function databaseInitIntegrationTest(): void {
  describe('DatabaseInitIntegration', () => {
    const store: StoreDouble = new StoreDouble();

    beforeAll(() => {
      logSuite('DatabaseInitIntegration', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      store.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('DatabaseInitIntegration', 'end');
    });

    /**
     * @tc.name   initOnceCreatesTheTableAndReportsTrue
     * @tc.desc   The first successful init returns true, marks the store initialized and creates the table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('initOnceCreatesTheTableAndReportsTrue', 0, () => {
      const created = store.init(true);
      logStep('initOnceCreatesTheTableAndReportsTrue', String(created));
      expect(created).assertTrue();
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.lastContextValid).assertTrue();
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   initTwiceSkipsTheSecondCreation
     * @tc.desc   The production early return keeps the existing store, so a second init returns false.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('initTwiceSkipsTheSecondCreation', 0, () => {
      expect(store.init(true)).assertTrue();
      expect(store.init(true)).assertFalse();
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   initWithoutContextReturnsFalse
     * @tc.desc   A missing ability context terminates init before table creation and records the attempt.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('initWithoutContextReturnsFalse', 0, () => {
      expect(store.init(false)).assertFalse();
      expect(store.initialized).assertFalse();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.lastContextValid).assertFalse();
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   initRecordsWhetherTheContextWasValid
     * @tc.desc   A failed init followed by a valid one flips the recorded context flag and initializes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('initRecordsWhetherTheContextWasValid', 0, () => {
      store.init(false);
      expect(store.lastContextValid).assertFalse();
      const second = store.init(true);
      expect(second).assertTrue();
      expect(store.lastContextValid).assertTrue();
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
    });

    /**
     * @tc.name   schemaHasSevenColumnsAfterInit
     * @tc.desc   The CREATE TABLE literal parsed independently declares id plus the six business columns.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaHasSevenColumnsAfterInit', 0, () => {
      store.init(true);
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.columnCount()).assertEqual(7);
      expect(schema.columns[0]).assertEqual('id');
      expect(schema.columns[1]).assertEqual('name');
      expect(schema.columns[6]).assertEqual('category');
      expect(schema.hasColumn('avatar')).assertTrue();
      expect(schema.hasColumn('id')).assertTrue();
      expect(store.createTableCalls).assertEqual(1);
    });

    /**
     * @tc.name   schemaMarksSixBusinessColumnsNotNull
     * @tc.desc   Every business column is NOT NULL while the autoincrement id is not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaMarksSixBusinessColumnsNotNull', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.notNullColumns.length).assertEqual(6);
      for (let index = 0; index < BUCKET_KEYS.length; index++) {
        expect(schema.isNotNull(BUCKET_KEYS[index])).assertTrue();
      }
      expect(schema.isNotNull('id')).assertFalse();
      expect(schema.primaryKey).assertEqual('id');
    });

    /**
     * @tc.name   schemaPrimaryKeyIsAutoincrementId
     * @tc.desc   The id column is the only primary key and carries AUTOINCREMENT in the literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaPrimaryKeyIsAutoincrementId', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.primaryKey).assertEqual('id');
      expect(schema.autoincrement).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('AUTOINCREMENT') > 0).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('PRIMARY KEY') > 0).assertTrue();
      expect(schema.columns.indexOf('id')).assertEqual(0);
    });

    /**
     * @tc.name   schemaTableAndStoreConfigurationMatchConstants
     * @tc.desc   Table name, database file and ability literals round trip through the driver exports.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaTableAndStoreConfigurationMatchConstants', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.table).assertEqual(TABLE_CONTACT);
      expect(TABLE_CONTACT).assertEqual('contact');
      expect(STORE_NAME).assertEqual('contact.db');
      expect(STORE_ABILITY).assertEqual('EntryAbility');
      expect(schema.describe().startsWith('contact|')).assertTrue();
      expect(schema.describe().indexOf('|true')).assertEqual(schema.describe().length - 5);
    });

    /**
     * @tc.name   schemaLookupRejectsUnknownColumn
     * @tc.desc   Column lookups are exact, so an unknown or differently cased name is not found.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaLookupRejectsUnknownColumn', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.hasColumn('Name')).assertFalse();
      expect(schema.hasColumn('nickname')).assertFalse();
      expect(schema.hasColumn('')).assertFalse();
      expect(schema.isNotNull('Name')).assertFalse();
      expect(schema.columnCount()).assertEqual(7);
      expect(schema.hasColumn('email')).assertTrue();
    });

    /**
     * @tc.name   batchAfterInitWritesAllSeedRows
     * @tc.desc   An explicit init followed by a batch writes fifteen rows without re-creating the table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchAfterInitWritesAllSeedRows', 0, () => {
      store.init(true);
      const written = store.batchInsert(true, createSeedContacts());
      expect(written).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(expectedBatchCount(createSeedContacts())).assertEqual(15);
      expect(store.names()[14]).assertEqual('法里');
    });

    /**
     * @tc.name   batchAutoInitializesWithoutExplicitInit
     * @tc.desc   A first batch on an uninitialized store initializes it once before writing rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchAutoInitializesWithoutExplicitInit', 0, () => {
      expect(store.initialized).assertFalse();
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(4);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   queryOnFreshStoreDoesNotCreateTheTable
     * @tc.desc   Query is read only in the double: it counts the call but leaves initialization untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryOnFreshStoreDoesNotCreateTheTable', 0, () => {
      const rows = store.query(true);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(wrappedQueryResult(true, store).length).assertEqual(0);
      expect(store.queryCalls).assertEqual(2);
    });

    /**
     * @tc.name   batchWithoutContextFallsBackToZero
     * @tc.desc   A batch that cannot initialize returns the wrapper zero rather than a negative count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchWithoutContextFallsBackToZero', 0, () => {
      const seed = createSeedContacts();
      expect(store.batchInsert(false, seed)).assertEqual(-1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initialized).assertFalse();
      expect(wrappedBatchCount(false, store, seed)).assertEqual(0);
      expect(store.batchCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   insertOnFreshStoreLazilyInitializes
     * @tc.desc   A single insert initializes the missing store itself and then appends the contact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertOnFreshStoreLazilyInitializes', 0, () => {
      const draft = contactOf('初次插入', '13900001111', 'first@example.com', '初次地址');
      const rowId = store.insert(true, draft, 'ON_CONFLICT_REPLACE');
      expect(rowId).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(1);
      expect(sameContact(store.rows[0], draft)).assertTrue();
    });

    /**
     * @tc.name   insertAccountingCountsEachAttempt
     * @tc.desc   Three inserts raise the insert counter by three and the table counter not at all.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertAccountingCountsEachAttempt', 0, () => {
      store.init(true);
      store.insert(true, contactOf('甲', '13500001111', 'a@example.com', '甲地'), 'ON_CONFLICT_REPLACE');
      store.insert(true, contactOf('乙', '13500002222', 'b@example.com', '乙地'), 'ON_CONFLICT_REPLACE');
      store.insert(true, contactOf('丙', '13500003333', 'c@example.com', '丙地'), 'ON_CONFLICT_REPLACE');
      expect(store.insertCalls).assertEqual(3);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(3);
      expect(sameStringArray(store.names(), ['甲', '乙', '丙'])).assertTrue();
      expect(store.names()[2]).assertEqual('丙');
    });

    /**
     * @tc.name   updateOnUninitializedStoreLeavesItEmpty
     * @tc.desc   The update double touches only rows and does not initialize or create the table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateOnUninitializedStoreLeavesItEmpty', 0, () => {
      const affected = store.updateContact(contactOf('无人', '13900001111', 'none@example.com', '无人地址'));
      expect(affected).assertEqual(0);
      expect(store.updateCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertFalse();
    });

    /**
     * @tc.name   updateOnMissingNameReportsZero
     * @tc.desc   An UPDATE matching no name affects zero rows while every seeded row stays intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateOnMissingNameReportsZero', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const affected = store.updateContact(contactOf('查无此人', '13900001111', 'missing@example.com', '某地'));
      expect(affected).assertEqual(0);
      expect(store.updateCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
      expect(sameStringArray(store.names(), contactNames(seed))).assertTrue();
      expect(sameContact(store.rows[0], seed[0])).assertTrue();
    });

    /**
     * @tc.name   updateOnPresentNameRewritesMutableColumns
     * @tc.desc   A matched update returns one and rewrites phone, email and address on that row only.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateOnPresentNameRewritesMutableColumns', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[4]);
      edited.phone = '13900004444';
      edited.email = 'ben.edited@example.com';
      edited.address = '改后的上海市地址';
      expect(store.updateContact(edited)).assertEqual(1);
      expect(store.rows[4].phone).assertEqual('13900004444');
      expect(store.rows[4].email).assertEqual('ben.edited@example.com');
      expect(store.rows[4].address).assertEqual('改后的上海市地址');
      expect(store.rows[3].phone).assertEqual(seed[3].phone);
      expect(store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   deleteRemovesEveryRowWithTheName
     * @tc.desc   Two rows with the same name are both deleted and the returned count reports two.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteRemovesEveryRowWithTheName', 0, () => {
      const twin = contactOf('成双', '13500001111', 'twin@example.com', '成双地');
      store.batchInsert(true, [twin, contactOf('旁观', '13500002222', 'watch@example.com', '旁观地'),
        cloneContact(twin)]);
      const removed = store.deleteByName('成双');
      expect(removed).assertEqual(2);
      expect(store.rowCount()).assertEqual(1);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.names()[0]).assertEqual('旁观');
      expect(countOf(store.names(), '成双')).assertEqual(0);
    });

    /**
     * @tc.name   deleteUnknownNameReportsZero
     * @tc.desc   Deleting a name the table never held changes nothing and still counts the attempt.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteUnknownNameReportsZero', 0, () => {
      store.batchInsert(true, createSeedContacts());
      expect(store.deleteByName('不在名册')).assertEqual(0);
      expect(store.rowCount()).assertEqual(15);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.names()[0]).assertEqual('艾德里安');
      expect(store.query(true).length).assertEqual(15);
    });

    /**
     * @tc.name   deleteBeforeInitLeavesStoreUninitialized
     * @tc.desc   A delete is a pure row filter in the double and never creates the table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteBeforeInitLeavesStoreUninitialized', 0, () => {
      expect(store.deleteByName('空表删除')).assertEqual(0);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   queryWithoutContextReturnsEmptyWithCount
     * @tc.desc   Query without context returns the empty array fallback and still records the call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryWithoutContextReturnsEmptyWithCount', 0, () => {
      store.batchInsert(true, createSeedContacts());
      expect(store.query(false).length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
      expect(wrappedQueryResult(false, store).length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
    });

    /**
     * @tc.name   fullLifecycleCountsEachOperationOnce
     * @tc.desc   Init, batch, query, insert, update and delete each raise exactly one counter tick.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fullLifecycleCountsEachOperationOnce', 0, () => {
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      store.query(true);
      const draft = contactOf('流程', '13900001111', 'flow@example.com', '流程地址');
      store.insert(true, draft, 'ON_CONFLICT_REPLACE');
      store.updateContact(draft);
      store.deleteByName('流程');
      logStep('fullLifecycleCountsEachOperationOnce', String(store.rowCount()));
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(1);
      expect(store.updateCalls).assertEqual(1);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
    });

    /**
     * @tc.name   lifecycleCountsAreMonotonicAcrossRepeats
     * @tc.desc   Repeating queries and inserts only grows their counters, leaving table creation fixed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lifecycleCountsAreMonotonicAcrossRepeats', 0, () => {
      store.init(true);
      store.query(true);
      store.query(true);
      store.query(true);
      store.insert(true, contactOf('重复', '13900001111', 'rep@example.com', '重复地址'), 'ON_CONFLICT_REPLACE');
      store.insert(true, contactOf('重复二', '13900002222', 'rep2@example.com', '重复二地'), 'ON_CONFLICT_REPLACE');
      expect(store.queryCalls).assertEqual(3);
      expect(store.insertCalls).assertEqual(2);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(2);
      expect(store.names()[1]).assertEqual('重复二');
    });

    /**
     * @tc.name   lifecycleResetClearsEveryCounter
     * @tc.desc   The local reset zeroes rows, initialization flags and all seven counters at once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lifecycleResetClearsEveryCounter', 0, () => {
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      store.query(true);
      store.insert(true, new Contact('复位', '13900001111', 'reset@example.com', '复位地址'), 'ON_CONFLICT_REPLACE');
      store.updateContact(new Contact('复位', '13900002222', 'reset2@example.com', '复位二地'));
      store.deleteByName('复位');
      store.reset();
      expect(store.rowCount()).assertEqual(0);
      expect(store.initCalls).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
      expect(store.insertCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
    });

    /**
     * @tc.name   lifecycleResetStoreCanInitializeAgain
     * @tc.desc   After a reset the store behaves like a fresh instance and creates the table once more.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lifecycleResetStoreCanInitializeAgain', 0, () => {
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      store.reset();
      expect(store.initialized).assertFalse();
      expect(store.init(true)).assertTrue();
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.lastContextValid).assertTrue();
    });

    /**
     * @tc.name   operationCatalogListsAllEightSteps
     * @tc.desc   The operation catalog exposes the eight distinct database steps in execution order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('operationCatalogListsAllEightSteps', 0, () => {
      const operations = OperationCatalog.all();
      expect(operations.length).assertEqual(8);
      expect(operations[0]).assertEqual(OperationCatalog.CREATE_TABLE);
      expect(operations[2]).assertEqual(OperationCatalog.BATCH_INSERT);
      expect(operations[6]).assertEqual(OperationCatalog.DELETE_ONE);
      expect(operations[7]).assertEqual(OperationCatalog.DEDUPE_ROWS);
      expect(joined(operations, '>')).assertEqual('create-table>init-store>batch-insert>query-all>' +
        'insert-one>update-one>delete-one>dedupe-rows');
    });

    /**
     * @tc.name   fallbackOnlyBatchReturnsZero
     * @tc.desc   Every non-batch operation falls back to -1 on error while batch reports zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fallbackOnlyBatchReturnsZero', 0, () => {
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_SQL_EXECUTION)).assertEqual(0);
      expect(fallbackForOperation(OperationCatalog.CREATE_TABLE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.INIT_STORE, ERROR_STORE_INIT)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_TABLE_MISSING)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.DELETE_ONE, ERROR_CONTEXT_MISSING)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_NONE)).assertEqual(0);
    });

    /**
     * @tc.name   missingContextIsTheOnlyContinueCondition
     * @tc.desc   The page keeps going only when the context is missing, independent from SQL error codes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('missingContextIsTheOnlyContinueCondition', 0, () => {
      expect(continuesWithoutContext(false)).assertTrue();
      expect(continuesWithoutContext(true)).assertFalse();
      expect(ERROR_CONTEXT_MISSING).assertEqual(401);
      expect(ERROR_STORE_INIT).assertEqual(14800011);
      expect(ERROR_TABLE_MISSING).assertEqual(14800001);
      expect(continuesWithoutContext(ERROR_NONE === 0)).assertFalse();
    });

    /**
     * @tc.name   storeFileAndTableNamesAreSafeIdentifiers
     * @tc.desc   The database file and table identifiers contain no path separators, quotes or spaces.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeFileAndTableNamesAreSafeIdentifiers', 0, () => {
      expect(STORE_NAME.endsWith('.db')).assertTrue();
      expect(STORE_NAME.indexOf('/')).assertEqual(-1);
      expect(STORE_NAME.indexOf('\\')).assertEqual(-1);
      expect(TABLE_CONTACT.indexOf(' ')).assertEqual(-1);
      expect(TABLE_CONTACT.indexOf(';')).assertEqual(-1);
      expect(TABLE_CONTACT).assertEqual(TABLE_CONTACT.toLowerCase());
      expect(STORE_ABILITY).assertEqual('EntryAbility');
    });

    /**
     * @tc.name   lifecycleProjectionAfterBatchShowsSeedTail
     * @tc.desc   After init and batch the cursor projection still starts at the second stored row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lifecycleProjectionAfterBatchShowsSeedTail', 0, () => {
      store.init(true);
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(visible.length).assertEqual(14);
      expect(visible[0].name).assertEqual(seed[1].name);
      expect(visible[13].name).assertEqual(seed[14].name);
      expect(expectedVisibleRows(store.query(true)).length).assertEqual(14);
      expect(store.queryCalls).assertEqual(2);
    });

    /**
     * @tc.name   lifecycleCursorClosesAfterProjection
     * @tc.desc   The result set is closed once the row walk ends, releasing the native cursor.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lifecycleCursorClosesAfterProjection', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const cursor = new CursorResultSet(store.query(true));
      expect(cursor.closed).assertFalse();
      const visible = readContactsFromResultSet(cursor);
      expect(cursor.closed).assertTrue();
      expect(visible.length).assertEqual(14);
      expect(cursor.index).assertEqual(15);
      expect(cursor.isAfterLast()).assertTrue();
      expect(cursor.rowCount()).assertEqual(15);
    });

    /**
     * @tc.name   lifecycleTwoBatchesAfterInitAccumulateRows
     * @tc.desc   Two batches after a single init write thirty rows without a second table creation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lifecycleTwoBatchesAfterInitAccumulateRows', 0, () => {
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      store.batchInsert(true, createSeedContacts());
      expect(store.rowCount()).assertEqual(30);
      expect(store.batchCalls).assertEqual(2);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.names()[15]).assertEqual('艾德里安');
      expect(store.names()[29]).assertEqual('法里');
    });

    /**
     * @tc.name   lifecycleDeleteAllRowsEmptiesTheTable
     * @tc.desc   Deleting each seed name one by one empties the table and reports fifteen matches.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lifecycleDeleteAllRowsEmptiesTheTable', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      let removed = 0;
      for (let index = 0; index < seed.length; index++) {
        removed = removed + store.deleteByName(seed[index].name);
      }
      expect(removed).assertEqual(15);
      expect(store.rowCount()).assertEqual(0);
      expect(store.deleteCalls).assertEqual(15);
      expect(store.query(true).length).assertEqual(0);
      expect(store.names().length).assertEqual(0);
    });

    /**
     * @tc.name   lifecycleQuerySeesInsertImmediately
     * @tc.desc   A query issued after an insert returns the new row in the same call sequence.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lifecycleQuerySeesInsertImmediately', 0, () => {
      store.init(true);
      const draft = contactOf('即时', '13900001111', 'now@example.com', '即时地址');
      store.insert(true, draft, 'ON_CONFLICT_REPLACE');
      const rows = store.query(true);
      expect(rows.length).assertEqual(1);
      expect(sameContact(rows[0], draft)).assertTrue();
      expect(store.insertCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
    });

    /**
     * @tc.name   lifecycleUpdateTouchesBothDuplicateRows
     * @tc.desc   One update matching a duplicated name reports two affected rows, unlike the manager.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lifecycleUpdateTouchesBothDuplicateRows', 0, () => {
      const first = contactOf('同名', '13500001111', 'first@example.com', '甲地');
      const second = contactOf('同名', '13500002222', 'second@example.com', '乙地');
      store.batchInsert(true, [first, second]);
      const edited = contactOf('同名', '13900009999', 'edited@example.com', '改后地');
      expect(store.updateContact(edited)).assertEqual(2);
      expect(store.rows[0].phone).assertEqual('13900009999');
      expect(store.rows[1].phone).assertEqual('13900009999');
      expect(store.updateCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(2);
    });

    /**
     * @tc.name   lifecycleStoreNamesAfterDeleteSkipTheRemovedName
     * @tc.desc   The surviving name order is preserved after deleting a middle seed row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lifecycleStoreNamesAfterDeleteSkipTheRemovedName', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      store.deleteByName(seed[7].name);
      expect(store.rowCount()).assertEqual(14);
      expect(store.names()[6]).assertEqual(seed[6].name);
      expect(store.names()[7]).assertEqual(seed[8].name);
      expect(store.names().indexOf(seed[7].name)).assertEqual(-1);
      expect(sameStringArray(store.names(), contactNames(expectedAfterDelete(seed, seed[7].name)))).assertTrue();
    });

    /**
     * @tc.name   lifecycleWrittenCountMatchesBatchOracle
     * @tc.desc   The row count returned by the batch equals both the oracle and the store row count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lifecycleWrittenCountMatchesBatchOracle', 0, () => {
      const seed = createSeedContacts().slice(0, 9);
      const written = store.batchInsert(true, seed);
      expect(written).assertEqual(expectedBatchCount(seed));
      expect(written).assertEqual(store.rowCount());
      expect(written).assertEqual(9);
      expect(wrappedBatchCount(true, store, seed.slice(0, 2))).assertEqual(2);
      expect(store.rowCount()).assertEqual(11);
    });

    /**
     * @tc.name   lifecycleQueryDoesNotDisturbCounters
     * @tc.desc   Repeated reads leave insert, update and delete counters unchanged and only grow query.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lifecycleQueryDoesNotDisturbCounters', 0, () => {
      store.batchInsert(true, createSeedContacts());
      store.query(true);
      store.query(true);
      store.query(true);
      expect(store.queryCalls).assertEqual(3);
      expect(store.insertCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
    });

    /**
     * @tc.name   lifecycleFailedInitThenBatchCreatesTableOnce
     * @tc.desc   A failed init followed by a valid batch still creates the table exactly once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lifecycleFailedInitThenBatchCreatesTableOnce', 0, () => {
      expect(store.init(false)).assertFalse();
      expect(store.createTableCalls).assertEqual(0);
      const written = store.batchInsert(true, createSeedContacts().slice(0, 3));
      expect(written).assertEqual(3);
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.lastContextValid).assertTrue();
    });

    /**
     * @tc.name   lifecycleInitAfterBatchKeepsExistingRows
     * @tc.desc   Calling init on an already initialized store returns false without touching stored rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lifecycleInitAfterBatchKeepsExistingRows', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      expect(store.init(true)).assertFalse();
      expect(store.rowCount()).assertEqual(15);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(2);
      expect(sameStringArray(store.names(), contactNames(seed))).assertTrue();
      expect(store.query(true).length).assertEqual(15);
    });

    /**
     * @tc.name   lifecycleSchemaColumnsFollowBucketKeyOrder
     * @tc.desc   Ignoring the id column, the schema column order equals the six mapper bucket keys.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lifecycleSchemaColumnsFollowBucketKeyOrder', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.columns.slice(1).length).assertEqual(BUCKET_KEYS.length);
      expect(sameStringArray(schema.columns.slice(1), BUCKET_KEYS)).assertTrue();
      expect(schema.columns[1]).assertEqual('name');
      expect(schema.columns[3]).assertEqual('email');
      expect(schema.columns[5]).assertEqual('avatar');
      expect(schema.columns[6]).assertEqual('category');
    });

    /**
     * @tc.name   lifecycleSchemaDescribeHasExactShape
     * @tc.desc   The parsed schema descriptor pins table, seven columns, six NOT NULL columns, key and flag.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lifecycleSchemaDescribeHasExactShape', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.describe()).assertEqual('contact|id,name,phone,email,address,avatar,category|' +
        'name,phone,email,address,avatar,category|id|true');
      expect(schema.describe().split('|').length).assertEqual(5);
      expect(schema.describe().indexOf('|id|true') > 0).assertTrue();
      expect(schema.columnCount()).assertEqual(7);
      expect(schema.notNullColumns.length).assertEqual(6);
    });

    /**
     * @tc.name   lifecycleEmptySeedStillCreatesTheTable
     * @tc.desc   Seeding an empty dataArray still initializes the store, creating the table with zero rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DatabaseInitIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lifecycleEmptySeedStillCreatesTheTable', 0, () => {
      const written = store.batchInsert(true, []);
      expect(written).assertEqual(0);
      expect(store.initialized).assertTrue();
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.query(true).length).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(store.initCalls).assertEqual(1);
      expect(store.lastContextValid).assertTrue();
      expect(store.createTableCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
    });
  });
}
