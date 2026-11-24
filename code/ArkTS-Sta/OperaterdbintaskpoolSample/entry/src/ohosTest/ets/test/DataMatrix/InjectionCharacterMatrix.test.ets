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
 * DataMatrix / InjectionCharacterMatrix suite.
 *
 * The write statements bind every user value as a parameter, so a quote or a
 * semicolon in a name is data, not SQL. The suite proves that the meta detector
 * flags the dangerous characters, the binding helpers carry them unchanged, and
 * the store never splits one hostile name into two rows.
 *
 * Source anchors:
 *   DatabaseConnection.ets:235      DELETE with a bound name
 *   DatabaseConnection.ets:269-270  UPDATE with four bound values
 *   DatabaseConnection.ets:161-168  bucket values are plain strings
 *   SharedDriver.ets:998-1029       hasSqlMeta, hasControlCharacters, isSafeDbName
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  SQL_DELETE_CONTACT,
  SQL_UPDATE_CONTACT,
  SQL_QUERY_CONTACT,
  createSeedContacts,
  contactOf,
  contactNames,
  joined,
  countOf,
  hasSqlMeta,
  hasControlCharacters,
  isSafeDbName,
  isDigitsOnly,
  hasEmailShape,
  deleteBindings,
  updateBindings,
  ContactValidation,
  ContactMapper,
  SearchEngine,
  StoreDouble,
  resetContactManager
} from '../Shared/SharedDriver';

