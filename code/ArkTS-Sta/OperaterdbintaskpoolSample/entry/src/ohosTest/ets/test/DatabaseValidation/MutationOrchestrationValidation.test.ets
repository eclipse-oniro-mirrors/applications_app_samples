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
 * MutationOrchestrationValidation covers the three write paths of the sample
 * store: insert, update and delete.
 *
 * Production anchors:
 *   DatabaseConnection.ets:187-221  insertData maps six fields and calls insert with
 *                                   ON_CONFLICT_REPLACE
 *   DatabaseConnection.ets:226-236  deleteData executes DELETE by name with one
 *                                   bound parameter
 *   DatabaseConnection.ets:241-272  updateData executes an UPDATE that reassigns
 *                                   phone, email and address only
 *   DatabaseConnection.ets:251-265  the bucket still carries all six fields
 *   RdbConstant.ets:31-34           table literal used by every statement
 *   ContactManager.ets:51-70        the page level add, update and delete calls
 *
 * StoreDouble keeps the observable effects: insert always appends (the bucket
 * has no id, so replace cannot collapse rows), update rewrites every row whose
 * name matches and delete removes every row with that name.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  StoreDouble,
  createSeedContacts,
  contactOf,
  sameContact,
  contactNames,
  sameStringArray,
  countOf,
  joined,
  resetContactManager,
  CONFLICT_REPLACE,
  CATEGORY_A,
  CATEGORY_F
} from '../Shared/SharedDriver';

