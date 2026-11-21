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
 * The add path end to end. Anchors:
 *   OperateRDBInTaskPool.ets:90-98   route "新增联系人" to insert then manager add
 *   AddressBookList.ets:85-91       add button opens AddressBookEdit with a new Contact
 *   AddressBookEdit.ets:161-179     name input maxLength 12 and duplicate detection
 *   AddressBookEdit.ets:191-278     phone 12, email 25, address 100 limits
 *   DatabaseConnection.ets:187-221  insert with ON_CONFLICT_REPLACE
 *   DatabaseConnection.ets:277-309  first row skip plus name+phone dedupe
 *   ContactManager.ets:50-53        append without re-sorting
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  ACTION_ADD,
  ROUTE_EDIT,
  MAX_NAME_LENGTH,
  MAX_PHONE_LENGTH,
  MAX_EMAIL_LENGTH,
  MAX_ADDRESS_LENGTH,
  DUPLICATE_NAME_TOAST,
  CONFLICT_REPLACE,
  FIELD_NAME,
  FIELD_PHONE,
  FIELD_EMAIL,
  FIELD_ADDRESS,
  FIELD_AVATAR,
  FIELD_CATEGORY,
  BUCKET_KEYS,
  Bucket,
  ContactValidation,
  ContactMapper,
  StoreDouble,
  CursorResultSet,
  readContactsFromResultSet,
  expectedVisibleRows,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  joined,
  sameStringArray,
  countOf,
  textFingerprint,
  isDigitsOnly,
  hasEmailShape,
  resetContactManager,
  expectedAfterAdd,
  RouteIntent,
  SearchEngine,
  ContactMetrics,
  snapshotsOf,
  sameSnapshotArray,
  TaskPoolQueue,
  OperationCatalog,
  fallbackForOperation,
  ERROR_SQL_EXECUTION,
  expectedVisibleCount
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

function repeatText(unit: string, times: number): string {
  let text = '';
  for (let index = 0; index < times; index++) {
    text = text + unit;
  }
  return text;
}

