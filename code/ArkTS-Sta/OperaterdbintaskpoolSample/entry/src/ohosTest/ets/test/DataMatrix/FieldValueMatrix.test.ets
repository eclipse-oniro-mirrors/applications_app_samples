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
 * DataMatrix / FieldValueMatrix suite.
 *
 * Contact carries six string fields with empty defaults, and the edit form caps
 * them at twelve, twelve, twenty five and one hundred characters. The suite
 * walks each field across its default, boundary and over-length values and
 * checks the bucket round trip that the database layer performs.
 *
 * Source anchors:
 *   Contact.ets:31-47            six fields and the constructor defaults
 *   CommonConstant.ets:31-63     the four maximum lengths
 *   AddressBookEdit.ets:176-279  maxLength attributes on the inputs
 *   SharedDriver.ets:203-254     validation codes
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  CATEGORY_A,
  CATEGORY_B,
  MAX_ADDRESS_LENGTH,
  MAX_EMAIL_LENGTH,
  MAX_NAME_LENGTH,
  MAX_PHONE_LENGTH,
  BUCKET_KEYS,
  FIELD_ADDRESS,
  FIELD_AVATAR,
  FIELD_CATEGORY,
  FIELD_EMAIL,
  FIELD_NAME,
  FIELD_PHONE,
  contactOf,
  cloneContact,
  sameContact,
  joined,
  ContactValidation,
  ContactMapper,
  Bucket,
  resetContactManager
} from '../Shared/SharedDriver';

