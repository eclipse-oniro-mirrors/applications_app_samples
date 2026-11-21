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
 * Cross layer regression after mixed operations. Anchors:
 *   ContactManager.ets:41-70     copy on read, append, first match update, delete by name
 *   DatabaseConnection.ets:241-272 store update binds phone, email and address only
 *   DatabaseConnection.ets:277-309 cursor walk with first row skip and name+phone dedupe
 *   Contact.ets:31-47            six field value object shared by both layers
 *   RdbConstant.ets:33-34        seven schema columns, six of them business fields
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  BUCKET_KEYS,
  SQL_CREATE_CONTACT,
  TABLE_CONTACT,
  SchemaInfo,
  ContactValidation,
  ContactMapper,
  ContactMetrics,
  StoreDouble,
  CursorResultSet,
  readContactsFromResultSet,
  expectedVisibleRows,
  expectedAfterAdd,
  expectedAfterDelete,
  expectedAfterUpdate,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  sameStringArray,
  countOf,
  uniqueStrings,
  joined,
  resetContactManager,
  SearchEngine,
  snapshotsOf,
  sameSnapshotArray,
  RouteIntent,
  ACTION_ADD,
  ACTION_EDIT,
  ACTION_DELETE,
  ROUTE_EDIT,
  ROUTE_LIST,
  OperationCatalog,
  fallbackForOperation,
  ERROR_NONE,
  ERROR_SQL_EXECUTION,
  ERROR_CONTEXT_MISSING
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

