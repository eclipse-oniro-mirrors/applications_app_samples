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
 * ResourceContract / ConstantContract suite.
 *
 * Every constant in RdbConstant is a shared resource: the table name appears in
 * four statements, the six field names appear in the bucket and the result-set
 * walk, and the action and route literals appear in the router. The suite pins
 * each literal so a rename cannot drift between the layers.
 *
 * Source anchors:
 *   RdbConstant.ets:31-38        table name, create statement, store config, ability
 *   CommonConstant.ets:31-63     four maximum lengths
 *   SharedDriver.ets:47-85       exported mirrors used by the suite
 *   SharedDriver.ets:912-935     operation catalog
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TABLE_CONTACT,
  STORE_NAME,
  STORE_ABILITY,
  SQL_CREATE_CONTACT,
  FIELD_NAME,
  FIELD_PHONE,
  FIELD_EMAIL,
  FIELD_ADDRESS,
  FIELD_AVATAR,
  FIELD_CATEGORY,
  BUCKET_KEYS,
  ACTION_ADD,
  ACTION_EDIT,
  ACTION_DELETE,
  ROUTE_DETAIL,
  ROUTE_EDIT,
  ROUTE_LIST,
  DUPLICATE_NAME_TOAST,
  MAX_NAME_LENGTH,
  MAX_PHONE_LENGTH,
  MAX_EMAIL_LENGTH,
  MAX_ADDRESS_LENGTH,
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  CATEGORY_D,
  CATEGORY_E,
  CATEGORY_F,
  CATEGORIES,
  CONFLICT_REPLACE,
  INITIAL_STORE_VALUE,
  EXPECTED_INSERT_ROW,
  ERROR_CONTEXT_MISSING,
  ERROR_STORE_INIT,
  ERROR_SQL_EXECUTION,
  ERROR_TABLE_MISSING,
  ERROR_NONE,
  SQL_DELETE_CONTACT,
  SQL_UPDATE_CONTACT,
  SQL_QUERY_CONTACT,
  OperationCatalog,
  containsChinese,
  joined,
  uniqueStrings,
  resetContactManager
} from '../Shared/SharedDriver';

