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
 * ContactManagerMutation exercises ordered add/update/delete workflows against
 * the production singleton and compares each step with the driver oracles.
 *
 * Anchors:
 *   ContactManager.ets:51-53   append only, no sorting
 *   ContactManager.ets:56-65   copy array, replace first name match, break
 *   ContactManager.ets:68-70   filter all name matches
 *   SharedDriver.ets:728-761   expectedAfterAdd / Delete / Update oracles
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
  expectedAfterAdd,
  expectedAfterUpdate,
  expectedAfterDelete,
  ContactMetrics
} from '../Shared/SharedDriver';

/** Three distinct rows used as the base list for the mutation sequences. */
function mutationBase(): Contact[] {
  const rows: Contact[] = [];
  rows.push(contactOf('沈舟', '13512340001', 'shenzhou@example.com', '浙江省杭州市拱墅区', '', 'A'));
  rows.push(contactOf('秦淮', '13512340002', 'qinhuai@example.com', '江苏省南京市秦淮区', '', 'B'));
  rows.push(contactOf('岳阳', '13512340003', 'yueyang@example.com', '湖南省岳阳市岳阳楼区', '', 'C'));
  return rows;
}

/** Installs the base list and returns the manager. */
function baseManager(): ContactManager {
  const manager: ContactManager = ContactManager.getInstance();
  manager.setContacts(mutationBase());
  return manager;
}

/** Checks that the store equals an oracle row by row. */
function expectRows(actual: Contact[], expected: Contact[]): void {
  expect(actual.length).assertEqual(expected.length);
  for (let index = 0; index < expected.length; index++) {
    expect(sameContact(actual[index], expected[index])).assertTrue();
  }
}

/** The stored names joined for compact order assertions. */
function storedNames(): string {
  return joined(contactNames(ContactManager.getInstance().getContacts()), '>');
}

