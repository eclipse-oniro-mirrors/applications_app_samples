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
 * PersistenceConsistencyValidation compares what the store reports with what the
 * page level ContactManager keeps in memory.
 *
 * Production anchors:
 *   ContactManager.ets:41-48   getContacts returns a copy, setContacts copies in
 *   ContactManager.ets:51-53   addContact appends to a new array
 *   ContactManager.ets:56-65   updateContact replaces the first name match
 *   ContactManager.ets:68-70   deleteContact keeps every row with another name
 *   DatabaseConnection.ets:187-221  insertData writes the six column bucket
 *   DatabaseConnection.ets:241-272  updateData rewrites phone, email, address
 *   DatabaseConnection.ets:277-309  result set read plus name and phone dedupe
 *   RdbConstant.ets:33-34      CREATE TABLE column order
 *
 * Snapshots are taken through ContactSnapshot so a mutation can be compared with
 * the payload that existed before it, and the bucket and cursor helpers are used
 * to prove that a row survives a full round trip without losing a column.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  StoreDouble,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  sameStringArray,
  countOf,
  resetContactManager,
  ContactSnapshot,
  snapshotsOf,
  sameSnapshotArray,
  ContactMapper,
  Bucket,
  CursorResultSet,
  readContactsFromResultSet,
  expectedVisibleRows,
  ContactMetrics,
  BUCKET_KEYS,
  FIELD_NAME,
  FIELD_PHONE,
  FIELD_EMAIL,
  FIELD_ADDRESS,
  FIELD_AVATAR,
  FIELD_CATEGORY
} from '../Shared/SharedDriver';

