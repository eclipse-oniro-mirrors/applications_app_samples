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
 * MutationJourneyMatrix follows add, edit, delete and search across the
 * manager, the store, the bucket mapper, the router intent and the metrics.
 *
 * Production anchors:
 *   OperateRDBInTaskPool.ets:74-117  seed once, then dispatch add/edit/delete
 *   ContactManager.ets:50-53        add appends without a duplicate check
 *   ContactManager.ets:55-65        edit replaces the first name match
 *   ContactManager.ets:67-70        delete filters every name match
 *   Contact.ets:31-47               six contact fields and their defaults
 *   Contact.ets:49-57               RouterParams text plus data
 *   DatabaseConnection.ets:187-221  insert with ON_CONFLICT_REPLACE
 *   DatabaseConnection.ets:226-236  delete by name
 *   DatabaseConnection.ets:241-272  update phone/email/address by name
 *   DatabaseConnection.ets:277-309  first-row skip and name+phone dedupe
 *   AddressBookEdit.ets:176-279     field limits and duplicate name guard
 *
 * Every journey ends with a parity or divergence assertion, so a broken link
 * between two layers changes at least one value in every case.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact, RouterParams } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  StoreDouble,
  TaskPoolQueue,
  CursorResultSet,
  readContactsFromResultSet,
  expectedVisibleCount,
  ContactMapper,
  ContactValidation,
  Bucket,
  ContactMetrics,
  RouteIntent,
  SearchEngine,
  ACTION_ADD,
  ACTION_EDIT,
  ACTION_DELETE,
  ROUTE_EDIT,
  ROUTE_LIST,
  CONFLICT_REPLACE,
  OperationCatalog,
  fallbackForOperation,
  ERROR_SQL_EXECUTION,
  SQL_UPDATE_CONTACT,
  SQL_DELETE_CONTACT,
  SQL_QUERY_CONTACT,
  updateBindings,
  deleteBindings,
  FIELD_NAME,
  FIELD_PHONE,
  FIELD_EMAIL,
  FIELD_ADDRESS,
  FIELD_AVATAR,
  FIELD_CATEGORY,
  BUCKET_KEYS,
  contactOf,
  contactNames,
  sameContact,
  sameStringArray,
  sameSnapshotArray,
  snapshotsOf,
  joined,
  countOf,
  uniqueStrings,
  resetContactManager,
  expectedAfterAdd,
  expectedAfterUpdate,
  expectedAfterDelete
} from '../Shared/SharedDriver';

/** Five rows with unique names spanning categories A to E. */
function journeySeed(): Contact[] {
  const rows: Contact[] = [];
  rows.push(contactOf('江晚', '13701000001', 'jiangwan@example.com', '浙江省杭州市拱墅区', '', 'A'));
  rows.push(contactOf('陆离', '13701000002', 'luli@example.com', '江苏省南京市秦淮区', '', 'B'));
  rows.push(contactOf('南枝', '13701000003', 'nanzhi@example.com', '安徽省合肥市包河区', '', 'C'));
  rows.push(contactOf('北辰', '13701000004', 'beichen@example.com', '湖北省武汉市武昌区', '', 'D'));
  rows.push(contactOf('清和', '13701000005', 'qinghe@example.com', '湖南省长沙市芙蓉区', '', 'E'));
  return rows;
}

/** A draft that passes every validation rule, ready for an add journey. */
function validDraft(name: string, phone: string): Contact {
  return contactOf(name, phone, name + '@example.com', '四川省成都市武侯区', '', 'A');
}

/** Seeds the store and the manager with the same rows, store first. */
function seedJourney(store: StoreDouble, manager: ContactManager, rows: Contact[]): void {
  store.batchInsert(true, rows);
  manager.setContacts(rows);
}

/** Appends one row to both layers. */
function addJourney(store: StoreDouble, manager: ContactManager, contact: Contact): void {
  store.insert(true, contact, CONFLICT_REPLACE);
  manager.addContact(contact);
}

/** Edits one row in both layers and returns the store affected count. */
function editJourney(store: StoreDouble, manager: ContactManager, contact: Contact): number {
  const affected: number = store.updateContact(contact);
  manager.updateContact(contact);
  return affected;
}

/** Deletes one name from both layers and returns the store removed count. */
function deleteJourney(store: StoreDouble, manager: ContactManager, name: string): number {
  const removed: number = store.deleteByName(name);
  manager.deleteContact(contactOf(name, '', '', ''));
  return removed;
}

/** Asserts that the manager and the store hold the same rows in the same order. */
function assertJourneyParity(manager: ContactManager, store: StoreDouble): void {
  const managerRows: Contact[] = manager.getContacts();
  const storeRows: Contact[] = store.query(true);
  expect(managerRows.length).assertEqual(storeRows.length);
  expect(sameStringArray(contactNames(managerRows), contactNames(storeRows))).assertTrue();
  expect(sameSnapshotArray(snapshotsOf(managerRows), snapshotsOf(storeRows))).assertTrue();
  expect(joined(contactNames(managerRows))).assertEqual(joined(contactNames(storeRows)));
}

/** Names returned by the list page search provider. */
function searchNames(rows: Contact[], keyword: string): string[] {
  return contactNames(SearchEngine.filterByName(rows, keyword));
}

