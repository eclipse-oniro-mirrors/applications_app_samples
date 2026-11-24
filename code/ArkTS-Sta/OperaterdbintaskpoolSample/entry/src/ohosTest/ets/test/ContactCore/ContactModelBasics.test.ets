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
 * ContactModelBasics covers the six field Contact carrier and the RouterParams
 * constructor that the pages hand to the router.
 *
 * Anchors:
 *   Contact.ets:31-47   six public fields with default values
 *   Contact.ets:49-57   RouterParams text and data
 *   AddressBookList.ets:60-65   RouterParams('编辑联系人', contact)
 *   AddressBookList.ets:86-89   RouterParams('新增联系人', new Contact())
 *   AddressBookDetail.ets:244-249 RouterParams('编辑联系人', this.sourceData)
 *   AddressBookDetail.ets:258-264 RouterParams('删除联系人', this.sourceData)
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact, RouterParams } from '../../../../main/ets/pages/model/Contact';
import {
  contactOf,
  cloneContact,
  sameContact,
  isDigitsOnly,
  hasEmailShape,
  joined,
  resetContactManager,
  MAX_NAME_LENGTH,
  ACTION_ADD,
  ACTION_EDIT,
  ACTION_DELETE
} from '../Shared/SharedDriver';

/** Asserts that a contact carries exactly the six given values. */
function expectFields(contact: Contact, name: string, phone: string, email: string,
  address: string, avatar: string, category: string): void {
  expect(contact.name).assertEqual(name);
  expect(contact.phone).assertEqual(phone);
  expect(contact.email).assertEqual(email);
  expect(contact.address).assertEqual(address);
  expect(contact.avatar).assertEqual(avatar);
  expect(contact.category).assertEqual(category);
}

/** Joins the six fields for a single compact projection assertion. */
function projection(contact: Contact): string {
  return joined([contact.name, contact.phone, contact.email, contact.address, contact.avatar, contact.category], '|');
}

