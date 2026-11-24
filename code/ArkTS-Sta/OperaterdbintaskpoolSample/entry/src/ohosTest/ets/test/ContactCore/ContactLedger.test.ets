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
 * ContactLedger keeps the ContactManager ledger and the StoreDouble ledger in
 * lockstep so parity and divergence are both pinned.
 *
 * Production anchors:
 *   ContactManager.ets:30-38   singleton with a private constructor
 *   ContactManager.ets:41-43   getContacts copies the array shell only
 *   ContactManager.ets:46-48   setContacts copies the array shell only
 *   ContactManager.ets:50-53   addContact appends without cloning elements
 *   ContactManager.ets:55-65   updateContact replaces the first name match
 *   ContactManager.ets:67-70   deleteContact filters every name match
 *   DatabaseConnection.ets:187-221  insert with ON_CONFLICT_REPLACE
 *   DatabaseConnection.ets:226-236  delete by name
 *   DatabaseConnection.ets:241-272  update phone/email/address by name
 *
 * StoreDouble clones rows on write and read, ContactManager does not, so the
 * suite separates row parity from instance identity on purpose.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  StoreDouble,
  ContactMetrics,
  TaskPoolQueue,
  CONFLICT_REPLACE,
  contactOf,
  contactNames,
  sameContact,
  sameStringArray,
  joined,
  countOf,
  uniqueStrings,
  resetContactManager,
  expectedAfterAdd,
  expectedAfterDelete,
  expectedAfterUpdate,
  snapshotsOf,
  sameSnapshotArray,
  createSeedContacts
} from '../Shared/SharedDriver';

/** Five deterministic rows used by the ordering and parity cases. */
function ledgerSeed(): Contact[] {
  const rows: Contact[] = [];
  rows.push(contactOf('岑野', '13510000001', 'cenye@example.com', '浙江省宁波市海曙区', '', 'A'));
  rows.push(contactOf('池月', '13510000002', 'chiyue@example.com', '江苏省无锡市梁溪区', '', 'B'));
  rows.push(contactOf('储安', '13510000003', 'chuan@example.com', '安徽省芜湖市镜湖区', '', 'C'));
  rows.push(contactOf('褚宁', '13510000004', 'chuning@example.com', '福建省厦门市思明区', '', 'D'));
  rows.push(contactOf('淳于', '13510000005', 'chunyu@example.com', '江西省九江市浔阳区', '', 'E'));
  return rows;
}

/** Rows with two repeated names so first-match semantics stay observable. */
function duplicateLedger(): Contact[] {
  const rows: Contact[] = [];
  rows.push(contactOf('端木', '13520000001', 'duanmu@example.com', '山东省青岛市市南区', '', 'A'));
  rows.push(contactOf('东方', '13520000002', 'dongfang@example.com', '河南省洛阳市西工区', '', 'B'));
  rows.push(contactOf('端木', '13520000003', 'duanmu2@example.com', '山东省烟台市芝罘区', '', 'C'));
  rows.push(contactOf('东方', '13520000004', 'dongfang2@example.com', '河南省开封市鼓楼区', '', 'D'));
  rows.push(contactOf('端木', '13520000005', 'duanmu3@example.com', '山东省潍坊市奎文区', '', 'E'));
  return rows;
}

/** Builds count rows with an ordered name suffix and a fixed category cycle. */
function bulkLedger(prefix: string, count: number): Contact[] {
  const rows: Contact[] = [];
  for (let index = 0; index < count; index++) {
    const suffix: string = String(200 + index);
    rows.push(contactOf(prefix + suffix, '1361000' + suffix, prefix + suffix + '@example.com',
      '广东省佛山市禅城区' + suffix, '', 'A'));
  }
  return rows;
}

/** Installs rows in the production singleton and returns it. */
function installLedger(manager: ContactManager, rows: Contact[]): ContactManager {
  manager.setContacts(rows);
  return manager;
}

/** Seeds both ledgers with the same rows, store first so init is covered. */
function seedBoth(store: StoreDouble, manager: ContactManager, rows: Contact[]): void {
  store.batchInsert(true, rows);
  manager.setContacts(rows);
}

/** Adds to both ledgers in the same order. */
function addBoth(store: StoreDouble, manager: ContactManager, contact: Contact): void {
  store.insert(true, contact, CONFLICT_REPLACE);
  manager.addContact(contact);
}

/** Updates both ledgers and returns the store affected count. */
function updateBoth(store: StoreDouble, manager: ContactManager, contact: Contact): number {
  const affected: number = store.updateContact(contact);
  manager.updateContact(contact);
  return affected;
}

/** Deletes from both ledgers and returns the store removed count. */
function deleteBoth(store: StoreDouble, manager: ContactManager, name: string): number {
  const removed: number = store.deleteByName(name);
  manager.deleteContact(contactOf(name, '', '', ''));
  return removed;
}

/** Asserts that both ledgers expose the same rows in the same order. */
function assertParity(manager: ContactManager, store: StoreDouble): void {
  const managerRows: Contact[] = manager.getContacts();
  const storeRows: Contact[] = store.query(true);
  expect(managerRows.length).assertEqual(storeRows.length);
  expect(sameStringArray(contactNames(managerRows), contactNames(storeRows))).assertTrue();
  expect(sameSnapshotArray(snapshotsOf(managerRows), snapshotsOf(storeRows))).assertTrue();
  expect(joined(contactNames(managerRows))).assertEqual(joined(contactNames(storeRows)));
}

