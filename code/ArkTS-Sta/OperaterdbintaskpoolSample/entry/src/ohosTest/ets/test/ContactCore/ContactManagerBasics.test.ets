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
 * ContactManagerBasics pins the storage contract of the production singleton.
 *
 * Anchors:
 *   ContactManager.ets:31-38   static instance plus private constructor
 *   ContactManager.ets:41-43   getContacts returns a new array shell
 *   ContactManager.ets:46-48   setContacts copies the incoming array shell
 *   ContactManager.ets:51-53   addContact appends without cloning the element
 *
 * The production class copies arrays but never clones Contact instances, so the
 * suite separates "array copy" assertions from "element reference" assertions.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  contactOf,
  cloneContact,
  contactNames,
  joined,
  sameStringArray,
  sameContact,
  resetContactManager,
  createSeedContacts,
  MAX_NAME_LENGTH
} from '../Shared/SharedDriver';

/** Stores the rows and returns the manager so a case can keep one expression. */
function install(manager: ContactManager, rows: Contact[]): ContactManager {
  manager.setContacts(rows);
  return manager;
}

/** Names currently held by the production singleton. */
function currentNames(): string[] {
  return contactNames(ContactManager.getInstance().getContacts());
}

/** Finds a row by name using the production array, never a private field. */
function findByPhone(rows: Contact[], phone: string): Contact | undefined {
  for (let index = 0; index < rows.length; index++) {
    if (rows[index].phone === phone) {
      return rows[index];
    }
  }
  return undefined;
}

/** Builds one deterministic three-row seed used by the ordering cases. */
function basicSeed(): Contact[] {
  const rows: Contact[] = [];
  rows.push(contactOf('顾清', '13500000001', 'guqing@example.com', '浙江省杭州市西湖区', '', 'A'));
  rows.push(contactOf('韩梅', '13500000002', 'hanmei@example.com', '安徽省合肥市蜀山区', '', 'B'));
  rows.push(contactOf('罗成', '13500000003', 'luocheng@example.com', '福建省福州市鼓楼区', '', 'C'));
  return rows;
}

/** Asserts that the manager currently holds exactly the given names in order. */
function assertOrder(manager: ContactManager, expected: string[]): void {
  const rows: Contact[] = manager.getContacts();
  expect(rows.length).assertEqual(expected.length);
  const names: string[] = contactNames(rows);
  expect(sameStringArray(names, expected)).assertTrue();
  expect(joined(names)).assertEqual(joined(expected));
}

/** Builds count contacts with a stable name prefix and descending phone tail. */
function bulkSeed(prefix: string, count: number): Contact[] {
  const rows: Contact[] = [];
  for (let index = 0; index < count; index++) {
    const suffix = String(100 + index);
    rows.push(contactOf(prefix + suffix, '1370000' + suffix, prefix + suffix + '@example.com',
      '江苏省南京市建邺区' + suffix, '', 'B'));
  }
  return rows;
}