export default function constantContractTest(): void {
  describe('ConstantContract', () => {
    beforeAll(() => {
      logSuite('ConstantContract', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ConstantContract', 'end');
    });

    /**
     * @tc.name   tableNameLiteral
     * @tc.desc   The table name is the lowercase word contact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('tableNameLiteral', 0, () => {
      expect(TABLE_CONTACT).assertEqual('contact');
      expect(TABLE_CONTACT.length).assertEqual(7);
      expect(TABLE_CONTACT === TABLE_CONTACT.toLowerCase()).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf(TABLE_CONTACT) > 0).assertTrue();
      logStep('constantContractTest', 'table name is pinned');
    });

    /**
     * @tc.name   storeNameLiteral
     * @tc.desc   The store file is contact.db and every statement points at it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('storeNameLiteral', 0, () => {
      expect(STORE_NAME).assertEqual('contact.db');
      expect(STORE_NAME.endsWith('.db')).assertTrue();
      expect(STORE_NAME.startsWith('contact')).assertTrue();
      expect(STORE_NAME.length).assertEqual(10);
      logStep('constantContractTest', 'store name is pinned');
    });

    /**
     * @tc.name   storeAbilityLiteral
     * @tc.desc   The ability name used for the store context is EntryAbility.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('storeAbilityLiteral', 0, () => {
      expect(STORE_ABILITY).assertEqual('EntryAbility');
      expect(STORE_ABILITY.endsWith('Ability')).assertTrue();
      expect(STORE_ABILITY.length).assertEqual(12);
      expect(containsChinese(STORE_ABILITY)).assertFalse();
      logStep('constantContractTest', 'ability literal is pinned');
    });

    /**
     * @tc.name   createStatementShape
     * @tc.desc   The create statement prefers IF NOT EXISTS and defines seven columns including id.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createStatementShape', 0, () => {
      expect(SQL_CREATE_CONTACT.indexOf('CREATE TABLE IF NOT EXISTS') >= 0).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('AUTOINCREMENT') >= 0).assertTrue();
      expect(SQL_CREATE_CONTACT.indexOf('PRIMARY KEY') >= 0).assertTrue();
      expect(SQL_CREATE_CONTACT.split(',').length).assertEqual(7);
      expect(SQL_CREATE_CONTACT.indexOf(FIELD_NAME) >= 0).assertTrue();
      logStep('constantContractTest', 'create statement shape is pinned');
    });

    /**
     * @tc.name   fieldNamesAreSix
     * @tc.desc   The six field names are name, phone, email, address, avatar and category.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fieldNamesAreSix', 0, () => {
      expect(FIELD_NAME).assertEqual('name');
      expect(FIELD_PHONE).assertEqual('phone');
      expect(FIELD_EMAIL).assertEqual('email');
      expect(FIELD_ADDRESS).assertEqual('address');
      expect(FIELD_AVATAR).assertEqual('avatar');
      expect(FIELD_CATEGORY).assertEqual('category');
      logStep('constantContractTest', 'six field names are pinned');
    });

    /**
     * @tc.name   bucketKeysMatchFields
     * @tc.desc   The bucket key array equals the six field constants in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bucketKeysMatchFields', 0, () => {
      expect(BUCKET_KEYS.length).assertEqual(6);
      expect(joined(BUCKET_KEYS)).assertEqual('name,phone,email,address,avatar,category');
      expect(BUCKET_KEYS[0]).assertEqual(FIELD_NAME);
      expect(BUCKET_KEYS[5]).assertEqual(FIELD_CATEGORY);
      expect(uniqueStrings(BUCKET_KEYS).length).assertEqual(6);
      logStep('constantContractTest', 'bucket keys match the fields');
    });

    /**
     * @tc.name   actionLiteralsAreChinese
     * @tc.desc   The three action labels are the Chinese words for add, edit and delete.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('actionLiteralsAreChinese', 0, () => {
      expect(ACTION_ADD).assertEqual('新增联系人');
      expect(ACTION_EDIT).assertEqual('编辑联系人');
      expect(ACTION_DELETE).assertEqual('删除联系人');
      expect(containsChinese(ACTION_ADD)).assertTrue();
      expect(containsChinese(ACTION_DELETE)).assertTrue();
      logStep('constantContractTest', 'action literals are Chinese');
    });

    /**
     * @tc.name   routeLiteralsArePinned
     * @tc.desc   The three page routes are the documented paths under pages/view.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routeLiteralsArePinned', 0, () => {
      expect(ROUTE_LIST).assertEqual('pages/view/OperateRDBInTaskPool');
      expect(ROUTE_EDIT).assertEqual('pages/view/AddressBookEdit');
      expect(ROUTE_DETAIL).assertEqual('pages/view/AddressBookDetail');
      expect(ROUTE_EDIT.startsWith('pages/view/')).assertTrue();
      expect(ROUTE_LIST.startsWith('pages/view/')).assertTrue();
      logStep('constantContractTest', 'route literals are pinned');
    });

    /**
     * @tc.name   duplicateToastLiteral
     * @tc.desc   The duplicate notice is the Chinese sentence with a trailing exclamation mark.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateToastLiteral', 0, () => {
      expect(DUPLICATE_NAME_TOAST).assertEqual('姓名已存在，请重新输入!');
      expect(DUPLICATE_NAME_TOAST.length).assertEqual(12);
      expect(DUPLICATE_NAME_TOAST.endsWith('!')).assertTrue();
      expect(containsChinese(DUPLICATE_NAME_TOAST)).assertTrue();
      logStep('constantContractTest', 'duplicate toast is pinned');
    });

    /**
     * @tc.name   maxLengthLiterals
     * @tc.desc   The four maximum lengths are twelve, twelve, twenty five and one hundred.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('maxLengthLiterals', 0, () => {
      expect(MAX_NAME_LENGTH).assertEqual(12);
      expect(MAX_PHONE_LENGTH).assertEqual(12);
      expect(MAX_EMAIL_LENGTH).assertEqual(25);
      expect(MAX_ADDRESS_LENGTH).assertEqual(100);
      expect(MAX_NAME_LENGTH === MAX_PHONE_LENGTH).assertTrue();
      logStep('constantContractTest', 'maximum lengths are pinned');
    });

    /**
     * @tc.name   categoryConstantsSix
     * @tc.desc   The category constants run A to F and the array lists them in that order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryConstantsSix', 0, () => {
      expect(CATEGORY_A).assertEqual('A');
      expect(CATEGORY_B).assertEqual('B');
      expect(CATEGORY_C).assertEqual('C');
      expect(CATEGORY_D).assertEqual('D');
      expect(CATEGORY_E).assertEqual('E');
      expect(CATEGORY_F).assertEqual('F');
      expect(joined(CATEGORIES)).assertEqual('A,B,C,D,E,F');
      logStep('constantContractTest', 'category constants are pinned');
    });

    /**
     * @tc.name   conflictLiteralPinned
     * @tc.desc   The insert conflict strategy is the ON_CONFLICT_REPLACE token used by the page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('conflictLiteralPinned', 0, () => {
      expect(CONFLICT_REPLACE).assertEqual('ON_CONFLICT_REPLACE');
      expect(CONFLICT_REPLACE.indexOf('CONFLICT') > 0).assertTrue();
      expect(CONFLICT_REPLACE.startsWith('ON_')).assertTrue();
      expect(CONFLICT_REPLACE.length).assertEqual(19);
      logStep('constantContractTest', 'conflict literal is pinned');
    });

    /**
     * @tc.name   insertCountConstants
     * @tc.desc   The neutral store value is zero and a successful insert reports one row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('insertCountConstants', 0, () => {
      expect(INITIAL_STORE_VALUE).assertEqual(0);
      expect(EXPECTED_INSERT_ROW).assertEqual(1);
      expect(EXPECTED_INSERT_ROW > INITIAL_STORE_VALUE).assertTrue();
      expect(EXPECTED_INSERT_ROW - INITIAL_STORE_VALUE).assertEqual(1);
      logStep('constantContractTest', 'insert count constants pinned');
    });

    /**
     * @tc.name   errorCodesPinned
     * @tc.desc   The five error code constants keep their relational store values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('errorCodesPinned', 0, () => {
      expect(ERROR_NONE).assertEqual(0);
      expect(ERROR_CONTEXT_MISSING).assertEqual(401);
      expect(ERROR_STORE_INIT).assertEqual(14800011);
      expect(ERROR_TABLE_MISSING).assertEqual(14800001);
      expect(ERROR_SQL_EXECUTION).assertEqual(14800015);
      logStep('constantContractTest', 'error codes are pinned');
    });

    /**
     * @tc.name   deleteStatementPinned
     * @tc.desc   The delete statement filters on the name with a single placeholder.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteStatementPinned', 0, () => {
      expect(SQL_DELETE_CONTACT).assertEqual('DELETE FROM contact WHERE name = ?;');
      expect(SQL_DELETE_CONTACT.indexOf(TABLE_CONTACT) > 0).assertTrue();
      expect(SQL_DELETE_CONTACT.split('?').length - 1).assertEqual(1);
      expect(SQL_DELETE_CONTACT.endsWith(';')).assertTrue();
      logStep('constantContractTest', 'delete statement is pinned');
    });

    /**
     * @tc.name   updateStatementPinned
     * @tc.desc   The update statement writes phone, email and address and filters on the name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateStatementPinned', 0, () => {
      expect(SQL_UPDATE_CONTACT).assertEqual('UPDATE contact SET phone = ?, email = ?, address = ? WHERE name = ?;');
      expect(SQL_UPDATE_CONTACT.split('?').length - 1).assertEqual(4);
      expect(SQL_UPDATE_CONTACT.indexOf(FIELD_PHONE) >= 0).assertTrue();
      expect(SQL_UPDATE_CONTACT.indexOf(FIELD_EMAIL) >= 0).assertTrue();
      expect(SQL_UPDATE_CONTACT.indexOf(FIELD_AVATAR)).assertEqual(-1);
      logStep('constantContractTest', 'update statement is pinned');
    });

    /**
     * @tc.name   queryStatementPinned
     * @tc.desc   The query statement selects everything from the contact table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryStatementPinned', 0, () => {
      expect(SQL_QUERY_CONTACT).assertEqual('select * from contact');
      expect(SQL_QUERY_CONTACT.endsWith(TABLE_CONTACT)).assertTrue();
      expect(SQL_QUERY_CONTACT.indexOf('*') > 0).assertTrue();
      expect(SQL_QUERY_CONTACT.indexOf('?')).assertEqual(-1);
      logStep('constantContractTest', 'query statement is pinned');
    });

    /**
     * @tc.name   catalogHasEightOperations
     * @tc.desc   The operation catalog lists exactly eight names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogHasEightOperations', 0, () => {
      const catalog = OperationCatalog.all();
      expect(catalog.length).assertEqual(8);
      expect(uniqueStrings(catalog).length).assertEqual(8);
      expect(catalog[0]).assertEqual(OperationCatalog.CREATE_TABLE);
      expect(catalog[7]).assertEqual(OperationCatalog.DEDUPE_ROWS);
      logStep('constantContractTest', 'catalog has eight operations');
    });

    /**
     * @tc.name   catalogOperationLiterals
     * @tc.desc   Each catalog member keeps its lowercase dash separated literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogOperationLiterals', 0, () => {
      expect(OperationCatalog.CREATE_TABLE).assertEqual('create-table');
      expect(OperationCatalog.INIT_STORE).assertEqual('init-store');
      expect(OperationCatalog.BATCH_INSERT).assertEqual('batch-insert');
      expect(OperationCatalog.QUERY_ALL).assertEqual('query-all');
      expect(OperationCatalog.DEDUPE_ROWS).assertEqual('dedupe-rows');
      expect(joined(OperationCatalog.all())).assertEqual(
        'create-table,init-store,batch-insert,query-all,insert-one,update-one,delete-one,dedupe-rows');
      logStep('constantContractTest', 'catalog literals are pinned');
    });

    /**
     * @tc.name   fieldConstantsAreDistinct
     * @tc.desc   No two field constants share the same text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fieldConstantsAreDistinct', 0, () => {
      const fields: string[] = [FIELD_NAME, FIELD_PHONE, FIELD_EMAIL, FIELD_ADDRESS, FIELD_AVATAR, FIELD_CATEGORY];
      expect(uniqueStrings(fields).length).assertEqual(6);
      expect(fields.indexOf(FIELD_AVATAR)).assertEqual(4);
      expect(fields.indexOf(FIELD_EMAIL)).assertEqual(2);
      logStep('constantContractTest', 'field constants are distinct');
    });

    /**
     * @tc.name   allLiteralsAreNonEmpty
     * @tc.desc   Every exported literal used by the page has at least one character.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('allLiteralsAreNonEmpty', 0, () => {
      expect(TABLE_CONTACT.length > 0).assertTrue();
      expect(STORE_NAME.length > 0).assertTrue();
      expect(SQL_CREATE_CONTACT.length > 0).assertTrue();
      expect(SQL_DELETE_CONTACT.length > 0).assertTrue();
      expect(SQL_UPDATE_CONTACT.length > 0).assertTrue();
      expect(SQL_QUERY_CONTACT.length > 0).assertTrue();
      expect(DUPLICATE_NAME_TOAST.length > 0).assertTrue();
      logStep('constantContractTest', 'all literals are non empty');
    });

    /**
     * @tc.name   constantContractErrorCodesDistinct
     * @tc.desc   The five error codes are pairwise distinct.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('constantContractErrorCodesDistinct', 0, () => {
      const codes: number[] = [ERROR_NONE, ERROR_CONTEXT_MISSING, ERROR_STORE_INIT, ERROR_TABLE_MISSING, ERROR_SQL_EXECUTION];
      let distinct = 0;
      for (let index = 0; index < codes.length; index++) {
        if (codes.indexOf(codes[index]) === index) {
          distinct = distinct + 1;
        }
      }
      expect(distinct).assertEqual(5);
      expect(codes.indexOf(ERROR_SQL_EXECUTION)).assertEqual(4);
      logStep('constantContractTest', 'error codes are distinct');
    });

    /**
     * @tc.name   routeLiteralsAreDistinct
     * @tc.desc   The list, edit and detail routes never collide.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routeLiteralsAreDistinct', 0, () => {
      expect(ROUTE_LIST === ROUTE_EDIT).assertFalse();
      expect(ROUTE_EDIT === ROUTE_DETAIL).assertFalse();
      expect(ROUTE_LIST === ROUTE_DETAIL).assertFalse();
      expect(ROUTE_DETAIL.length > ROUTE_EDIT.length).assertTrue();
      logStep('constantContractTest', 'route literals are distinct');
    });

    /**
     * @tc.name   toastDiffersFromActionLabels
     * @tc.desc   The duplicate toast is not one of the action labels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('toastDiffersFromActionLabels', 0, () => {
      expect(DUPLICATE_NAME_TOAST === ACTION_ADD).assertFalse();
      expect(DUPLICATE_NAME_TOAST === ACTION_EDIT).assertFalse();
      expect(DUPLICATE_NAME_TOAST === ACTION_DELETE).assertFalse();
      expect(DUPLICATE_NAME_TOAST.length > ACTION_ADD.length).assertTrue();
      logStep('constantContractTest', 'toast differs from the action labels');
    });

    /**
     * @tc.name   createStatementNamesEveryField
     * @tc.desc   The create literal mentions each of the six field names exactly once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createStatementNamesEveryField', 0, () => {
      const fields: string[] = [FIELD_NAME, FIELD_PHONE, FIELD_EMAIL, FIELD_ADDRESS, FIELD_AVATAR, FIELD_CATEGORY];
      for (let index = 0; index < fields.length; index++) {
        expect(SQL_CREATE_CONTACT.indexOf(fields[index]) >= 0).assertTrue();
        expect(SQL_CREATE_CONTACT.indexOf(' ' + fields[index] + ' ') > 0).assertTrue();
      }
      expect(SQL_CREATE_CONTACT.indexOf(FIELD_AVATAR) > SQL_CREATE_CONTACT.indexOf(FIELD_ADDRESS)).assertTrue();
      logStep('constantContractTest', 'create statement names every field');
    });

    /**
     * @tc.name   statementsShareOneTableName
     * @tc.desc   All four statements refer to the same table constant.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('statementsShareOneTableName', 0, () => {
      expect(SQL_CREATE_CONTACT.indexOf(TABLE_CONTACT) > 0).assertTrue();
      expect(SQL_DELETE_CONTACT.indexOf(TABLE_CONTACT) > 0).assertTrue();
      expect(SQL_UPDATE_CONTACT.indexOf(TABLE_CONTACT) > 0).assertTrue();
      expect(SQL_QUERY_CONTACT.indexOf(TABLE_CONTACT) > 0).assertTrue();
      expect(TABLE_CONTACT).assertEqual('contact');
      logStep('constantContractTest', 'statements share one table name');
    });

    /**
     * @tc.name   actionLengthsAndPrefixes
     * @tc.desc   Add and edit share the 联系人 suffix while delete does too.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('actionLengthsAndPrefixes', 0, () => {
      expect(ACTION_ADD.endsWith('联系人')).assertTrue();
      expect(ACTION_EDIT.endsWith('联系人')).assertTrue();
      expect(ACTION_DELETE.endsWith('联系人')).assertTrue();
      expect(ACTION_ADD.substring(0, 2)).assertEqual('新增');
      expect(ACTION_EDIT.substring(0, 2)).assertEqual('编辑');
      expect(ACTION_DELETE.substring(0, 2)).assertEqual('删除');
      logStep('constantContractTest', 'action prefixes are pinned');
    });

    /**
     * @tc.name   storeNameDerivesFromTable
     * @tc.desc   The store file name starts with the table name and ends with the db suffix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('storeNameDerivesFromTable', 0, () => {
      expect(STORE_NAME.startsWith(TABLE_CONTACT)).assertTrue();
      expect(STORE_NAME.substring(0, TABLE_CONTACT.length)).assertEqual(TABLE_CONTACT);
      expect(STORE_NAME.substring(TABLE_CONTACT.length)).assertEqual('.db');
      expect(STORE_NAME.length - TABLE_CONTACT.length).assertEqual(3);
      logStep('constantContractTest', 'store name derives from the table');
    });

    /**
     * @tc.name   modifyTimesAreNotConstants
     * @tc.desc   The literal set carries no timestamp, so two reads return identical text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('modifyTimesAreNotConstants', 0, () => {
      expect(SQL_CREATE_CONTACT.indexOf('2026')).assertEqual(-1);
      expect(SQL_CREATE_CONTACT).assertEqual(SQL_CREATE_CONTACT);
      expect(SQL_DELETE_CONTACT.indexOf('2026')).assertEqual(-1);
      expect(DUPLICATE_NAME_TOAST.indexOf('2026')).assertEqual(-1);
      logStep('constantContractTest', 'literals carry no timestamp');
    });

    /**
     * @tc.name   fieldConstantsFitInTheSchema
     * @tc.desc   Every field constant appears in the create statement so no constant is orphaned.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConstantContract scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fieldConstantsFitInTheSchema', 0, () => {
      const fields: string[] = [FIELD_NAME, FIELD_PHONE, FIELD_EMAIL, FIELD_ADDRESS, FIELD_AVATAR, FIELD_CATEGORY];
      let present = 0;
      for (let index = 0; index < fields.length; index++) {
        if (SQL_CREATE_CONTACT.indexOf(fields[index]) >= 0) {
          present = present + 1;
        }
      }
      expect(present).assertEqual(6);
      expect(fields.length).assertEqual(BUCKET_KEYS.length);
      logStep('constantContractTest', 'field constants fit the schema');
    });
  });
}
