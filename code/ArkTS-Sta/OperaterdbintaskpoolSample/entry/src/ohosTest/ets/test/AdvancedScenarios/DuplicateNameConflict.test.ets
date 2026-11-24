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
 * AdvancedScenarios / DuplicateNameConflict suite.
 *
 * AddressBookEdit blocks a submit when the typed name already exists, but the
 * database layer happily stores duplicates because the bucket carries no id for
 * ON_CONFLICT_REPLACE to collide on. The suite keeps both halves apart: the
 * validation guard, the toast literal, the manager's first-match update, and
 * the store's append-always behaviour.
 *
 * Source anchors:
 *   AddressBookEdit.ets:176-279     duplicate name guard and toast
 *   DatabaseConnection.ets:187-221  insert with ON_CONFLICT_REPLACE
 *   DatabaseConnection.ets:277-309  dedupe by name plus phone
 *   SharedDriver.ets:242-253        isDuplicateName and canSubmit
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  CATEGORY_A,
  CATEGORY_D,
  CATEGORY_E,
  CATEGORY_B,
  CATEGORY_F,
  DUPLICATE_NAME_TOAST,
  createSeedContacts,
  contactOf,
  cloneContact,
  contactNames,
  joined,
  countOf,
  uniqueStrings,
  textFingerprint,
  containsChinese,
  ContactValidation,
  CursorResultSet,
  readContactsFromResultSet,
  StoreDouble,
  SearchEngine,
  ContactMetrics,
  resetContactManager
} from '../Shared/SharedDriver';