export default function contactManagerBasicsTest(): void {
  describe('ContactManagerBasics', () => {
    beforeAll(() => {
      logSuite('ContactManagerBasics', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactManagerBasics', 'end');
    });

    /**
     * @tc.name   singletonIdentityIsStableAcrossCalls
     * @tc.desc   Repeated getInstance calls return one object even after the contents change.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('singletonIdentityIsStableAcrossCalls', 0, () => {
      const first: ContactManager = ContactManager.getInstance();
      const second: ContactManager = ContactManager.getInstance();
      expect(first === second).assertTrue();
      install(first, basicSeed());
      expect(ContactManager.getInstance().getContacts().length).assertEqual(3);
      expect(second.getContacts()[1].name).assertEqual('韩梅');
      logStep('ContactManagerBasics', 'singleton identity checked');
    });

    /**
     * @tc.name   singletonContentsAreVisibleThroughEveryReference
     * @tc.desc   A row stored through one reference is immediately readable through another.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('singletonContentsAreVisibleThroughEveryReference', 0, () => {
      const writer: ContactManager = ContactManager.getInstance();
      const reader: ContactManager = ContactManager.getInstance();
      writer.addContact(contactOf('苏禾', '13600000001', 'suhe@example.com', '江苏省苏州市姑苏区'));
      expect(reader.getContacts().length).assertEqual(1);
      expect(reader.getContacts()[0].name).assertEqual('苏禾');
      reader.addContact(contactOf('汤宁', '13600000002', 'tangning@example.com', '广东省广州市天河区'));
      expect(writer.getContacts().length).assertEqual(2);
      expect(writer.getContacts()[1].phone).assertEqual('13600000002');
    });

    /**
     * @tc.name   resetLeavesTheSingletonEmptyButAlive
     * @tc.desc   afterAll style reset clears rows without replacing the singleton instance.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetLeavesTheSingletonEmptyButAlive', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.setContacts(basicSeed());
      expect(manager.getContacts().length).assertEqual(3);
      const again: ContactManager = resetContactManager();
      expect(again === manager).assertTrue();
      expect(manager.getContacts().length).assertEqual(0);
      expect(manager.getContacts() instanceof Array).assertTrue();
    });

    /**
     * @tc.name   emptyManagerReportsZeroRowsWithoutThrowing
     * @tc.desc   Reading a freshly reset manager yields an empty array rather than undefined.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyManagerReportsZeroRowsWithoutThrowing', 0, () => {
      const rows: Contact[] = ContactManager.getInstance().getContacts();
      expect(rows.length).assertEqual(0);
      expect(rows instanceof Array).assertTrue();
      expect(contactNames(rows).length).assertEqual(0);
      expect(joined(contactNames(rows))).assertEqual('');
      expect(findByPhone(rows, '13500000001') === undefined).assertTrue();
    });

    /**
     * @tc.name   setContactsReplacesEveryPreviousRow
     * @tc.desc   A second setContacts call discards the first payload entirely.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('setContactsReplacesEveryPreviousRow', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.setContacts(basicSeed());
      const replacement: Contact[] = [];
      replacement.push(contactOf('温言', '13700000001', 'wenyan@example.com', '山东省济南市历下区', '', 'D'));
      replacement.push(contactOf('夏至', '13700000002', 'xiazhi@example.com', '河南省郑州市金水区', '', 'E'));
      manager.setContacts(replacement);
      expect(manager.getContacts().length).assertEqual(2);
      expect(manager.getContacts()[0].name).assertEqual('温言');
      expect(manager.getContacts()[1].name).assertEqual('夏至');
      expect(contactNames(manager.getContacts()).indexOf('顾清') < 0).assertTrue();
    });

    /**
     * @tc.name   setContactsCopiesTheIncomingArrayShell
     * @tc.desc   Pushing into the caller array after setContacts does not grow the manager.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('setContactsCopiesTheIncomingArrayShell', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const source: Contact[] = basicSeed();
      manager.setContacts(source);
      source.push(contactOf('严冬', '13800000004', 'yandong@example.com', '北京市海淀区'));
      expect(source.length).assertEqual(4);
      expect(manager.getContacts().length).assertEqual(3);
      expect(contactNames(manager.getContacts()).indexOf('严冬') < 0).assertTrue();
      expect(manager.getContacts()[2].name).assertEqual('罗成');
    });

    /**
     * @tc.name   setContactsKeepsElementReferences
     * @tc.desc   setContacts copies only the array shell, so element edits remain visible.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('setContactsKeepsElementReferences', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const source: Contact[] = basicSeed();
      manager.setContacts(source);
      source[0].phone = '13900000009';
      source[0].email = 'edited@example.com';
      expect(manager.getContacts()[0].phone).assertEqual('13900000009');
      expect(manager.getContacts()[0].email).assertEqual('edited@example.com');
      expect(manager.getContacts()[1].phone).assertEqual('13500000002');
    });

    /**
     * @tc.name   getContactsReturnsANewArrayShell
     * @tc.desc   Two reads are different array objects that happen to hold the same rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('getContactsReturnsANewArrayShell', 0, () => {
      const manager: ContactManager = install(ContactManager.getInstance(), basicSeed());
      const first: Contact[] = manager.getContacts();
      const second: Contact[] = manager.getContacts();
      expect(first === second).assertFalse();
      expect(first.length).assertEqual(second.length);
      expect(sameStringArray(contactNames(first), contactNames(second))).assertTrue();
      expect(first[0] === second[0]).assertTrue();
    });

    /**
     * @tc.name   getContactsShellRejectsCallerPushes
     * @tc.desc   Appending to a returned array does not change the stored row count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('getContactsShellRejectsCallerPushes', 0, () => {
      const manager: ContactManager = install(ContactManager.getInstance(), basicSeed());
      const snapshot: Contact[] = manager.getContacts();
      snapshot.push(contactOf('祝安', '13600000008', 'zhuan@example.com', '江西省南昌市东湖区'));
      snapshot.push(contactOf('卓然', '13600000009', 'zhuoran@example.com', '湖南省长沙市岳麓区'));
      expect(snapshot.length).assertEqual(5);
      expect(manager.getContacts().length).assertEqual(3);
      expect(currentNames().length).assertEqual(3);
      expect(currentNames()[2]).assertEqual('罗成');
    });

    /**
     * @tc.name   getContactsShellShiftsDoNotDeleteRows
     * @tc.desc   Removing entries from a returned array leaves the manager contents intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('getContactsShellShiftsDoNotDeleteRows', 0, () => {
      const manager: ContactManager = install(ContactManager.getInstance(), basicSeed());
      const snapshot: Contact[] = manager.getContacts();
      snapshot.shift();
      snapshot.splice(0, 1);
      expect(snapshot.length).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(3);
      expect(manager.getContacts()[0].name).assertEqual('顾清');
      expect(manager.getContacts()[2].name).assertEqual('罗成');
    });

    /**
     * @tc.name   addContactAppendsAfterEveryExistingRow
     * @tc.desc   addContact positions the new contact at the tail and keeps the prior order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addContactAppendsAfterEveryExistingRow', 0, () => {
      const manager: ContactManager = install(ContactManager.getInstance(), basicSeed());
      const added: Contact = contactOf('骆宾', '13700000007', 'luobin@example.com', '广西壮族自治区南宁市青秀区', '', 'E');
      manager.addContact(added);
      expect(manager.getContacts().length).assertEqual(4);
      expect(manager.getContacts()[3].name).assertEqual('骆宾');
      expect(contactNames(manager.getContacts())[2]).assertEqual('罗成');
      expect(sameStringArray(currentNames(), ['顾清', '韩梅', '罗成', '骆宾'])).assertTrue();
    });

    /**
     * @tc.name   addContactToEmptyManagerProducesOneRow
     * @tc.desc   The first addition into a reset manager is both head and tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addContactToEmptyManagerProducesOneRow', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      expect(manager.getContacts().length).assertEqual(0);
      manager.addContact(contactOf('简宁', '13300000005', 'jianning@example.com', '重庆市渝中区', '', 'A'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(1);
      expect(rows[0].name).assertEqual('简宁');
      expect(rows[0].category).assertEqual('A');
      expect(joined(contactNames(rows))).assertEqual('简宁');
    });

    /**
     * @tc.name   addContactKeepsStoreOrderAcrossTwoAppends
     * @tc.desc   Two sequential additions land in call order after the original rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addContactKeepsStoreOrderAcrossTwoAppends', 0, () => {
      const manager: ContactManager = install(ContactManager.getInstance(), basicSeed());
      manager.addContact(contactOf('连翘', '13800000011', 'lianqiao@example.com', '山西省太原市小店区', '', 'D'));
      manager.addContact(contactOf('梅雨', '13800000012', 'meiyu@example.com', '河北省石家庄市长安区', '', 'F'));
      const names: string[] = currentNames();
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual('顾清');
      expect(names[3]).assertEqual('连翘');
      expect(names[4]).assertEqual('梅雨');
      expect(names.indexOf('梅雨')).assertEqual(4);
    });

    /**
     * @tc.name   addContactStoresTheGivenReference
     * @tc.desc   Editing the added instance afterwards changes the stored row because no clone occurs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addContactStoresTheGivenReference', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const added: Contact = contactOf('南星', '13700000013', 'nanxing@example.com', '贵州省贵阳市南明区', '', 'B');
      manager.addContact(added);
      expect(manager.getContacts()[0].email).assertEqual('nanxing@example.com');
      added.email = 'nanxing.updated@example.com';
      added.address = '云南省昆明市五华区';
      expect(manager.getContacts()[0].email).assertEqual('nanxing.updated@example.com');
      expect(manager.getContacts()[0].address).assertEqual('云南省昆明市五华区');
      expect(manager.getContacts()[0].phone).assertEqual('13700000013');
    });

    /**
     * @tc.name   addDoesNotGrowTheSeedArray
     * @tc.desc   The manager appends into its own array, leaving the caller seed length untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addDoesNotGrowTheSeedArray', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const seed: Contact[] = basicSeed();
      manager.setContacts(seed);
      manager.addContact(contactOf('白露', '13900000014', 'bailu@example.com', '天津市和平区', '', 'C'));
      expect(seed.length).assertEqual(3);
      expect(manager.getContacts().length).assertEqual(4);
      expect(seed[0].name).assertEqual('顾清');
      expect(manager.getContacts()[3].name).assertEqual('白露');
    });

    /**
     * @tc.name   addContactAcceptsAnEmptyContact
     * @tc.desc   The append path performs no validation, so an all-empty contact is stored.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('addContactAcceptsAnEmptyContact', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.addContact(new Contact());
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(1);
      expect(rows[0].name).assertEqual('');
      expect(rows[0].phone).assertEqual('');
      expect(rows[0].email).assertEqual('');
      expect(rows[0].avatar).assertEqual('');
    });

    /**
     * @tc.name   addContactKeepsRowsWithEqualPhonesSeparate
     * @tc.desc   Identity comes from the array slot, not the phone value, so equal phones stay two rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('addContactKeepsRowsWithEqualPhonesSeparate', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.addContact(contactOf('石桥', '13100000001', 'shiqiao@example.com', '湖北省宜昌市西陵区', '', 'A'));
      manager.addContact(contactOf('石岸', '13100000001', 'shian@example.com', '湖北省襄阳市樊城区', '', 'B'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(rows[0].phone).assertEqual(rows[1].phone);
      expect(rows[0].name === rows[1].name).assertFalse();
      expect(rows[1].category).assertEqual('B');
    });

    /**
     * @tc.name   addContactAfterSetUsesTheLatestStore
     * @tc.desc   An addition after a replacement keeps the replacement rows before the new tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addContactAfterSetUsesTheLatestStore', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.setContacts(basicSeed());
      const replacement: Contact[] = [];
      replacement.push(contactOf('池砚', '13200000001', 'chiyan@example.com', '甘肃省兰州市城关区', '', 'F'));
      manager.setContacts(replacement);
      manager.addContact(contactOf('顾青', '13200000002', 'guqing2@example.com', '青海省西宁市城西区', '', 'A'));
      const names: string[] = currentNames();
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual('池砚');
      expect(names[1]).assertEqual('顾青');
      expect(names.indexOf('顾清') < 0).assertTrue();
    });

    /**
     * @tc.name   getContactsOrderingMatchesTheSourceSnapshot
     * @tc.desc   Every stored row and its position matches an independent clone of the seed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('getContactsOrderingMatchesTheSourceSnapshot', 0, () => {
      const seed: Contact[] = basicSeed();
      const manager: ContactManager = install(ContactManager.getInstance(), seed);
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(seed.length);
      for (let index = 0; index < seed.length; index++) {
        expect(sameContact(rows[index], seed[index])).assertTrue();
      }
      expect(joined(contactNames(rows), '|')).assertEqual('顾清|韩梅|罗成');
      expect(rows[1].phone).assertEqual('13500000002');
    });

    /**
     * @tc.name   addPreservesTheSeedPrefixExactly
     * @tc.desc   Appending one row leaves the first three positions byte-for-byte identical.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addPreservesTheSeedPrefixExactly', 0, () => {
      const seed: Contact[] = basicSeed();
      const manager: ContactManager = install(ContactManager.getInstance(), seed);
      manager.addContact(contactOf('闻笛', '13300000021', 'wendi@example.com', '海南省海口市龙华区', '', 'D'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(4);
      for (let index = 0; index < seed.length; index++) {
        expect(sameContact(rows[index], seed[index])).assertTrue();
      }
      expect(rows[3].email).assertEqual('wendi@example.com');
      expect(rows[3].category).assertEqual('D');
    });

    /**
     * @tc.name   setContactsWithEmptyArrayClearsAllRows
     * @tc.desc   An explicit empty payload is distinguishable from a missing call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('setContactsWithEmptyArrayClearsAllRows', 0, () => {
      const manager: ContactManager = install(ContactManager.getInstance(), basicSeed());
      expect(manager.getContacts().length).assertEqual(3);
      const empty: Contact[] = [];
      manager.setContacts(empty);
      expect(manager.getContacts().length).assertEqual(0);
      expect(contactNames(manager.getContacts()).length).assertEqual(0);
      expect(joined(currentNames())).assertEqual('');
      manager.addContact(contactOf('重来', '13400000022', 'chonglai@example.com', '广东省珠海市香洲区'));
      expect(manager.getContacts().length).assertEqual(1);
    });

    /**
     * @tc.name   repeatedSetCallsKeepOnlyTheLatestPayload
     * @tc.desc   Three consecutive replacements leave exactly the third payload visible.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedSetCallsKeepOnlyTheLatestPayload', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.setContacts(basicSeed());
      const second: Contact[] = [];
      second.push(contactOf('临时甲', '13900000023', 'temp1@example.com', '宁夏回族自治区银川市兴庆区'));
      second.push(contactOf('临时乙', '13900000024', 'temp2@example.com', '新疆维吾尔自治区乌鲁木齐市天山区'));
      manager.setContacts(second);
      const third: Contact[] = [];
      third.push(contactOf('最终', '13900000025', 'final@example.com', '西藏自治区拉萨市城关区', '', 'F'));
      manager.setContacts(third);
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(1);
      expect(rows[0].name).assertEqual('最终');
      expect(contactNames(rows).indexOf('临时甲') < 0).assertTrue();
      expect(rows[0].category).assertEqual('F');
    });

    /**
     * @tc.name   singleRowSetExposesAllSixFields
     * @tc.desc   A one-row payload round-trips every Contact field through the manager.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('singleRowSetExposesAllSixFields', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const only: Contact = new Contact('端木', '13700000026', 'duanmu@example.com',
        '江苏省无锡市梁溪区', 'operate_rdb_in_taskpool_photo1.jpg', 'A');
      const payload: Contact[] = [];
      payload.push(only);
      manager.setContacts(payload);
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(1);
      expect(rows[0].name).assertEqual('端木');
      expect(rows[0].phone).assertEqual('13700000026');
      expect(rows[0].email).assertEqual('duanmu@example.com');
      expect(rows[0].address).assertEqual('江苏省无锡市梁溪区');
      expect(rows[0].avatar).assertEqual('operate_rdb_in_taskpool_photo1.jpg');
      expect(rows[0].category).assertEqual('A');
    });

    /**
     * @tc.name   returnedArraySlotAssignmentIsIsolated
     * @tc.desc   Replacing a slot in the returned shell does not swap the stored contact reference.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('returnedArraySlotAssignmentIsIsolated', 0, () => {
      const manager: ContactManager = install(ContactManager.getInstance(), basicSeed());
      const shell: Contact[] = manager.getContacts();
      const intruder: Contact = contactOf('替换', '13800000027', 'intruder@example.com', '台湾省台北市信义区');
      shell[0] = intruder;
      expect(shell[0].name).assertEqual('替换');
      expect(manager.getContacts()[0].name).assertEqual('顾清');
      expect(manager.getContacts().length).assertEqual(3);
      expect(manager.getContacts()[0].phone).assertEqual('13500000001');
    });

    /**
     * @tc.name   bulkAppendKeepsInsertionOrderForTwentyRows
     * @tc.desc   Twenty loop-driven additions appear in call order with no re-sorting.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bulkAppendKeepsInsertionOrderForTwentyRows', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const batch: Contact[] = bulkSeed('批量', 20);
      for (let index = 0; index < batch.length; index++) {
        manager.addContact(batch[index]);
      }
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(20);
      expect(rows[0].name).assertEqual('批量100');
      expect(rows[19].name).assertEqual('批量119');
      for (let index = 1; index < rows.length; index++) {
        expect(rows[index - 1].name < rows[index].name).assertTrue();
      }
      expect(rows[10].phone).assertEqual('1370000110');
    });

    /**
     * @tc.name   bulkSetThenReadRoundTripsEveryRow
     * @tc.desc   A twelve-row payload is readable field by field at every index.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bulkSetThenReadRoundTripsEveryRow', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const payload: Contact[] = bulkSeed('整批', 12);
      manager.setContacts(payload);
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(12);
      for (let index = 0; index < rows.length; index++) {
        expect(rows[index].name).assertEqual(payload[index].name);
        expect(rows[index].email).assertEqual(payload[index].email);
        expect(rows[index].address.endsWith(String(100 + index))).assertTrue();
      }
      expect(rows[11].name).assertEqual('整批111');
      expect(rows[0].category).assertEqual('B');
    });

    /**
     * @tc.name   addingOneInstanceTwiceKeepsTwoSlots
     * @tc.desc   The append path does not deduplicate, so the same reference occupies two positions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('addingOneInstanceTwiceKeepsTwoSlots', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const shared: Contact = contactOf('共享', '13200000031', 'shared@example.com', '上海市静安区', '', 'C');
      manager.addContact(shared);
      manager.addContact(shared);
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(rows[0] === rows[1]).assertTrue();
      expect(rows[0] === shared).assertTrue();
      expect(contactNames(rows)[0]).assertEqual(contactNames(rows)[1]);
      expect(currentNames().length).assertEqual(2);
    });

    /**
     * @tc.name   namesDigestTracksEachSequentialOperation
     * @tc.desc   A set, add and clear sequence is observed through the public name accessor at each step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('namesDigestTracksEachSequentialOperation', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      install(manager, basicSeed());
      expect(joined(currentNames())).assertEqual('顾清,韩梅,罗成');
      manager.addContact(contactOf('陆遥', '13500000041', 'luyao@example.com', '安徽省芜湖市镜湖区', '', 'D'));
      expect(joined(currentNames())).assertEqual('顾清,韩梅,罗成,陆遥');
      manager.addContact(contactOf('柳絮', '13500000042', 'liuxu@example.com', '安徽省蚌埠市蚌山区', '', 'E'));
      expect(joined(currentNames(), '>')).assertEqual('顾清>韩梅>罗成>陆遥>柳絮');
      manager.setContacts([]);
      expect(joined(currentNames())).assertEqual('');
      expect(manager.getContacts().length).assertEqual(0);
    });

    /**
     * @tc.name   arrayShellAndElementCopiesBehaveDifferently
     * @tc.desc   The shell is copied while the elements are shared, and both facts are asserted together.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('arrayShellAndElementCopiesBehaveDifferently', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const source: Contact[] = basicSeed();
      manager.setContacts(source);
      source.push(contactOf('外壳', '13600000043', 'shell@example.com', '山东省青岛市市南区'));
      expect(source.length).assertEqual(4);
      expect(manager.getContacts().length).assertEqual(3);
      source[2].category = 'F';
      expect(manager.getContacts()[2].category).assertEqual('F');
      const shell: Contact[] = manager.getContacts();
      shell.splice(0, 2);
      expect(shell.length).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(3);
    });

    /**
     * @tc.name   clearingThenReseedingKeepsTheCallerSeedIntact
     * @tc.desc   Clears and reseeds through copies, then verifies the original seed array is unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clearingThenReseedingKeepsTheCallerSeedIntact', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const first: Contact[] = basicSeed();
      const second: Contact[] = bulkSeed('再次', 4);
      manager.setContacts(first);
      manager.setContacts([]);
      manager.setContacts(second);
      expect(manager.getContacts().length).assertEqual(4);
      expect(first.length).assertEqual(3);
      expect(second.length).assertEqual(4);
      expect(first[0].name).assertEqual('顾清');
      expect(manager.getContacts()[0].name).assertEqual('再次100');
      expect(manager.getContacts()[3].name).assertEqual('再次103');
    });

    /**
     * @tc.name   phoneLookupFindsFirstMatchingRow
     * @tc.desc   A helper lookup over the public rows returns the earliest stored slot for a phone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('phoneLookupFindsFirstMatchingRow', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.addContact(contactOf('先行', '13400000051', 'first@example.com', '四川省绵阳市涪城区', '', 'A'));
      manager.addContact(contactOf('后至', '13400000051', 'second@example.com', '四川省德阳市旌阳区', '', 'B'));
      manager.addContact(contactOf('独行', '13400000052', 'alone@example.com', '四川省宜宾市翠屏区', '', 'C'));
      const rows: Contact[] = manager.getContacts();
      const found: Contact | undefined = findByPhone(rows, '13400000051');
      expect(found !== undefined).assertTrue();
      expect((found as Contact).name).assertEqual('先行');
      expect((found as Contact).category).assertEqual('A');
      const missing: Contact | undefined = findByPhone(rows, '13400000099');
      expect(missing === undefined).assertTrue();
      expect(rows.length).assertEqual(3);
    });

    /**
     * @tc.name   categoryDigestReflectsStoredRowsOnly
     * @tc.desc   Categories observed through the public rows follow additions and ignore discarded shells.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('categoryDigestReflectsStoredRowsOnly', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.addContact(contactOf('甲类', '13300000053', 'jia@example.com', '陕西省咸阳市秦都区', '', 'A'));
      manager.addContact(contactOf('乙类', '13300000054', 'yi@example.com', '陕西省宝鸡市渭滨区', '', 'B'));
      expect(manager.getContacts()[0].category).assertEqual('A');
      expect(manager.getContacts()[1].category).assertEqual('B');
      const shell: Contact[] = manager.getContacts();
      shell[0].category = 'Z';
      expect(manager.getContacts()[0].category).assertEqual('Z');
      expect(manager.getContacts()[1].category).assertEqual('B');
      manager.setContacts(bulkSeed('类', 2));
      expect(manager.getContacts()[0].category).assertEqual('B');
      expect(manager.getContacts().length).assertEqual(2);
    });

    /**
     * @tc.name   indexOfMissingNameReportsMinusOne
     * @tc.desc   The name accessor is a plain name list; missing entries are simply absent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('indexOfMissingNameReportsMinusOne', 0, () => {
      const manager: ContactManager = install(ContactManager.getInstance(), basicSeed());
      const names: string[] = currentNames();
      expect(names.indexOf('顾清')).assertEqual(0);
      expect(names.indexOf('韩梅')).assertEqual(1);
      expect(names.indexOf('罗成')).assertEqual(2);
      expect(names.indexOf('幽冥') < 0).assertTrue();
      expect(names.indexOf('') < 0).assertTrue();
      expect(names.lastIndexOf('韩梅')).assertEqual(1);
      expect(contactNames(manager.getContacts()).length).assertEqual(3);
    });

    /**
     * @tc.name   rowCountMatchesAccumulatedOperations
     * @tc.desc   Counts after three replacement phases and six appends follow simple arithmetic.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rowCountMatchesAccumulatedOperations', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      expect(manager.getContacts().length).assertEqual(0);
      manager.setContacts(bulkSeed('计数', 5));
      expect(manager.getContacts().length).assertEqual(5);
      manager.setContacts(bulkSeed('计数', 2));
      expect(manager.getContacts().length).assertEqual(2);
      for (let index = 0; index < 6; index++) {
        manager.addContact(contactOf('追加' + String(index), '1300000006' + String(index),
          'append' + String(index) + '@example.com', '湖北省荆门市东宝区', '', 'D'));
        expect(manager.getContacts().length).assertEqual(3 + index);
      }
      expect(manager.getContacts().length).assertEqual(8);
      expect(manager.getContacts()[7].name).assertEqual('追加5');
    });

    /**
     * @tc.name   repeatedResetsKeepTheSingletonUsable
     * @tc.desc   Three reset rounds each start empty and can store a fresh payload afterwards.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedResetsKeepTheSingletonUsable', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      for (let round = 0; round < 3; round++) {
        resetContactManager();
        expect(manager.getContacts().length).assertEqual(0);
        manager.addContact(contactOf('轮次' + String(round), '1300000010' + String(round),
          'round' + String(round) + '@example.com', '湖南省株洲市天元区', '', 'E'));
        expect(manager.getContacts().length).assertEqual(1);
        expect(manager.getContacts()[0].name).assertEqual('轮次' + String(round));
      }
      expect(currentNames().length).assertEqual(1);
      expect(ContactManager.getInstance() === manager).assertTrue();
    });

    /**
     * @tc.name   setThenGetPreservesRowIdentityOrder
     * @tc.desc   The stored references appear in the same order and refer to the same instances.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('setThenGetPreservesRowIdentityOrder', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const payload: Contact[] = basicSeed();
      manager.setContacts(payload);
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(payload.length);
      for (let index = 0; index < rows.length; index++) {
        expect(rows[index] === payload[index]).assertTrue();
      }
      expect(rows[0] === payload[1]).assertFalse();
      expect(rows[2].name).assertEqual(payload[2].name);
      expect(rows[1].address).assertEqual('安徽省合肥市蜀山区');
    });

    /**
     * @tc.name   addAfterResetAppendsToAnEmptyStore
     * @tc.desc   A reset in the middle of a workflow discards history before the next append.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addAfterResetAppendsToAnEmptyStore', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.addContact(contactOf('旧一', '13100000111', 'old1@example.com', '江西省九江市浔阳区'));
      manager.addContact(contactOf('旧二', '13100000112', 'old2@example.com', '江西省赣州市章贡区'));
      expect(manager.getContacts().length).assertEqual(2);
      resetContactManager();
      expect(manager.getContacts().length).assertEqual(0);
      manager.addContact(contactOf('新一', '13100000113', 'new1@example.com', '江西省上饶市信州区', '', 'F'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(1);
      expect(rows[0].name).assertEqual('新一');
      expect(rows[0].category).assertEqual('F');
      expect(contactNames(rows).indexOf('旧一') < 0).assertTrue();
      expect(MAX_NAME_LENGTH > 0).assertTrue();
    });
    /**
     * @tc.name   bulkWorkKeepsEveryManagerReferenceInSync
     * @tc.desc   Both singleton references observe each append, each replacement and each field value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bulkWorkKeepsEveryManagerReferenceInSync', 0, () => {
      const writer: ContactManager = ContactManager.getInstance();
      const mirror: ContactManager = ContactManager.getInstance();
      const batch: Contact[] = bulkSeed('同步', 8);
      for (let index = 0; index < batch.length; index++) {
        writer.addContact(batch[index]);
        expect(mirror.getContacts().length).assertEqual(index + 1);
        expect(mirror.getContacts()[index].name).assertEqual(batch[index].name);
        expect(mirror.getContacts()[index].phone).assertEqual(batch[index].phone);
      }
      expect(mirror.getContacts().length).assertEqual(8);
      expect(joined(contactNames(mirror.getContacts())).startsWith('同步100,同步101')).assertTrue();
      const rows: Contact[] = mirror.getContacts();
      for (let index = 0; index < rows.length; index++) {
        expect(sameContact(rows[index], batch[index])).assertTrue();
      }
      expect(rows[7].email).assertEqual('同步107@example.com');
      writer.setContacts([]);
      expect(mirror.getContacts().length).assertEqual(0);
      expect(contactNames(mirror.getContacts()).length).assertEqual(0);
    });
    /**
     * @tc.name   reassigningACallerSlotKeepsTheStoredReference
     * @tc.desc   Replacing source[0] after setContacts cannot retarget the slot already copied.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('reassigningACallerSlotKeepsTheStoredReference', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const source: Contact[] = basicSeed();
      manager.setContacts(source);
      const original: Contact = source[0];
      source[0] = contactOf('另起', '13300000131', 'restart@example.com', '浙江省宁波市海曙区');
      expect(source[0].name).assertEqual('另起');
      expect(manager.getContacts()[0].name).assertEqual('顾清');
      expect(manager.getContacts()[0] === original).assertTrue();
      expect(manager.getContacts()[0] === source[0]).assertFalse();
      expect(manager.getContacts().length).assertEqual(3);
      expect(original.name).assertEqual('顾清');
      expect(original.phone).assertEqual('13500000001');
    });
  });
}
