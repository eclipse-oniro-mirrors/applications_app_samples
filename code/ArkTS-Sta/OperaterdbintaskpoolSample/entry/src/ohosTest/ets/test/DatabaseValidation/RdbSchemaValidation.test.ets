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
 * RdbSchemaValidation pins the contact table schema declared in RdbConstant.
 *
 * Production anchors:
 *   RdbConstant.ets:31      TABLE_NAME is 'contact'
 *   RdbConstant.ets:33-34   SQL_CREATE_TABLE declares id INTEGER PRIMARY KEY
 *                           AUTOINCREMENT followed by six TEXT NOT NULL columns
 *   RdbConstant.ets:36      the store file is contact.db at SecurityLevel S2
 *   DatabaseConnection.ets:94-107  createTable executes that literal once
 *   DatabaseConnection.ets:150-171 the ValuesBucket uses the same six column names
 *
 * SchemaInfo is an independent parser of the CREATE TABLE text, so the suite can
 * assert the column order, the primary key, the NOT NULL set and the raw statement
 * without touching a real relationalStore.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  SchemaInfo,
  SQL_CREATE_CONTACT,
  TABLE_CONTACT,
  BUCKET_KEYS,
  FIELD_NAME,
  FIELD_PHONE,
  FIELD_EMAIL,
  FIELD_ADDRESS,
  FIELD_AVATAR,
  FIELD_CATEGORY,
  joined,
  uniqueStrings,
  sameStringArray,
  countOf,
  resetContactManager
} from '../Shared/SharedDriver';
import { SQL_CREATE_TABLE, TABLE_NAME } from '../../../../main/ets/pages/constant/RdbConstant';

