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
 * FaultInjection / SqlExecutionFault suite.
 *
 * A failing execute or batchInsert is caught and converted into a value the page
 * can render: zero rows for a batch, an empty list for a query, minus one for
 * every other operation. The suite pins those conversions together with the
 * statement literals and the binding order that make the parameters safe.
 *
 * Source anchors:
 *   DatabaseConnection.ets:130-133  query catch returns []
 *   DatabaseConnection.ets:173-179  batch catch returns 0
 *   DatabaseConnection.ets:235      delete statement and binding
 *   DatabaseConnection.ets:269-270  update statement and binding order
 *   SharedDriver.ets:944-953        fallbackForOperation table
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  OperationCatalog,
  ERROR_SQL_EXECUTION,
  ERROR_TABLE_MISSING,
  ERROR_STORE_INIT,
  ERROR_CONTEXT_MISSING,
  ERROR_NONE,
  SQL_DELETE_CONTACT,
  SQL_UPDATE_CONTACT,
  SQL_QUERY_CONTACT,
  createSeedContacts,
  contactOf,
  contactNames,
  joined,
  countOf,
  hasSqlMeta,
  deleteBindings,
  updateBindings,
  fallbackForOperation,
  wrappedBatchCount,
  StoreDouble,
  resetContactManager
} from '../Shared/SharedDriver';