export default function contactLedgerTest(): void {
  describe('ContactLedger', () => {
    const store: StoreDouble = new StoreDouble();
    const queue: TaskPoolQueue = new TaskPoolQueue();

    beforeAll(() => {
      logSuite('ContactLedger', 'begin');
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
      logSuite('ContactLedger', 'end');
    });

    /**
     * @tc.name   contactLedgerStartsEmptyAfterReset
     * @tc.desc   A reset leaves both ledgers empty while the singleton identity survives.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Read the manager and the store after the reset.
     *                   2. Compare the row counts and the joined name list.
     *                   3. Confirm the store has run no observable operation yet.
     * @tc.expected      No rows are stored anywhere and the singleton reference is unchanged.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerStartsEmptyAfterReset', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      expect(manager.getContacts().length).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(contactNames(manager.getContacts()).length).assertEqual(0);
      expect(joined(contactNames(store.query(true)))).assertEqual('');
      expect(store.insertCalls).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(queue.size()).assertEqual(0);
    });

    /**
     * @tc.name   contactLedgerSeedInstallsSameRowsInBothLedgers
     * @tc.desc   Seeding the store and the manager with one array yields identical ledgers.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers with the five-row ledger fixture.
     *                   2. Read both ledgers back in insertion order.
     *                   3. Compare names, lengths and snapshots.
     * @tc.expected      Both ledgers hold five rows with the same values in the same order.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerSeedInstallsSameRowsInBothLedgers', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      expect(manager.getContacts().length).assertEqual(5);
      expect(store.rowCount()).assertEqual(5);
      expect(store.batchCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      assertParity(manager, store);
      expect(manager.getContacts()[4].name).assertEqual('淳于');
    });

    /**
     * @tc.name   contactLedgerAddAppendsToTail
     * @tc.desc   An append lands after every existing row instead of re-sorting the ledger.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Install the five-row fixture.
     *                   2. Append one contact named 昌平 through both ledgers.
     *                   3. Read the tail position and the full name list.
     * @tc.expected      The new row is last and the first five names keep their order.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerAddAppendsToTail', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      addBoth(store, manager, contactOf('昌平', '13530000001', 'changping@example.com', '北京市昌平区', '', 'F'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(6);
      expect(rows[5].name).assertEqual('昌平');
      expect(rows[0].name).assertEqual('岑野');
      expect(joined(contactNames(rows))).assertEqual(joined(contactNames(ledgerSeed())) + ',昌平');
      expect(store.rowCount()).assertEqual(6);
    });

    /**
     * @tc.name   contactLedgerAddKeepsPriorOrder
     * @tc.desc   Three successive appends keep insertion order and never move earlier rows.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Start from an empty ledger.
     *                   2. Append three contacts one at a time.
     *                   3. Compare the name list with the oracle.
     * @tc.expected      Names appear in the exact append order.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerAddKeepsPriorOrder', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const first: Contact = contactOf('薄暮', '13540000001', 'bomu@example.com', '山西省太原市小店区', '', 'A');
      const second: Contact = contactOf('卜商', '13540000002', 'bushang@example.com', '河北省石家庄市长安区', '', 'B');
      const third: Contact = contactOf('蔡泽', '13540000003', 'caize@example.com', '湖北省宜昌市西陵区', '', 'C');
      addBoth(store, manager, first);
      addBoth(store, manager, second);
      addBoth(store, manager, third);
      expect(sameStringArray(contactNames(manager.getContacts()), ['薄暮', '卜商', '蔡泽'])).assertTrue();
      expect(manager.getContacts()[1].phone).assertEqual('13540000002');
      expect(store.names().indexOf('蔡泽')).assertEqual(2);
      assertParity(manager, store);
    });

    /**
     * @tc.name   contactLedgerAddParityAfterEachAppend
     * @tc.desc   Row parity holds after every single append, not only after the last one.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Install an empty pair of ledgers.
     *                   2. Append one row and assert parity, then append a second and assert again.
     *                   3. Append a third row and compare the final snapshots.
     * @tc.expected      All three checkpoints report identical ledgers.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerAddParityAfterEachAppend', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      addBoth(store, manager, contactOf('单雄', '13550000001', 'shanxiong@example.com', '陕西省宝鸡市渭滨区', '', 'A'));
      assertParity(manager, store);
      expect(store.insertCalls).assertEqual(1);
      addBoth(store, manager, contactOf('狄青', '13550000002', 'diqing@example.com', '甘肃省兰州市城关区', '', 'B'));
      assertParity(manager, store);
      addBoth(store, manager, contactOf('窦宪', '13550000003', 'douxian@example.com', '宁夏银川市兴庆区', '', 'C'));
      assertParity(manager, store);
      expect(manager.getContacts().length).assertEqual(3);
      expect(store.insertCalls).assertEqual(3);
      expect(manager.getContacts()[2].name).assertEqual('窦宪');
    });

    /**
     * @tc.name   contactLedgerAddSharesInstanceWithManagerOnly
     * @tc.desc   The manager stores the added instance while the store persists a clone.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Install the five-row fixture.
     *                   2. Add one contact instance through both ledgers.
     *                   3. Compare element identity in each ledger.
     * @tc.expected      Manager identity is preserved, store identity is not, values still match.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerAddSharesInstanceWithManagerOnly', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      const added: Contact = contactOf('樊於', '13560000001', 'fanyu@example.com', '重庆市渝中区', '', 'D');
      addBoth(store, manager, added);
      const managerRows: Contact[] = manager.getContacts();
      const storeRows: Contact[] = store.query(true);
      expect(managerRows[5] === added).assertTrue();
      expect(storeRows[5] === added).assertFalse();
      expect(sameContact(storeRows[5], added)).assertTrue();
      expect(managerRows[5].name).assertEqual('樊於');
      expect(storeRows[5].email).assertEqual('fanyu@example.com');
    });

    /**
     * @tc.name   contactLedgerStoreCloneIsolatesLaterEdits
     * @tc.desc   Editing a store row in place does not reach the manager ledger.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers with the five-row fixture.
     *                   2. Mutate the store copy of row two directly.
     *                   3. Read the manager row two and the store row two.
     * @tc.expected      Only the store row changes, the manager keeps the original phone.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerStoreCloneIsolatesLaterEdits', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      store.rows[1].phone = '13777777777';
      store.rows[1].category = 'F';
      expect(store.rows[1].phone).assertEqual('13777777777');
      expect(manager.getContacts()[1].phone).assertEqual('13510000002');
      expect(manager.getContacts()[1].category).assertEqual('B');
      expect(store.query(true)[1].phone).assertEqual('13777777777');
      expect(manager.getContacts().length).assertEqual(5);
    });

    /**
     * @tc.name   contactLedgerManagerEditLeaksIntoSiblingSnapshot
     * @tc.desc   Two reads share element references, so an edit through one is visible through the other.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Install the fixture and take two independent reads.
     *                   2. Edit row one through the first read.
     *                   3. Compare both reads and the stored row.
     * @tc.expected      Both reads observe the edit because only the array shell was copied.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerManagerEditLeaksIntoSiblingSnapshot', 0, () => {
      const manager: ContactManager = installLedger(ContactManager.getInstance(), ledgerSeed());
      const first: Contact[] = manager.getContacts();
      const second: Contact[] = manager.getContacts();
      expect(first === second).assertFalse();
      expect(first[0] === second[0]).assertTrue();
      first[0].phone = '13888888888';
      first[0].address = '上海市静安区';
      expect(second[0].phone).assertEqual('13888888888');
      expect(second[0].address).assertEqual('上海市静安区');
      expect(manager.getContacts()[0].phone).assertEqual('13888888888');
    });

    /**
     * @tc.name   contactLedgerGetContactsShellIsolation
     * @tc.desc   Pushing and splicing a returned array never changes the stored ledger.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Install the fixture and take one read.
     *                   2. Push a row and splice the first row out of that read.
     *                   3. Read the ledger again.
     * @tc.expected      The stored ledger still holds exactly the five original names.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerGetContactsShellIsolation', 0, () => {
      const manager: ContactManager = installLedger(ContactManager.getInstance(), ledgerSeed());
      const snapshot: Contact[] = manager.getContacts();
      snapshot.push(contactOf('公孙', '13570000001', 'gongsun@example.com', '天津市和平区', '', 'A'));
      snapshot.splice(0, 1);
      expect(snapshot.length).assertEqual(5);
      expect(manager.getContacts().length).assertEqual(5);
      expect(manager.getContacts()[0].name).assertEqual('岑野');
      expect(joined(contactNames(manager.getContacts()))).assertEqual('岑野,池月,储安,褚宁,淳于');
      expect(countOf(contactNames(manager.getContacts()), '公孙')).assertEqual(0);
    });

    /**
     * @tc.name   contactLedgerSetContactsShellIsolation
     * @tc.desc   Appending to the source array after setContacts leaves the ledger unchanged.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build a five-row source array and install it.
     *                   2. Append a sixth row to the source array.
     *                   3. Read the ledger and compare with the original names.
     * @tc.expected      The ledger keeps five rows and never sees the late source append.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerSetContactsShellIsolation', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const source: Contact[] = ledgerSeed();
      manager.setContacts(source);
      source.push(contactOf('郭开', '13580000001', 'guokai@example.com', '辽宁省大连市中山区', '', 'B'));
      expect(source.length).assertEqual(6);
      expect(manager.getContacts().length).assertEqual(5);
      expect(sameStringArray(contactNames(manager.getContacts()), contactNames(ledgerSeed()))).assertTrue();
      expect(manager.getContacts()[4].name).assertEqual('淳于');
      expect(countOf(contactNames(manager.getContacts()), '郭开')).assertEqual(0);
    });

    /**
     * @tc.name   contactLedgerSetContactsKeepsElementReference
     * @tc.desc   setContacts copies the shell, so a source element edit still reaches the ledger.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Install a five-row source array.
     *                   2. Edit the first source element in place.
     *                   3. Read the ledger row one and the neighbour row.
     * @tc.expected      Row one reflects the edit while row two stays untouched.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerSetContactsKeepsElementReference', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const source: Contact[] = ledgerSeed();
      manager.setContacts(source);
      source[0].phone = '13911112222';
      source[0].category = 'F';
      expect(manager.getContacts()[0].phone).assertEqual('13911112222');
      expect(manager.getContacts()[0].category).assertEqual('F');
      expect(manager.getContacts()[1].phone).assertEqual('13510000002');
      expect(manager.getContacts()[1].category).assertEqual('B');
      expect(manager.getContacts().length).assertEqual(5);
    });

    /**
     * @tc.name   contactLedgerUpdateReplacesFirstMatchOnly
     * @tc.desc   updateContact replaces the first row with a matching name and stops.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Install the fixture with three rows named 端木.
     *                   2. Update 端木 with a new phone through the manager.
     *                   3. Inspect all three 端木 rows in the manager.
     * @tc.expected      Only the first 端木 row changes, the later two keep their phones.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerUpdateReplacesFirstMatchOnly', 0, () => {
      const manager: ContactManager = installLedger(ContactManager.getInstance(), duplicateLedger());
      manager.updateContact(contactOf('端木', '13920000009', 'duanmu-new@example.com', '山东省济南市历下区', '', 'A'));
      const rows: Contact[] = manager.getContacts();
      expect(rows[0].phone).assertEqual('13920000009');
      expect(rows[0].email).assertEqual('duanmu-new@example.com');
      expect(rows[2].phone).assertEqual('13520000003');
      expect(rows[4].phone).assertEqual('13520000005');
      expect(rows.length).assertEqual(5);
    });

    /**
     * @tc.name   contactLedgerUpdateDivergesFromStoreOnDuplicates
     * @tc.desc   The store updates every name match while the manager updates only the first.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers with the duplicate fixture.
     *                   2. Update 端木 through both ledgers.
     *                   3. Compare each ledger at the three matching positions.
     * @tc.expected      The store reports three affected rows and the manager keeps two stale phones.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerUpdateDivergesFromStoreOnDuplicates', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, duplicateLedger());
      const affected: number = updateBoth(store, manager,
        contactOf('端木', '13920000010', 'duanmu-store@example.com', '山东省淄博市张店区', '', 'B'));
      expect(affected).assertEqual(3);
      expect(store.updateCalls).assertEqual(1);
      expect(store.query(true)[0].phone).assertEqual('13920000010');
      expect(store.query(true)[2].phone).assertEqual('13920000010');
      expect(store.query(true)[4].phone).assertEqual('13920000010');
      expect(manager.getContacts()[0].phone).assertEqual('13920000010');
      expect(manager.getContacts()[2].phone).assertEqual('13520000003');
      expect(manager.getContacts()[4].phone).assertEqual('13520000005');
    });

    /**
     * @tc.name   contactLedgerUpdateMissingNameIsNoOp
     * @tc.desc   Updating a name that is not in the ledger leaves every row untouched.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers with the five-row fixture.
     *                   2. Update a name that is absent from both ledgers.
     *                   3. Compare the affected count and the row snapshots.
     * @tc.expected      Zero rows are affected and both ledgers keep their snapshots.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerUpdateMissingNameIsNoOp', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      const before: Contact[] = manager.getContacts();
      const affected: number = updateBoth(store, manager,
        contactOf('南宫', '13930000001', 'nangong@example.com', '广西南宁市青秀区', '', 'C'));
      expect(affected).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(5);
      expect(sameSnapshotArray(snapshotsOf(before), snapshotsOf(manager.getContacts()))).assertTrue();
      expect(store.updateCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(5);
    });

    /**
     * @tc.name   contactLedgerUpdateKeepsRowPosition
     * @tc.desc   A replacement reuses the original slot, so no neighbour shifts index.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers with the five-row fixture.
     *                   2. Update the middle row through both ledgers.
     *                   3. Read the neighbours and the name order.
     * @tc.expected      The updated row stays at index two and both neighbours keep their values.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerUpdateKeepsRowPosition', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      updateBoth(store, manager,
        contactOf('储安', '13940000001', 'chuan-new@example.com', '安徽省合肥市庐阳区', '', 'C'));
      const rows: Contact[] = manager.getContacts();
      expect(rows[2].name).assertEqual('储安');
      expect(rows[2].phone).assertEqual('13940000001');
      expect(rows[1].name).assertEqual('池月');
      expect(rows[3].name).assertEqual('褚宁');
      expect(rows[1].phone).assertEqual('13510000002');
      expect(sameStringArray(contactNames(rows), contactNames(ledgerSeed()))).assertTrue();
      assertParity(manager, store);
    });

    /**
     * @tc.name   contactLedgerUpdateReplacesWholeManagerObject
     * @tc.desc   The manager swaps the object so avatar and category change, the store keeps its columns.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers with the five-row fixture.
     *                   2. Update 岑野 with a non-empty avatar and a new category.
     *                   3. Compare avatar and category across both ledgers.
     * @tc.expected      The manager carries the new avatar and category, the store keeps the old ones.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerUpdateReplacesWholeManagerObject', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      updateBoth(store, manager,
        contactOf('岑野', '13950000001', 'cenye-new@example.com', '浙江省温州市鹿城区', 'avatar.png', 'F'));
      expect(manager.getContacts()[0].avatar).assertEqual('avatar.png');
      expect(manager.getContacts()[0].category).assertEqual('F');
      expect(store.query(true)[0].avatar).assertEqual('');
      expect(store.query(true)[0].category).assertEqual('A');
      expect(manager.getContacts()[0].phone).assertEqual('13950000001');
      expect(store.query(true)[0].phone).assertEqual('13950000001');
    });

    /**
     * @tc.name   contactLedgerUpdateUniqueNameKeepsParity
     * @tc.desc   With unique names the manager and store update agree completely.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers with five unique names.
     *                   2. Update 淳于 through both ledgers.
     *                   3. Compare affected count, snapshots and phone digits.
     * @tc.expected      One row is affected in the store and both ledgers hold the new values.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerUpdateUniqueNameKeepsParity', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      const affected: number = updateBoth(store, manager,
        contactOf('淳于', '13960000001', 'chunyu-new@example.com', '江西省赣州市章贡区', '', 'E'));
      expect(affected).assertEqual(1);
      expect(manager.getContacts()[4].email).assertEqual('chunyu-new@example.com');
      expect(store.query(true)[4].email).assertEqual('chunyu-new@example.com');
      expect(manager.getContacts()[4].phone.length).assertEqual(11);
      assertParity(manager, store);
      expect(ContactMetrics.from(manager.getContacts()).totalPhoneDigits)
        .assertEqual(ContactMetrics.from(store.query(true)).totalPhoneDigits);
    });

    /**
     * @tc.name   contactLedgerDeleteRemovesEveryDuplicateName
     * @tc.desc   deleteContact filters all rows sharing the name, not just the first.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers with three rows named 端木.
     *                   2. Delete 端木 through both ledgers.
     *                   3. Count the survivors and their names.
     * @tc.expected      Three rows are removed and the two 东方 rows remain.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerDeleteRemovesEveryDuplicateName', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, duplicateLedger());
      const removed: number = deleteBoth(store, manager, '端木');
      expect(removed).assertEqual(3);
      expect(manager.getContacts().length).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
      expect(countOf(contactNames(manager.getContacts()), '端木')).assertEqual(0);
      expect(countOf(contactNames(manager.getContacts()), '东方')).assertEqual(2);
      expect(manager.getContacts()[0].phone).assertEqual('13520000002');
      expect(manager.getContacts()[1].phone).assertEqual('13520000004');
    });

    /**
     * @tc.name   contactLedgerDeleteParityWithStoreCount
     * @tc.desc   A unique-name delete removes one row in each ledger and returns the same count.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers with the five-row fixture.
     *                   2. Delete 池月 through both ledgers.
     *                   3. Compare removed counts, lengths and snapshots.
     * @tc.expected      Both ledgers report one removal and still agree row by row.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerDeleteParityWithStoreCount', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      const removed: number = deleteBoth(store, manager, '池月');
      expect(removed).assertEqual(1);
      expect(store.deleteCalls).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(4);
      expect(store.rowCount()).assertEqual(4);
      expect(manager.getContacts()[0].name).assertEqual('岑野');
      expect(manager.getContacts()[1].name).assertEqual('储安');
      assertParity(manager, store);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()),
        snapshotsOf(expectedAfterDelete(ledgerSeed(), '池月')))).assertTrue();
    });

    /**
     * @tc.name   contactLedgerDeleteMissingNameIsNoOp
     * @tc.desc   Deleting an absent name still calls the store but removes nothing.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers and snapshot the manager.
     *                   2. Delete a name that is not present.
     *                   3. Compare the removed count and the snapshots.
     * @tc.expected      Zero removals, one delete call and identical snapshots.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerDeleteMissingNameIsNoOp', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      const before: Contact[] = manager.getContacts();
      const removed: number = deleteBoth(store, manager, '欧阳');
      expect(removed).assertEqual(0);
      expect(store.deleteCalls).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(5);
      expect(sameSnapshotArray(snapshotsOf(before), snapshotsOf(manager.getContacts()))).assertTrue();
      expect(store.names().length).assertEqual(5);
      expect(countOf(store.names(), '欧阳')).assertEqual(0);
    });

    /**
     * @tc.name   contactLedgerDeleteKeepsSurvivorOrder
     * @tc.desc   Removing a middle row compacts the array without re-sorting survivors.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers with the five-row fixture.
     *                   2. Delete the middle row 储安.
     *                   3. Read the survivor names in order.
     * @tc.expected      Survivors are 岑野, 池月, 褚宁, 淳于 in that exact order.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerDeleteKeepsSurvivorOrder', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      deleteBoth(store, manager, '储安');
      expect(sameStringArray(contactNames(manager.getContacts()), ['岑野', '池月', '褚宁', '淳于'])).assertTrue();
      expect(sameStringArray(store.names(), ['岑野', '池月', '褚宁', '淳于'])).assertTrue();
      expect(manager.getContacts()[2].name).assertEqual('褚宁');
      expect(manager.getContacts()[3].phone).assertEqual('13510000005');
      expect(countOf(contactNames(manager.getContacts()), '储安')).assertEqual(0);
      assertParity(manager, store);
    });

    /**
     * @tc.name   contactLedgerDeleteThenReaddGoesToTail
     * @tc.desc   Re-creating a deleted name yields a fresh row at the end, not the old slot.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers with the five-row fixture.
     *                   2. Delete 储安 and add 储安 again with a new phone.
     *                   3. Inspect the tail row and its index.
     * @tc.expected      The new row sits at the tail with the new phone and the ledger holds five rows.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerDeleteThenReaddGoesToTail', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      deleteBoth(store, manager, '储安');
      addBoth(store, manager, contactOf('储安', '13970000001', 'chuan-again@example.com', '安徽省蚌埠市蚌山区', '', 'F'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(5);
      expect(rows[4].name).assertEqual('储安');
      expect(rows[4].phone).assertEqual('13970000001');
      expect(rows[2].name).assertEqual('褚宁');
      expect(countOf(contactNames(rows), '储安')).assertEqual(1);
      assertParity(manager, store);
    });

    /**
     * @tc.name   contactLedgerDuplicateNamesCoexistAfterAdd
     * @tc.desc   The ledger accepts a fourth 端木 row because add never performs duplicate checks.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers with the duplicate fixture.
     *                   2. Add one more contact named 端木.
     *                   3. Count the name occurrences in both ledgers.
     * @tc.expected      Four 端木 rows coexist and parity still holds.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerDuplicateNamesCoexistAfterAdd', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, duplicateLedger());
      addBoth(store, manager, contactOf('端木', '13980000001', 'duanmu4@example.com', '山东省临沂市兰山区', '', 'F'));
      expect(countOf(contactNames(manager.getContacts()), '端木')).assertEqual(4);
      expect(countOf(store.names(), '端木')).assertEqual(4);
      expect(manager.getContacts().length).assertEqual(6);
      expect(store.rowCount()).assertEqual(6);
      expect(manager.getContacts()[5].phone).assertEqual('13980000001');
      assertParity(manager, store);
    });

    /**
     * @tc.name   contactLedgerDeleteAllLeavesEmptyLedger
     * @tc.desc   Deleting each unique name in turn drains both ledgers to zero rows.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers with the five-row fixture.
     *                   2. Delete all five names one by one.
     *                   3. Read lengths, names and delete call counts.
     * @tc.expected      Both ledgers are empty and the store saw five delete calls.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerDeleteAllLeavesEmptyLedger', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      deleteBoth(store, manager, '岑野');
      deleteBoth(store, manager, '池月');
      deleteBoth(store, manager, '储安');
      deleteBoth(store, manager, '褚宁');
      deleteBoth(store, manager, '淳于');
      expect(manager.getContacts().length).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.deleteCalls).assertEqual(5);
      expect(joined(contactNames(manager.getContacts()))).assertEqual('');
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(0);
      assertParity(manager, store);
    });

    /**
     * @tc.name   contactLedgerMetricsCountDuplicateNames
     * @tc.desc   Three repeated names are reported as duplicates while the total stays at five.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Install the duplicate fixture.
     *                   2. Build metrics from the manager rows.
     *                   3. Compare total, unique and duplicate counts.
     * @tc.expected      Total five, unique two, duplicates three.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerMetricsCountDuplicateNames', 0, () => {
      const manager: ContactManager = installLedger(ContactManager.getInstance(), duplicateLedger());
      const metrics: ContactMetrics = ContactMetrics.from(manager.getContacts());
      expect(metrics.total).assertEqual(5);
      expect(metrics.uniqueNames).assertEqual(2);
      expect(metrics.duplicateNames).assertEqual(3);
      expect(metrics.uniqueNames + metrics.duplicateNames).assertEqual(metrics.total);
      expect(metrics.totalPhoneDigits).assertEqual(55);
      expect(uniqueStrings(contactNames(manager.getContacts())).length).assertEqual(2);
    });

    /**
     * @tc.name   contactLedgerMetricsUniqueNamesForDistinctRows
     * @tc.desc   Five distinct names produce zero duplicates and a fill ratio of one.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Install the five-row distinct fixture.
     *                   2. Build metrics from the manager rows.
     *                   3. Check unique names, duplicates and fill ratio.
     * @tc.expected      Unique five, duplicates zero and fill ratio exactly one.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerMetricsUniqueNamesForDistinctRows', 0, () => {
      const manager: ContactManager = installLedger(ContactManager.getInstance(), ledgerSeed());
      const metrics: ContactMetrics = ContactMetrics.from(manager.getContacts());
      expect(metrics.total).assertEqual(5);
      expect(metrics.uniqueNames).assertEqual(5);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.fillRatio()).assertEqual(1);
      expect(metrics.fillRatio() === 1).assertTrue();
      expect(metrics.categories).assertEqual(5);
    });

    /**
     * @tc.name   contactLedgerMetricsFillRatioZeroForEmpty
     * @tc.desc   An empty ledger reports a zero fill ratio instead of dividing by zero.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Read the freshly reset ledger.
     *                   2. Build metrics from the empty array.
     *                   3. Check the ratio and every counter.
     * @tc.expected      Every counter is zero and the ratio is zero, never NaN.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerMetricsFillRatioZeroForEmpty', 0, () => {
      const metrics: ContactMetrics = ContactMetrics.from(ContactManager.getInstance().getContacts());
      expect(metrics.total).assertEqual(0);
      expect(metrics.uniqueNames).assertEqual(0);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.categories).assertEqual(0);
      expect(metrics.totalPhoneDigits).assertEqual(0);
      expect(metrics.fillRatio()).assertEqual(0);
      expect(metrics.fillRatio() === 0).assertTrue();
    });

    /**
     * @tc.name   contactLedgerMetricsFillRatioForDuplicates
     * @tc.desc   The duplicate fixture reports the exact 2/5 fill ratio.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Install the duplicate fixture.
     *                   2. Build metrics for the five rows.
     *                   3. Compute the ratio and compare with the hand calculation.
     * @tc.expected      The ratio is 0.4 and differs from the distinct fixture ratio.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerMetricsFillRatioForDuplicates', 0, () => {
      const manager: ContactManager = installLedger(ContactManager.getInstance(), duplicateLedger());
      const metrics: ContactMetrics = ContactMetrics.from(manager.getContacts());
      expect(metrics.fillRatio()).assertEqual(0.4);
      expect(metrics.fillRatio() < 1).assertTrue();
      expect(Int.toDouble(metrics.uniqueNames) / metrics.total).assertEqual(0.4);
      installLedger(manager, ledgerSeed());
      expect(ContactMetrics.from(manager.getContacts()).fillRatio()).assertEqual(1);
      expect(ContactMetrics.from(manager.getContacts()).fillRatio() === 0.4).assertFalse();
    });

    /**
     * @tc.name   contactLedgerMetricsPhoneDigitTotal
     * @tc.desc   totalPhoneDigits sums every phone length and grows with each append.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Install the five-row fixture and read the digit total.
     *                   2. Append an eleven-digit row and read again.
     *                   3. Compare the two totals with the store side.
     * @tc.expected      The total rises by eleven and matches the store ledger total.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerMetricsPhoneDigitTotal', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      const before: number = ContactMetrics.from(manager.getContacts()).totalPhoneDigits;
      addBoth(store, manager, contactOf('第五', '13990000001', 'diwu@example.com', '青海省西宁市城中区', '', 'A'));
      const after: number = ContactMetrics.from(manager.getContacts()).totalPhoneDigits;
      expect(before).assertEqual(55);
      expect(after).assertEqual(66);
      expect(after - before).assertEqual(11);
      expect(after).assertEqual(ContactMetrics.from(store.query(true)).totalPhoneDigits);
      expect(ContactMetrics.from(store.query(true)).total).assertEqual(6);
    });

    /**
     * @tc.name   contactLedgerMetricsCategoryCount
     * @tc.desc   The category counter tracks distinct category letters, not row count.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Install the five-row fixture spanning A to E.
     *                   2. Read the category count.
     *                   3. Reinstall rows that only use two categories.
     * @tc.expected      Five categories first, then two after the replacement.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerMetricsCategoryCount', 0, () => {
      const manager: ContactManager = installLedger(ContactManager.getInstance(), ledgerSeed());
      expect(ContactMetrics.from(manager.getContacts()).categories).assertEqual(5);
      const narrow: Contact[] = [];
      narrow.push(contactOf('第一', '13620000001', 'one@example.com', '贵州省贵阳市南明区', '', 'A'));
      narrow.push(contactOf('第二', '13620000002', 'two@example.com', '云南省昆明市五华区', '', 'A'));
      narrow.push(contactOf('第三', '13620000003', 'three@example.com', '四川省绵阳市涪城区', '', 'B'));
      installLedger(manager, narrow);
      expect(ContactMetrics.from(manager.getContacts()).categories).assertEqual(2);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(3);
      expect(ContactMetrics.from(manager.getContacts()).duplicateNames).assertEqual(0);
    });

    /**
     * @tc.name   contactLedgerMetricsFingerprintChangesAfterAdd
     * @tc.desc   The metrics fingerprint is sensitive to a single appended row.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Install the five-row fixture and fingerprint it.
     *                   2. Append one row with a new name.
     *                   3. Fingerprint again and compare both values.
     * @tc.expected      The two fingerprints differ and the new total is six.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerMetricsFingerprintChangesAfterAdd', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      const before: ContactMetrics = ContactMetrics.from(manager.getContacts());
      addBoth(store, manager, contactOf('澹台', '13630000001', 'tantai@example.com', '海南省海口市龙华区', '', 'F'));
      const after: ContactMetrics = ContactMetrics.from(manager.getContacts());
      expect(after.total).assertEqual(6);
      expect(after.fingerprint() === before.fingerprint()).assertFalse();
      expect(after.fingerprint()).assertEqual(ContactMetrics.from(store.query(true)).fingerprint());
      expect(after.uniqueNames).assertEqual(6);
      expect(before.fingerprint() !== after.fingerprint()).assertTrue();
    });

    /**
     * @tc.name   contactLedgerMetricsFingerprintStableAcrossReads
     * @tc.desc   Re-reading an unchanged ledger reproduces the same fingerprint and counters.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Install the five-row fixture.
     *                   2. Build metrics twice from separate reads.
     *                   3. Compare fingerprints, totals and digit sums.
     * @tc.expected      Both metric objects agree on every exposed counter.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerMetricsFingerprintStableAcrossReads', 0, () => {
      const manager: ContactManager = installLedger(ContactManager.getInstance(), ledgerSeed());
      const first: ContactMetrics = ContactMetrics.from(manager.getContacts());
      const second: ContactMetrics = ContactMetrics.from(manager.getContacts());
      expect(first.fingerprint()).assertEqual(second.fingerprint());
      expect(first.total).assertEqual(second.total);
      expect(first.uniqueNames).assertEqual(second.uniqueNames);
      expect(first.totalPhoneDigits).assertEqual(second.totalPhoneDigits);
      expect(first.categories).assertEqual(second.categories);
      expect(first.fingerprint() === second.fingerprint()).assertTrue();
    });

    /**
     * @tc.name   contactLedgerMixedSequenceParity
     * @tc.desc   A mixed add/update/delete sequence leaves both ledgers in the same state.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers and apply two adds, one update and one delete.
     *                   2. Read the surviving names from both ledgers.
     *                   3. Compare lengths, names and snapshots.
     * @tc.expected      Both ledgers hold six rows with identical values.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerMixedSequenceParity', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      addBoth(store, manager, contactOf('段誉', '13640000001', 'duanyu@example.com', '云南省大理市', '', 'A'));
      addBoth(store, manager, contactOf('虚竹', '13640000002', 'xuzhu@example.com', '河南省登封市', '', 'B'));
      updateBoth(store, manager, contactOf('段誉', '13640000003', 'duanyu-new@example.com', '云南省昆明市', '', 'A'));
      deleteBoth(store, manager, '池月');
      const names: string[] = contactNames(manager.getContacts());
      expect(manager.getContacts().length).assertEqual(6);
      expect(store.rowCount()).assertEqual(6);
      expect(manager.getContacts()[4].phone).assertEqual('13640000003');
      expect(countOf(names, '池月')).assertEqual(0);
      assertParity(manager, store);
    });

    /**
     * @tc.name   contactLedgerOrderingAfterInterleavedMutations
     * @tc.desc   Append order survives an update and a delete in the middle of the ledger.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Append three rows in a deliberate order.
     *                   2. Update the last appended row and delete the first one.
     *                   3. Read the resulting order.
     * @tc.expected      The remaining rows keep append order after the compaction.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerOrderingAfterInterleavedMutations', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      addBoth(store, manager, contactOf('丙一', '13650000001', 'bingyi@example.com', '湖南省株洲市天元区', '', 'A'));
      addBoth(store, manager, contactOf('丙二', '13650000002', 'binger@example.com', '湖南省湘潭市雨湖区', '', 'B'));
      addBoth(store, manager, contactOf('丙三', '13650000003', 'bingsan@example.com', '湖南省衡阳市蒸湘区', '', 'C'));
      updateBoth(store, manager, contactOf('丙三', '13650000009', 'bingsan-new@example.com', '湖南省岳阳市岳阳楼区', '', 'C'));
      deleteBoth(store, manager, '丙一');
      expect(sameStringArray(contactNames(manager.getContacts()), ['丙二', '丙三'])).assertTrue();
      expect(manager.getContacts()[1].phone).assertEqual('13650000009');
      expect(manager.getContacts()[0].phone).assertEqual('13650000002');
      expect(joined(store.names())).assertEqual('丙二,丙三');
      assertParity(manager, store);
    });

    /**
     * @tc.name   contactLedgerConflictReplaceKeepsBothRows
     * @tc.desc   ON_CONFLICT_REPLACE cannot collapse rows because the bucket carries no id.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Insert the same name and phone twice through the store.
     *                   2. Add the same name and phone twice through the manager.
     *                   3. Compare row counts and occurrence counts.
     * @tc.expected      Both ledgers keep two rows and parity holds.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerConflictReplaceKeepsBothRows', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const twice: Contact = contactOf('沈约', '13660000001', 'shenyue@example.com', '江苏省常州市天宁区', '', 'A');
      addBoth(store, manager, twice);
      addBoth(store, manager, twice);
      expect(store.rowCount()).assertEqual(2);
      expect(manager.getContacts().length).assertEqual(2);
      expect(store.insertCalls).assertEqual(2);
      expect(countOf(store.names(), '沈约')).assertEqual(2);
      expect(countOf(contactNames(manager.getContacts()), '沈约')).assertEqual(2);
      expect(ContactMetrics.from(manager.getContacts()).duplicateNames).assertEqual(1);
      assertParity(manager, store);
    });

    /**
     * @tc.name   contactLedgerBulkLedgerRowCount
     * @tc.desc   A twelve-row bulk seed is stored in both ledgers without loss.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Build twelve rows with the bulk helper.
     *                   2. Seed both ledgers in one call each.
     *                   3. Check lengths, batch count and parity.
     * @tc.expected      Twelve rows exist in both ledgers after a single batch insert.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerBulkLedgerRowCount', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const rows: Contact[] = bulkLedger('batch', 12);
      seedBoth(store, manager, rows);
      expect(rows.length).assertEqual(12);
      expect(manager.getContacts().length).assertEqual(12);
      expect(store.rowCount()).assertEqual(12);
      expect(store.batchCalls).assertEqual(1);
      expect(ContactMetrics.from(manager.getContacts()).uniqueNames).assertEqual(12);
      assertParity(manager, store);
    });

    /**
     * @tc.name   contactLedgerBulkLedgerNameRoundTrip
     * @tc.desc   Bulk names keep their generated order and phone tail in both ledgers.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed twelve generated rows into both ledgers.
     *                   2. Check the first, middle and last names.
     *                   3. Check the phone digits total.
     * @tc.expected      The generated order is preserved and the digit total is 120.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerBulkLedgerNameRoundTrip', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const rows: Contact[] = bulkLedger('batch', 12);
      seedBoth(store, manager, rows);
      expect(manager.getContacts()[0].name).assertEqual('batch200');
      expect(manager.getContacts()[11].name).assertEqual('batch211');
      expect(store.names()[6]).assertEqual('batch206');
      expect(manager.getContacts()[6].phone).assertEqual('1361000206');
      expect(ContactMetrics.from(manager.getContacts()).totalPhoneDigits).assertEqual(120);
      expect(ContactMetrics.from(store.query(true)).totalPhoneDigits).assertEqual(120);
    });

    /**
     * @tc.name   contactLedgerSeedFixtureParity
     * @tc.desc   The fifteen-row production seed is mirrored one to one in both ledgers.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Load the fifteen seed rows from the shared driver.
     *                   2. Seed both ledgers with them.
     *                   3. Compare counts, categories and parity.
     * @tc.expected      Fifteen rows, six categories and identical snapshots.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactLedgerSeedFixtureParity', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const seed: Contact[] = createSeedContacts();
      seedBoth(store, manager, seed);
      expect(seed.length).assertEqual(15);
      expect(manager.getContacts().length).assertEqual(15);
      expect(ContactMetrics.from(manager.getContacts()).categories).assertEqual(6);
      expect(ContactMetrics.from(manager.getContacts()).uniqueNames).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(manager.getContacts()[14].name).assertEqual('法里');
      assertParity(manager, store);
    });

    /**
     * @tc.name   contactLedgerOraclesMatchMixedSequence
     * @tc.desc   Add, edit mutable SQL fields, and delete keep both ledgers equal to the independent oracle.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Apply add, update and delete in sequence.
     *                   2. Fold the same steps through the oracle helpers.
     *                   3. Compare the ledger with the folded oracle.
     * @tc.expected      The ledger snapshot equals the oracle snapshot after every step.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerOraclesMatchMixedSequence', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const added: Contact = contactOf('尉迟', '13670000001', 'yuchi@example.com', '山西省大同市平城区', '', 'A');
      const updated: Contact = contactOf('尉迟', '13670000002', 'yuchi-new@example.com', '山西省阳泉市城区', '', 'A');
      seedBoth(store, manager, ledgerSeed());
      addBoth(store, manager, added);
      updateBoth(store, manager, updated);
      deleteBoth(store, manager, '褚宁');
      let expected: Contact[] = expectedAfterAdd(ledgerSeed(), added);
      expected = expectedAfterUpdate(expected, updated);
      expected = expectedAfterDelete(expected, '褚宁');
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(expected))).assertTrue();
      expect(sameSnapshotArray(snapshotsOf(store.query(true)), snapshotsOf(expected))).assertTrue();
      expect(expected.length).assertEqual(5);
      expect(manager.getContacts()[4].name).assertEqual('尉迟');
    });

    /**
     * @tc.name   contactLedgerQueuedWriteCompletesBeforeParity
     * @tc.desc   A queued append is applied before the parity check observes the ledger.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Submit one append task and run it.
     *                   2. Apply the append and complete the task.
     *                   3. Compare the completion trace and the ledger parity.
     * @tc.expected      The trace is add and both ledgers hold the appended row.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerQueuedWriteCompletesBeforeParity', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      queue.submit('add');
      const name: string = queue.runNext();
      expect(name).assertEqual('add');
      expect(queue.running.length).assertEqual(1);
      addBoth(store, manager, contactOf('长孙', '13680000001', 'zhangsun@example.com', '陕西省咸阳市秦都区', '', 'C'));
      queue.complete(name);
      expect(queue.trace()).assertEqual('add');
      expect(queue.failed.length).assertEqual(0);
      expect(queue.size()).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(6);
      assertParity(manager, store);
    });

    /**
     * @tc.name   contactLedgerQueuedFailureLeavesLedgerUnchanged
     * @tc.desc   A failed queued write records the failure and never touches either ledger.
     * @tc.precondition  beforeEach cleared the manager, the store and the queue, then yielded once.
     * @tc.steps         1. Seed both ledgers and submit one task.
     *                   2. Run the task and fail it instead of completing it.
     *                   3. Compare the ledger snapshots with the pre-run state.
     * @tc.expected      The failure list holds the task and both ledgers are unchanged.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('contactLedgerQueuedFailureLeavesLedgerUnchanged', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      seedBoth(store, manager, ledgerSeed());
      const before: Contact[] = manager.getContacts();
      queue.submit('update');
      const name: string = queue.runNext();
      queue.fail(name);
      expect(queue.failed.length).assertEqual(1);
      expect(queue.failed[0]).assertEqual('update');
      expect(queue.completed.length).assertEqual(0);
      expect(queue.trace()).assertEqual('');
      expect(sameSnapshotArray(snapshotsOf(before), snapshotsOf(manager.getContacts()))).assertTrue();
      expect(store.updateCalls).assertEqual(0);
    });
  });
}