export default function crossLayerRegressionTest(): void {
  describe('CrossLayerRegression', () => {
    const store: StoreDouble = new StoreDouble();

    beforeAll(() => {
      logSuite('CrossLayerRegression', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      store.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CrossLayerRegression', 'end');
    });

    /**
     * @tc.name   regressionFreshLayersShareEmptyState
     * @tc.desc   Before seeding, manager, store and projection all report zero rows and no groups.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('regressionFreshLayersShareEmptyState', 0, () => {
      const manager = ContactManager.getInstance();
      expect(manager.getContacts().length).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(readContactsFromResultSet(new CursorResultSet(store.query(true))).length).assertEqual(0);
      expect(SearchEngine.groupByCategory(store.rows).length).assertEqual(0);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(0);
      expect(store.initialized).assertFalse();
    });

    /**
     * @tc.name   regressionSeedLayersAgreeOnNames
     * @tc.desc   After the seed the manager list and the store names are the same fifteen strings.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('regressionSeedLayersAgreeOnNames', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      expect(sameStringArray(contactNames(manager.getContacts()), store.names())).assertTrue();
      expect(manager.getContacts().length).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(uniqueStrings(store.names()).length).assertEqual(15);
    });

    /**
     * @tc.name   regressionSeedLayersAgreeOnSnapshots
     * @tc.desc   Row for row, snapshots from the manager copy equal snapshots from the store query.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('regressionSeedLayersAgreeOnSnapshots', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const managerSnapshots = snapshotsOf(manager.getContacts());
      const storeSnapshots = snapshotsOf(store.query(true));
      expect(managerSnapshots.length).assertEqual(15);
      expect(sameSnapshotArray(managerSnapshots, storeSnapshots)).assertTrue();
      expect(managerSnapshots[5].describe()).assertEqual(storeSnapshots[5].describe());
      expect(managerSnapshots[5].sameAs(storeSnapshots[6])).assertFalse();
    });

    /**
     * @tc.name   regressionAddAgreesAcrossManagerStoreAndMapper
     * @tc.desc   Adding one draft touches all three layers and each layer exposes the same six values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('regressionAddAgreesAcrossManagerStoreAndMapper', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const draft = contactOf('沈青禾', '13900001111', 'shen@example.com', '浙江省杭州市西湖区', '', 'B');
      const bucket = ContactMapper.toBucket(draft);
      store.insert(true, draft, 'ON_CONFLICT_REPLACE');
      manager.addContact(draft);
      const fromManager = manager.getContacts()[15];
      const fromStore = store.query(true)[15];
      expect(sameContact(fromManager, fromStore)).assertTrue();
      expect(bucket.get('name')).assertEqual(fromManager.name);
      expect(bucket.get('email')).assertEqual(fromStore.email);
      expect(bucket.size()).assertEqual(6);
      expect(manager.getContacts().length).assertEqual(store.rowCount());
      expect(sameStringArray(contactNames(manager.getContacts()), store.names())).assertTrue();
    });

    /**
     * @tc.name   regressionUpdateKeepsMutableFieldsInStep
     * @tc.desc   Phone, email and address change in both layers while name and category stay stable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('regressionUpdateKeepsMutableFieldsInStep', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[5]);
      edited.phone = '13900005555';
      edited.email = 'cameron.edited@example.com';
      edited.address = '改后的西安市地址';
      manager.updateContact(edited);
      const affected = store.updateContact(edited);
      expect(affected).assertEqual(1);
      expect(manager.getContacts()[5].phone).assertEqual(store.rows[5].phone);
      expect(manager.getContacts()[5].email).assertEqual(store.rows[5].email);
      expect(manager.getContacts()[5].address).assertEqual(store.rows[5].address);
      expect(manager.getContacts()[5].name).assertEqual(seed[5].name);
      expect(store.rows[5].category).assertEqual(seed[5].category);
    });

    /**
     * @tc.name   regressionManagerUpdateReplacesWholeRow
     * @tc.desc   The manager stores the edited object by reference, so the old row object is gone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionManagerUpdateReplacesWholeRow', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const edited = cloneContact(seed[6]);
      edited.category = 'F';
      edited.avatar = 'operate_rdb_in_taskpool_photo1.jpg';
      manager.updateContact(edited);
      const actual = manager.getContacts();
      expect(manager.getContacts().length).assertEqual(15);
      expect(actual[6].category).assertEqual('F');
      expect(actual[6].avatar).assertEqual('operate_rdb_in_taskpool_photo1.jpg');
      expect(sameSnapshotArray(snapshotsOf(actual), snapshotsOf(expectedAfterUpdate(seed, edited)))).assertTrue();
      expect(actual[6] === seed[6]).assertFalse();
    });

    /**
     * @tc.name   regressionCategoryDivergesAfterSameEdit
     * @tc.desc   The store cannot change category, so the two layers diverge only on that column.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionCategoryDivergesAfterSameEdit', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[7]);
      edited.category = 'A';
      manager.updateContact(edited);
      store.updateContact(edited);
      expect(manager.getContacts()[7].category).assertEqual('A');
      expect(store.rows[7].category).assertEqual('C');
      expect(sameContact(manager.getContacts()[7], store.rows[7])).assertFalse();
      expect(manager.getContacts()[7].phone).assertEqual(store.rows[7].phone);
      expect(snapshotsOf(manager.getContacts())[7].sameAs(snapshotsOf(store.rows)[7])).assertFalse();
    });

    /**
     * @tc.name   regressionDeleteAgreesOnRowRemoval
     * @tc.desc   Deleting one unique name removes one manager row and one store row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionDeleteAgreesOnRowRemoval', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      manager.deleteContact(contactOf('康纳', '', '', ''));
      const removed = store.deleteByName('康纳');
      expect(removed).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(14);
      expect(store.rowCount()).assertEqual(14);
      expect(sameStringArray(contactNames(manager.getContacts()), store.names())).assertTrue();
      expect(countOf(store.names(), '康纳')).assertEqual(0);
    });

    /**
     * @tc.name   regressionDuplicateNameDeleteRemovesEveryRow
     * @tc.desc   A duplicated display name disappears from both layers in every occurrence.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionDuplicateNameDeleteRemovesEveryRow', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      const doubled = seed.concat([cloneContact(seed[10])]);
      manager.setContacts(doubled);
      store.batchInsert(true, doubled);
      expect(countOf(store.names(), seed[10].name)).assertEqual(2);
      manager.deleteContact(contactOf(seed[10].name, '', '', ''));
      const removed = store.deleteByName(seed[10].name);
      expect(removed).assertEqual(2);
      expect(countOf(contactNames(manager.getContacts()), seed[10].name)).assertEqual(0);
      expect(countOf(store.names(), seed[10].name)).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(14);
      expect(store.rowCount()).assertEqual(14);
    });

    /**
     * @tc.name   regressionValidationRejectsWhatManagerWouldAccept
     * @tc.desc   The manager append does not check duplicates, but the edit form validator does.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionValidationRejectsWhatManagerWouldAccept', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const duplicate = contactOf('贝拉', '13900001111', 'bella@example.com', '湖北省武汉市江汉区');
      manager.addContact(duplicate);
      expect(manager.getContacts().length).assertEqual(16);
      expect(countOf(contactNames(manager.getContacts()), '贝拉')).assertEqual(2);
      const errors = ContactValidation.validate(duplicate, manager.getContacts());
      expect(errors.indexOf('name-duplicate') >= 0).assertTrue();
      expect(ContactValidation.canSubmit(duplicate, manager.getContacts())).assertFalse();
      expect(ContactValidation.validate(duplicate, []).length).assertEqual(0);
    });

    /**
     * @tc.name   regressionBucketRoundTripStableForSeed
     * @tc.desc   Every seed row equals its own bucket round trip, so the mapper loses no column.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('regressionBucketRoundTripStableForSeed', 0, () => {
      const seed = createSeedContacts();
      let stable = 0;
      for (let index = 0; index < seed.length; index++) {
        const restored = ContactMapper.fromBucket(ContactMapper.toBucket(seed[index]));
        if (sameContact(restored, seed[index])) {
          stable = stable + 1;
        }
      }
      expect(stable).assertEqual(15);
      expect(ContactMapper.toBuckets(seed).length).assertEqual(15);
      expect(joined(ContactMapper.toBucket(seed[0]).keys, ',')).assertEqual(joined(BUCKET_KEYS, ','));
      expect(ContactMapper.fromBucket(ContactMapper.toBucket(seed[12])).category).assertEqual('E');
    });

    /**
     * @tc.name   regressionMetricsStableAcrossMapping
     * @tc.desc   Mapping the seed through buckets and back does not change total, names or fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionMetricsStableAcrossMapping', 0, () => {
      const seed = createSeedContacts();
      const mapped: Contact[] = [];
      for (let index = 0; index < seed.length; index++) {
        mapped.push(ContactMapper.fromBucket(ContactMapper.toBucket(seed[index])));
      }
      const original = ContactMetrics.from(seed);
      const roundTrip = ContactMetrics.from(mapped);
      expect(original.total).assertEqual(roundTrip.total);
      expect(original.uniqueNames).assertEqual(roundTrip.uniqueNames);
      expect(original.categories).assertEqual(roundTrip.categories);
      expect(original.totalPhoneDigits).assertEqual(roundTrip.totalPhoneDigits);
      expect(original.fingerprint()).assertEqual(roundTrip.fingerprint());
      expect(sameSnapshotArray(snapshotsOf(mapped), snapshotsOf(seed))).assertTrue();
    });

    /**
     * @tc.name   regressionQueryCopyDoesNotLeakIntoStore
     * @tc.desc   Mutating a query result or its contacts never reaches the stored rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionQueryCopyDoesNotLeakIntoStore', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const firstRead = store.query(true);
      firstRead[0].name = '被改写';
      firstRead[0].category = 'Z';
      firstRead.splice(0, 10);
      expect(store.names()[0]).assertEqual('艾德里安');
      expect(store.rows[0].category).assertEqual('A');
      expect(store.rowCount()).assertEqual(15);
      expect(store.query(true).length).assertEqual(15);
      expect(sameContact(store.query(true)[0], seed[0])).assertTrue();
    });

    /**
     * @tc.name   regressionManagerCopyDoesNotLeakIntoManager
     * @tc.desc   The list array from getContacts can be reordered without changing the singleton.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionManagerCopyDoesNotLeakIntoManager', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const view = manager.getContacts();
      view.reverse();
      view.splice(0, 5);
      view.push(contactOf('外部', '13000000000', 'outer@example.com', '外部地址'));
      expect(manager.getContacts().length).assertEqual(15);
      expect(manager.getContacts()[0].name).assertEqual('艾德里安');
      expect(manager.getContacts()[14].name).assertEqual('法里');
      expect(sameStringArray(contactNames(manager.getContacts()), contactNames(seed))).assertTrue();
      expect(ContactMetrics.from(manager.getContacts()).uniqueNames).assertEqual(15);
    });

    /**
     * @tc.name   regressionAddThenDeleteRestoresSeedOrder
     * @tc.desc   Appending and then deleting the same name returns the exact original fifteen row order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionAddThenDeleteRestoresSeedOrder', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const added = contactOf('临时', '13900001111', 'temp@example.com', '临时地址');
      manager.addContact(added);
      expect(manager.getContacts().length).assertEqual(16);
      manager.deleteContact(added);
      expect(manager.getContacts().length).assertEqual(15);
      expect(sameStringArray(contactNames(manager.getContacts()), contactNames(seed))).assertTrue();
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(seed))).assertTrue();
      expect(contactNames(manager.getContacts()).indexOf('临时')).assertEqual(-1);
    });

    /**
     * @tc.name   regressionManagerKeepsFirstMatchOnly
     * @tc.desc   With two rows sharing a name the manager replaces slot one and leaves the second intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionManagerKeepsFirstMatchOnly', 0, () => {
      const manager = ContactManager.getInstance();
      const first = contactOf('同名', '13500001111', 'first@example.com', '甲地', '', 'A');
      const second = contactOf('同名', '13500002222', 'second@example.com', '乙地', '', 'B');
      manager.setContacts([first, second]);
      const edited = contactOf('同名', '13900009999', 'edited@example.com', '改后地址', '', 'C');
      manager.updateContact(edited);
      const actual = manager.getContacts();
      expect(actual.length).assertEqual(2);
      expect(actual[0].phone).assertEqual('13900009999');
      expect(actual[0].category).assertEqual('C');
      expect(actual[1].phone).assertEqual('13500002222');
      expect(actual[1].category).assertEqual('B');
      expect(sameContact(actual[1], second)).assertTrue();
    });

    /**
     * @tc.name   regressionStoreUpdateHitsEveryMatchingRow
     * @tc.desc   The store UPDATE is set based, so two same name rows both receive the new phone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionStoreUpdateHitsEveryMatchingRow', 0, () => {
      const first = contactOf('同名', '13500001111', 'first@example.com', '甲地', '', 'A');
      const second = contactOf('同名', '13500002222', 'second@example.com', '乙地', '', 'B');
      store.batchInsert(true, [first, second]);
      const edited = contactOf('同名', '13900009999', 'edited@example.com', '改后地址', '', 'C');
      const affected = store.updateContact(edited);
      expect(affected).assertEqual(2);
      expect(store.rows[0].phone).assertEqual('13900009999');
      expect(store.rows[1].phone).assertEqual('13900009999');
      expect(store.rows[0].email).assertEqual('edited@example.com');
      expect(store.rows[1].address).assertEqual('改后地址');
      expect(store.rows[1].category).assertEqual('B');
    });

    /**
     * @tc.name   regressionDeleteReportsAffectedRowCount
     * @tc.desc   deleteByName reports how many physical rows were removed, including duplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionDeleteReportsAffectedRowCount', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      expect(store.deleteByName('艾德里安')).assertEqual(1);
      expect(store.deleteByName('不存在')).assertEqual(0);
      store.insert(true, cloneContact(seed[0]), 'ON_CONFLICT_REPLACE');
      store.insert(true, cloneContact(seed[0]), 'ON_CONFLICT_REPLACE');
      expect(store.deleteByName('艾德里安')).assertEqual(2);
      expect(store.deleteCalls).assertEqual(3);
      expect(store.rowCount()).assertEqual(14);
      expect(store.names().indexOf('艾德里安')).assertEqual(-1);
    });

    /**
     * @tc.name   regressionMixedSequenceMatchesOracles
     * @tc.desc   Add, update then delete are checked against the three independent driver oracles.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('regressionMixedSequenceMatchesOracles', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const added = contactOf('新来', '13900001111', 'new@example.com', '新地址', '', 'D');
      manager.addContact(added);
      const afterAdd = expectedAfterAdd(seed, added);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(afterAdd))).assertTrue();
      const edited = cloneContact(added);
      edited.address = '第二版地址';
      manager.updateContact(edited);
      const afterUpdate = expectedAfterUpdate(afterAdd, edited);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(afterUpdate))).assertTrue();
      manager.deleteContact(contactOf(seed[2].name, '', '', ''));
      const afterDelete = expectedAfterDelete(afterUpdate, seed[2].name);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(afterDelete))).assertTrue();
      expect(manager.getContacts().length).assertEqual(15);
    });

    /**
     * @tc.name   regressionFingerprintChangesAfterAdd
     * @tc.desc   Appending one row changes the metrics fingerprint, while recomputing on the same rows does not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionFingerprintChangesAfterAdd', 0, () => {
      const seed = createSeedContacts();
      const before = ContactMetrics.from(seed).fingerprint();
      const repeated = ContactMetrics.from(createSeedContacts()).fingerprint();
      const after = ContactMetrics.from(seed.concat([contactOf('新增', '13900001111', 'add@example.com', '新增地址')]))
        .fingerprint();
      expect(before).assertEqual(repeated);
      expect(after === before).assertFalse();
      expect(ContactMetrics.from(seed).total).assertEqual(15);
      expect(ContactMetrics.from(seed.concat([new Contact()])).total).assertEqual(16);
    });

    /**
     * @tc.name   regressionCategoryCountsAgreeAcrossLayers
     * @tc.desc   All six label counts read the same from the manager copy and from the store rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionCategoryCountsAgreeAcrossLayers', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const labels = SearchEngine.groupByCategory(seed);
      expect(labels.length).assertEqual(6);
      for (let index = 0; index < labels.length; index++) {
        expect(SearchEngine.countCategory(manager.getContacts(), labels[index]))
          .assertEqual(SearchEngine.countCategory(store.rows, labels[index]));
      }
      expect(ContactMetrics.from(manager.getContacts()).categories)
        .assertEqual(ContactMetrics.from(store.rows).categories);
      expect(ContactMetrics.from(store.rows).categories).assertEqual(6);
    });

    /**
     * @tc.name   regressionPhoneDigitTotalAgreesAcrossLayers
     * @tc.desc   After an edit that lengthens one phone the manager and store digit totals match each other.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionPhoneDigitTotalAgreesAcrossLayers', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[3]);
      edited.phone = '123456789012';
      manager.updateContact(edited);
      store.updateContact(edited);
      const managerMetrics = ContactMetrics.from(manager.getContacts());
      const storeMetrics = ContactMetrics.from(store.rows);
      expect(managerMetrics.totalPhoneDigits).assertEqual(166);
      expect(storeMetrics.totalPhoneDigits).assertEqual(166);
      expect(managerMetrics.totalPhoneDigits).assertEqual(seed.length * 11 + 1);
      expect(managerMetrics.fingerprint()).assertEqual(storeMetrics.fingerprint());
      expect(store.rows[3].phone.length).assertEqual(12);
    });

    /**
     * @tc.name   regressionRouteCatalogCoversThreeActions
     * @tc.desc   Add and edit open the editor, delete opens the list, and all three are known actions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionRouteCatalogCoversThreeActions', 0, () => {
      const draft = contactOf('路由', '13900001111', 'route@example.com', '路由地址');
      expect(new RouteIntent(ACTION_ADD, draft).url()).assertEqual(ROUTE_EDIT);
      expect(new RouteIntent(ACTION_EDIT, draft).url()).assertEqual(ROUTE_EDIT);
      expect(new RouteIntent(ACTION_DELETE, draft).url()).assertEqual(ROUTE_LIST);
      expect(RouteIntent.isKnownAction(ACTION_ADD)).assertTrue();
      expect(RouteIntent.isKnownAction(ACTION_EDIT)).assertTrue();
      expect(RouteIntent.isKnownAction(ACTION_DELETE)).assertTrue();
      expect(RouteIntent.isKnownAction('查看')).assertFalse();
    });

    /**
     * @tc.name   regressionFallbackCodesPerOperation
     * @tc.desc   Each operation maps SQL failures to the fallback the page wrapper exposes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionFallbackCodesPerOperation', 0, () => {
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_SQL_EXECUTION)).assertEqual(0);
      expect(fallbackForOperation(OperationCatalog.DELETE_ONE, ERROR_CONTEXT_MISSING)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.UPDATE_ONE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.INSERT_ONE, ERROR_NONE)).assertEqual(0);
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_NONE)).assertEqual(0);
    });

    /**
     * @tc.name   regressionSchemaAgreesWithBucketKeys
     * @tc.desc   The six business columns parsed from CREATE TABLE match the six bucket keys in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionSchemaAgreesWithBucketKeys', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      expect(schema.table).assertEqual(TABLE_CONTACT);
      expect(schema.columnCount()).assertEqual(7);
      expect(schema.columns[0]).assertEqual('id');
      expect(schema.columns.slice(1).length).assertEqual(6);
      expect(sameStringArray(schema.columns.slice(1), BUCKET_KEYS)).assertTrue();
      expect(schema.primaryKey).assertEqual('id');
      expect(schema.autoincrement).assertTrue();
    });

    /**
     * @tc.name   regressionStorageCountersAfterMixedOperations
     * @tc.desc   A batch, an insert, an update, a delete and a query each tick exactly their own counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionStorageCountersAfterMixedOperations', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const draft = contactOf('计数', '13900001111', 'count@example.com', '计数地址');
      store.insert(true, draft, 'ON_CONFLICT_REPLACE');
      store.updateContact(draft);
      store.deleteByName('计数');
      store.query(true);
      logStep('regressionStorageCountersAfterMixedOperations', String(store.rowCount()));
      expect(store.batchCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(1);
      expect(store.updateCalls).assertEqual(1);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
    });

    /**
     * @tc.name   regressionFinalSnapshotAfterMixedJourney
     * @tc.desc   After add, edit and delete the manager snapshot equals a rebuilt expected list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('regressionFinalSnapshotAfterMixedJourney', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const added = contactOf('终态', '13900001111', 'final@example.com', '终态地址', '', 'A');
      manager.addContact(added);
      const edited = cloneContact(added);
      edited.phone = '13900002222';
      edited.email = 'final.edited@example.com';
      edited.address = '最终地址';
      manager.updateContact(edited);
      manager.deleteContact(contactOf(seed[14].name, '', '', ''));
      const expected = expectedAfterDelete(expectedAfterUpdate(expectedAfterAdd(seed, added), edited),
        seed[14].name);
      expect(manager.getContacts().length).assertEqual(15);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(expected))).assertTrue();
      expect(manager.getContacts()[14].name).assertEqual('终态');
      expect(manager.getContacts()[14].address).assertEqual('最终地址');
      expect(countOf(contactNames(manager.getContacts()), seed[14].name)).assertEqual(0);
    });

    /**
     * @tc.name   regressionFingerprintRestoredAfterRoundTrip
     * @tc.desc   A mapping round trip leaves the metrics fingerprint identical to the source fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionFingerprintRestoredAfterRoundTrip', 0, () => {
      const seed = createSeedContacts();
      const mapped: Contact[] = [];
      for (let index = 0; index < seed.length; index++) {
        mapped.push(ContactMapper.fromBucket(ContactMapper.toBucket(seed[index])));
      }
      expect(ContactMetrics.from(mapped).fingerprint()).assertEqual(ContactMetrics.from(seed).fingerprint());
      expect(ContactMetrics.from(mapped).total).assertEqual(15);
      expect(ContactMetrics.from(mapped).totalPhoneDigits).assertEqual(165);
      expect(sameSnapshotArray(snapshotsOf(mapped), snapshotsOf(seed))).assertTrue();
      expect(mapped[4].name).assertEqual('本杰明');
    });

    /**
     * @tc.name   regressionBlankNameDeleteRemovesBlankRows
     * @tc.desc   A blank display name can be deleted by name, removing every blank row from both layers.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionBlankNameDeleteRemovesBlankRows', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = [
        contactOf('', '13500001111', 'blank1@example.com', '空名一地'),
        contactOf('', '13500002222', 'blank2@example.com', '空名二地'),
        contactOf('正常', '13500003333', 'normal@example.com', '正常地')
      ];
      manager.setContacts(rows);
      store.batchInsert(true, rows);
      manager.deleteContact(contactOf('', '', '', ''));
      const removed = store.deleteByName('');
      expect(removed).assertEqual(2);
      expect(manager.getContacts().length).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
      expect(manager.getContacts()[0].name).assertEqual('正常');
      expect(store.names()[0]).assertEqual('正常');
    });

    /**
     * @tc.name   regressionValidationAcceptsAnEditedSeedRow
     * @tc.desc   Editing a seed row without changing its name keeps it valid against the directory.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionValidationAcceptsAnEditedSeedRow', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const others = manager.getContacts();
      const edited = cloneContact(manager.getContacts()[0]);
      edited.phone = '13900001111';
      edited.email = 'aidelian.edit@example.com';
      const withoutSelf: Contact[] = [];
      for (let index = 0; index < others.length; index++) {
        if (others[index].name !== edited.name) {
          withoutSelf.push(others[index]);
        }
      }
      expect(ContactValidation.validate(edited, withoutSelf).length).assertEqual(0);
      expect(ContactValidation.validate(edited, others).indexOf('name-duplicate') >= 0).assertTrue();
      expect(ContactValidation.canSubmit(edited, withoutSelf)).assertTrue();
    });

    /**
     * @tc.name   regressionCursorRowCountMatchesQueryLength
     * @tc.desc   The cursor reports the same row count as the store query, before and after additions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionCursorRowCountMatchesQueryLength', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const cursor = new CursorResultSet(store.query(true));
      expect(cursor.rowCount()).assertEqual(store.query(true).length);
      expect(cursor.rowCount()).assertEqual(15);
      store.insert(true, contactOf('追加', '13900001111', 'append@example.com', '追加地址'), 'ON_CONFLICT_REPLACE');
      const grown = new CursorResultSet(store.query(true));
      expect(grown.rowCount()).assertEqual(16);
      expect(grown.columnNames.length).assertEqual(6);
      expect(grown.getColumnIndex('category')).assertEqual(5);
    });

    /**
     * @tc.name   regressionVisibleCountAfterMixedAddAndDelete
     * @tc.desc   The projected list length follows add and delete offsets while the raw store keeps all rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('regressionVisibleCountAfterMixedAddAndDelete', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      expect(expectedVisibleRows(store.query(true)).length).assertEqual(14);
      store.insert(true, contactOf('追加甲', '13900001111', 'a1@example.com', '追加一地'), 'ON_CONFLICT_REPLACE');
      expect(expectedVisibleRows(store.query(true)).length).assertEqual(15);
      store.deleteByName('追加甲');
      expect(expectedVisibleRows(store.query(true)).length).assertEqual(14);
      expect(store.rowCount()).assertEqual(15);
      expect(readContactsFromResultSet(new CursorResultSet(store.query(true))).length)
        .assertEqual(expectedVisibleRows(store.query(true)).length);
    });

    /**
     * @tc.name   regressionLayerLengthsAgreeAfterEveryStep
     * @tc.desc   Manager length and store row count stay equal through seed, add, delete and re-add.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionLayerLengthsAgreeAfterEveryStep', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      expect(manager.getContacts().length).assertEqual(store.rowCount());
      const added = contactOf('步进', '13900001111', 'step@example.com', '步进地址');
      manager.addContact(added);
      store.insert(true, added, 'ON_CONFLICT_REPLACE');
      expect(manager.getContacts().length).assertEqual(store.rowCount());
      manager.deleteContact(contactOf(seed[0].name, '', '', ''));
      store.deleteByName(seed[0].name);
      expect(manager.getContacts().length).assertEqual(store.rowCount());
      manager.addContact(added);
      store.insert(true, added, 'ON_CONFLICT_REPLACE');
      expect(manager.getContacts().length).assertEqual(16);
      expect(store.rowCount()).assertEqual(16);
    });

    /**
     * @tc.name   regressionSeedAvatarBlankOnBothLayers
     * @tc.desc   The literal seed has no avatar, and neither the manager nor a bucket round trip adds one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('regressionSeedAvatarBlankOnBothLayers', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      let filled = 0;
      for (let index = 0; index < manager.getContacts().length; index++) {
        if (manager.getContacts()[index].avatar.length > 0) {
          filled = filled + 1;
        }
      }
      expect(filled).assertEqual(0);
      expect(ContactMapper.toBucket(seed[0]).get('avatar')).assertEqual('');
      expect(ContactMapper.fromBucket(ContactMapper.toBucket(seed[0])).avatar).assertEqual('');
      expect(store.rows[9].avatar).assertEqual('');
      expect(ContactMetrics.from(store.rows).total).assertEqual(15);
    });

    /**
     * @tc.name   regressionErrorConstantsAreDistinct
     * @tc.desc   The four SQL error codes used by the fallback helper never collide with success.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('regressionErrorConstantsAreDistinct', 0, () => {
      expect(ERROR_NONE).assertEqual(0);
      expect(ERROR_SQL_EXECUTION === ERROR_NONE).assertFalse();
      expect(ERROR_CONTEXT_MISSING === ERROR_SQL_EXECUTION).assertFalse();
      expect(ERROR_SQL_EXECUTION).assertEqual(14800015);
      expect(fallbackForOperation(OperationCatalog.CREATE_TABLE, ERROR_NONE)).assertEqual(0);
      expect(fallbackForOperation(OperationCatalog.CREATE_TABLE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(ERROR_CONTEXT_MISSING > 0).assertTrue();
      expect(ERROR_SQL_EXECUTION > ERROR_CONTEXT_MISSING).assertTrue();
    });

    /**
     * @tc.name   regressionFingerprintDistinguishesDifferentLayouts
     * @tc.desc   Two directories with different category spreads fingerprint differently even when totals match.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CrossLayerRegression scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('regressionFingerprintDistinguishesDifferentLayouts', 0, () => {
      const left = [
        contactOf('甲', '13500001111', 'a@example.com', '甲地', '', 'A'),
        contactOf('乙', '13500002222', 'b@example.com', '乙地', '', 'A')
      ];
      const right = [
        contactOf('甲', '13500001111', 'a@example.com', '甲地', '', 'A'),
        contactOf('乙', '13500002222', 'b@example.com', '乙地', '', 'B')
      ];
      const leftMetrics = ContactMetrics.from(left);
      const rightMetrics = ContactMetrics.from(right);
      expect(leftMetrics.total).assertEqual(rightMetrics.total);
      expect(leftMetrics.categories).assertEqual(1);
      expect(rightMetrics.categories).assertEqual(2);
      expect(leftMetrics.fingerprint() === rightMetrics.fingerprint()).assertFalse();
      expect(leftMetrics.fillRatio()).assertEqual(1);
    });
  });
}
