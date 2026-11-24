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
 * The edit path end to end. Anchors:
 *   AddressBookList.ets:60-66       list tap opens the detail page with "编辑联系人"
 *   AddressBookDetail.ets:243-250   detail edit button opens AddressBookEdit
 *   AddressBookEdit.ets:102-110     ok button pushes back to the list page
 *   AddressBookEdit.ets:191-278     phone 12, email 25, address 100 limits
 *   DatabaseConnection.ets:241-272  UPDATE sets phone, email, address by name
 *   ContactManager.ets:55-65        first matching name replaced by object reference
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  ACTION_EDIT,
  ROUTE_EDIT,
  MAX_PHONE_LENGTH,
  MAX_EMAIL_LENGTH,
  MAX_ADDRESS_LENGTH,
  FIELD_NAME,
  FIELD_PHONE,
  FIELD_EMAIL,
  FIELD_ADDRESS,
  FIELD_CATEGORY,
  ContactValidation,
  ContactMapper,
  ContactMetrics,
  ContactSnapshot,
  StoreDouble,
  CursorResultSet,
  readContactsFromResultSet,
  expectedAfterUpdate,
  expectedAfterDelete,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  sameStringArray,
  countOf,
  joined,
  isDigitsOnly,
  hasEmailShape,
  resetContactManager,
  RouteRequest,
  SearchEngine,
  snapshotsOf,
  sameSnapshotArray
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