export default function duplicateNameConflictTest(): void {
  describe('DuplicateNameConflict', () => {
    beforeAll(() => {
      logSuite('DuplicateNameConflict', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('DuplicateNameConflict', 'end');
    });

    /**
     * @tc.name   validationRejectsSeedName
     * @tc.desc   A fully shaped draft named 贝拉 is rejected only because the seed already holds that name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('validationRejectsSeedName', 0, () => {
      const seed = createSeedContacts();
      const draft = contactOf('贝拉', '13900000009', 'bella.draft@example.com', '天津市和平区', '', CATEGORY_B);
      const errors = ContactValidation.validate(draft, seed);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-duplicate');
      expect(ContactValidation.isDuplicateName(seed, '贝拉')).assertTrue();
      expect(ContactValidation.canSubmit(draft, seed)).assertFalse();
      logStep('duplicateNameConflictTest', 'seed name rejected by the guard');
    });

    /**
     * @tc.name   validationAcceptsFreshName
     * @tc.desc   The same draft shape with an unused name 林岸 produces an empty error list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('validationAcceptsFreshName', 0, () => {
      const seed = createSeedContacts();
      const draft = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', CATEGORY_A);
      const errors = ContactValidation.validate(draft, seed);
      expect(errors.length).assertEqual(0);
      expect(ContactValidation.isDuplicateName(seed, '林岸')).assertFalse();
      expect(ContactValidation.canSubmit(draft, seed)).assertTrue();
      logStep('duplicateNameConflictTest', 'fresh name passes validation');
    });

    /**
     * @tc.name   toastLiteralMatchesSource
     * @tc.desc   The duplicate notification string is the one from AddressBookEdit and carries CJK text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('toastLiteralMatchesSource', 0, () => {
      expect(DUPLICATE_NAME_TOAST).assertEqual('姓名已存在，请重新输入!');
      expect(DUPLICATE_NAME_TOAST.length).assertEqual(12);
      expect(DUPLICATE_NAME_TOAST.endsWith('!')).assertTrue();
      expect(containsChinese(DUPLICATE_NAME_TOAST)).assertTrue();
      expect(DUPLICATE_NAME_TOAST.indexOf('姓名')).assertEqual(0);
      logStep('duplicateNameConflictTest', 'toast literal pinned');
    });

    /**
     * @tc.name   managerEditRewritesFirstDuplicateOnly
     * @tc.desc   With two 贝拉 rows the manager edits index two and leaves the appended twin alone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerEditRewritesFirstDuplicateOnly', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = createSeedContacts();
      rows.push(contactOf('贝拉', '13900000002', 'bella.twin@example.com', '重庆市渝中区', '', CATEGORY_B));
      manager.setContacts(rows);
      expect(countOf(contactNames(manager.getContacts()), '贝拉')).assertEqual(2);
      manager.updateContact(contactOf('贝拉', '13900000003', 'bella.first@example.com', '天津市河西区', '', CATEGORY_B));
      const loaded = manager.getContacts();
      expect(loaded[2].phone).assertEqual('13900000003');
      expect(loaded[15].phone).assertEqual('13900000002');
      expect(loaded[15].address).assertEqual('重庆市渝中区');
      expect(loaded.length).assertEqual(16);
      logStep('duplicateNameConflictTest', 'first duplicate rewritten only');
    });

    /**
     * @tc.name   managerDeleteDropsAllDuplicates
     * @tc.desc   Delete by name removes the seed row and the appended twin in one call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerDeleteDropsAllDuplicates', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = createSeedContacts();
      rows.push(contactOf('贝拉', '13900000004', 'bella.third@example.com', '上海市闵行区', '', CATEGORY_B));
      rows.push(contactOf('贝拉', '13900000005', 'bella.fourth@example.com', '上海市宝山区', '', CATEGORY_B));
      manager.setContacts(rows);
      expect(countOf(contactNames(manager.getContacts()), '贝拉')).assertEqual(3);
      manager.deleteContact(contactOf('贝拉', '', '', '', '', ''));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(14);
      expect(countOf(contactNames(loaded), '贝拉')).assertEqual(0);
      expect(SearchEngine.countCategory(loaded, CATEGORY_B)).assertEqual(2);
      logStep('duplicateNameConflictTest', 'every duplicate removed by name');
    });

    /**
     * @tc.name   storeInsertCannotCollapseDuplicate
     * @tc.desc   ON_CONFLICT_REPLACE keeps both rows because the values bucket never supplies the id column.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeInsertCannotCollapseDuplicate', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.insert(true, contactOf('贝拉', '13900000006', 'bella.a@example.com', '天津市和平区', '', CATEGORY_B),
        'ON_CONFLICT_REPLACE');
      store.insert(true, contactOf('贝拉', '13900000007', 'bella.b@example.com', '天津市和平区', '', CATEGORY_B),
        'ON_CONFLICT_REPLACE');
      expect(store.rowCount()).assertEqual(2);
      expect(countOf(store.names(), '贝拉')).assertEqual(2);
      expect(store.insertCalls).assertEqual(2);
      expect(store.rows[0].phone).assertEqual('13900000006');
      expect(store.rows[1].phone).assertEqual('13900000007');
      logStep('duplicateNameConflictTest', 'store appends duplicates');
    });

    /**
     * @tc.name   duplicateGuardBlocksSubmit
     * @tc.desc   canSubmit stays false across three duplicate drafts while a unique draft passes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('duplicateGuardBlocksSubmit', 0, () => {
      const seed = createSeedContacts();
      const first = contactOf('艾拉', '13000000001', 'ella.a@example.com', '上海市杨浦区', '', CATEGORY_A);
      const second = contactOf('艾拉', '13000000002', 'ella.b@example.com', '上海市虹口区', '', CATEGORY_A);
      const third = contactOf('法里', '13000000003', 'fali.a@example.com', '上海市长宁区', '', CATEGORY_F);
      const unique = contactOf('林岸', '13000000004', 'lin.a@example.com', '上海市普陀区', '', CATEGORY_A);
      expect(ContactValidation.canSubmit(first, seed)).assertFalse();
      expect(ContactValidation.canSubmit(second, seed)).assertFalse();
      expect(ContactValidation.canSubmit(third, seed)).assertFalse();
      expect(ContactValidation.canSubmit(unique, seed)).assertTrue();
      logStep('duplicateNameConflictTest', 'submit gate blocks known names');
    });

    /**
     * @tc.name   duplicateCheckIsCaseSensitive
     * @tc.desc   The guard compares raw strings, so alice and Alice do not collide.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateCheckIsCaseSensitive', 0, () => {
      const rows: Contact[] = [];
      rows.push(contactOf('Alice', '13800138010', 'alice@example.com', '上海市静安区', '', CATEGORY_A));
      expect(ContactValidation.isDuplicateName(rows, 'alice')).assertFalse();
      expect(ContactValidation.isDuplicateName(rows, 'ALICE')).assertFalse();
      expect(ContactValidation.isDuplicateName(rows, 'Alice')).assertTrue();
      const lower = contactOf('alice', '13800138011', 'alice.lower@example.com', '上海市静安区', '', CATEGORY_A);
      expect(ContactValidation.validate(lower, rows).length).assertEqual(0);
      logStep('duplicateNameConflictTest', 'name match is case sensitive');
    });

    /**
     * @tc.name   duplicateDetectionIgnoresPhone
     * @tc.desc   A different phone and email do not clear the duplicate flag when the name repeats.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateDetectionIgnoresPhone', 0, () => {
      const seed = createSeedContacts();
      const draft = contactOf('康纳', '13011112222', 'connor.new@example.com', '辽宁省大连市中山区', '', CATEGORY_A);
      expect(ContactValidation.isDuplicateName(seed, draft.name)).assertTrue();
      const errors = ContactValidation.validate(draft, seed);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-duplicate');
      expect(ContactValidation.canSubmit(draft, seed)).assertFalse();
      logStep('duplicateNameConflictTest', 'phone change does not clear duplicate');
    });

    /**
     * @tc.name   duplicateDetectedAfterIncrementalAdd
     * @tc.desc   A name accepted against the seed becomes a duplicate once the first draft joins the list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateDetectedAfterIncrementalAdd', 0, () => {
      const seed = createSeedContacts();
      const first = contactOf('林岸', '13800138020', 'lin.first@example.com', '上海市徐汇区', '', CATEGORY_A);
      expect(ContactValidation.isDuplicateName(seed, '林岸')).assertFalse();
      const grown = seed.slice();
      grown.push(first);
      expect(ContactValidation.isDuplicateName(grown, '林岸')).assertTrue();
      const second = contactOf('林岸', '13800138021', 'lin.second@example.com', '上海市长宁区', '', CATEGORY_A);
      expect(ContactValidation.canSubmit(second, grown)).assertFalse();
      expect(grown.length).assertEqual(16);
      logStep('duplicateNameConflictTest', 'second add of a name is caught');
    });

    /**
     * @tc.name   duplicateAccumulatesWithShapeErrors
     * @tc.desc   A duplicate name plus a non-numeric phone reports both codes in a fixed order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateAccumulatesWithShapeErrors', 0, () => {
      const seed = createSeedContacts();
      const draft = contactOf('丹尼尔', '177abc', 'daniel.bad@example.com', '陕西省西安市雁塔区', '', CATEGORY_A);
      const errors = ContactValidation.validate(draft, seed);
      expect(errors.length).assertEqual(2);
      expect(errors.indexOf('phone-not-numeric') >= 0).assertTrue();
      expect(errors.indexOf('name-duplicate') >= 0).assertTrue();
      expect(errors[errors.length - 1]).assertEqual('name-duplicate');
      logStep('duplicateNameConflictTest', 'shape and duplicate codes accumulate');
    });

    /**
     * @tc.name   duplicateClearedAfterDelete
     * @tc.desc   Once 卡特琳娜 is deleted the guard accepts a fresh draft with that name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateClearedAfterDelete', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const draft = contactOf('卡特琳娜', '11100002222', 'katrina.fresh@example.com', '吉林省长春市南关区', '', CATEGORY_A);
      expect(ContactValidation.canSubmit(draft, manager.getContacts())).assertFalse();
      manager.deleteContact(contactOf('卡特琳娜', '', '', '', '', ''));
      expect(ContactValidation.canSubmit(draft, manager.getContacts())).assertTrue();
      expect(ContactValidation.isDuplicateName(manager.getContacts(), '卡特琳娜')).assertFalse();
      expect(manager.getContacts().length).assertEqual(14);
      logStep('duplicateNameConflictTest', 'delete clears the duplicate flag');
    });

    /**
     * @tc.name   visibleRowsDedupeByNameAndPhone
     * @tc.desc   The result-set walk collapses two rows with the same name and phone but keeps a different phone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('visibleRowsDedupeByNameAndPhone', 0, () => {
      const rows: Contact[] = [];
      rows.push(contactOf('占位', '10000000000', 'placeholder@example.com', '北京市东城区', '', CATEGORY_A));
      rows.push(contactOf('贝拉', '11111111111', 'bella@example.com', '湖北省武汉市江汉区', '', CATEGORY_B));
      rows.push(contactOf('贝拉', '11111111111', 'bella@example.com', '湖北省武汉市江汉区', '', CATEGORY_B));
      rows.push(contactOf('贝拉', '11111112222', 'bella.alt@example.com', '湖北省武汉市武昌区', '', CATEGORY_B));
      const cursor = new CursorResultSet(rows);
      const visible = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(2);
      expect(countOf(contactNames(visible), '贝拉')).assertEqual(2);
      expect(visible[0].phone).assertEqual('11111111111');
      expect(visible[1].phone).assertEqual('11111112222');
      expect(cursor.closed).assertTrue();
      logStep('duplicateNameConflictTest', 'dedupe key is name plus phone');
    });

    /**
     * @tc.name   fingerprintChangesWithDuplicateRow
     * @tc.desc   Adding a duplicate name lowers the fill ratio and changes the metric fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fingerprintChangesWithDuplicateRow', 0, () => {
      const seed = createSeedContacts();
      const grown = seed.slice();
      grown.push(contactOf('贝拉', '13900000011', 'bella.fp@example.com', '天津市和平区', '', CATEGORY_B));
      const base = ContactMetrics.from(seed);
      const mixed = ContactMetrics.from(grown);
      expect(base.duplicateNames).assertEqual(0);
      expect(mixed.duplicateNames).assertEqual(1);
      expect(mixed.total).assertEqual(16);
      expect(mixed.fingerprint() === base.fingerprint()).assertFalse();
      expect(mixed.fillRatio() < 1).assertTrue();
      logStep('duplicateNameConflictTest', 'duplicate shifts the metrics fingerprint');
    });

    /**
     * @tc.name   managerStateFeedsDuplicateGuard
     * @tc.desc   A duplicate added through the manager makes the guard reject a second submit for that name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerStateFeedsDuplicateGuard', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('苏禾', '13512345678', 'suhe@example.com', '浙江省杭州市西湖区', '', CATEGORY_A));
      const again = contactOf('苏禾', '13512345679', 'suhe2@example.com', '浙江省杭州市滨江区', '', CATEGORY_A);
      expect(ContactValidation.isDuplicateName(manager.getContacts(), '苏禾')).assertTrue();
      expect(ContactValidation.canSubmit(again, manager.getContacts())).assertFalse();
      expect(manager.getContacts().length).assertEqual(16);
      expect(countOf(contactNames(manager.getContacts()), '苏禾')).assertEqual(1);
      logStep('duplicateNameConflictTest', 'manager state drives the guard');
    });

    /**
     * @tc.name   absentNameWithEmptyPhoneReportsOneCode
     * @tc.desc   A unique name keeps the duplicate code out, so only phone-empty is reported.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('absentNameWithEmptyPhoneReportsOneCode', 0, () => {
      const seed = createSeedContacts();
      const draft = contactOf('林岸', '', 'lin@example.com', '上海市徐汇区', '', CATEGORY_A);
      const errors = ContactValidation.validate(draft, seed);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-empty');
      expect(errors.indexOf('name-duplicate')).assertEqual(-1);
      expect(ContactValidation.canSubmit(draft, seed)).assertFalse();
      logStep('duplicateNameConflictTest', 'unique name reports only the empty phone');
    });

    /**
     * @tc.name   duplicateAcrossCategoriesStillFlagged
     * @tc.desc   Grouping is irrelevant to the guard: same name in category A and F still collides.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateAcrossCategoriesStillFlagged', 0, () => {
      const rows: Contact[] = [];
      rows.push(contactOf('沈川', '13700000001', 'shenchuan@example.com', '福建省福州市鼓楼区', '', CATEGORY_A));
      rows.push(contactOf('沈川', '13700000002', 'shenchuan2@example.com', '福建省厦门市思明区', '', CATEGORY_F));
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(2);
      expect(ContactValidation.isDuplicateName(rows, '沈川')).assertTrue();
      const draft = contactOf('沈川', '13700000003', 'shenchuan3@example.com', '福建省泉州市鲤城区', '', CATEGORY_B);
      expect(ContactValidation.canSubmit(draft, rows)).assertFalse();
      expect(rows.length).assertEqual(2);
      logStep('duplicateNameConflictTest', 'categories do not separate names');
    });

    /**
     * @tc.name   deleteThenReAddYieldsSingleRow
     * @tc.desc   Removing both 贝拉 rows and adding one back leaves exactly one row that the guard flags against itself.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteThenReAddYieldsSingleRow', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = createSeedContacts();
      rows.push(contactOf('贝拉', '13900000021', 'bella.extra@example.com', '天津市和平区', '', CATEGORY_B));
      manager.setContacts(rows);
      manager.deleteContact(contactOf('贝拉', '', '', '', '', ''));
      manager.addContact(contactOf('贝拉', '13900000022', 'bella.final@example.com', '天津市南开区', '', CATEGORY_B));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(countOf(contactNames(loaded), '贝拉')).assertEqual(1);
      expect(ContactValidation.isDuplicateName(loaded, '贝拉')).assertTrue();
      expect(ContactValidation.isDuplicateName(loaded.slice(0, 14), '贝拉')).assertFalse();
      logStep('duplicateNameConflictTest', 're-add leaves a single duplicate row');
    });

    /**
     * @tc.name   searchReturnsEveryDuplicateRow
     * @tc.desc   Name filtering keeps both 艾拉 rows and reports their distinct phones in seed order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('searchReturnsEveryDuplicateRow', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf('艾拉', '10099998888', 'ella.twin@example.com', '辽宁省大连市西岗区', '', CATEGORY_E));
      const hits = SearchEngine.filterByName(rows, '艾拉');
      expect(hits.length).assertEqual(2);
      expect(hits[0].phone).assertEqual('10000000000');
      expect(hits[1].phone).assertEqual('10099998888');
      expect(joined(contactNames(hits))).assertEqual('艾拉,艾拉');
      expect(uniqueStrings(contactNames(hits)).length).assertEqual(1);
      logStep('duplicateNameConflictTest', 'search returns both duplicates');
    });

    /**
     * @tc.name   duplicateCountReportedByMetrics
     * @tc.desc   Two extra 贝拉 rows raise duplicateNames to two while uniqueNames stays fifteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('duplicateCountReportedByMetrics', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf('贝拉', '13900000031', 'bella.one@example.com', '天津市和平区', '', CATEGORY_B));
      rows.push(contactOf('贝拉', '13900000032', 'bella.two@example.com', '天津市河西区', '', CATEGORY_B));
      const metrics = ContactMetrics.from(rows);
      expect(metrics.total).assertEqual(17);
      expect(metrics.uniqueNames).assertEqual(15);
      expect(metrics.duplicateNames).assertEqual(2);
      expect(metrics.categories).assertEqual(6);
      expect(metrics.fillRatio() < 1).assertTrue();
      logStep('duplicateNameConflictTest', 'metrics count duplicate rows');
    });

    /**
     * @tc.name   duplicateToastIndependentOfValidationCodes
     * @tc.desc   The toast is a fixed literal, so the guard still reports a code the UI does not print.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('duplicateToastIndependentOfValidationCodes', 0, () => {
      const seed = createSeedContacts();
      const draft = cloneContact(seed[4]);
      const errors = ContactValidation.validate(draft, seed);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-duplicate');
      expect(DUPLICATE_NAME_TOAST.indexOf(errors[0])).assertEqual(-1);
      expect(draft.name).assertEqual('本杰明');
      expect(draft.phone).assertEqual('16666666666');
      logStep('duplicateNameConflictTest', 'toast is decoupled from the code name');
    });

    /**
     * @tc.name   emptyExistingListAcceptsAnyName
     * @tc.desc   With no rows on file the guard reports no duplicate code for any name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyExistingListAcceptsAnyName', 0, () => {
      const rows: Contact[] = [];
      const draft = contactOf('贝拉', '13900000041', 'bella.empty@example.com', '天津市和平区', '', CATEGORY_B);
      expect(ContactValidation.isDuplicateName(rows, '贝拉')).assertFalse();
      expect(ContactValidation.canSubmit(draft, rows)).assertTrue();
      expect(ContactValidation.validate(draft, rows).length).assertEqual(0);
      expect(rows.length).assertEqual(0);
      logStep('duplicateNameConflictTest', 'empty list has no duplicates');
    });

    /**
     * @tc.name   batchKeepsDuplicatesInsideBatch
     * @tc.desc   A batch of three rows carrying the same name writes three rows and reports three.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchKeepsDuplicatesInsideBatch', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const batch: Contact[] = [];
      batch.push(contactOf('洛川', '13620000011', 'luochuan.a@example.com', '河南省郑州市金水区', '', CATEGORY_D));
      batch.push(contactOf('洛川', '13620000012', 'luochuan.b@example.com', '河南省郑州市中原区', '', CATEGORY_D));
      batch.push(contactOf('洛川', '13620000013', 'luochuan.c@example.com', '河南省郑州市二七区', '', CATEGORY_D));
      const written = store.batchInsert(true, batch);
      expect(written).assertEqual(3);
      expect(store.rowCount()).assertEqual(3);
      expect(countOf(store.names(), '洛川')).assertEqual(3);
      expect(store.batchCalls).assertEqual(1);
      logStep('duplicateNameConflictTest', 'batch inserts keep same-name rows');
    });

    /**
     * @tc.name   updateToExistingNameIsNotRenamedByGuard
     * @tc.desc   The manager has no rename path, so an edit keeps the typed name and only rewrites the match.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('updateToExistingNameIsNotRenamedByGuard', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const before = manager.getContacts().length;
      manager.updateContact(contactOf('本', '16600001111', 'ben.edited@example.com', '四川省成都市青羊区', '', CATEGORY_B));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(before);
      expect(loaded[3].name).assertEqual('本');
      expect(loaded[3].phone).assertEqual('16600001111');
      expect(countOf(contactNames(loaded), '本')).assertEqual(1);
      expect(ContactValidation.isDuplicateName(loaded, '本杰明')).assertTrue();
      logStep('duplicateNameConflictTest', 'edit keeps the name key stable');
    });

    /**
     * @tc.name   validationIsSideEffectFree
     * @tc.desc   Running the duplicate guard leaves the draft fields and the existing rows unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameConflict scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('validationIsSideEffectFree', 0, () => {
      const seed = createSeedContacts();
      const draft = contactOf('贝拉', '13900000051', 'bella.pure@example.com', '天津市和平区', '', CATEGORY_B);
      const errors = ContactValidation.validate(draft, seed);
      expect(errors.length).assertEqual(1);
      expect(draft.phone).assertEqual('13900000051');
      expect(draft.category).assertEqual(CATEGORY_B);
      expect(seed.length).assertEqual(15);
      expect(contactNames(seed)[2]).assertEqual('贝拉');
      logStep('duplicateNameConflictTest', 'guard has no side effects');
    });
  });
}
