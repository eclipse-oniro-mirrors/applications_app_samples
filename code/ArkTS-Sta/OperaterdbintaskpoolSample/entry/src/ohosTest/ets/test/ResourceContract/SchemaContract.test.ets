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
 * ResourceContract / SchemaContract suite.
 *
 * The create statement is the only schema definition in the project and the
 * cursor column order comes from the six bucket fields. The suite parses the
 * statement with an independent SchemaInfo parser and checks the primary key,
 * the autoincrement flag, the six NOT NULL columns and the cursor mapping.
 *
 * Source anchors:
 *   RdbConstant.ets:33-34            CREATE TABLE literal
 *   DatabaseConnection.ets:277-309   cursor walk over the six columns
 *   SharedDriver.ets:343-405         SchemaInfo independent parser
 *   SharedDriver.ets:407-469         CursorResultSet column contract
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import {
  CATEGORY_A,
  CATEGORY_B,
  SQL_CREATE_CONTACT,
  FIELD_NAME,
  FIELD_PHONE,
  FIELD_EMAIL,
  FIELD_ADDRESS,
  FIELD_AVATAR,
  FIELD_CATEGORY,
  BUCKET_KEYS,
  createSeedContacts,
  contactOf,
  contactNames,
  joined,
  countOf,
  expectedVisibleRows,
  expectedVisibleCount,
  SchemaInfo,
  CursorResultSet,
  readContactsFromResultSet,
  resetContactManager
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

export default function schemaContractTest(): void {
  describe('SchemaContract', () => {
    beforeAll(() => {
      logSuite('SchemaContract', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('SchemaContract', 'end');
    });

    /**
     * @tc.name   schemaTableNameIsContact
     * @tc.desc   The parser reads the table name as contact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaTableNameIsContact', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.table).assertEqual('contact');
      expect(schema.table.length).assertEqual(7);
      expect(schema.statement).assertEqual(SQL_CREATE_CONTACT);
      logStep('schemaContractTest', 'table name parses as contact');
    });

    /**
     * @tc.name   schemaHasSevenColumns
     * @tc.desc   The create statement defines id plus the six contact fields.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaHasSevenColumns', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.columnCount()).assertEqual(7);
      expect(schema.columns.length).assertEqual(7);
      expect(schema.columns[0]).assertEqual('id');
      expect(schema.describe().split('|').length).assertEqual(5);
      logStep('schemaContractTest', 'schema has seven columns');
    });

    /**
     * @tc.name   schemaContractPrimaryKeyIsId
     * @tc.desc   The primary key column is id and it is the only key column.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaContractPrimaryKeyIsId', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.primaryKey).assertEqual('id');
      expect(schema.primaryKey === 'name').assertFalse();
      expect(schema.autoincrement).assertTrue();
      expect(schema.columns.indexOf(schema.primaryKey)).assertEqual(0);
      logStep('schemaContractTest', 'primary key is id');
    });

    /**
     * @tc.name   schemaSixNotNullColumns
     * @tc.desc   The six contact fields are NOT NULL while id is not required from the bucket.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaSixNotNullColumns', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.notNullColumns.length).assertEqual(6);
      expect(schema.isNotNull(FIELD_NAME)).assertTrue();
      expect(schema.isNotNull(FIELD_PHONE)).assertTrue();
      expect(schema.isNotNull(FIELD_CATEGORY)).assertTrue();
      expect(schema.isNotNull('id')).assertFalse();
      logStep('schemaContractTest', 'six columns are NOT NULL');
    });

    /**
     * @tc.name   schemaColumnOrderMatchesFields
     * @tc.desc   After id the columns follow the six field constants in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaColumnOrderMatchesFields', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      for (let index = 0; index < BUCKET_KEYS.length; index++) {
        expect(schema.columns[index + 1]).assertEqual(BUCKET_KEYS[index]);
      }
      expect(schema.columns[1]).assertEqual(FIELD_NAME);
      expect(schema.columns[6]).assertEqual(FIELD_CATEGORY);
      logStep('schemaContractTest', 'column order matches the fields');
    });

    /**
     * @tc.name   schemaHasColumnLookup
     * @tc.desc   The hasColumn helper finds every field and rejects the table name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaHasColumnLookup', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.hasColumn(FIELD_EMAIL)).assertTrue();
      expect(schema.hasColumn(FIELD_ADDRESS)).assertTrue();
      expect(schema.hasColumn(FIELD_AVATAR)).assertTrue();
      expect(schema.hasColumn('contact')).assertFalse();
      expect(schema.hasColumn('missing')).assertFalse();
      logStep('schemaContractTest', 'column lookup works');
    });

    /**
     * @tc.name   schemaDescribeIsStable
     * @tc.desc   Two parses of the same literal produce the same description.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaDescribeIsStable', 0, () => {
      const first = new SchemaInfo(SQL_CREATE_CONTACT);
      const second = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(first.describe()).assertEqual(second.describe());
      expect(first.describe().startsWith('contact|')).assertTrue();
      expect(first.describe().endsWith('|true')).assertTrue();
      logStep('schemaContractTest', 'description is stable');
    });

    /**
     * @tc.name   schemaDetectsAlteredStatement
     * @tc.desc   Dropping the AUTOINCREMENT word changes the parse result.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('schemaDetectsAlteredStatement', 0, () => {
      const altered = SQL_CREATE_CONTACT.replace('AUTOINCREMENT', '');
      const schema = new SchemaInfo(altered);
      expect(schema.autoincrement).assertFalse();
      expect(schema.table).assertEqual('contact');
      expect(schema.columnCount()).assertEqual(7);
      logStep('schemaContractTest', 'altered statement is detected');
    });

    /**
     * @tc.name   schemaWithoutExistsHasNoTable
     * @tc.desc   A statement without the EXISTS marker yields an empty table name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('schemaWithoutExistsHasNoTable', 0, () => {
      const schema = new SchemaInfo('CREATE TABLE contact(id INTEGER, name TEXT)');
      expect(schema.table).assertEqual('');
      expect(schema.columnCount()).assertEqual(2);
      expect(schema.hasColumn('name')).assertTrue();
      expect(schema.hasColumn('id')).assertTrue();
      logStep('schemaContractTest', 'statement without EXISTS is parsed');
    });

    /**
     * @tc.name   cursorColumnNamesAreBucketKeys
     * @tc.desc   The cursor exposes the six bucket keys as its column names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorColumnNamesAreBucketKeys', 0, () => {
      const cursor = new CursorResultSet(createSeedContacts().slice(0, 3));
      expect(cursor.columnNames.length).assertEqual(6);
      expect(joined(cursor.columnNames)).assertEqual(joined(BUCKET_KEYS));
      expect(cursor.getColumnIndex(FIELD_NAME)).assertEqual(0);
      expect(cursor.getColumnIndex(FIELD_CATEGORY)).assertEqual(5);
      logStep('schemaContractTest', 'cursor columns are the bucket keys');
    });

    /**
     * @tc.name   cursorRowCountMatchesInput
     * @tc.desc   The cursor reports the number of rows it was built with.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorRowCountMatchesInput', 0, () => {
      const rows = createSeedContacts().slice(0, 4);
      const cursor = new CursorResultSet(rows);
      expect(cursor.rowCount()).assertEqual(4);
      expect(cursor.index).assertEqual(-1);
      expect(cursor.closed).assertFalse();
      logStep('schemaContractTest', 'cursor row count matches the input');
    });

    /**
     * @tc.name   cursorFirstRowReadsName
     * @tc.desc   After goToFirstRow the cursor reads the first row name at index zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorFirstRowReadsName', 0, () => {
      const cursor = new CursorResultSet(createSeedContacts().slice(0, 3));
      expect(cursor.goToFirstRow()).assertTrue();
      expect(cursor.index).assertEqual(0);
      expect(cursor.getString(0)).assertEqual('艾德里安');
      expect(cursor.getString(cursor.getColumnIndex(FIELD_PHONE))).assertEqual('13333333333');
      logStep('schemaContractTest', 'first row reads through the cursor');
    });

    /**
     * @tc.name   cursorReadsAllSixColumns
     * @tc.desc   Column indices zero to five map to the six contact fields.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorReadsAllSixColumns', 0, () => {
      const row = contactOf('莫川', '13100000051', 'mochuan.schema@example.com', '贵州省贵阳市云岩区', 'avatar/mo.png', CATEGORY_A);
      const cursor = new CursorResultSet([row]);
      cursor.goToFirstRow();
      expect(cursor.getString(0)).assertEqual('莫川');
      expect(cursor.getString(1)).assertEqual('13100000051');
      expect(cursor.getString(2)).assertEqual('mochuan.schema@example.com');
      expect(cursor.getString(3)).assertEqual('贵州省贵阳市云岩区');
      expect(cursor.getString(4)).assertEqual('avatar/mo.png');
      expect(cursor.getString(5)).assertEqual(CATEGORY_A);
      logStep('schemaContractTest', 'cursor reads all six columns');
    });

    /**
     * @tc.name   cursorBeforeFirstRowIsEmpty
     * @tc.desc   Reading before goToFirstRow returns empty strings rather than throwing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorBeforeFirstRowIsEmpty', 0, () => {
      const cursor = new CursorResultSet(createSeedContacts().slice(0, 2));
      expect(cursor.index).assertEqual(-1);
      expect(cursor.getString(0)).assertEqual('');
      expect(cursor.getString(5)).assertEqual('');
      expect(cursor.getString(99)).assertEqual('');
      logStep('schemaContractTest', 'reading before the first row is empty');
    });

    /**
     * @tc.name   cursorCloseSetsFlag
     * @tc.desc   Closing the cursor flips the closed flag without changing the row count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorCloseSetsFlag', 0, () => {
      const cursor = new CursorResultSet(createSeedContacts().slice(0, 2));
      expect(cursor.closed).assertFalse();
      cursor.close();
      expect(cursor.closed).assertTrue();
      expect(cursor.rowCount()).assertEqual(2);
      logStep('schemaContractTest', 'close sets the flag');
    });

    /**
     * @tc.name   cursorAfterLastRowFlag
     * @tc.desc   Walking past the last row reports the after-last state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorAfterLastRowFlag', 0, () => {
      const cursor = new CursorResultSet(createSeedContacts().slice(0, 2));
      cursor.goToFirstRow();
      expect(cursor.isAfterLast()).assertFalse();
      expect(cursor.goToNextRow()).assertTrue();
      expect(cursor.isAfterLast()).assertFalse();
      expect(cursor.goToNextRow()).assertFalse();
      expect(cursor.isAfterLast()).assertTrue();
      logStep('schemaContractTest', 'after last flag is reported');
    });

    /**
     * @tc.name   walkSkipsFirstStoredRow
     * @tc.desc   The result walk starts at index one, so the first stored row never appears.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('walkSkipsFirstStoredRow', 0, () => {
      const rows = createSeedContacts().slice(0, 4);
      const visible = readContactsFromResultSet(new CursorResultSet(rows));
      expect(visible.length).assertEqual(3);
      expect(visible[0].name).assertEqual('阿诺德');
      expect(countOf(contactNames(visible), '艾德里安')).assertEqual(0);
      logStep('schemaContractTest', 'walk skips the first stored row');
    });

    /**
     * @tc.name   walkDedupesByNameAndPhone
     * @tc.desc   Two rows with the same name and phone collapse while a new phone survives.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('walkDedupesByNameAndPhone', 0, () => {
      const rows = [
        contactOf('占位', '10000000000', 'placeholder@example.com', '北京市东城区', '', CATEGORY_A),
        contactOf('贝拉', '11111111111', 'bella@example.com', '湖北省武汉市江汉区', '', CATEGORY_B),
        contactOf('贝拉', '11111111111', 'bella@example.com', '湖北省武汉市江汉区', '', CATEGORY_B),
        contactOf('贝拉', '11111113333', 'bella.alt@example.com', '湖北省武汉市武昌区', '', CATEGORY_B)
      ];
      const visible = readContactsFromResultSet(new CursorResultSet(rows));
      expect(visible.length).assertEqual(2);
      expect(visible[0].phone).assertEqual('11111111111');
      expect(visible[1].phone).assertEqual('11111113333');
      expect(countOf(contactNames(visible), '贝拉')).assertEqual(2);
      logStep('schemaContractTest', 'walk dedupes by name and phone');
    });

    /**
     * @tc.name   visibleOracleMatchesWalk
     * @tc.desc   The independent oracle returns the same names as the cursor walk.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('visibleOracleMatchesWalk', 0, () => {
      const rows = createSeedContacts().slice(0, 8);
      const walked = readContactsFromResultSet(new CursorResultSet(rows));
      const oracle = expectedVisibleRows(rows);
      expect(joined(contactNames(walked))).assertEqual(joined(contactNames(oracle)));
      expect(walked.length).assertEqual(oracle.length);
      expect(oracle[0].name).assertEqual('阿诺德');
      logStep('schemaContractTest', 'visible oracle matches the walk');
    });

    /**
     * @tc.name   visibleCountOnFullSeed
     * @tc.desc   The full seed has fourteen visible rows after the skip and dedupe.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('visibleCountOnFullSeed', 0, () => {
      const seed = createSeedContacts();
      expect(expectedVisibleCount(seed)).assertEqual(14);
      expect(expectedVisibleRows(seed).length).assertEqual(14);
      expect(expectedVisibleCount(seed.slice(0, 1))).assertEqual(0);
      logStep('schemaContractTest', 'visible count on the full seed');
    });

    /**
     * @tc.name   walkOnEmptyRows
     * @tc.desc   A cursor over no rows returns no contacts and is closed by the walk.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('walkOnEmptyRows', 0, () => {
      const cursor = new CursorResultSet([]);
      const visible = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(0);
      expect(cursor.closed).assertTrue();
      expect(expectedVisibleCount([])).assertEqual(0);
      logStep('schemaContractTest', 'empty cursor yields no contacts');
    });

    /**
     * @tc.name   walkOnTwoRowsKeepsOne
     * @tc.desc   Two stored rows produce one visible row because the first is skipped.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('walkOnTwoRowsKeepsOne', 0, () => {
      const rows = createSeedContacts().slice(0, 2);
      const visible = readContactsFromResultSet(new CursorResultSet(rows));
      expect(visible.length).assertEqual(1);
      expect(visible[0].name).assertEqual('阿诺德');
      expect(visible[0].phone).assertEqual('16666666666');
      expect(expectedVisibleCount(rows)).assertEqual(1);
      logStep('schemaContractTest', 'two stored rows keep one visible');
    });

    /**
     * @tc.name   createStatementHasNoTrailingComma
     * @tc.desc   The column list closes without a trailing comma, which the parser relies on.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('createStatementHasNoTrailingComma', 0, () => {
      expect(SQL_CREATE_CONTACT.indexOf(',)')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.endsWith(')')).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('TEXT') >= 0).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('INTEGER') >= 0).assertTrue();
      logStep('schemaContractTest', 'create statement has no trailing comma');
    });

    /**
     * @tc.name   schemaColumnsMinusIdAreTheFields
     * @tc.desc   Seven columns minus the id column equals the six bucket keys.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaColumnsMinusIdAreTheFields', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      const fields: string[] = [];
      for (let index = 1; index < schema.columns.length; index++) {
        fields.push(schema.columns[index]);
      }
      expect(fields.length).assertEqual(6);
      expect(joined(fields)).assertEqual(joined(BUCKET_KEYS));
      expect(schema.columns.length - fields.length).assertEqual(1);
      logStep('schemaContractTest', 'columns minus id are the fields');
    });

    /**
     * @tc.name   schemaNotInColumnsMinusId
     * @tc.desc   id is not among the six NOT NULL columns and every field is.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('schemaNotInColumnsMinusId', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.notNullColumns.indexOf('id')).assertEqual(-1);
      expect(schema.notNullColumns.indexOf(FIELD_NAME)).assertEqual(0);
      expect(schema.notNullColumns.indexOf(FIELD_CATEGORY)).assertEqual(5);
      expect(schema.notNullColumns.length).assertEqual(schema.columnCount() - 1);
      logStep('schemaContractTest', 'NOT NULL set excludes id');
    });

    /**
     * @tc.name   cursorWalkClosesAfterFullPass
     * @tc.desc   The walk closes the cursor once it finishes, even on the seed list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorWalkClosesAfterFullPass', 0, () => {
      const cursor = new CursorResultSet(createSeedContacts());
      expect(cursor.closed).assertFalse();
      const visible = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(14);
      expect(cursor.closed).assertTrue();
      expect(cursor.index >= cursor.rowCount()).assertTrue();
      logStep('schemaContractTest', 'cursor closes after a full pass');
    });

    /**
     * @tc.name   walkPreservesVisibleOrder
     * @tc.desc   The visible walk keeps the stored order minus the skipped row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('walkPreservesVisibleOrder', 0, () => {
      const seed = createSeedContacts();
      const visible = readContactsFromResultSet(new CursorResultSet(seed));
      expect(visible[0].name).assertEqual('阿诺德');
      expect(visible[1].name).assertEqual('贝拉');
      expect(visible[12].name).assertEqual('法比而');
      expect(visible[13].name).assertEqual('法里');
      expect(joined(contactNames(visible))).assertEqual(joined(contactNames(seed.slice(1))));
      logStep('schemaContractTest', 'visible order matches the stored tail');
    });

    /**
     * @tc.name   schemaParserIgnoresSpacing
     * @tc.desc   Extra spaces after the commas do not change the parsed column names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('schemaParserIgnoresSpacing', 0, () => {
      const spaced = SQL_CREATE_CONTACT.replace(', ', ',   ');
      const schema = new SchemaInfo(spaced);
      expect(schema.columnCount()).assertEqual(7);
      expect(schema.columns[1]).assertEqual(FIELD_NAME);
      expect(schema.primaryKey).assertEqual('id');
      expect(schema.autoincrement).assertTrue();
      logStep('schemaContractTest', 'parser ignores extra spacing');
    });

    /**
     * @tc.name   cursorAddressColumnReadsThirdIndex
     * @tc.desc   Column index three reads the address field for any row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorAddressColumnReadsThirdIndex', 0, () => {
      const rows = createSeedContacts().slice(0, 2);
      const cursor = new CursorResultSet(rows);
      cursor.goToFirstRow();
      expect(cursor.getString(3)).assertEqual('江苏省南京市鼓楼区');
      expect(cursor.getColumnIndex(FIELD_ADDRESS)).assertEqual(3);
      expect(cursor.getString(cursor.getColumnIndex(FIELD_ADDRESS))).assertEqual(rows[0].address);
      logStep('schemaContractTest', 'address column reads at index three');
    });

    /**
     * @tc.name   schemaTableNameHasNoSpaces
     * @tc.desc   The parsed table name carries no whitespace, which the SQL executor requires.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SchemaContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaTableNameHasNoSpaces', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.table.indexOf(' ')).assertEqual(-1);
      expect(schema.table.trim()).assertEqual('contact');
      expect(schema.table === schema.table.trim()).assertTrue();
      logStep('schemaContractTest', 'table name has no whitespace');
    });
  });
}