export default function mutationJourneyMatrixTest(): void {
  describe('MutationJourneyMatrix', () => {
    const store: StoreDouble = new StoreDouble();
    const queue: TaskPoolQueue = new TaskPoolQueue();

    beforeAll(() => {
      logSuite('MutationJourneyMatrix', 'begin');
    });

    beforeEach(async () => {
      resetContactManager();
      store.reset();
      queue.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      store.reset();
      queue.reset();
      logSuite('MutationJourneyMatrix', 'end');
    });

    /**
     * @tc.name   mutationJourneyAddWritesBothLedgers
     * @tc.desc   One add reaches the store and the manager and both keep insertion order.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows into both layers.
     *                   2. Add one valid draft through both layers.
     *                   3. Compare lengths, tail values and parity.
     * @tc.expected      Both layers hold six rows and the new row is the tail in each.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneyAddWritesBothLedgers', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      const draft: Contact = validDraft('苏叶', '13702000001');
      addJourney(store, manager, draft);
      expect(manager.getContacts().length).assertEqual(6);
      expect(store.rowCount()).assertEqual(6);
      expect(manager.getContacts()[5].name).assertEqual('苏叶');
      expect(store.names()[5]).assertEqual('苏叶');
      expect(store.insertCalls).assertEqual(1);
      assertJourneyParity(manager, store);
    });

    /**
     * @tc.name   mutationJourneyAddMapperBucketRoundTrip
     * @tc.desc   The bucket written by the add path maps back to an identical Contact.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a valid draft.
     *                   2. Convert it to a bucket and back.
     *                   3. Compare every field and the bucket key order.
     * @tc.expected      The round trip preserves all six fields and uses the six declared keys.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneyAddMapperBucketRoundTrip', 0, () => {
      const draft: Contact = validDraft('陆机', '13702000002');
      const bucket: Bucket = ContactMapper.toBucket(draft);
      const restored: Contact = ContactMapper.fromBucket(bucket);
      expect(bucket.size()).assertEqual(6);
      expect(sameStringArray(bucket.keys, BUCKET_KEYS)).assertTrue();
      expect(bucket.get(FIELD_NAME)).assertEqual('陆机');
      expect(bucket.get(FIELD_PHONE)).assertEqual('13702000002');
      expect(sameContact(restored, draft)).assertTrue();
      expect(restored.email).assertEqual('陆机@example.com');
      expect(restored.avatar).assertEqual('');
    });

    /**
     * @tc.name   mutationJourneyAddRouteTargetsEditPage
     * @tc.desc   The add intent opens AddressBookEdit and carries the draft through RouterParams.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a route intent for the add action.
     *                   2. Convert it to RouterParams and read the text.
     *                   3. Compare the target with the edit route.
     * @tc.expected      The target is the edit page and the parameter text is the add action.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneyAddRouteTargetsEditPage', 0, () => {
      const draft: Contact = validDraft('顾况', '13702000003');
      const intent: RouteIntent = new RouteIntent(ACTION_ADD, draft);
      const params: RouterParams = intent.toParams();
      logStep('MutationJourneyMatrix', intent.describe());
      expect(intent.url()).assertEqual(ROUTE_EDIT);
      expect(intent.url() === ROUTE_LIST).assertFalse();
      expect(params.text).assertEqual(ACTION_ADD);
      expect(params.data !== undefined).assertTrue();
      expect((params.data as Contact).name).assertEqual('顾况');
      expect(RouteIntent.isKnownAction(ACTION_ADD)).assertTrue();
    });

    /**
     * @tc.name   mutationJourneyAddSearchFindsNewName
     * @tc.desc   A fresh add becomes visible to the list search provider.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and add 苏叶.
     *                   2. Search the manager rows for the substring 苏.
     *                   3. Search the store snapshot the same way.
     * @tc.expected      Both searches return exactly 苏叶.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneyAddSearchFindsNewName', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      addJourney(store, manager, validDraft('苏叶', '13702000004'));
      expect(searchNames(manager.getContacts(), '苏').length).assertEqual(1);
      expect(searchNames(manager.getContacts(), '苏')[0]).assertEqual('苏叶');
      expect(searchNames(store.query(true), '苏')[0]).assertEqual('苏叶');
      expect(searchNames(manager.getContacts(), '叶')[0]).assertEqual('苏叶');
      expect(countOf(searchNames(manager.getContacts(), '江'), '江晚')).assertEqual(1);
      expect(searchNames(manager.getContacts(), '苏').length)
        .assertEqual(searchNames(store.query(true), '苏').length);
    });

    /**
     * @tc.name   mutationJourneyAddMetricsIncrease
     * @tc.desc   An add raises the row total, the phone digit sum and the fingerprint.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Fingerprint the five-row seed.
     *                   2. Add one eleven-digit contact.
     *                   3. Fingerprint again and compare counters.
     * @tc.expected      Total six, digits 66 and a different fingerprint.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyAddMetricsIncrease', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      const before: ContactMetrics = ContactMetrics.from(manager.getContacts());
      addJourney(store, manager, validDraft('元稹', '13702000005'));
      const after: ContactMetrics = ContactMetrics.from(manager.getContacts());
      expect(before.total).assertEqual(5);
      expect(before.totalPhoneDigits).assertEqual(55);
      expect(after.total).assertEqual(6);
      expect(after.totalPhoneDigits).assertEqual(66);
      expect(after.uniqueNames).assertEqual(6);
      expect(after.fingerprint() === before.fingerprint()).assertFalse();
      expect(after.fingerprint()).assertEqual(ContactMetrics.from(store.query(true)).fingerprint());
    });

    /**
     * @tc.name   mutationJourneyAddDuplicateAllowedByLedger
     * @tc.desc   The add path stores a repeated name even though the edit form would reject it.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows including 江晚.
     *                   2. Add another 江晚 with a different phone.
     *                   3. Count the occurrences and the validation verdict.
     * @tc.expected      Both layers hold two 江晚 rows while the form validator flags the duplicate.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyAddDuplicateAllowedByLedger', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      const duplicate: Contact = validDraft('江晚', '13702000006');
      addJourney(store, manager, duplicate);
      expect(manager.getContacts().length).assertEqual(6);
      expect(countOf(contactNames(manager.getContacts()), '江晚')).assertEqual(2);
      expect(countOf(store.names(), '江晚')).assertEqual(2);
      expect(ContactValidation.isDuplicateName(manager.getContacts(), '江晚')).assertTrue();
      expect(ContactValidation.isDuplicateName(manager.getContacts(), '元稹')).assertFalse();
      expect(ContactMetrics.from(manager.getContacts()).duplicateNames).assertEqual(1);
      assertJourneyParity(manager, store);
    });

    /**
     * @tc.name   mutationJourneyEditUpdatesManagerFirstMatch
     * @tc.desc   With a duplicated name the manager replaces only the first row.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and add a second 江晚 at the tail.
     *                   2. Edit 江晚 with a new phone.
     *                   3. Compare both 江晚 rows in the manager.
     * @tc.expected      The head 江晚 changes while the tail one keeps its phone.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyEditUpdatesManagerFirstMatch', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      addJourney(store, manager, validDraft('江晚', '13702000006'));
      const affected: number = editJourney(store, manager,
        contactOf('江晚', '13703000001', 'jiangwan-new@example.com', '浙江省绍兴市越城区', '', 'B'));
      const rows: Contact[] = manager.getContacts();
      expect(affected).assertEqual(2);
      expect(rows[0].phone).assertEqual('13703000001');
      expect(rows[0].email).assertEqual('jiangwan-new@example.com');
      expect(rows[5].phone).assertEqual('13702000006');
      expect(rows[5].email).assertEqual('江晚@example.com');
      expect(rows.length).assertEqual(6);
    });

    /**
     * @tc.name   mutationJourneyEditUpdatesStoreEveryMatch
     * @tc.desc   The store update statement touches every row sharing the name.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and add a second 江晚.
     *                   2. Edit 江晚 with a new phone.
     *                   3. Compare the store rows at both name positions.
     * @tc.expected      Both store rows carry the new phone while the manager shows divergence.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyEditUpdatesStoreEveryMatch', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      addJourney(store, manager, validDraft('江晚', '13702000006'));
      editJourney(store, manager,
        contactOf('江晚', '13703000002', 'jiangwan-both@example.com', '浙江省嘉兴市南湖区', '', 'C'));
      expect(store.query(true)[0].phone).assertEqual('13703000002');
      expect(store.query(true)[5].phone).assertEqual('13703000002');
      expect(store.updateCalls).assertEqual(1);
      expect(manager.getContacts()[0].phone).assertEqual('13703000002');
      expect(manager.getContacts()[5].phone).assertEqual('13702000006');
      expect(store.query(true).length).assertEqual(manager.getContacts().length);
    });

    /**
     * @tc.name   mutationJourneyEditRouteTargetsEditPage
     * @tc.desc   The edit intent reuses the edit route and carries the edited contact.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build an edit intent from an updated row.
     *                   2. Convert it to RouterParams.
     *                   3. Compare route, text and payload.
     * @tc.expected      The route is AddressBookEdit and the payload holds the new phone.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneyEditRouteTargetsEditPage', 0, () => {
      const edited: Contact = contactOf('南枝', '13703000003', 'nanzhi-new@example.com', '安徽省芜湖市镜湖区', '', 'C');
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, edited);
      const params: RouterParams = intent.toParams();
      expect(intent.url()).assertEqual(ROUTE_EDIT);
      expect(params.text).assertEqual(ACTION_EDIT);
      expect((params.data as Contact).phone).assertEqual('13703000003');
      expect((params.data as Contact).email).assertEqual('nanzhi-new@example.com');
      expect(intent.describe().indexOf('南枝') > 0).assertTrue();
      expect(intent.describe().endsWith(ROUTE_EDIT)).assertTrue();
    });

    /**
     * @tc.name   mutationJourneyEditKeepsSearchHit
     * @tc.desc   Editing a non-name field keeps the row visible to the same search keyword.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and search for 南.
     *                   2. Edit 南枝's phone and address.
     *                   3. Search for 南 again in both layers.
     * @tc.expected      Both searches still return one 南枝 with the new phone.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyEditKeepsSearchHit', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      expect(searchNames(manager.getContacts(), '南').length).assertEqual(1);
      editJourney(store, manager,
        contactOf('南枝', '13703000004', 'nanzhi-new@example.com', '安徽省马鞍山市花山区', '', 'C'));
      expect(searchNames(manager.getContacts(), '南')[0]).assertEqual('南枝');
      expect(searchNames(store.query(true), '南').length).assertEqual(1);
      expect(SearchEngine.filterByName(manager.getContacts(), '南')[0].phone).assertEqual('13703000004');
      expect(SearchEngine.filterByName(store.query(true), '南')[0].address).assertEqual('安徽省马鞍山市花山区');
      expect(countOf(searchNames(manager.getContacts(), '南'), '南枝')).assertEqual(1);
    });

    /**
     * @tc.name   mutationJourneyEditChangesCategoryGroup
     * @tc.desc   Moving a row from category D to A reduces the distinct group count.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows across categories A to E.
     *                   2. Edit 北辰 from D to A.
     *                   3. Recount groups and category A members.
     * @tc.expected      Four groups remain and category A holds two rows.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyEditChangesCategoryGroup', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(5);
      editJourney(store, manager,
        contactOf('北辰', '13703000005', 'beichen-new@example.com', '湖北省宜昌市西陵区', '', 'A'));
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(4);
      expect(SearchEngine.countCategory(manager.getContacts(), 'A')).assertEqual(2);
      expect(SearchEngine.countCategory(manager.getContacts(), 'D')).assertEqual(0);
      expect(SearchEngine.groupByCategory(store.query(true)).length).assertEqual(5);
      expect(ContactMetrics.from(manager.getContacts()).categories).assertEqual(4);
    });

    /**
     * @tc.name   mutationJourneyEditMissingNameNoOp
     * @tc.desc   Editing an absent name changes neither layer and reports zero affected rows.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and snapshot the manager.
     *                   2. Edit a name that is not stored.
     *                   3. Compare counts, calls and snapshots.
     * @tc.expected      Zero affected rows, one update call each and identical snapshots.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneyEditMissingNameNoOp', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      const before: Contact[] = manager.getContacts();
      const affected: number = editJourney(store, manager,
        contactOf('温岐', '13703000006', 'wenqi@example.com', '广东省珠海市香洲区', '', 'F'));
      expect(affected).assertEqual(0);
      expect(store.updateCalls).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(5);
      expect(sameSnapshotArray(snapshotsOf(before), snapshotsOf(manager.getContacts()))).assertTrue();
      expect(countOf(store.names(), '温岐')).assertEqual(0);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(5);
    });

    /**
     * @tc.name   mutationJourneyDeleteRemovesBothLedgers
     * @tc.desc   A delete removes the same row from the manager and the store.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows into both layers.
     *                   2. Delete 南枝.
     *                   3. Compare counts, removed count and parity.
     * @tc.expected      Both layers hold four rows and the store reports one removal.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneyDeleteRemovesBothLedgers', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      const removed: number = deleteJourney(store, manager, '南枝');
      expect(removed).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(4);
      expect(store.rowCount()).assertEqual(4);
      expect(countOf(contactNames(manager.getContacts()), '南枝')).assertEqual(0);
      expect(countOf(store.names(), '南枝')).assertEqual(0);
      expect(store.deleteCalls).assertEqual(1);
      assertJourneyParity(manager, store);
    });

    /**
     * @tc.name   mutationJourneyDeleteRouteReturnsToList
     * @tc.desc   The delete intent resolves to the list page, unlike add and edit.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a delete intent for 清和.
     *                   2. Read the target route and the RouterParams text.
     *                   3. Compare with the edit route.
     * @tc.expected      The target is the list page and the text is the delete action.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneyDeleteRouteReturnsToList', 0, () => {
      const target: Contact = contactOf('清和', '13701000005', 'qinghe@example.com', '湖南省长沙市芙蓉区', '', 'E');
      const intent: RouteIntent = new RouteIntent(ACTION_DELETE, target);
      const params: RouterParams = intent.toParams();
      expect(intent.url()).assertEqual(ROUTE_LIST);
      expect(intent.url() === ROUTE_EDIT).assertFalse();
      expect(params.text).assertEqual(ACTION_DELETE);
      expect((params.data as Contact).name).assertEqual('清和');
      expect(RouteIntent.isKnownAction(ACTION_DELETE)).assertTrue();
      expect(intent.describe().startsWith(ACTION_DELETE)).assertTrue();
    });

    /**
     * @tc.name   mutationJourneyDeleteRemovesSearchHit
     * @tc.desc   Deleting a row removes it from every keyword result.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and search for 北.
     *                   2. Delete 北辰.
     *                   3. Search for 北 in both layers.
     * @tc.expected      Both searches return zero rows after the delete.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyDeleteRemovesSearchHit', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      expect(searchNames(manager.getContacts(), '北').length).assertEqual(1);
      expect(searchNames(store.query(true), '北').length).assertEqual(1);
      deleteJourney(store, manager, '北辰');
      expect(searchNames(manager.getContacts(), '北').length).assertEqual(0);
      expect(searchNames(store.query(true), '北').length).assertEqual(0);
      expect(joined(searchNames(manager.getContacts(), '北'))).assertEqual('');
      expect(countOf(searchNames(manager.getContacts(), '辰'), '北辰')).assertEqual(0);
    });

    /**
     * @tc.name   mutationJourneyDeleteMissingNameNoOp
     * @tc.desc   Deleting an absent name still calls both delete paths but changes nothing.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and snapshot the manager.
     *                   2. Delete a name that is not stored.
     *                   3. Compare the counts and the snapshots.
     * @tc.expected      Zero removals, one delete call and identical snapshots.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneyDeleteMissingNameNoOp', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      const before: Contact[] = manager.getContacts();
      const removed: number = deleteJourney(store, manager, '温岐');
      expect(removed).assertEqual(0);
      expect(store.deleteCalls).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(5);
      expect(store.rowCount()).assertEqual(5);
      expect(sameSnapshotArray(snapshotsOf(before), snapshotsOf(manager.getContacts()))).assertTrue();
      expect(countOf(store.names(), '温岐')).assertEqual(0);
    });

    /**
     * @tc.name   mutationJourneyDeleteMetricsDrop
     * @tc.desc   Two deletes reduce the totals and the phone digit sum by the removed rows.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and read the metrics.
     *                   2. Delete 江晚 and 陆离.
     *                   3. Rebuild metrics and compare every counter.
     * @tc.expected      Total three, digits 33, unique three and a changed fingerprint.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyDeleteMetricsDrop', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      const before: ContactMetrics = ContactMetrics.from(manager.getContacts());
      deleteJourney(store, manager, '江晚');
      deleteJourney(store, manager, '陆离');
      const after: ContactMetrics = ContactMetrics.from(manager.getContacts());
      expect(before.total).assertEqual(5);
      expect(after.total).assertEqual(3);
      expect(after.totalPhoneDigits).assertEqual(33);
      expect(after.uniqueNames).assertEqual(3);
      expect(after.fillRatio()).assertEqual(1);
      expect(after.fingerprint() === before.fingerprint()).assertFalse();
      expect(after.fingerprint()).assertEqual(ContactMetrics.from(store.query(true)).fingerprint());
    });

    /**
     * @tc.name   mutationJourneyDeleteDuplicateRemovesAll
     * @tc.desc   A duplicated name is removed from every position by one delete call.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and add a second 江晚 at the tail.
     *                   2. Delete 江晚 once.
     *                   3. Count occurrences and compare both layers.
     * @tc.expected      Two removals, zero 江晚 rows and four survivors in each layer.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyDeleteDuplicateRemovesAll', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      addJourney(store, manager, validDraft('江晚', '13702000006'));
      const removed: number = deleteJourney(store, manager, '江晚');
      expect(removed).assertEqual(2);
      expect(manager.getContacts().length).assertEqual(4);
      expect(countOf(contactNames(manager.getContacts()), '江晚')).assertEqual(0);
      expect(countOf(store.names(), '江晚')).assertEqual(0);
      expect(store.names()[0]).assertEqual('陆离');
      assertJourneyParity(manager, store);
    });

    /**
     * @tc.name   mutationJourneyAddEditDeleteRoundTrip
     * @tc.desc   One add, one edit and one delete leave both layers in a consistent state.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and add 苏叶.
     *                   2. Edit 苏叶's phone and delete 陆离.
     *                   3. Compare the surviving order and parity.
     * @tc.expected      Five rows remain with the edited 苏叶 at the tail.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyAddEditDeleteRoundTrip', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      addJourney(store, manager, validDraft('苏叶', '13702000007'));
      editJourney(store, manager,
        contactOf('苏叶', '13704000001', 'suye-new@example.com', '四川省乐山市市中区', '', 'A'));
      deleteJourney(store, manager, '陆离');
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(5);
      expect(rows[4].name).assertEqual('苏叶');
      expect(rows[4].phone).assertEqual('13704000001');
      expect(countOf(contactNames(rows), '陆离')).assertEqual(0);
      expect(store.rowCount()).assertEqual(5);
      assertJourneyParity(manager, store);
    });

    /**
     * @tc.name   mutationJourneyDeleteThenReaddTail
     * @tc.desc   Re-adding a deleted name appends it at the tail instead of restoring its slot.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and delete 陆离 from the middle.
     *                   2. Re-add 陆离 with a new phone.
     *                   3. Compare the middle and tail positions.
     * @tc.expected      南枝 shifts into the middle slot and 陆离 sits last with the new phone.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyDeleteThenReaddTail', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      deleteJourney(store, manager, '陆离');
      addJourney(store, manager,
        contactOf('陆离', '13704000002', 'luli-again@example.com', '江苏省苏州市姑苏区', '', 'F'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(5);
      expect(rows[1].name).assertEqual('南枝');
      expect(rows[4].name).assertEqual('陆离');
      expect(rows[4].phone).assertEqual('13704000002');
      expect(countOf(contactNames(rows), '陆离')).assertEqual(1);
      assertJourneyParity(manager, store);
    });

    /**
     * @tc.name   mutationJourneyLongJourneyKeepsOrder
     * @tc.desc   Seven interleaved mutations keep the surviving rows in append order.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Add two rows, edit one, delete 南枝.
     *                   2. Add a third row, edit the second and delete 江晚.
     *                   3. Compare the final name list.
     * @tc.expected      Survivors are 陆离, 北辰, 清和, 苏叶, 元稹, 白居.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mutationJourneyLongJourneyKeepsOrder', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      addJourney(store, manager, validDraft('苏叶', '13705000001'));
      addJourney(store, manager, validDraft('元稹', '13705000002'));
      editJourney(store, manager,
        contactOf('苏叶', '13705000011', 'suye2@example.com', '四川省宜宾市翠屏区', '', 'A'));
      deleteJourney(store, manager, '南枝');
      addJourney(store, manager, validDraft('白居', '13705000003'));
      editJourney(store, manager,
        contactOf('元稹', '13705000012', 'yuanzhen2@example.com', '陕西省西安市碑林区', '', 'A'));
      deleteJourney(store, manager, '江晚');
      expect(sameStringArray(contactNames(manager.getContacts()),
        ['陆离', '北辰', '清和', '苏叶', '元稹', '白居'])).assertTrue();
      expect(manager.getContacts()[3].phone).assertEqual('13705000011');
      expect(manager.getContacts()[4].phone).assertEqual('13705000012');
      expect(manager.getContacts().length).assertEqual(6);
      assertJourneyParity(manager, store);
    });

    /**
     * @tc.name   mutationJourneySnapshotParityAfterSequence
     * @tc.desc   After a full sequence the two layer snapshots are equal field by field.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Apply add, edit and delete in sequence.
     *                   2. Capture snapshots from both layers.
     *                   3. Compare the snapshot arrays and one row in detail.
     * @tc.expected      The snapshot arrays match and the edited row carries every new value.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneySnapshotParityAfterSequence', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      addJourney(store, manager, validDraft('苏叶', '13706000001'));
      editJourney(store, manager,
        contactOf('苏叶', '13706000011', 'suye3@example.com', '四川省泸州市江阳区', '', 'A'));
      deleteJourney(store, manager, '北辰');
      const managerRows: Contact[] = manager.getContacts();
      const storeRows: Contact[] = store.query(true);
      expect(sameSnapshotArray(snapshotsOf(managerRows), snapshotsOf(storeRows))).assertTrue();
      expect(managerRows.length).assertEqual(5);
      expect(managerRows[4].email).assertEqual('suye3@example.com');
      expect(storeRows[4].email).assertEqual('suye3@example.com');
      expect(storeRows[4].category).assertEqual('A');
      expect(managerRows[4].category).assertEqual('A');
    });

    /**
     * @tc.name   mutationJourneyOracleFoldedSequence
     * @tc.desc   The shared oracles folded over the same steps reproduce the final ledger.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Apply add, edit and delete to the manager.
     *                   2. Fold the same steps through the three oracle helpers.
     *                   3. Compare the resulting snapshots.
     * @tc.expected      The ledger equals the folded oracle after all three steps.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mutationJourneyOracleFoldedSequence', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const added: Contact = contactOf('刘禹', '13707000001', 'liuyu@example.com', '广东省广州市越秀区', '', 'A');
      const updated: Contact = contactOf('刘禹', '13707000002', 'liuyu-new@example.com', '广东省深圳市福田区', '', 'A');
      seedJourney(store, manager, journeySeed());
      addJourney(store, manager, added);
      editJourney(store, manager, updated);
      deleteJourney(store, manager, '清和');
      let expected: Contact[] = expectedAfterAdd(journeySeed(), added);
      expected = expectedAfterUpdate(expected, updated);
      expected = expectedAfterDelete(expected, '清和');
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(expected))).assertTrue();
      expect(sameSnapshotArray(snapshotsOf(store.query(true)), snapshotsOf(expected))).assertTrue();
      expect(expected.length).assertEqual(5);
      expect(manager.getContacts()[4].email).assertEqual('liuyu-new@example.com');
    });

    /**
     * @tc.name   mutationJourneyLedgerDivergeOnClone
     * @tc.desc   The store clones on write, so a later draft edit reaches only the manager.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Add one draft instance to both layers.
     *                   2. Mutate the draft phone after the add.
     *                   3. Compare the tail row in both layers.
     * @tc.expected      The manager tail changes while the store tail keeps the original phone.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyLedgerDivergeOnClone', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      const draft: Contact = validDraft('柳永', '13708000001');
      addJourney(store, manager, draft);
      draft.phone = '13708009999';
      draft.category = 'F';
      expect(manager.getContacts()[5].phone).assertEqual('13708009999');
      expect(manager.getContacts()[5].category).assertEqual('F');
      expect(store.query(true)[5].phone).assertEqual('13708000001');
      expect(store.query(true)[5].category).assertEqual('A');
      expect(sameContact(manager.getContacts()[5], store.query(true)[5])).assertFalse();
      expect(manager.getContacts()[5].name).assertEqual(store.query(true)[5].name);
    });

    /**
     * @tc.name   mutationJourneySearchEmptyKeywordReturnsAll
     * @tc.desc   An empty keyword returns the whole ledger through a copy of the array.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and search with an empty keyword.
     *                   2. Add one row and search again.
     *                   3. Compare the counts with the ledger length.
     * @tc.expected      The empty search tracks the ledger size at five and then six.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneySearchEmptyKeywordReturnsAll', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      const first: Contact[] = SearchEngine.filterByName(manager.getContacts(), '');
      expect(first.length).assertEqual(5);
      expect(sameStringArray(contactNames(first), contactNames(manager.getContacts()))).assertTrue();
      addJourney(store, manager, validDraft('苏叶', '13709000001'));
      const second: Contact[] = SearchEngine.filterByName(manager.getContacts(), '');
      expect(second.length).assertEqual(6);
      expect(second.length).assertEqual(manager.getContacts().length);
      expect(searchNames(store.query(true), '').length).assertEqual(6);
    });

    /**
     * @tc.name   mutationJourneySearchCaseSensitiveKeyword
     * @tc.desc   The substring search is case sensitive for Latin names.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and add a row named Alice.
     *                   2. Search for alice and for Alice.
     *                   3. Compare both result counts.
     * @tc.expected      The lowercase keyword finds nothing while the exact case finds Alice.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneySearchCaseSensitiveKeyword', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      addJourney(store, manager, validDraft('Alice', '13709000002'));
      expect(searchNames(manager.getContacts(), 'alice').length).assertEqual(0);
      expect(searchNames(manager.getContacts(), 'Alice').length).assertEqual(1);
      expect(searchNames(manager.getContacts(), 'Alice')[0]).assertEqual('Alice');
      expect(searchNames(manager.getContacts(), 'ALICE').length).assertEqual(0);
      expect(searchNames(store.query(true), 'Alice').length).assertEqual(1);
      expect(searchNames(store.query(true), 'alice').length).assertEqual(0);
    });

    /**
     * @tc.name   mutationJourneySearchNoMatchEmpty
     * @tc.desc   A keyword that shares no substring with any name yields no rows.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows.
     *                   2. Search for two absent keywords.
     *                   3. Read the counts and the joined result.
     * @tc.expected      Both searches return zero rows and an empty joined string.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneySearchNoMatchEmpty', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      expect(searchNames(manager.getContacts(), '温岐').length).assertEqual(0);
      expect(searchNames(manager.getContacts(), 'ZZZ').length).assertEqual(0);
      expect(searchNames(manager.getContacts(), '江晚江晚').length).assertEqual(0);
      expect(joined(searchNames(manager.getContacts(), '温岐'))).assertEqual('');
      expect(searchNames(store.query(true), '温岐').length).assertEqual(0);
      expect(searchNames(manager.getContacts(), '温岐') instanceof Array).assertTrue();
    });

    /**
     * @tc.name   mutationJourneySearchSubstringMatchesMany
     * @tc.desc   One shared substring catches every name that contains it, in ledger order.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and add 江南 and 江北.
     *                   2. Search for the single character 江.
     *                   3. Compare the matched names and order.
     * @tc.expected      Three matches appear in the order 江晚, 江南, 江北.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneySearchSubstringMatchesMany', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      addJourney(store, manager, validDraft('江南', '13709000003'));
      addJourney(store, manager, validDraft('江北', '13709000004'));
      expect(sameStringArray(searchNames(manager.getContacts(), '江'), ['江晚', '江南', '江北'])).assertTrue();
      expect(searchNames(manager.getContacts(), '江').length).assertEqual(3);
      expect(searchNames(manager.getContacts(), '南').length).assertEqual(2);
      expect(searchNames(manager.getContacts(), '北').length).assertEqual(2);
      expect(searchNames(store.query(true), '江').length).assertEqual(3);
      expect(countOf(searchNames(manager.getContacts(), '江'), '江晚')).assertEqual(1);
    });

    /**
     * @tc.name   mutationJourneyGroupByCategoryOrder
     * @tc.desc   Grouping reports categories in first-seen order without repeats.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows across categories A to E.
     *                   2. Group them by category.
     *                   3. Add a second category A row and regroup.
     * @tc.expected      The group list stays A, B, C, D, E with no repeat after the add.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyGroupByCategoryOrder', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      const groups: string[] = SearchEngine.groupByCategory(manager.getContacts());
      expect(sameStringArray(groups, ['A', 'B', 'C', 'D', 'E'])).assertTrue();
      expect(uniqueStrings(groups).length).assertEqual(groups.length);
      addJourney(store, manager, validDraft('苏叶', '13709000005'));
      expect(sameStringArray(SearchEngine.groupByCategory(manager.getContacts()), ['A', 'B', 'C', 'D', 'E'])).assertTrue();
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(5);
      expect(SearchEngine.countCategory(manager.getContacts(), 'A')).assertEqual(2);
      expect(SearchEngine.groupByCategory(store.query(true)).length).assertEqual(5);
    });

    /**
     * @tc.name   mutationJourneyCategoryCountAfterAdd
     * @tc.desc   Adding two category C rows raises that category count without adding a group.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and count category C.
     *                   2. Add two rows that both use category C.
     *                   3. Recount C, A and the group total.
     * @tc.expected      Category C reaches three, A stays one and the group total stays five.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyCategoryCountAfterAdd', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      expect(SearchEngine.countCategory(manager.getContacts(), 'C')).assertEqual(1);
      addJourney(store, manager, contactOf('苏叶', '13709000006', 'suye4@example.com', '四川省南充市顺庆区', '', 'C'));
      addJourney(store, manager, contactOf('白居', '13709000007', 'baiju4@example.com', '陕西省渭南市临渭区', '', 'C'));
      expect(SearchEngine.countCategory(manager.getContacts(), 'C')).assertEqual(3);
      expect(SearchEngine.countCategory(manager.getContacts(), 'A')).assertEqual(1);
      expect(SearchEngine.countCategory(store.query(true), 'C')).assertEqual(3);
      expect(ContactMetrics.from(manager.getContacts()).categories).assertEqual(5);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(7);
    });

    /**
     * @tc.name   mutationJourneyInvalidDraftRejected
     * @tc.desc   A blank draft fails validation before any layer is touched.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a Contact with every field blank.
     *                   2. Validate it against the empty ledger.
     *                   3. Read the error codes and the submit verdict.
     * @tc.expected      Four empty-field codes are reported, the duplicate code is absent and submit is false.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneyInvalidDraftRejected', 0, () => {
      const blank: Contact = new Contact();
      const errors: string[] = ContactValidation.validate(blank, ContactManager.getInstance().getContacts());
      expect(errors.length).assertEqual(4);
      expect(errors.indexOf('name-empty') >= 0).assertTrue();
      expect(errors.indexOf('phone-empty') >= 0).assertTrue();
      expect(errors.indexOf('email-empty') >= 0).assertTrue();
      expect(errors.indexOf('address-empty') >= 0).assertTrue();
      expect(errors.indexOf('name-duplicate') < 0).assertTrue();
      expect(ContactValidation.canSubmit(blank)).assertFalse();
      expect(store.insertCalls).assertEqual(0);
    });

    /**
     * @tc.name   mutationJourneyDuplicateNameValidation
     * @tc.desc   The edit form rejects a name already present in the ledger.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows.
     *                   2. Validate a complete draft that reuses the name 南枝.
     *                   3. Validate the same draft with a fresh name.
     * @tc.expected      The duplicate draft fails with name-duplicate while the fresh draft can submit.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyDuplicateNameValidation', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      const duplicate: Contact = validDraft('南枝', '13710000001');
      const fresh: Contact = validDraft('温岐', '13710000002');
      const duplicateErrors: string[] = ContactValidation.validate(duplicate, manager.getContacts());
      expect(duplicateErrors.length).assertEqual(1);
      expect(duplicateErrors[0]).assertEqual('name-duplicate');
      expect(ContactValidation.canSubmit(duplicate, manager.getContacts())).assertFalse();
      expect(ContactValidation.validate(fresh, manager.getContacts()).length).assertEqual(0);
      expect(ContactValidation.canSubmit(fresh, manager.getContacts())).assertTrue();
      expect(ContactValidation.isDuplicateName(manager.getContacts(), '温岐')).assertFalse();
    });

    /**
     * @tc.name   mutationJourneyRouteUnknownActionFallsBack
     * @tc.desc   An unrecognised action resolves to the list route and is not a known action.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build an intent with an unknown action text.
     *                   2. Resolve the route through the static helper.
     *                   3. Compare with the list and edit routes.
     * @tc.expected      The fallback route is the list page and the action is not known.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyRouteUnknownActionFallsBack', 0, () => {
      const intent: RouteIntent = new RouteIntent('分享联系人', validDraft('分享', '13710000003'));
      expect(intent.url()).assertEqual(ROUTE_LIST);
      expect(RouteIntent.routeFor('分享联系人')).assertEqual(ROUTE_LIST);
      expect(RouteIntent.isKnownAction('分享联系人')).assertFalse();
      expect(intent.url() === ROUTE_EDIT).assertFalse();
      expect(intent.describe().endsWith(ROUTE_LIST)).assertTrue();
      expect(intent.toParams().text).assertEqual('分享联系人');
    });

    /**
     * @tc.name   mutationJourneyRouteAddAndEditShareTarget
     * @tc.desc   Add and edit both target AddressBookEdit while delete targets the list.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Resolve the route for the three known actions.
     *                   2. Compare the add route with the edit route.
     *                   3. Compare the delete route with both.
     * @tc.expected      Add and edit share the edit route and delete differs.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneyRouteAddAndEditShareTarget', 0, () => {
      const addRoute: string = RouteIntent.routeFor(ACTION_ADD);
      const editRoute: string = RouteIntent.routeFor(ACTION_EDIT);
      const deleteRoute: string = RouteIntent.routeFor(ACTION_DELETE);
      expect(addRoute).assertEqual(ROUTE_EDIT);
      expect(editRoute).assertEqual(ROUTE_EDIT);
      expect(addRoute).assertEqual(editRoute);
      expect(deleteRoute).assertEqual(ROUTE_LIST);
      expect(deleteRoute === ROUTE_EDIT).assertFalse();
      expect(RouteIntent.isKnownAction(ACTION_ADD) && RouteIntent.isKnownAction(ACTION_EDIT)).assertTrue();
      expect(RouteIntent.isKnownAction(ACTION_DELETE)).assertTrue();
    });

    /**
     * @tc.name   mutationJourneyRouteIntentCarriesContact
     * @tc.desc   RouterParams keeps the exact Contact reference and the action text.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Create a draft and an intent over it.
     *                   2. Convert to RouterParams.
     *                   3. Compare the payload reference and every field.
     * @tc.expected      The payload is the same instance and all six fields are readable.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneyRouteIntentCarriesContact', 0, () => {
      const draft: Contact = validDraft('王维', '13710000004');
      draft.avatar = 'wangwei.png';
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, draft);
      const params: RouterParams = intent.toParams();
      expect(params.data === draft).assertTrue();
      expect(params.text).assertEqual(ACTION_EDIT);
      expect((params.data as Contact).name).assertEqual('王维');
      expect((params.data as Contact).phone).assertEqual('13710000004');
      expect((params.data as Contact).avatar).assertEqual('wangwei.png');
      expect((params.data as Contact).category).assertEqual('A');
      expect(params.data !== undefined).assertTrue();
    });

    /**
     * @tc.name   mutationJourneyRoutePayloadLeavesLedgerAlone
     * @tc.desc   Editing a routed draft mutates the payload but not the stored ledger.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and build an edit intent for a new draft.
     *                   2. Change the draft phone after the intent is built.
     *                   3. Compare the payload with the ledger.
     * @tc.expected      The payload reflects the change while the ledger keeps its five original rows.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyRoutePayloadLeavesLedgerAlone', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      const draft: Contact = validDraft('王维', '13710000005');
      const intent: RouteIntent = new RouteIntent(ACTION_EDIT, draft);
      draft.phone = '13710009999';
      const params: RouterParams = intent.toParams();
      expect((params.data as Contact).phone).assertEqual('13710009999');
      expect(manager.getContacts().length).assertEqual(5);
      expect(countOf(contactNames(manager.getContacts()), '王维')).assertEqual(0);
      expect(store.rowCount()).assertEqual(5);
      expect(countOf(store.names(), '王维')).assertEqual(0);
      expect(intent.url()).assertEqual(ROUTE_EDIT);
    });

    /**
     * @tc.name   mutationJourneyMapperBucketKeyOrder
     * @tc.desc   The mapper writes the six columns in the declared order and repeated rows keep that order.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Map one draft and inspect every key and value.
     *                   2. Map the five seed rows with toBuckets.
     *                   3. Compare the key list with BUCKET_KEYS.
     * @tc.expected      Key order matches BUCKET_KEYS and the batch mapper returns five buckets.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyMapperBucketKeyOrder', 0, () => {
      const draft: Contact = validDraft('李贺', '13711000001');
      const bucket: Bucket = ContactMapper.toBucket(draft);
      expect(sameStringArray(bucket.keys, BUCKET_KEYS)).assertTrue();
      expect(bucket.keyAt(0)).assertEqual(FIELD_NAME);
      expect(bucket.keyAt(1)).assertEqual(FIELD_PHONE);
      expect(bucket.keyAt(5)).assertEqual(FIELD_CATEGORY);
      expect(bucket.valueAt(0)).assertEqual('李贺');
      expect(bucket.valueAt(4)).assertEqual('');
      expect(bucket.get(FIELD_EMAIL)).assertEqual('李贺@example.com');
      expect(bucket.get(FIELD_ADDRESS)).assertEqual('四川省成都市武侯区');
      expect(bucket.get(FIELD_AVATAR)).assertEqual('');
      expect(ContactMapper.toBuckets(journeySeed()).length).assertEqual(5);
    });

    /**
     * @tc.name   mutationJourneyUpdateBindingsOrder
     * @tc.desc   The update statement binds phone, email, address and name in that order.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build bindings for one edited contact.
     *                   2. Read the length and each position.
     *                   3. Compare with the store affected count after the same edit.
     * @tc.expected      Four bindings arrive in the documented order and one store row is affected.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyUpdateBindingsOrder', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      const edited: Contact = contactOf('陆离', '13711000002', 'luli-new@example.com', '江苏省扬州市邗江区', '', 'B');
      const bindings: string[] = updateBindings(edited);
      expect(bindings.length).assertEqual(4);
      expect(bindings[0]).assertEqual('13711000002');
      expect(bindings[1]).assertEqual('luli-new@example.com');
      expect(bindings[2]).assertEqual('江苏省扬州市邗江区');
      expect(bindings[3]).assertEqual('陆离');
      expect(editJourney(store, manager, edited)).assertEqual(1);
      expect(store.query(true)[1].phone).assertEqual(bindings[0]);
    });

    /**
     * @tc.name   mutationJourneyDeleteBindingsOrder
     * @tc.desc   The delete statement binds exactly one value, the contact name.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build bindings for a contact named 南枝.
     *                   2. Read the length and the single value.
     *                   3. Compare with the store removal count.
     * @tc.expected      One binding equals the name and the store removes one row.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneyDeleteBindingsOrder', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      const target: Contact = contactOf('南枝', '13711000003', 'nanzhi@example.com', '安徽省安庆市迎江区', '', 'C');
      const bindings: string[] = deleteBindings(target);
      expect(bindings.length).assertEqual(1);
      expect(bindings[0]).assertEqual('南枝');
      expect(deleteJourney(store, manager, bindings[0])).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(4);
      expect(countOf(store.names(), '南枝')).assertEqual(0);
      expect(deleteBindings(target)[0] === target.phone).assertFalse();
    });

    /**
     * @tc.name   mutationJourneySqlLiteralsStable
     * @tc.desc   The three statement literals still match the production text.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Read the update, delete and query literals.
     *                   2. Check their leading keywords and terminators.
     *                   3. Compare the update literal with an exact copy.
     * @tc.expected      The statements are unchanged and the query has no terminator.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mutationJourneySqlLiteralsStable', 0, () => {
      expect(SQL_UPDATE_CONTACT).assertEqual('UPDATE contact SET phone = ?, email = ?, address = ? WHERE name = ?;');
      expect(SQL_DELETE_CONTACT).assertEqual('DELETE FROM contact WHERE name = ?;');
      expect(SQL_QUERY_CONTACT).assertEqual('select * from contact');
      expect(SQL_UPDATE_CONTACT.startsWith('UPDATE contact')).assertTrue();
      expect(SQL_DELETE_CONTACT.startsWith('DELETE FROM contact')).assertTrue();
      expect(SQL_QUERY_CONTACT.indexOf(';') < 0).assertTrue();
      expect(SQL_UPDATE_CONTACT.endsWith(';')).assertTrue();
      expect(SQL_DELETE_CONTACT.endsWith(';')).assertTrue();
    });

    /**
     * @tc.name   mutationJourneyFallbackOnSqlError
     * @tc.desc   A thrown SQL error falls back to zero rows for batch insert and minus one otherwise.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Resolve the fallback for a failing batch insert.
     *                   2. Resolve the fallback for a failing query and update.
     *                   3. Resolve the fallback with no error.
     * @tc.expected      Batch insert yields zero, query and update yield minus one, success yields zero.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyFallbackOnSqlError', 0, () => {
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_SQL_EXECUTION)).assertEqual(0);
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.UPDATE_ONE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.DELETE_ONE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.INSERT_ONE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, 0)).assertEqual(0);
      expect(OperationCatalog.all().length).assertEqual(8);
      expect(OperationCatalog.all().indexOf(OperationCatalog.DEDUPE_ROWS)).assertEqual(7);
    });

    /**
     * @tc.name   mutationJourneyQueueJourneyTrace
     * @tc.desc   Three queued journey tasks complete in submission order and leave both layers equal.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed five rows and submit add, edit and delete tasks.
     *                   2. Drain the queue while applying each corresponding mutation.
     *                   3. Compare the trace, sizes and parity.
     * @tc.expected      The trace is add, edit, delete and the final rows match.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mutationJourneyQueueJourneyTrace', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      queue.submit('add');
      queue.submit('edit');
      queue.submit('delete');
      expect(queue.size()).assertEqual(3);
      addJourney(store, manager, validDraft('苏叶', '13712000001'));
      queue.complete(queue.runNext());
      editJourney(store, manager,
        contactOf('苏叶', '13712000011', 'suye5@example.com', '四川省德阳市旌阳区', '', 'A'));
      queue.complete(queue.runNext());
      deleteJourney(store, manager, '陆离');
      queue.complete(queue.runNext());
      expect(queue.trace()).assertEqual('add>edit>delete');
      expect(queue.completed.length).assertEqual(3);
      expect(queue.failed.length).assertEqual(0);
      expect(queue.size()).assertEqual(0);
      expect(manager.getContacts()[4].phone).assertEqual('13712000011');
      assertJourneyParity(manager, store);
    });

    /**
     * @tc.name   mutationJourneyCursorAfterJourney
     * @tc.desc   A cursor built after the journey skips the head and matches the visible oracle.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Apply add, edit and delete.
     *                   2. Query the store into a cursor and walk it.
     *                   3. Compare the count and the head name with the oracle.
     * @tc.expected      The walk emits four of the five remaining rows and starts at 陆离.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mutationJourneyCursorAfterJourney', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      addJourney(store, manager, validDraft('苏叶', '13713000001'));
      editJourney(store, manager,
        contactOf('苏叶', '13713000011', 'suye6@example.com', '四川省广元市利州区', '', 'B'));
      deleteJourney(store, manager, '江晚');
      const rows: Contact[] = store.query(true);
      const emitted: Contact[] = readContactsFromResultSet(new CursorResultSet(rows));
      expect(rows.length).assertEqual(5);
      expect(emitted.length).assertEqual(4);
      expect(emitted.length).assertEqual(expectedVisibleCount(rows));
      expect(emitted[0].name).assertEqual('南枝');
      expect(emitted[3].name).assertEqual('苏叶');
      expect(countOf(contactNames(emitted), '江晚')).assertEqual(0);
      expect(emitted[3].phone).assertEqual('13713000011');
    });

    /**
     * @tc.name   mutationJourneyMetricsFingerprintAfterJourney
     * @tc.desc   After the journey the manager metrics equal the store metrics on every counter.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Apply add, edit and delete.
     *                   2. Build metrics from the manager and from the store.
     *                   3. Compare counters, ratio and fingerprint.
     * @tc.expected      Both metric objects agree and the ledger has no duplicate names.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationJourneyMetricsFingerprintAfterJourney', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedJourney(store, manager, journeySeed());
      addJourney(store, manager, validDraft('苏叶', '13714000001'));
      editJourney(store, manager,
        contactOf('苏叶', '13714000011', 'suye7@example.com', '四川省遂宁市船山区', '', 'D'));
      deleteJourney(store, manager, '清和');
      const fromManager: ContactMetrics = ContactMetrics.from(manager.getContacts());
      const fromStore: ContactMetrics = ContactMetrics.from(store.query(true));
      expect(fromManager.total).assertEqual(5);
      expect(fromManager.uniqueNames).assertEqual(5);
      expect(fromManager.duplicateNames).assertEqual(0);
      expect(fromManager.fillRatio()).assertEqual(1);
      expect(fromManager.fingerprint()).assertEqual(fromStore.fingerprint());
      expect(fromManager.totalPhoneDigits).assertEqual(fromStore.totalPhoneDigits);
      expect(fromManager.categories).assertEqual(fromStore.categories);
    });
  });
}