export default function fieldValueMatrixTest(): void {
  describe('FieldValueMatrix', () => {
    beforeAll(() => {
      logSuite('FieldValueMatrix', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('FieldValueMatrix', 'end');
    });

    /**
     * @tc.name   defaultConstructorLeavesAllFieldsEmpty
     * @tc.desc   A Contact built with no arguments carries six empty strings.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('defaultConstructorLeavesAllFieldsEmpty', 0, () => {
      const row = new Contact();
      expect(row.name).assertEqual('');
      expect(row.phone).assertEqual('');
      expect(row.email).assertEqual('');
      expect(row.address).assertEqual('');
      expect(row.avatar).assertEqual('');
      expect(row.category).assertEqual('');
      logStep('fieldValueMatrixTest', 'default constructor is all empty');
    });

    /**
     * @tc.name   positionalConstructorAssignsFirstFour
     * @tc.desc   Supplying four arguments fills name to address and leaves avatar and category empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('positionalConstructorAssignsFirstFour', 0, () => {
      const row = new Contact('林岸', '13800138000', 'lin@example.com', '上海市徐汇区');
      expect(row.name).assertEqual('林岸');
      expect(row.phone).assertEqual('13800138000');
      expect(row.email).assertEqual('lin@example.com');
      expect(row.address).assertEqual('上海市徐汇区');
      expect(row.avatar).assertEqual('');
      expect(row.category).assertEqual('');
      logStep('fieldValueMatrixTest', 'four arguments leave the last two empty');
    });

    /**
     * @tc.name   sixArgumentsAssignEveryField
     * @tc.desc   Six arguments reach all six fields in declaration order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sixArgumentsAssignEveryField', 0, () => {
      const row = contactOf('苏禾', '13512345678', 'suhe@example.com', '浙江省杭州市西湖区', 'avatar/suhe.png', CATEGORY_B);
      expect(row.name).assertEqual('苏禾');
      expect(row.phone).assertEqual('13512345678');
      expect(row.email).assertEqual('suhe@example.com');
      expect(row.address).assertEqual('浙江省杭州市西湖区');
      expect(row.avatar).assertEqual('avatar/suhe.png');
      expect(row.category).assertEqual(CATEGORY_B);
      logStep('fieldValueMatrixTest', 'six arguments fill six fields');
    });

    /**
     * @tc.name   bucketHasSixKeysInOrder
     * @tc.desc   The mapped bucket lists name, phone, email, address, avatar and category in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('bucketHasSixKeysInOrder', 0, () => {
      const bucket = ContactMapper.toBucket(contactOf('莫川', '13100000001', 'mochuan@example.com',
        '贵州省贵阳市南明区', 'avatar/mo.png', CATEGORY_A));
      expect(bucket.size()).assertEqual(6);
      expect(bucket.keyAt(0)).assertEqual(FIELD_NAME);
      expect(bucket.keyAt(1)).assertEqual(FIELD_PHONE);
      expect(bucket.keyAt(4)).assertEqual(FIELD_AVATAR);
      expect(bucket.keyAt(5)).assertEqual(FIELD_CATEGORY);
      expect(joined(bucket.keys)).assertEqual(joined(BUCKET_KEYS));
      logStep('fieldValueMatrixTest', 'bucket has the six keys in order');
    });

    /**
     * @tc.name   bucketRoundTripPreservesEveryField
     * @tc.desc   Mapping to a bucket and back returns an equal contact for every field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('bucketRoundTripPreservesEveryField', 0, () => {
      const row = contactOf('裴照', '13200000001', 'peizhao@example.com', '山西省大同市平城区', 'avatar/pei.png', CATEGORY_B);
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(row));
      expect(restored.name).assertEqual('裴照');
      expect(restored.phone).assertEqual('13200000001');
      expect(restored.email).assertEqual('peizhao@example.com');
      expect(restored.address).assertEqual('山西省大同市平城区');
      expect(restored.avatar).assertEqual('avatar/pei.png');
      expect(sameContact(restored, row)).assertTrue();
      logStep('fieldValueMatrixTest', 'bucket round trip keeps every field');
    });

    /**
     * @tc.name   allEmptyStringsRoundTrip
     * @tc.desc   A contact with six empty fields maps to a bucket and back unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('allEmptyStringsRoundTrip', 0, () => {
      const row = new Contact();
      const bucket = ContactMapper.toBucket(row);
      const restored = ContactMapper.fromBucket(bucket);
      expect(bucket.size()).assertEqual(6);
      expect(bucket.describe()).assertEqual('name=;phone=;email=;address=;avatar=;category=');
      expect(sameContact(restored, row)).assertTrue();
      expect(restored.name.length).assertEqual(0);
      logStep('fieldValueMatrixTest', 'empty strings round trip');
    });

    /**
     * @tc.name   nameAtMaximumLengthPasses
     * @tc.desc   A twelve character name is accepted while thirteen characters reports name-too-long.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nameAtMaximumLengthPasses', 0, () => {
      const exact = contactOf('ABCDEFGHIJKL', '13800138010', 'exact@example.com', '上海市黄浦区', '', CATEGORY_A);
      const over = contactOf('ABCDEFGHIJKLM', '13800138011', 'over@example.com', '上海市黄浦区', '', CATEGORY_A);
      expect(MAX_NAME_LENGTH).assertEqual(12);
      expect(exact.name.length).assertEqual(12);
      expect(ContactValidation.validate(exact).length).assertEqual(0);
      expect(ContactValidation.validate(over).indexOf('name-too-long') >= 0).assertTrue();
      logStep('fieldValueMatrixTest', 'name boundary is twelve');
    });

    /**
     * @tc.name   phoneAtMaximumLengthPasses
     * @tc.desc   Twelve digits are accepted while thirteen digits report phone-too-long.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('phoneAtMaximumLengthPasses', 0, () => {
      const exact = contactOf('段甲', '138001380020', 'duanjia@example.com', '湖南省长沙市岳麓区', '', CATEGORY_A);
      const over = contactOf('段甲', '1380013800203', 'duanjia@example.com', '湖南省长沙市岳麓区', '', CATEGORY_A);
      expect(MAX_PHONE_LENGTH).assertEqual(12);
      expect(exact.phone.length).assertEqual(12);
      expect(ContactValidation.validate(exact).length).assertEqual(0);
      expect(ContactValidation.validate(over).indexOf('phone-too-long') >= 0).assertTrue();
      logStep('fieldValueMatrixTest', 'phone boundary is twelve');
    });

    /**
     * @tc.name   emailBelowCapPasses
     * @tc.desc   Twenty five and twenty six character addresses are compared against the email cap.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emailBelowCapPasses', 0, () => {
      const exactEmail = 'abcdefghijklm@example.com';
      const overEmail = 'abcdefghijklmn@example.com';
      const exact = contactOf('段乙', '13800138021', exactEmail, '湖南省长沙市天心区', '', CATEGORY_A);
      const over = contactOf('段乙', '13800138021', overEmail, '湖南省长沙市天心区', '', CATEGORY_A);
      expect(MAX_EMAIL_LENGTH).assertEqual(25);
      expect(exactEmail.length).assertEqual(25);
      expect(ContactValidation.validate(exact).length).assertEqual(0);
      expect(overEmail.length).assertEqual(26);
      expect(ContactValidation.validate(over).indexOf('email-too-long') >= 0).assertTrue();
      logStep('fieldValueMatrixTest', 'email boundary is twenty five');
    });

    /**
     * @tc.name   emailOverCapReportsTooLong
     * @tc.desc   A twenty six character email address is rejected with email-too-long.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emailOverCapReportsTooLong', 0, () => {
      const overEmail = 'abcdefghijklmn@example.com';
      const over = contactOf('段丙', '13800138022', overEmail, '湖南省长沙市开福区', '', CATEGORY_A);
      expect(overEmail.length).assertEqual(26);
      expect(overEmail.length > MAX_EMAIL_LENGTH).assertTrue();
      const errors = ContactValidation.validate(over);
      expect(errors.indexOf('email-too-long') >= 0).assertTrue();
      expect(errors.length).assertEqual(1);
      logStep('fieldValueMatrixTest', 'over cap email reports too long');
    });

    /**
     * @tc.name   addressAtMaximumLengthPasses
     * @tc.desc   A one hundred character address passes and one hundred and one reports address-too-long.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('addressAtMaximumLengthPasses', 0, () => {
      let exactAddress = '';
      let overAddress = '';
      for (let index = 0; index < MAX_ADDRESS_LENGTH; index++) {
        exactAddress = exactAddress + 'x';
        overAddress = overAddress + 'y';
      }
      overAddress = overAddress + 'z';
      const exact = contactOf('段丁', '13800138023', 'duanding@example.com', exactAddress, '', CATEGORY_A);
      const over = contactOf('段丁', '13800138023', 'duanding@example.com', overAddress, '', CATEGORY_A);
      expect(exactAddress.length).assertEqual(100);
      expect(overAddress.length).assertEqual(101);
      expect(ContactValidation.validate(exact).length).assertEqual(0);
      expect(ContactValidation.validate(over).indexOf('address-too-long') >= 0).assertTrue();
      logStep('fieldValueMatrixTest', 'address boundary is one hundred');
    });

    /**
     * @tc.name   avatarIsStoredVerbatim
     * @tc.desc   A relative avatar path is preserved exactly including separators and extension.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('avatarIsStoredVerbatim', 0, () => {
      const path = 'avatar/local/user_01.png';
      const row = contactOf('阮一', '13300000001', 'ruanyi@example.com', '广西南宁市青秀区', path, CATEGORY_A);
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(row));
      expect(restored.avatar).assertEqual(path);
      expect(restored.avatar.indexOf('/') >= 0).assertTrue();
      expect(restored.avatar.endsWith('.png')).assertTrue();
      expect(restored.avatar.length).assertEqual(24);
      logStep('fieldValueMatrixTest', 'avatar path is verbatim');
    });

    /**
     * @tc.name   categoryKeepsSingleLetter
     * @tc.desc   A one letter category survives the bucket round trip without padding.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryKeepsSingleLetter', 0, () => {
      const row = contactOf('阮二', '13300000002', 'ruaner@example.com', '广西南宁市兴宁区', '', CATEGORY_B);
      const bucket: Bucket = ContactMapper.toBucket(row);
      expect(bucket.get(FIELD_CATEGORY)).assertEqual(CATEGORY_B);
      expect(bucket.get(FIELD_CATEGORY).length).assertEqual(1);
      expect(bucket.get(FIELD_AVATAR)).assertEqual('');
      expect(ContactMapper.fromBucket(bucket).category).assertEqual(CATEGORY_B);
      logStep('fieldValueMatrixTest', 'category keeps its single letter');
    });

    /**
     * @tc.name   cloneIsIndependentFromSource
     * @tc.desc   Editing a clone changes none of the six source fields.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cloneIsIndependentFromSource', 0, () => {
      const source = contactOf('洛川', '13620000091', 'luochuan@example.com', '河南省郑州市金水区', 'avatar/luo.png', CATEGORY_A);
      const copy = cloneContact(source);
      copy.name = '洛水';
      copy.phone = '13620000092';
      copy.email = 'luoshui@example.com';
      copy.address = '河南省洛阳市洛龙区';
      copy.avatar = 'avatar/shui.png';
      copy.category = CATEGORY_B;
      expect(source.name).assertEqual('洛川');
      expect(source.phone).assertEqual('13620000091');
      expect(source.avatar).assertEqual('avatar/luo.png');
      expect(source.category).assertEqual(CATEGORY_A);
      expect(sameContact(source, copy)).assertFalse();
      logStep('fieldValueMatrixTest', 'clone is independent');
    });

    /**
     * @tc.name   sameContactRejectsEachFieldDifference
     * @tc.desc   Changing exactly one field at a time always breaks equality.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameContactRejectsEachFieldDifference', 0, () => {
      const base = contactOf('裴云', '13200000011', 'peiyun@example.com', '山西省大同市云冈区', 'avatar/yun.png', CATEGORY_B);
      const nameDiff = contactOf('裴雨', '13200000011', 'peiyun@example.com', '山西省大同市云冈区', 'avatar/yun.png', CATEGORY_B);
      const phoneDiff = contactOf('裴云', '13200000012', 'peiyun@example.com', '山西省大同市云冈区', 'avatar/yun.png', CATEGORY_B);
      const emailDiff = contactOf('裴云', '13200000011', 'peiyu@example.com', '山西省大同市云冈区', 'avatar/yun.png', CATEGORY_B);
      expect(sameContact(base, nameDiff)).assertFalse();
      expect(sameContact(base, phoneDiff)).assertFalse();
      expect(sameContact(base, emailDiff)).assertFalse();
      expect(sameContact(base, cloneContact(base))).assertTrue();
      logStep('fieldValueMatrixTest', 'sameContact rejects each field difference');
    });

    /**
     * @tc.name   sameContactRejectsAddressAvatarCategory
     * @tc.desc   Address, avatar and category each break equality on their own.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameContactRejectsAddressAvatarCategory', 0, () => {
      const base = contactOf('裴风', '13200000012', 'peifeng@example.com', '山西省运城市盐湖区', 'avatar/feng.png', CATEGORY_B);
      const addressDiff = contactOf('裴风', '13200000012', 'peifeng@example.com', '山西省运城市河津市', 'avatar/feng.png', CATEGORY_B);
      const avatarDiff = contactOf('裴风', '13200000012', 'peifeng@example.com', '山西省运城市盐湖区', 'avatar/feng2.png', CATEGORY_B);
      const categoryDiff = contactOf('裴风', '13200000012', 'peifeng@example.com', '山西省运城市盐湖区', 'avatar/feng.png', CATEGORY_A);
      expect(sameContact(base, addressDiff)).assertFalse();
      expect(sameContact(base, avatarDiff)).assertFalse();
      expect(sameContact(base, categoryDiff)).assertFalse();
      expect(base.address).assertEqual('山西省运城市盐湖区');
      logStep('fieldValueMatrixTest', 'last three fields break equality');
    });

    /**
     * @tc.name   bucketPutOverwritesSameKey
     * @tc.desc   Putting the same key twice keeps one key and the second value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('bucketPutOverwritesSameKey', 0, () => {
      const bucket = new Bucket();
      bucket.put(FIELD_NAME, 'first');
      bucket.put(FIELD_PHONE, '13800138031');
      bucket.put(FIELD_NAME, 'second');
      expect(bucket.size()).assertEqual(2);
      expect(bucket.get(FIELD_NAME)).assertEqual('second');
      expect(bucket.keys.indexOf(FIELD_NAME)).assertEqual(0);
      expect(bucket.has(FIELD_PHONE)).assertTrue();
      logStep('fieldValueMatrixTest', 'bucket put overwrites in place');
    });

    /**
     * @tc.name   missingBucketKeyReadsEmpty
     * @tc.desc   Reading an absent bucket key returns an empty string, not undefined.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('missingBucketKeyReadsEmpty', 0, () => {
      const bucket = new Bucket();
      bucket.put(FIELD_NAME, '苏禾');
      expect(bucket.has(FIELD_PHONE)).assertFalse();
      expect(bucket.get(FIELD_PHONE)).assertEqual('');
      expect(bucket.size()).assertEqual(1);
      const restored = ContactMapper.fromBucket(bucket);
      expect(restored.name).assertEqual('苏禾');
      expect(restored.phone).assertEqual('');
      logStep('fieldValueMatrixTest', 'absent bucket key reads empty');
    });

    /**
     * @tc.name   validationEmptyFieldsReportCodes
     * @tc.desc   An all empty contact reports four empty codes and no length codes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validationEmptyFieldsReportCodes', 0, () => {
      const errors = ContactValidation.validate(new Contact());
      expect(errors.length).assertEqual(4);
      expect(errors.indexOf('name-empty') >= 0).assertTrue();
      expect(errors.indexOf('phone-empty') >= 0).assertTrue();
      expect(errors.indexOf('email-empty') >= 0).assertTrue();
      expect(errors.indexOf('address-empty') >= 0).assertTrue();
      expect(errors.indexOf('name-too-long')).assertEqual(-1);
      logStep('fieldValueMatrixTest', 'empty fields report four codes');
    });

    /**
     * @tc.name   validRowReportsNoCodes
     * @tc.desc   A row inside every limit reports an empty error list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('validRowReportsNoCodes', 0, () => {
      const row = contactOf('闻溪', '13700000091', 'wenxi@example.com', '广东省中山市石岐区', 'avatar/wen.png', CATEGORY_A);
      const errors = ContactValidation.validate(row);
      expect(errors.length).assertEqual(0);
      expect(ContactValidation.canSubmit(row)).assertTrue();
      expect(row.name.length <= MAX_NAME_LENGTH).assertTrue();
      expect(row.phone.length <= MAX_PHONE_LENGTH).assertTrue();
      logStep('fieldValueMatrixTest', 'valid row reports no codes');
    });

    /**
     * @tc.name   phoneLengthIsCharacterCount
     * @tc.desc   The phone limit counts characters, so a twelve digit number exactly fits.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('phoneLengthIsCharacterCount', 0, () => {
      const twelve = contactOf('闻舟', '137000000092', 'wenzhou@example.com', '广东省江门市蓬江区', '', CATEGORY_A);
      expect(twelve.phone.length).assertEqual(12);
      expect(twelve.phone.length === MAX_PHONE_LENGTH).assertTrue();
      expect(ContactValidation.validate(twelve).length).assertEqual(0);
      expect(MAX_NAME_LENGTH).assertEqual(MAX_PHONE_LENGTH);
      logStep('fieldValueMatrixTest', 'phone limit counts characters');
    });

    /**
     * @tc.name   nameCharacterCountBeatsBytes
     * @tc.desc   A four character CJK name is four length units, far below the limit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nameCharacterCountBeatsBytes', 0, () => {
      const row = contactOf('艾德里安', '13300000011', 'aidelian@example.com', '江苏省南京市鼓楼区', '', CATEGORY_A);
      expect(row.name.length).assertEqual(4);
      expect(row.name.length <= MAX_NAME_LENGTH).assertTrue();
      expect(ContactValidation.validate(row).length).assertEqual(0);
      expect(row.name.substring(0, 2)).assertEqual('艾德');
      logStep('fieldValueMatrixTest', 'CJK name length is character count');
    });

    /**
     * @tc.name   maxLengthConstantsAreOrdered
     * @tc.desc   The three caps increase from name and phone to email to address.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('maxLengthConstantsAreOrdered', 0, () => {
      expect(MAX_NAME_LENGTH).assertEqual(12);
      expect(MAX_PHONE_LENGTH).assertEqual(12);
      expect(MAX_EMAIL_LENGTH).assertEqual(25);
      expect(MAX_ADDRESS_LENGTH).assertEqual(100);
      expect(MAX_EMAIL_LENGTH > MAX_NAME_LENGTH).assertTrue();
      expect(MAX_ADDRESS_LENGTH > MAX_EMAIL_LENGTH).assertTrue();
      logStep('fieldValueMatrixTest', 'maximum lengths are ordered');
    });

    /**
     * @tc.name   bucketDescribeIsInspectable
     * @tc.desc   The describe form joins all six pairs with semicolons for debugging.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('bucketDescribeIsInspectable', 0, () => {
      const bucket = ContactMapper.toBucket(contactOf('莫水', '13100000021', 'moshui@example.com',
        '贵州省六盘水市钟山区', '', CATEGORY_B));
      const text = bucket.describe();
      expect(text.split(';').length).assertEqual(6);
      expect(text.startsWith('name=莫水;')).assertTrue();
      expect(text.endsWith('category=B')).assertTrue();
      expect(text.indexOf('avatar=;') >= 0).assertTrue();
      logStep('fieldValueMatrixTest', 'bucket describe is inspectable');
    });

    /**
     * @tc.name   toBucketsKeepsOneBucketPerRow
     * @tc.desc   Three contacts map to three buckets in the same order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('toBucketsKeepsOneBucketPerRow', 0, () => {
      const rows: Contact[] = [];
      rows.push(contactOf('甲一', '13500000001', 'jiayi@example.com', '湖北省宜昌市西陵区', '', CATEGORY_A));
      rows.push(contactOf('甲二', '13500000002', 'jiaer@example.com', '湖北省宜昌市伍家岗区', '', CATEGORY_A));
      rows.push(contactOf('甲三', '13500000003', 'jiasan@example.com', '湖北省宜昌市点军区', '', CATEGORY_B));
      const buckets = ContactMapper.toBuckets(rows);
      expect(buckets.length).assertEqual(3);
      expect(buckets[0].get(FIELD_NAME)).assertEqual('甲一');
      expect(buckets[2].get(FIELD_NAME)).assertEqual('甲三');
      expect(buckets[2].get(FIELD_CATEGORY)).assertEqual(CATEGORY_B);
      logStep('fieldValueMatrixTest', 'one bucket per row');
    });

    /**
     * @tc.name   contactOfDefaultsLastTwoFields
     * @tc.desc   The helper leaves avatar and category empty when only four values are supplied.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('contactOfDefaultsLastTwoFields', 0, () => {
      const row = contactOf('法里', '11111111111', 'katrina@example.com', '吉林省长春市朝阳区');
      expect(row.avatar).assertEqual('');
      expect(row.category).assertEqual('');
      expect(row.address).assertEqual('吉林省长春市朝阳区');
      expect(row.name).assertEqual('法里');
      logStep('fieldValueMatrixTest', 'contactOf defaults the optional fields');
    });

    /**
     * @tc.name   bucketKeysMatchFieldConstants
     * @tc.desc   Every key in the exported bucket key list equals its field constant.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FieldValueMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bucketKeysMatchFieldConstants', 0, () => {
      expect(BUCKET_KEYS.length).assertEqual(6);
      expect(BUCKET_KEYS[0]).assertEqual(FIELD_NAME);
      expect(BUCKET_KEYS[1]).assertEqual(FIELD_PHONE);
      expect(BUCKET_KEYS[2]).assertEqual(FIELD_EMAIL);
      expect(BUCKET_KEYS[3]).assertEqual(FIELD_ADDRESS);
      expect(BUCKET_KEYS[4]).assertEqual(FIELD_AVATAR);
      expect(BUCKET_KEYS[5]).assertEqual(FIELD_CATEGORY);
      logStep('fieldValueMatrixTest', 'bucket keys equal field constants');
    });
  });
}
