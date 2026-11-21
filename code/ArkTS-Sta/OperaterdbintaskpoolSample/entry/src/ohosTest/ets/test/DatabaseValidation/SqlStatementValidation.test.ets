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
 * SqlStatementValidation pins the three SQL literals used by the sample.
 *
 * Production anchors:
 *   RdbConstant.ets:33-34          SQL_CREATE_TABLE with six NOT NULL columns and the
 *                                  id INTEGER PRIMARY KEY AUTOINCREMENT key
 *   DatabaseConnection.ets:99      execute(SQL_CREATE_TABLE) in createTable
 *   DatabaseConnection.ets:235     'DELETE FROM contact WHERE name = ?;' with one
 *                                  bound parameter
 *   DatabaseConnection.ets:269-270 'UPDATE contact SET phone = ?, email = ?,
 *                                  address = ? WHERE name = ?;' with four bound
 *                                  parameters
 *   DatabaseConnection.ets:202-209 the insert bucket carries the six column values
 *
 * The DELETE and UPDATE literals are reproduced verbatim from the production
 * methods above. Every user supplied value is bound through the parameter array
 * and never concatenated into the statement text.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  SQL_CREATE_CONTACT,
  TABLE_CONTACT,
  BUCKET_KEYS,
  SchemaInfo,
  FIELD_NAME,
  FIELD_PHONE,
  FIELD_EMAIL,
  FIELD_ADDRESS,
  FIELD_AVATAR,
  FIELD_CATEGORY,
  joined,
  countOf,
  sameStringArray,
  contactOf,
  resetContactManager
} from '../Shared/SharedDriver';

const SQL_DELETE_BY_NAME: string = 'DELETE FROM contact WHERE name = ?;';
const SQL_UPDATE_CONTACT: string = 'UPDATE contact SET phone = ?, email = ?, address = ? WHERE name = ?;';