export default function contactManagerMutationTest(): void {
  describe('ContactManagerMutation', () => {
    beforeAll(() => {
      logSuite('ContactManagerMutation', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactManagerMutation', 'end');
    });

    /**
     * @tc.name   addThenUpdateReplacesTheStoredRowInPlace
     * @tc.desc   An appended row can be updated later without moving its slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addThenUpdateReplacesTheStoredRowInPlace', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.addContact(contactOf('初稿', '13612340001', 'draft@example.com', '安徽省安庆市迎江区', '', 'A'));
      const updated: Contact = contactOf('初稿', '13612340002', 'final@example.com', '安徽省安庆市大观区', '', 'B');
      manager.updateContact(updated);
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(1);
      expect(rows[0].phone).assertEqual('13612340002');
      expect(rows[0].email).assertEqual('final@example.com');
      expect(rows[0].address).assertEqual('安徽省安庆市大观区');
      expect(rows[0] === updated).assertTrue();
    });

    /**
     * @tc.name   addThenDeleteEmptiesTheStore
     * @tc.desc   The only row can be removed immediately after it is appended.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addThenDeleteEmptiesTheStore', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.addContact(contactOf('瞬时', '13612340003', 'moment@example.com', '安徽省黄山市屯溪区', '', 'C'));
      expect(manager.getContacts().length).assertEqual(1);
      manager.deleteContact(new Contact('瞬时'));
      expect(manager.getContacts().length).assertEqual(0);
      expect(storedNames()).assertEqual('');
      expect(manager.getContacts() instanceof Array).assertTrue();
    });

    /**
     * @tc.name   updateOfAnUnknownNameChangesNothing
     * @tc.desc   The update loop finds no match and the store keeps all original rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('updateOfAnUnknownNameChangesNothing', 0, () => {
      const manager: ContactManager = baseManager();
      manager.updateContact(contactOf('路人', '13000009999', 'stranger@example.com', '青海省海东市乐都区'));
      const rows: Contact[] = manager.getContacts();
      expectRows(rows, mutationBase());
      expect(rows.length).assertEqual(3);
      expect(contactNames(rows).indexOf('路人') < 0).assertTrue();
      expect(rows[1].phone).assertEqual('13512340002');
    });

    /**
     * @tc.name   deleteOfAnUnknownNameChangesNothing
     * @tc.desc   A filter with no name match returns the same three rows in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteOfAnUnknownNameChangesNothing', 0, () => {
      const manager: ContactManager = baseManager();
      manager.deleteContact(new Contact('无名'));
      expect(storedNames()).assertEqual('沈舟>秦淮>岳阳');
      expect(manager.getContacts().length).assertEqual(3);
      expect(manager.getContacts()[0].name).assertEqual('沈舟');
      expect(manager.getContacts()[2].category).assertEqual('C');
    });

    /**
     * @tc.name   unknownUpdateKeepsCountAndOrder
     * @tc.desc   A failed update still leaves the singleton with the exact prior name sequence.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownUpdateKeepsCountAndOrder', 0, () => {
      const manager: ContactManager = baseManager();
      const before: string[] = contactNames(manager.getContacts());
      manager.updateContact(new Contact('不存在'));
      const after: string[] = contactNames(manager.getContacts());
      expect(after.length).assertEqual(before.length);
      expect(sameStringArray(after, before)).assertTrue();
      expect(joined(after)).assertEqual(joined(before));
      expect(manager.getContacts()[0].email).assertEqual('shenzhou@example.com');
    });

    /**
     * @tc.name   updateOfTheHeadRewritesEveryMutableField
     * @tc.desc   The first row takes the replacement phone, email, address, avatar and category.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateOfTheHeadRewritesEveryMutableField', 0, () => {
      const manager: ContactManager = baseManager();
      const replacement: Contact = new Contact('沈舟', '13911110001', 'new.head@example.com',
        '浙江省杭州市余杭区', 'photo_head.jpg', 'F');
      manager.updateContact(replacement);
      const rows: Contact[] = manager.getContacts();
      expect(rows[0].phone).assertEqual('13911110001');
      expect(rows[0].email).assertEqual('new.head@example.com');
      expect(rows[0].address).assertEqual('浙江省杭州市余杭区');
      expect(rows[0].avatar).assertEqual('photo_head.jpg');
      expect(rows[0].category).assertEqual('F');
      expect(rows[0] === replacement).assertTrue();
    });

    /**
     * @tc.name   updateOfTheMiddleKeepsItsNeighbours
     * @tc.desc   Replacing 秦淮 leaves the 沈舟 prefix and 岳阳 suffix identical.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateOfTheMiddleKeepsItsNeighbours', 0, () => {
      const manager: ContactManager = baseManager();
      manager.updateContact(contactOf('秦淮', '13722220002', 'qinhuai.new@example.com',
        '江苏省南京市建邺区', '', 'E'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(3);
      expect(rows[0].name).assertEqual('沈舟');
      expect(rows[1].phone).assertEqual('13722220002');
      expect(rows[1].category).assertEqual('E');
      expect(rows[2].name).assertEqual('岳阳');
      expect(rows[0].email).assertEqual('shenzhou@example.com');
      expect(storedNames()).assertEqual('沈舟>秦淮>岳阳');
    });

    /**
     * @tc.name   updateOfTheTailKeepsThePrefix
     * @tc.desc   Updating the last row does not disturb the first two stored references.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateOfTheTailKeepsThePrefix', 0, () => {
      const manager: ContactManager = baseManager();
      const head: Contact = manager.getContacts()[0];
      const middle: Contact = manager.getContacts()[1];
      manager.updateContact(contactOf('岳阳', '13833330003', 'yueyang.new@example.com',
        '湖南省岳阳市云溪区', '', 'D'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(3);
      expect(rows[0] === head).assertTrue();
      expect(rows[1] === middle).assertTrue();
      expect(rows[2].phone).assertEqual('13833330003');
      expect(rows[2].email).assertEqual('yueyang.new@example.com');
      expect(rows[2].name).assertEqual('岳阳');
    });

    /**
     * @tc.name   secondUpdateOfOneNameAppliesTheLatestPayload
     * @tc.desc   Two updates for 沈舟 leave only the second replacement's field values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondUpdateOfOneNameAppliesTheLatestPayload', 0, () => {
      const manager: ContactManager = baseManager();
      manager.updateContact(contactOf('沈舟', '13600000001', 'pass.one@example.com',
        '浙江省杭州市西湖区', '', 'B'));
      manager.updateContact(contactOf('沈舟', '13600000002', 'pass.two@example.com',
        '浙江省杭州市滨江区', '', 'C'));
      const rows: Contact[] = manager.getContacts();
      expect(rows[0].phone).assertEqual('13600000002');
      expect(rows[0].email).assertEqual('pass.two@example.com');
      expect(rows[0].category).assertEqual('C');
      expect(rows.length).assertEqual(3);
      expect(rows[1].name).assertEqual('秦淮');
    });

    /**
     * @tc.name   deleteOfTheMiddleKeepsTheRemainingOrder
     * @tc.desc   Removing 秦淮 leaves 沈舟 before 岳阳 with the original relative order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteOfTheMiddleKeepsTheRemainingOrder', 0, () => {
      const manager: ContactManager = baseManager();
      manager.deleteContact(new Contact('秦淮'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(sameStringArray(contactNames(rows), ['沈舟', '岳阳'])).assertTrue();
      expect(rows[0].phone).assertEqual('13512340001');
      expect(rows[1].phone).assertEqual('13512340003');
      expect(rows[1].category).assertEqual('C');
    });

    /**
     * @tc.name   deleteOfTheHeadPromotesTheNextRow
     * @tc.desc   Removing the first row makes 秦淮 the new head without re-sorting the rest.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteOfTheHeadPromotesTheNextRow', 0, () => {
      const manager: ContactManager = baseManager();
      manager.deleteContact(new Contact('沈舟'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(rows[0].name).assertEqual('秦淮');
      expect(rows[0].phone).assertEqual('13512340002');
      expect(rows[1].name).assertEqual('岳阳');
      expect(storedNames()).assertEqual('秦淮>岳阳');
      expect(rows[0].email).assertEqual('qinhuai@example.com');
    });

    /**
     * @tc.name   deleteOfTheTailKeepsThePrefixRows
     * @tc.desc   Removing 岳阳 leaves the first two rows untouched and in place.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteOfTheTailKeepsThePrefixRows', 0, () => {
      const manager: ContactManager = baseManager();
      manager.deleteContact(new Contact('岳阳'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(rows[0].name).assertEqual('沈舟');
      expect(rows[1].name).assertEqual('秦淮');
      expect(contactNames(rows).indexOf('岳阳') < 0).assertTrue();
      expect(joined(contactNames(rows), '|')).assertEqual('沈舟|秦淮');
      expect(rows[1].category).assertEqual('B');
    });

    /**
     * @tc.name   addUpdateDeleteSequenceMatchesTheOracles
     * @tc.desc   One mixed workflow is compared with the independent add, update and delete oracles.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addUpdateDeleteSequenceMatchesTheOracles', 0, () => {
      const manager: ContactManager = baseManager();
      const seed: Contact[] = mutationBase();
      const added: Contact = contactOf('新页', '13744440001', 'newpage@example.com',
        '江西省景德镇市珠山区', '', 'D');
      manager.addContact(added);
      expectRows(manager.getContacts(), expectedAfterAdd(seed, added));
      const updated: Contact = contactOf('秦淮', '13744440002', 'qinhuai.work@example.com',
        '江苏省南京市鼓楼区', '', 'E');
      manager.updateContact(updated);
      expectRows(manager.getContacts(), expectedAfterUpdate(expectedAfterAdd(seed, added), updated));
      manager.deleteContact(new Contact('沈舟'));
      const expected: Contact[] = expectedAfterDelete(
        expectedAfterUpdate(expectedAfterAdd(seed, added), updated), '沈舟');
      expectRows(manager.getContacts(), expected);
      expectRows(manager.getContacts(), manager.getContacts());
    });

    /**
     * @tc.name   deleteThenReaddAppendsAtTheTail
     * @tc.desc   A deleted name returns at the end because add only appends.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteThenReaddAppendsAtTheTail', 0, () => {
      const manager: ContactManager = baseManager();
      manager.deleteContact(new Contact('沈舟'));
      manager.addContact(contactOf('沈舟', '13599990001', 'back@example.com',
        '浙江省杭州市萧山区', '', 'A'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(3);
      expect(rows[0].name).assertEqual('秦淮');
      expect(rows[1].name).assertEqual('岳阳');
      expect(rows[2].name).assertEqual('沈舟');
      expect(rows[2].phone).assertEqual('13599990001');
      expect(storedNames()).assertEqual('秦淮>岳阳>沈舟');
    });

    /**
     * @tc.name   updateAfterDeleteIsANoOp
     * @tc.desc   Updating a name that was just removed cannot resurrect the row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateAfterDeleteIsANoOp', 0, () => {
      const manager: ContactManager = baseManager();
      manager.deleteContact(new Contact('岳阳'));
      manager.updateContact(contactOf('岳阳', '13988880003', 'ghost@example.com',
        '湖南省岳阳市君山区', '', 'F'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(contactNames(rows).indexOf('岳阳') < 0).assertTrue();
      expect(rows[0].name).assertEqual('沈舟');
      expect(rows[1].name).assertEqual('秦淮');
      expect(rows[1].email).assertEqual('qinhuai@example.com');
    });

    /**
     * @tc.name   deletingEveryNameOneByOneEndsEmpty
     * @tc.desc   A loop over the original names removes the store one row at a time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deletingEveryNameOneByOneEndsEmpty', 0, () => {
      const manager: ContactManager = baseManager();
      const targets: string[] = ['沈舟', '秦淮', '岳阳'];
      for (let index = 0; index < targets.length; index++) {
        manager.deleteContact(new Contact(targets[index]));
        expect(manager.getContacts().length).assertEqual(2 - index);
        expect(contactNames(manager.getContacts()).indexOf(targets[index]) < 0).assertTrue();
      }
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(0);
      expect(contactNames(rows).length).assertEqual(0);
      expect(joined(contactNames(rows))).assertEqual('');
    });

    /**
     * @tc.name   mutationsOnAnEmptyStoreAreNoOps
     * @tc.desc   Update and delete calls before any add leave the count at zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationsOnAnEmptyStoreAreNoOps', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.updateContact(contactOf('空气', '13100000001', 'air@example.com', '海南省三沙市'));
      manager.deleteContact(new Contact('空气'));
      expect(manager.getContacts().length).assertEqual(0);
      expect(storedNames()).assertEqual('');
      manager.addContact(contactOf('实体', '13100000002', 'solid@example.com', '海南省儋州市', '', 'E'));
      expect(manager.getContacts().length).assertEqual(1);
      expect(manager.getContacts()[0].name).assertEqual('实体');
    });

    /**
     * @tc.name   updateMatchesTheNameNotThePhone
     * @tc.desc   A replacement with a different phone still finds 秦淮 by name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateMatchesTheNameNotThePhone', 0, () => {
      const manager: ContactManager = baseManager();
      manager.updateContact(contactOf('秦淮', '13000008888', 'phone.changed@example.com',
        '江苏省南京市玄武区', '', 'A'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(3);
      expect(rows[1].phone).assertEqual('13000008888');
      expect(rows[1].email).assertEqual('phone.changed@example.com');
      expect(rows[0].phone).assertEqual('13512340001');
      expect(rows[2].phone).assertEqual('13512340003');
      expect(storedNames()).assertEqual('沈舟>秦淮>岳阳');
    });

    /**
     * @tc.name   updateWithAnIdenticalCloneIsStable
     * @tc.desc   Updating with equal field values changes the slot reference but not any field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('updateWithAnIdenticalCloneIsStable', 0, () => {
      const manager: ContactManager = baseManager();
      const before: Contact[] = manager.getContacts();
      const twin: Contact = cloneContact(before[2]);
      manager.updateContact(twin);
      const after: Contact[] = manager.getContacts();
      expect(after.length).assertEqual(before.length);
      expect(sameContact(after[2], before[2])).assertTrue();
      expect(after[2] === twin).assertTrue();
      expect(after[2] === before[2]).assertFalse();
      expect(storedNames()).assertEqual('沈舟>秦淮>岳阳');
      expect(after[0] === before[0]).assertTrue();
    });

    /**
     * @tc.name   mutationNeverRewritesTheCallerSeedArray
     * @tc.desc   The seed array keeps its length and values after add, update and delete calls.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mutationNeverRewritesTheCallerSeedArray', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const seed: Contact[] = mutationBase();
      manager.setContacts(seed);
      manager.addContact(contactOf('附加', '13255550001', 'extra@example.com', '贵州省遵义市红花岗区'));
      manager.updateContact(contactOf('秦淮', '13255550002', 'seed.edit@example.com',
        '江苏省南京市秦淮区', '', 'B'));
      manager.deleteContact(new Contact('岳阳'));
      expect(seed.length).assertEqual(3);
      expect(seed[0].name).assertEqual('沈舟');
      expect(seed[1].phone).assertEqual('13512340002');
      expect(seed[1] === manager.getContacts()[1]).assertFalse();
      expect(seed[2].name).assertEqual('岳阳');
      expect(contactNames(manager.getContacts()).indexOf('岳阳') < 0).assertTrue();
    });

    /**
     * @tc.name   updateKeepsUnaffectedRowReferences
     * @tc.desc   Only the matched slot receives the new object; the other slots keep their identity.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateKeepsUnaffectedRowReferences', 0, () => {
      const manager: ContactManager = baseManager();
      const first: Contact = manager.getContacts()[0];
      const last: Contact = manager.getContacts()[2];
      const replacement: Contact = contactOf('秦淮', '13366660001', 'mid@example.com',
        '江苏省南京市雨花台区', '', 'D');
      manager.updateContact(replacement);
      const rows: Contact[] = manager.getContacts();
      expect(rows[0] === first).assertTrue();
      expect(rows[2] === last).assertTrue();
      expect(rows[1] === replacement).assertTrue();
      expect(rows[1] === last).assertFalse();
      expect(rows.length).assertEqual(3);
      expect(rows[1].category).assertEqual('D');
    });

    /**
     * @tc.name   countsTrackEachMutationInALongSequence
     * @tc.desc   A five step workflow asserts the row count and head name after every operation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('countsTrackEachMutationInALongSequence', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.addContact(contactOf('步骤一', '13411110001', 'step1@example.com', '广东省佛山市禅城区', '', 'A'));
      expect(manager.getContacts().length).assertEqual(1);
      manager.addContact(contactOf('步骤二', '13411110002', 'step2@example.com', '广东省东莞市莞城区', '', 'B'));
      expect(manager.getContacts().length).assertEqual(2);
      manager.updateContact(contactOf('步骤一', '13411110003', 'step1b@example.com', '广东省中山市石岐区', '', 'C'));
      expect(manager.getContacts().length).assertEqual(2);
      expect(manager.getContacts()[0].phone).assertEqual('13411110003');
      manager.deleteContact(new Contact('步骤二'));
      expect(manager.getContacts().length).assertEqual(1);
      manager.addContact(contactOf('步骤三', '13411110004', 'step3@example.com', '广东省江门市蓬江区', '', 'D'));
      expect(manager.getContacts().length).assertEqual(2);
      expect(manager.getContacts()[1].name).assertEqual('步骤三');
      expect(storedNames()).assertEqual('步骤一>步骤三');
    });

    /**
     * @tc.name   deleteIgnoresCategoryAndAvatarOfTheRequest
     * @tc.desc   A delete request with a wrong category still removes only the name match.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteIgnoresCategoryAndAvatarOfTheRequest', 0, () => {
      const manager: ContactManager = baseManager();
      manager.deleteContact(contactOf('秦淮', '', '', '', 'unused_avatar.jpg', 'Z'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(rows[0].name).assertEqual('沈舟');
      expect(rows[1].name).assertEqual('岳阳');
      expect(rows[0].category).assertEqual('A');
      expect(rows[1].category).assertEqual('C');
      expect(contactNames(rows).indexOf('秦淮') < 0).assertTrue();
    });

    /**
     * @tc.name   repeatedAddDeleteCyclesLeaveOnlyTheLastAdd
     * @tc.desc   Three add/delete rounds each start and end with the same single surviving row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedAddDeleteCyclesLeaveOnlyTheLastAdd', 0, () => {
      const manager: ContactManager = baseManager();
      const cycles: string[] = ['循环甲', '循环乙', '循环丙'];
      for (let index = 0; index < cycles.length; index++) {
        manager.addContact(contactOf(cycles[index], '1357777000' + String(index),
          'cycle' + String(index) + '@example.com', '云南省曲靖市麒麟区', '', 'B'));
        expect(manager.getContacts().length).assertEqual(4);
        expect(manager.getContacts()[3].name).assertEqual(cycles[index]);
        manager.deleteContact(new Contact(cycles[index]));
        expect(manager.getContacts().length).assertEqual(3);
        expect(contactNames(manager.getContacts()).indexOf(cycles[index]) < 0).assertTrue();
      }
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(3);
      expect(storedNames()).assertEqual('沈舟>秦淮>岳阳');
      expect(rows[2].category).assertEqual('C');
    });

    /**
     * @tc.name   renameByDeleteAndAppendMovesTheRowToTheTail
     * @tc.desc   A rename keeps the old slot removed and places the new name after every survivor.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('renameByDeleteAndAppendMovesTheRowToTheTail', 0, () => {
      const manager: ContactManager = baseManager();
      manager.deleteContact(new Contact('秦淮'));
      manager.addContact(contactOf('新秦淮', '13512340002', 'qinhuai@example.com',
        '江苏省南京市秦淮区', '', 'B'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(3);
      expect(rows[0].name).assertEqual('沈舟');
      expect(rows[1].name).assertEqual('岳阳');
      expect(rows[2].name).assertEqual('新秦淮');
      expect(rows[2].phone).assertEqual('13512340002');
      expect(contactNames(rows).indexOf('秦淮') < 0).assertTrue();
      expect(storedNames()).assertEqual('沈舟>岳阳>新秦淮');
    });

    /**
     * @tc.name   chineseFieldValuesSurviveUpdateAndDelete
     * @tc.desc   Multi byte names and addresses remain exact across an update followed by a delete.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('chineseFieldValuesSurviveUpdateAndDelete', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.addContact(contactOf('欧阳修文', '13633330001', 'ouyang@example.com',
        '广西壮族自治区桂林市象山区', '', 'A'));
      manager.addContact(contactOf('司马相如', '13633330002', 'sima@example.com',
        '广西壮族自治区柳州市城中区', '', 'B'));
      manager.updateContact(contactOf('欧阳修文', '13633330003', 'ouyang.new@example.com',
        '广西壮族自治区南宁市青秀区', '', 'C'));
      const rows: Contact[] = manager.getContacts();
      expect(rows[0].name).assertEqual('欧阳修文');
      expect(rows[0].address).assertEqual('广西壮族自治区南宁市青秀区');
      expect(rows[0].address.length).assertEqual(13);
      manager.deleteContact(new Contact('司马相如'));
      expect(manager.getContacts().length).assertEqual(1);
      expect(manager.getContacts()[0].name).assertEqual('欧阳修文');
      expect(manager.getContacts()[0].phone).assertEqual('13633330003');
    });

    /**
     * @tc.name   snapshotComparisonAcrossAFiveStepWorkflow
     * @tc.desc   A manual expected list is compared with the store after every one of five mutations.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotComparisonAcrossAFiveStepWorkflow', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const expected: Contact[] = [];
      const first: Contact = contactOf('甲板', '13712340001', 'deck@example.com', '天津市滨海新区', '', 'A');
      expected.push(first);
      manager.addContact(first);
      expectRows(manager.getContacts(), expected);
      const second: Contact = contactOf('乙板', '13712340002', 'deck2@example.com', '天津市河西区', '', 'B');
      expected.push(second);
      manager.addContact(second);
      expectRows(manager.getContacts(), expected);
      const secondEdit: Contact = contactOf('乙板', '13712340009', 'deck2.new@example.com',
        '天津市南开区', '', 'F');
      expected[1] = secondEdit;
      manager.updateContact(secondEdit);
      expectRows(manager.getContacts(), expected);
      expected.splice(0, 1);
      manager.deleteContact(new Contact('甲板'));
      expectRows(manager.getContacts(), expected);
      const third: Contact = contactOf('丙板', '13712340003', 'deck3@example.com', '天津市红桥区', '', 'C');
      expected.push(third);
      manager.addContact(third);
      expectRows(manager.getContacts(), expected);
      expect(storedNames()).assertEqual('乙板>丙板');
    });

    /**
     * @tc.name   deletingTheLastRowLeavesAnEmptyShell
     * @tc.desc   Removing the final row yields an empty array that still supports a later append.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deletingTheLastRowLeavesAnEmptyShell', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.addContact(contactOf('独苗', '13812340001', 'only@example.com', '内蒙古自治区呼和浩特市新城区', '', 'D'));
      expect(manager.getContacts().length).assertEqual(1);
      manager.deleteContact(new Contact('独苗'));
      const empty: Contact[] = manager.getContacts();
      expect(empty.length).assertEqual(0);
      expect(empty instanceof Array).assertTrue();
      expect(joined(contactNames(empty))).assertEqual('');
      manager.addContact(contactOf('再植', '13812340002', 'again@example.com', '内蒙古自治区包头市昆都仑区', '', 'E'));
      expect(manager.getContacts().length).assertEqual(1);
      expect(manager.getContacts()[0].name).assertEqual('再植');
    });

    /**
     * @tc.name   twoNameUpdatesInSequenceKeepBothChanges
     * @tc.desc   Updating 沈舟 and then 岳阳 leaves both edits while 秦淮 stays original.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoNameUpdatesInSequenceKeepBothChanges', 0, () => {
      const manager: ContactManager = baseManager();
      manager.updateContact(contactOf('沈舟', '13922220001', 'shenzhou.v2@example.com',
        '浙江省杭州市临平区', '', 'A'));
      manager.updateContact(contactOf('岳阳', '13922220003', 'yueyang.v2@example.com',
        '湖南省岳阳市云溪区', '', 'C'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(3);
      expect(rows[0].email).assertEqual('shenzhou.v2@example.com');
      expect(rows[1].email).assertEqual('qinhuai@example.com');
      expect(rows[2].email).assertEqual('yueyang.v2@example.com');
      expect(rows[1].phone).assertEqual('13512340002');
      expect(storedNames()).assertEqual('沈舟>秦淮>岳阳');
    });

    /**
     * @tc.name   updateThenDeleteOfTheSameNameEndsEmpty
     * @tc.desc   A single-row store is updated and then removed; no historical row survives.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateThenDeleteOfTheSameNameEndsEmpty', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.addContact(contactOf('往返', '13112340001', 'round@example.com', '黑龙江省哈尔滨市道里区', '', 'A'));
      manager.updateContact(contactOf('往返', '13112340002', 'round.new@example.com',
        '黑龙江省哈尔滨市南岗区', '', 'B'));
      expect(manager.getContacts().length).assertEqual(1);
      expect(manager.getContacts()[0].email).assertEqual('round.new@example.com');
      manager.deleteContact(new Contact('往返'));
      expect(manager.getContacts().length).assertEqual(0);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(0);
      expect(ContactMetrics.from(manager.getContacts()).duplicateNames).assertEqual(0);
    });
    /**
     * @tc.name   deleteEveryOtherRowByIndex
     * @tc.desc   Removing slots at even indexes leaves the odd indexed survivors in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteEveryOtherRowByIndex', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const rows: Contact[] = [];
      for (let index = 0; index < 6; index++) {
        rows.push(contactOf('编号' + String(index), '1301234000' + String(index),
          'index' + String(index) + '@example.com', '吉林省吉林市船营区', '', 'A'));
      }
      manager.setContacts(rows);
      manager.deleteContact(new Contact('编号0'));
      manager.deleteContact(new Contact('编号2'));
      manager.deleteContact(new Contact('编号4'));
      const stored: Contact[] = manager.getContacts();
      expect(stored.length).assertEqual(3);
      expect(sameStringArray(contactNames(stored), ['编号1', '编号3', '编号5'])).assertTrue();
      expect(stored[0].phone).assertEqual('13012340001');
      expect(stored[2].phone).assertEqual('13012340005');
    });

    /**
     * @tc.name   updateHeadThenDeleteTailKeepsTheMiddle
     * @tc.desc   One head update and one tail delete leave 秦淮 as the only untouched middle row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateHeadThenDeleteTailKeepsTheMiddle', 0, () => {
      const manager: ContactManager = baseManager();
      const middle: Contact = manager.getContacts()[1];
      manager.updateContact(contactOf('沈舟', '13800001234', 'head.v3@example.com',
        '浙江省杭州市钱塘区', '', 'D'));
      manager.deleteContact(new Contact('岳阳'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(rows[0].email).assertEqual('head.v3@example.com');
      expect(rows[1] === middle).assertTrue();
      expect(rows[1].name).assertEqual('秦淮');
      expect(storedNames()).assertEqual('沈舟>秦淮');
      expect(rows[1].category).assertEqual('B');
    });

    /**
     * @tc.name   addTwoUpdateTheFirstDeleteTheSecond
     * @tc.desc   Appended rows are addressable by name even when they arrive in the same workflow.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addTwoUpdateTheFirstDeleteTheSecond', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.addContact(contactOf('先入', '13212340001', 'first.in@example.com', '山西省大同市平城区', '', 'A'));
      manager.addContact(contactOf('后入', '13212340002', 'second.in@example.com', '山西省阳泉市城区', '', 'B'));
      manager.updateContact(contactOf('先入', '13212340003', 'first.edit@example.com',
        '山西省长治市潞州区', '', 'C'));
      manager.deleteContact(new Contact('后入'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(1);
      expect(rows[0].name).assertEqual('先入');
      expect(rows[0].phone).assertEqual('13212340003');
      expect(rows[0].address).assertEqual('山西省长治市潞州区');
      expect(contactNames(rows).indexOf('后入') < 0).assertTrue();
      expect(storedNames()).assertEqual('先入');
    });

    /**
     * @tc.name   mutationKeepsThePhoneDigitMetricAccurate
     * @tc.desc   Adding and updating phone values changes the aggregate digit count by exact amounts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mutationKeepsThePhoneDigitMetricAccurate', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.addContact(contactOf('计一', '13000000001', 'm1@example.com', '甘肃省白银市白银区', '', 'A'));
      expect(ContactMetrics.from(manager.getContacts()).totalPhoneDigits).assertEqual(11);
      manager.addContact(contactOf('计二', '130000000022', 'm2@example.com', '甘肃省天水市秦州区', '', 'B'));
      expect(ContactMetrics.from(manager.getContacts()).totalPhoneDigits).assertEqual(23);
      manager.updateContact(contactOf('计一', '1300000000', 'm1b@example.com', '甘肃省武威市凉州区', '', 'C'));
      expect(ContactMetrics.from(manager.getContacts()).totalPhoneDigits).assertEqual(22);
      manager.deleteContact(new Contact('计二'));
      const metrics: ContactMetrics = ContactMetrics.from(manager.getContacts());
      expect(metrics.total).assertEqual(1);
      expect(metrics.totalPhoneDigits).assertEqual(10);
      expect(metrics.categories).assertEqual(1);
    });

    /**
     * @tc.name   deleteFirstThenUpdateLastKeepsRemainingOrder
     * @tc.desc   Two operations on opposite ends leave two rows whose order follows the survivors.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteFirstThenUpdateLastKeepsRemainingOrder', 0, () => {
      const manager: ContactManager = baseManager();
      manager.deleteContact(new Contact('沈舟'));
      manager.updateContact(contactOf('岳阳', '13987650003', 'tail.after@example.com',
        '湖南省岳阳市君山区', '', 'F'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(rows[0].name).assertEqual('秦淮');
      expect(rows[1].name).assertEqual('岳阳');
      expect(rows[1].phone).assertEqual('13987650003');
      expect(rows[1].category).assertEqual('F');
      expect(rows[0].email).assertEqual('qinhuai@example.com');
      expect(storedNames()).assertEqual('秦淮>岳阳');
    });
    /**
     * @tc.name   bulkMutationLoopKeepsNameOrderUnderPressure
     * @tc.desc   Six alternating updates and deletes over a fixed list leave exactly the expected survivors.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerMutation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('bulkMutationLoopKeepsNameOrderUnderPressure', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const rows: Contact[] = [];
      for (let index = 0; index < 6; index++) {
        rows.push(contactOf('压测' + String(index), '1350000100' + String(index),
          'stress' + String(index) + '@example.com', '陕西省西安市新城区', '', 'B'));
      }
      manager.setContacts(rows);
      for (let index = 0; index < 3; index++) {
        manager.updateContact(contactOf('压测' + String(index), '1360000100' + String(index),
          'stress.new' + String(index) + '@example.com', '陕西省西安市碑林区', '', 'E'));
      }
      expect(manager.getContacts().length).assertEqual(6);
      expect(manager.getContacts()[0].phone).assertEqual('13600001000');
      expect(manager.getContacts()[2].category).assertEqual('E');
      expect(manager.getContacts()[3].category).assertEqual('B');
      for (let index = 3; index < 6; index++) {
        manager.deleteContact(new Contact('压测' + String(index)));
      }
      const survivors: Contact[] = manager.getContacts();
      expect(survivors.length).assertEqual(3);
      expect(sameStringArray(contactNames(survivors), ['压测0', '压测1', '压测2'])).assertTrue();
      expect(survivors[0].address).assertEqual('陕西省西安市碑林区');
      expect(survivors[2].email).assertEqual('stress.new2@example.com');
      expect(ContactMetrics.from(survivors).duplicateNames).assertEqual(0);
      expect(survivors[0].name).assertEqual('压测0');
      expect(survivors[1].name).assertEqual('压测1');
      expect(survivors[2].name).assertEqual('压测2');
      expect(survivors[1].phone).assertEqual('13600001001');
      expect(survivors[1].category).assertEqual('E');
      expect(survivors[2].category).assertEqual('E');
      expect(survivors[0].email).assertEqual('stress.new0@example.com');
      expect(survivors[1].email).assertEqual('stress.new1@example.com');
      expect(contactNames(survivors).indexOf('压测3') < 0).assertTrue();
      expect(ContactMetrics.from(survivors).total).assertEqual(3);
      expect(ContactMetrics.from(survivors).uniqueNames).assertEqual(3);
      expect(ContactMetrics.from(survivors).totalPhoneDigits).assertEqual(33);
    });
  });
}