export default function editContactEndToEndTest(): void {
  describe('EditContactEndToEnd', () => {
    const store: StoreDouble = new StoreDouble();

    beforeAll(() => {
      logSuite('EditContactEndToEnd', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      store.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('EditContactEndToEnd', 'end');
    });

    /**
     * @tc.name   editRouteTargetsTheEditor
     * @tc.desc   The edit action opens AddressBookEdit rather than the list or detail page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('editRouteTargetsTheEditor', 0, () => {
      const selected = createSeedContacts()[4];
      const request = new RouteRequest(ACTION_EDIT, selected);
      expect(request.url()).assertEqual(ROUTE_EDIT);
      expect(RouteRequest.routeFor(ACTION_EDIT)).assertEqual(ROUTE_EDIT);
      expect(request.toParams().text).assertEqual(ACTION_EDIT);
      expect(request.url() === 'pages/view/AddressBookDetail').assertFalse();
      expect(RouteRequest.isKnownAction(ACTION_EDIT)).assertTrue();
    });

    /**
     * @tc.name   editRequestCarriesTheSelectedContact
     * @tc.desc   The edit request passes the detail row through with all six values unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('editRequestCarriesTheSelectedContact', 0, () => {
      const selected = createSeedContacts()[4];
      const params = new RouteRequest(ACTION_EDIT, selected).toParams();
      const carried = params.data as Contact;
      expect(carried === selected).assertTrue();
      expect(carried.name).assertEqual('本杰明');
      expect(carried.phone).assertEqual('16666666666');
      expect(carried.email).assertEqual('benjieiming@example.com');
      expect(carried.category).assertEqual('B');
      expect(sameContact(carried, selected)).assertTrue();
    });

    /**
     * @tc.name   editRequestDescriptionUsesEditUrl
     * @tc.desc   The descriptor keeps the edit action literal next to the selected name and editor url.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editRequestDescriptionUsesEditUrl', 0, () => {
      const request = new RouteRequest(ACTION_EDIT, contactOf('丹尼尔', '17777777777', 'cameron@example.com',
        '陕西省西安市雁塔区'));
      logStep('editRequestDescriptionUsesEditUrl', request.describe());
      expect(request.describe()).assertEqual('编辑联系人:丹尼尔:' + ROUTE_EDIT);
      expect(request.describe().split(':')[0]).assertEqual(ACTION_EDIT);
      expect(request.describe().endsWith(ROUTE_EDIT)).assertTrue();
      expect(request.describe().indexOf('丹尼尔') > 0).assertTrue();
      expect(request.toParams().text).assertEqual(ACTION_EDIT);
    });

    /**
     * @tc.name   editDraftStartsFromTheSelectedValues
     * @tc.desc   The edit form fields are prefilled from the detail contact before any onChange fires.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('editDraftStartsFromTheSelectedValues', 0, () => {
      const selected = createSeedContacts()[9];
      const draft = cloneContact(selected);
      expect(draft.name).assertEqual(selected.name);
      expect(draft.phone).assertEqual('11111111111');
      expect(draft.email).assertEqual('katrina@example.com');
      expect(draft.address).assertEqual('吉林省长春市朝阳区');
      expect(draft.category).assertEqual('D');
      expect(sameContact(draft, selected)).assertTrue();
      expect(draft === selected).assertFalse();
    });

    /**
     * @tc.name   editDraftAcceptsChangedMutableFields
     * @tc.desc   New phone, email and address pass validation while the name stays unique.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('editDraftAcceptsChangedMutableFields', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const draft = cloneContact(seed[0]);
      draft.phone = '13900001111';
      draft.email = 'aidelian.edit@example.com';
      draft.address = '改后的南京市鼓楼区地址';
      const others: Contact[] = [];
      for (let index = 0; index < seed.length; index++) {
        if (seed[index].name !== draft.name) {
          others.push(seed[index]);
        }
      }
      expect(others.length).assertEqual(14);
      expect(ContactValidation.validate(draft, others).length).assertEqual(0);
      expect(isDigitsOnly(draft.phone)).assertTrue();
      expect(hasEmailShape(draft.email)).assertTrue();
      expect(draft.phone === seed[0].phone).assertFalse();
      expect(draft.name).assertEqual(seed[0].name);
      expect(draft.category).assertEqual(seed[0].category);
    });

    /**
     * @tc.name   editDraftRejectsMalformedEmail
     * @tc.desc   An address without a dotted domain stops the ok button from pushing to the list page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editDraftRejectsMalformedEmail', 0, () => {
      const draft = cloneContact(createSeedContacts()[2]);
      draft.email = 'bella-at-example';
      const errors = ContactValidation.validate(draft, []);
      expect(errors.indexOf('email-malformed') >= 0).assertTrue();
      expect(errors.length).assertEqual(1);
      expect(hasEmailShape(draft.email)).assertFalse();
      draft.email = 'bella@example.com';
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
    });

    /**
     * @tc.name   editDraftRejectsEmptyPhone
     * @tc.desc   Clearing the phone field produces exactly the empty code and blocks submission.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editDraftRejectsEmptyPhone', 0, () => {
      const draft = cloneContact(createSeedContacts()[3]);
      draft.phone = '';
      const errors = ContactValidation.validate(draft, []);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-empty');
      expect(errors.indexOf('phone-not-numeric')).assertEqual(-1);
      expect(ContactValidation.canSubmit(draft, [])).assertFalse();
      draft.phone = '12222222222';
      expect(ContactValidation.canSubmit(draft, [])).assertTrue();
    });

    /**
     * @tc.name   editDraftRejectsNonNumericPhone
     * @tc.desc   A letter typed into the numeric field still fails the digits guard at validation time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editDraftRejectsNonNumericPhone', 0, () => {
      const draft = cloneContact(createSeedContacts()[5]);
      draft.phone = '17777x77777';
      const errors = ContactValidation.validate(draft, []);
      expect(errors.indexOf('phone-not-numeric') >= 0).assertTrue();
      expect(isDigitsOnly(draft.phone)).assertFalse();
      expect(errors.indexOf('phone-empty')).assertEqual(-1);
      draft.phone = '17777777777';
      expect(isDigitsOnly(draft.phone)).assertTrue();
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
    });

    /**
     * @tc.name   editDuplicateNameFlagsAnotherExistingContact
     * @tc.desc   Renaming a draft to another seeded name is rejected with the duplicate code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editDuplicateNameFlagsAnotherExistingContact', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const draft = cloneContact(manager.getContacts()[0]);
      draft.name = '贝拉';
      const errors = ContactValidation.validate(draft, manager.getContacts());
      expect(errors.indexOf('name-duplicate') >= 0).assertTrue();
      expect(ContactValidation.canSubmit(draft, manager.getContacts())).assertFalse();
      expect(ContactValidation.isDuplicateName(manager.getContacts(), '贝拉')).assertTrue();
      expect(ContactValidation.isDuplicateName(manager.getContacts(), '贝拉新')).assertFalse();
    });

    /**
     * @tc.name   editSelfNameIsNotADuplicateWhenExcluded
     * @tc.desc   Validating an edited row against the other rows only keeps its own name acceptable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editSelfNameIsNotADuplicateWhenExcluded', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const draft = cloneContact(seed[6]);
      draft.phone = '13900006666';
      const others: Contact[] = [];
      for (let index = 0; index < seed.length; index++) {
        if (index !== 6) {
          others.push(seed[index]);
        }
      }
      expect(others.length).assertEqual(14);
      expect(ContactValidation.validate(draft, others).length).assertEqual(0);
      expect(ContactValidation.isDuplicateName(others, draft.name)).assertFalse();
      expect(ContactValidation.isDuplicateName(seed, draft.name)).assertTrue();
      expect(draft.category).assertEqual('C');
    });

    /**
     * @tc.name   editStoreUpdatesOnlyMutableFields
     * @tc.desc   The store UPDATE rewrites phone, email and address while name, avatar and category stay.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('editStoreUpdatesOnlyMutableFields', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[8]);
      edited.phone = '13900008888';
      edited.email = 'daniel.edited@example.com';
      edited.address = '改后的雁塔区地址';
      edited.category = 'F';
      edited.avatar = 'other.jpg';
      const affected = store.updateContact(edited);
      expect(affected).assertEqual(1);
      expect(store.rows[8].phone).assertEqual('13900008888');
      expect(store.rows[8].email).assertEqual('daniel.edited@example.com');
      expect(store.rows[8].address).assertEqual('改后的雁塔区地址');
      expect(store.rows[8].name).assertEqual(seed[8].name);
      expect(store.rows[8].category).assertEqual('D');
      expect(store.rows[8].avatar).assertEqual('');
    });

    /**
     * @tc.name   editStoreReportsOneAffectedRow
     * @tc.desc   A unique name update returns one and leaves the other seed rows untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editStoreReportsOneAffectedRow', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[11]);
      edited.phone = '13900001111';
      expect(store.updateContact(edited)).assertEqual(1);
      expect(store.updateCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
      expect(store.rows[10].phone).assertEqual(seed[10].phone);
      expect(store.rows[12].phone).assertEqual(seed[12].phone);
      expect(store.rows[11].phone).assertEqual('13900001111');
    });

    /**
     * @tc.name   editStoreUpdateOnMissingNameAffectsZero
     * @tc.desc   An update for a name that was never inserted reports zero and changes nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editStoreUpdateOnMissingNameAffectsZero', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const stale = contactOf('曾经存在', '13900001111', 'stale@example.com', '过期地址');
      expect(store.updateContact(stale)).assertEqual(0);
      expect(store.updateCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
      expect(sameStringArray(store.names(), contactNames(seed))).assertTrue();
      expect(sameContact(store.rows[0], seed[0])).assertTrue();
    });

    /**
     * @tc.name   editManagerReplacesFirstMatchingRowOnly
     * @tc.desc   With two rows sharing a name, the manager replaces the first and keeps the second.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editManagerReplacesFirstMatchingRowOnly', 0, () => {
      const manager = ContactManager.getInstance();
      const first = contactOf('同名', '13500001111', 'first@example.com', '甲地', '', 'A');
      const second = contactOf('同名', '13500002222', 'second@example.com', '乙地', '', 'B');
      manager.setContacts([first, second]);
      const edited = contactOf('同名', '13900009999', 'edited@example.com', '改后地', '', 'C');
      manager.updateContact(edited);
      const actual = manager.getContacts();
      expect(actual[0].phone).assertEqual('13900009999');
      expect(actual[0].category).assertEqual('C');
      expect(actual[1].phone).assertEqual('13500002222');
      expect(actual[1].category).assertEqual('B');
      expect(sameContact(actual[1], second)).assertTrue();
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.name   editManagerReplacesWholeRowIncludingCategory
     * @tc.desc   The singleton stores the edited object itself, so category and avatar follow the draft.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editManagerReplacesWholeRowIncludingCategory', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const edited = cloneContact(seed[1]);
      edited.category = 'F';
      edited.avatar = 'operate_rdb_in_taskpool_photo1.jpg';
      edited.phone = '13900002222';
      manager.updateContact(edited);
      const actual = manager.getContacts();
      expect(actual[1].category).assertEqual('F');
      expect(actual[1].avatar).assertEqual('operate_rdb_in_taskpool_photo1.jpg');
      expect(actual[1].phone).assertEqual('13900002222');
      expect(actual[1].name).assertEqual(seed[1].name);
      expect(sameSnapshotArray(snapshotsOf(actual), snapshotsOf(expectedAfterUpdate(seed, edited)))).assertTrue();
    });

    /**
     * @tc.name   editDetailRefreshShowsNewValues
     * @tc.desc   Re-reading the edited contact for the detail page returns the new phone, email and address.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editDetailRefreshShowsNewValues', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[13]);
      edited.phone = '13900003333';
      edited.email = 'fabian.edited@example.com';
      edited.address = '改后的沈阳市地址';
      manager.updateContact(edited);
      store.updateContact(edited);
      const detail = manager.getContacts()[13];
      expect(detail.phone).assertEqual('13900003333');
      expect(detail.email).assertEqual('fabian.edited@example.com');
      expect(detail.address).assertEqual('改后的沈阳市地址');
      expect(detail.name).assertEqual(seed[13].name);
      expect(store.rows[13].phone).assertEqual('13900003333');
      expect(store.rows[13].email).assertEqual('fabian.edited@example.com');
    });

    /**
     * @tc.name   editSnapshotDiffersOnlyOnMutableFields
     * @tc.desc   Comparing before and after snapshots isolates the three changed columns and nothing else.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editSnapshotDiffersOnlyOnMutableFields', 0, () => {
      const seed = createSeedContacts();
      const before = new ContactSnapshot(seed[4]);
      const edited = cloneContact(seed[4]);
      edited.phone = '13900004444';
      edited.email = 'ben.edited@example.com';
      edited.address = '改后的成都地址';
      const after = new ContactSnapshot(edited);
      expect(before.sameAs(after)).assertFalse();
      expect(before.name).assertEqual(after.name);
      expect(before.category).assertEqual(after.category);
      expect(before.phone === after.phone).assertFalse();
      expect(before.email === after.email).assertFalse();
      expect(before.address === after.address).assertFalse();
      expect(before.describe() === after.describe()).assertFalse();
    });

    /**
     * @tc.name   editSearchStillFindsTheContactByName
     * @tc.desc   An edit keeps the name, so the list search still returns exactly that row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editSearchStillFindsTheContactByName', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const edited = cloneContact(manager.getContacts()[5]);
      edited.phone = '13900005555';
      manager.updateContact(edited);
      const found = SearchEngine.filterByName(manager.getContacts(), edited.name);
      expect(found.length).assertEqual(1);
      expect(found[0].phone).assertEqual('13900005555');
      expect(SearchEngine.filterByName(manager.getContacts(), '卡梅').length).assertEqual(1);
      expect(SearchEngine.filterByName(manager.getContacts(), '卡梅隆新').length).assertEqual(0);
      expect(manager.getContacts()[5].phone).assertEqual('13900005555');
    });

    /**
     * @tc.name   editMetricsPhoneDigitsGrowWithLongerPhone
     * @tc.desc   Replacing an eleven digit phone with twelve digits raises the total by one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editMetricsPhoneDigitsGrowWithLongerPhone', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const before = ContactMetrics.from(manager.getContacts());
      const edited = cloneContact(seed[2]);
      edited.phone = '111111111112';
      manager.updateContact(edited);
      const after = ContactMetrics.from(manager.getContacts());
      expect(edited.phone.length).assertEqual(12);
      expect(before.totalPhoneDigits).assertEqual(165);
      expect(after.totalPhoneDigits).assertEqual(166);
      expect(after.total).assertEqual(before.total);
      expect(after.fingerprint() === before.fingerprint()).assertFalse();
    });

    /**
     * @tc.name   editManagerCountStaysTheSame
     * @tc.desc   A replacement is not an append: the directory keeps its row count and unique names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editManagerCountStaysTheSame', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const edited = cloneContact(manager.getContacts()[10]);
      edited.phone = '13900001010';
      edited.email = 'aideng.edited@example.com';
      manager.updateContact(edited);
      expect(manager.getContacts().length).assertEqual(15);
      expect(ContactMetrics.from(manager.getContacts()).uniqueNames).assertEqual(15);
      expect(countOf(contactNames(manager.getContacts()), edited.name)).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(15);
      expect(ContactMetrics.from(manager.getContacts()).duplicateNames).assertEqual(0);
    });

    /**
     * @tc.name   editPhoneBoundaryAcceptsTwelveDigits
     * @tc.desc   A twelve digit phone is the longest accepted value, while thirteen digits fail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editPhoneBoundaryAcceptsTwelveDigits', 0, () => {
      const draft = cloneContact(createSeedContacts()[0]);
      draft.phone = '138001380001';
      expect(draft.phone.length).assertEqual(MAX_PHONE_LENGTH);
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
      draft.phone = '1380013800012';
      expect(draft.phone.length).assertEqual(MAX_PHONE_LENGTH + 1);
      expect(ContactValidation.validate(draft, []).indexOf('phone-too-long') >= 0).assertTrue();
      expect(ContactValidation.canSubmit(draft, [])).assertFalse();
    });

    /**
     * @tc.name   editEmailBoundaryAcceptsTwentyFiveChars
     * @tc.desc   The email column stops at twenty-five characters and still requires a dotted domain.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editEmailBoundaryAcceptsTwentyFiveChars', 0, () => {
      const draft = cloneContact(createSeedContacts()[3]);
      draft.email = 'abcdefghijklmn@example.co';
      expect(draft.email.length).assertEqual(MAX_EMAIL_LENGTH);
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
      draft.email = 'abcdefghijklmno@example.co';
      expect(draft.email.length).assertEqual(MAX_EMAIL_LENGTH + 1);
      expect(ContactValidation.validate(draft, []).indexOf('email-too-long') >= 0).assertTrue();
      expect(hasEmailShape(draft.email)).assertTrue();
    });

    /**
     * @tc.name   editAddressBoundaryAcceptsOneHundredChars
     * @tc.desc   The address field accepts one hundred characters and rejects one hundred one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editAddressBoundaryAcceptsOneHundredChars', 0, () => {
      const draft = cloneContact(createSeedContacts()[7]);
      let longAddress = '';
      for (let index = 0; index < 100; index++) {
        longAddress = longAddress + '街';
      }
      draft.address = longAddress;
      expect(draft.address.length).assertEqual(MAX_ADDRESS_LENGTH);
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
      draft.address = longAddress + '道';
      expect(draft.address.length).assertEqual(101);
      expect(ContactValidation.validate(draft, []).indexOf('address-too-long') >= 0).assertTrue();
      expect(draft.address.length > MAX_ADDRESS_LENGTH).assertTrue();
    });

    /**
     * @tc.name   editEmptyNameIsRejected
     * @tc.desc   Clearing the name field fails validation with the empty code before the duplicate check.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editEmptyNameIsRejected', 0, () => {
      const draft = cloneContact(createSeedContacts()[6]);
      draft.name = '';
      const errors = ContactValidation.validate(draft, createSeedContacts());
      expect(errors[0]).assertEqual('name-empty');
      expect(errors.indexOf('name-duplicate')).assertEqual(-1);
      expect(errors.length).assertEqual(1);
      expect(ContactValidation.canSubmit(draft, createSeedContacts())).assertFalse();
      draft.name = createSeedContacts()[6].name;
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
      expect(draft.name.length > 0).assertTrue();
    });

    /**
     * @tc.name   editOverlongNameIsRejected
     * @tc.desc   A name longer than twelve characters fails even when every other field is valid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editOverlongNameIsRejected', 0, () => {
      const draft = cloneContact(createSeedContacts()[8]);
      draft.name = '一二三四五六七八九十十一十';
      expect(draft.name.length).assertEqual(13);
      const errors = ContactValidation.validate(draft, []);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-too-long');
      draft.name = '一二三四五六七八九十十一';
      expect(draft.name.length).assertEqual(12);
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
    });

    /**
     * @tc.name   editDeleteAfterEditRemovesTheRow
     * @tc.desc   A contact edited and then deleted is gone from both layers, with no stale copy left.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editDeleteAfterEditRemovesTheRow', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[12]);
      edited.phone = '13900001212';
      manager.updateContact(edited);
      store.updateContact(edited);
      manager.deleteContact(edited);
      store.deleteByName(edited.name);
      expect(manager.getContacts().length).assertEqual(14);
      expect(store.rowCount()).assertEqual(14);
      expect(contactNames(manager.getContacts()).indexOf(edited.name)).assertEqual(-1);
      expect(store.names().indexOf(edited.name)).assertEqual(-1);
      expect(SearchEngine.filterByName(manager.getContacts(), edited.name).length).assertEqual(0);
    });

    /**
     * @tc.name   editTwoSequentialEditsKeepTheLastValue
     * @tc.desc   A second edit of the same row replaces the first, so only the latest phone survives.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editTwoSequentialEditsKeepTheLastValue', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const first = cloneContact(seed[0]);
      first.phone = '13900000001';
      manager.updateContact(first);
      expect(manager.getContacts()[0].phone).assertEqual('13900000001');
      const second = cloneContact(seed[0]);
      second.phone = '13900000002';
      second.email = 'second@example.com';
      manager.updateContact(second);
      expect(manager.getContacts()[0].phone).assertEqual('13900000002');
      expect(manager.getContacts()[0].email).assertEqual('second@example.com');
      expect(manager.getContacts().length).assertEqual(15);
      expect(countOf(contactNames(manager.getContacts()), second.name)).assertEqual(1);
    });

    /**
     * @tc.name   editManagerAndStoreAgreeOnMutableFields
     * @tc.desc   After the same edit both layers expose identical phone, email and address values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editManagerAndStoreAgreeOnMutableFields', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[10]);
      edited.phone = '13900004040';
      edited.email = 'aideng.shared@example.com';
      edited.address = '双向一致的地址';
      manager.updateContact(edited);
      store.updateContact(edited);
      expect(manager.getContacts()[10].phone).assertEqual(store.rows[10].phone);
      expect(manager.getContacts()[10].email).assertEqual(store.rows[10].email);
      expect(manager.getContacts()[10].address).assertEqual(store.rows[10].address);
      expect(manager.getContacts()[10].name).assertEqual(store.rows[10].name);
      expect(sameContact(manager.getContacts()[10], store.rows[10])).assertTrue();
      expect(ContactMetrics.from(manager.getContacts()).totalPhoneDigits)
        .assertEqual(ContactMetrics.from(store.rows).totalPhoneDigits);
    });

    /**
     * @tc.name   editProjectionShowsEditedValues
     * @tc.desc   The cursor projection of the store contains the edited row with the new mutable values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editProjectionShowsEditedValues', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[2]);
      edited.phone = '13900002020';
      edited.email = 'bella.edited@example.com';
      store.updateContact(edited);
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(visible.length).assertEqual(14);
      expect(visible[1].name).assertEqual(seed[2].name);
      expect(visible[1].phone).assertEqual('13900002020');
      expect(visible[1].email).assertEqual('bella.edited@example.com');
      expect(visible[0].phone).assertEqual(seed[1].phone);
    });

    /**
     * @tc.name   editStoreCategoryCountsStayUnchanged
     * @tc.desc   A store edit never moves rows between labels, so every count is the seeded value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editStoreCategoryCountsStayUnchanged', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[5]);
      edited.phone = '13900005050';
      edited.category = 'A';
      store.updateContact(edited);
      expect(SearchEngine.countCategory(store.rows, 'A')).assertEqual(2);
      expect(SearchEngine.countCategory(store.rows, 'B')).assertEqual(3);
      expect(SearchEngine.countCategory(store.rows, 'C')).assertEqual(3);
      expect(SearchEngine.groupByCategory(store.rows).length).assertEqual(6);
      expect(ContactMetrics.from(store.rows).categories).assertEqual(6);
      expect(store.rows[5].category).assertEqual('C');
    });

    /**
     * @tc.name   editFullJourneyDetailSnapshotFinal
     * @tc.desc   Select, edit, validate, store update, manager update and refresh produce one expected snapshot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('editFullJourneyDetailSnapshotFinal', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const request = new RouteRequest(ACTION_EDIT, seed[12]);
      const draft = cloneContact(request.toParams().data as Contact);
      draft.phone = '13900007070';
      draft.email = 'airi.edited@example.com';
      draft.address = '最终编辑地址';
      expect(ContactValidation.validate(draft, expectedAfterDelete(seed, draft.name)).length).assertEqual(0);
      store.updateContact(draft);
      manager.updateContact(draft);
      const detail = manager.getContacts()[12];
      const expected = expectedAfterUpdate(seed, draft);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(expected))).assertTrue();
      expect(detail.phone).assertEqual('13900007070');
      expect(detail.email).assertEqual('airi.edited@example.com');
      expect(detail.address).assertEqual('最终编辑地址');
      expect(detail.name).assertEqual(seed[12].name);
      expect(store.rows[12].phone).assertEqual('13900007070');
    });

    /**
     * @tc.name   editBucketRoundTripCarriesTheEdits
     * @tc.desc   The edited draft survives a mapper round trip, so the bucket path sees the new values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editBucketRoundTripCarriesTheEdits', 0, () => {
      const edited = cloneContact(createSeedContacts()[4]);
      edited.phone = '13900009090';
      edited.email = 'ben.bucket@example.com';
      edited.address = '桶往返地址';
      const bucket = ContactMapper.toBucket(edited);
      expect(bucket.get(FIELD_PHONE)).assertEqual('13900009090');
      expect(bucket.get(FIELD_EMAIL)).assertEqual('ben.bucket@example.com');
      expect(bucket.get(FIELD_ADDRESS)).assertEqual('桶往返地址');
      expect(bucket.get(FIELD_NAME)).assertEqual(edited.name);
      expect(bucket.get(FIELD_CATEGORY)).assertEqual('B');
      const restored = ContactMapper.fromBucket(bucket);
      expect(sameContact(restored, edited)).assertTrue();
      expect(bucket.size()).assertEqual(6);
    });

    /**
     * @tc.name   editDoesNotReorderRows
     * @tc.desc   Updating a middle row keeps every other row in its original slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editDoesNotReorderRows', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const edited = cloneContact(seed[7]);
      edited.phone = '13900008080';
      manager.updateContact(edited);
      expect(sameStringArray(contactNames(manager.getContacts()), contactNames(seed))).assertTrue();
      expect(manager.getContacts()[6].name).assertEqual(seed[6].name);
      expect(manager.getContacts()[8].name).assertEqual(seed[8].name);
      expect(manager.getContacts()[7].phone).assertEqual('13900008080');
      expect(manager.getContacts()[7].name).assertEqual(seed[7].name);
    });

    /**
     * @tc.name   editStoreCounterOnlyTicksUpdate
     * @tc.desc   A single edit raises updateCalls by one and leaves batch, insert, delete and query alone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editStoreCounterOnlyTicksUpdate', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[0]);
      edited.phone = '13900001000';
      store.updateContact(edited);
      expect(store.updateCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(15);
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   editManagerStoresTheEditedDraftReference
     * @tc.desc   The first matching slot holds the exact object passed to updateContact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('editManagerStoresTheEditedDraftReference', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const edited = cloneContact(seed[9]);
      edited.phone = '13900006060';
      manager.updateContact(edited);
      expect(manager.getContacts()[9] === edited).assertTrue();
      expect(manager.getContacts()[9] === seed[9]).assertFalse();
      expect(manager.getContacts()[9].phone).assertEqual('13900006060');
      expect(manager.getContacts().length).assertEqual(15);
      expect(countOf(contactNames(manager.getContacts()), edited.name)).assertEqual(1);
    });

    /**
     * @tc.name   editValidationIsRepeatableAndStateless
     * @tc.desc   Validating the same draft twice returns the same error list without retaining state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EditContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editValidationIsRepeatableAndStateless', 0, () => {
      const draft = cloneContact(createSeedContacts()[1]);
      draft.phone = '';
      draft.email = 'bad';
      const first = ContactValidation.validate(draft, []);
      const second = ContactValidation.validate(draft, []);
      expect(first.length).assertEqual(2);
      expect(joined(first, ',')).assertEqual(joined(second, ','));
      expect(first[0]).assertEqual('phone-empty');
      expect(first[1]).assertEqual('email-malformed');
      expect(sameStringArray(first, second)).assertTrue();
      draft.phone = '16666666666';
      draft.email = 'arnold@example.com';
      expect(ContactValidation.validate(draft, []).length).assertEqual(0);
      expect(ContactValidation.canSubmit(draft, [])).assertTrue();
      expect(draft.phone.length).assertEqual(11);
      expect(hasEmailShape(draft.email)).assertTrue();
      expect(isDigitsOnly(draft.phone)).assertTrue();
      expect(draft.name).assertEqual('阿诺德');
      expect(draft.category).assertEqual('A');
      expect(ContactValidation.validate(draft, createSeedContacts()).indexOf('name-duplicate') >= 0)
        .assertTrue();
      expect(ContactMetrics.from([draft]).total).assertEqual(1);
      expect(draft.name.length).assertEqual(3);
      expect(ContactValidation.isDuplicateName([], draft.name)).assertFalse();
    });
  });
}