export default function injectionCharacterMatrixTest(): void {
  describe('InjectionCharacterMatrix', () => {
    beforeAll(() => {
      logSuite('InjectionCharacterMatrix', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('InjectionCharacterMatrix', 'end');
    });

    /**
     * @tc.name   singleQuoteIsMeta
     * @tc.desc   An apostrophe anywhere in the text is reported as SQL meta.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('singleQuoteIsMeta', 0, () => {
      expect(hasSqlMeta("O'Brien")).assertTrue();
      expect(hasSqlMeta("'")).assertTrue();
      expect(hasSqlMeta("name' OR '1'='1")).assertTrue();
      expect(hasSqlMeta('plain')).assertFalse();
      logStep('injectionCharacterMatrixTest', 'single quote is meta');
    });

    /**
     * @tc.name   semicolonIsMeta
     * @tc.desc   A statement separator is reported as SQL meta.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('semicolonIsMeta', 0, () => {
      expect(hasSqlMeta('value;')).assertTrue();
      expect(hasSqlMeta('; DELETE FROM contact')).assertTrue();
      expect(hasSqlMeta('a;b;c')).assertTrue();
      expect(hasSqlMeta('a,b,c')).assertFalse();
      logStep('injectionCharacterMatrixTest', 'semicolon is meta');
    });

    /**
     * @tc.name   lineCommentIsMeta
     * @tc.desc   A double dash comment introducer is reported as SQL meta.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('lineCommentIsMeta', 0, () => {
      expect(hasSqlMeta('name -- comment')).assertTrue();
      expect(hasSqlMeta('--')).assertTrue();
      expect(hasSqlMeta('name - comment')).assertFalse();
      expect(hasSqlMeta('name-')).assertFalse();
      logStep('injectionCharacterMatrixTest', 'line comment is meta');
    });

    /**
     * @tc.name   blockCommentIsMeta
     * @tc.desc   A slash star sequence is reported as SQL meta.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('blockCommentIsMeta', 0, () => {
      expect(hasSqlMeta('value /* hidden */')).assertTrue();
      expect(hasSqlMeta('/*')).assertTrue();
      expect(hasSqlMeta('value / star')).assertFalse();
      expect(hasSqlMeta('value*')).assertFalse();
      logStep('injectionCharacterMatrixTest', 'block comment is meta');
    });

    /**
     * @tc.name   keywordsWithoutMetaArePlain
     * @tc.desc   A keyword string with no meta character is not flagged, because binding still protects it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('keywordsWithoutMetaArePlain', 0, () => {
      expect(hasSqlMeta('DROP TABLE contact')).assertFalse();
      expect(hasSqlMeta('UNION SELECT')).assertFalse();
      expect(hasSqlMeta('OR 1=1')).assertFalse();
      expect(SQL_QUERY_CONTACT.indexOf('UNION')).assertEqual(-1);
      logStep('injectionCharacterMatrixTest', 'keywords alone are not meta');
    });

    /**
     * @tc.name   deleteBindingKeepsQuote
     * @tc.desc   The hostile name reaches the delete binding unchanged and in the only slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteBindingKeepsQuote', 0, () => {
      const row = contactOf("O'Brien", '13800138050', 'obrien@example.com', '上海市黄浦区', '', CATEGORY_A);
      const bindings = deleteBindings(row);
      expect(bindings.length).assertEqual(1);
      expect(bindings[0]).assertEqual("O'Brien");
      expect(bindings[0].indexOf("'") >= 0).assertTrue();
      expect(SQL_DELETE_CONTACT.split('?').length - 1).assertEqual(bindings.length);
      logStep('injectionCharacterMatrixTest', 'delete binding keeps the quote');
    });

    /**
     * @tc.name   updateBindingKeepsSemicolon
     * @tc.desc   A semicolon in the address reaches the third update binding unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateBindingKeepsSemicolon', 0, () => {
      const row = contactOf('莫川', '13100000031', 'mochuan@example.com', '上海市; DELETE FROM contact', '', CATEGORY_A);
      const bindings = updateBindings(row);
      expect(bindings.length).assertEqual(4);
      expect(bindings[2]).assertEqual('上海市; DELETE FROM contact');
      expect(bindings[2].indexOf(';') >= 0).assertTrue();
      expect(SQL_UPDATE_CONTACT.split('?').length - 1).assertEqual(bindings.length);
      logStep('injectionCharacterMatrixTest', 'update binding keeps the semicolon');
    });

    /**
     * @tc.name   hostileNameRoundTripsBucket
     * @tc.desc   A quote in the name survives the bucket round trip byte for byte.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostileNameRoundTripsBucket', 0, () => {
      const name = "name'--";
      const row = contactOf(name, '13800138051', 'hostile@example.com', '上海市静安区', '', CATEGORY_A);
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(row));
      expect(restored.name).assertEqual(name);
      expect(restored.name.length).assertEqual(7);
      expect(hasSqlMeta(restored.name)).assertTrue();
      logStep('injectionCharacterMatrixTest', 'hostile name round trips');
    });

    /**
     * @tc.name   hostileNameStillValidates
     * @tc.desc   Validation is shape based, so a quote in the name is not an error by itself.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostileNameStillValidates', 0, () => {
      const row = contactOf("a'b", '13800138052', 'hostile.valid@example.com', '上海市静安区', '', CATEGORY_A);
      const errors = ContactValidation.validate(row);
      expect(errors.length).assertEqual(0);
      expect(ContactValidation.canSubmit(row)).assertTrue();
      expect(row.name.length).assertEqual(3);
      logStep('injectionCharacterMatrixTest', 'hostile name still validates');
    });

    /**
     * @tc.name   hostileNameStoreDelete
     * @tc.desc   The store removes only the hostile row and leaves its neighbour.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostileNameStoreDelete', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.insert(true, contactOf("O'Brien", '13800138053', 'obrien2@example.com', '上海市黄浦区', '', CATEGORY_A),
        'ON_CONFLICT_REPLACE');
      store.insert(true, contactOf('贝拉', '11111110001', 'bella.neighbour@example.com', '湖北省武汉市江岸区', '', CATEGORY_B),
        'ON_CONFLICT_REPLACE');
      expect(store.deleteByName("O'Brien")).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
      expect(store.names()[0]).assertEqual('贝拉');
      expect(countOf(store.names(), "O'Brien")).assertEqual(0);
      logStep('injectionCharacterMatrixTest', 'hostile name deletes only its row');
    });

    /**
     * @tc.name   hostileNameSearchIsLiteral
     * @tc.desc   A search for the quote finds the hostile row and nothing else.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostileNameSearchIsLiteral', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf("O'Brien", '13800138054', 'obrien3@example.com', '上海市黄浦区', '', CATEGORY_A));
      const hits = SearchEngine.filterByName(rows, "'");
      expect(hits.length).assertEqual(1);
      expect(hits[0].name).assertEqual("O'Brien");
      expect(SearchEngine.filterByName(rows, "O'").length).assertEqual(1);
      expect(SearchEngine.filterByName(rows, "X'").length).assertEqual(0);
      logStep('injectionCharacterMatrixTest', 'hostile search is literal');
    });

    /**
     * @tc.name   tabIsControlCharacter
     * @tc.desc   A tab is a control character while ordinary punctuation is not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('tabIsControlCharacter', 0, () => {
      expect(hasControlCharacters('a\tb')).assertTrue();
      expect(hasControlCharacters('a b')).assertFalse();
      expect(hasControlCharacters('a-b')).assertFalse();
      expect(hasControlCharacters('a_b')).assertFalse();
      logStep('injectionCharacterMatrixTest', 'tab is a control character');
    });

    /**
     * @tc.name   newlineIsControlCharacter
     * @tc.desc   A newline inside a value is reported as a control character.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('newlineIsControlCharacter', 0, () => {
      expect(hasControlCharacters('line\nbreak')).assertTrue();
      expect(hasControlCharacters('line\rbreak')).assertTrue();
      expect(hasControlCharacters('line break')).assertFalse();
      expect(hasControlCharacters('江苏省')).assertFalse();
      logStep('injectionCharacterMatrixTest', 'newline is a control character');
    });

    /**
     * @tc.name   deleteCharacterIsControl
     * @tc.desc   The DEL code point 127 is reported while the printable tilde is not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteCharacterIsControl', 0, () => {
      expect(hasControlCharacters('abc\u007F')).assertTrue();
      expect(hasControlCharacters('abc~')).assertFalse();
      expect(hasControlCharacters('abc\u001F')).assertTrue();
      expect(hasControlCharacters('abc ')).assertFalse();
      logStep('injectionCharacterMatrixTest', 'DEL is a control character');
    });

    /**
     * @tc.name   safeDbNameAcceptsLowercase
     * @tc.desc   Lowercase letters, digits, dots, underscores and dashes form a safe database name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('safeDbNameAcceptsLowercase', 0, () => {
      expect(isSafeDbName('contact.db')).assertTrue();
      expect(isSafeDbName('contact_db')).assertTrue();
      expect(isSafeDbName('contact-db')).assertTrue();
      expect(isSafeDbName('contact2.db')).assertTrue();
      logStep('injectionCharacterMatrixTest', 'lowercase database names are safe');
    });

    /**
     * @tc.name   safeDbNameRejectsUppercase
     * @tc.desc   Uppercase letters are rejected by the strict file name check.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('safeDbNameRejectsUppercase', 0, () => {
      expect(isSafeDbName('Contact.db')).assertFalse();
      expect(isSafeDbName('CONTACT')).assertFalse();
      expect(isSafeDbName('contact.DB')).assertFalse();
      expect(isSafeDbName('contact.db')).assertTrue();
      logStep('injectionCharacterMatrixTest', 'uppercase database names are rejected');
    });

    /**
     * @tc.name   safeDbNameRejectsSeparators
     * @tc.desc   Slashes and backslashes are rejected so a name cannot escape a directory.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('safeDbNameRejectsSeparators', 0, () => {
      expect(isSafeDbName('../contact.db')).assertFalse();
      expect(isSafeDbName('dir/contact.db')).assertFalse();
      expect(isSafeDbName('dir\\contact.db')).assertFalse();
      expect(isSafeDbName('../x')).assertFalse();
      logStep('injectionCharacterMatrixTest', 'path separators are rejected');
    });

    /**
     * @tc.name   safeDbNameRejectsSpace
     * @tc.desc   A space or a colon in the name is rejected.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('safeDbNameRejectsSpace', 0, () => {
      expect(isSafeDbName('contact db')).assertFalse();
      expect(isSafeDbName('contact:db')).assertFalse();
      expect(isSafeDbName('contact;db')).assertFalse();
      expect(isSafeDbName('contactdb')).assertTrue();
      logStep('injectionCharacterMatrixTest', 'spaces are rejected in database names');
    });

    /**
     * @tc.name   safeDbNameRejectsEmpty
     * @tc.desc   The empty name is unsafe because it addresses nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('safeDbNameRejectsEmpty', 0, () => {
      expect(isSafeDbName('')).assertFalse();
      expect(isSafeDbName(' ')).assertFalse();
      expect(isSafeDbName('a')).assertTrue();
      expect('a'.length > 0).assertTrue();
      logStep('injectionCharacterMatrixTest', 'empty database name is rejected');
    });

    /**
     * @tc.name   metaPhoneFailsDigitCheck
     * @tc.desc   A quote inside the phone fails the digits check and reports one code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metaPhoneFailsDigitCheck', 0, () => {
      const row = contactOf('洛川', "138'0013", 'luochuan@example.com', '河南省郑州市管城区', '', CATEGORY_C);
      expect(isDigitsOnly(row.phone)).assertFalse();
      const errors = ContactValidation.validate(row);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-not-numeric');
      logStep('injectionCharacterMatrixTest', 'meta phone fails the digit check');
    });

    /**
     * @tc.name   metaEmailFailsShape
     * @tc.desc   An email missing its at sign reports email-malformed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metaEmailFailsShape', 0, () => {
      const row = contactOf('洛水', '13620000111', "user'example.com", '河南省洛阳市涧西区', '', CATEGORY_C);
      expect(hasEmailShape(row.email)).assertFalse();
      const errors = ContactValidation.validate(row);
      expect(errors.indexOf('email-malformed') >= 0).assertTrue();
      expect(errors.length).assertEqual(1);
      logStep('injectionCharacterMatrixTest', 'malformed email is reported');
    });

    /**
     * @tc.name   percentIsNotSqlMeta
     * @tc.desc   A percent sign is a LIKE wildcard but not a statement meta character.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('percentIsNotSqlMeta', 0, () => {
      expect(hasSqlMeta('100%')).assertFalse();
      expect(hasSqlMeta('a_b')).assertFalse();
      expect(hasSqlMeta('a%b%c')).assertFalse();
      expect(hasSqlMeta("a'b")).assertTrue();
      logStep('injectionCharacterMatrixTest', 'LIKE wildcards are not statement meta');
    });

    /**
     * @tc.name   statementLiteralsStayConstant
     * @tc.desc   The three statement literals never interpolate user text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('statementLiteralsStayConstant', 0, () => {
      expect(SQL_DELETE_CONTACT.indexOf('contact') > 0).assertTrue();
      expect(SQL_UPDATE_CONTACT.indexOf('contact') > 0).assertTrue();
      expect(SQL_QUERY_CONTACT.indexOf('contact') > 0).assertTrue();
      expect(SQL_DELETE_CONTACT.indexOf('%s')).assertEqual(-1);
      expect(SQL_UPDATE_CONTACT.indexOf('+')).assertEqual(-1);
      logStep('injectionCharacterMatrixTest', 'literals are constant');
    });

    /**
     * @tc.name   newlineNameLengthPreserved
     * @tc.desc   A newline inside the name counts one unit and is not stripped by mapping.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('newlineNameLengthPreserved', 0, () => {
      const name = 'a\nb';
      const row = contactOf(name, '13800138055', 'newline@example.com', '上海市杨浦区', '', CATEGORY_A);
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(row));
      expect(restored.name).assertEqual(name);
      expect(restored.name.length).assertEqual(3);
      expect(hasControlCharacters(restored.name)).assertTrue();
      expect(restored.name.split('\n').length).assertEqual(2);
      logStep('injectionCharacterMatrixTest', 'newline name length is preserved');
    });

    /**
     * @tc.name   hostileCategoryRoundTrips
     * @tc.desc   A category carrying a comment marker survives the bucket unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('hostileCategoryRoundTrips', 0, () => {
      const category = '/*x*/';
      const row = contactOf('阮一', '13300000031', 'ruanyi@example.com', '广西南宁市西乡塘区', '', category);
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(row));
      expect(restored.category).assertEqual(category);
      expect(restored.category.length).assertEqual(5);
      expect(hasSqlMeta(restored.category)).assertTrue();
      logStep('injectionCharacterMatrixTest', 'hostile category round trips');
    });

    /**
     * @tc.name   hostileUpdateRewritesBoundRow
     * @tc.desc   The store rewrites a row whose name has a quote and keeps the name key stable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('hostileUpdateRewritesBoundRow', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.insert(true, contactOf("O'Brien", '13800138056', 'obrien4@example.com', '上海市黄浦区', '', CATEGORY_A),
        'ON_CONFLICT_REPLACE');
      expect(store.updateContact(contactOf("O'Brien", '13800138057', 'obrien5@example.com',
        '上海市卢湾区', '', CATEGORY_A))).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
      expect(store.rows[0].phone).assertEqual('13800138057');
      expect(store.rows[0].name).assertEqual("O'Brien");
      logStep('injectionCharacterMatrixTest', 'hostile row is rewritten by name');
    });

    /**
     * @tc.name   controlCharacterInEveryField
     * @tc.desc   Each of the four validated fields can independently carry a control character.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('controlCharacterInEveryField', 0, () => {
      expect(hasControlCharacters('a\tb')).assertTrue();
      expect(hasControlCharacters('a\nb')).assertTrue();
      expect(hasControlCharacters('江苏省')).assertFalse();
      expect(hasControlCharacters('13333333333')).assertFalse();
      expect(hasControlCharacters('aidelian@example.com')).assertFalse();
      logStep('injectionCharacterMatrixTest', 'control characters are field independent');
    });

    /**
     * @tc.name   hostileNamesDoNotMerge
     * @tc.desc   Two hostile names that differ by a quote stay as two distinct rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('hostileNamesDoNotMerge', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.insert(true, contactOf("a'b", '13800138061', 'ab1@example.com', '上海市黄浦区', '', CATEGORY_A),
        'ON_CONFLICT_REPLACE');
      store.insert(true, contactOf('a b', '13800138062', 'ab2@example.com', '上海市黄浦区', '', CATEGORY_A),
        'ON_CONFLICT_REPLACE');
      expect(store.rowCount()).assertEqual(2);
      expect(store.names()[0]).assertEqual("a'b");
      expect(store.names()[1]).assertEqual('a b');
      expect(store.names()[0] === store.names()[1]).assertFalse();
      logStep('injectionCharacterMatrixTest', 'hostile names stay distinct');
    });

    /**
     * @tc.name   hostileBatchKeepsEveryRow
     * @tc.desc   A batch of three hostile names writes three rows and reports three.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hostileBatchKeepsEveryRow', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const batch = [
        contactOf("x'1", '13800138063', 'x1@example.com', '上海市黄浦区', '', CATEGORY_A),
        contactOf('x--2', '13800138064', 'x2@example.com', '上海市黄浦区', '', CATEGORY_A),
        contactOf('x;3', '13800138065', 'x3@example.com', '上海市黄浦区', '', CATEGORY_A)
      ];
      expect(store.batchInsert(true, batch)).assertEqual(3);
      expect(store.rowCount()).assertEqual(3);
      expect(countOf(store.names(), "x'1")).assertEqual(1);
      expect(hasSqlMeta(store.names()[0])).assertTrue();
      expect(hasSqlMeta(store.names()[1])).assertTrue();
      logStep('injectionCharacterMatrixTest', 'hostile batch keeps every row');
    });

    /**
     * @tc.name   placeholderCountStableForHostileRow
     * @tc.desc   A hostile contact still binds four update and one delete placeholder.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InjectionCharacterMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('placeholderCountStableForHostileRow', 0, () => {
      const row = contactOf("a';--", '13800138066', 'hostile.ph@example.com', '上海市黄浦区', '', CATEGORY_A);
      expect(SQL_UPDATE_CONTACT.split('?').length - 1).assertEqual(4);
      expect(SQL_DELETE_CONTACT.split('?').length - 1).assertEqual(1);
      expect(updateBindings(row).length).assertEqual(4);
      expect(deleteBindings(row).length).assertEqual(1);
      expect(updateBindings(row)[3]).assertEqual("a';--");
      logStep('injectionCharacterMatrixTest', 'placeholder count is stable');
    });
  });
}