export default function sqlExecutionFaultTest(): void {
  describe('SqlExecutionFault', () => {
    beforeAll(() => {
      logSuite('SqlExecutionFault', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('SqlExecutionFault', 'end');
    });

    /**
     * @tc.name   batchErrorFallsBackToZero
     * @tc.desc   A batch execution error is reported as zero rows rather than a negative count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchErrorFallsBackToZero', 0, () => {
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_SQL_EXECUTION)).assertEqual(0);
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_TABLE_MISSING)).assertEqual(0);
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_STORE_INIT)).assertEqual(0);
      const store = new StoreDouble();
      expect(wrappedBatchCount(false, store, createSeedContacts())).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      logStep('sqlExecutionFaultTest', 'batch error maps to zero');
    });

    /**
     * @tc.name   queryErrorFallsBackToMinusOne
     * @tc.desc   Query, insert, update and delete failures all map to minus one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryErrorFallsBackToMinusOne', 0, () => {
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.INSERT_ONE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.UPDATE_ONE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.DELETE_ONE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.DEDUPE_ROWS, ERROR_SQL_EXECUTION)).assertEqual(-1);
      logStep('sqlExecutionFaultTest', 'non batch errors map to minus one');
    });

    /**
     * @tc.name   noErrorFallsBackToZero
     * @tc.desc   With ERROR_NONE every operation reports the neutral zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('noErrorFallsBackToZero', 0, () => {
      const catalog = OperationCatalog.all();
      for (let index = 0; index < catalog.length; index++) {
        expect(fallbackForOperation(catalog[index], ERROR_NONE)).assertEqual(0);
      }
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_NONE)).assertEqual(0);
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_NONE)).assertEqual(0);
      logStep('sqlExecutionFaultTest', 'no error maps to zero');
    });

    /**
     * @tc.name   errorCodeLiteralsPinned
     * @tc.desc   The four error code constants keep the relational store values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('errorCodeLiteralsPinned', 0, () => {
      expect(ERROR_SQL_EXECUTION).assertEqual(14800015);
      expect(ERROR_TABLE_MISSING).assertEqual(14800001);
      expect(ERROR_STORE_INIT).assertEqual(14800011);
      expect(ERROR_CONTEXT_MISSING).assertEqual(401);
      expect(ERROR_NONE).assertEqual(0);
      logStep('sqlExecutionFaultTest', 'error code literals pinned');
    });

    /**
     * @tc.name   updateBindingsFollowStatement
     * @tc.desc   The four update parameters are phone, email, address, name in the statement order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('updateBindingsFollowStatement', 0, () => {
      const row = contactOf('苏禾', '13512345678', 'suhe@example.com', '浙江省湖州市吴兴区', '', CATEGORY_B);
      const bindings = updateBindings(row);
      expect(bindings.length).assertEqual(4);
      expect(bindings[0]).assertEqual('13512345678');
      expect(bindings[1]).assertEqual('suhe@example.com');
      expect(bindings[2]).assertEqual('浙江省湖州市吴兴区');
      expect(bindings[3]).assertEqual('苏禾');
      logStep('sqlExecutionFaultTest', 'update bindings follow statement order');
    });

    /**
     * @tc.name   deleteBindingsSingleName
     * @tc.desc   The delete statement takes exactly the name as its only parameter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteBindingsSingleName', 0, () => {
      const row = contactOf('洛川', '13620000061', 'luochuan@example.com', '河南省驻马店市驿城区', '', CATEGORY_C);
      const bindings = deleteBindings(row);
      expect(bindings.length).assertEqual(1);
      expect(bindings[0]).assertEqual('洛川');
      expect(bindings[0]).assertEqual(row.name);
      expect(bindings.indexOf(row.phone)).assertEqual(-1);
      logStep('sqlExecutionFaultTest', 'delete binding is the name only');
    });

    /**
     * @tc.name   updateStatementLiteral
     * @tc.desc   The update literal names the three writable columns and the name predicate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('updateStatementLiteral', 0, () => {
      expect(SQL_UPDATE_CONTACT).assertEqual('UPDATE contact SET phone = ?, email = ?, address = ? WHERE name = ?;');
      expect(SQL_UPDATE_CONTACT.startsWith('UPDATE contact SET')).assertTrue();
      expect(SQL_UPDATE_CONTACT.endsWith('WHERE name = ?;')).assertTrue();
      expect(SQL_UPDATE_CONTACT.split('?').length - 1).assertEqual(4);
      expect(SQL_UPDATE_CONTACT.indexOf('avatar')).assertEqual(-1);
      logStep('sqlExecutionFaultTest', 'update literal pinned');
    });

    /**
     * @tc.name   deleteStatementLiteral
     * @tc.desc   The delete literal filters on the name with a single bound parameter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteStatementLiteral', 0, () => {
      expect(SQL_DELETE_CONTACT).assertEqual('DELETE FROM contact WHERE name = ?;');
      expect(SQL_DELETE_CONTACT.startsWith('DELETE FROM contact')).assertTrue();
      expect(SQL_DELETE_CONTACT.split('?').length - 1).assertEqual(1);
      expect(SQL_DELETE_CONTACT.indexOf('WHERE name') >= 0).assertTrue();
      logStep('sqlExecutionFaultTest', 'delete literal pinned');
    });

    /**
     * @tc.name   queryStatementLiteral
     * @tc.desc   The query literal selects every column from the contact table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryStatementLiteral', 0, () => {
      expect(SQL_QUERY_CONTACT).assertEqual('select * from contact');
      expect(SQL_QUERY_CONTACT.startsWith('select')).assertTrue();
      expect(SQL_QUERY_CONTACT.indexOf('contact') > 0).assertTrue();
      expect(SQL_QUERY_CONTACT.indexOf('WHERE')).assertEqual(-1);
      logStep('sqlExecutionFaultTest', 'query literal pinned');
    });

    /**
     * @tc.name   metaCharactersAreDetected
     * @tc.desc   Quotes, semicolons and comment markers are reported by hasSqlMeta.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metaCharactersAreDetected', 0, () => {
      expect(hasSqlMeta("O'Brien")).assertTrue();
      expect(hasSqlMeta('name; DROP TABLE contact')).assertTrue();
      expect(hasSqlMeta('value -- comment')).assertTrue();
      expect(hasSqlMeta('value /* comment */')).assertTrue();
      expect(hasSqlMeta('plain value')).assertFalse();
      logStep('sqlExecutionFaultTest', 'meta characters are detected');
    });

    /**
     * @tc.name   metaNameIsBoundNotConcatenated
     * @tc.desc   A name carrying a quote reaches the delete binding unchanged and removes only that row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metaNameIsBoundNotConcatenated', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const hostile = contactOf("O'Brien", '13800138030', 'obrien@example.com', '上海市黄浦区', '', CATEGORY_A);
      store.insert(true, hostile, 'ON_CONFLICT_REPLACE');
      store.insert(true, contactOf('贝拉', '11111110010', 'bella.safe@example.com', '湖北省武汉市洪山区', '', CATEGORY_B),
        'ON_CONFLICT_REPLACE');
      expect(store.deleteByName("O'Brien")).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
      expect(store.names()[0]).assertEqual('贝拉');
      expect(deleteBindings(hostile)[0]).assertEqual("O'Brien");
      logStep('sqlExecutionFaultTest', 'meta name is bound unchanged');
    });

    /**
     * @tc.name   metaNameSurvivesUpdateBinding
     * @tc.desc   The hostile name appears only in the fourth update binding, never in a value slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metaNameSurvivesUpdateBinding', 0, () => {
      const hostile = contactOf('name; DROP TABLE contact', '13800138031', 'drop@example.com',
        '上海市静安区', '', CATEGORY_A);
      const bindings = updateBindings(hostile);
      expect(bindings.length).assertEqual(4);
      expect(bindings[3]).assertEqual('name; DROP TABLE contact');
      expect(bindings[0]).assertEqual('13800138031');
      expect(bindings.indexOf('name; DROP TABLE contact')).assertEqual(3);
      expect(hasSqlMeta(bindings[3])).assertTrue();
      logStep('sqlExecutionFaultTest', 'meta name stays in the predicate slot');
    });

    /**
     * @tc.name   batchFailureLeavesStoreUntouched
     * @tc.desc   A failed batch on a closed store writes nothing and keeps the snapshot empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchFailureLeavesStoreUntouched', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      expect(wrappedBatchCount(false, store, seed)).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.batchCalls).assertEqual(1);
      logStep('sqlExecutionFaultTest', 'failed batch leaves no rows');
    });

    /**
     * @tc.name   updateFailureFallbackValue
     * @tc.desc   An update error reports minus one while the store keeps its rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateFailureFallbackValue', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      expect(fallbackForOperation(OperationCatalog.UPDATE_ONE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(store.rowCount()).assertEqual(4);
      expect(store.updateCalls).assertEqual(0);
      expect(store.names()[0]).assertEqual('艾德里安');
      logStep('sqlExecutionFaultTest', 'update failure fallback is minus one');
    });

    /**
     * @tc.name   tableMissingMapsToZeroForBatch
     * @tc.desc   A missing table is still a zero row batch result, not a thrown error.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('tableMissingMapsToZeroForBatch', 0, () => {
      expect(ERROR_TABLE_MISSING).assertEqual(14800001);
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_TABLE_MISSING)).assertEqual(0);
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_TABLE_MISSING)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.DELETE_ONE, ERROR_TABLE_MISSING)).assertEqual(-1);
      logStep('sqlExecutionFaultTest', 'missing table maps per operation');
    });

    /**
     * @tc.name   recoveryAfterSqlFaultWritesRows
     * @tc.desc   After a simulated SQL fault a clean batch writes the chunk and reports its size.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoveryAfterSqlFaultWritesRows', 0, () => {
      const store = new StoreDouble();
      const chunk = createSeedContacts().slice(0, 5);
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_SQL_EXECUTION)).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(wrappedBatchCount(true, store, chunk)).assertEqual(5);
      expect(store.rowCount()).assertEqual(5);
      expect(joined(contactNames(store.rows))).assertEqual(joined(contactNames(chunk)));
      logStep('sqlExecutionFaultTest', 'recovery batch writes the chunk');
    });

    /**
     * @tc.name   deleteFailureLeavesRowPresent
     * @tc.desc   A delete that never runs leaves the targeted row in place with its phone intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteFailureLeavesRowPresent', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      expect(fallbackForOperation(OperationCatalog.DELETE_ONE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(store.rowCount()).assertEqual(3);
      expect(store.names()[2]).assertEqual('贝拉');
      expect(store.rows[2].phone).assertEqual('11111111111');
      logStep('sqlExecutionFaultTest', 'failed delete leaves the row present');
    });

    /**
     * @tc.name   insertFailureFallbackAndRetry
     * @tc.desc   A rejected insert reports minus one, then a valid retry appends exactly one row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('insertFailureFallbackAndRetry', 0, () => {
      const store = new StoreDouble();
      const row = contactOf('裴雨', '13200000061', 'peiyu.sql@example.com', '山西省晋中市太谷区', '', CATEGORY_A);
      expect(store.insert(false, row, 'ON_CONFLICT_REPLACE')).assertEqual(-1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.insert(true, row, 'ON_CONFLICT_REPLACE')).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
      expect(store.insertCalls).assertEqual(2);
      logStep('sqlExecutionFaultTest', 'insert retry after a SQL fault');
    });

    /**
     * @tc.name   cleanValueHasNoMetaCharacters
     * @tc.desc   Ordinary CJK and Latin values pass the meta check used before binding.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cleanValueHasNoMetaCharacters', 0, () => {
      expect(hasSqlMeta('艾德里安')).assertFalse();
      expect(hasSqlMeta('aidelian@example.com')).assertFalse();
      expect(hasSqlMeta('江苏省南京市鼓楼区')).assertFalse();
      expect(hasSqlMeta('13333333333')).assertFalse();
      expect(hasSqlMeta('')).assertFalse();
      logStep('sqlExecutionFaultTest', 'clean values have no meta characters');
    });

    /**
     * @tc.name   statementLiteralsQuoteEveryPlaceholder
     * @tc.desc   Both write statements place a question mark for every binding the suite builds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('statementLiteralsQuoteEveryPlaceholder', 0, () => {
      const row = contactOf('法里', '11111112222', 'fali.sql@example.com', '吉林省辽源市龙山区', '', CATEGORY_C);
      expect(SQL_UPDATE_CONTACT.split('?').length - 1).assertEqual(updateBindings(row).length);
      expect(SQL_DELETE_CONTACT.split('?').length - 1).assertEqual(deleteBindings(row).length);
      expect(SQL_QUERY_CONTACT.indexOf('?')).assertEqual(-1);
      expect(updateBindings(row).length - deleteBindings(row).length).assertEqual(3);
      logStep('sqlExecutionFaultTest', 'placeholders match bindings');
    });

    /**
     * @tc.name   errorCodesAreDistinct
     * @tc.desc   The five error codes are pairwise distinct so the page can branch on them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('errorCodesAreDistinct', 0, () => {
      const codes: number[] = [ERROR_NONE, ERROR_CONTEXT_MISSING, ERROR_STORE_INIT, ERROR_TABLE_MISSING, ERROR_SQL_EXECUTION];
      const unique: number[] = [];
      for (let index = 0; index < codes.length; index++) {
        if (unique.indexOf(codes[index]) < 0) {
          unique.push(codes[index]);
        }
      }
      expect(unique.length).assertEqual(5);
      expect(unique[0]).assertEqual(0);
      expect(unique[4]).assertEqual(14800015);
      logStep('sqlExecutionFaultTest', 'error codes are distinct');
    });

    /**
     * @tc.name   bindingOrderDiffersBetweenStatements
     * @tc.desc   Update binds four values while delete binds one, so the shared name sits in different slots.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bindingOrderDiffersBetweenStatements', 0, () => {
      const row = contactOf('闻溪', '13700000061', 'wenxi.sql@example.com', '广东省肇庆市端州区', '', CATEGORY_B);
      expect(updateBindings(row).length).assertEqual(4);
      expect(deleteBindings(row).length).assertEqual(1);
      expect(updateBindings(row)[3]).assertEqual(row.name);
      expect(deleteBindings(row)[0]).assertEqual(row.name);
      expect(updateBindings(row)[3]).assertEqual(deleteBindings(row)[0]);
      logStep('sqlExecutionFaultTest', 'name moves slots between statements');
    });

    /**
     * @tc.name   metaAddressIsStillBound
     * @tc.desc   A semicolon inside the address reaches the second update binding unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metaAddressIsStillBound', 0, () => {
      const hostile = contactOf('闻舟', '13700000062', 'wenzhou.sql@example.com', '广东省; DELETE FROM contact', '', CATEGORY_B);
      const bindings = updateBindings(hostile);
      expect(hasSqlMeta(bindings[2])).assertTrue();
      expect(bindings[2]).assertEqual('广东省; DELETE FROM contact');
      expect(bindings.length).assertEqual(4);
      expect(bindings[0]).assertEqual('13700000062');
      logStep('sqlExecutionFaultTest', 'meta address stays bound');
    });

    /**
     * @tc.name   failedChunkThenCleanChunkCounts
     * @tc.desc   The failed chunk reports zero and the clean chunk reports its exact size.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedChunkThenCleanChunkCounts', 0, () => {
      const store = new StoreDouble();
      const chunk = createSeedContacts().slice(0, 9);
      expect(wrappedBatchCount(false, store, chunk)).assertEqual(0);
      expect(wrappedBatchCount(true, store, chunk)).assertEqual(9);
      expect(store.rowCount()).assertEqual(9);
      expect(store.batchCalls).assertEqual(2);
      logStep('sqlExecutionFaultTest', 'failed and clean chunk counts');
    });

    /**
     * @tc.name   deleteCountsRowsBeforeFault
     * @tc.desc   Before a simulated delete fault the store reports the exact number of rows it removes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteCountsRowsBeforeFault', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const rows = createSeedContacts();
      rows.push(contactOf('贝拉', '11111113333', 'bella.sql@example.com', '湖北省随州市曾都区', '', CATEGORY_B));
      store.batchInsert(true, rows);
      expect(store.deleteByName('贝拉')).assertEqual(2);
      expect(store.rowCount()).assertEqual(14);
      expect(countOf(store.names(), '贝拉')).assertEqual(0);
      expect(fallbackForOperation(OperationCatalog.DELETE_ONE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      logStep('sqlExecutionFaultTest', 'delete counts before a fault');
    });

    /**
     * @tc.name   catalogWideFallbackMatrix
     * @tc.desc   Every catalog operation maps to zero for no error and only batch maps to zero on failure.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('catalogWideFallbackMatrix', 0, () => {
      const catalog = OperationCatalog.all();
      let zeroOnFailure = 0;
      for (let index = 0; index < catalog.length; index++) {
        expect(fallbackForOperation(catalog[index], ERROR_NONE)).assertEqual(0);
        if (fallbackForOperation(catalog[index], ERROR_SQL_EXECUTION) === 0) {
          zeroOnFailure = zeroOnFailure + 1;
        }
      }
      expect(zeroOnFailure).assertEqual(1);
      expect(catalog.indexOf(OperationCatalog.BATCH_INSERT) >= 0).assertTrue();
      expect(catalog.length).assertEqual(8);
      logStep('sqlExecutionFaultTest', 'fallback matrix over the catalog');
    });

    /**
     * @tc.name   queryAfterBatchFaultReturnsPartialRows
     * @tc.desc   When one chunk fails the earlier chunk stays queryable, so the list is partial not empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('queryAfterBatchFaultReturnsPartialRows', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 6));
      store.failNextBatch = true;
      expect(wrappedBatchCount(true, store, createSeedContacts().slice(6, 12))).assertEqual(0);
      const rows = store.query(true);
      expect(rows.length).assertEqual(6);
      expect(rows[5].name).assertEqual('卡梅隆');
      expect(store.rowCount()).assertEqual(6);
      expect(store.batchCalls).assertEqual(2);
      logStep('sqlExecutionFaultTest', 'failed chunk leaves earlier rows queryable');
    });

    /**
     * @tc.name   metaCharacterInNameKeepsRowCount
     * @tc.desc   A hostile name does not multiply rows during a batch insert.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlExecutionFault scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('metaCharacterInNameKeepsRowCount', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const batch: Contact[] = [];
      batch.push(contactOf("a'1", '13800138070', 'a1@example.com', '上海市黄浦区', '', CATEGORY_A));
      batch.push(contactOf('b--2', '13800138071', 'b2@example.com', '上海市黄浦区', '', CATEGORY_A));
      expect(store.batchInsert(true, batch)).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
      expect(hasSqlMeta(store.names()[0])).assertTrue();
      expect(hasSqlMeta(store.names()[1])).assertTrue();
      logStep('sqlExecutionFaultTest', 'hostile batch does not multiply rows');
    });
  });
}
