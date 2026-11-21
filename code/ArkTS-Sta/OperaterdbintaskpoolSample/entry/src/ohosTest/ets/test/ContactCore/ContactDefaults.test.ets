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
 * ContactCore / ContactDefaults suite.
 *
 * Contact.ets:38-46 defaults every constructor slot to '', and contactOf in the
 * shared driver keeps avatar and category optional. The suite pins those defaults,
 * the empty-string bucket they produce, the behaviour of an empty ContactManager
 * and the way a default row flows through the store and result-set helpers.
 *
 * Source anchors:
 *   Contact.ets:38-46               six default parameters
 *   ContactManager.ets:41-70        empty list behaviour
 *   SharedDriver.ets:108-111        contactOf default arguments
 *   SharedDriver.ets:262-341        Bucket and ContactMapper
 *   SharedDriver.ets:522-640        StoreDouble
 *   SharedDriver.ets:476-501        first-row-skip reader
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  BUCKET_KEYS,
  FIELD_NAME,
  FIELD_PHONE,
  FIELD_EMAIL,
  FIELD_ADDRESS,
  FIELD_AVATAR,
  FIELD_CATEGORY,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  sameStringArray,
  contactNames,
  joined,
  uniqueStrings,
  expectedAfterAdd,
  Bucket,
  ContactMapper,
  StoreDouble,
  CursorResultSet,
  readContactsFromResultSet,
  ContactSnapshot,
  snapshotsOf,
  SearchEngine,
  ContactMetrics,
  ContactValidation,
  hasEmailShape,
  isDigitsOnly,
  wrappedBatchCount,
  wrappedQueryResult,
  resetContactManager
} from '../Shared/SharedDriver';