export default function mutationOrchestrationValidationTest(): void {
  describe('MutationOrchestrationValidation', () => {
    let store: StoreDouble = new StoreDouble();

    beforeAll(() => {
      logSuite('MutationOrchestrationValidation', 'begin');
    });

    beforeEach(async () => {
      resetContactManager();
      store = new StoreDouble();
      store.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('MutationOrchestrationValidation', 'end');
    });

    /**
     * @tc.name   insertAppendsRowToEmptyStore
     * @tc.desc   The first single insert opens the store, writes one row and reports a row
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            identifier of one.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('insertAppendsRowToEmptyStore', 0, () => {
      const contact: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road');
      const rowId: number = store.insert(true, contact, CONFLICT_REPLACE);
      expect(rowId).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
      expect(store.insertCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(sameContact(store.rows[0], contact)).assertTrue();
      expect(store.names()[0]).assertEqual('Ada Lovelace');
      expect(store.rows[0].category).assertEqual('');
      expect(store.rows[0].avatar).assertEqual('');
      expect(store.rows[0].address).assertEqual('River Road');
      expect(store.batchCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
    });

    /**
     * @tc.name   insertAppendsAfterExistingRows
     * @tc.desc   A later insert is appended after the seeded rows rather than replacing or
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            sorting them.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('insertAppendsAfterExistingRows', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 3);
      store.batchInsert(true, seed);
      const added: Contact = contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane');
      const rowId: number = store.insert(true, added, CONFLICT_REPLACE);
      expect(rowId).assertEqual(4);
      expect(store.rowCount()).assertEqual(4);
      expect(store.names()[3]).assertEqual('Grace Hopper');
      expect(sameStringArray(store.names(), ['艾德里安', '阿诺德', '贝拉', 'Grace Hopper'])).assertTrue();
      expect(store.insertCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
    });

    /**
     * @tc.name   insertInvalidContextReturnsMinusOne
     * @tc.desc   A single insert with a rejected context reports -1 and stores no row because
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the store never opens.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('insertInvalidContextReturnsMinusOne', 0, () => {
      const contact: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road');
      const rowId: number = store.insert(false, contact, CONFLICT_REPLACE);
      expect(rowId).assertEqual(-1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.insertCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.initialized).assertFalse();
      expect(store.lastContextValid).assertFalse();
      expect(store.createTableCalls).assertEqual(0);
      expect(store.rows.length).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
    });

    /**
     * @tc.name   insertReplaceConflictReturnsGrowingRowTotals
     * @tc.desc   Every insert reports the running row total, so three inserts report one, two
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            and three and no row is collapsed by the replace strategy.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertReplaceConflictReturnsGrowingRowTotals', 0, () => {
      const names: string[] = ['Ada Lovelace', 'Grace Hopper', 'Alan Turing'];
      const ids: number[] = [];
      for (let index = 0; index < names.length; index++) {
        ids.push(store.insert(true,
          contactOf(names[index], '1380013800' + String(index), names[index] + '@example.com', 'Road'),
          CONFLICT_REPLACE));
      }
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(1);
      expect(ids[1]).assertEqual(2);
      expect(ids[2]).assertEqual(3);
      expect(store.rowCount()).assertEqual(3);
      expect(store.insertCalls).assertEqual(3);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   insertCounterAccumulatesPerCall
     * @tc.desc   Four inserts through the same handle count four calls behind one table
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            creation and keep the submission order.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertCounterAccumulatesPerCall', 0, () => {
      const contacts: Contact[] = [
        contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane'),
        contactOf('Alan Turing', '13700137000', 'alan@example.com', 'Bletchley Park'),
        contactOf('Mira Patel', '13000130000', 'mira@example.com', 'Middle Road')
      ];
      for (let index = 0; index < contacts.length; index++) {
        store.insert(true, contacts[index], CONFLICT_REPLACE);
      }
      expect(store.insertCalls).assertEqual(4);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(4);
      expect(sameStringArray(store.names(), contactNames(contacts))).assertTrue();
      expect(joined(store.names(), ';')).assertEqual('Ada Lovelace;Grace Hopper;Alan Turing;Mira Patel');
    });

    /**
     * @tc.name   insertStoresACopyOfTheSourceContact
     * @tc.desc   The inserted row does not alias the caller contact, so editing the source
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            afterwards leaves the stored row unchanged.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertStoresACopyOfTheSourceContact', 0, () => {
      const contact: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road',
        'a.png', CATEGORY_A);
      store.insert(true, contact, CONFLICT_REPLACE);
      contact.name = 'Renamed';
      contact.phone = '10000000000';
      contact.category = CATEGORY_F;
      expect(store.rows[0].name).assertEqual('Ada Lovelace');
      expect(store.rows[0].phone).assertEqual('13800138000');
      expect(store.rows[0].category).assertEqual(CATEGORY_A);
      expect(sameContact(store.rows[0], contact)).assertFalse();
      expect(store.rowCount()).assertEqual(1);
    });

    /**
     * @tc.name   insertSameNameTwiceKeepsBothRows
     * @tc.desc   ON_CONFLICT_REPLACE cannot collapse two inserts of the same name because the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            bucket carries no id, so both rows stay visible.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('insertSameNameTwiceKeepsBothRows', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      store.insert(true, contactOf('Ada Lovelace', '13800138001', 'ada.work@example.com', 'Office Road'),
        CONFLICT_REPLACE);
      expect(store.rowCount()).assertEqual(2);
      expect(countOf(store.names(), 'Ada Lovelace')).assertEqual(2);
      expect(store.rows[0].phone).assertEqual('13800138000');
      expect(store.rows[1].phone).assertEqual('13800138001');
      expect(store.insertCalls).assertEqual(2);
      expect(store.rows[0].email === store.rows[1].email).assertFalse();
    });

    /**
     * @tc.name   updateChangesOnlyPhoneEmailAddress
     * @tc.desc   The update statement reassigns exactly three columns, so the name, avatar and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            category of the stored row survive an update.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('updateChangesOnlyPhoneEmailAddress', 0, () => {
      const seed: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road',
        'avatar.png', CATEGORY_A);
      store.insert(true, seed, CONFLICT_REPLACE);
      const affected: number = store.updateContact(
        contactOf('Ada Lovelace', '19999999999', 'new@example.com', 'New Address', 'other.png', CATEGORY_F));
      expect(affected).assertEqual(1);
      const row: Contact = store.rows[0];
      expect(row.phone).assertEqual('19999999999');
      expect(row.email).assertEqual('new@example.com');
      expect(row.address).assertEqual('New Address');
      expect(row.name).assertEqual('Ada Lovelace');
      expect(row.avatar).assertEqual('avatar.png');
      expect(row.category).assertEqual(CATEGORY_A);
    });

    /**
     * @tc.name   updateMatchesEveryRowWithSameName
     * @tc.desc   Two rows sharing a name are both rewritten by one update call, which reports
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            an affected count of two.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateMatchesEveryRowWithSameName', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      store.insert(true, contactOf('Ada Lovelace', '13800138001', 'ada.work@example.com', 'Office Road'),
        CONFLICT_REPLACE);
      const affected: number = store.updateContact(
        contactOf('Ada Lovelace', '19999999999', 'merged@example.com', 'Merged Road'));
      expect(affected).assertEqual(2);
      expect(store.rows[0].phone).assertEqual('19999999999');
      expect(store.rows[1].phone).assertEqual('19999999999');
      expect(store.rows[0].email).assertEqual('merged@example.com');
      expect(store.rows[1].address).assertEqual('Merged Road');
      expect(store.rowCount()).assertEqual(2);
      expect(store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   updateReturnsZeroForUnknownName
     * @tc.desc   An update whose name matches no row reports zero affected rows and leaves the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            stored payload untouched.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('updateReturnsZeroForUnknownName', 0, () => {
      const seed: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road');
      store.insert(true, seed, CONFLICT_REPLACE);
      const affected: number = store.updateContact(
        contactOf('Nobody Known', '19999999999', 'ghost@example.com', 'Ghost Road'));
      expect(affected).assertEqual(0);
      expect(store.rowCount()).assertEqual(1);
      expect(store.rows[0].phone).assertEqual('13800138000');
      expect(store.rows[0].email).assertEqual('ada@example.com');
      expect(store.rows[0].address).assertEqual('River Road');
      expect(sameContact(store.rows[0], seed)).assertTrue();
    });

    /**
     * @tc.name   updateDoesNotAppendOrRemoveRows
     * @tc.desc   The row array keeps its length and order through an update, so the write is a
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            pure in-place reassignment of the matched row.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateDoesNotAppendOrRemoveRows', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 4);
      store.batchInsert(true, seed);
      const namesBefore: string[] = store.names();
      const affected: number = store.updateContact(
        contactOf(seed[2].name, '19999999999', 'updated@example.com', 'Updated Road'));
      expect(affected).assertEqual(1);
      expect(store.rowCount()).assertEqual(4);
      expect(sameStringArray(store.names(), namesBefore)).assertTrue();
      expect(store.insertCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
      expect(store.rows[2].email).assertEqual('updated@example.com');
    });

    /**
     * @tc.name   updateCounterCountsHitsAndMisses
     * @tc.desc   A missed update and a matching update are both counted, so the counter tracks
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            attempts rather than affected rows.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateCounterCountsHitsAndMisses', 0, () => {
      const seed: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road');
      store.insert(true, seed, CONFLICT_REPLACE);
      const miss: number = store.updateContact(contactOf('Absent Row', '1', 'absent@example.com', 'Nowhere'));
      const hit: number = store.updateContact(
        contactOf('Ada Lovelace', '19999999999', 'hit@example.com', 'Hit Road'));
      expect(miss).assertEqual(0);
      expect(hit).assertEqual(1);
      expect(store.updateCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(1);
      expect(store.rows[0].email).assertEqual('hit@example.com');
      expect(store.insertCalls).assertEqual(1);
    });

    /**
     * @tc.name   updateEmptyNameRowMatchesOnlyEmptyNames
     * @tc.desc   The default Contact has an empty name; an update with an empty name ignores
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            named rows and rewrites only the row stored under the empty name.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('updateEmptyNameRowMatchesOnlyEmptyNames', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      store.insert(true, new Contact(), CONFLICT_REPLACE);
      expect(store.names()[1]).assertEqual('');
      const affected: number = store.updateContact(
        contactOf('', '17777777777', 'blank@example.com', 'Blank Road'));
      expect(affected).assertEqual(1);
      expect(store.rows[0].phone).assertEqual('13800138000');
      expect(store.rows[1].phone).assertEqual('17777777777');
      expect(store.rows[1].email).assertEqual('blank@example.com');
      expect(store.rowCount()).assertEqual(2);
      expect(store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   deleteRemovesEveryRowWithName
     * @tc.desc   One delete call removes both rows stored under the same name and reports the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            removed count as two.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteRemovesEveryRowWithName', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      store.insert(true, contactOf('Ada Lovelace', '13800138001', 'ada.work@example.com', 'Office Road'),
        CONFLICT_REPLACE);
      store.insert(true, contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane'),
        CONFLICT_REPLACE);
      const removed: number = store.deleteByName('Ada Lovelace');
      expect(removed).assertEqual(2);
      expect(store.rowCount()).assertEqual(1);
      expect(store.names()[0]).assertEqual('Grace Hopper');
      expect(countOf(store.names(), 'Ada Lovelace')).assertEqual(0);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(3);
    });

    /**
     * @tc.name   deleteMatchesExactNameOnly
     * @tc.desc   Deleting a short seed name removes only the exact match and keeps the longer
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            name that contains the same characters.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteMatchesExactNameOnly', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const before: number = store.rowCount();
      const removed: number = store.deleteByName('本');
      expect(removed).assertEqual(1);
      expect(store.rowCount()).assertEqual(before - 1);
      expect(store.names().indexOf('本')).assertEqual(-1);
      expect(store.names().indexOf('本杰明') >= 0).assertTrue();
      expect(countOf(store.names(), '本杰明')).assertEqual(1);
      expect(store.deleteCalls).assertEqual(1);
    });

    /**
     * @tc.name   deleteMissingNameReturnsZero
     * @tc.desc   A delete for a name that is not stored reports zero removed and preserves the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            entire row array.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteMissingNameReturnsZero', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 3);
      store.batchInsert(true, seed);
      const removed: number = store.deleteByName('Absent Name');
      expect(removed).assertEqual(0);
      expect(store.rowCount()).assertEqual(3);
      expect(sameStringArray(store.names(), contactNames(seed))).assertTrue();
      expect(store.deleteCalls).assertEqual(1);
      expect(store.rows[0].phone).assertEqual(seed[0].phone);
    });

    /**
     * @tc.name   deletePreservesOrderOfSurvivors
     * @tc.desc   Removing a middle row keeps the relative order of the remaining rows instead
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            of rebuilding the array by identity.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deletePreservesOrderOfSurvivors', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      const removed: number = store.deleteByName('贝拉');
      expect(removed).assertEqual(1);
      expect(store.rowCount()).assertEqual(4);
      expect(sameStringArray(store.names(), ['艾德里安', '阿诺德', '本', '本杰明'])).assertTrue();
      expect(store.names()[1]).assertEqual('阿诺德');
      expect(store.names()[2]).assertEqual('本');
      expect(store.names().indexOf('贝拉')).assertEqual(-1);
    });

    /**
     * @tc.name   deleteLeavesOtherFieldsIntact
     * @tc.desc   Rows that survive the delete keep every field value, including the avatar and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            category columns that the delete statement never mentions.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteLeavesOtherFieldsIntact', 0, () => {
      const survivor: Contact = contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane',
        'grace.png', CATEGORY_F);
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      store.insert(true, survivor, CONFLICT_REPLACE);
      store.deleteByName('Ada Lovelace');
      expect(store.rowCount()).assertEqual(1);
      expect(sameContact(store.rows[0], survivor)).assertTrue();
      expect(store.rows[0].avatar).assertEqual('grace.png');
      expect(store.rows[0].category).assertEqual(CATEGORY_F);
      expect(store.names()[0]).assertEqual('Grace Hopper');
    });

    /**
     * @tc.name   deleteCounterAccumulates
     * @tc.desc   Three delete calls, matching and missing, are all counted behind one store
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            initialization.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteCounterAccumulates', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      expect(store.deleteByName('艾德里安')).assertEqual(1);
      expect(store.deleteByName('Absent Name')).assertEqual(0);
      expect(store.deleteByName('贝拉')).assertEqual(1);
      expect(store.deleteCalls).assertEqual(3);
      expect(store.rowCount()).assertEqual(2);
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(sameStringArray(store.names(), ['阿诺德', '本'])).assertTrue();
    });

    /**
     * @tc.name   deleteAllWhenEveryRowSharesName
     * @tc.desc   When every stored row has the same name one delete empties the store and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            reports a removed count equal to the previous row total.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteAllWhenEveryRowSharesName', 0, () => {
      for (let index = 0; index < 4; index++) {
        store.insert(true,
          contactOf('Twin Row', '1380013800' + String(index), 'twin@example.com', 'Twin Road'),
          CONFLICT_REPLACE);
      }
      expect(store.rowCount()).assertEqual(4);
      const removed: number = store.deleteByName('Twin Row');
      expect(removed).assertEqual(4);
      expect(store.rowCount()).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(store.initialized).assertTrue();
      expect(store.deleteCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(4);
    });

    /**
     * @tc.name   combinedInsertUpdateDeleteSequence
     * @tc.desc   Insert, update and delete on one row leave the store with the edited payload
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            under a single surviving row.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('combinedInsertUpdateDeleteSequence', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      store.insert(true, contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane'),
        CONFLICT_REPLACE);
      expect(store.updateContact(contactOf('Ada Lovelace', '19999999999', 'edited@example.com', 'Edited Road')))
        .assertEqual(1);
      expect(store.deleteByName('Grace Hopper')).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
      expect(store.names()[0]).assertEqual('Ada Lovelace');
      expect(store.rows[0].phone).assertEqual('19999999999');
      expect(store.rows[0].address).assertEqual('Edited Road');
      expect(store.insertCalls).assertEqual(2);
      logStep('MutationOrchestrationValidation', 'sequence rows: ' + String(store.rowCount()));
    });

    /**
     * @tc.name   sequenceCountersStayIndependent
     * @tc.desc   A sequence touching all three write paths advances each counter exactly once
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            and shows a single shared initialization.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sequenceCountersStayIndependent', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      store.updateContact(contactOf('Ada Lovelace', '19999999999', 'edited@example.com', 'Edited Road'));
      store.deleteByName('Absent Name');
      expect(store.insertCalls).assertEqual(1);
      expect(store.updateCalls).assertEqual(1);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
    });

    /**
     * @tc.name   updateThenQueryReflectsMutation
     * @tc.desc   The rows returned by a query after an update carry the new phone, email and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            address values.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateThenQueryReflectsMutation', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      store.updateContact(contactOf('阿诺德', '19999999999', 'arnold.new@example.com', '上海市静安区'));
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(2);
      expect(rows[1].phone).assertEqual('19999999999');
      expect(rows[1].email).assertEqual('arnold.new@example.com');
      expect(rows[1].address).assertEqual('上海市静安区');
      expect(rows[0].phone).assertEqual('13333333333');
      expect(store.queryCalls).assertEqual(1);
      expect(store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   insertThenDeleteLeavesEmptyStore
     * @tc.desc   Inserting a row and deleting it by the same name returns the store to zero
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            rows while both write counters record one call.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertThenDeleteLeavesEmptyStore', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      expect(store.rowCount()).assertEqual(1);
      const removed: number = store.deleteByName('Ada Lovelace');
      expect(removed).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.rows.length).assertEqual(0);
      expect(store.insertCalls).assertEqual(1);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
    });

    /**
     * @tc.name   mutationOnTwoStoresIsIsolated
     * @tc.desc   Writes applied to one store do not leak into a second store, so each row array
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            and each counter belongs to its own instance.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mutationOnTwoStoresIsIsolated', 0, () => {
      const second: StoreDouble = new StoreDouble();
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      second.insert(true, contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane'),
        CONFLICT_REPLACE);
      store.deleteByName('Ada Lovelace');
      expect(store.rowCount()).assertEqual(0);
      expect(second.rowCount()).assertEqual(1);
      expect(second.names()[0]).assertEqual('Grace Hopper');
      expect(store.deleteCalls).assertEqual(1);
      expect(second.deleteCalls).assertEqual(0);
      expect(second.insertCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(1);
    });

    /**
     * @tc.name   deleteThenInsertSameNameRestoresOneRow
     * @tc.desc   Deleting a name and inserting it again leaves exactly one row with the new
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            payload, so the delete is not undone by a stale copy.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteThenInsertSameNameRestoresOneRow', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      expect(store.deleteByName('Ada Lovelace')).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      store.insert(true, contactOf('Ada Lovelace', '19999999999', 'fresh@example.com', 'Fresh Road'),
        CONFLICT_REPLACE);
      expect(store.rowCount()).assertEqual(1);
      expect(store.rows[0].phone).assertEqual('19999999999');
      expect(store.rows[0].email).assertEqual('fresh@example.com');
      expect(store.insertCalls).assertEqual(2);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.updateCalls).assertEqual(0);
    });

    /**
     * @tc.name   updateEverySeedRowKeepsNamesStable
     * @tc.desc   Updating all fifteen seeded rows touches each row once, keeps every name in
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            place and rewrites only the mutable columns.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateEverySeedRowKeepsNamesStable', 0, () => {
      const seed: Contact[] = createSeedContacts();
      store.batchInsert(true, seed);
      const namesBefore: string[] = store.names();
      let affectedTotal: number = 0;
      for (let index = 0; index < seed.length; index++) {
        const affected: number = store.updateContact(
          contactOf(seed[index].name, '19999999999', 'bulk@example.com', 'Bulk Road'));
        affectedTotal = affectedTotal + affected;
      }
      expect(affectedTotal).assertEqual(15);
      expect(store.updateCalls).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(sameStringArray(store.names(), namesBefore)).assertTrue();
      expect(store.rows[14].phone).assertEqual('19999999999');
      expect(store.rows[0].email).assertEqual('bulk@example.com');
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   deleteEverySeedNameEmptiesStore
     * @tc.desc   Deleting each distinct seeded name once removes all fifteen rows and leaves a
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            single delete call per name.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteEverySeedNameEmptiesStore', 0, () => {
      const seed: Contact[] = createSeedContacts();
      store.batchInsert(true, seed);
      let removedTotal: number = 0;
      for (let index = 0; index < seed.length; index++) {
        removedTotal = removedTotal + store.deleteByName(seed[index].name);
      }
      expect(removedTotal).assertEqual(15);
      expect(store.rowCount()).assertEqual(0);
      expect(store.deleteCalls).assertEqual(15);
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.query(true).length).assertEqual(0);
    });

    /**
     * @tc.name   mutationAfterDeleteFindsNoRowToUpdate
     * @tc.desc   An update that follows a delete of the same name reports zero affected rows
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            because the target row no longer exists.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mutationAfterDeleteFindsNoRowToUpdate', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      store.deleteByName('Ada Lovelace');
      const affected: number = store.updateContact(
        contactOf('Ada Lovelace', '19999999999', 'late@example.com', 'Late Road'));
      expect(affected).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.updateCalls).assertEqual(1);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(1);
      expect(store.rows.length).assertEqual(0);
    });

    /**
     * @tc.name   updateMutatesTheStoredRowInPlace
     * @tc.desc   The update path rewrites the matched row object, so a reference captured
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            before the call observes the new phone as well.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('updateMutatesTheStoredRowInPlace', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      const captured: Contact = store.rows[0];
      const affected: number = store.updateContact(
        contactOf('Ada Lovelace', '19999999999', 'inplace@example.com', 'In Place Road'));
      expect(affected).assertEqual(1);
      expect(captured === store.rows[0]).assertTrue();
      expect(captured.phone).assertEqual('19999999999');
      expect(captured.email).assertEqual('inplace@example.com');
      expect(captured.name).assertEqual('Ada Lovelace');
      expect(store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   insertSameNameAfterUpdateKeepsTwoGenerations
     * @tc.desc   A new insert under an updated name appends a second row, so the store keeps
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the updated generation and the newly inserted one.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('insertSameNameAfterUpdateKeepsTwoGenerations', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      store.updateContact(contactOf('Ada Lovelace', '19999999999', 'first@example.com', 'First Road'));
      store.insert(true, contactOf('Ada Lovelace', '18888888888', 'second@example.com', 'Second Road'),
        CONFLICT_REPLACE);
      expect(store.rowCount()).assertEqual(2);
      expect(store.rows[0].phone).assertEqual('19999999999');
      expect(store.rows[1].phone).assertEqual('18888888888');
      expect(store.rows[0].email).assertEqual('first@example.com');
      expect(store.rows[1].email).assertEqual('second@example.com');
      expect(store.insertCalls).assertEqual(2);
      expect(store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   deleteSubsetOfSeedKeepsSurvivorPayloads
     * @tc.desc   Deleting two seeded names keeps the other thirteen rows byte for byte equal to
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            their seeded payloads.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteSubsetOfSeedKeepsSurvivorPayloads', 0, () => {
      const seed: Contact[] = createSeedContacts();
      store.batchInsert(true, seed);
      store.deleteByName(seed[0].name);
      store.deleteByName(seed[1].name);
      expect(store.rowCount()).assertEqual(13);
      for (let index = 2; index < seed.length; index++) {
        expect(sameContact(store.rows[index - 2], seed[index])).assertTrue();
      }
      expect(store.rows[0].name).assertEqual('贝拉');
      expect(store.rows[12].name).assertEqual('法里');
      expect(store.deleteCalls).assertEqual(2);
    });

    /**
     * @tc.name   batchInsertAfterDeletesRefillsTheStore
     * @tc.desc   After all rows are deleted a batch insert refills the store on the already
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            open handle, so the init counter stays at one.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertAfterDeletesRefillsTheStore', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      store.deleteByName('艾德里安');
      store.deleteByName('阿诺德');
      store.deleteByName('贝拉');
      expect(store.rowCount()).assertEqual(0);
      const written: number = store.batchInsert(true, createSeedContacts().slice(0, 2));
      expect(written).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
      expect(store.batchCalls).assertEqual(2);
      expect(store.deleteCalls).assertEqual(3);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.names()[0]).assertEqual('艾德里安');
    });

    /**
     * @tc.name   mutationSequenceThenResetRestartsCounters
     * @tc.desc   After a full mutation sequence reset returns every write counter to zero and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the next insert runs a fresh initialization.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mutationSequenceThenResetRestartsCounters', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      store.updateContact(contactOf('Ada Lovelace', '19999999999', 'reset@example.com', 'Reset Road'));
      store.deleteByName('Ada Lovelace');
      expect(store.insertCalls).assertEqual(1);
      expect(store.updateCalls).assertEqual(1);
      expect(store.deleteCalls).assertEqual(1);
      store.reset();
      expect(store.insertCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.rowCount()).assertEqual(0);
      const rowId: number = store.insert(true,
        contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane'), CONFLICT_REPLACE);
      expect(rowId).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
    });
    /**
     * @tc.name   deleteWithEmptyNameRemovesBlankRow
     * @tc.desc   A row created from the default Contact carries an empty name and is the only
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MutationOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            row a delete with an empty name may remove.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteWithEmptyNameRemovesBlankRow', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      store.insert(true, new Contact(), CONFLICT_REPLACE);
      expect(store.rowCount()).assertEqual(2);
      const removed: number = store.deleteByName('');
      expect(removed).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
      expect(store.names()[0]).assertEqual('Ada Lovelace');
      expect(store.rows[0].phone).assertEqual('13800138000');
      expect(store.deleteCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(2);
      expect(store.updateCalls).assertEqual(0);
    });
  });
}