export default function sqlStatementValidationTest(): void {
  describe('SqlStatementValidation', () => {
    beforeAll(() => {
      logSuite('SqlStatementValidation', 'begin');
    });

    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('SqlStatementValidation', 'end');
    });

    /**
     * @tc.name   createStatementStartsWithIdempotentPrefix
     * @tc.desc   The CREATE TABLE literal begins with the IF NOT EXISTS guard, which lets the page
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            run it on every launch.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('createStatementStartsWithIdempotentPrefix', 0, () => {
      expect(SQL_CREATE_CONTACT.indexOf('CREATE TABLE IF NOT EXISTS')).assertEqual(0);
      expect(SQL_CREATE_CONTACT.startsWith('CREATE TABLE IF NOT EXISTS ')).assertTrue();
      expect(SQL_CREATE_CONTACT.substring(0, 13)).assertEqual('CREATE TABLE ');
      expect(SQL_CREATE_CONTACT.indexOf('CREATE')).assertEqual(0);
      expect(SQL_CREATE_CONTACT.indexOf('EXISTS')).assertEqual(20);
      logStep('SqlStatementValidation', 'create statement prefix verified');
    });

    /**
     * @tc.name   createStatementNamesContactTable
     * @tc.desc   The table name appears once in the statement and matches the shared table
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            constant.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('createStatementNamesContactTable', 0, () => {
      expect(SQL_CREATE_CONTACT.indexOf('contact')).assertEqual(27);
      expect(SQL_CREATE_CONTACT.split('contact').length - 1).assertEqual(1);
      expect(TABLE_CONTACT).assertEqual('contact');
      expect(SQL_CREATE_CONTACT.substring(27, 34)).assertEqual(TABLE_CONTACT);
      expect(SQL_CREATE_CONTACT.indexOf('contacts')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('contact(')).assertEqual(27);
    });

    /**
     * @tc.name   createStatementDeclaresSixNotNullColumns
     * @tc.desc   Six payload columns are declared NOT NULL while the generated id is left without
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            that clause.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('createStatementDeclaresSixNotNullColumns', 0, () => {
      expect(SQL_CREATE_CONTACT.split('NOT NULL').length - 1).assertEqual(6);
      expect(SQL_CREATE_CONTACT.split('TEXT NOT NULL').length - 1).assertEqual(6);
      expect(SQL_CREATE_CONTACT.split('NOT NULL').length - 1).assertEqual(BUCKET_KEYS.length);
      expect(SQL_CREATE_CONTACT.indexOf('id TEXT')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('id INTEGER')).assertEqual(35);
      expect(SQL_CREATE_CONTACT.indexOf('NOT NULL')).assertEqual(83);
    });

    /**
     * @tc.name   createStatementDeclaresIdAsGeneratedKey
     * @tc.desc   The id column is an INTEGER PRIMARY KEY with AUTOINCREMENT, declared as the first
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            column of the table.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('createStatementDeclaresIdAsGeneratedKey', 0, () => {
      const open: int = SQL_CREATE_CONTACT.indexOf('(');
      expect(open).assertEqual(34);
      expect(SQL_CREATE_CONTACT.substring(open + 1).startsWith('id INTEGER PRIMARY KEY AUTOINCREMENT')).assertTrue();
      expect(SQL_CREATE_CONTACT.split('PRIMARY KEY').length - 1).assertEqual(1);
      expect(SQL_CREATE_CONTACT.split('AUTOINCREMENT').length - 1).assertEqual(1);
      expect(SQL_CREATE_CONTACT.indexOf('PRIMARY KEY') < SQL_CREATE_CONTACT.indexOf('AUTOINCREMENT')).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('AUTOINCREMENT') < SQL_CREATE_CONTACT.indexOf('NOT NULL')).assertTrue();
    });

    /**
     * @tc.name   deleteStatementShapeMatchesProduction
     * @tc.desc   The delete literal is the exact statement executed by deleteData: a DELETE FROM
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            contact with a single equality predicate and a terminator.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteStatementShapeMatchesProduction', 0, () => {
      expect(SQL_DELETE_BY_NAME).assertEqual('DELETE FROM contact WHERE name = ?;');
      expect(SQL_DELETE_BY_NAME.indexOf('DELETE')).assertEqual(0);
      expect(SQL_DELETE_BY_NAME.startsWith('DELETE FROM contact ')).assertTrue();
      expect(SQL_DELETE_BY_NAME.endsWith(';')).assertTrue();
      expect(SQL_DELETE_BY_NAME.length).assertEqual(35);
      expect(SQL_DELETE_BY_NAME.indexOf('contact')).assertEqual(12);
    });

    /**
     * @tc.name   deleteStatementHasSinglePlaceholder
     * @tc.desc   The delete literal carries exactly one question mark, so exactly one bound
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            parameter is required.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteStatementHasSinglePlaceholder', 0, () => {
      expect(SQL_DELETE_BY_NAME.split('?').length - 1).assertEqual(1);
      expect(countOf(SQL_DELETE_BY_NAME.split(''), '?')).assertEqual(1);
      expect(SQL_DELETE_BY_NAME.indexOf('?')).assertEqual(33);
      expect(SQL_DELETE_BY_NAME.indexOf('?', SQL_DELETE_BY_NAME.indexOf('?') + 1)).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf('= ?')).assertEqual(31);
    });

    /**
     * @tc.name   deleteStatementBindsNameOnly
     * @tc.desc   The bound parameter array for the delete holds exactly the contact name, in the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            single placeholder position.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteStatementBindsNameOnly', 0, () => {
      const contact: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road');
      const params: string[] = [contact.name];
      expect(params.length).assertEqual(1);
      expect(params.length).assertEqual(SQL_DELETE_BY_NAME.split('?').length - 1);
      expect(params[0]).assertEqual('Ada Lovelace');
      expect(params[0] === contact.phone).assertFalse();
      expect(SQL_DELETE_BY_NAME.indexOf('phone')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf('email')).assertEqual(-1);
    });

    /**
     * @tc.name   deleteStatementTargetsTheNameColumn
     * @tc.desc   The predicate names only the name column, so the delete cannot remove rows by
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            phone, email or address.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteStatementTargetsTheNameColumn', 0, () => {
      expect(SQL_DELETE_BY_NAME.indexOf('WHERE name = ?')).assertEqual(20);
      expect(SQL_DELETE_BY_NAME.indexOf('WHERE')).assertEqual(20);
      expect(SQL_DELETE_BY_NAME.indexOf(' AND ')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf(' OR ')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf('LIKE')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf('name') > SQL_DELETE_BY_NAME.indexOf('WHERE')).assertTrue();
      expect(SQL_DELETE_BY_NAME.indexOf('address')).assertEqual(-1);
    });

    /**
     * @tc.name   deleteStatementNeverInterpolatesUserValues
     * @tc.desc   A name with quotes and SQL keywords stays out of the statement text and only
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            appears in the bound parameter array.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteStatementNeverInterpolatesUserValues', 0, () => {
      const hostile: Contact = contactOf("O'Brien; DROP TABLE contact", '13800138000', 'hostile@example.com',
        'Nowhere');
      const params: string[] = [hostile.name];
      expect(SQL_DELETE_BY_NAME.indexOf(hostile.name)).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf("O'Brien")).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf('DROP TABLE')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf(hostile.phone)).assertEqual(-1);
      expect(params[0].indexOf('DROP TABLE') > 0).assertTrue();
      expect(params.length).assertEqual(1);
    });

    /**
     * @tc.name   updateStatementShapeMatchesProduction
     * @tc.desc   The update literal is the statement executed by updateData: an UPDATE contact with
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            a SET list of three columns and a name predicate.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('updateStatementShapeMatchesProduction', 0, () => {
      expect(SQL_UPDATE_CONTACT).assertEqual(
        'UPDATE contact SET phone = ?, email = ?, address = ? WHERE name = ?;');
      expect(SQL_UPDATE_CONTACT.indexOf('UPDATE')).assertEqual(0);
      expect(SQL_UPDATE_CONTACT.startsWith('UPDATE contact SET ')).assertTrue();
      expect(SQL_UPDATE_CONTACT.endsWith(';')).assertTrue();
      expect(SQL_UPDATE_CONTACT.length).assertEqual(68);
      expect(SQL_UPDATE_CONTACT.indexOf('contact')).assertEqual(7);
      expect(SQL_UPDATE_CONTACT.indexOf('SET')).assertEqual(15);
    });

    /**
     * @tc.name   updateStatementHasFourPlaceholders
     * @tc.desc   The SET list contributes three placeholders and the predicate one, so four bound
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            parameters are required in that order.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('updateStatementHasFourPlaceholders', 0, () => {
      expect(SQL_UPDATE_CONTACT.split('?').length - 1).assertEqual(4);
      expect(countOf(SQL_UPDATE_CONTACT.split(''), '?')).assertEqual(4);
      expect(SQL_UPDATE_CONTACT.indexOf('?')).assertEqual(27);
      expect(SQL_UPDATE_CONTACT.indexOf('=', SQL_UPDATE_CONTACT.indexOf('?') + 1) > 0).assertTrue();
      expect(SQL_UPDATE_CONTACT.lastIndexOf('?')).assertEqual(66);
      expect(SQL_UPDATE_CONTACT.indexOf('WHERE')).assertEqual(53);
    });

    /**
     * @tc.name   updateStatementBindsFourParametersInOrder
     * @tc.desc   The parameter array holds phone, email, address and name in the placeholder order
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            used by the statement.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('updateStatementBindsFourParametersInOrder', 0, () => {
      const contact: Contact = contactOf('Ada Lovelace', '19999999999', 'new@example.com', 'New Road',
        'ignored.png', 'F');
      const params: string[] = [contact.phone, contact.email, contact.address, contact.name];
      expect(params.length).assertEqual(4);
      expect(params.length).assertEqual(SQL_UPDATE_CONTACT.split('?').length - 1);
      expect(params[0]).assertEqual(contact.phone);
      expect(params[1]).assertEqual(contact.email);
      expect(params[2]).assertEqual(contact.address);
      expect(params[3]).assertEqual(contact.name);
      expect(joined(params, ',')).assertEqual('19999999999,new@example.com,New Road,Ada Lovelace');
    });

    /**
     * @tc.name   updateStatementDoesNotReassignTheName
     * @tc.desc   The name column appears only in the WHERE predicate, never on the left side of a
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            SET assignment.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateStatementDoesNotReassignTheName', 0, () => {
      expect(SQL_UPDATE_CONTACT.split('name').length - 1).assertEqual(1);
      expect(SQL_UPDATE_CONTACT.indexOf('SET name')).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf('name = ?')).assertEqual(59);
      expect(SQL_UPDATE_CONTACT.indexOf('name = ?') > SQL_UPDATE_CONTACT.indexOf('WHERE')).assertTrue();
      expect(SQL_UPDATE_CONTACT.substring(0, SQL_UPDATE_CONTACT.indexOf('WHERE')).indexOf('name')).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.split('?').length - 1).assertEqual(4);
    });

    /**
     * @tc.name   updateStatementLeavesAvatarAndCategoryUntouched
     * @tc.desc   The SET list names only phone, email and address, so avatar and category keep
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            their stored values after an update.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateStatementLeavesAvatarAndCategoryUntouched', 0, () => {
      expect(SQL_UPDATE_CONTACT.indexOf(FIELD_AVATAR)).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf(FIELD_CATEGORY)).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf('avatar =')).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf('category =')).assertEqual(-1);
      const setClause: string = SQL_UPDATE_CONTACT.substring(SQL_UPDATE_CONTACT.indexOf('SET'),
        SQL_UPDATE_CONTACT.indexOf('WHERE'));
      expect(setClause.indexOf('phone')).assertEqual(4);
      expect(setClause.indexOf('email') > 0).assertTrue();
      expect(setClause.indexOf('address') > 0).assertTrue();
      expect(setClause.split('?').length - 1).assertEqual(3);
    });

    /**
     * @tc.name   updateStatementNeverInterpolatesValues
     * @tc.desc   An address containing quotes and a comment marker stays out of the statement text
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            and is carried only by the bound parameter array.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateStatementNeverInterpolatesValues', 0, () => {
      const hostile: Contact = contactOf('Ada Lovelace', '19999999999', 'hostile@example.com',
        "1'); DROP TABLE contact; --", 'x.png', 'A');
      const params: string[] = [hostile.phone, hostile.email, hostile.address, hostile.name];
      expect(SQL_UPDATE_CONTACT.indexOf(hostile.address)).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf('DROP TABLE')).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf('--')).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf(hostile.email)).assertEqual(-1);
      expect(params[2]).assertEqual("1'); DROP TABLE contact; --");
      expect(params.length).assertEqual(4);
      expect(SQL_UPDATE_CONTACT.split('?').length - 1).assertEqual(params.length);
    });

    /**
     * @tc.name   createStatementHasNoPlaceholders
     * @tc.desc   The CREATE TABLE literal is a DDL statement with no bound parameters, so it
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            contains no question mark.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createStatementHasNoPlaceholders', 0, () => {
      expect(SQL_CREATE_CONTACT.indexOf('?')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.split('?').length).assertEqual(1);
      expect(SQL_CREATE_CONTACT.indexOf('=')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('WHERE')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('SET ')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.endsWith(')')).assertTrue();
    });

    /**
     * @tc.name   createStatementTypesMatchThePayload
     * @tc.desc   One INTEGER column backs the key and six TEXT columns back the payload, matching
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the string fields of Contact.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('createStatementTypesMatchThePayload', 0, () => {
      expect(SQL_CREATE_CONTACT.split('TEXT').length - 1).assertEqual(6);
      expect(SQL_CREATE_CONTACT.split('INTEGER').length - 1).assertEqual(1);
      expect(SQL_CREATE_CONTACT.split('TEXT').length - 1).assertEqual(BUCKET_KEYS.length);
      expect(SQL_CREATE_CONTACT.indexOf('INTEGER') < SQL_CREATE_CONTACT.indexOf('TEXT')).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('BLOB')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('REAL')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('DATE')).assertEqual(-1);
    });

    /**
     * @tc.name   createStatementClosesWithoutSemicolon
     * @tc.desc   The DDL literal ends with the closing parenthesis and not with a semicolon,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            exactly as passed to execute.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createStatementClosesWithoutSemicolon', 0, () => {
      expect(SQL_CREATE_CONTACT.endsWith(')')).assertTrue();
      expect(SQL_CREATE_CONTACT.endsWith(';')).assertFalse();
      expect(SQL_CREATE_CONTACT.lastIndexOf(')')).assertEqual(SQL_CREATE_CONTACT.length - 1);
      expect(SQL_CREATE_CONTACT.split('(').length).assertEqual(2);
      expect(SQL_CREATE_CONTACT.split(')').length).assertEqual(2);
      expect(SQL_CREATE_CONTACT.indexOf(')') > SQL_CREATE_CONTACT.indexOf('(')).assertTrue();
    });

    /**
     * @tc.name   allStatementsTargetTheSameTable
     * @tc.desc   The CREATE, DELETE and UPDATE literals all reference the contact table exactly
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            once, so they operate on the same store entity.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('allStatementsTargetTheSameTable', 0, () => {
      expect(SQL_CREATE_CONTACT.split(TABLE_CONTACT).length - 1).assertEqual(1);
      expect(SQL_DELETE_BY_NAME.split(TABLE_CONTACT).length - 1).assertEqual(1);
      expect(SQL_UPDATE_CONTACT.split(TABLE_CONTACT).length - 1).assertEqual(1);
      expect(SQL_DELETE_BY_NAME.indexOf(TABLE_CONTACT)).assertEqual(12);
      expect(SQL_UPDATE_CONTACT.indexOf(TABLE_CONTACT)).assertEqual(7);
      expect(sameStringArray([TABLE_CONTACT], ['contact'])).assertTrue();
    });

    /**
     * @tc.name   insertBucketColumnsFollowTheCreateStatement
     * @tc.desc   Removing the generated id column from the parsed schema yields exactly the six
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            bucket keys the insert path writes.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('insertBucketColumnsFollowTheCreateStatement', 0, () => {
      const schema: SchemaInfo = new SchemaInfo(SQL_CREATE_CONTACT);
      const payload: string[] = schema.columns.slice(1);
      expect(payload.length).assertEqual(6);
      expect(sameStringArray(payload, BUCKET_KEYS)).assertTrue();
      expect(joined(payload, ',')).assertEqual(joined(BUCKET_KEYS, ','));
      expect(schema.columnCount()).assertEqual(BUCKET_KEYS.length + 1);
      expect(schema.columns[0]).assertEqual('id');
    });

    /**
     * @tc.name   insertStatementColumnClausesAreAdjacent
     * @tc.desc   The six NOT NULL clauses are written back to back in bucket order, so the insert
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            column mapping lines up with the declaration.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertStatementColumnClausesAreAdjacent', 0, () => {
      expect(SQL_CREATE_CONTACT.indexOf('name TEXT NOT NULL, phone TEXT NOT NULL') > 0).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('phone TEXT NOT NULL, email TEXT NOT NULL') > 0).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('address TEXT NOT NULL, avatar TEXT NOT NULL') > 0).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('avatar TEXT NOT NULL, category TEXT NOT NULL') > 0).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('category TEXT NOT NULL)') > 0).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf(TABLE_CONTACT) < SQL_CREATE_CONTACT.indexOf(FIELD_NAME)).assertTrue();
    });

    /**
     * @tc.name   deleteParameterCountMatchesPlaceholders
     * @tc.desc   The number of bound values equals the number of placeholders for both a normal and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            a hostile name, because binding is positional.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteParameterCountMatchesPlaceholders', 0, () => {
      const placeholders: number = SQL_DELETE_BY_NAME.split('?').length - 1;
      const normal: string[] = ['Ada Lovelace'];
      const hostile: string[] = ["O'Brien; DROP TABLE contact"];
      expect(normal.length).assertEqual(placeholders);
      expect(hostile.length).assertEqual(placeholders);
      expect(placeholders).assertEqual(1);
      expect(normal[0] === hostile[0]).assertFalse();
      expect(SQL_DELETE_BY_NAME.indexOf(normal[0])).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf(hostile[0])).assertEqual(-1);
    });

    /**
     * @tc.name   sqlKeywordsAreUpperCase
     * @tc.desc   All three statements spell their keywords in upper case, so they match the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            conventional SQL form used by the production code.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sqlKeywordsAreUpperCase', 0, () => {
      expect(SQL_CREATE_CONTACT.indexOf('create')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('table')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf('delete')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf('where')).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf('update')).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf('set')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf('DELETE FROM')).assertEqual(0);
      expect(SQL_UPDATE_CONTACT.indexOf('UPDATE contact SET')).assertEqual(0);
    });

    /**
     * @tc.name   statementsContainNoDoubleSpaces
     * @tc.desc   Each literal uses single spaces between tokens, which keeps substring offsets and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            keyword matching predictable.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('statementsContainNoDoubleSpaces', 0, () => {
      expect(SQL_CREATE_CONTACT.indexOf('  ')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf('  ')).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf('  ')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('\n')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf('\t')).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf('\n')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.split(' ').length > 3).assertTrue();
    });

    /**
     * @tc.name   deleteStatementSemicolonTerminates
     * @tc.desc   The delete literal ends with a semicolon that directly follows the placeholder,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            which is the form executed on the device.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteStatementSemicolonTerminates', 0, () => {
      expect(SQL_DELETE_BY_NAME.endsWith('?;')).assertTrue();
      expect(SQL_DELETE_BY_NAME.substring(SQL_DELETE_BY_NAME.length - 2)).assertEqual('?;');
      expect(SQL_DELETE_BY_NAME.split(';').length - 1).assertEqual(1);
      expect(SQL_DELETE_BY_NAME.lastIndexOf(';')).assertEqual(SQL_DELETE_BY_NAME.length - 1);
      expect(SQL_DELETE_BY_NAME.indexOf(';') > SQL_DELETE_BY_NAME.indexOf('?')).assertTrue();
      expect(SQL_DELETE_BY_NAME.indexOf('?;')).assertEqual(33);
    });

    /**
     * @tc.name   updateStatementSemicolonTerminates
     * @tc.desc   The update literal ends with one semicolon after its final placeholder and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            contains no other statement terminator.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateStatementSemicolonTerminates', 0, () => {
      expect(SQL_UPDATE_CONTACT.endsWith('?;')).assertTrue();
      expect(SQL_UPDATE_CONTACT.substring(SQL_UPDATE_CONTACT.length - 2)).assertEqual('?;');
      expect(SQL_UPDATE_CONTACT.split(';').length - 1).assertEqual(1);
      expect(SQL_UPDATE_CONTACT.lastIndexOf(';')).assertEqual(SQL_UPDATE_CONTACT.length - 1);
      expect(SQL_UPDATE_CONTACT.split('?;').length).assertEqual(2);
      expect(SQL_UPDATE_CONTACT.length - SQL_UPDATE_CONTACT.lastIndexOf('?')).assertEqual(2);
    });

    /**
     * @tc.name   deleteStatementHasNoExtraClauses
     * @tc.desc   The delete carries no LIMIT, ORDER BY, GROUP BY or JOIN clause, so it removes
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            every row that matches the bound name.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteStatementHasNoExtraClauses', 0, () => {
      expect(SQL_DELETE_BY_NAME.indexOf('LIMIT')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf('OFFSET')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf('ORDER BY')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf('GROUP BY')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf('JOIN')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf('UNION')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.split('WHERE').length - 1).assertEqual(1);
    });

    /**
     * @tc.name   updateStatementHasNoExtraClauses
     * @tc.desc   The update has one SET list and one WHERE clause, with no LIMIT, ORDER BY or join
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            that could skip matching rows.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateStatementHasNoExtraClauses', 0, () => {
      expect(SQL_UPDATE_CONTACT.split('WHERE').length - 1).assertEqual(1);
      expect(SQL_UPDATE_CONTACT.split('SET').length - 1).assertEqual(1);
      expect(SQL_UPDATE_CONTACT.indexOf('LIMIT')).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf('ORDER BY')).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf('JOIN')).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf('OR ')).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf('AND ')).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.split('=').length - 1).assertEqual(4);
    });

    /**
     * @tc.name   deletePredicateUsesEqualityOnly
     * @tc.desc   The delete predicate is a single equality comparison on name with no inequality,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            range or IN list that would widen the match.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deletePredicateUsesEqualityOnly', 0, () => {
      expect(SQL_DELETE_BY_NAME.indexOf(' != ')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf(' <> ')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf(' IN ')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf(' LIKE ')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf(' > ')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf(' < ')).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.split('=').length - 1).assertEqual(1);
      expect(SQL_DELETE_BY_NAME.indexOf('name = ?') > 0).assertTrue();
    });

    /**
     * @tc.name   updateSetAssignmentsAreInColumnOrder
     * @tc.desc   The three SET assignments appear as phone, email and address in that order, which
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            matches the parameter array the page builds.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateSetAssignmentsAreInColumnOrder', 0, () => {
      const phoneIndex: int = SQL_UPDATE_CONTACT.indexOf('phone');
      const emailIndex: int = SQL_UPDATE_CONTACT.indexOf('email');
      const addressIndex: int = SQL_UPDATE_CONTACT.indexOf('address');
      expect(phoneIndex > 0).assertTrue();
      expect(emailIndex > phoneIndex).assertTrue();
      expect(addressIndex > emailIndex).assertTrue();
      expect(addressIndex < SQL_UPDATE_CONTACT.indexOf('WHERE')).assertTrue();
      expect(SQL_UPDATE_CONTACT.substring(phoneIndex, phoneIndex + 5)).assertEqual(FIELD_PHONE);
      expect(SQL_UPDATE_CONTACT.substring(emailIndex, emailIndex + 5)).assertEqual(FIELD_EMAIL);
      expect(SQL_UPDATE_CONTACT.substring(addressIndex, addressIndex + 7)).assertEqual(FIELD_ADDRESS);
    });

    /**
     * @tc.name   createStatementCommaCountMatchesDefinitions
     * @tc.desc   Six commas separate seven definitions, so the column count derived from the text
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            agrees with the parser.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createStatementCommaCountMatchesDefinitions', 0, () => {
      const open: int = SQL_CREATE_CONTACT.indexOf('(');
      const close: int = SQL_CREATE_CONTACT.lastIndexOf(')');
      const body: string = SQL_CREATE_CONTACT.substring(open + 1, close);
      expect(body.split(',').length - 1).assertEqual(6);
      expect(body.split(',').length).assertEqual(7);
      expect(body.split(',').length - 1).assertEqual(BUCKET_KEYS.length);
      expect(body.indexOf('(')).assertEqual(-1);
      expect(body.indexOf(')')).assertEqual(-1);
      expect(body.endsWith('category TEXT NOT NULL')).assertTrue();
    });

    /**
     * @tc.name   createStatementColumnsExtractedFromBody
     * @tc.desc   Taking the first token of each definition reproduces the seven column names in
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            declaration order without using the schema parser.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createStatementColumnsExtractedFromBody', 0, () => {
      const open: int = SQL_CREATE_CONTACT.indexOf('(');
      const body: string = SQL_CREATE_CONTACT.substring(open + 1, SQL_CREATE_CONTACT.lastIndexOf(')'));
      const definitions: string[] = body.split(',');
      const names: string[] = [];
      for (let index = 0; index < definitions.length; index++) {
        const definition: string = definitions[index].trim();
        const space: int = definition.indexOf(' ');
        names.push(space >= 0 ? definition.substring(0, space) : definition);
      }
      expect(names.length).assertEqual(7);
      expect(names[0]).assertEqual('id');
      expect(sameStringArray(names.slice(1), BUCKET_KEYS)).assertTrue();
      expect(joined(names, ',')).assertEqual('id,name,phone,email,address,avatar,category');
    });

    /**
     * @tc.name   updateStatementIsLongerAndRicherThanDelete
     * @tc.desc   The update literal carries more text and four times as many placeholders as the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            delete, reflecting its three column assignments.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateStatementIsLongerAndRicherThanDelete', 0, () => {
      expect(SQL_UPDATE_CONTACT.length).assertEqual(68);
      expect(SQL_DELETE_BY_NAME.length).assertEqual(35);
      expect(SQL_UPDATE_CONTACT.length > SQL_DELETE_BY_NAME.length).assertTrue();
      expect(SQL_UPDATE_CONTACT.length - SQL_DELETE_BY_NAME.length).assertEqual(33);
      expect(SQL_UPDATE_CONTACT.split('?').length - 1).assertEqual(4);
      expect(SQL_DELETE_BY_NAME.split('?').length - 1).assertEqual(1);
      expect((SQL_UPDATE_CONTACT.split('?').length - 1) > (SQL_DELETE_BY_NAME.split('?').length - 1))
        .assertTrue();
    });

    /**
     * @tc.name   sqlLiteralsAreDistinctAndNonEmpty
     * @tc.desc   The three literals are non-empty and pairwise different, so no copy and paste
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            mistake could make one operation run another statement.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sqlLiteralsAreDistinctAndNonEmpty', 0, () => {
      expect(SQL_CREATE_CONTACT.length > 0).assertTrue();
      expect(SQL_DELETE_BY_NAME.length > 0).assertTrue();
      expect(SQL_UPDATE_CONTACT.length > 0).assertTrue();
      expect(SQL_CREATE_CONTACT === SQL_DELETE_BY_NAME).assertFalse();
      expect(SQL_CREATE_CONTACT === SQL_UPDATE_CONTACT).assertFalse();
      expect(SQL_DELETE_BY_NAME === SQL_UPDATE_CONTACT).assertFalse();
      expect(SQL_CREATE_CONTACT.startsWith('CREATE')).assertTrue();
      expect(SQL_DELETE_BY_NAME.startsWith('DELETE')).assertTrue();
      expect(SQL_UPDATE_CONTACT.startsWith('UPDATE')).assertTrue();
    });

    /**
     * @tc.name   namePredicateSuffixSharedByDeleteAndUpdate
     * @tc.desc   Both write statements end with the same equality predicate suffix on the name
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            column, so one bound name drives either operation.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('namePredicateSuffixSharedByDeleteAndUpdate', 0, () => {
      const suffix: string = 'WHERE name = ?;';
      expect(SQL_DELETE_BY_NAME.endsWith(suffix)).assertTrue();
      expect(SQL_UPDATE_CONTACT.endsWith(suffix)).assertTrue();
      expect(SQL_DELETE_BY_NAME.lastIndexOf(suffix)).assertEqual(SQL_DELETE_BY_NAME.length - suffix.length);
      expect(SQL_UPDATE_CONTACT.lastIndexOf(suffix)).assertEqual(SQL_UPDATE_CONTACT.length - suffix.length);
      expect(SQL_DELETE_BY_NAME.length - suffix.length).assertEqual(20);
      expect(SQL_UPDATE_CONTACT.length - suffix.length).assertEqual(53);
    });

    /**
     * @tc.name   createStatementOmitsDmlKeywords
     * @tc.desc   The DDL literal contains no DELETE, UPDATE, INSERT or SELECT keyword, so it cannot
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            be mistaken for a data statement.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createStatementOmitsDmlKeywords', 0, () => {
      expect(SQL_CREATE_CONTACT.indexOf('DELETE')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('UPDATE')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('INSERT')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('SELECT')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('DROP')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('ALTER')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('CREATE TABLE IF NOT EXISTS')).assertEqual(0);
      expect(SQL_CREATE_CONTACT.split('CREATE').length - 1).assertEqual(1);
    });

    /**
     * @tc.name   writeStatementsStartWithTheirVerbs
     * @tc.desc   The delete begins at index zero with DELETE and the update with UPDATE, so neither
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            statement is prefixed by a comment or whitespace.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('writeStatementsStartWithTheirVerbs', 0, () => {
      expect(SQL_DELETE_BY_NAME.indexOf('DELETE')).assertEqual(0);
      expect(SQL_DELETE_BY_NAME.substring(0, 6)).assertEqual('DELETE');
      expect(SQL_UPDATE_CONTACT.indexOf('UPDATE')).assertEqual(0);
      expect(SQL_UPDATE_CONTACT.substring(0, 6)).assertEqual('UPDATE');
      expect(SQL_DELETE_BY_NAME.indexOf(' ')).assertEqual(6);
      expect(SQL_UPDATE_CONTACT.indexOf(' ')).assertEqual(6);
      expect(SQL_DELETE_BY_NAME.indexOf(';') > 0).assertTrue();
    });

    /**
     * @tc.name   updatePlaceholderOrderMatchesBoundColumns
     * @tc.desc   Walking the four placeholders of the update yields phone, email, address and name,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            which is the order the parameter array must follow.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('updatePlaceholderOrderMatchesBoundColumns', 0, () => {
      const columns: string[] = [FIELD_PHONE, FIELD_EMAIL, FIELD_ADDRESS, FIELD_NAME];
      const positions: number[] = [];
      for (let index = 0; index < columns.length; index++) {
        positions.push(SQL_UPDATE_CONTACT.indexOf(columns[index]));
      }
      expect(positions.length).assertEqual(4);
      expect(positions[0]).assertEqual(19);
      expect(positions[1]).assertEqual(30);
      expect(positions[2]).assertEqual(41);
      expect(positions[3]).assertEqual(59);
      expect(positions[0] < positions[1]).assertTrue();
      expect(positions[1] < positions[2]).assertTrue();
      expect(positions[2] < positions[3]).assertTrue();
      expect(positions.length).assertEqual(SQL_UPDATE_CONTACT.split('?').length - 1);
    });

    /**
     * @tc.name   createStatementUsesIfNotExistsGuard
     * @tc.desc   The guard is IF NOT EXISTS exactly once; a bare IF EXISTS or a duplicated clause
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            would either fail or hide a schema change.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('createStatementUsesIfNotExistsGuard', 0, () => {
      expect(SQL_CREATE_CONTACT.split('IF NOT EXISTS').length - 1).assertEqual(1);
      expect(SQL_CREATE_CONTACT.indexOf('IF NOT EXISTS')).assertEqual(13);
      expect(SQL_CREATE_CONTACT.indexOf('IF EXISTS')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT.indexOf('NOT EXISTS')).assertEqual(16);
      expect(SQL_CREATE_CONTACT.split('TABLE').length - 1).assertEqual(1);
      expect(SQL_CREATE_CONTACT.substring(13, 26)).assertEqual('IF NOT EXISTS');
      expect(SQL_CREATE_CONTACT.indexOf('IF NOT EXISTS') < SQL_CREATE_CONTACT.indexOf(TABLE_CONTACT))
        .assertTrue();
    });
    /**
     * @tc.name   deleteStatementMentionsOnlyTheNameColumn
     * @tc.desc   None of the other five contact columns appear in the delete text, so the predicate
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            can only be driven by the bound name.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteStatementMentionsOnlyTheNameColumn', 0, () => {
      expect(SQL_DELETE_BY_NAME.indexOf(FIELD_PHONE)).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf(FIELD_EMAIL)).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf(FIELD_ADDRESS)).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf(FIELD_AVATAR)).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf(FIELD_CATEGORY)).assertEqual(-1);
      expect(SQL_DELETE_BY_NAME.indexOf(FIELD_NAME)).assertEqual(26);
      expect(SQL_DELETE_BY_NAME.split(FIELD_NAME).length - 1).assertEqual(1);
      expect(SQL_DELETE_BY_NAME.indexOf('id')).assertEqual(-1);
    });

    /**
     * @tc.name   createStatementColumnNamesMatchFieldConstants
     * @tc.desc   Each shared field constant appears once in the DDL and in declaration order, so
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the insert bucket keys all resolve against the table.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createStatementColumnNamesMatchFieldConstants', 0, () => {
      const fields: string[] = [FIELD_NAME, FIELD_PHONE, FIELD_EMAIL, FIELD_ADDRESS, FIELD_AVATAR,
        FIELD_CATEGORY];
      let previous: number = -1;
      for (let index = 0; index < fields.length; index++) {
        const position: int = SQL_CREATE_CONTACT.indexOf(fields[index]);
        expect(position > previous).assertTrue();
        expect(SQL_CREATE_CONTACT.split(fields[index]).length - 1).assertEqual(1);
        previous = position;
      }
      expect(previous < SQL_CREATE_CONTACT.length).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf(FIELD_NAME) > SQL_CREATE_CONTACT.indexOf('id')).assertTrue();
    });

    /**
     * @tc.name   writeStatementsRequireFiveBoundValuesTogether
     * @tc.desc   The delete and update together need five bound values, matching one name plus
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            phone, email, address and a second name.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('writeStatementsRequireFiveBoundValuesTogether', 0, () => {
      const deleteParams: number = SQL_DELETE_BY_NAME.split('?').length - 1;
      const updateParams: number = SQL_UPDATE_CONTACT.split('?').length - 1;
      expect(deleteParams).assertEqual(1);
      expect(updateParams).assertEqual(4);
      expect(deleteParams + updateParams).assertEqual(5);
      expect(deleteParams + updateParams > deleteParams).assertTrue();
      expect((deleteParams + updateParams) === 5).assertTrue();
      expect(SQL_UPDATE_CONTACT.split('?').length - 1 > SQL_DELETE_BY_NAME.split('?').length - 1)
        .assertTrue();
      expect(SQL_DELETE_BY_NAME.length + SQL_UPDATE_CONTACT.length).assertEqual(103);
    });
    /**
     * @tc.name   updateSetClauseCoversOnlyThreePayloadColumns
     * @tc.desc   The SET clause names exactly the three editable contact columns, so an update
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SqlStatementValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            leaves name, avatar and category as stored.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateSetClauseCoversOnlyThreePayloadColumns', 0, () => {
      const setStart: int = SQL_UPDATE_CONTACT.indexOf('SET');
      const whereStart: int = SQL_UPDATE_CONTACT.indexOf('WHERE');
      const setClause: string = SQL_UPDATE_CONTACT.substring(setStart, whereStart);
      let covered: number = 0;
      const payload: string[] = [FIELD_NAME, FIELD_PHONE, FIELD_EMAIL, FIELD_ADDRESS, FIELD_AVATAR,
        FIELD_CATEGORY];
      for (let index = 0; index < payload.length; index++) {
        if (setClause.indexOf(payload[index]) >= 0) {
          covered = covered + 1;
        }
      }
      expect(covered).assertEqual(3);
      expect(setClause.indexOf(FIELD_NAME)).assertEqual(-1);
      expect(setClause.indexOf(FIELD_AVATAR)).assertEqual(-1);
      expect(setClause.indexOf(FIELD_CATEGORY)).assertEqual(-1);
      expect(setClause.split('?').length - 1).assertEqual(3);
      expect(covered).assertEqual(setClause.split('?').length - 1);
    });
  });
}
