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
 * ContactCore / ContactCatalog suite.
 *
 * Pins the fifteen rows declared in OperateRDBInTaskPool.ets:53-69 as the
 * catalog contract: every name, phone, email, address and category literal,
 * the A-F grouping, the per-category counts and the declaration order.
 *
 * Source anchors:
 *   OperateRDBInTaskPool.ets:53-69  dataArray seed literal
 *   OperateRDBInTaskPool.ets:77     setContacts(dataArray)
 *   ContactManager.ets:41-48        getContacts copy semantics
 *   SharedDriver.ets:88-106         createSeedContacts mirror
 *   SharedDriver.ets:75-81          category constants
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import { CommonConstants } from '../../../../main/ets/pages/constant/CommonConstant';
import {
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  CATEGORY_D,
  CATEGORY_E,
  CATEGORY_F,
  CATEGORIES,
  MAX_NAME_LENGTH,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  joined,
  sameStringArray,
  countOf,
  uniqueStrings,
  isDigitsOnly,
  hasEmailShape,
  textFingerprint,
  SearchEngine,
  ContactMetrics,
  snapshotsOf,
  resetContactManager
} from '../Shared/SharedDriver';

export default function contactCatalogTest(): void {
  describe('ContactCatalog', () => {
    beforeAll(() => {
      logSuite('ContactCatalog', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactCatalog', 'end');
    });

    /**
     * @tc.name   catalogSeedExposesFifteenRows
     * @tc.desc   The page literal and the driver mirror both publish fifteen contacts; ids are absent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogSeedExposesFifteenRows', 0, () => {
      const rows = createSeedContacts();
      expect(rows.length).assertEqual(15);
      expect(rows.length).assertEqual(rows.slice().length);
      expect(contactNames(rows).length).assertEqual(15);
      expect(uniqueStrings(contactNames(rows)).length).assertEqual(15);
      const manager = ContactManager.getInstance();
      manager.setContacts(rows);
      expect(manager.getContacts().length).assertEqual(15);
      expect(rows[0].name).assertEqual('艾德里安');
      expect(rows[14].name).assertEqual('法里');
      expect(rows.length - 1).assertEqual(14);
    });

    /**
     * @tc.name   catalogFirstRowCarriesAdrianProfile
     * @tc.desc   Index 0 is 艾德里安 with phone 13333333333, the aidelian mailbox and category A.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogFirstRowCarriesAdrianProfile', 0, () => {
      const row = createSeedContacts()[0];
      expect(row.name).assertEqual('艾德里安');
      expect(row.phone).assertEqual('13333333333');
      expect(row.email).assertEqual('aidelian@example.com');
      expect(row.address).assertEqual('江苏省南京市鼓楼区');
      expect(row.avatar).assertEqual('');
      expect(row.category).assertEqual(CATEGORY_A);
      const rebuilt = contactOf('艾德里安', '13333333333', 'aidelian@example.com', '江苏省南京市鼓楼区', '', 'A');
      expect(sameContact(row, rebuilt)).assertTrue();
    });

    /**
     * @tc.name   catalogSecondRowCarriesArnoldProfile
     * @tc.desc   Index 1 is 阿诺德 in Shanghai with the arnold mailbox and category A.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogSecondRowCarriesArnoldProfile', 0, () => {
      const row = createSeedContacts()[1];
      expect(row.name).assertEqual('阿诺德');
      expect(row.phone).assertEqual('16666666666');
      expect(row.email).assertEqual('arnold@example.com');
      expect(row.address).assertEqual('上海市浦东新区');
      expect(row.category).assertEqual('A');
      expect(row.email.startsWith('arnold@')).assertTrue();
      expect(row.name.length).assertEqual(3);
    });

    /**
     * @tc.name   catalogThirdRowCarriesBellaProfile
     * @tc.desc   Index 2 is 贝拉 in Wuhan with the bella mailbox and category B.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogThirdRowCarriesBellaProfile', 0, () => {
      const row = createSeedContacts()[2];
      expect(row.name).assertEqual('贝拉');
      expect(row.phone).assertEqual('11111111111');
      expect(row.email).assertEqual('bella@example.com');
      expect(row.address).assertEqual('湖北省武汉市江汉区');
      expect(row.category).assertEqual(CATEGORY_B);
      expect(row.avatar).assertEqual('');
      expect(row.phone === '11111111111').assertTrue();
    });

    /**
     * @tc.name   catalogFourthRowCarriesBenProfile
     * @tc.desc   Index 3 is the single character name 本 with the unique 12222222222 number.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogFourthRowCarriesBenProfile', 0, () => {
      const row = createSeedContacts()[3];
      expect(row.name).assertEqual('本');
      expect(row.name.length).assertEqual(1);
      expect(row.phone).assertEqual('12222222222');
      expect(row.email).assertEqual('ben@example.com');
      expect(row.address).assertEqual('四川省成都市锦江区');
      expect(row.category).assertEqual('B');
      expect(countOf(contactNames(createSeedContacts()), '本')).assertEqual(1);
    });

    /**
     * @tc.name   catalogFifthRowCarriesBenjaminProfile
     * @tc.desc   Index 4 is 本杰明 sharing Arnold's phone but keeping its own benjieiming mailbox.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogFifthRowCarriesBenjaminProfile', 0, () => {
      const rows = createSeedContacts();
      const row = rows[4];
      expect(row.name).assertEqual('本杰明');
      expect(row.phone).assertEqual(rows[1].phone);
      expect(row.email).assertEqual('benjieiming@example.com');
      expect(row.address).assertEqual('上海市浦东新区');
      expect(row.category).assertEqual('B');
      expect(sameContact(row, rows[1])).assertFalse();
      expect(row.email === rows[1].email).assertFalse();
    });

    /**
     * @tc.name   catalogSixthRowCarriesCameronProfile
     * @tc.desc   Index 5 is 卡梅隆 in Xi'an with the cameron mailbox and the first C category.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogSixthRowCarriesCameronProfile', 0, () => {
      const row = createSeedContacts()[5];
      expect(row.name).assertEqual('卡梅隆');
      expect(row.phone).assertEqual('17777777777');
      expect(row.email).assertEqual('cameron@example.com');
      expect(row.address).assertEqual('陕西省西安市雁塔区');
      expect(row.category).assertEqual(CATEGORY_C);
      expect(row.name.length).assertEqual(3);
      expect(row.address.indexOf('陕西省')).assertEqual(0);
    });

    /**
     * @tc.name   catalogSeventhRowCarriesConnorProfile
     * @tc.desc   Index 6 is 康纳 using the 10000000000 number and the connor mailbox.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogSeventhRowCarriesConnorProfile', 0, () => {
      const row = createSeedContacts()[6];
      expect(row.name).assertEqual('康纳');
      expect(row.phone).assertEqual('10000000000');
      expect(row.email).assertEqual('connor@example.com');
      expect(row.address).assertEqual('辽宁省沈阳市沈河区');
      expect(row.category).assertEqual('C');
      expect(isDigitsOnly(row.phone)).assertTrue();
      expect(row.phone.startsWith('100')).assertTrue();
    });

    /**
     * @tc.name   catalogEighthRowCarriesKatrinaProfile
     * @tc.desc   Index 7 is 卡特琳娜, the four character name with the katrina mailbox in Jilin.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogEighthRowCarriesKatrinaProfile', 0, () => {
      const row = createSeedContacts()[7];
      expect(row.name).assertEqual('卡特琳娜');
      expect(row.name.length).assertEqual(4);
      expect(row.phone).assertEqual('11111111111');
      expect(row.email).assertEqual('katrina@example.com');
      expect(row.address).assertEqual('吉林省长春市朝阳区');
      expect(row.category).assertEqual('C');
      expect(hasEmailShape(row.email)).assertTrue();
    });

    /**
     * @tc.name   catalogNinthRowReusesCameronDetailsUnderCategoryD
     * @tc.type   FUNCTION
     * @tc.desc   Index 8 is 丹尼尔 and repeats Cameron's phone, mailbox and address with category D.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.level  LEVEL2
     */
    it('catalogNinthRowReusesCameronDetailsUnderCategoryD', 0, () => {
      const rows = createSeedContacts();
      const daniel = rows[8];
      const cameron = rows[5];
      expect(daniel.name).assertEqual('丹尼尔');
      expect(daniel.phone).assertEqual(cameron.phone);
      expect(daniel.email).assertEqual(cameron.email);
      expect(daniel.address).assertEqual(cameron.address);
      expect(daniel.category).assertEqual(CATEGORY_D);
      expect(daniel.category === cameron.category).assertFalse();
      expect(sameContact(daniel, cameron)).assertFalse();
    });

    /**
     * @tc.name   catalogTenthRowReusesKatrinaDetailsUnderCategoryD
     * @tc.desc   Index 9 is 戴维维 and repeats Katrina's phone, mailbox and address with category D.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogTenthRowReusesKatrinaDetailsUnderCategoryD', 0, () => {
      const rows = createSeedContacts();
      const david = rows[9];
      expect(david.name).assertEqual('戴维维');
      expect(david.phone).assertEqual(rows[7].phone);
      expect(david.email).assertEqual(rows[7].email);
      expect(david.address).assertEqual(rows[7].address);
      expect(david.category).assertEqual(CATEGORY_D);
      expect(david.name === rows[7].name).assertFalse();
      expect(countOf(contactNames(rows), '戴维维')).assertEqual(1);
    });

    /**
     * @tc.name   catalogEleventhRowReusesCameronDetailsUnderCategoryE
     * @tc.desc   Index 10 is 艾登 carrying Cameron's details again, now tagged with category E.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogEleventhRowReusesCameronDetailsUnderCategoryE', 0, () => {
      const rows = createSeedContacts();
      const eden = rows[10];
      expect(eden.name).assertEqual('艾登');
      expect(eden.phone).assertEqual('17777777777');
      expect(eden.email).assertEqual('cameron@example.com');
      expect(eden.address).assertEqual('陕西省西安市雁塔区');
      expect(eden.category).assertEqual(CATEGORY_E);
      expect(eden.email).assertEqual(rows[8].email);
      expect(eden.category === rows[8].category).assertFalse();
    });

    /**
     * @tc.name   catalogTwelfthRowReusesConnorDetailsUnderCategoryE
     * @tc.desc   Index 11 is 艾拉 with the connor mailbox in Shenyang and category E.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogTwelfthRowReusesConnorDetailsUnderCategoryE', 0, () => {
      const rows = createSeedContacts();
      const ella = rows[11];
      expect(ella.name).assertEqual('艾拉');
      expect(ella.name.length).assertEqual(2);
      expect(ella.phone).assertEqual('10000000000');
      expect(ella.email).assertEqual('connor@example.com');
      expect(ella.address).assertEqual('辽宁省沈阳市沈河区');
      expect(ella.category).assertEqual(CATEGORY_E);
      expect(ella.email).assertEqual(rows[6].email);
    });

    /**
     * @tc.name   catalogThirteenthRowReusesKatrinaDetailsUnderCategoryE
     * @tc.desc   Index 12 is 艾里 with the katrina mailbox in Changchun and category E.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogThirteenthRowReusesKatrinaDetailsUnderCategoryE', 0, () => {
      const rows = createSeedContacts();
      const eli = rows[12];
      expect(eli.name).assertEqual('艾里');
      expect(eli.phone).assertEqual('11111111111');
      expect(eli.email).assertEqual('katrina@example.com');
      expect(eli.address).assertEqual('吉林省长春市朝阳区');
      expect(eli.category).assertEqual(CATEGORY_E);
      expect(eli.email).assertEqual(rows[7].email);
      expect(eli.phone).assertEqual(rows[9].phone);
    });

    /**
     * @tc.name   catalogFourteenthRowReusesConnorDetailsUnderCategoryF
     * @tc.desc   Index 13 is 法比而 with the connor mailbox and the first F category label.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogFourteenthRowReusesConnorDetailsUnderCategoryF', 0, () => {
      const rows = createSeedContacts();
      const fabier = rows[13];
      expect(fabier.name).assertEqual('法比而');
      expect(fabier.phone).assertEqual('10000000000');
      expect(fabier.email).assertEqual('connor@example.com');
      expect(fabier.address).assertEqual('辽宁省沈阳市沈河区');
      expect(fabier.category).assertEqual(CATEGORY_F);
      expect(fabier.category).assertEqual('F');
      expect(fabier.email).assertEqual(rows[11].email);
    });

    /**
     * @tc.name   catalogFifteenthRowReusesKatrinaDetailsUnderCategoryF
     * @tc.desc   Index 14 closes the catalog with 法里, the katrina mailbox and category F.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogFifteenthRowReusesKatrinaDetailsUnderCategoryF', 0, () => {
      const rows = createSeedContacts();
      const fali = rows[14];
      expect(fali.name).assertEqual('法里');
      expect(fali.name.length).assertEqual(2);
      expect(fali.phone).assertEqual('11111111111');
      expect(fali.email).assertEqual('katrina@example.com');
      expect(fali.address).assertEqual('吉林省长春市朝阳区');
      expect(fali.category).assertEqual('F');
      expect(fali.email).assertEqual(rows[12].email);
      expect(rows.indexOf(fali)).assertEqual(14);
    });

    /**
     * @tc.name   catalogNamesFollowDeclarationOrder
     * @tc.desc   The joined name list reproduces the exact page order from 艾德里安 through 法里.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogNamesFollowDeclarationOrder', 0, () => {
      const names = contactNames(createSeedContacts());
      expect(joined(names, '>')).assertEqual('艾德里安>阿诺德>贝拉>本>本杰明>卡梅隆>康纳>卡特琳娜>丹尼尔>戴维维>艾登>艾拉>艾里>法比而>法里');
      expect(names[0]).assertEqual('艾德里安');
      expect(names[4]).assertEqual('本杰明');
      expect(names[9]).assertEqual('戴维维');
      expect(names[14]).assertEqual('法里');
      expect(names.length).assertEqual(15);
      expect(names.indexOf('康纳')).assertEqual(6);
      expect(names.indexOf('艾里')).assertEqual(12);
      logStep('catalogTest', 'declaration order pinned for ' + String(names.length) + ' rows');
    });

    /**
     * @tc.name   catalogPhonesUseSixDistinctNumbers
     * @tc.desc   Only six phone numbers appear across the fifteen rows, so many rows share a number.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogPhonesUseSixDistinctNumbers', 0, () => {
      const rows = createSeedContacts();
      const phones: string[] = [];
      for (let index = 0; index < rows.length; index++) {
        phones.push(rows[index].phone);
      }
      const distinct = uniqueStrings(phones);
      expect(distinct.length).assertEqual(6);
      expect(phones.length).assertEqual(15);
      expect(distinct.indexOf('13333333333')).assertEqual(0);
      expect(distinct.indexOf('12222222222')).assertEqual(3);
      expect(countOf(phones, '11111111111')).assertEqual(5);
      expect(countOf(phones, '16666666666')).assertEqual(2);
      expect(joined(distinct, ',')).assertEqual('13333333333,16666666666,11111111111,12222222222,17777777777,10000000000');
    });

    /**
     * @tc.name   catalogSharedPhonesGroupTheSameRows
     * @tc.desc   The 17777777777 number belongs to 卡梅隆, 丹尼尔 and 艾登 in categories C, D and E.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogSharedPhonesGroupTheSameRows', 0, () => {
      const rows = createSeedContacts();
      const owners: string[] = [];
      for (let index = 0; index < rows.length; index++) {
        if (rows[index].phone === '17777777777') {
          owners.push(rows[index].name);
        }
      }
      expect(owners.length).assertEqual(3);
      expect(joined(owners, '>')).assertEqual('卡梅隆>丹尼尔>艾登');
      expect(rows[5].category).assertEqual('C');
      expect(rows[8].category).assertEqual('D');
      expect(rows[10].category).assertEqual('E');
      expect(countOf(contactNames(rows), '艾登')).assertEqual(1);
    });

    /**
     * @tc.name   catalogCategoriesAppearAsSixLabels
     * @tc.desc   Walking the rows meets exactly the six labels A, B, C, D, E and F in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogCategoriesAppearAsSixLabels', 0, () => {
      const rows = createSeedContacts();
      const labels = SearchEngine.groupByCategory(rows);
      expect(labels.length).assertEqual(6);
      expect(joined(labels, '')).assertEqual('ABCDEF');
      expect(sameStringArray(labels, CATEGORIES)).assertTrue();
      expect(labels[0]).assertEqual(CATEGORY_A);
      expect(labels[5]).assertEqual(CATEGORY_F);
      expect(CATEGORIES.length).assertEqual(6);
      expect(rows[0].category).assertEqual(labels[0]);
    });

    /**
     * @tc.name   catalogCategoryACountIsTwo
     * @tc.desc   Category A holds 艾德里安 and 阿诺德 only, both in the opening two slots.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogCategoryACountIsTwo', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(2);
      expect(SearchEngine.countCategory(rows, 'A')).assertEqual(2);
      expect(rows[0].category).assertEqual('A');
      expect(rows[1].category).assertEqual('A');
      expect(rows[2].category === 'A').assertFalse();
      let scanned = 0;
      for (let index = 0; index < rows.length; index++) {
        if (rows[index].category === 'A') {
          scanned = scanned + 1;
        }
      }
      expect(scanned).assertEqual(2);
    });

    /**
     * @tc.name   catalogCategoryBCountIsThree
     * @tc.desc   Category B holds 贝拉, 本 and 本杰明, the three rows at indices 2 to 4.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogCategoryBCountIsThree', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_B)).assertEqual(3);
      expect(rows[2].category).assertEqual('B');
      expect(rows[3].category).assertEqual('B');
      expect(rows[4].category).assertEqual('B');
      expect(rows[5].category).assertEqual('C');
      const members = [rows[2].name, rows[3].name, rows[4].name];
      expect(joined(members, '>')).assertEqual('贝拉>本>本杰明');
      expect(countOf(contactNames(rows.slice(2, 5)), '本杰明')).assertEqual(1);
    });

    /**
     * @tc.name   catalogCategoryCCountIsThree
     * @tc.desc   Category C holds 卡梅隆, 康纳 and 卡特琳娜, closing with the 4 character name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogCategoryCCountIsThree', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_C)).assertEqual(3);
      expect(SearchEngine.countCategory(rows, CATEGORY_D)).assertEqual(2);
      const names = contactNames(rows.slice(5, 8));
      expect(joined(names, '>')).assertEqual('卡梅隆>康纳>卡特琳娜');
      expect(names[2].length).assertEqual(4);
      expect(rows[7].email).assertEqual('katrina@example.com');
      expect(rows[7].phone === rows[6].phone).assertFalse();
    });

    /**
     * @tc.name   catalogCategoryDCountIsTwo
     * @tc.desc   Category D holds exactly 丹尼尔 and 戴维维, both reusing an earlier profile.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogCategoryDCountIsTwo', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_D)).assertEqual(2);
      expect(rows[8].category).assertEqual('D');
      expect(rows[9].category).assertEqual('D');
      expect(rows[8].email).assertEqual(rows[5].email);
      expect(rows[9].email).assertEqual(rows[7].email);
      const names = [rows[8].name, rows[9].name];
      expect(joined(names, '>')).assertEqual('丹尼尔>戴维维');
      expect(SearchEngine.countCategory(rows, CATEGORY_A) === 2).assertTrue();
    });

    /**
     * @tc.name   catalogCategoryECountIsThree
     * @tc.desc   Category E holds the three 艾 names, each reusing a C or D profile in turn.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogCategoryECountIsThree', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_E)).assertEqual(3);
      const names = contactNames(rows.slice(10, 13));
      expect(joined(names, '>')).assertEqual('艾登>艾拉>艾里');
      expect(names[0].startsWith('艾')).assertTrue();
      expect(rows[10].email).assertEqual('cameron@example.com');
      expect(rows[11].email).assertEqual('connor@example.com');
      expect(rows[12].email).assertEqual('katrina@example.com');
      expect(uniqueStrings(names).length).assertEqual(3);
    });

    /**
     * @tc.name   catalogCategoryFCountIsTwo
     * @tc.desc   Category F closes the catalog with 法比而 and 法里, one connor and one katrina row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('catalogCategoryFCountIsTwo', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_F)).assertEqual(2);
      expect(rows[13].name).assertEqual('法比而');
      expect(rows[14].name).assertEqual('法里');
      expect(rows[13].email).assertEqual('connor@example.com');
      expect(rows[14].email).assertEqual('katrina@example.com');
      expect(SearchEngine.countCategory(rows, 'G')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, 'f')).assertEqual(0);
    });

    /**
     * @tc.name   catalogCategoryCountsSumToFifteen
     * @tc.desc   Summing the six per-label counts covers every row exactly once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogCategoryCountsSumToFifteen', 0, () => {
      const rows = createSeedContacts();
      let total = 0;
      const counts: number[] = [];
      for (let index = 0; index < CATEGORIES.length; index++) {
        const count = SearchEngine.countCategory(rows, CATEGORIES[index]);
        counts.push(count);
        total = total + count;
      }
      expect(total).assertEqual(15);
      expect(joined([String(counts[0]), String(counts[1]), String(counts[2])], '')).assertEqual('233');
      expect(joined([String(counts[3]), String(counts[4]), String(counts[5])], '')).assertEqual('232');
      expect(counts.length).assertEqual(6);
      expect(total).assertEqual(rows.length);
      expect(counts[5]).assertEqual(2);
    });

    /**
     * @tc.name   catalogAvatarIsEmptyForEveryRow
     * @tc.desc   None of the fifteen page literals supplies the avatar slot, so all values are empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogAvatarIsEmptyForEveryRow', 0, () => {
      const rows = createSeedContacts();
      let filled = 0;
      for (let index = 0; index < rows.length; index++) {
        if (rows[index].avatar.length > 0) {
          filled = filled + 1;
        }
      }
      expect(filled).assertEqual(0);
      expect(rows[0].avatar).assertEqual('');
      expect(rows[7].avatar).assertEqual('');
      expect(rows[14].avatar).assertEqual('');
      expect(rows[0].avatar.length).assertEqual(0);
      expect(countOf(contactNames(rows), '')).assertEqual(0);
    });

    /**
     * @tc.name   catalogEmailsAreEightDistinctValues
     * @tc.desc   Fifteen rows carry eight mailboxes; the aidelian mailbox appears once at index zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogEmailsAreEightDistinctValues', 0, () => {
      const rows = createSeedContacts();
      const emails: string[] = [];
      for (let index = 0; index < rows.length; index++) {
        emails.push(rows[index].email);
      }
      const distinct = uniqueStrings(emails);
      expect(distinct.length).assertEqual(8);
      expect(distinct[0]).assertEqual('aidelian@example.com');
      expect(distinct[7]).assertEqual('katrina@example.com');
      expect(countOf(emails, 'katrina@example.com')).assertEqual(4);
      expect(countOf(emails, 'cameron@example.com')).assertEqual(3);
      expect(countOf(emails, 'connor@example.com')).assertEqual(3);
      expect(countOf(emails, 'arnold@example.com')).assertEqual(1);
      expect(joined(distinct.slice(0, 3), ',')).assertEqual('aidelian@example.com,arnold@example.com,bella@example.com');
    });

    /**
     * @tc.name   catalogAddressesRepeatAcrossSharedPhones
     * @tc.desc   Addresses travel with the shared profile, so Xi'an covers three rows and Jilin four.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogAddressesRepeatAcrossSharedPhones', 0, () => {
      const rows = createSeedContacts();
      const addresses: string[] = [];
      for (let index = 0; index < rows.length; index++) {
        addresses.push(rows[index].address);
      }
      expect(uniqueStrings(addresses).length).assertEqual(7);
      expect(countOf(addresses, '陕西省西安市雁塔区')).assertEqual(3);
      expect(countOf(addresses, '吉林省长春市朝阳区')).assertEqual(4);
      expect(countOf(addresses, '上海市浦东新区')).assertEqual(2);
      expect(addresses[0]).assertEqual('江苏省南京市鼓楼区');
      expect(addresses[14]).assertEqual(addresses[9]);
      expect(rows[3].address.length).assertEqual(9);
    });

    /**
     * @tc.name   catalogNameLengthsStayWithinModerateLimit
     * @tc.desc   Every seed name fits the 12 character edit limit and none is longer than four.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogNameLengthsStayWithinModerateLimit', 0, () => {
      const rows = createSeedContacts();
      let longest = 0;
      let shortest = MAX_NAME_LENGTH;
      for (let index = 0; index < rows.length; index++) {
        const length = rows[index].name.length;
        if (length > longest) {
          longest = length;
        }
        if (length < shortest) {
          shortest = length;
        }
      }
      expect(longest).assertEqual(4);
      expect(shortest).assertEqual(1);
      expect(longest <= MAX_NAME_LENGTH).assertTrue();
      expect(MAX_NAME_LENGTH).assertEqual(CommonConstants.MAX_LENGTH_MODERATE);
      expect(rows[7].name.length).assertEqual(longest);
      expect(rows[3].name.length).assertEqual(shortest);
      expect(rows[3].name).assertEqual('本');
    });

    /**
     * @tc.name   catalogPhonesAreElevenNumericDigits
     * @tc.desc   All fifteen phones are digit-only eleven character strings starting with 1.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogPhonesAreElevenNumericDigits', 0, () => {
      const rows = createSeedContacts();
      let numeric = 0;
      for (let index = 0; index < rows.length; index++) {
        if (isDigitsOnly(rows[index].phone)) {
          numeric = numeric + 1;
        }
        expect(rows[index].phone.startsWith('1')).assertTrue();
      }
      expect(numeric).assertEqual(15);
      expect(rows[0].phone.length).assertEqual(11);
      expect(rows[7].phone.length).assertEqual(11);
      expect(rows[14].phone.length).assertEqual(11);
      expect(isDigitsOnly(rows[0].phone)).assertTrue();
      expect(isDigitsOnly('1333333333a')).assertFalse();
      expect(isDigitsOnly('')).assertFalse();
    });

    /**
     * @tc.name   catalogEmailsHaveValidShape
     * @tc.desc   Each mailbox has a local part, an at sign and a dotted domain, all using example.com.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogEmailsHaveValidShape', 0, () => {
      const rows = createSeedContacts();
      let valid = 0;
      for (let index = 0; index < rows.length; index++) {
        if (hasEmailShape(rows[index].email)) {
          valid = valid + 1;
        }
        expect(rows[index].email.endsWith('@example.com')).assertTrue();
      }
      expect(valid).assertEqual(15);
      expect(hasEmailShape('arnold@example.com')).assertTrue();
      expect(hasEmailShape('arnold.example.com')).assertFalse();
      expect(hasEmailShape('@example.com')).assertFalse();
      expect(rows[4].email.indexOf('@')).assertEqual(11);
      expect(rows[4].email.lastIndexOf('.')).assertEqual(19);
    });

    /**
     * @tc.name   catalogNameFingerprintIsStable
     * @tc.desc   Hashing the joined names twice yields the same value, and a reversed order diverges.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogNameFingerprintIsStable', 0, () => {
      const names = contactNames(createSeedContacts());
      const fingerprint = textFingerprint(joined(names, ','));
      expect(fingerprint).assertEqual(textFingerprint(joined(contactNames(createSeedContacts()), ',')));
      const reversed: string[] = [];
      for (let index = names.length - 1; index >= 0; index--) {
        reversed.push(names[index]);
      }
      expect(textFingerprint(joined(reversed, ',')) === fingerprint).assertFalse();
      expect(fingerprint >= 0).assertTrue();
      expect(fingerprint < 1000003).assertTrue();
      expect(reversed[0]).assertEqual('法里');
      expect(joined(names, ',').split(',').length).assertEqual(15);
    });

    /**
     * @tc.name   catalogManagerRoundTripKeepsCatalogOrder
     * @tc.desc   setContacts then getContacts returns the same fifteen names in the same order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogManagerRoundTripKeepsCatalogOrder', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = createSeedContacts();
      manager.setContacts(rows);
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(sameStringArray(contactNames(loaded), contactNames(rows))).assertTrue();
      expect(joined(contactNames(loaded), '>')).assertEqual(joined(contactNames(rows), '>'));
      expect(loaded[0].category).assertEqual('A');
      expect(loaded[14].category).assertEqual('F');
      expect(loaded === rows).assertFalse();
      expect(sameContact(loaded[5], rows[5])).assertTrue();
    });

    /**
     * @tc.name   catalogMetricsSummarizeTheCatalog
     * @tc.desc   Aggregate metrics over the catalog report six categories, no duplicates and 165 digits.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogMetricsSummarizeTheCatalog', 0, () => {
      const rows = createSeedContacts();
      const metrics = ContactMetrics.from(rows);
      expect(metrics.total).assertEqual(15);
      expect(metrics.uniqueNames).assertEqual(15);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.categories).assertEqual(6);
      expect(metrics.totalPhoneDigits).assertEqual(165);
      expect(metrics.fillRatio()).assertEqual(1);
      const manual = textFingerprint('15:15:6:165');
      expect(metrics.fingerprint()).assertEqual(manual);
      expect(metrics.totalPhoneDigits / 15).assertEqual(11);
    });

    /**
     * @tc.name   catalogSnapshotArrayMirrorsSeedOrder
     * @tc.desc   Snapshot rows one to one with the catalog, keeping names and categories in position.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('catalogSnapshotArrayMirrorsSeedOrder', 0, () => {
      const rows = createSeedContacts();
      const snapshots = snapshotsOf(rows);
      expect(snapshots.length).assertEqual(rows.length);
      expect(snapshots[0].name).assertEqual('艾德里安');
      expect(snapshots[4].name).assertEqual('本杰明');
      expect(snapshots[9].name).assertEqual('戴维维');
      expect(snapshots[14].name).assertEqual('法里');
      expect(snapshots[14].category).assertEqual('F');
      expect(snapshots[7].describe().indexOf('吉林省长春市朝阳区') > 0).assertTrue();
      expect(snapshots[0].sameAs(snapshots[0])).assertTrue();
      expect(snapshots[0].sameAs(snapshots[1])).assertFalse();
    });

    /**
     * @tc.name   catalogManagerExposesTheSameRowReferences
     * @tc.desc   getContacts copies the array but not the rows, so a source edit is visible after set.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('catalogManagerExposesTheSameRowReferences', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = createSeedContacts();
      manager.setContacts(rows);
      const snapshotBefore = manager.getContacts()[5].phone;
      rows[5].phone = '17777777700';
      expect(manager.getContacts()[5].phone).assertEqual('17777777700');
      expect(manager.getContacts()[5].phone === snapshotBefore).assertFalse();
      expect(manager.getContacts()[5] === rows[5]).assertTrue();
      rows[5].phone = '17777777777';
      expect(manager.getContacts()[5].phone).assertEqual('17777777777');
      expect(manager.getContacts()[5].name).assertEqual('卡梅隆');
      expect(manager.getContacts().length).assertEqual(15);
    });
    /**
     * @tc.name   catalogLeadingCharacterGroupsNineSurnames
     * @tc.desc   Nine distinct first characters open the names; 艾 starts four rows and 法 starts two.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCatalog scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('catalogLeadingCharacterGroupsNineSurnames', 0, () => {
      const rows = createSeedContacts();
      const initials: string[] = [];
      for (let index = 0; index < rows.length; index++) {
        initials.push(rows[index].name.substring(0, 1));
      }
      expect(uniqueStrings(initials).length).assertEqual(9);
      expect(countOf(initials, '艾')).assertEqual(4);
      expect(countOf(initials, '法')).assertEqual(2);
      expect(countOf(initials, '卡')).assertEqual(2);
      expect(countOf(initials, '本')).assertEqual(2);
      expect(countOf(initials, '阿')).assertEqual(1);
      expect(initials[0]).assertEqual('艾');
      expect(initials[14]).assertEqual('法');
      expect(joined(uniqueStrings(initials), '')).assertEqual('艾阿贝本卡康丹戴法');
    });
  });
}