export default function addContactEndToEndTest(): void {
  describe('AddContactEndToEnd', () => {
    const store: StoreDouble = new StoreDouble();

    beforeAll(() => {
      logSuite('AddContactEndToEnd', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      store.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('AddContactEndToEnd', 'end');
    });

    /**
     * @tc.name   addRouteTargetsEditPageWithEmptyDraft
     * @tc.desc   The add button intent resolves to AddressBookEdit and carries a blank Contact draft.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addRouteTargetsEditPageWithEmptyDraft', 0, () => {
      const intent = new RouteIntent(ACTION_ADD, new Contact());
      const params = intent.toParams();
      logStep('addRouteTargetsEditPageWithEmptyDraft', intent.url());
      expect(intent.url()).assertEqual(ROUTE_EDIT);
      expect(RouteIntent.isKnownAction(ACTION_ADD)).assertTrue();
      expect(params.text).assertEqual(ACTION_ADD);
      expect(params.data !== undefined).assertTrue();
      expect((params.data as Contact).name).assertEqual('');
      expect(intent.describe().indexOf(ROUTE_EDIT) > 0).assertTrue();
    });

    /**
     * @tc.name   addDraftCarriesTypedFieldsIntoContact
     * @tc.desc   Each edit-form onChange assignment lands on the draft Contact passed to the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addDraftCarriesTypedFieldsIntoContact', 0, () => {
      const draft = new Contact();
      draft.name = '沈青禾';
      draft.phone = '13900001111';
      draft.email = 'shenqinghe@example.com';
      draft.address = '浙江省杭州市西湖区';
      draft.category = 'A';
      expect(draft.name).assertEqual('沈青禾');
      expect(draft.phone.length).assertEqual(11);
      expect(isDigitsOnly(draft.phone)).assertTrue();
      expect(draft.email.indexOf('@') > 0).assertTrue();
      expect(draft.address.startsWith('浙江')).assertTrue();
      expect(draft.avatar).assertEqual('');
    });

    /**
     * @tc.name   addBucketMirrorsTheSixDraftFields
     * @tc.desc   ContactMapper emits exactly the six production columns in declaration order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addBucketMirrorsTheSixDraftFields', 0, () => {
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区', '', 'A');
      const bucket = ContactMapper.toBucket(draft);
      expect(bucket.size()).assertEqual(6);
      expect(bucket.has(FIELD_NAME)).assertTrue();
      expect(bucket.has(FIELD_CATEGORY)).assertTrue();
      expect(joined(bucket.keys, ',')).assertEqual(joined(BUCKET_KEYS, ','));
      expect(bucket.get(FIELD_PHONE)).assertEqual('13900001111');
      expect(bucket.get(FIELD_AVATAR)).assertEqual('');
      expect(bucket.keyAt(0)).assertEqual(FIELD_NAME);
    });

    /**
     * @tc.name   addCompleteDraftPassesValidation
     * @tc.desc   A draft with name, numeric phone, shaped email and address yields no error codes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addCompleteDraftPassesValidation', 0, () => {
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      const errors = ContactValidation.validate(draft, []);
      expect(errors.length).assertEqual(0);
      expect(ContactValidation.canSubmit(draft, [])).assertTrue();
      expect(ContactValidation.isDuplicateName([], draft.name)).assertFalse();
      expect(MAX_NAME_LENGTH).assertEqual(12);
      expect(draft.name.length <= MAX_NAME_LENGTH).assertTrue();
    });

    /**
     * @tc.name   addBlankDraftReportsFourMissingFields
     * @tc.desc   Submitting the untouched add form reports name, phone, email and address as empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addBlankDraftReportsFourMissingFields', 0, () => {
      const errors = ContactValidation.validate(new Contact(), []);
      expect(errors.length).assertEqual(4);
      expect(errors.indexOf('name-empty') >= 0).assertTrue();
      expect(errors.indexOf('phone-empty') >= 0).assertTrue();
      expect(errors.indexOf('email-empty') >= 0).assertTrue();
      expect(errors.indexOf('address-empty') >= 0).assertTrue();
      expect(ContactValidation.canSubmit(new Contact(), [])).assertFalse();
      expect(errors.indexOf('name-duplicate')).assertEqual(-1);
    });

    /**
     * @tc.name   addNonNumericPhoneIsRejected
     * @tc.desc   The number keyboard contract is validated: letters fail digits-only while a real number passes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addNonNumericPhoneIsRejected', 0, () => {
      const draft = contactOf('沈青禾', '1390000O111', 'shen@example.com', '浙江省杭州市西湖区');
      const errors = ContactValidation.validate(draft, []);
      expect(isDigitsOnly(draft.phone)).assertFalse();
      expect(errors.indexOf('phone-not-numeric') >= 0).assertTrue();
      expect(errors.indexOf('phone-empty')).assertEqual(-1);
      draft.phone = '13900001111';
      expect(isDigitsOnly(draft.phone)).assertTrue();
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
    });

    /**
     * @tc.name   addMalformedEmailIsRejected
     * @tc.desc   The edit form rejects an address without a dotted domain before the insert route fires.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addMalformedEmailIsRejected', 0, () => {
      const draft = contactOf('沈青禾', '13900001111', 'shen.example.com', '浙江省杭州市西湖区');
      const errors = ContactValidation.validate(draft, []);
      expect(errors.indexOf('email-malformed') >= 0).assertTrue();
      expect(errors.indexOf('email-empty')).assertEqual(-1);
      draft.email = 'shen@example.com';
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
      expect(hasEmailShape(draft.email)).assertTrue();
    });

    /**
     * @tc.name   addOverlongNameIsRejectedAtThirteen
     * @tc.desc   The name field stops at twelve characters; the validator still guards the boundary.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addOverlongNameIsRejectedAtThirteen', 0, () => {
      const accepted = repeatText('李', 12);
      const rejected = repeatText('李', 13);
      const base = contactOf(accepted, '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      expect(base.name.length).assertEqual(MAX_NAME_LENGTH);
      expect(ContactValidation.validate(base, []).length).assertEqual(0);
      base.name = rejected;
      const errors = ContactValidation.validate(base, []);
      expect(base.name.length).assertEqual(13);
      expect(errors.indexOf('name-too-long') >= 0).assertTrue();
      expect(errors.length).assertEqual(1);
    });

    /**
     * @tc.name   addOverlongAddressIsRejectedAtHundredOne
     * @tc.desc   The address limit is one hundred characters, matching MAX_LENGTH_VERY_LONG.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addOverlongAddressIsRejectedAtHundredOne', 0, () => {
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', repeatText('区', 100));
      expect(draft.address.length).assertEqual(MAX_ADDRESS_LENGTH);
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
      draft.address = repeatText('区', 101);
      const errors = ContactValidation.validate(draft, []);
      expect(draft.address.length).assertEqual(101);
      expect(errors.indexOf('address-too-long') >= 0).assertTrue();
      expect(errors.length).assertEqual(1);
    });

    /**
     * @tc.name   addDuplicateNameIsRejectedAgainstManagerSeed
     * @tc.desc   The edit page blocks a name already held by the singleton and shows the duplicate toast.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addDuplicateNameIsRejectedAgainstManagerSeed', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const draft = contactOf(seed[4].name, '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      const errors = ContactValidation.validate(draft, manager.getContacts());
      expect(errors.indexOf('name-duplicate') >= 0).assertTrue();
      expect(ContactValidation.canSubmit(draft, manager.getContacts())).assertFalse();
      expect(DUPLICATE_NAME_TOAST).assertEqual('姓名已存在，请重新输入!');
      expect(manager.getContacts().length).assertEqual(15);
    });

    /**
     * @tc.name   addDuplicateNameAllowedAgainAfterSeedReset
     * @tc.desc   Clearing the manager removes the duplicate source, so the same draft becomes submittable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addDuplicateNameAllowedAgainAfterSeedReset', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const draft = contactOf('贝拉', '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      expect(ContactValidation.isDuplicateName(manager.getContacts(), draft.name)).assertTrue();
      manager.setContacts([]);
      expect(ContactValidation.isDuplicateName(manager.getContacts(), draft.name)).assertFalse();
      expect(ContactValidation.validate(draft, manager.getContacts()).length).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(0);
    });

    /**
     * @tc.name   addStoreInsertWritesOneRow
     * @tc.desc   The mapped bucket insert appends exactly one row to the relational store double.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addStoreInsertWritesOneRow', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      store.insert(true, draft, CONFLICT_REPLACE);
      logStep('addStoreInsertWritesOneRow', String(store.rowCount()));
      expect(store.rowCount()).assertEqual(16);
      expect(store.names()[15]).assertEqual('沈青禾');
      expect(sameContact(store.query(true)[15], draft)).assertTrue();
      expect(store.insertCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   addStoreInsertAccountingCountsSingleAttempt
     * @tc.desc   One add action raises insertCalls by one while query and update counters stay put.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addStoreInsertAccountingCountsSingleAttempt', 0, () => {
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      store.insert(true, draft, CONFLICT_REPLACE);
      expect(store.insertCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(1);
      store.query(true);
      expect(store.queryCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(1);
    });

    /**
     * @tc.name   addInsertWithoutContextStillAppendsToManager
     * @tc.desc   When the store cannot initialize the page catch branch is skipped, yet the manager add runs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addInsertWithoutContextStillAppendsToManager', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      const inserted = store.insert(false, draft, CONFLICT_REPLACE);
      if (inserted < 0) {
        manager.addContact(draft);
      }
      expect(inserted).assertEqual(-1);
      expect(store.lastContextValid).assertFalse();
      expect(store.rowCount()).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(16);
      expect(manager.getContacts()[15].name).assertEqual('沈青禾');
    });

    /**
     * @tc.name   addConflictReplaceDoesNotCollapseBucketWithoutId
     * @tc.desc   The bucket omits the primary key, so a repeated insert cannot replace and rows accumulate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addConflictReplaceDoesNotCollapseBucketWithoutId', 0, () => {
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      const bucket = ContactMapper.toBucket(draft);
      expect(bucket.has('id')).assertFalse();
      expect(store.insert(true, draft, CONFLICT_REPLACE)).assertEqual(1);
      expect(store.insert(true, draft, CONFLICT_REPLACE)).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
      expect(countOf(store.names(), '沈青禾')).assertEqual(2);
    });

    /**
     * @tc.name   addManagerAppendPreservesSeedOrder
     * @tc.desc   addContact appends to the existing fifteen rows without grouping or sorting them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addManagerAppendPreservesSeedOrder', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      manager.addContact(draft);
      const actual = manager.getContacts();
      const expected = expectedAfterAdd(seed, draft);
      expect(actual.length).assertEqual(16);
      expect(sameStringArray(contactNames(actual), contactNames(expected))).assertTrue();
      expect(actual[0].name).assertEqual(seed[0].name);
      expect(actual[14].name).assertEqual(seed[14].name);
      expect(actual[15].name).assertEqual(draft.name);
    });

    /**
     * @tc.name   addManagerGetContactsIsDefensiveCopy
     * @tc.desc   The list page receives a fresh array; splicing it does not mutate the singleton store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addManagerGetContactsIsDefensiveCopy', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区'));
      const view = manager.getContacts();
      view.splice(0, 3);
      view.push(new Contact('临时', '10000000000', 'temp@example.com', '临时地址'));
      expect(manager.getContacts().length).assertEqual(16);
      expect(manager.getContacts()[0].name).assertEqual('艾德里安');
      expect(manager.getContacts()[15].name).assertEqual('沈青禾');
      expect(view.length).assertEqual(14);
    });

    /**
     * @tc.name   addListRefreshFindsNewContactByName
     * @tc.desc   After the append, the search box text narrows the refreshed list to the new contact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addListRefreshFindsNewContactByName', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      store.insert(true, draft, CONFLICT_REPLACE);
      manager.addContact(draft);
      const refreshed = SearchEngine.filterByName(manager.getContacts(), '沈');
      expect(refreshed.length).assertEqual(1);
      expect(refreshed[0].name).assertEqual('沈青禾');
      expect(SearchEngine.filterByName(manager.getContacts(), '青禾').length).assertEqual(1);
      expect(SearchEngine.filterByName(manager.getContacts(), '沈青禾').length).assertEqual(1);
      expect(SearchEngine.filterByName(manager.getContacts(), '沈青禾禾').length).assertEqual(0);
    });

    /**
     * @tc.name   addListRefreshEmptyKeywordReturnsAllRows
     * @tc.desc   An empty search field projects the whole refreshed list and still returns a copy.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addListRefreshEmptyKeywordReturnsAllRows', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区'));
      const all = SearchEngine.filterByName(manager.getContacts(), '');
      expect(all.length).assertEqual(16);
      all.splice(0, 16);
      expect(manager.getContacts().length).assertEqual(16);
      expect(SearchEngine.filterByName(manager.getContacts(), '').length).assertEqual(16);
    });

    /**
     * @tc.name   addStoreQueryAfterAddReturnsRawRows
     * @tc.desc   The query cursor reports every stored row, including repeated names, before dedupe.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addStoreQueryAfterAddReturnsRawRows', 0, () => {
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      store.insert(true, draft, CONFLICT_REPLACE);
      store.insert(true, draft, CONFLICT_REPLACE);
      const rows = store.query(true);
      expect(rows.length).assertEqual(2);
      expect(countOf(contactNames(rows), '沈青禾')).assertEqual(2);
      rows[0].phone = '00000000000';
      expect(store.query(true)[0].phone).assertEqual('13900001111');
      expect(sameContact(store.query(true)[1], draft)).assertTrue();
    });

    /**
     * @tc.name   addCursorProjectionSkipsTheFirstRow
     * @tc.desc   A two row table projects only the newly added second row because the page skips row one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addCursorProjectionSkipsTheFirstRow', 0, () => {
      const seed = createSeedContacts();
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      store.batchInsert(true, [seed[0], draft]);
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(visible.length).assertEqual(1);
      expect(visible[0].name).assertEqual('沈青禾');
      expect(visible[0].phone).assertEqual('13900001111');
      expect(contactNames(visible).indexOf(seed[0].name)).assertEqual(-1);
      expect(expectedVisibleRows(store.query(true)).length).assertEqual(1);
    });

    /**
     * @tc.name   addTwoLeadingRowsBothSurviveTheVisibleWindow
     * @tc.desc   When the filler row occupies slot zero, both freshly added rows appear in the projection.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addTwoLeadingRowsBothSurviveTheVisibleWindow', 0, () => {
      const seed = createSeedContacts();
      const first = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      const second = contactOf('宋知远', '13900002222', 'song@example.com', '江苏省苏州市姑苏区');
      store.batchInsert(true, [seed[0], first, second]);
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(visible.length).assertEqual(2);
      expect(sameStringArray(contactNames(visible), ['沈青禾', '宋知远'])).assertTrue();
      expect(countOf(contactNames(visible), seed[0].name)).assertEqual(0);
      expect(visible[1].email).assertEqual('song@example.com');
    });

    /**
     * @tc.name   addBoundaryLengthsAreAcceptedAtTheLimit
     * @tc.desc   Name 12, phone 12, email 25 and address 100 all pass; one extra character each fails.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addBoundaryLengthsAreAcceptedAtTheLimit', 0, () => {
      const draft = contactOf(repeatText('周', 12), '138001380001', 'abcdefghijklmn@example.co',
        repeatText('巷', 100));
      expect(draft.name.length).assertEqual(MAX_NAME_LENGTH);
      expect(draft.phone.length).assertEqual(MAX_PHONE_LENGTH);
      expect(draft.email.length).assertEqual(MAX_EMAIL_LENGTH);
      expect(draft.address.length).assertEqual(MAX_ADDRESS_LENGTH);
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
      const over = contactOf(repeatText('周', 13), '1380013800012', 'abcdefghijklmnop@example.co',
        repeatText('巷', 101));
      const errors = ContactValidation.validate(over, []);
      expect(errors.indexOf('name-too-long') >= 0).assertTrue();
      expect(errors.indexOf('phone-too-long') >= 0).assertTrue();
      expect(errors.indexOf('email-too-long') >= 0).assertTrue();
      expect(errors.indexOf('address-too-long') >= 0).assertTrue();
    });

    /**
     * @tc.name   addRouteIntentDescribeUsesActionAndEditUrl
     * @tc.desc   The route descriptor keeps the Chinese action literal next to the English edit page url.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addRouteIntentDescribeUsesActionAndEditUrl', 0, () => {
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      const intent = new RouteIntent(ACTION_ADD, draft);
      expect(intent.describe()).assertEqual('新增联系人:沈青禾:' + ROUTE_EDIT);
      expect(intent.url()).assertEqual(ROUTE_EDIT);
      expect(intent.toParams().text).assertEqual(intent.action);
      expect(textFingerprint(intent.describe()) > 0).assertTrue();
      expect(intent.describe().endsWith(ROUTE_EDIT)).assertTrue();
    });

    /**
     * @tc.name   addFullRouteReplayMatchesSnapshotOracle
     * @tc.desc   Route, validate, map, insert, append and search replay the page and match the built oracle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addFullRouteReplayMatchesSnapshotOracle', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const intent = new RouteIntent(ACTION_ADD,
        contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区', '', 'A'));
      const draft = intent.toParams().data as Contact;
      expect(ContactValidation.validate(draft, manager.getContacts()).length).assertEqual(0);
      store.batchInsert(true, seed);
      store.insert(true, draft, CONFLICT_REPLACE);
      manager.addContact(draft);
      const list = SearchEngine.filterByName(manager.getContacts(), '');
      const expected = expectedAfterAdd(seed, draft);
      expect(list.length).assertEqual(16);
      expect(sameSnapshotArray(snapshotsOf(list), snapshotsOf(expected))).assertTrue();
      const metrics = ContactMetrics.from(list);
      expect(metrics.total).assertEqual(16);
      expect(metrics.categories).assertEqual(6);
      expect(metrics.uniqueNames).assertEqual(16);
      expect(store.rowCount()).assertEqual(16);
      expect(list[15].category).assertEqual('A');
    });

    /**
     * @tc.name   addBlankPhoneReportsOnlyTheEmptyCode
     * @tc.desc   The digits guard is skipped for an empty phone, so the form shows a single phone error.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addBlankPhoneReportsOnlyTheEmptyCode', 0, () => {
      const draft = contactOf('沈青禾', '', 'shen@example.com', '浙江省杭州市西湖区');
      const errors = ContactValidation.validate(draft, []);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-empty');
      expect(errors.indexOf('phone-not-numeric')).assertEqual(-1);
      expect(isDigitsOnly('')).assertFalse();
      draft.phone = '0';
      expect(isDigitsOnly(draft.phone)).assertTrue();
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
    });

    /**
     * @tc.name   addEmailShapeRejectsLeadingAtAndTrailingDot
     * @tc.desc   The local shape oracle only accepts an at sign followed by a dot inside the domain.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addEmailShapeRejectsLeadingAtAndTrailingDot', 0, () => {
      expect(hasEmailShape('@example.com')).assertFalse();
      expect(hasEmailShape('shen@example')).assertFalse();
      expect(hasEmailShape('shen@example.')).assertFalse();
      expect(hasEmailShape('shen@example.com')).assertTrue();
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.', '浙江省杭州市西湖区');
      expect(ContactValidation.validate(draft, []).indexOf('email-malformed') >= 0).assertTrue();
      draft.email = 'shen@example.com';
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
    });

    /**
     * @tc.name   addBucketRoundTripPreservesAllSixFields
     * @tc.desc   Mapping the draft into a bucket and back yields an identical Contact for the add path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addBucketRoundTripPreservesAllSixFields', 0, () => {
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区',
        'operate_rdb_in_taskpool_photo1.jpg', 'C');
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(draft));
      expect(sameContact(restored, draft)).assertTrue();
      expect(restored.avatar).assertEqual('operate_rdb_in_taskpool_photo1.jpg');
      expect(restored.category).assertEqual('C');
      expect(restored.address).assertEqual(draft.address);
      expect(sameContact(ContactMapper.fromBucket(new Bucket()), new Contact())).assertTrue();
    });

    /**
     * @tc.name   addMetricsOnAddedListCountsEveryPhoneDigit
     * @tc.desc   Sixteen rows with eleven digit phones total one hundred seventy-six phone characters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addMetricsOnAddedListCountsEveryPhoneDigit', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.addContact(contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区', '', 'A'));
      const metrics = ContactMetrics.from(manager.getContacts());
      expect(metrics.total).assertEqual(16);
      expect(metrics.totalPhoneDigits).assertEqual(176);
      expect(metrics.uniqueNames).assertEqual(16);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.fillRatio()).assertEqual(1);
      expect(metrics.categories).assertEqual(6);
    });

    /**
     * @tc.name   addStoreBatchBeforeInsertKeepsNewRowAtTheEnd
     * @tc.desc   Seeding all fifteen rows first then inserting places the new contact in slot fifteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addStoreBatchBeforeInsertKeepsNewRowAtTheEnd', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      store.insert(true, draft, CONFLICT_REPLACE);
      const raw = store.names();
      expect(raw.length).assertEqual(16);
      expect(raw[0]).assertEqual(seed[0].name);
      expect(raw[14]).assertEqual(seed[14].name);
      expect(raw[15]).assertEqual('沈青禾');
      expect(expectedVisibleCount(store.query(true))).assertEqual(15);
    });

    /**
     * @tc.name   addValidationErrorsFollowFieldDeclarationOrder
     * @tc.desc   Multiple invalid fields are reported name, phone, email then address without reordering.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addValidationErrorsFollowFieldDeclarationOrder', 0, () => {
      const draft = contactOf('', 'abc', 'bad', '');
      const existing = [new Contact()];
      const errors = ContactValidation.validate(draft, existing);
      expect(errors.length).assertEqual(5);
      expect(errors[0]).assertEqual('name-empty');
      expect(errors[1]).assertEqual('phone-not-numeric');
      expect(errors[2]).assertEqual('email-malformed');
      expect(errors[3]).assertEqual('address-empty');
      expect(errors[4]).assertEqual('name-duplicate');
      expect(errors.indexOf('phone-empty')).assertEqual(-1);
      expect(errors.indexOf('email-empty')).assertEqual(-1);
    });

    /**
     * @tc.name   addSearchDoesNotTrimWhitespaceFromKeyword
     * @tc.desc   The search box passes its raw text through, so a padded keyword matches nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addSearchDoesNotTrimWhitespaceFromKeyword', 0, () => {
      const rows = [contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区')];
      expect(SearchEngine.filterByName(rows, ' 沈').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '沈 ').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '沈').length).assertEqual(1);
      expect(SearchEngine.filterByName(rows, '   ').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '青').length).assertEqual(1);
    });

    /**
     * @tc.name   addTaskQueueSerializesTheRefreshAfterTheInsert
     * @tc.desc   The insert and refresh tasks complete in submission order, insert before query.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addTaskQueueSerializesTheRefreshAfterTheInsert', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.INSERT_ONE);
      queue.submit(OperationCatalog.QUERY_ALL);
      expect(queue.size()).assertEqual(2);
      expect(queue.runNext()).assertEqual(OperationCatalog.INSERT_ONE);
      expect(queue.runNext()).assertEqual(OperationCatalog.QUERY_ALL);
      queue.complete(OperationCatalog.INSERT_ONE);
      queue.complete(OperationCatalog.QUERY_ALL);
      expect(queue.trace()).assertEqual('insert-one>query-all');
      expect(queue.drain()).assertEqual(0);
      expect(queue.failed.length).assertEqual(0);
    });

    /**
     * @tc.name   addInsertFailureMapsToMinusOneFallback
     * @tc.desc   A caught SQL error during insert reports -1 from the generic fallback helper.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addInsertFailureMapsToMinusOneFallback', 0, () => {
      expect(fallbackForOperation(OperationCatalog.INSERT_ONE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_SQL_EXECUTION)).assertEqual(0);
      expect(fallbackForOperation(OperationCatalog.INSERT_ONE, 0)).assertEqual(0);
      expect(ERROR_SQL_EXECUTION).assertEqual(14800015);
      expect(store.insert(false, new Contact(), CONFLICT_REPLACE)).assertEqual(-1);
    });

    /**
     * @tc.name   addEmailAtTheLimitKeepsASingleAtSign
     * @tc.desc   The longest accepted email still contains exactly one at sign and one trailing dot marker.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addEmailAtTheLimitKeepsASingleAtSign', 0, () => {
      const draft = contactOf('沈青禾', '13900001111', 'abcdefghijklmn@example.co', '浙江省杭州市西湖区');
      expect(draft.email.length).assertEqual(25);
      expect(countOf(draft.email.split(''), '@')).assertEqual(1);
      expect(draft.email.lastIndexOf('.') > draft.email.indexOf('@') + 1).assertTrue();
      expect(hasEmailShape(draft.email)).assertTrue();
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
      expect(draft.email.substring(0, 14)).assertEqual('abcdefghijklmn');
    });

    /**
     * @tc.name   addRouteIntentForUnknownActionFallsBackToList
     * @tc.desc   Only add and edit open the editor; an unrecognised action routes back to the list page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('addRouteIntentForUnknownActionFallsBackToList', 0, () => {
      const intent = new RouteIntent('浏览联系人', new Contact('沈青禾', '13900001111', 'shen@example.com', '某地'));
      expect(intent.url()).assertEqual('pages/view/OperateRDBInTaskPool');
      expect(RouteIntent.isKnownAction(intent.action)).assertFalse();
      expect(RouteIntent.routeFor(ACTION_ADD)).assertEqual(ROUTE_EDIT);
      expect(RouteIntent.routeFor('新增联系人')).assertEqual(ROUTE_EDIT);
      expect(intent.describe().indexOf('浏览联系人:') ).assertEqual(0);
    });

    /**
     * @tc.name   addManagerSeedDoesNotAliasTheIncomingArray
     * @tc.desc   setContacts copies the array, so mutating the seed literal cannot change the singleton.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addManagerSeedDoesNotAliasTheIncomingArray', 0, () => {
      const manager = ContactManager.getInstance();
      const incoming = createSeedContacts();
      manager.setContacts(incoming);
      incoming.splice(0, 15);
      expect(incoming.length).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(15);
      expect(manager.getContacts()[0].name).assertEqual('艾德里安');
      manager.addContact(contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区'));
      expect(incoming.length).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(16);
    });

    /**
     * @tc.name   addStoreQueryBeforeAnyInsertReturnsNothing
     * @tc.desc   The add page opens on an empty store; querying before submit yields an empty projection.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addStoreQueryBeforeAnyInsertReturnsNothing', 0, () => {
      expect(store.rowCount()).assertEqual(0);
      expect(store.query(true).length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(readContactsFromResultSet(new CursorResultSet(store.query(true))).length).assertEqual(0);
      expect(store.insertCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
    });

    /**
     * @tc.name   addAvatarFieldStaysEmptyOnNewDraft
     * @tc.desc   The add form never edits avatar, so the bucket always carries an empty avatar string.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addAvatarFieldStaysEmptyOnNewDraft', 0, () => {
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      const bucket = ContactMapper.toBucket(draft);
      expect(draft.avatar).assertEqual('');
      expect(bucket.get(FIELD_AVATAR)).assertEqual('');
      expect(bucket.has(FIELD_AVATAR)).assertTrue();
      expect(BUCKET_KEYS[4]).assertEqual(FIELD_AVATAR);
      const stored = ContactMapper.fromBucket(bucket);
      expect(stored.avatar.length).assertEqual(0);
    });

    /**
     * @tc.name   addCategoryDefaultsToBlankForNewDraft
     * @tc.desc   A new Contact carries no category, and the blank label forms its own grouping bucket.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addCategoryDefaultsToBlankForNewDraft', 0, () => {
      const draft = new Contact('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区');
      expect(draft.category).assertEqual('');
      expect(ContactMapper.toBucket(draft).get(FIELD_CATEGORY)).assertEqual('');
      const groups = SearchEngine.groupByCategory(createSeedContacts().concat([draft]));
      expect(groups.length).assertEqual(7);
      expect(groups[6]).assertEqual('');
      expect(SearchEngine.countCategory(createSeedContacts().concat([draft]), '')).assertEqual(1);
    });

    /**
     * @tc.name   addPhoneBoundaryAcceptsTwelveDigitsOnly
     * @tc.desc   The phone column accepts twelve digits; thirteen digits or a leading plus sign fail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addPhoneBoundaryAcceptsTwelveDigitsOnly', 0, () => {
      const draft = contactOf('沈青禾', '138001380001', 'shen@example.com', '浙江省杭州市西湖区');
      expect(draft.phone.length).assertEqual(MAX_PHONE_LENGTH);
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
      draft.phone = '1380013800012';
      expect(ContactValidation.validate(draft, []).indexOf('phone-too-long') >= 0).assertTrue();
      draft.phone = '+86138001380';
      const errors = ContactValidation.validate(draft, []);
      expect(errors.indexOf('phone-not-numeric') >= 0).assertTrue();
      expect(isDigitsOnly(draft.phone)).assertFalse();
    });
  });
}