export default function contactModelBasicsTest(): void {
  describe('ContactModelBasics', () => {
    beforeAll(() => {
      logSuite('ContactModelBasics', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactModelBasics', 'end');
    });

    /**
     * @tc.name   defaultConstructorLeavesSixEmptyStrings
     * @tc.desc   A no argument Contact instance stores an empty string in every field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('defaultConstructorLeavesSixEmptyStrings', 0, () => {
      const contact: Contact = new Contact();
      expectFields(contact, '', '', '', '', '', '');
      expect(contact.name.length).assertEqual(0);
      expect(contact.phone.length).assertEqual(0);
      expect(projection(contact)).assertEqual('|||||');
      expect(contact.category.length).assertEqual(0);
      logStep('ContactModelBasics', 'defaults checked');
    });

    /**
     * @tc.name   nameOnlyConstructorFillsTheNameField
     * @tc.desc   Passing one argument leaves the other five fields at their defaults.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('nameOnlyConstructorFillsTheNameField', 0, () => {
      const contact: Contact = new Contact('单名');
      expect(contact.name).assertEqual('单名');
      expectFields(contact, '单名', '', '', '', '', '');
      expect(contact.name.length).assertEqual(2);
      expect(projection(contact)).assertEqual('单名|||||');
      expect(contact.phone).assertEqual('');
    });

    /**
     * @tc.name   nameAndPhoneConstructorFillsTwoFields
     * @tc.desc   Two arguments populate name and phone while the rest stay empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('nameAndPhoneConstructorFillsTwoFields', 0, () => {
      const contact: Contact = new Contact('双名', '13800000001');
      expectFields(contact, '双名', '13800000001', '', '', '', '');
      expect(contact.phone).assertEqual('13800000001');
      expect(isDigitsOnly(contact.phone)).assertTrue();
      expect(contact.email).assertEqual('');
      expect(contact.address).assertEqual('');
    });

    /**
     * @tc.name   threeArgumentConstructorFillsEmail
     * @tc.desc   The third positional argument lands in email without touching address.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('threeArgumentConstructorFillsEmail', 0, () => {
      const contact: Contact = new Contact('三名', '13800000002', 'three@example.com');
      expectFields(contact, '三名', '13800000002', 'three@example.com', '', '', '');
      expect(hasEmailShape(contact.email)).assertTrue();
      expect(contact.email).assertEqual('three@example.com');
      expect(contact.address.length).assertEqual(0);
      expect(projection(contact)).assertEqual('三名|13800000002|three@example.com|||');
    });

    /**
     * @tc.name   fourArgumentConstructorFillsAddress
     * @tc.desc   The fourth positional argument lands in address and the avatar stays empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fourArgumentConstructorFillsAddress', 0, () => {
      const contact: Contact = new Contact('四名', '13800000003', 'four@example.com', '北京市朝阳区');
      expectFields(contact, '四名', '13800000003', 'four@example.com', '北京市朝阳区', '', '');
      expect(contact.address).assertEqual('北京市朝阳区');
      expect(contact.avatar).assertEqual('');
      expect(contact.address.endsWith('区')).assertTrue();
      expect(projection(contact).split('|').length).assertEqual(6);
    });

    /**
     * @tc.name   fiveArgumentConstructorFillsAvatar
     * @tc.desc   The fifth positional argument lands in avatar and the category stays empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fiveArgumentConstructorFillsAvatar', 0, () => {
      const contact: Contact = new Contact('五名', '13800000004', 'five@example.com',
        '上海市徐汇区', 'operate_rdb_in_taskpool_photo1.jpg');
      expectFields(contact, '五名', '13800000004', 'five@example.com', '上海市徐汇区',
        'operate_rdb_in_taskpool_photo1.jpg', '');
      expect(contact.avatar.endsWith('.jpg')).assertTrue();
      expect(contact.category).assertEqual('');
      expect(contact.avatar.length > 10).assertTrue();
      expect(projection(contact).split('|')[4]).assertEqual('operate_rdb_in_taskpool_photo1.jpg');
    });

    /**
     * @tc.name   sixArgumentConstructorFillsCategory
     * @tc.desc   All six positional arguments are stored in the documented order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sixArgumentConstructorFillsCategory', 0, () => {
      const contact: Contact = new Contact('六名', '13800000005', 'six@example.com',
        '广东省广州市越秀区', 'avatar_six.jpg', 'D');
      expectFields(contact, '六名', '13800000005', 'six@example.com', '广东省广州市越秀区',
        'avatar_six.jpg', 'D');
      expect(contact.category).assertEqual('D');
      expect(contact.avatar).assertEqual('avatar_six.jpg');
      expect(projection(contact)).assertEqual('六名|13800000005|six@example.com|广东省广州市越秀区|avatar_six.jpg|D');
    });

    /**
     * @tc.name   omittedTailParametersKeepTheirDefaults
     * @tc.desc   Passing only three arguments leaves avatar and category empty, not undefined text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('omittedTailParametersKeepTheirDefaults', 0, () => {
      const contact: Contact = new Contact('缺省', '13800000006', 'default@example.com');
      expect(contact.avatar).assertEqual('');
      expect(contact.category).assertEqual('');
      expect(contact.avatar === '').assertTrue();
      expect(contact.category === '').assertTrue();
      expect(contact.address).assertEqual('');
      expect(contact.name).assertEqual('缺省');
    });

    /**
     * @tc.name   explicitEmptyStringsAreAccepted
     * @tc.desc   Passing six explicit empty strings is indistinguishable from the default constructor.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('explicitEmptyStringsAreAccepted', 0, () => {
      const explicit: Contact = new Contact('', '', '', '', '', '');
      const implied: Contact = new Contact();
      expect(explicit.name).assertEqual('');
      expect(explicit.phone).assertEqual('');
      expect(sameContact(explicit, implied)).assertTrue();
      expect(projection(explicit)).assertEqual(projection(implied));
      expect(projection(explicit)).assertEqual('|||||');
    });

    /**
     * @tc.name   fieldAssignmentAfterConstructionWorks
     * @tc.desc   Each public field remains writable on a default instance.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fieldAssignmentAfterConstructionWorks', 0, () => {
      const contact: Contact = new Contact();
      contact.name = '后写';
      contact.phone = '13700000001';
      contact.email = 'later@example.com';
      contact.address = '天津市河东区';
      contact.avatar = 'later.jpg';
      contact.category = 'E';
      expectFields(contact, '后写', '13700000001', 'later@example.com', '天津市河东区', 'later.jpg', 'E');
      expect(contact.category).assertEqual('E');
      expect(projection(contact).startsWith('后写|13700000001')).assertTrue();
    });

    /**
     * @tc.name assigningAllFieldsReplacesEveryValue
     * @tc.desc   A constructed contact can be fully overwritten field by field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('assigningAllFieldsReplacesEveryValue', 0, () => {
      const contact: Contact = contactOf('旧值', '13000000001', 'old@example.com', '旧地址', 'old.jpg', 'A');
      contact.name = '新值';
      contact.phone = '13000000002';
      contact.email = 'new@example.com';
      contact.address = '新地址';
      contact.avatar = 'new.jpg';
      contact.category = 'B';
      expectFields(contact, '新值', '13000000002', 'new@example.com', '新地址', 'new.jpg', 'B');
      expect(contact.name.indexOf('旧') < 0).assertTrue();
      expect(contact.email.endsWith('@example.com')).assertTrue();
    });

    /**
     * @tc.name   chineseNameIsStoredWithoutLoss
     * @tc.desc   Multi character Chinese names keep their exact length and characters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('chineseNameIsStoredWithoutLoss', 0, () => {
      const name: string = '欧阳司马长孙';
      const contact: Contact = new Contact(name);
      expect(contact.name).assertEqual(name);
      expect(contact.name.length).assertEqual(6);
      expect(contact.name.startsWith('欧阳')).assertTrue();
      expect(contact.name.endsWith('长孙')).assertTrue();
      expect(contact.name.indexOf('司') > 0).assertTrue();
      expect(contact.name === name).assertTrue();
    });

    /**
     * @tc.name   chineseAddressIsStoredWithoutLoss
     * @tc.desc   A province level address keeps all of its characters and administrative suffixes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('chineseAddressIsStoredWithoutLoss', 0, () => {
      const address: string = '江苏省南京市鼓楼区湖南路街道';
      const contact: Contact = new Contact('地址甲', '13300000001', 'addr@example.com', address);
      expect(contact.address).assertEqual(address);
      expect(contact.address.length).assertEqual(14);
      expect(contact.address.startsWith('江苏省')).assertTrue();
      expect(contact.address.indexOf('鼓楼区') > 0).assertTrue();
      expect(contact.address.endsWith('街道')).assertTrue();
      expect(contact.address === address).assertTrue();
    });

    /**
     * @tc.name   samplePhonePassesTheNumericCheck
     * @tc.desc   The seeded phone literal is eleven digits and passes the numeric-only guard.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('samplePhonePassesTheNumericCheck', 0, () => {
      const contact: Contact = new Contact('电话甲', '13333333333');
      expect(contact.phone.length).assertEqual(11);
      expect(isDigitsOnly(contact.phone)).assertTrue();
      expect(contact.phone.substring(0, 1)).assertEqual('1');
      expect(contact.phone.substring(0, 3)).assertEqual('133');
      expect(isDigitsOnly('1333333333a')).assertFalse();
      expect(MAX_NAME_LENGTH > 0).assertTrue();
    });

    /**
     * @tc.name   sampleEmailPassesTheShapeCheck
     * @tc.desc   The seeded email literal has an at sign followed by a dotted domain.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sampleEmailPassesTheShapeCheck', 0, () => {
      const contact: Contact = new Contact('邮箱甲', '13300000002', 'aidelian@example.com');
      expect(hasEmailShape(contact.email)).assertTrue();
      expect(contact.email.indexOf('@')).assertEqual(8);
      expect(contact.email.endsWith('.com')).assertTrue();
      expect(contact.email.split('@').length).assertEqual(2);
      expect(contact.email.split('@')[1]).assertEqual('example.com');
      expect(hasEmailShape('aidelian.example.com')).assertFalse();
    });

    /**
     * @tc.name   twoInstancesDoNotShareState
     * @tc.desc   Writing a field on one Contact never changes another instance.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('twoInstancesDoNotShareState', 0, () => {
      const first: Contact = new Contact('独立甲');
      const second: Contact = new Contact('独立乙');
      first.phone = '13500000001';
      first.category = 'A';
      expect(second.phone).assertEqual('');
      expect(second.category).assertEqual('');
      expect(second.name).assertEqual('独立乙');
      second.name = '独立丙';
      expect(first.name).assertEqual('独立甲');
      expect(first === second).assertFalse();
    });

    /**
     * @tc.name   sameContactAcceptsEqualFields
     * @tc.desc   Two separately constructed contacts with identical values compare equal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameContactAcceptsEqualFields', 0, () => {
      const left: Contact = contactOf('等值', '13600000001', 'equal@example.com',
        '浙江省绍兴市柯桥区', 'equal.jpg', 'B');
      const right: Contact = contactOf('等值', '13600000001', 'equal@example.com',
        '浙江省绍兴市柯桥区', 'equal.jpg', 'B');
      expect(sameContact(left, right)).assertTrue();
      expect(left === right).assertFalse();
      expect(left.name).assertEqual(right.name);
      expect(projection(left)).assertEqual(projection(right));
      expect(left.email).assertEqual(right.email);
    });

    /**
     * @tc.name   sameContactRejectsOneFieldDifference
     * @tc.desc   A single differing field is enough to make the comparison false.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameContactRejectsOneFieldDifference', 0, () => {
      const base: Contact = contactOf('差一', '13600000002', 'diff@example.com',
        '浙江省湖州市吴兴区', 'diff.jpg', 'C');
      const phoneDiff: Contact = cloneContact(base);
      phoneDiff.phone = '13600000003';
      expect(sameContact(base, phoneDiff)).assertFalse();
      expect(base.name).assertEqual(phoneDiff.name);
      expect(base.phone === phoneDiff.phone).assertFalse();
      const sameAgain: Contact = cloneContact(base);
      expect(sameContact(base, sameAgain)).assertTrue();
      expect(base === sameAgain).assertFalse();
    });

    /**
     * @tc.name   cloneContactCopiesValuesButNotIdentity
     * @tc.desc   cloneContact produces an equal value object at a different address.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cloneContactCopiesValuesButNotIdentity', 0, () => {
      const source: Contact = contactOf('克隆', '13600000004', 'clone@example.com',
        '浙江省衢州市柯城区', 'clone.jpg', 'D');
      const copy: Contact = cloneContact(source);
      expect(copy === source).assertFalse();
      expect(sameContact(copy, source)).assertTrue();
      expect(copy.name).assertEqual(source.name);
      expect(copy.category).assertEqual('D');
      copy.name = '克隆二';
      expect(source.name).assertEqual('克隆');
      expect(sameContact(copy, source)).assertFalse();
    });

    /**
     * @tc.name   allFieldsContactProjectsIntoSixParts
     * @tc.desc   A fully populated contact projects into exactly six pipe separated values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('allFieldsContactProjectsIntoSixParts', 0, () => {
      const contact: Contact = contactOf('全字段', '13600000005', 'full@example.com',
        '浙江省台州市椒江区', 'full.jpg', 'E');
      const parts: string[] = projection(contact).split('|');
      expect(parts.length).assertEqual(6);
      expect(parts[0]).assertEqual('全字段');
      expect(parts[1]).assertEqual('13600000005');
      expect(parts[2]).assertEqual('full@example.com');
      expect(parts[3]).assertEqual('浙江省台州市椒江区');
      expect(parts[4]).assertEqual('full.jpg');
      expect(parts[5]).assertEqual('E');
    });

    /**
     * @tc.name   longAddressWithinTheLimitIsKept
     * @tc.desc   An address shorter than the configured maximum retains its full text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longAddressWithinTheLimitIsKept', 0, () => {
      const address: string = '浙江省丽水市莲都区紫金街道花园路社区居委会';
      const contact: Contact = new Contact('长址', '13600000006', 'long@example.com', address);
      expect(contact.address).assertEqual(address);
      expect(contact.address.length > 15).assertTrue();
      expect(contact.address.length < 100).assertTrue();
      expect(contact.address.startsWith('浙江省丽水市')).assertTrue();
      expect(contact.address.endsWith('居委会')).assertTrue();
      expect(contact.address.indexOf('社区') > 0).assertTrue();
    });

    /**
     * @tc.name   spacesAndPunctuationArePreserved
     * @tc.desc   The constructor does not trim or normalize whitespace inside stored values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('spacesAndPunctuationArePreserved', 0, () => {
      const contact: Contact = new Contact(' 名 字 ', '138 0000 0001', 'space@example.com', ' 北京市 海淀区 ');
      expect(contact.name).assertEqual(' 名 字 ');
      expect(contact.name.length).assertEqual(5);
      expect(contact.name.startsWith(' ')).assertTrue();
      expect(contact.phone).assertEqual('138 0000 0001');
      expect(contact.address).assertEqual(' 北京市 海淀区 ');
      expect(isDigitsOnly(contact.phone)).assertFalse();
    });

    /**
     * @tc.name   categoryAcceptsAMultiCharacterValue
     * @tc.desc   The model is a plain carrier, so no category validation happens in the constructor.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('categoryAcceptsAMultiCharacterValue', 0, () => {
      const contact: Contact = contactOf('类值', '13800000011', 'category@example.com',
        '湖北省荆州市荆州区', '', '未分类');
      expect(contact.category).assertEqual('未分类');
      expect(contact.category.length).assertEqual(3);
      expect(contact.category === 'A').assertFalse();
      const single: Contact = contactOf('类值二', '', '', '', '', 'Z');
      expect(single.category).assertEqual('Z');
      expect(single.category.length).assertEqual(1);
      expect(single.category.toUpperCase()).assertEqual('Z');
    });

    /**
     * @tc.name   routerParamsCarriesActionAndContact
     * @tc.desc   The two argument RouterParams constructor keeps both values passed by the list page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('routerParamsCarriesActionAndContact', 0, () => {
      const contact: Contact = contactOf('路由甲', '13900000001', 'route@example.com',
        '山东省淄博市张店区', '', 'A');
      const params: RouterParams = new RouterParams(ACTION_EDIT, contact);
      expect(params.text).assertEqual(ACTION_EDIT);
      expect(params.text).assertEqual('编辑联系人');
      expect(params.data !== undefined).assertTrue();
      expect((params.data as Contact).name).assertEqual('路由甲');
      expect((params.data as Contact) === contact).assertTrue();
      expect(ACTION_EDIT.length).assertEqual(5);
    });

    /**
     * @tc.name   routerParamsCarriesAnUndefinedDataSlot
     * @tc.desc   The detail page guard relies on data being undefined when only text is supplied.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routerParamsCarriesAnUndefinedDataSlot', 0, () => {
      const params: RouterParams = new RouterParams(ACTION_ADD, undefined);
      expect(params.text).assertEqual(ACTION_ADD);
      expect(params.data === undefined).assertTrue();
      expect(params.data instanceof Contact).assertFalse();
      let guarded = false;
      if (!params.data) {
        guarded = true;
      }
      expect(guarded).assertTrue();
      expect(params.text).assertEqual('新增联系人');
    });

    /**
     * @tc.name   routerParamsCarriesAnUndefinedTextSlot
     * @tc.desc   The list page guard returns early when text is missing even though data is present.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routerParamsCarriesAnUndefinedTextSlot', 0, () => {
      const contact: Contact = contactOf('路由乙', '13900000002', 'route2@example.com',
        '山东省枣庄市薛城区', '', 'B');
      const params: RouterParams = new RouterParams(undefined, contact);
      expect(params.text === undefined).assertTrue();
      expect(params.data !== undefined).assertTrue();
      expect((params.data as Contact).category).assertEqual('B');
      let guarded = false;
      if (!params.text) {
        guarded = true;
      }
      expect(guarded).assertTrue();
      expect(params.text === '').assertFalse();
    });

    /**
     * @tc.name   routerParamsAcceptsTwoUndefinedSlots
     * @tc.desc   Both constructor arguments may be undefined and each slot stays independently undefined.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routerParamsAcceptsTwoUndefinedSlots', 0, () => {
      const params: RouterParams = new RouterParams(undefined, undefined);
      expect(params.text === undefined).assertTrue();
      expect(params.data === undefined).assertTrue();
      expect(params.text === undefined && params.data === undefined).assertTrue();
      expect(params.text === '').assertFalse();
      expect(params.data instanceof Contact).assertFalse();
      expect(ACTION_DELETE.length).assertEqual(5);
    });

    /**
     * @tc.name   routerParamsEmptyTextIsNotUndefined
     * @tc.desc   An empty action string is a defined value, so the truthiness guard still rejects it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('routerParamsEmptyTextIsNotUndefined', 0, () => {
      const contact: Contact = new Contact('空文本');
      const params: RouterParams = new RouterParams('', contact);
      expect(params.text).assertEqual('');
      expect(params.text === undefined).assertFalse();
      expect(params.text!.length).assertEqual(0);
      expect(params.data !== undefined).assertTrue();
      let guarded = false;
      if (!params.text) {
        guarded = true;
      }
      expect(guarded).assertTrue();
      expect((params.data as Contact).phone).assertEqual('');
    });

    /**
     * @tc.name   routerParamsDataUsesTheCallerInstance
     * @tc.desc   RouterParams stores the reference rather than a clone of the contact argument.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('routerParamsDataUsesTheCallerInstance', 0, () => {
      const contact: Contact = contactOf('引用甲', '13700000011', 'ref@example.com',
        '辽宁省鞍山市铁东区', '', 'C');
      const params: RouterParams = new RouterParams(ACTION_DELETE, contact);
      expect(params.data === contact).assertTrue();
      contact.email = 'ref.changed@example.com';
      expect((params.data as Contact).email).assertEqual('ref.changed@example.com');
      expect((params.data as Contact).name).assertEqual('引用甲');
      expect(params.text).assertEqual('删除联系人');
      expect(params.data === new Contact()).assertFalse();
    });

    /**
     * @tc.name   nameComparisonIsExactAndCaseSensitive
     * @tc.desc   Contact names compare by exact string equality, with no normalization.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('nameComparisonIsExactAndCaseSensitive', 0, () => {
      const upper: Contact = new Contact('Alice');
      const lower: Contact = new Contact('alice');
      expect(upper.name === lower.name).assertFalse();
      expect(upper.name === 'Alice').assertTrue();
      expect(lower.name === 'alice').assertTrue();
      expect(upper.name.toUpperCase() === lower.name.toUpperCase()).assertTrue();
      expect(sameContact(upper, lower)).assertFalse();
      expect(upper.name.length).assertEqual(lower.name.length);
    });

    /**
     * @tc.name   projectionKeepsTheConstructorFieldOrder
     * @tc.desc   The six part projection preserves name, phone, email, address, avatar, category order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('projectionKeepsTheConstructorFieldOrder', 0, () => {
      const contact: Contact = contactOf('顺序', '13500000011', 'order@example.com',
        '吉林省四平市铁西区', 'order.jpg', 'F');
      const parts: string[] = projection(contact).split('|');
      expect(parts.length).assertEqual(6);
      expect(parts[0]).assertEqual(contact.name);
      expect(parts[1]).assertEqual(contact.phone);
      expect(parts[2]).assertEqual(contact.email);
      expect(parts[3]).assertEqual(contact.address);
      expect(parts[4]).assertEqual(contact.avatar);
      expect(parts[5]).assertEqual(contact.category);
      expect(parts[5]).assertEqual('F');
    });

    /**
     * @tc.name   constructorPerformsNoFieldValidation
     * @tc.desc   Invalid phone and email shapes are still accepted because the model only carries values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('constructorPerformsNoFieldValidation', 0, () => {
      const contact: Contact = new Contact('无效', 'not-a-phone', 'not-an-email',
        '', '', '');
      expect(contact.phone).assertEqual('not-a-phone');
      expect(contact.email).assertEqual('not-an-email');
      expect(isDigitsOnly(contact.phone)).assertFalse();
      expect(hasEmailShape(contact.email)).assertFalse();
      expect(contact.name).assertEqual('无效');
      expect(contact.address).assertEqual('');
    });

    /**
     * @tc.name   veryLongFieldValuesAreKeptIntact
     * @tc.desc   The carrier truncates nothing, so a long address and email survive construction.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('veryLongFieldValuesAreKeptIntact', 0, () => {
      let address: string = '黑龙江省齐齐哈尔市龙沙区';
      for (let index = 0; index < 5; index++) {
        address = address + '和平大街' + String(index) + '号';
      }
      const contact: Contact = new Contact('长值', '13400000011', 'long.value@example.com', address);
      expect(contact.address).assertEqual(address);
      expect(contact.address.length > 30).assertTrue();
      expect(contact.address.indexOf('和平大街4号') > 0).assertTrue();
      expect(contact.email).assertEqual('long.value@example.com');
      expect(contact.phone).assertEqual('13400000011');
      expect(contact.address.startsWith('黑龙江省')).assertTrue();
    });

    /**
     * @tc.name   defaultAvatarIsEmptyNotAFileName
     * @tc.desc   A contact built without an avatar carries an empty string instead of a generated file name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('defaultAvatarIsEmptyNotAFileName', 0, () => {
      const contact: Contact = new Contact('头像缺省', '13700000021', 'avatar@example.com',
        '甘肃省酒泉市肃州区');
      expect(contact.avatar).assertEqual('');
      expect(contact.avatar.indexOf('.jpg') < 0).assertTrue();
      expect(contact.avatar.length).assertEqual(0);
      expect(contact.avatar === '').assertTrue();
      const withAvatar: Contact = new Contact('头像指定', '', '', '', 'portrait.png');
      expect(withAvatar.avatar).assertEqual('portrait.png');
      expect(withAvatar.avatar === contact.avatar).assertFalse();
    });

    /**
     * @tc.name   cloneAfterFieldEditStaysIndependent
     * @tc.desc   Editing a clone's fields never changes the source and vice versa.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cloneAfterFieldEditStaysIndependent', 0, () => {
      const source: Contact = contactOf('源对象', '13700000022', 'source@example.com',
        '甘肃省张掖市甘州区', 'source.jpg', 'A');
      const copy: Contact = cloneContact(source);
      copy.phone = '13700000023';
      copy.address = '甘肃省平凉市崆峒区';
      expect(source.phone).assertEqual('13700000022');
      expect(source.address).assertEqual('甘肃省张掖市甘州区');
      expect(copy.address).assertEqual('甘肃省平凉市崆峒区');
      source.category = 'F';
      expect(copy.category).assertEqual('A');
      expect(sameContact(copy, source)).assertFalse();
    });

    /**
     * @tc.name   equalityIgnoresObjectIdentity
     * @tc.desc   Value equality and reference equality disagree for two separately built contacts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('equalityIgnoresObjectIdentity', 0, () => {
      const first: Contact = contactOf('值等', '13700000024', 'value@example.com',
        '甘肃省庆阳市西峰区', 'value.jpg', 'B');
      const second: Contact = cloneContact(first);
      expect(first === second).assertFalse();
      expect(sameContact(first, second)).assertTrue();
      expect(projection(first)).assertEqual(projection(second));
      expect(first.name === second.name).assertTrue();
      expect(first.category === second.category).assertTrue();
      const self: Contact = first;
      expect(self === first).assertTrue();
    });

    /**
     * @tc.name   projectionOfAnEmptyContactHasSixEmptyParts
     * @tc.desc   Six empty fields still split into six parts rather than vanishing from the projection.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('projectionOfAnEmptyContactHasSixEmptyParts', 0, () => {
      const contact: Contact = new Contact();
      const parts: string[] = projection(contact).split('|');
      expect(parts.length).assertEqual(6);
      for (let index = 0; index < parts.length; index++) {
        expect(parts[index]).assertEqual('');
      }
      expect(projection(contact)).assertEqual('|||||');
      expect(parts[5].length).assertEqual(0);
      expect(contact.name).assertEqual('');
    });

    /**
     * @tc.name   addRouteCarriesAFreshContactPayload
     * @tc.desc   The list page builds an add route with a default Contact payload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addRouteCarriesAFreshContactPayload', 0, () => {
      const payload: Contact = new Contact();
      const params: RouterParams = new RouterParams(ACTION_ADD, payload);
      expect(params.text).assertEqual(ACTION_ADD);
      expect(params.text).assertEqual('新增联系人');
      expect(params.data === payload).assertTrue();
      expect((params.data as Contact).name).assertEqual('');
      expect((params.data as Contact).category).assertEqual('');
      expect((params.data as Contact).phone).assertEqual('');
    });

    /**
     * @tc.name   deleteRequestCarriesTheSelectedContact
     * @tc.desc   The detail page builds a delete route with the full selected contact payload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteRequestCarriesTheSelectedContact', 0, () => {
      const selected: Contact = contactOf('选中', '13700000031', 'selected@example.com',
        '山西省忻州市忻府区', 'selected.jpg', 'C');
      const params: RouterParams = new RouterParams(ACTION_DELETE, selected);
      expect(params.text).assertEqual(ACTION_DELETE);
      expect(params.text).assertEqual('删除联系人');
      expect((params.data as Contact).name).assertEqual('选中');
      expect((params.data as Contact).phone).assertEqual('13700000031');
      expect((params.data as Contact).avatar).assertEqual('selected.jpg');
      expect((params.data as Contact).category).assertEqual('C');
    });

    /**
     * @tc.name   sixArgumentOrderIsPositionalNotNamed
     * @tc.desc   Distinct tokens in each slot prove the constructor assigns them positionally.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('sixArgumentOrderIsPositionalNotNamed', 0, () => {
      const contact: Contact = new Contact('令牌一', '令牌二', '令牌三', '令牌四', '令牌五', '令牌六');
      expect(contact.name).assertEqual('令牌一');
      expect(contact.phone).assertEqual('令牌二');
      expect(contact.email).assertEqual('令牌三');
      expect(contact.address).assertEqual('令牌四');
      expect(contact.avatar).assertEqual('令牌五');
      expect(contact.category).assertEqual('令牌六');
      expect(contact.name === contact.phone).assertFalse();
      expect(projection(contact)).assertEqual('令牌一|令牌二|令牌三|令牌四|令牌五|令牌六');
    });
    /**
     * @tc.name   nameAtTheModerateLimitIsAccepted
     * @tc.desc   A name whose length equals the configured moderate limit is stored without truncation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('nameAtTheModerateLimitIsAccepted', 0, () => {
      let name: string = '';
      for (let index = 0; index < MAX_NAME_LENGTH; index++) {
        name = name + '名';
      }
      const contact: Contact = new Contact(name);
      expect(contact.name.length).assertEqual(MAX_NAME_LENGTH);
      expect(contact.name === name).assertTrue();
      expect(contact.name.startsWith('名')).assertTrue();
      expect(contact.name.endsWith('名')).assertTrue();
      expect(contact.name.length > 0).assertTrue();
      expect(contact.phone).assertEqual('');
    });

    /**
     * @tc.name   phoneWithLeadingZeroIsPreserved
     * @tc.desc   The phone field is a string, so a leading zero is never lost to numeric conversion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('phoneWithLeadingZeroIsPreserved', 0, () => {
      const contact: Contact = new Contact('前导零', '01000000000');
      expect(contact.phone).assertEqual('01000000000');
      expect(contact.phone.length).assertEqual(11);
      expect(contact.phone.startsWith('0')).assertTrue();
      expect(contact.phone === '01000000000').assertTrue();
      expect(isDigitsOnly(contact.phone)).assertTrue();
      expect(contact.phone.substring(0, 1)).assertEqual('0');
    });
    /**
     * @tc.name   emailCaseAndLocalPartArePreserved
     * @tc.desc   The model performs no lowercasing or trimming on email values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emailCaseAndLocalPartArePreserved', 0, () => {
      const contact: Contact = new Contact('邮箱大小写', '13600000022', 'Mixed.Case@Example.COM');
      expect(contact.email).assertEqual('Mixed.Case@Example.COM');
      expect(contact.email.toLowerCase()).assertEqual('mixed.case@example.com');
      expect(contact.email === 'mixed.case@example.com').assertFalse();
      expect(hasEmailShape(contact.email)).assertTrue();
      expect(contact.email.split('@')[0]).assertEqual('Mixed.Case');
      expect(contact.email.split('@')[1]).assertEqual('Example.COM');
    });
    /**
     * @tc.name   emptyNameIsAllowedAndReportedAsEmpty
     * @tc.desc   A blank name is a legal model value when the phone is present.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emptyNameIsAllowedAndReportedAsEmpty', 0, () => {
      const contact: Contact = new Contact('', '13800000099');
      expect(contact.name).assertEqual('');
      expect(contact.name.length).assertEqual(0);
      expect(contact.phone).assertEqual('13800000099');
      expect(contact.phone.length).assertEqual(11);
      expect(contact.name === '').assertTrue();
      expect(projection(contact).startsWith('|13800000099')).assertTrue();
      expect(sameContact(contact, new Contact('', '13800000099'))).assertTrue();
    });

    /**
     * @tc.name   shortArgumentListLeavesNoUndefinedFields
     * @tc.desc   Constructing with two arguments still produces five defined empty strings, not undefined.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactModelBasics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('shortArgumentListLeavesNoUndefinedFields', 0, () => {
      const contact: Contact = new Contact('短参', '13700000099');
      const fields: string[] = [contact.name, contact.phone, contact.email, contact.address,
        contact.avatar, contact.category];
      expect(fields.length).assertEqual(6);
      for (let index = 0; index < fields.length; index++) {
        const value: string = fields[index];
        expect(typeof value).assertEqual('string');
        expect(fields[index].length >= 0).assertTrue();
      }
      expect(contact.avatar).assertEqual('');
      expect(contact.category).assertEqual('');
      expect(projection(contact)).assertEqual('短参|13700000099||||');
    });
  });
}