export default function contactDefaultsTest(): void {
  describe('ContactDefaults', () => {
    beforeAll(() => {
      logSuite('ContactDefaults', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactDefaults', 'end');
    });

    /**
     * @tc.name   defaultContactHasSixEmptyStrings
     * @tc.desc   new Contact() leaves name, phone, email, address, avatar and category empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('defaultContactHasSixEmptyStrings', 0, () => {
      const contact = new Contact();
      expect(contact.name).assertEqual('');
      expect(contact.phone).assertEqual('');
      expect(contact.email).assertEqual('');
      expect(contact.address).assertEqual('');
      expect(contact.avatar).assertEqual('');
      expect(contact.category).assertEqual('');
      expect(joined([contact.name, contact.phone, contact.email], '|')).assertEqual('||');
      expect(contact.address.length + contact.avatar.length + contact.category.length).assertEqual(0);
    });

    /**
     * @tc.name   defaultContactFieldsAreAssignableAfterConstruction
     * @tc.desc   Two slots can be filled after construction while the untouched slots stay empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultContactFieldsAreAssignableAfterConstruction', 0, () => {
      const contact = new Contact();
      contact.name = '林岸';
      contact.category = 'C';
      expect(contact.name).assertEqual('林岸');
      expect(contact.category).assertEqual('C');
      expect(contact.phone).assertEqual('');
      expect(contact.email).assertEqual('');
      expect(contact.address).assertEqual('');
      expect(contact.avatar).assertEqual('');
      const bucket = ContactMapper.toBucket(contact);
      expect(bucket.get(FIELD_NAME)).assertEqual('林岸');
      expect(bucket.get(FIELD_CATEGORY)).assertEqual('C');
    });

    /**
     * @tc.name   contactOfDefaultsAvatarAndCategoryWhenFourArguments
     * @tc.desc   contactOf with four arguments sets the optional avatar and category to ''.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactOfDefaultsAvatarAndCategoryWhenFourArguments', 0, () => {
      const contact = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区');
      expect(contact.name).assertEqual('林岸');
      expect(contact.phone).assertEqual('13800138000');
      expect(contact.email).assertEqual('lin@example.com');
      expect(contact.address).assertEqual('上海市徐汇区');
      expect(contact.avatar).assertEqual('');
      expect(contact.category).assertEqual('');
      expect(contact.avatar.length).assertEqual(0);
      expect(contact.category.length).assertEqual(0);
    });

    /**
     * @tc.name   contactOfWithAvatarOnlyKeepsCategoryEmpty
     * @tc.desc   Passing the fifth argument fills the avatar while category still falls back to ''.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactOfWithAvatarOnlyKeepsCategoryEmpty', 0, () => {
      const contact = contactOf('艾德里安', '13333333333', 'aidelian@example.com',
        '江苏省南京市鼓楼区', 'app.media.avatar_adrian');
      expect(contact.avatar).assertEqual('app.media.avatar_adrian');
      expect(contact.category).assertEqual('');
      expect(contact.avatar.length > 0).assertTrue();
      expect(contact.category.length).assertEqual(0);
      expect(contact.email).assertEqual('aidelian@example.com');
      expect(SearchEngine.countCategory([contact], '')).assertEqual(1);
    });

    /**
     * @tc.name   contactOfWithAllSixArgumentsKeepsValues
     * @tc.desc   Supplying all six contactOf arguments stores them verbatim, including the avatar.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactOfWithAllSixArgumentsKeepsValues', 0, () => {
      const contact = contactOf('法比而', '10000000000', 'connor@example.com',
        '辽宁省沈阳市沈河区', 'app.media.avatar_fabier', 'F');
      expect(contact.name).assertEqual('法比而');
      expect(contact.phone).assertEqual('10000000000');
      expect(contact.email).assertEqual('connor@example.com');
      expect(contact.address).assertEqual('辽宁省沈阳市沈河区');
      expect(contact.avatar).assertEqual('app.media.avatar_fabier');
      expect(contact.category).assertEqual('F');
      expect(contact.category === '').assertFalse();
      expect(contact.avatar === '').assertFalse();
    });

    /**
     * @tc.name   contactOfWithEmptyStringsMatchesDefaultContact
     * @tc.desc   contactOf called with six empty strings builds a row equivalent to new Contact().
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactOfWithEmptyStringsMatchesDefaultContact', 0, () => {
      const built = contactOf('', '', '', '', '', '');
      const plain = new Contact();
      expect(sameContact(built, plain)).assertTrue();
      expect(built === plain).assertFalse();
      expect(built.name).assertEqual(plain.name);
      expect(ContactMapper.toBucket(built).sameAs(ContactMapper.toBucket(plain))).assertTrue();
      expect(SearchEngine.countCategory([built], '')).assertEqual(1);
      expect([built, plain].length).assertEqual(2);
      logStep('defaultsTest', 'contactOf with empty strings equals the no-argument constructor');
    });

    /**
     * @tc.name   defaultContactBucketCarriesSixKeys
     * @tc.desc   A default row maps to a bucket with the six column keys and no extra entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('defaultContactBucketCarriesSixKeys', 0, () => {
      const bucket = ContactMapper.toBucket(new Contact());
      expect(bucket.size()).assertEqual(6);
      expect(BUCKET_KEYS.length).assertEqual(6);
      expect(bucket.has(FIELD_NAME)).assertTrue();
      expect(bucket.has(FIELD_PHONE)).assertTrue();
      expect(bucket.has(FIELD_EMAIL)).assertTrue();
      expect(bucket.has(FIELD_ADDRESS)).assertTrue();
      expect(bucket.has(FIELD_AVATAR)).assertTrue();
      expect(bucket.has(FIELD_CATEGORY)).assertTrue();
      expect(bucket.has('id')).assertFalse();
    });

    /**
     * @tc.name   defaultContactBucketValuesAreAllEmpty
     * @tc.desc   Every value written for a default row is the empty string, in column order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('defaultContactBucketValuesAreAllEmpty', 0, () => {
      const bucket = ContactMapper.toBucket(new Contact());
      expect(bucket.get(FIELD_NAME)).assertEqual('');
      expect(bucket.get(FIELD_PHONE)).assertEqual('');
      expect(bucket.get(FIELD_EMAIL)).assertEqual('');
      expect(bucket.get(FIELD_ADDRESS)).assertEqual('');
      expect(bucket.get(FIELD_AVATAR)).assertEqual('');
      expect(bucket.get(FIELD_CATEGORY)).assertEqual('');
      expect(joined(bucket.values, '|')).assertEqual('|||||');
      expect(bucket.describe()).assertEqual('name=;phone=;email=;address=;avatar=;category=');
    });

    /**
     * @tc.name   mapperRoundTripOfDefaultContactIsAllEmpty
     * @tc.desc   Mapping a default row to a bucket and back yields another six-empty-field row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mapperRoundTripOfDefaultContactIsAllEmpty', 0, () => {
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(new Contact()));
      expect(sameContact(restored, new Contact())).assertTrue();
      expect(restored.name).assertEqual('');
      expect(restored.phone).assertEqual('');
      expect(restored.email).assertEqual('');
      expect(restored.address).assertEqual('');
      expect(restored.avatar).assertEqual('');
      expect(restored.category).assertEqual('');
      expect(SearchEngine.countCategory([restored], '')).assertEqual(1);
    });

    /**
     * @tc.name   defaultContactEqualsSecondDefaultViaSameContact
     * @tc.desc   Two independently constructed default rows compare equal although they are distinct.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultContactEqualsSecondDefaultViaSameContact', 0, () => {
      const left = new Contact();
      const right = new Contact();
      expect(left === right).assertFalse();
      expect(sameContact(left, right)).assertTrue();
      right.name = '艾拉';
      expect(sameContact(left, right)).assertFalse();
      right.name = '';
      expect(sameContact(left, right)).assertTrue();
      expect(sameStringArray(contactNames([left, right]), ['', ''])).assertTrue();
      expect(uniqueStrings(contactNames([left, right])).length).assertEqual(1);
    });

    /**
     * @tc.name   emptyManagerStartsAtZeroRows
     * @tc.desc   After the beforeEach reset the singleton reports no contacts and an empty names list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyManagerStartsAtZeroRows', 0, () => {
      const manager = ContactManager.getInstance();
      expect(manager.getContacts().length).assertEqual(0);
      expect(contactNames(manager.getContacts()).length).assertEqual(0);
      expect(joined(contactNames(manager.getContacts()), ',')).assertEqual('');
      expect(manager.getContacts().indexOf(new Contact())).assertEqual(-1);
      const metrics = ContactMetrics.from(manager.getContacts());
      expect(metrics.total).assertEqual(0);
      expect(metrics.categories).assertEqual(0);
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(0);
    });

    /**
     * @tc.name   emptyManagerAddStartsAtOne
     * @tc.desc   The first addContact on an empty manager produces exactly one default row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyManagerAddStartsAtOne', 0, () => {
      const manager = ContactManager.getInstance();
      manager.addContact(new Contact());
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(1);
      expect(loaded[0].name).assertEqual('');
      expect(loaded[0].category).assertEqual('');
      expect(sameContact(loaded[0], new Contact())).assertTrue();
      expect(expectedAfterAdd([], new Contact()).length).assertEqual(loaded.length);
      expect(SearchEngine.countCategory(loaded, '')).assertEqual(1);
      expect(loaded[0].avatar).assertEqual('');
    });

    /**
     * @tc.name   emptyManagerDeleteOnEmptyIsNoOp
     * @tc.desc   Deleting a default contact from an empty manager leaves the list empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyManagerDeleteOnEmptyIsNoOp', 0, () => {
      const manager = ContactManager.getInstance();
      manager.deleteContact(new Contact());
      expect(manager.getContacts().length).assertEqual(0);
      manager.deleteContact(contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区'));
      expect(manager.getContacts().length).assertEqual(0);
      expect(contactNames(manager.getContacts()).length).assertEqual(0);
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(0);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(0);
    });

    /**
     * @tc.name   emptyManagerUpdateOnEmptyIsNoOp
     * @tc.desc   Updating against an empty manager cannot insert; the row count remains zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyManagerUpdateOnEmptyIsNoOp', 0, () => {
      const manager = ContactManager.getInstance();
      manager.updateContact(new Contact());
      expect(manager.getContacts().length).assertEqual(0);
      manager.updateContact(createSeedContacts()[0]);
      expect(manager.getContacts().length).assertEqual(0);
      expect(manager.getContacts().find((row: Contact, index: int): boolean => index === 0) === undefined).assertTrue();
      expect(contactNames(manager.getContacts()).indexOf('艾德里安')).assertEqual(-1);
      expect(ContactMetrics.from(manager.getContacts()).uniqueNames).assertEqual(0);
    });

    /**
     * @tc.name   emptyManagerGetContactsReturnsEmptyCopy
     * @tc.desc   Each getContacts call returns a fresh empty array, not a shared instance.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyManagerGetContactsReturnsEmptyCopy', 0, () => {
      const manager = ContactManager.getInstance();
      const first = manager.getContacts();
      const second = manager.getContacts();
      expect(first === second).assertFalse();
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(0);
      first.push(new Contact('林岸', '13800138000', 'lin@example.com', '上海市徐汇区'));
      expect(manager.getContacts().length).assertEqual(0);
      expect(second.length).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(0);
    });

    /**
     * @tc.name   emptyManagerSetContactsWithEmptyArrayClears
     * @tc.desc   Setting fifteen rows and then an empty array clears the singleton again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyManagerSetContactsWithEmptyArrayClears', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      expect(manager.getContacts().length).assertEqual(15);
      const empty: Contact[] = [];
      manager.setContacts(empty);
      expect(manager.getContacts().length).assertEqual(0);
      expect(contactNames(manager.getContacts()).length).assertEqual(0);
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(0);
      expect(manager.getContacts().find((row: Contact, index: int): boolean => index === 14) === undefined).assertTrue();
      expect(ContactMetrics.from(manager.getContacts()).fillRatio()).assertEqual(0);
    });

    /**
     * @tc.name   emptyManagerClearThenAddKeepsSingleRow
     * @tc.desc   After clearing, adding one named row yields a one entry list with that name only.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyManagerClearThenAddKeepsSingleRow', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.setContacts([]);
      const added = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'C');
      manager.addContact(added);
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(1);
      expect(loaded[0].name).assertEqual('林岸');
      expect(loaded[0].category).assertEqual('C');
      expect(joined(contactNames(loaded), ',')).assertEqual('林岸');
      expect(SearchEngine.countCategory(loaded, 'C')).assertEqual(1);
      expect(sameContact(loaded[0], added)).assertTrue();
    });

    /**
     * @tc.name   defaultContactNameEmptyTriggersDuplicateWhenPresent
     * @tc.desc   An empty name is a valid duplicate key, so the presence check alone decides.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultContactNameEmptyTriggersDuplicateWhenPresent', 0, () => {
      expect(ContactValidation.isDuplicateName([], '')).assertFalse();
      expect(ContactValidation.isDuplicateName([new Contact()], '')).assertTrue();
      expect(ContactValidation.isDuplicateName(createSeedContacts(), '')).assertFalse();
      expect(ContactValidation.isDuplicateName([contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区')],
        '林岸')).assertTrue();
      expect(ContactValidation.isDuplicateName([new Contact()], '林岸')).assertFalse();
      expect(ContactValidation.isDuplicateName([], '林岸')).assertFalse();
      expect(new Contact().name.length).assertEqual(0);
    });

    /**
     * @tc.name   defaultContactValidationRejectsFourEmptyFields
     * @tc.desc   Validation reports name, phone, email and address as empty; avatar and category are exempt.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultContactValidationRejectsFourEmptyFields', 0, () => {
      const errors = ContactValidation.validate(new Contact());
      expect(errors.length).assertEqual(4);
      expect(errors.indexOf('name-empty') >= 0).assertTrue();
      expect(errors.indexOf('phone-empty') >= 0).assertTrue();
      expect(errors.indexOf('email-empty') >= 0).assertTrue();
      expect(errors.indexOf('address-empty') >= 0).assertTrue();
      expect(joined(errors, ',')).assertEqual('name-empty,phone-empty,email-empty,address-empty');
      expect(ContactValidation.canSubmit(new Contact())).assertFalse();
      expect(errors.indexOf('category-empty')).assertEqual(-1);
    });

    /**
     * @tc.name   defaultContactValidationAcceptsFilledFields
     * @tc.desc   Once the four required fields are filled the default avatar and category do not block submit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultContactValidationAcceptsFilledFields', 0, () => {
      const filled = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区');
      expect(filled.avatar).assertEqual('');
      expect(filled.category).assertEqual('');
      expect(ContactValidation.validate(filled).length).assertEqual(0);
      expect(ContactValidation.canSubmit(filled)).assertTrue();
      expect(ContactValidation.canSubmit(filled, createSeedContacts())).assertTrue();
      expect(ContactValidation.validate(filled, [filled]).indexOf('name-duplicate') >= 0).assertTrue();
      expect(filled.name).assertEqual('林岸');
    });

    /**
     * @tc.name   defaultContactInManagerKeepsEmptyFieldsOnGet
     * @tc.desc   A default row added to the manager keeps all six empty fields when it is read back.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultContactInManagerKeepsEmptyFieldsOnGet', 0, () => {
      const manager = ContactManager.getInstance();
      manager.addContact(new Contact());
      const loaded = manager.getContacts()[0];
      expect(loaded.name).assertEqual('');
      expect(loaded.phone).assertEqual('');
      expect(loaded.email).assertEqual('');
      expect(loaded.address).assertEqual('');
      expect(loaded.avatar).assertEqual('');
      expect(loaded.category).assertEqual('');
      expect(sameContact(loaded, new Contact())).assertTrue();
      expect(ContactMapper.toBucket(loaded).describe()).assertEqual('name=;phone=;email=;address=;avatar=;category=');
    });

    /**
     * @tc.name   defaultsSurviveSetContactsRoundTrip
     * @tc.desc   A mixed catalog of a default row and a seed row survives setContacts and getContacts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultsSurviveSetContactsRoundTrip', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = [new Contact(), createSeedContacts()[3]];
      manager.setContacts(rows);
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(2);
      expect(loaded[0].name).assertEqual('');
      expect(loaded[1].name).assertEqual('本');
      expect(sameContact(loaded[0], new Contact())).assertTrue();
      expect(sameContact(loaded[1], rows[1])).assertTrue();
      expect(joined(contactNames(loaded), '|')).assertEqual('|本');
      expect(SearchEngine.countCategory(loaded, '')).assertEqual(1);
    });

    /**
     * @tc.name   defaultSnapshotDescribesEmptyRow
     * @tc.desc   ContactSnapshot of a default row describes five empty segments separated by slashes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultSnapshotDescribesEmptyRow', 0, () => {
      const snapshot = new ContactSnapshot(new Contact());
      expect(snapshot.name).assertEqual('');
      expect(snapshot.phone).assertEqual('');
      expect(snapshot.email).assertEqual('');
      expect(snapshot.address).assertEqual('');
      expect(snapshot.category).assertEqual('');
      expect(snapshot.describe()).assertEqual('////');
      expect(snapshot.describe().split('/').length).assertEqual(5);
      expect(snapshot.sameAs(new ContactSnapshot(contactOf('', '', '', '', '', '')))).assertTrue();
      expect(snapshotsOf([new Contact()]).length).assertEqual(1);
    });

    /**
     * @tc.name   defaultCategoryAppearsAsSeventhLabel
     * @tc.desc   Appending a default row to the catalog exposes '' after the six letter labels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultCategoryAppearsAsSeventhLabel', 0, () => {
      const rows = createSeedContacts();
      rows.push(new Contact());
      const labels = SearchEngine.groupByCategory(rows);
      expect(labels.length).assertEqual(7);
      expect(labels[6]).assertEqual('');
      expect(labels[5]).assertEqual('F');
      expect(SearchEngine.countCategory(rows, '')).assertEqual(1);
      expect(SearchEngine.countCategory(rows, 'A')).assertEqual(2);
      expect(ContactMetrics.from(rows).categories).assertEqual(7);
      expect(rows[15].name).assertEqual('');
    });

    /**
     * @tc.name   defaultsShiftMetricsCategoriesToSeven
     * @tc.desc   Adding a default row introduces the seventh category and a new unique empty name; fill ratio stays one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultsShiftMetricsCategoriesToSeven', 0, () => {
      const rows = createSeedContacts();
      const before = ContactMetrics.from(rows);
      rows.push(new Contact());
      const after = ContactMetrics.from(rows);
      expect(before.categories).assertEqual(6);
      expect(after.categories).assertEqual(7);
      expect(after.total).assertEqual(before.total + 1);
      expect(after.uniqueNames).assertEqual(16);
      expect(after.duplicateNames).assertEqual(0);
      expect(after.fillRatio() === before.fillRatio()).assertTrue();
      expect(after.fingerprint() === before.fingerprint()).assertFalse();
      expect(after.totalPhoneDigits).assertEqual(before.totalPhoneDigits);
    });

    /**
     * @tc.name   emptyStoreQueryReturnsNoRows
     * @tc.desc   A fresh StoreDouble queries an empty array and a missing context yields [] as well.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyStoreQueryReturnsNoRows', 0, () => {
      const store = new StoreDouble();
      const rows = store.query(true);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      const withoutContext = store.query(false);
      expect(withoutContext.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(2);
      expect(wrappedQueryResult(false, store).length).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   defaultContactBatchInsertCountsOne
     * @tc.desc   Batch inserting a single default row reports one written row and stores one row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultContactBatchInsertCountsOne', 0, () => {
      const store = new StoreDouble();
      const count = store.batchInsert(true, [new Contact()]);
      expect(count).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.rows[0].name).assertEqual('');
      expect(wrappedBatchCount(true, store, [new Contact()])).assertEqual(1);
      expect(store.rowCount()).assertEqual(2);
      logStep('defaultsTest', 'batch insert of a default row reports one row');
    });

    /**
     * @tc.name   defaultStoreInsertThenQueryReturnsDefaultRow
     * @tc.desc   Inserting a default row with ON_CONFLICT_REPLACE makes it visible to a later query.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultStoreInsertThenQueryReturnsDefaultRow', 0, () => {
      const store = new StoreDouble();
      const inserted = store.insert(true, new Contact(), 'ON_CONFLICT_REPLACE');
      expect(inserted).assertEqual(1);
      expect(store.insertCalls).assertEqual(1);
      const rows = store.query(true);
      expect(rows.length).assertEqual(1);
      expect(rows[0].name).assertEqual('');
      expect(rows[0].avatar).assertEqual('');
      expect(sameContact(rows[0], new Contact())).assertTrue();
      expect(rows[0] === store.rows[0]).assertFalse();
    });

    /**
     * @tc.name   defaultLeadingRowIsSkippedAsVisibleRow
     * @tc.desc   The result-set reader skips its first row, so a leading default row never becomes visible.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('defaultLeadingRowIsSkippedAsVisibleRow', 0, () => {
      const resultSet = new CursorResultSet([new Contact(), createSeedContacts()[0]]);
      const visible = readContactsFromResultSet(resultSet);
      expect(visible.length).assertEqual(1);
      expect(visible[0].name).assertEqual('艾德里安');
      expect(contactNames(visible).indexOf('')).assertEqual(-1);
      expect(resultSet.closed).assertTrue();
      expect(resultSet.rowCount()).assertEqual(2);
      expect(resultSet.index).assertEqual(2);
      expect(resultSet.isAfterLast()).assertTrue();
    });

    /**
     * @tc.name   emptyStoreDeleteByNameReturnsZero
     * @tc.desc   Deleting by name against an empty store reports zero removals and records the call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyStoreDeleteByNameReturnsZero', 0, () => {
      const store = new StoreDouble();
      expect(store.deleteByName('')).assertEqual(0);
      expect(store.deleteByName('林岸')).assertEqual(0);
      expect(store.deleteCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(joined(store.names(), ',')).assertEqual('');
      expect(store.initialized).assertFalse();
    });

    /**
     * @tc.name   singleArgumentConstructorFillsOnlyName
     * @tc.desc   new Contact('本') stores the name and leaves the five remaining slots empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('singleArgumentConstructorFillsOnlyName', 0, () => {
      const contact = new Contact('本');
      expect(contact.name).assertEqual('本');
      expect(contact.phone).assertEqual('');
      expect(contact.email).assertEqual('');
      expect(contact.address).assertEqual('');
      expect(contact.avatar).assertEqual('');
      expect(contact.category).assertEqual('');
      expect(contact.name.length).assertEqual(1);
      expect(joined([contact.phone, contact.email, contact.address], '/')).assertEqual('//');
    });

    /**
     * @tc.name   twoArgumentConstructorFillsNameAndPhone
     * @tc.desc   Passing name and phone leaves email, address, avatar and category at their defaults.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoArgumentConstructorFillsNameAndPhone', 0, () => {
      const contact = new Contact('贝拉', '11111111111');
      expect(contact.name).assertEqual('贝拉');
      expect(contact.phone).assertEqual('11111111111');
      expect(contact.email).assertEqual('');
      expect(contact.address).assertEqual('');
      expect(contact.avatar).assertEqual('');
      expect(contact.category).assertEqual('');
      expect(SearchEngine.countCategory([contact], '')).assertEqual(1);
      expect(ContactMapper.toBucket(contact).get(FIELD_EMAIL)).assertEqual('');
    });

    /**
     * @tc.name   threeArgumentConstructorFillsNamePhoneEmail
     * @tc.desc   Three arguments fill the mailbox slot while address, avatar and category stay empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('threeArgumentConstructorFillsNamePhoneEmail', 0, () => {
      const contact = new Contact('康纳', '10000000000', 'connor@example.com');
      expect(contact.email).assertEqual('connor@example.com');
      expect(contact.address).assertEqual('');
      expect(contact.avatar).assertEqual('');
      expect(contact.category).assertEqual('');
      expect(hasEmailShape(contact.email)).assertTrue();
      expect(isDigitsOnly(contact.phone)).assertTrue();
      const errors = ContactValidation.validate(contact);
      expect(errors.indexOf('address-empty') >= 0).assertTrue();
      expect(errors.indexOf('email-empty') >= 0).assertFalse();
    });

    /**
     * @tc.name   emptyPhoneSkipsNumericShapeError
     * @tc.desc   The numeric guard only runs on a non-empty phone, so '' reports phone-empty alone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emptyPhoneSkipsNumericShapeError', 0, () => {
      const errors = ContactValidation.validate(new Contact());
      expect(errors.indexOf('phone-empty') >= 0).assertTrue();
      expect(errors.indexOf('phone-not-numeric')).assertEqual(-1);
      expect(errors.indexOf('phone-too-long')).assertEqual(-1);
      expect(isDigitsOnly('')).assertFalse();
      expect(ContactValidation.validate(contactOf('林岸', '12ab', 'lin@example.com',
        '上海市徐汇区')).indexOf('phone-not-numeric') >= 0).assertTrue();
      expect(ContactValidation.validate(new Contact()).length).assertEqual(4);
    });

    /**
     * @tc.name   emptyEmailSkipsMalformedShapeError
     * @tc.desc   An empty mailbox reports email-empty only, while a malformed non-empty one reports both.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emptyEmailSkipsMalformedShapeError', 0, () => {
      const emptyErrors = ContactValidation.validate(new Contact());
      expect(emptyErrors.indexOf('email-empty') >= 0).assertTrue();
      expect(emptyErrors.indexOf('email-malformed')).assertEqual(-1);
      const filled = contactOf('林岸', '13800138000', 'lin.example.com', '上海市徐汇区');
      const filledErrors = ContactValidation.validate(filled);
      expect(filledErrors.indexOf('email-malformed') >= 0).assertTrue();
      expect(filledErrors.indexOf('email-empty')).assertEqual(-1);
      expect(hasEmailShape('')).assertFalse();
      expect(hasEmailShape('lin.example.com')).assertFalse();
    });

    /**
     * @tc.name   defaultAvatarDoesNotChangeTheDuplicateKey
     * @tc.desc   Duplicate detection compares names only, so differing avatar and category still collide.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultAvatarDoesNotChangeTheDuplicateKey', 0, () => {
      const plain = new Contact('林岸');
      const rich = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区',
        'app.media.avatar_lin', 'F');
      expect(plain.avatar).assertEqual('');
      expect(rich.avatar).assertEqual('app.media.avatar_lin');
      expect(ContactValidation.isDuplicateName([plain], '林岸')).assertTrue();
      expect(ContactValidation.isDuplicateName([rich], '林岸')).assertTrue();
      expect(sameContact(plain, rich)).assertFalse();
      expect(ContactValidation.validate(rich, [plain]).indexOf('name-duplicate') >= 0).assertTrue();
      expect(plain.name).assertEqual(rich.name);
    });

    /**
     * @tc.name   emptyKeywordSearchReturnsEveryRowIncludingDefaults
     * @tc.desc   filterByName with '' copies all rows, so an appended default row stays in the result.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyKeywordSearchReturnsEveryRowIncludingDefaults', 0, () => {
      const rows = createSeedContacts();
      rows.push(new Contact());
      const hits = SearchEngine.filterByName(rows, '');
      expect(hits.length).assertEqual(16);
      expect(hits[15].name).assertEqual('');
      expect(hits === rows).assertFalse();
      expect(hits[0] === rows[0]).assertTrue();
      expect(sameContact(hits[0], rows[0])).assertTrue();
      expect(SearchEngine.filterByName(rows, '林岸').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '艾').length).assertEqual(4);
    });

    /**
     * @tc.name   defaultRowBucketKeepsColumnOrder
     * @tc.desc   Even with empty values the bucket preserves the six column keys in declared order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('defaultRowBucketKeepsColumnOrder', 0, () => {
      const bucket = ContactMapper.toBucket(new Contact());
      for (let index = 0; index < BUCKET_KEYS.length; index++) {
        expect(bucket.keyAt(index)).assertEqual(BUCKET_KEYS[index]);
        expect(bucket.valueAt(index)).assertEqual('');
      }
      expect(bucket.keyAt(0)).assertEqual('name');
      expect(bucket.keyAt(5)).assertEqual('category');
      expect(bucket.keys.indexOf('avatar')).assertEqual(4);
      expect(joined(bucket.keys, ','))
        .assertEqual('name,phone,email,address,avatar,category');
      expect(bucket.valueAt(5)!.length).assertEqual(0);
    });

    /**
     * @tc.name   emptyManagerUpdateKeepsSingletonIdentity
     * @tc.desc   Updating nothing still resolves the same singleton instance and an empty list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyManagerUpdateKeepsSingletonIdentity', 0, () => {
      const manager = ContactManager.getInstance();
      const same = ContactManager.getInstance();
      expect(manager === same).assertTrue();
      manager.setContacts([]);
      manager.updateContact(contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区'));
      expect(manager.getContacts().length).assertEqual(0);
      expect(same.getContacts().length).assertEqual(0);
      expect(ContactManager.getInstance().getContacts().length).assertEqual(0);
      expect(contactNames(same.getContacts()).indexOf('林岸')).assertEqual(-1);
      expect(ContactMetrics.from(same.getContacts()).categories).assertEqual(0);
    });

    /**
     * @tc.name   defaultContactCloneIsEqualAndIndependent
     * @tc.desc   Cloning a default row yields an equal object whose later edits do not affect the source.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultContactCloneIsEqualAndIndependent', 0, () => {
      const source = new Contact();
      const copy = cloneContact(source);
      expect(copy === source).assertFalse();
      expect(sameContact(copy, source)).assertTrue();
      expect(copy.category).assertEqual('');
      copy.category = 'A';
      copy.name = '林岸';
      expect(source.category).assertEqual('');
      expect(source.name).assertEqual('');
      expect(sameContact(copy, source)).assertFalse();
      expect(SearchEngine.countCategory([source], '')).assertEqual(1);
      expect(SearchEngine.countCategory([copy], 'A')).assertEqual(1);
    });
    /**
     * @tc.name   emptyManagerAddsTwoDefaultsWithoutDeduplication
     * @tc.desc   addContact appends blindly, so two empty-named rows coexist in the manager.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDefaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emptyManagerAddsTwoDefaultsWithoutDeduplication', 0, () => {
      const manager = ContactManager.getInstance();
      manager.addContact(new Contact());
      manager.addContact(new Contact());
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(2);
      expect(uniqueStrings(contactNames(loaded)).length).assertEqual(1);
      expect(uniqueStrings(contactNames(loaded))[0]).assertEqual('');
      expect(SearchEngine.countCategory(loaded, '')).assertEqual(2);
      expect(ContactMetrics.from(loaded).duplicateNames).assertEqual(1);
      expect(loaded[0] === loaded[1]).assertFalse();
      expect(sameContact(loaded[0], loaded[1])).assertTrue();
    });
  });
}