export default function rdbSchemaValidationTest(): void {
  describe('RdbSchemaValidation', () => {
    let schema: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);

    beforeAll(() => {
      logSuite('RdbSchemaValidation', 'begin');
    });

    beforeEach(async () => {
      resetContactManager();
      schema = new SchemaInfo(SQL_CREATE_TABLE);
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('RdbSchemaValidation', 'end');
    });

    /**
     * @tc.name   schemaParsesContactTableName
     * @tc.desc   The parser extracts the table name that follows CREATE TABLE IF NOT EXISTS.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaParsesContactTableName', 0, () => {
      expect(schema.table).assertEqual('contact');
      expect(schema.table).assertEqual(TABLE_CONTACT);
      expect(schema.table).assertEqual(TABLE_NAME);
      expect(schema.table.length).assertEqual(7);
      expect(schema.table.indexOf(' ')).assertEqual(-1);
      logStep('RdbSchemaValidation', 'parsed table ' + schema.table);
    });

    /**
     * @tc.name   schemaFindsSevenColumns
     * @tc.desc   The definition list holds seven columns: the generated id plus the six contact
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            payload columns.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaFindsSevenColumns', 0, () => {
      expect(schema.columnCount()).assertEqual(7);
      expect(schema.columns.length).assertEqual(7);
      expect(schema.columnCount()).assertEqual(BUCKET_KEYS.length + 1);
      expect(schema.columns[0]).assertEqual('id');
      expect(schema.columns[6]).assertEqual(FIELD_CATEGORY);
      expect(schema.columns[1]).assertEqual(FIELD_NAME);
      expect(schema.columns[2]).assertEqual(FIELD_PHONE);
      expect(schema.columns[3]).assertEqual(FIELD_EMAIL);
      expect(schema.columns[4]).assertEqual(FIELD_ADDRESS);
      expect(schema.columns[5]).assertEqual(FIELD_AVATAR);
    });

    /**
     * @tc.name   schemaColumnOrderMatchesCreateStatement
     * @tc.desc   The parsed columns appear in the same order as the CREATE TABLE body:
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            id, name, phone, email, address, avatar, category.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaColumnOrderMatchesCreateStatement', 0, () => {
      const expected: string[] = ['id', FIELD_NAME, FIELD_PHONE, FIELD_EMAIL, FIELD_ADDRESS, FIELD_AVATAR,
        FIELD_CATEGORY];
      expect(schema.columns.length).assertEqual(expected.length);
      for (let index = 0; index < expected.length; index++) {
        expect(schema.columns[index]).assertEqual(expected[index]);
      }
      expect(joined(schema.columns, ',')).assertEqual('id,name,phone,email,address,avatar,category');
      expect(schema.columns.indexOf(FIELD_PHONE)).assertEqual(2);
    });

    /**
     * @tc.name   schemaIdIsPrimaryKey
     * @tc.desc   Only the id column carries the PRIMARY KEY marker, which the parser records in
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the primaryKey field.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaIdIsPrimaryKey', 0, () => {
      expect(schema.primaryKey).assertEqual('id');
      expect(schema.primaryKey.length).assertEqual(2);
      expect(schema.columns.indexOf(schema.primaryKey)).assertEqual(0);
      expect(countOf(schema.columns, 'id')).assertEqual(1);
      expect(schema.primaryKey === FIELD_NAME).assertFalse();
      expect(schema.hasColumn(schema.primaryKey)).assertTrue();
    });

    /**
     * @tc.name   schemaDeclaresAutoincrement
     * @tc.desc   The statement contains AUTOINCREMENT, so the parser flags the generated key and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the id column does not require an explicit value.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaDeclaresAutoincrement', 0, () => {
      expect(schema.autoincrement).assertTrue();
      expect(schema.statement.indexOf('AUTOINCREMENT') > 0).assertTrue();
      expect(schema.statement.indexOf('INTEGER PRIMARY KEY AUTOINCREMENT') > 0).assertTrue();
      expect(schema.isNotNull('id')).assertFalse();
      expect(schema.primaryKey).assertEqual('id');
      expect(schema.autoincrement === false).assertFalse();
      expect(schema.describe().endsWith('|true')).assertTrue();
      expect(schema.describe().split('|')[4]).assertEqual('true');
      expect(schema.statement.split('AUTOINCREMENT')[1].startsWith(',')).assertTrue();
    });

    /**
     * @tc.name   schemaSixPayloadColumnsAreNotNull
     * @tc.desc   The parser collects exactly the six contact columns into the NOT NULL list, in
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            declaration order.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaSixPayloadColumnsAreNotNull', 0, () => {
      expect(schema.notNullColumns.length).assertEqual(6);
      expect(joined(schema.notNullColumns, ',')).assertEqual('name,phone,email,address,avatar,category');
      expect(schema.isNotNull(FIELD_NAME)).assertTrue();
      expect(schema.isNotNull(FIELD_PHONE)).assertTrue();
      expect(schema.isNotNull(FIELD_EMAIL)).assertTrue();
      expect(schema.isNotNull(FIELD_ADDRESS)).assertTrue();
      expect(schema.isNotNull(FIELD_AVATAR)).assertTrue();
      expect(schema.isNotNull(FIELD_CATEGORY)).assertTrue();
      expect(schema.notNullColumns[0]).assertEqual(FIELD_NAME);
      expect(schema.notNullColumns[5]).assertEqual(FIELD_CATEGORY);
      expect(joined(schema.notNullColumns, ';')).assertEqual('name;phone;email;address;avatar;category');
      expect(schema.notNullColumns.indexOf('id')).assertEqual(-1);
      expect(schema.notNullColumns.length).assertEqual(BUCKET_KEYS.length);
      expect(schema.notNullColumns.length < schema.columnCount()).assertTrue();
      expect(schema.columnCount() - schema.notNullColumns.length).assertEqual(1);
    });

    /**
     * @tc.name   schemaIdIsNotMarkedNotNull
     * @tc.desc   The id definition has no NOT NULL clause, so it is absent from the NOT NULL list
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            even though it is the primary key.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaIdIsNotMarkedNotNull', 0, () => {
      expect(schema.notNullColumns.indexOf('id')).assertEqual(-1);
      expect(schema.isNotNull('id')).assertFalse();
      expect(schema.notNullColumns.length).assertEqual(schema.columnCount() - 1);
      expect(schema.hasColumn('id')).assertTrue();
      expect(schema.primaryKey).assertEqual('id');
      expect(joined(schema.notNullColumns, ',').indexOf('id,')).assertEqual(-1);
    });

    /**
     * @tc.name   schemaHasColumnForEveryBucketKey
     * @tc.desc   Each of the six bucket keys used by the insert path exists in the parsed column
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            list exactly once.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaHasColumnForEveryBucketKey', 0, () => {
      expect(BUCKET_KEYS.length).assertEqual(6);
      for (let index = 0; index < BUCKET_KEYS.length; index++) {
        const key: string = BUCKET_KEYS[index];
        expect(schema.hasColumn(key)).assertTrue();
        expect(countOf(schema.columns, key)).assertEqual(1);
        expect(schema.columns.indexOf(key)).assertEqual(index + 1);
      }
      expect(uniqueStrings(schema.columns).length).assertEqual(7);
    });

    /**
     * @tc.name   schemaHasColumnFalseForUnknownColumns
     * @tc.desc   Names that the statement never declares are reported as absent, including
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            plausible alternates such as id and identifier casing variants.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaHasColumnFalseForUnknownColumns', 0, () => {
      expect(schema.hasColumn('identifier')).assertFalse();
      expect(schema.hasColumn('ID')).assertFalse();
      expect(schema.hasColumn('Name')).assertFalse();
      expect(schema.hasColumn('telephone')).assertFalse();
      expect(schema.hasColumn('')).assertFalse();
      expect(schema.hasColumn('category ')).assertFalse();
      expect(schema.hasColumn(FIELD_CATEGORY)).assertTrue();
    });

    /**
     * @tc.name   schemaIsNotNullFalseForUnknownColumns
     * @tc.desc   The NOT NULL predicate is false for names outside the statement and for the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            generated key.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaIsNotNullFalseForUnknownColumns', 0, () => {
      expect(schema.isNotNull('identifier')).assertFalse();
      expect(schema.isNotNull('')).assertFalse();
      expect(schema.isNotNull(FIELD_NAME.toUpperCase())).assertFalse();
      expect(schema.isNotNull('phone ')).assertFalse();
      expect(schema.isNotNull(FIELD_PHONE)).assertTrue();
      expect(schema.notNullColumns.length).assertEqual(6);
    });

    /**
     * @tc.name   schemaDescribeEncodesParsedShape
     * @tc.desc   The description concatenates the table, both column lists, the primary key and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the autoincrement flag with stable separators.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaDescribeEncodesParsedShape', 0, () => {
      expect(schema.describe()).assertEqual(
        'contact|id,name,phone,email,address,avatar,category|name,phone,email,address,avatar,category|id|true');
      const parts: string[] = schema.describe().split('|');
      expect(parts.length).assertEqual(5);
      expect(parts[0]).assertEqual('contact');
      expect(parts[3]).assertEqual('id');
      expect(parts[4]).assertEqual('true');
      expect(parts[1].split(',').length).assertEqual(7);
    });

    /**
     * @tc.name   statementStartsWithCreateTableIfNotExists
     * @tc.desc   The literal begins with the idempotent CREATE TABLE IF NOT EXISTS prefix, which
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            is why the page can run it on every launch.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('statementStartsWithCreateTableIfNotExists', 0, () => {
      expect(schema.statement.indexOf('CREATE TABLE IF NOT EXISTS')).assertEqual(0);
      expect(schema.statement.startsWith('CREATE TABLE')).assertTrue();
      expect(schema.statement.indexOf('IF NOT EXISTS')).assertEqual(13);
      expect(schema.statement.substring(0, 6)).assertEqual('CREATE');
      expect(schema.statement.toUpperCase() === schema.statement).assertFalse();
      expect(schema.statement.length > 100).assertTrue();
    });

    /**
     * @tc.name   statementDeclaresSixNotNullOccurrences
     * @tc.desc   Counting the NOT NULL clauses in the raw statement yields six, matching the six
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            payload columns.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('statementDeclaresSixNotNullOccurrences', 0, () => {
      const clauses: string[] = schema.statement.split('NOT NULL');
      const columnText = schema.statement.substring(schema.statement.indexOf('(') + 1)
        .split(',').join(' ').split(')').join(' ');
      expect(clauses.length - 1).assertEqual(6);
      expect(clauses.length - 1).assertEqual(schema.notNullColumns.length);
      expect(countOf(columnText.split(' '), 'NOT')).assertEqual(6);
      expect(countOf(columnText.split(' '), 'NULL')).assertEqual(6);
      expect(schema.statement.split('TEXT NOT NULL').length - 1).assertEqual(6);
    });

    /**
     * @tc.name   statementEndsWithClosingParenthesis
     * @tc.desc   The statement closes its column list and does not carry a trailing semicolon, so
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the last two characters are the closing parenthesis and nothing else.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('statementEndsWithClosingParenthesis', 0, () => {
      const statement: string = schema.statement;
      expect(statement.endsWith(')')).assertTrue();
      expect(statement.endsWith(';')).assertFalse();
      expect(statement.substring(statement.length - 1)).assertEqual(')');
      expect(statement.indexOf('(') > 0).assertTrue();
      expect(statement.lastIndexOf(')')).assertEqual(statement.length - 1);
      expect(statement.split('(').length).assertEqual(2);
    });

    /**
     * @tc.name   productionCreateStatementMatchesDriverConstant
     * @tc.desc   The SQL_CREATE_TABLE literal imported from RdbConstant is identical to the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            driver mirror used by every other suite.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('productionCreateStatementMatchesDriverConstant', 0, () => {
      expect(SQL_CREATE_TABLE).assertEqual(SQL_CREATE_CONTACT);
      expect(schema.statement).assertEqual(SQL_CREATE_TABLE);
      expect(schema.statement.length).assertEqual(SQL_CREATE_CONTACT.length);
      expect(schema.describe()).assertEqual(new SchemaInfo(SQL_CREATE_CONTACT).describe());
      expect(SQL_CREATE_TABLE.indexOf('contact(id INTEGER')).assertEqual(27);
    });

    /**
     * @tc.name   productionTableNameMatchesParsedTable
     * @tc.desc   TABLE_NAME from RdbConstant, the shared TABLE_CONTACT and the name parsed out of
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the statement are the same string.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('productionTableNameMatchesParsedTable', 0, () => {
      expect(TABLE_NAME).assertEqual('contact');
      expect(TABLE_NAME).assertEqual(TABLE_CONTACT);
      expect(schema.table).assertEqual(TABLE_NAME);
      expect(schema.table.toLowerCase()).assertEqual(schema.table);
      expect(schema.table.indexOf(',')).assertEqual(-1);
      expect(schema.hasColumn(schema.table)).assertFalse();
    });

    /**
     * @tc.name   schemaParsesHandwrittenTwoColumnStatement
     * @tc.desc   The parser is independent from the production literal: a two column probe table
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            is parsed into its table, columns and primary key.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaParsesHandwrittenTwoColumnStatement', 0, () => {
      const probe: SchemaInfo = new SchemaInfo(
        'CREATE TABLE IF NOT EXISTS probe(code TEXT NOT NULL, token INTEGER PRIMARY KEY)');
      expect(probe.table).assertEqual('probe');
      expect(probe.columnCount()).assertEqual(2);
      expect(probe.columns[0]).assertEqual('code');
      expect(probe.columns[1]).assertEqual('token');
      expect(probe.primaryKey).assertEqual('token');
      expect(probe.notNullColumns.length).assertEqual(1);
      expect(probe.isNotNull('code')).assertTrue();
      expect(probe.isNotNull('token')).assertFalse();
      expect(probe.autoincrement).assertFalse();
    });

    /**
     * @tc.name   schemaWithoutExistsKeywordHasEmptyTable
     * @tc.desc   The limited schema fixture requires EXISTS to extract the table name,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            still parsing the column list.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('schemaWithoutExistsKeywordHasEmptyTable', 0, () => {
      const probe: SchemaInfo = new SchemaInfo('CREATE TABLE probe(name TEXT NOT NULL, phone TEXT NOT NULL)');
      expect(probe.table).assertEqual('');
      expect(probe.table.length).assertEqual(0);
      expect(probe.columnCount()).assertEqual(2);
      expect(probe.notNullColumns.length).assertEqual(2);
      expect(probe.primaryKey).assertEqual('');
      expect(probe.hasColumn('name')).assertTrue();
      expect(probe.statement.indexOf('EXISTS')).assertEqual(-1);
    });

    /**
     * @tc.name   schemaLowercaseAutoincrementIsNotDetected
     * @tc.desc   The AUTOINCREMENT probe is case sensitive, so a lowercase spelling in a probe
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            statement leaves the flag false.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('schemaLowercaseAutoincrementIsNotDetected', 0, () => {
      const probe: SchemaInfo = new SchemaInfo(
        'CREATE TABLE IF NOT EXISTS probe(id INTEGER PRIMARY KEY autoincrement, name TEXT NOT NULL)');
      expect(probe.autoincrement).assertFalse();
      expect(probe.primaryKey).assertEqual('id');
      expect(probe.notNullColumns.length).assertEqual(1);
      expect(schema.autoincrement).assertTrue();
      expect(schema.statement.indexOf('autoincrement')).assertEqual(-1);
    });

    /**
     * @tc.name   schemaParenthesesBodyHasSevenDefinitions
     * @tc.desc   The comma separated body between the outer parentheses holds seven definitions,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            one per parsed column.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaParenthesesBodyHasSevenDefinitions', 0, () => {
      const open: int = schema.statement.indexOf('(');
      const close: int = schema.statement.lastIndexOf(')');
      const body: string = schema.statement.substring(open + 1, close);
      const definitions: string[] = body.split(',');
      expect(definitions.length).assertEqual(7);
      expect(definitions.length).assertEqual(schema.columnCount());
      expect(definitions[0].indexOf('id INTEGER PRIMARY KEY') >= 0).assertTrue();
      expect(definitions[1].trim().startsWith('name TEXT NOT NULL')).assertTrue();
      expect(definitions[6].trim().startsWith('category TEXT NOT NULL')).assertTrue();
      expect(body.indexOf(')')).assertEqual(-1);
    });

    /**
     * @tc.name   schemaHasNoDuplicateColumns
     * @tc.desc   All seven parsed column names are distinct, so a bucket key cannot collide with
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            a second definition.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaHasNoDuplicateColumns', 0, () => {
      expect(uniqueStrings(schema.columns).length).assertEqual(7);
      expect(uniqueStrings(schema.columns).length).assertEqual(schema.columns.length);
      for (let index = 0; index < schema.columns.length; index++) {
        expect(countOf(schema.columns, schema.columns[index])).assertEqual(1);
      }
      expect(countOf(schema.columns, FIELD_NAME)).assertEqual(1);
      expect(countOf(schema.columns, FIELD_PHONE)).assertEqual(1);
      expect(countOf(schema.columns, 'missing')).assertEqual(0);
    });

    /**
     * @tc.name   schemaDescribeStartsWithTableName
     * @tc.desc   The description begins with the parsed table name and carries the autoincrement
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            flag in its final section.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaDescribeStartsWithTableName', 0, () => {
      const description: string = schema.describe();
      expect(description.startsWith('contact|')).assertTrue();
      expect(description.indexOf('|id|true')).assertEqual(description.length - 8);
      expect(description.indexOf('|true')).assertEqual(description.length - 5);
      expect(description.endsWith('|true')).assertTrue();
      expect(description.indexOf(schema.table)).assertEqual(0);
      expect(description.split('|')[1].indexOf('avatar') > 0).assertTrue();
      expect(description.split('|')[2]).assertEqual('name,phone,email,address,avatar,category');
    });

    /**
     * @tc.name   schemaStatementRetainsOriginalText
     * @tc.desc   The parser keeps the original statement text untouched, which the create-table
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            call needs when it executes the literal.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('schemaStatementRetainsOriginalText', 0, () => {
      const text: string = SQL_CREATE_TABLE;
      const parsed: SchemaInfo = new SchemaInfo(text);
      expect(parsed.statement).assertEqual(text);
      expect(parsed.statement.length).assertEqual(text.length);
      expect(parsed.statement === text).assertTrue();
      expect(parsed.statement.indexOf('  ')).assertEqual(-1);
      expect(parsed.statement.indexOf('\n')).assertEqual(-1);
      expect(parsed.describe()).assertEqual(schema.describe());
    });

    /**
     * @tc.name   schemaSingleTextColumnStatement
     * @tc.desc   A minimal one column probe table parses with no primary key and a description
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            whose primary key section is empty.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('schemaSingleTextColumnStatement', 0, () => {
      const probe: SchemaInfo = new SchemaInfo('CREATE TABLE IF NOT EXISTS note(body TEXT NOT NULL)');
      expect(probe.table).assertEqual('note');
      expect(probe.columnCount()).assertEqual(1);
      expect(probe.columns[0]).assertEqual('body');
      expect(probe.notNullColumns[0]).assertEqual('body');
      expect(probe.primaryKey).assertEqual('');
      expect(probe.autoincrement).assertFalse();
      expect(probe.describe()).assertEqual('note|body|body||false');
    });

    /**
     * @tc.name   schemaPrimaryKeyAppearsOnceInStatement
     * @tc.desc   The raw statement declares one PRIMARY KEY clause and one AUTOINCREMENT clause,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            both attached to the id definition.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaPrimaryKeyAppearsOnceInStatement', 0, () => {
      expect(schema.statement.split('PRIMARY KEY').length - 1).assertEqual(1);
      expect(schema.statement.split('AUTOINCREMENT').length - 1).assertEqual(1);
      expect(schema.statement.split('INTEGER').length - 1).assertEqual(1);
      expect(schema.statement.indexOf('PRIMARY KEY') < schema.statement.indexOf('AUTOINCREMENT')).assertTrue();
      expect(schema.statement.indexOf('PRIMARY KEY') > schema.statement.indexOf('id INTEGER')).assertTrue();
      expect(schema.primaryKey).assertEqual('id');
    });

    /**
     * @tc.name   schemaColumnsExcludeSqlTypeKeywords
     * @tc.desc   Column names never contain a SQL type or constraint keyword, because the parser
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            stops at the first space of each definition.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaColumnsExcludeSqlTypeKeywords', 0, () => {
      for (let index = 0; index < schema.columns.length; index++) {
        const column: string = schema.columns[index];
        expect(column.indexOf('TEXT')).assertEqual(-1);
        expect(column.indexOf('INTEGER')).assertEqual(-1);
        expect(column.indexOf('NOT')).assertEqual(-1);
        expect(column.indexOf('PRIMARY')).assertEqual(-1);
        expect(column.indexOf(' ')).assertEqual(-1);
      }
      expect(schema.columns.length).assertEqual(7);
      expect(schema.columns.indexOf('TEXT')).assertEqual(-1);
      expect(schema.columns.indexOf('INTEGER')).assertEqual(-1);
    });

    /**
     * @tc.name   schemaTextColumnsCountIsSix
     * @tc.desc   Six TEXT columns back the payload and one INTEGER column holds the key, matching
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the insert bucket shape.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaTextColumnsCountIsSix', 0, () => {
      expect(schema.statement.split('TEXT').length - 1).assertEqual(6);
      expect(schema.statement.split('INTEGER').length - 1).assertEqual(1);
      expect(schema.notNullColumns.length).assertEqual(6);
      expect(schema.columnCount() - schema.notNullColumns.length).assertEqual(1);
      expect(BUCKET_KEYS.length).assertEqual(schema.columnCount() - 1);
      expect(schema.columns[0]).assertEqual('id');
    });

    /**
     * @tc.name   schemaColumnsAreTrimmedTokens
     * @tc.desc   Every parsed column name is already trimmed, non-empty and free of surrounding
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            whitespace.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaColumnsAreTrimmedTokens', 0, () => {
      for (let index = 0; index < schema.columns.length; index++) {
        const column: string = schema.columns[index];
        expect(column.length > 0).assertTrue();
        expect(column === column.trim()).assertTrue();
        expect(column.indexOf(',')).assertEqual(-1);
      }
      expect(joined(schema.columns, ',').indexOf(' ')).assertEqual(-1);
      expect(schema.columns.length).assertEqual(7);
      expect(uniqueStrings(schema.columns).length).assertEqual(7);
    });

    /**
     * @tc.name   schemaTableNameIsNotAColumn
     * @tc.desc   The table name never leaks into the column list, so a query selecting every
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            column cannot request a phantom contact column.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaTableNameIsNotAColumn', 0, () => {
      expect(schema.columns.indexOf(schema.table)).assertEqual(-1);
      expect(schema.columns.indexOf(TABLE_CONTACT)).assertEqual(-1);
      expect(schema.hasColumn(TABLE_CONTACT)).assertFalse();
      expect(schema.columnCount()).assertEqual(7);
      expect(schema.columns[0]).assertEqual('id');
      expect(schema.describe().split('|')[0]).assertEqual(TABLE_CONTACT);
    });

    /**
     * @tc.name   schemaStatementHasSingleColumnList
     * @tc.desc   The statement contains one opening and one closing parenthesis, so the parser
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            reads exactly one column list.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaStatementHasSingleColumnList', 0, () => {
      expect(schema.statement.split('(').length).assertEqual(2);
      expect(schema.statement.split(')').length).assertEqual(2);
      expect(schema.statement.indexOf('(') < schema.statement.lastIndexOf(')')).assertTrue();
      expect(schema.statement.indexOf('(')).assertEqual(schema.statement.indexOf('contact(') + 7);
      expect(schema.statement.substring(0, schema.statement.indexOf('(')).endsWith('contact')).assertTrue();
      expect(schema.columnCount()).assertEqual(7);
    });

    /**
     * @tc.name   schemaNotNullColumnsFollowThePayloadOrder
     * @tc.desc   The NOT NULL list starts with name and ends with category, matching the bucket
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            key order used by the insert path.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaNotNullColumnsFollowThePayloadOrder', 0, () => {
      expect(schema.notNullColumns[0]).assertEqual(FIELD_NAME);
      expect(schema.notNullColumns[1]).assertEqual(FIELD_PHONE);
      expect(schema.notNullColumns[2]).assertEqual(FIELD_EMAIL);
      expect(schema.notNullColumns[3]).assertEqual(FIELD_ADDRESS);
      expect(schema.notNullColumns[4]).assertEqual(FIELD_AVATAR);
      expect(schema.notNullColumns[5]).assertEqual(FIELD_CATEGORY);
      for (let index = 0; index < schema.notNullColumns.length; index++) {
        expect(schema.notNullColumns[index]).assertEqual(BUCKET_KEYS[index]);
      }
      expect(joined(schema.notNullColumns, '>')).assertEqual(joined(BUCKET_KEYS, '>'));
    });

    /**
     * @tc.name   schemaDescribeIsStableAcrossParses
     * @tc.desc   Parsing the same literal twice produces the same description and the same
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            column list, so schema comparisons are deterministic.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaDescribeIsStableAcrossParses', 0, () => {
      const first: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);
      const second: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(first.describe()).assertEqual(second.describe());
      expect(first.describe()).assertEqual(schema.describe());
      expect(first.columnCount()).assertEqual(second.columnCount());
      expect(joined(first.columns, ',')).assertEqual(joined(second.columns, ','));
      expect(first.columns.length).assertEqual(second.columns.length);
      expect(first.notNullColumns.length).assertEqual(second.notNullColumns.length);
      expect(first === second).assertFalse();
    });

    /**
     * @tc.name   schemaProbeWithIdLastParsesPrimaryKey
     * @tc.desc   A probe table that declares the key last is parsed with the same primary key and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            autoincrement flag, proving order independence.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('schemaProbeWithIdLastParsesPrimaryKey', 0, () => {
      const probe: SchemaInfo = new SchemaInfo(
        'CREATE TABLE IF NOT EXISTS probe(name TEXT NOT NULL, note TEXT NOT NULL, id INTEGER PRIMARY KEY AUTOINCREMENT)');
      expect(probe.table).assertEqual('probe');
      expect(probe.columnCount()).assertEqual(3);
      expect(probe.columns[2]).assertEqual('id');
      expect(probe.primaryKey).assertEqual('id');
      expect(probe.autoincrement).assertTrue();
      expect(probe.notNullColumns.length).assertEqual(2);
      expect(probe.isNotNull('id')).assertFalse();
      expect(probe.describe()).assertEqual('probe|name,note,id|name,note|id|true');
    });

    /**
     * @tc.name   schemaProbeWithoutPrimaryKeyHasEmptyKey
     * @tc.desc   A probe table with only TEXT NOT NULL columns reports no primary key and no
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            autoincrement, and its description leaves the key section empty.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('schemaProbeWithoutPrimaryKeyHasEmptyKey', 0, () => {
      const probe: SchemaInfo = new SchemaInfo(
        'CREATE TABLE IF NOT EXISTS log(message TEXT NOT NULL, level TEXT NOT NULL)');
      expect(probe.table).assertEqual('log');
      expect(probe.primaryKey).assertEqual('');
      expect(probe.autoincrement).assertFalse();
      expect(probe.columnCount()).assertEqual(2);
      expect(probe.notNullColumns.length).assertEqual(2);
      expect(probe.describe()).assertEqual('log|message,level|message,level||false');
      expect(probe.describe().split('|')[3]).assertEqual('');
    });

    /**
     * @tc.name   schemaMixedCaseColumnNameIsPreserved
     * @tc.desc   The parser keeps the declared case of a column name, so lookups are case
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            sensitive just like the store metadata.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('schemaMixedCaseColumnNameIsPreserved', 0, () => {
      const probe: SchemaInfo = new SchemaInfo(
        'CREATE TABLE IF NOT EXISTS Probe(Code TEXT NOT NULL, Value TEXT NOT NULL)');
      expect(probe.table).assertEqual('Probe');
      expect(probe.columns[0]).assertEqual('Code');
      expect(probe.columns[1]).assertEqual('Value');
      expect(probe.hasColumn('Code')).assertTrue();
      expect(probe.hasColumn('code')).assertFalse();
      expect(probe.isNotNull('Code')).assertTrue();
      expect(probe.isNotNull('code')).assertFalse();
      expect(joined(probe.columns, ',')).assertEqual('Code,Value');
    });

    /**
     * @tc.name   schemaPrimaryKeyOnlyProbeHasNoAutoincrement
     * @tc.desc   A primary key declared without the AUTOINCREMENT keyword keeps the key but
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            leaves the generated-key flag false.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('schemaPrimaryKeyOnlyProbeHasNoAutoincrement', 0, () => {
      const probe: SchemaInfo = new SchemaInfo(
        'CREATE TABLE IF NOT EXISTS probe(id INTEGER PRIMARY KEY, name TEXT NOT NULL)');
      expect(probe.primaryKey).assertEqual('id');
      expect(probe.autoincrement).assertFalse();
      expect(probe.notNullColumns.length).assertEqual(1);
      expect(probe.isNotNull('name')).assertTrue();
      expect(probe.isNotNull('id')).assertFalse();
      expect(probe.columns[0]).assertEqual('id');
      expect(probe.describe()).assertEqual('probe|id,name|name|id|false');
    });

    /**
     * @tc.name   schemaStatementKeywordOrderIsCreateTableFirst
     * @tc.desc   The keywords of the literal appear in SQL order, with the table name after
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            EXISTS and before the column list.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaStatementKeywordOrderIsCreateTableFirst', 0, () => {
      const statement: string = schema.statement;
      expect(statement.indexOf('CREATE')).assertEqual(0);
      expect(statement.indexOf('TABLE') > statement.indexOf('CREATE')).assertTrue();
      expect(statement.indexOf('IF') > statement.indexOf('TABLE')).assertTrue();
      expect(statement.indexOf('EXISTS') > statement.indexOf('IF')).assertTrue();
      expect(statement.indexOf('contact') > statement.indexOf('EXISTS')).assertTrue();
      expect(statement.indexOf('(') > statement.indexOf('contact')).assertTrue();
      expect(statement.indexOf('id') > statement.indexOf('contact')).assertTrue();
    });
    /**
     * @tc.name   schemaColumnsAreLowerCase
     * @tc.desc   Every production column name is lowercase, which is why bucket keys built from
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the constant resolve against the schema.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaColumnsAreLowerCase', 0, () => {
      for (let index = 0; index < schema.columns.length; index++) {
        const column: string = schema.columns[index];
        expect(column === column.toLowerCase()).assertTrue();
        expect(column.indexOf('_')).assertEqual(-1);
      }
      expect(schema.columns[1]).assertEqual('name');
      expect(schema.columns[6]).assertEqual('category');
      expect(BUCKET_KEYS[0] === BUCKET_KEYS[0].toLowerCase()).assertTrue();
      expect(schema.columns.indexOf('Contact')).assertEqual(-1);
    });

    /**
     * @tc.name   schemaNotNullColumnsAreSubsetOfColumns
     * @tc.desc   Every NOT NULL column is also a declared column, and the subset is one element
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            smaller than the full list because id is excluded.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaNotNullColumnsAreSubsetOfColumns', 0, () => {
      for (let index = 0; index < schema.notNullColumns.length; index++) {
        const column: string = schema.notNullColumns[index];
        expect(schema.columns.indexOf(column) >= 0).assertTrue();
        expect(schema.hasColumn(column)).assertTrue();
      }
      expect(schema.notNullColumns.length).assertEqual(schema.columns.length - 1);
      expect(schema.notNullColumns.indexOf('id')).assertEqual(-1);
      expect(schema.notNullColumns.length).assertEqual(6);
    });

    /**
     * @tc.name   schemaDescribeSectionsMatchProperties
     * @tc.desc   Each description section equals the corresponding parsed property, so the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            description is a faithful serialisation of the schema object.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('schemaDescribeSectionsMatchProperties', 0, () => {
      const parts: string[] = schema.describe().split('|');
      expect(parts[0]).assertEqual(schema.table);
      expect(parts[1]).assertEqual(joined(schema.columns, ','));
      expect(parts[2]).assertEqual(joined(schema.notNullColumns, ','));
      expect(parts[3]).assertEqual(schema.primaryKey);
      expect(parts[4]).assertEqual(String(schema.autoincrement));
      expect(parts.length).assertEqual(5);
      expect(parts[4]).assertEqual('true');
    });

    /**
     * @tc.name   schemaStatementDeclaresNoExtraConstraints
     * @tc.desc   The literal uses only NOT NULL, PRIMARY KEY and AUTOINCREMENT, with no DEFAULT,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            UNIQUE, CHECK or FOREIGN clause that the bucket write path would ignore.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaStatementDeclaresNoExtraConstraints', 0, () => {
      const statement: string = schema.statement;
      expect(statement.indexOf('DEFAULT')).assertEqual(-1);
      expect(statement.indexOf('UNIQUE')).assertEqual(-1);
      expect(statement.indexOf('CHECK')).assertEqual(-1);
      expect(statement.indexOf('FOREIGN')).assertEqual(-1);
      expect(statement.indexOf('REFERENCES')).assertEqual(-1);
      expect(statement.indexOf('NOT NULL') > 0).assertTrue();
      expect(statement.indexOf('PRIMARY KEY') > 0).assertTrue();
    });
    /**
     * @tc.name   schemaPayloadProbeMatchesBucketKeys
     * @tc.desc   A probe table declaring exactly the six bucket columns in order is parsed with a
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            NOT NULL list identical to the shared bucket keys.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaPayloadProbeMatchesBucketKeys', 0, () => {
      const probe: SchemaInfo = new SchemaInfo(
        'CREATE TABLE IF NOT EXISTS payload(name TEXT NOT NULL, phone TEXT NOT NULL, ' +
          'email TEXT NOT NULL, address TEXT NOT NULL, avatar TEXT NOT NULL, category TEXT NOT NULL)');
      expect(probe.columnCount()).assertEqual(6);
      expect(probe.columnCount()).assertEqual(BUCKET_KEYS.length);
      expect(sameStringArray(probe.columns, BUCKET_KEYS)).assertTrue();
      expect(sameStringArray(probe.notNullColumns, BUCKET_KEYS)).assertTrue();
      expect(probe.primaryKey).assertEqual('');
      expect(probe.autoincrement).assertFalse();
      expect(joined(probe.columns, ',')).assertEqual(joined(BUCKET_KEYS, ','));
    });

    /**
     * @tc.name   schemaKeyColumnIsFirstDefinition
     * @tc.desc   The id definition opens the column list, so the generated key is the first
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RdbSchemaValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            column the store reports for the table.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('schemaKeyColumnIsFirstDefinition', 0, () => {
      const open: int = schema.statement.indexOf('(');
      const body: string = schema.statement.substring(open + 1);
      expect(body.startsWith('id INTEGER PRIMARY KEY AUTOINCREMENT')).assertTrue();
      expect(body.indexOf('id')).assertEqual(0);
      expect(schema.columns[0]).assertEqual(schema.primaryKey);
      expect(schema.columns[1]).assertEqual(FIELD_NAME);
      expect(schema.notNullColumns[0]).assertEqual(FIELD_NAME);
      expect(schema.columns.indexOf(schema.primaryKey)).assertEqual(0);
      expect(schema.notNullColumns.indexOf(FIELD_NAME)).assertEqual(0);
    });
  });
}