export default function persistenceConsistencyValidationTest(): void {
  describe('PersistenceConsistencyValidation', () => {
    let store: StoreDouble = new StoreDouble();

    beforeAll(() => {
      logSuite('PersistenceConsistencyValidation', 'begin');
    });

    beforeEach(async () => {
      resetContactManager();
      store = new StoreDouble();
      store.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('PersistenceConsistencyValidation', 'end');
    });

    /**
     * @tc.name   snapshotBeforeMutationMatchesInsertedRow
     * @tc.desc   The snapshot taken right after an insert describes the same five visible fields
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            as the contact that was written.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotBeforeMutationMatchesInsertedRow', 0, () => {
      const contact: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road',
        '', 'A');
      store.insert(true, contact, 'ON_CONFLICT_REPLACE');
      const snapshot: ContactSnapshot = new ContactSnapshot(store.rows[0]);
      expect(snapshot.name).assertEqual('Ada Lovelace');
      expect(snapshot.phone).assertEqual('13800138000');
      expect(snapshot.email).assertEqual('ada@example.com');
      expect(snapshot.address).assertEqual('River Road');
      expect(snapshot.category).assertEqual('A');
      expect(snapshot.sameAs(new ContactSnapshot(contact))).assertTrue();
      expect(snapshot.describe().split('/').length).assertEqual(5);
      const stable: ContactSnapshot = new ContactSnapshot(store.rows[0]);
      store.rows[0].phone = '10000000000';
      expect(snapshot.phone).assertEqual('13800138000');
      expect(stable.phone).assertEqual('13800138000');
      expect(store.rows[0].phone).assertEqual('10000000000');
      expect(stable.sameAs(snapshot)).assertTrue();
      expect(snapshot.name).assertEqual('Ada Lovelace');
    });

    /**
     * @tc.name   snapshotAfterUpdateShowsThreeChangedFields
     * @tc.desc   An update moves exactly the phone, email and address fields of the snapshot,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            while name and category remain identical.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotAfterUpdateShowsThreeChangedFields', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road', '', 'A'),
        'ON_CONFLICT_REPLACE');
      const before: ContactSnapshot = new ContactSnapshot(store.rows[0]);
      store.updateContact(contactOf('Ada Lovelace', '19999999999', 'new@example.com', 'New Road'));
      const after: ContactSnapshot = new ContactSnapshot(store.rows[0]);
      expect(before.sameAs(after)).assertFalse();
      expect(before.name).assertEqual(after.name);
      expect(before.category).assertEqual(after.category);
      expect(before.phone === after.phone).assertFalse();
      expect(before.email === after.email).assertFalse();
      expect(before.address === after.address).assertFalse();
      expect(after.phone).assertEqual('19999999999');
    });

    /**
     * @tc.name   snapshotDescribeKeepsFiveSlashFields
     * @tc.desc   The snapshot description joins the five compared fields with slashes, which
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            gives the diff a stable textual form.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotDescribeKeepsFiveSlashFields', 0, () => {
      const contact: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road',
        'ignored.png', 'A');
      const snapshot: ContactSnapshot = new ContactSnapshot(contact);
      expect(snapshot.describe()).assertEqual('Ada Lovelace/13800138000/ada@example.com/River Road/A');
      const parts: string[] = snapshot.describe().split('/');
      expect(parts.length).assertEqual(5);
      expect(parts[0]).assertEqual('Ada Lovelace');
      expect(parts[4]).assertEqual('A');
      expect(snapshot.describe().indexOf('ignored.png')).assertEqual(-1);
    });

    /**
     * @tc.name   snapshotsOfEmptyStoreIsEmpty
     * @tc.desc   An empty row array produces an empty snapshot array that compares equal to
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            another empty snapshot array.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotsOfEmptyStoreIsEmpty', 0, () => {
      const snapshots: ContactSnapshot[] = snapshotsOf(store.rows);
      expect(snapshots.length).assertEqual(0);
      expect(snapshotsOf([]).length).assertEqual(0);
      expect(sameSnapshotArray(snapshots, [])).assertTrue();
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(sameStringArray(contactNames(store.rows), [])).assertTrue();
    });

    /**
     * @tc.name   sameSnapshotArrayTrueForIdenticalSequence
     * @tc.desc   Two stores seeded from the same list produce equal snapshot arrays even though
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            each store owns separate row objects.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sameSnapshotArrayTrueForIdenticalSequence', 0, () => {
      const second: StoreDouble = new StoreDouble();
      const seed: Contact[] = createSeedContacts().slice(0, 5);
      store.batchInsert(true, seed);
      second.batchInsert(true, seed);
      const left: ContactSnapshot[] = snapshotsOf(store.rows);
      const right: ContactSnapshot[] = snapshotsOf(second.rows);
      expect(left.length).assertEqual(5);
      expect(right.length).assertEqual(5);
      expect(sameSnapshotArray(left, right)).assertTrue();
      expect(store.rows[0] === second.rows[0]).assertFalse();
      expect(left[0] === right[0]).assertFalse();
      expect(left[0].describe()).assertEqual(right[0].describe());
    });

    /**
     * @tc.name   sameSnapshotArrayFalseWhenOneFieldDiffers
     * @tc.desc   A single differing email makes two otherwise identical snapshot arrays
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            compare unequal.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sameSnapshotArrayFalseWhenOneFieldDiffers', 0, () => {
      const second: StoreDouble = new StoreDouble();
      const seed: Contact[] = createSeedContacts().slice(0, 3);
      store.batchInsert(true, seed);
      second.batchInsert(true, seed);
      second.rows[1].email = 'different@example.com';
      const left: ContactSnapshot[] = snapshotsOf(store.rows);
      const right: ContactSnapshot[] = snapshotsOf(second.rows);
      expect(sameSnapshotArray(left, right)).assertFalse();
      expect(left[1].name).assertEqual(right[1].name);
      expect(left[1].phone).assertEqual(right[1].phone);
      expect(left[1].email === right[1].email).assertFalse();
      expect(left[0].sameAs(right[0])).assertTrue();
      expect(left.length).assertEqual(right.length);
    });

    /**
     * @tc.name   storeAndManagerAgreeAfterAdd
     * @tc.desc   Adding the same contact to the manager and to the store leaves both holding the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            identical snapshot sequence.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('storeAndManagerAgreeAfterAdd', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 2);
      const manager = resetContactManager(seed);
      store.batchInsert(true, seed);
      const added: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road');
      manager.addContact(added);
      store.insert(true, added, 'ON_CONFLICT_REPLACE');
      expect(manager.getContacts().length).assertEqual(3);
      expect(store.rowCount()).assertEqual(3);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(store.rows))).assertTrue();
      expect(manager.getContacts()[2].name).assertEqual('Ada Lovelace');
      logStep('PersistenceConsistencyValidation', 'manager and store agreed after add');
    });

    /**
     * @tc.name   storeAndManagerAgreeAfterUniqueNameUpdate
     * @tc.desc   With unique names the manager replaces the first match while the store rewrites
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            its only match, so both end with the same edited payload.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeAndManagerAgreeAfterUniqueNameUpdate', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 3);
      const manager = resetContactManager(seed);
      store.batchInsert(true, seed);
      const updated: Contact = contactOf(seed[1].name, '19999999999', 'edited@example.com', 'Edited Road', seed[1].avatar, seed[1].category);
      manager.updateContact(updated);
      store.updateContact(updated);
      expect(manager.getContacts().length).assertEqual(3);
      expect(store.rowCount()).assertEqual(3);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(store.rows))).assertTrue();
      expect(manager.getContacts()[1].phone).assertEqual('19999999999');
      expect(store.rows[1].phone).assertEqual('19999999999');
    });

    /**
     * @tc.name   storeAndManagerAgreeAfterDelete
     * @tc.desc   Deleting the same name through the manager and the store leaves both with the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            same two survivors in the same order.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeAndManagerAgreeAfterDelete', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 2);
      const manager = resetContactManager(seed);
      store.batchInsert(true, seed);
      manager.deleteContact(contactOf(seed[0].name, '', '', ''));
      const removed: number = store.deleteByName(seed[0].name);
      expect(removed).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(store.rows))).assertTrue();
      expect(manager.getContacts()[0].name).assertEqual('阿诺德');
      expect(store.names()[0]).assertEqual('阿诺德');
    });

    /**
     * @tc.name   seedParityBetweenManagerAndStore
     * @tc.desc   The fifteen production seed rows look the same whether they came through the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            manager or through the store batch path.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seedParityBetweenManagerAndStore', 0, () => {
      const seed: Contact[] = createSeedContacts();
      const manager = resetContactManager(seed);
      store.batchInsert(true, seed);
      expect(manager.getContacts().length).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      const managerSnapshots: ContactSnapshot[] = snapshotsOf(manager.getContacts());
      const storeSnapshots: ContactSnapshot[] = snapshotsOf(store.rows);
      expect(sameSnapshotArray(managerSnapshots, storeSnapshots)).assertTrue();
      expect(managerSnapshots[0].name).assertEqual('艾德里安');
      expect(storeSnapshots[14].name).assertEqual('法里');
      expect(managerSnapshots[14].describe()).assertEqual(storeSnapshots[14].describe());
    });

    /**
     * @tc.name   batchInsertThenQuerySameSnapshot
     * @tc.desc   Rows read back through the query path produce the same snapshot sequence as the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            stored rows, although the returned objects are copies.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertThenQuerySameSnapshot', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 6);
      store.batchInsert(true, seed);
      const readBack: Contact[] = store.query(true);
      expect(sameSnapshotArray(snapshotsOf(readBack), snapshotsOf(store.rows))).assertTrue();
      expect(readBack.length).assertEqual(6);
      expect(readBack[0] === store.rows[0]).assertFalse();
      expect(readBack[5].name).assertEqual('卡梅隆');
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(6);
    });

    /**
     * @tc.name   roundTripThroughBucketKeepsAllFields
     * @tc.desc   Mapping a contact into a six key bucket and back reconstructs every field,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            including avatar and category.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('roundTripThroughBucketKeepsAllFields', 0, () => {
      const contact: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road',
        'ada.png', 'F');
      const bucket: Bucket = ContactMapper.toBucket(contact);
      expect(bucket.size()).assertEqual(6);
      expect(bucket.has(FIELD_NAME)).assertTrue();
      expect(bucket.has(FIELD_AVATAR)).assertTrue();
      const rebuilt: Contact = ContactMapper.fromBucket(bucket);
      expect(sameContact(rebuilt, contact)).assertTrue();
      expect(rebuilt.address).assertEqual('River Road');
      expect(rebuilt.category).assertEqual('F');
      expect(rebuilt.avatar).assertEqual('ada.png');
    });

    /**
     * @tc.name   roundTripThroughCursorSkipsFirstRow
     * @tc.desc   The cursor walk starts after the first row because goToFirstRow is followed by
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            goToNextRow, so the leading row never reaches the page.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('roundTripThroughCursorSkipsFirstRow', 0, () => {
      const rows: Contact[] = createSeedContacts().slice(0, 3);
      const cursor: CursorResultSet = new CursorResultSet(rows);
      const visible: Contact[] = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(2);
      expect(visible[0].name).assertEqual('阿诺德');
      expect(visible[1].name).assertEqual('贝拉');
      expect(sameContact(visible[1], rows[2])).assertTrue();
      expect(visible[0].name === rows[0].name).assertFalse();
      expect(cursor.closed).assertTrue();
      expect(cursor.rowCount()).assertEqual(3);
    });

    /**
     * @tc.name   roundTripThroughCursorDedupesNamePhone
     * @tc.desc   Two visible rows sharing name and phone collapse into one while a differing
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            phone keeps the row, matching the independent oracle.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('roundTripThroughCursorDedupesNamePhone', 0, () => {
      const rows: Contact[] = [
        createSeedContacts()[0],
        contactOf('Ada Lovelace', '13800138000', 'first@example.com', 'River Road', '', 'A'),
        contactOf('Ada Lovelace', '13800138000', 'second@example.com', 'Other Road', '', 'B'),
        contactOf('Ada Lovelace', '13800138001', 'third@example.com', 'Third Road', '', 'C')
      ];
      const cursor: CursorResultSet = new CursorResultSet(rows);
      const visible: Contact[] = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(2);
      expect(sameStringArray(contactNames(visible), ['Ada Lovelace', 'Ada Lovelace'])).assertTrue();
      expect(visible[0].email).assertEqual('first@example.com');
      expect(visible[1].phone).assertEqual('13800138001');
      expect(sameSnapshotArray(snapshotsOf(visible), snapshotsOf(expectedVisibleRows(rows)))).assertTrue();
    });

    /**
     * @tc.name   deletePersistenceAcrossRepeatedQueries
     * @tc.desc   A deleted name stays absent from two consecutive queries, so the delete is
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            durable for the lifetime of the handle.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deletePersistenceAcrossRepeatedQueries', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 4);
      store.batchInsert(true, seed);
      expect(store.deleteByName(seed[1].name)).assertEqual(1);
      const first: Contact[] = store.query(true);
      const second: Contact[] = store.query(true);
      expect(first.length).assertEqual(3);
      expect(second.length).assertEqual(3);
      expect(countOf(contactNames(first), seed[1].name)).assertEqual(0);
      expect(countOf(contactNames(second), seed[1].name)).assertEqual(0);
      expect(sameStringArray(contactNames(first), contactNames(second))).assertTrue();
      expect(store.queryCalls).assertEqual(2);
    });

    /**
     * @tc.name   queryCopyDoesNotAffectStoredSnapshot
     * @tc.desc   Editing the rows returned by a query leaves the stored snapshot unchanged, so
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the read path hands out copies.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryCopyDoesNotAffectStoredSnapshot', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const before: ContactSnapshot[] = snapshotsOf(store.rows);
      const copy: Contact[] = store.query(true);
      copy[0].name = 'Overwritten';
      copy[0].phone = '10000000000';
      copy.splice(1, 1);
      expect(copy.length).assertEqual(2);
      expect(store.rowCount()).assertEqual(3);
      expect(store.rows[0].name).assertEqual('艾德里安');
      expect(sameSnapshotArray(snapshotsOf(store.rows), before)).assertTrue();
      expect(store.rows[0].phone).assertEqual('13333333333');
    });

    /**
     * @tc.name   snapshotAfterDeleteOmitsRemovedName
     * @tc.desc   The snapshot list built after a delete contains only the surviving names and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            is one element shorter than the list built before it.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotAfterDeleteOmitsRemovedName', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      const before: ContactSnapshot[] = snapshotsOf(store.rows);
      store.deleteByName('阿诺德');
      const after: ContactSnapshot[] = snapshotsOf(store.rows);
      expect(before.length).assertEqual(4);
      expect(after.length).assertEqual(3);
      expect(sameSnapshotArray(before, after)).assertFalse();
      const afterNames: string[] = [];
      for (let index = 0; index < after.length; index++) {
        afterNames.push(after[index].name);
      }
      expect(afterNames.indexOf('阿诺德')).assertEqual(-1);
      expect(afterNames.indexOf('艾德里安')).assertEqual(0);
      expect(after[0].sameAs(before[0])).assertTrue();
      expect(after[1].sameAs(before[2])).assertTrue();
    });

    /**
     * @tc.name   mutationAfterSnapshotDoesNotAlterCapturedSnapshot
     * @tc.desc   A snapshot taken before a mutation keeps the old values after the store row has
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            been updated.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationAfterSnapshotDoesNotAlterCapturedSnapshot', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        'ON_CONFLICT_REPLACE');
      const captured: ContactSnapshot = new ContactSnapshot(store.rows[0]);
      store.updateContact(contactOf('Ada Lovelace', '19999999999', 'later@example.com', 'Later Road'));
      expect(captured.phone).assertEqual('13800138000');
      expect(captured.email).assertEqual('ada@example.com');
      expect(captured.address).assertEqual('River Road');
      expect(store.rows[0].phone).assertEqual('19999999999');
      expect(captured.sameAs(new ContactSnapshot(store.rows[0]))).assertFalse();
      expect(captured.name).assertEqual(store.rows[0].name);
    });

    /**
     * @tc.name   metricsFingerprintChangesAfterInsert
     * @tc.desc   Inserting one row changes the aggregate fingerprint and moves the total and the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            unique name count together.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsFingerprintChangesAfterInsert', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const before: ContactMetrics = ContactMetrics.from(store.rows);
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        'ON_CONFLICT_REPLACE');
      const after: ContactMetrics = ContactMetrics.from(store.rows);
      expect(before.total).assertEqual(3);
      expect(after.total).assertEqual(4);
      expect(after.uniqueNames).assertEqual(before.uniqueNames + 1);
      expect(before.fingerprint() === after.fingerprint()).assertFalse();
      expect(before.duplicateNames).assertEqual(0);
      expect(after.categories).assertEqual(3);
      expect(after.fillRatio()).assertEqual(1);
    });

    /**
     * @tc.name   repeatedBatchInsertDoublesRowCount
     * @tc.desc   Submitting the seed twice duplicates every row and doubles the aggregate total
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            while the name count stays the same.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedBatchInsertDoublesRowCount', 0, () => {
      const seed: Contact[] = createSeedContacts();
      store.batchInsert(true, seed);
      const first: ContactMetrics = ContactMetrics.from(store.rows);
      store.batchInsert(true, seed);
      const doubled: ContactMetrics = ContactMetrics.from(store.rows);
      expect(store.rowCount()).assertEqual(30);
      expect(doubled.total).assertEqual(first.total * 2);
      expect(doubled.uniqueNames).assertEqual(first.uniqueNames);
      expect(doubled.duplicateNames).assertEqual(15);
      expect(doubled.fillRatio()).assertEqual(0.5);
      expect(store.batchCalls).assertEqual(2);
      expect(sameSnapshotArray(snapshotsOf(store.rows.slice(0, 15)), snapshotsOf(store.rows.slice(15, 30))))
        .assertTrue();
    });

    /**
     * @tc.name   managerAndStoreAgreeAfterTwoUpdates
     * @tc.desc   Two unique name updates applied to both sides keep the snapshot sequences in
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            step after each step.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerAndStoreAgreeAfterTwoUpdates', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 4);
      const manager = resetContactManager(seed);
      store.batchInsert(true, seed);
      const firstEdit: Contact = contactOf(seed[0].name, '19999999991', 'first@example.com', 'First Road', seed[0].avatar, seed[0].category);
      manager.updateContact(firstEdit);
      store.updateContact(firstEdit);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(store.rows))).assertTrue();
      const secondEdit: Contact = contactOf(seed[3].name, '19999999992', 'second@example.com', 'Second Road', seed[3].avatar, seed[3].category);
      manager.updateContact(secondEdit);
      store.updateContact(secondEdit);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(store.rows))).assertTrue();
      expect(manager.getContacts()[3].email).assertEqual('second@example.com');
      expect(store.rows[3].phone).assertEqual('19999999992');
      expect(store.updateCalls).assertEqual(2);
    });

    /**
     * @tc.name   persistenceBucketKeyOrderMatchesColumnOrder
     * @tc.desc   The bucket built from a contact lists the six columns in the same order as the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            CREATE TABLE statement and the shared bucket keys.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('persistenceBucketKeyOrderMatchesColumnOrder', 0, () => {
      const bucket: Bucket = ContactMapper.toBucket(
        contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road', 'ada.png', 'A'));
      expect(bucket.size()).assertEqual(BUCKET_KEYS.length);
      for (let index = 0; index < BUCKET_KEYS.length; index++) {
        expect(bucket.keyAt(index)).assertEqual(BUCKET_KEYS[index]);
        expect(bucket.has(BUCKET_KEYS[index])).assertTrue();
      }
      expect(bucket.keyAt(0)).assertEqual(FIELD_NAME);
      expect(bucket.keyAt(1)).assertEqual(FIELD_PHONE);
      expect(bucket.keyAt(2)).assertEqual(FIELD_EMAIL);
      expect(bucket.keyAt(3)).assertEqual(FIELD_ADDRESS);
      expect(bucket.valueAt(5)).assertEqual('A');
    });

    /**
     * @tc.name   bucketDescribeUsesSemicolonSeparator
     * @tc.desc   The bucket description joins six key value pairs with semicolons and two
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            buckets built from the same contact compare equal through it.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bucketDescribeUsesSemicolonSeparator', 0, () => {
      const contact: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road', '', 'A');
      const left: Bucket = ContactMapper.toBucket(contact);
      const right: Bucket = ContactMapper.toBucket(cloneContact(contact));
      const parts: string[] = left.describe().split(';');
      expect(parts.length).assertEqual(6);
      expect(parts[0]).assertEqual('name=Ada Lovelace');
      expect(parts[1]).assertEqual('phone=13800138000');
      expect(left.sameAs(right)).assertTrue();
      expect(left.get(FIELD_CATEGORY)).assertEqual('A');
      expect(left.get(FIELD_AVATAR)).assertEqual('');
      right.put(FIELD_CATEGORY, 'F');
      expect(left.sameAs(right)).assertFalse();
    });

    /**
     * @tc.name   cursorBeforeFirstRowHasNoColumnValue
     * @tc.desc   A cursor that has not moved yet reports index -1 and returns an empty string for
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            every column, while isAfterLast stays false.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorBeforeFirstRowHasNoColumnValue', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet(createSeedContacts().slice(0, 2));
      expect(cursor.index).assertEqual(-1);
      expect(cursor.getString(0)).assertEqual('');
      expect(cursor.getString(cursor.getColumnIndex(FIELD_EMAIL))).assertEqual('');
      expect(cursor.isAfterLast()).assertFalse();
      expect(cursor.goToFirstRow()).assertTrue();
      expect(cursor.getString(0)).assertEqual('艾德里安');
      expect(cursor.closed).assertFalse();
    });

    /**
     * @tc.name   cursorGoToNextRowBeyondEndMarksAfterLast
     * @tc.desc   On a single row result set the second goToNextRow reports false, marks the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            cursor after the last row and yields no further column value.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorGoToNextRowBeyondEndMarksAfterLast', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet(createSeedContacts().slice(0, 1));
      expect(cursor.goToFirstRow()).assertTrue();
      expect(cursor.isAfterLast()).assertFalse();
      expect(cursor.goToNextRow()).assertFalse();
      expect(cursor.index).assertEqual(1);
      expect(cursor.isAfterLast()).assertTrue();
      expect(cursor.getString(0)).assertEqual('');
      expect(cursor.rowCount()).assertEqual(1);
    });

    /**
     * @tc.name   cursorColumnIndexCoversSixColumns
     * @tc.desc   Column lookup resolves the six production columns to indexes zero through five
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            and reports -1 for an unknown column.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('cursorColumnIndexCoversSixColumns', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet([]);
      expect(cursor.getColumnIndex(FIELD_NAME)).assertEqual(0);
      expect(cursor.getColumnIndex(FIELD_PHONE)).assertEqual(1);
      expect(cursor.getColumnIndex(FIELD_EMAIL)).assertEqual(2);
      expect(cursor.getColumnIndex(FIELD_ADDRESS)).assertEqual(3);
      expect(cursor.getColumnIndex(FIELD_AVATAR)).assertEqual(4);
      expect(cursor.getColumnIndex(FIELD_CATEGORY)).assertEqual(5);
      expect(cursor.getColumnIndex('missing')).assertEqual(-1);
      expect(cursor.columnNames.length).assertEqual(6);
    });

    /**
     * @tc.name   cursorOnEmptyRowsClosesWithoutContacts
     * @tc.desc   Reading an empty result set returns no contacts, marks the cursor after the last
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            row and closes it.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorOnEmptyRowsClosesWithoutContacts', 0, () => {
      const cursor: CursorResultSet = new CursorResultSet([]);
      const visible: Contact[] = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(0);
      expect(cursor.closed).assertTrue();
      expect(cursor.isAfterLast()).assertTrue();
      expect(cursor.rowCount()).assertEqual(0);
      expect(sameSnapshotArray(snapshotsOf(visible), [])).assertTrue();
      expect(sameSnapshotArray(snapshotsOf(visible), snapshotsOf(expectedVisibleRows([])))).assertTrue();
    });

    /**
     * @tc.name   managerDeletesAllMatchingNamesLikeStore
     * @tc.desc   Both the manager and the store drop every row sharing a name, so duplicated
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            rows leave both sides in agreement.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerDeletesAllMatchingNamesLikeStore', 0, () => {
      const twins: Contact[] = [
        contactOf('Twin Row', '13800138000', 'twin.one@example.com', 'First Road'),
        contactOf('Twin Row', '13800138001', 'twin.two@example.com', 'Second Road'),
        contactOf('Solo Row', '13900139000', 'solo@example.com', 'Solo Road')
      ];
      const manager = resetContactManager(twins);
      store.batchInsert(true, twins);
      manager.deleteContact(contactOf('Twin Row', '', '', ''));
      const removed: number = store.deleteByName('Twin Row');
      expect(removed).assertEqual(2);
      expect(manager.getContacts().length).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(store.rows))).assertTrue();
      expect(manager.getContacts()[0].name).assertEqual('Solo Row');
    });

    /**
     * @tc.name   snapshotParityAfterFullWorkflow
     * @tc.desc   After an add, an update and a delete mirrored on both sides the snapshot
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            sequences still agree.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotParityAfterFullWorkflow', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 3);
      const manager = resetContactManager(seed);
      store.batchInsert(true, seed);
      const added: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road');
      manager.addContact(added);
      store.insert(true, added, 'ON_CONFLICT_REPLACE');
      const edited: Contact = contactOf(seed[0].name, '19999999999', 'flow@example.com', 'Flow Road', seed[0].avatar, seed[0].category);
      manager.updateContact(edited);
      store.updateContact(edited);
      manager.deleteContact(contactOf(seed[1].name, '', '', ''));
      store.deleteByName(seed[1].name);
      expect(manager.getContacts().length).assertEqual(3);
      expect(store.rowCount()).assertEqual(3);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(store.rows))).assertTrue();
      expect(store.names()[0]).assertEqual(seed[0].name);
      expect(store.rows[0].email).assertEqual('flow@example.com');
      expect(store.names()[2]).assertEqual('Ada Lovelace');
    });

    /**
     * @tc.name   deleteLastSeedRowLeavesFourteen
     * @tc.desc   Removing the final seeded row leaves fourteen snapshots and moves the last
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            remaining production name into the tail position.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteLastSeedRowLeavesFourteen', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const removed: number = store.deleteByName('法里');
      const remaining: ContactSnapshot[] = snapshotsOf(store.rows);
      expect(removed).assertEqual(1);
      expect(remaining.length).assertEqual(14);
      expect(store.rowCount()).assertEqual(14);
      expect(remaining[13].name).assertEqual('法比而');
      expect(remaining[0].name).assertEqual('艾德里安');
      expect(store.names().indexOf('法里')).assertEqual(-1);
      expect(store.deleteCalls).assertEqual(1);
    });

    /**
     * @tc.name   editsInOneStoreLeaveTheOtherSnapshotIntact
     * @tc.desc   Two stores seeded identically diverge only at the edited row after one update,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            so every other snapshot remains equal.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('editsInOneStoreLeaveTheOtherSnapshotIntact', 0, () => {
      const second: StoreDouble = new StoreDouble();
      const seed: Contact[] = createSeedContacts().slice(0, 3);
      store.batchInsert(true, seed);
      second.batchInsert(true, seed);
      store.updateContact(contactOf(seed[1].name, '19999999999', 'diverged@example.com', 'Diverged Road'));
      const left: ContactSnapshot[] = snapshotsOf(store.rows);
      const right: ContactSnapshot[] = snapshotsOf(second.rows);
      expect(sameSnapshotArray(left, right)).assertFalse();
      expect(left[0].sameAs(right[0])).assertTrue();
      expect(left[1].sameAs(right[1])).assertFalse();
      expect(left[2].sameAs(right[2])).assertTrue();
      expect(right[1].email).assertEqual(seed[1].email);
      expect(left[1].phone).assertEqual('19999999999');
    });

    /**
     * @tc.name   emptyBucketRoundTripYieldsDefaultContact
     * @tc.desc   Reading a bucket with no keys produces a contact whose six fields are the empty
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            defaults, matching the production constructor defaults.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyBucketRoundTripYieldsDefaultContact', 0, () => {
      const bucket: Bucket = new Bucket();
      expect(bucket.size()).assertEqual(0);
      const rebuilt: Contact = ContactMapper.fromBucket(bucket);
      expect(rebuilt.name).assertEqual('');
      expect(rebuilt.phone).assertEqual('');
      expect(rebuilt.email).assertEqual('');
      expect(rebuilt.address).assertEqual('');
      expect(rebuilt.avatar).assertEqual('');
      expect(rebuilt.category).assertEqual('');
      expect(sameContact(rebuilt, new Contact())).assertTrue();
    });
    /**
     * @tc.name   snapshotArraysOfDifferentLengthNeverCompareEqual
     * @tc.desc   A snapshot list and a truncated copy of it are unequal even when every shared
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            element matches, because the length guard runs first.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotArraysOfDifferentLengthNeverCompareEqual', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      const full: ContactSnapshot[] = snapshotsOf(store.rows);
      const truncated: ContactSnapshot[] = full.slice(0, 3);
      expect(full.length).assertEqual(4);
      expect(truncated.length).assertEqual(3);
      expect(sameSnapshotArray(full, truncated)).assertFalse();
      expect(sameSnapshotArray(truncated, full)).assertFalse();
      expect(truncated[0].sameAs(full[0])).assertTrue();
      expect(sameSnapshotArray(truncated, truncated)).assertTrue();
      expect(full[3].name).assertEqual('本');
    });

    /**
     * @tc.name   appendedRowOccupiesTheSnapshotTail
     * @tc.desc   A newly added row appears as the final snapshot and does not disturb the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            snapshots of the rows that were already stored.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('appendedRowOccupiesTheSnapshotTail', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 3);
      store.batchInsert(true, seed);
      const before: ContactSnapshot[] = snapshotsOf(store.rows);
      const added: Contact = contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane',
        '', 'F');
      store.insert(true, added, 'ON_CONFLICT_REPLACE');
      const after: ContactSnapshot[] = snapshotsOf(store.rows);
      expect(after.length).assertEqual(4);
      expect(after[3].sameAs(new ContactSnapshot(added))).assertTrue();
      expect(after[3].name).assertEqual('Grace Hopper');
      expect(after[2].sameAs(before[2])).assertTrue();
      expect(after[0].describe()).assertEqual(before[0].describe());
      expect(after.slice(0, 3).length).assertEqual(before.length);
    });

    /**
     * @tc.name   queryAfterDeleteMatchesStoredSnapshot
     * @tc.desc   A query issued after a delete returns exactly the surviving stored snapshot
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PersistenceConsistencyValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            sequence with no removed row resurfacing.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryAfterDeleteMatchesStoredSnapshot', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      store.deleteByName('贝拉');
      const readBack: Contact[] = store.query(true);
      expect(readBack.length).assertEqual(4);
      expect(sameSnapshotArray(snapshotsOf(readBack), snapshotsOf(store.rows))).assertTrue();
      expect(countOf(contactNames(readBack), '贝拉')).assertEqual(0);
      expect(readBack[3].name).assertEqual('本杰明');
      expect(store.queryCalls).assertEqual(1);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(4);
      expect(sameStringArray(contactNames(readBack), contactNames(store.rows))).assertTrue();
      expect(readBack[0].name).assertEqual('艾德里安');
      expect(readBack[1].name).assertEqual('阿诺德');
      expect(readBack[2].name).assertEqual('本');
      expect(readBack[3].phone).assertEqual('16666666666');
      expect(readBack[3].category).assertEqual('B');
      expect(store.rows[3] === readBack[3]).assertFalse();
    });
  });
}
