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
 * ContactCore / ContactFieldSemantics suite.
 *
 * DatabaseConnection builds one bucket with six columns in CREATE TABLE order
 * and reads them back by column index. The suite pins the bucket key order, the
 * ContactMapper round-trip for every field, the empty-string default, unicode
 * and emoji payloads and the per-field sensitivity of sameContact.
 *
 * Source anchors:
 *   Contact.ets:31-47                six fields, no trimming or validation
 *   RdbConstant.ets:33-34            column order name..category
 *   DatabaseConnection.ets:139-181   batch insert bucket mapping
 *   SharedDriver.ets:52-60           FIELD_* and BUCKET_KEYS
 *   SharedDriver.ets:262-341         Bucket and ContactMapper
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  BUCKET_KEYS,
  FIELD_NAME,
  FIELD_PHONE,
  FIELD_EMAIL,
  FIELD_ADDRESS,
  FIELD_AVATAR,
  FIELD_CATEGORY,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  joined,
  sameStringArray,
  countOf,
  Bucket,
  ContactMapper,
  ContactMetrics,
  resetContactManager
} from '../Shared/SharedDriver';

export default function contactFieldSemanticsTest(): void {
  describe('ContactFieldSemantics', () => {
    beforeAll(() => {
      logSuite('ContactFieldSemantics', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactFieldSemantics', 'end');
    });

    /**
     * @tc.name   bucketKeyOrderMatchesColumnOrder
     * @tc.desc   toBucket writes name, phone, email, address, avatar and category in that exact order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('bucketKeyOrderMatchesColumnOrder', 0, () => {
      const bucket = ContactMapper.toBucket(createSeedContacts()[0]);
      expect(bucket.size()).assertEqual(6);
      expect(joined(bucket.keys, ',')).assertEqual('name,phone,email,address,avatar,category');
      expect(sameStringArray(bucket.keys, BUCKET_KEYS)).assertTrue();
      expect(bucket.keyAt(0)).assertEqual(FIELD_NAME);
      expect(bucket.keyAt(1)).assertEqual(FIELD_PHONE);
      expect(bucket.keyAt(4)).assertEqual(FIELD_AVATAR);
      expect(bucket.keyAt(5)).assertEqual(FIELD_CATEGORY);
      expect(bucket.keys.indexOf('id')).assertEqual(-1);
    });

    /**
     * @tc.name   bucketSizeIsSixRegardlessOfValues
     * @tc.desc   A rich row and a default row both write six columns, so size never depends on data.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bucketSizeIsSixRegardlessOfValues', 0, () => {
      const rich = ContactMapper.toBucket(contactOf('林岸', '13800138000', 'lin@example.com',
        '上海市徐汇区', 'app.media.avatar_lin', 'C'));
      const plain = ContactMapper.toBucket(new Contact());
      expect(rich.size()).assertEqual(6);
      expect(plain.size()).assertEqual(6);
      expect(rich.size()).assertEqual(plain.size());
      expect(rich.keys.length).assertEqual(6);
      expect(plain.values.length).assertEqual(6);
      expect(BUCKET_KEYS.length).assertEqual(6);
      expect(rich.sameAs(plain)).assertFalse();
    });

    /**
     * @tc.name   mapperRoundTripPreservesAllSixFields
     * @tc.desc   A full row survives toBucket followed by fromBucket with every field unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('mapperRoundTripPreservesAllSixFields', 0, () => {
      const source = contactOf('林岸', '13800138000', 'lin@example.com',
        '上海市徐汇区', 'app.media.avatar_lin', 'C');
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(source));
      expect(sameContact(restored, source)).assertTrue();
      expect(restored === source).assertFalse();
      expect(restored.name).assertEqual('林岸');
      expect(restored.phone).assertEqual('13800138000');
      expect(restored.email).assertEqual('lin@example.com');
      expect(restored.address).assertEqual('上海市徐汇区');
      expect(restored.avatar).assertEqual('app.media.avatar_lin');
      expect(restored.category).assertEqual('C');
    });

    /**
     * @tc.name   mapperRoundTripPreservesUnicodeName
     * @tc.desc   A name with a middle dot and Latin diacritics round-trips without normalisation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mapperRoundTripPreservesUnicodeName', 0, () => {
      const source = contactOf('林·岸 Zoë', '13800138001', 'zoe@example.com',
        '上海市黄浦区', '', 'D');
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(source));
      expect(restored.name).assertEqual('林·岸 Zoë');
      expect(restored.name.length).assertEqual(source.name.length);
      expect(restored.name.indexOf('·') >= 0).assertTrue();
      expect(restored.name.endsWith('Zoë')).assertTrue();
      expect(sameContact(restored, source)).assertTrue();
      expect(countOf([restored.name], '林·岸 Zoë')).assertEqual(1);
      expect(restored.category).assertEqual('D');
    });

    /**
     * @tc.name   mapperRoundTripPreservesEmojiAvatar
     * @tc.desc   An avatar containing emoji and a path separator is stored verbatim as one string.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mapperRoundTripPreservesEmojiAvatar', 0, () => {
      const avatar = 'avatars/🙂/profile_艾拉.png';
      const source = contactOf('艾拉', '10000000000', 'connor@example.com',
        '辽宁省沈阳市沈河区', avatar, 'E');
      const bucket = ContactMapper.toBucket(source);
      const restored = ContactMapper.fromBucket(bucket);
      expect(bucket.get(FIELD_AVATAR)).assertEqual(avatar);
      expect(restored.avatar).assertEqual(avatar);
      expect(restored.avatar.indexOf('🙂') >= 0).assertTrue();
      expect(restored.avatar.startsWith('avatars/')).assertTrue();
      expect(sameContact(restored, source)).assertTrue();
      expect(restored.category).assertEqual('E');
    });

    /**
     * @tc.name   emptyStringsRoundTripAsEmpty
     * @tc.desc   Six empty strings pass through the mapper and stay empty, never becoming undefined.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyStringsRoundTripAsEmpty', 0, () => {
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(contactOf('', '', '', '', '', '')));
      expect(restored.name).assertEqual('');
      expect(restored.phone).assertEqual('');
      expect(restored.email).assertEqual('');
      expect(restored.address).assertEqual('');
      expect(restored.avatar).assertEqual('');
      expect(restored.category).assertEqual('');
      expect(restored.name.length).assertEqual(0);
      expect(sameContact(restored, new Contact())).assertTrue();
    });

    /**
     * @tc.name   fromBucketMissingKeysYieldEmptyStrings
     * @tc.desc   A bucket without any of the six keys still builds a contact with six empty fields.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fromBucketMissingKeysYieldEmptyStrings', 0, () => {
      const restored = ContactMapper.fromBucket(new Bucket());
      expect(restored.name).assertEqual('');
      expect(restored.phone).assertEqual('');
      expect(restored.email).assertEqual('');
      expect(restored.address).assertEqual('');
      expect(restored.avatar).assertEqual('');
      expect(restored.category).assertEqual('');
      expect(sameContact(restored, new Contact())).assertTrue();
      expect(restored.name === undefined).assertFalse();
    });

    /**
     * @tc.name   bucketPutOverwritesValueWithoutGrowingKeys
     * @tc.desc   Re-putting an existing key replaces the value and keeps the key list length at six.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bucketPutOverwritesValueWithoutGrowingKeys', 0, () => {
      const bucket = ContactMapper.toBucket(createSeedContacts()[2]);
      expect(bucket.size()).assertEqual(6);
      bucket.put(FIELD_PHONE, '13900000000');
      expect(bucket.size()).assertEqual(6);
      expect(bucket.get(FIELD_PHONE)).assertEqual('13900000000');
      bucket.put(FIELD_PHONE, '13911111111');
      expect(bucket.get(FIELD_PHONE)).assertEqual('13911111111');
      expect(countOf(bucket.keys, FIELD_PHONE)).assertEqual(1);
      expect(bucket.keys.indexOf(FIELD_PHONE)).assertEqual(1);
      expect(bucket.valueAt(1)).assertEqual('13911111111');
      expect(bucket.get(FIELD_NAME)).assertEqual('贝拉');
    });

    /**
     * @tc.name   bucketGetUnknownKeyReturnsEmpty
     * @tc.desc   Reading a key that was never written returns '' instead of throwing or returning a value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bucketGetUnknownKeyReturnsEmpty', 0, () => {
      const bucket = ContactMapper.toBucket(createSeedContacts()[0]);
      expect(bucket.get('id')).assertEqual('');
      expect(bucket.get('nickname')).assertEqual('');
      expect(bucket.get('Name')).assertEqual('');
      expect(bucket.has('id')).assertFalse();
      expect(bucket.has(FIELD_NAME)).assertTrue();
      expect(bucket.get(FIELD_NAME)).assertEqual('艾德里安');
      expect(bucket.size()).assertEqual(6);
      expect(bucket.keys.indexOf('id')).assertEqual(-1);
    });

    /**
     * @tc.name   bucketDescribeJoinsPairsWithSemicolon
     * @tc.desc   describe emits key=value pairs in insertion order separated by semicolons.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bucketDescribeJoinsPairsWithSemicolon', 0, () => {
      const bucket = ContactMapper.toBucket(createSeedContacts()[5]);
      expect(bucket.describe()).assertEqual('name=卡梅隆;phone=17777777777;email=cameron@example.com;' +
        'address=陕西省西安市雁塔区;avatar=;category=C');
      expect(bucket.describe().split(';').length).assertEqual(6);
      expect(bucket.describe().split(';')[0]).assertEqual('name=卡梅隆');
      expect(bucket.describe().split(';')[4]).assertEqual('avatar=');
      expect(bucket.describe().indexOf('category=C') > 0).assertTrue();
      expect(bucket.describe().indexOf('=') > 0).assertTrue();
    });

    /**
     * @tc.name   bucketSameAsFalseAfterValueChange
     * @tc.desc   Two identical buckets stop matching as soon as one value is overwritten.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bucketSameAsFalseAfterValueChange', 0, () => {
      const left = ContactMapper.toBucket(createSeedContacts()[7]);
      const right = ContactMapper.toBucket(createSeedContacts()[7]);
      expect(left.sameAs(right)).assertTrue();
      right.put(FIELD_EMAIL, 'changed@example.com');
      expect(left.sameAs(right)).assertFalse();
      expect(right.get(FIELD_EMAIL)).assertEqual('changed@example.com');
      expect(left.get(FIELD_EMAIL)).assertEqual('katrina@example.com');
      expect(left.describe() === right.describe()).assertFalse();
      expect(left.sameAs(ContactMapper.toBucket(createSeedContacts()[7]))).assertTrue();
    });

    /**
     * @tc.name   toBucketsProducesOneBucketPerRow
     * @tc.desc   toBuckets maps fifteen rows into fifteen buckets whose names follow the row order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('toBucketsProducesOneBucketPerRow', 0, () => {
      const rows = createSeedContacts();
      const buckets = ContactMapper.toBuckets(rows);
      expect(buckets.length).assertEqual(rows.length);
      expect(buckets.length).assertEqual(15);
      const names: string[] = [];
      for (let index = 0; index < buckets.length; index++) {
        names.push(buckets[index].get(FIELD_NAME));
      }
      expect(sameStringArray(names, contactNames(rows))).assertTrue();
      expect(buckets[0].get(FIELD_NAME)).assertEqual('艾德里安');
      expect(buckets[14].get(FIELD_NAME)).assertEqual('法里');
      expect(buckets[6].get(FIELD_PHONE)).assertEqual('10000000000');
      expect(ContactMapper.toBuckets([]).length).assertEqual(0);
    });

    /**
     * @tc.name   sameContactDetectsNameOnlyDifference
     * @tc.desc   Changing just the name breaks equality while the other five fields stay identical.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameContactDetectsNameOnlyDifference', 0, () => {
      const base = createSeedContacts()[4];
      const changed = contactOf('本杰明改', base.phone, base.email, base.address, base.avatar, base.category);
      expect(sameContact(base, changed)).assertFalse();
      expect(changed.phone).assertEqual(base.phone);
      expect(changed.email).assertEqual(base.email);
      expect(changed.address).assertEqual(base.address);
      expect(changed.category).assertEqual(base.category);
      expect(changed.name.length).assertEqual(base.name.length + 1);
    });

    /**
     * @tc.name   sameContactDetectsPhoneOnlyDifference
     * @tc.desc   A one digit phone change is enough to break equality on an otherwise identical row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameContactDetectsPhoneOnlyDifference', 0, () => {
      const base = createSeedContacts()[6];
      const changed = contactOf(base.name, '10000000001', base.email, base.address, base.avatar, base.category);
      expect(sameContact(base, changed)).assertFalse();
      expect(changed.phone.length).assertEqual(base.phone.length);
      expect(changed.phone === base.phone).assertFalse();
      expect(changed.name).assertEqual(base.name);
      expect(changed.email).assertEqual(base.email);
      expect(ContactMapper.toBucket(changed).sameAs(ContactMapper.toBucket(base))).assertFalse();
    });

    /**
     * @tc.name   sameContactDetectsEmailOnlyDifference
     * @tc.desc   Whitespace inside the mailbox counts as a difference because comparison is exact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameContactDetectsEmailOnlyDifference', 0, () => {
      const base = createSeedContacts()[1];
      const changed = contactOf(base.name, base.phone, ' arnold@example.com', base.address, base.avatar,
        base.category);
      expect(sameContact(base, changed)).assertFalse();
      expect(changed.email.length).assertEqual(base.email.length + 1);
      expect(changed.email.startsWith(' ')).assertTrue();
      expect(changed.phone).assertEqual(base.phone);
      expect(changed.category).assertEqual(base.category);
      expect(changed.email.substring(1)).assertEqual(base.email);    });

    /**
     * @tc.name   sameContactDetectsAddressOnlyDifference
     * @tc.desc   A different district inside the same city is detected as an address change.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameContactDetectsAddressOnlyDifference', 0, () => {
      const base = createSeedContacts()[11];
      const changed = contactOf(base.name, base.phone, base.email, '辽宁省沈阳市和平区', base.avatar,
        base.category);
      expect(sameContact(base, changed)).assertFalse();
      expect(base.address).assertEqual('辽宁省沈阳市沈河区');
      expect(changed.address).assertEqual('辽宁省沈阳市和平区');
      expect(base.address.substring(0, 6)).assertEqual(changed.address.substring(0, 6));
      expect(changed.name).assertEqual(base.name);
      expect(changed.category).assertEqual(base.category);
      expect(changed.address.length).assertEqual(base.address.length);
    });

    /**
     * @tc.name   sameContactDetectsAvatarOnlyDifference
     * @tc.desc   The avatar slot participates in equality even though the page always seeds it empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameContactDetectsAvatarOnlyDifference', 0, () => {
      const base = createSeedContacts()[13];
      expect(base.avatar).assertEqual('');
      const changed = contactOf(base.name, base.phone, base.email, base.address, 'app.media.avatar_fabier',
        base.category);
      expect(sameContact(base, changed)).assertFalse();
      expect(changed.avatar.length > 0).assertTrue();
      expect(changed.name).assertEqual(base.name);
      expect(changed.phone).assertEqual(base.phone);
      expect(changed.category).assertEqual(base.category);
      expect(ContactMapper.toBucket(changed).get(FIELD_AVATAR)).assertEqual('app.media.avatar_fabier');
    });

    /**
     * @tc.name   sameContactDetectsCategoryOnlyDifference
     * @tc.desc   Two rows with the same profile but different categories are not the same contact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameContactDetectsCategoryOnlyDifference', 0, () => {
      const rows = createSeedContacts();
      const cameron = rows[5];
      const eden = rows[10];
      expect(cameron.phone).assertEqual(eden.phone);
      expect(cameron.email).assertEqual(eden.email);
      expect(cameron.address).assertEqual(eden.address);
      expect(sameContact(cameron, eden)).assertFalse();
      expect(cameron.category).assertEqual('C');
      expect(eden.category).assertEqual('E');
      expect(cameron.category === eden.category).assertFalse();
    });

    /**
     * @tc.name   unicodeNameSurvivesManagerRoundTrip
     * @tc.desc   A unicode name stored in the manager keeps its code points after set and get.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unicodeNameSurvivesManagerRoundTrip', 0, () => {
      const manager = ContactManager.getInstance();
      const name = '阿卜杜拉·买买提';
      manager.setContacts([contactOf(name, '13800138002', 'abdulla@example.com', '新疆维吾尔自治区喀什地区', '', 'D')]);
      const loaded = manager.getContacts()[0];
      expect(loaded.name).assertEqual(name);
      expect(loaded.name.length).assertEqual(name.length);
      expect(loaded.name.indexOf('·') >= 0).assertTrue();
      expect(loaded.name.substring(0, 3)).assertEqual('阿卜杜');
      expect(ContactMapper.fromBucket(ContactMapper.toBucket(loaded)).name).assertEqual(name);
      expect(countOf([loaded.name], name)).assertEqual(1);
    });

    /**
     * @tc.name   emojiCategorySurvivesBucket
     * @tc.desc   The category slot accepts any string, including one made only of an emoji.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emojiCategorySurvivesBucket', 0, () => {
      const source = contactOf('林岸', '13800138003', 'lin@example.com', '上海市徐汇区', '', '😀');
      const bucket = ContactMapper.toBucket(source);
      const restored = ContactMapper.fromBucket(bucket);
      expect(bucket.get(FIELD_CATEGORY)).assertEqual('😀');
      expect(restored.category).assertEqual('😀');
      expect(restored.category === 'A').assertFalse();
      expect(restored.category.length > 0).assertTrue();
      expect(sameContact(restored, source)).assertTrue();
      expect(bucket.keys.indexOf(FIELD_CATEGORY)).assertEqual(5);
    });

    /**
     * @tc.name   spacesInNamePreservedThroughBucket
     * @tc.desc   Interior and edge spaces in a name are not trimmed by the mapper.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('spacesInNamePreservedThroughBucket', 0, () => {
      const source = contactOf(' 林 岸 ', '13800138004', 'lin@example.com', '上海市徐汇区', '', 'C');
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(source));
      expect(restored.name).assertEqual(' 林 岸 ');
      expect(restored.name.length).assertEqual(5);
      expect(restored.name.startsWith(' ')).assertTrue();
      expect(restored.name.endsWith(' ')).assertTrue();
      expect(restored.name.indexOf(' 岸') > 0).assertTrue();
      expect(sameContact(restored, source)).assertTrue();
    });

    /**
     * @tc.name   newlineInAddressPreservedThroughBucket
     * @tc.desc   A multi-line address keeps its newline characters through the bucket round-trip.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('newlineInAddressPreservedThroughBucket', 0, () => {
      const address = '辽宁省\n沈阳市\n沈河区';
      const source = contactOf('康纳', '10000000000', 'connor@example.com', address, '', 'C');
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(source));
      expect(restored.address).assertEqual(address);
      expect(restored.address.split('\n').length).assertEqual(3);
      expect(restored.address.indexOf('\n') >= 0).assertTrue();
      expect(restored.address.length).assertEqual(address.length);
      expect(sameContact(restored, source)).assertTrue();
      expect(restored.category).assertEqual('C');
    });

    /**
     * @tc.name   longFieldValuesSurviveMapper
     * @tc.desc   A twelve character name and a hundred character address survive without truncation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longFieldValuesSurviveMapper', 0, () => {
      const name = '一二三四五六七八九十一二';
      let address = '';
      for (let index = 0; index < 20; index++) {
        address = address + '街区';
      }
      const source = contactOf(name, '13800138005', 'long@example.com', address, '', 'F');
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(source));
      expect(restored.name.length).assertEqual(12);
      expect(restored.address.length).assertEqual(40);
      expect(restored.address).assertEqual(address);
      expect(restored.name).assertEqual(name);
      expect(sameContact(restored, source)).assertTrue();
      expect(restored.email).assertEqual('long@example.com');
    });

    /**
     * @tc.name   bucketKeyAtOutOfRangeIsUndefined
     * @tc.desc   Reading a key index past the six columns yields undefined rather than a wrapped key.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('bucketKeyAtOutOfRangeIsUndefined', 0, () => {
      const bucket = ContactMapper.toBucket(new Contact());
      expect(bucket.keyAt(0)).assertEqual('name');
      expect(bucket.keyAt(5)).assertEqual('category');
      expect(bucket.keyAt(6) === undefined).assertTrue();
      expect(bucket.keyAt(-1) === undefined).assertTrue();
      expect(bucket.keyAt(100) === undefined).assertTrue();
      expect(bucket.size()).assertEqual(6);
      expect(bucket.valueAt(6) === undefined).assertTrue();
    });

    /**
     * @tc.name   mapperFromBucketIgnoresExtraKeys
     * @tc.desc   Additional keys such as id do not disturb the six field extraction.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mapperFromBucketIgnoresExtraKeys', 0, () => {
      const bucket = ContactMapper.toBucket(createSeedContacts()[3]);
      bucket.put('id', '17');
      bucket.put('created_at', '2026-01-01');
      expect(bucket.size()).assertEqual(8);
      const restored = ContactMapper.fromBucket(bucket);
      expect(restored.name).assertEqual('本');
      expect(restored.phone).assertEqual('12222222222');
      expect(restored.category).assertEqual('B');
      expect(sameContact(restored, createSeedContacts()[3])).assertTrue();
      expect(bucket.get('id')).assertEqual('17');
      expect(bucket.keys.indexOf(FIELD_NAME)).assertEqual(0);
    });

    /**
     * @tc.name   sameContactReflexiveForEverySeedRow
     * @tc.desc   Every seeded row compares equal to a clone of itself and unequal to the next row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sameContactReflexiveForEverySeedRow', 0, () => {
      const rows = createSeedContacts();
      let reflexive = 0;
      for (let index = 0; index < rows.length; index++) {
        if (sameContact(rows[index], cloneContact(rows[index]))) {
          reflexive = reflexive + 1;
        }
      }
      expect(reflexive).assertEqual(15);
      expect(sameContact(rows[0], rows[0])).assertTrue();
      expect(sameContact(rows[0], rows[1])).assertFalse();
      expect(sameContact(rows[14], rows[13])).assertFalse();
      expect(sameContact(rows[7], cloneContact(rows[7]))).assertTrue();
      expect(ContactMapper.toBucket(rows[7]).sameAs(ContactMapper.toBucket(cloneContact(rows[7])))).assertTrue();
    });

    /**
     * @tc.name   sameContactSymmetricForSeedPairs
     * @tc.desc   Equality is symmetric: every ordered pair of distinct rows reports false both ways.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameContactSymmetricForSeedPairs', 0, () => {
      const rows = createSeedContacts();
      let pairs = 0;
      let mismatched = 0;
      for (let outer = 0; outer < rows.length; outer++) {
        for (let inner = 0; inner < rows.length; inner++) {
          if (outer !== inner) {
            pairs = pairs + 1;
            if (sameContact(rows[outer], rows[inner]) !== sameContact(rows[inner], rows[outer])) {
              mismatched = mismatched + 1;
            }
          }
        }
      }
      expect(pairs).assertEqual(210);
      expect(mismatched).assertEqual(0);
      expect(sameContact(rows[8], rows[10])).assertFalse();
      expect(sameContact(rows[10], rows[8])).assertFalse();
      expect(sameContact(rows[9], rows[12])).assertFalse();
      expect(sameContact(rows[12], rows[9])).assertFalse();
    });

    /**
     * @tc.name   trimmedNameDiffersFromOriginal
     * @tc.desc   Dropping the surrounding spaces creates a different name and a different bucket.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('trimmedNameDiffersFromOriginal', 0, () => {
      const padded = contactOf(' 法里 ', '11111111111', 'katrina@example.com', '吉林省长春市朝阳区', '', 'F');
      const trimmed = contactOf('法里', '11111111111', 'katrina@example.com', '吉林省长春市朝阳区', '', 'F');
      expect(padded.name.length).assertEqual(4);
      expect(trimmed.name.length).assertEqual(2);
      expect(sameContact(padded, trimmed)).assertFalse();
      expect(padded.name.substring(1, 3)).assertEqual('法里');
      expect(ContactMapper.toBucket(padded).sameAs(ContactMapper.toBucket(trimmed))).assertFalse();
      expect(ContactMapper.fromBucket(ContactMapper.toBucket(padded)).name).assertEqual(' 法里 ');
    });

    /**
     * @tc.name   caseDifferenceInNameDetected
     * @tc.desc   Latin case is significant in every field, so Alice and alice are different rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('caseDifferenceInNameDetected', 0, () => {
      const upper = contactOf('Alice', '13800138006', 'alice@example.com', '上海市静安区', '', 'C');
      const lower = contactOf('alice', '13800138006', 'alice@example.com', '上海市静安区', '', 'C');
      expect(sameContact(upper, lower)).assertFalse();
      expect(upper.name === lower.name).assertFalse();
      expect(upper.name.toLowerCase()).assertEqual(lower.name);
      expect(ContactMapper.toBucket(upper).get(FIELD_NAME)).assertEqual('Alice');
      expect(ContactMapper.toBucket(lower).get(FIELD_NAME)).assertEqual('alice');
      expect(countOf([upper.name, lower.name], 'alice')).assertEqual(1);
    });

    /**
     * @tc.name   managerRowMatchesBucketRebuild
     * @tc.desc   Rebuilding a manager row through a bucket yields the same stored field values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerRowMatchesBucketRebuild', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      let matched = 0;
      for (let index = 0; index < manager.getContacts().length; index++) {
        const stored = manager.getContacts()[index];
        const rebuilt = ContactMapper.fromBucket(ContactMapper.toBucket(stored));
        if (sameContact(stored, rebuilt)) {
          matched = matched + 1;
        }
      }
      expect(matched).assertEqual(15);
      const first = manager.getContacts()[0];
      expect(ContactMapper.toBucket(first).get(FIELD_NAME)).assertEqual(first.name);
      expect(ContactMapper.toBucket(first).get(FIELD_CATEGORY)).assertEqual(first.category);
      expect(ContactMapper.toBucket(first).get(FIELD_AVATAR)).assertEqual(first.avatar);
      expect(ContactMapper.toBucket(first).size()).assertEqual(6);
    });

    /**
     * @tc.name   bucketValuesMatchContactFieldsByIndex
     * @tc.desc   Each value slot carries the same field as its key at the same index.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bucketValuesMatchContactFieldsByIndex', 0, () => {
      const row = createSeedContacts()[12];
      const bucket = ContactMapper.toBucket(row);
      const fields = [row.name, row.phone, row.email, row.address, row.avatar, row.category];
      let matched = 0;
      for (let index = 0; index < bucket.size(); index++) {
        if (bucket.valueAt(index) === fields[index] && bucket.keyAt(index) === BUCKET_KEYS[index]) {
          matched = matched + 1;
        }
      }
      expect(matched).assertEqual(6);
      expect(bucket.valueAt(0)).assertEqual('艾里');
      expect(bucket.valueAt(3)).assertEqual('吉林省长春市朝阳区');
      expect(bucket.valueAt(4)).assertEqual('');
      expect(bucket.valueAt(5)).assertEqual('E');
      expect(bucket.values.length).assertEqual(bucket.keys.length);
    });

    /**
     * @tc.name   bucketSnapshotSurvivesContactMutation
     * @tc.desc   Once written, the bucket keeps the old value even if the source contact changes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('bucketSnapshotSurvivesContactMutation', 0, () => {
      const row = createSeedContacts()[2];
      const bucket = ContactMapper.toBucket(row);
      row.phone = '13900003030';
      row.category = 'F';
      expect(bucket.get(FIELD_PHONE)).assertEqual('11111111111');
      expect(bucket.get(FIELD_CATEGORY)).assertEqual('B');
      expect(row.phone).assertEqual('13900003030');
      expect(row.category).assertEqual('F');
      const restored = ContactMapper.fromBucket(bucket);
      expect(restored.phone).assertEqual('11111111111');
      expect(restored.category).assertEqual('B');
      expect(sameContact(restored, row)).assertFalse();
    });

    /**
     * @tc.name   phoneFieldChangeBreaksBucketEquality
     * @tc.desc   Overwriting only the phone value makes two seed buckets differ while keys stay equal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('phoneFieldChangeBreaksBucketEquality', 0, () => {
      const left = ContactMapper.toBucket(createSeedContacts()[10]);
      const right = ContactMapper.toBucket(createSeedContacts()[10]);
      right.put(FIELD_PHONE, '13900003131');
      expect(left.sameAs(right)).assertFalse();
      expect(sameStringArray(left.keys, right.keys)).assertTrue();
      expect(left.get(FIELD_NAME)).assertEqual(right.get(FIELD_NAME));
      expect(left.get(FIELD_PHONE)).assertEqual('17777777777');
      expect(right.get(FIELD_PHONE)).assertEqual('13900003131');
      expect(left.size()).assertEqual(right.size());
    });

    /**
     * @tc.name   emailWithEmojiRoundTrips
     * @tc.desc   A mailbox string containing emoji is preserved as opaque text by the mapper.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emailWithEmojiRoundTrips', 0, () => {
      const email = 'emoji🙂@example.com';
      const source = contactOf('艾拉', '10000000000', email, '辽宁省沈阳市沈河区', '', 'E');
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(source));
      expect(restored.email).assertEqual(email);
      expect(restored.email.indexOf('🙂') >= 0).assertTrue();
      expect(restored.email.endsWith('@example.com')).assertTrue();
      expect(restored.email.indexOf('@')).assertEqual(7);
      expect(sameContact(restored, source)).assertTrue();
      expect(ContactMapper.toBucket(restored).get(FIELD_EMAIL)).assertEqual(email);
    });

    /**
     * @tc.name   seedFieldValuesHaveNoEdgeSpaces
     * @tc.desc   Every seeded name, phone, mailbox and address starts and ends with a non-space rune.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('seedFieldValuesHaveNoEdgeSpaces', 0, () => {
      const rows = createSeedContacts();
      let padded = 0;
      for (let index = 0; index < rows.length; index++) {
        if (rows[index].name.startsWith(' ') || rows[index].name.endsWith(' ') ||
          rows[index].phone.startsWith(' ') || rows[index].email.endsWith(' ') ||
          rows[index].address.startsWith(' ') || rows[index].address.endsWith(' ')) {
          padded = padded + 1;
        }
      }
      expect(padded).assertEqual(0);
      expect(rows[0].name.startsWith('艾')).assertTrue();
      expect(rows[0].address.endsWith('区')).assertTrue();
      expect(rows[14].email.endsWith('m')).assertTrue();
      expect(rows[6].phone.startsWith('1')).assertTrue();
      expect(rows[3].name.length).assertEqual(1);
      expect(rows[7].address.indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.name   bucketCopyOfSeedPreservesCategoryLabels
     * @tc.desc   Rebuilding all fifteen rows from buckets keeps the six category labels and counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bucketCopyOfSeedPreservesCategoryLabels', 0, () => {
      const rows = createSeedContacts();
      const buckets = ContactMapper.toBuckets(rows);
      const rebuilt: Contact[] = [];
      for (let index = 0; index < buckets.length; index++) {
        rebuilt.push(ContactMapper.fromBucket(buckets[index]));
      }
      const labels: string[] = [];
      for (let index = 0; index < rebuilt.length; index++) {
        if (labels.indexOf(rebuilt[index].category) < 0) {
          labels.push(rebuilt[index].category);
        }
      }
      expect(joined(labels, '')).assertEqual('ABCDEF');
      expect(labels.length).assertEqual(6);
      expect(rebuilt[0].category).assertEqual('A');
      expect(rebuilt[14].category).assertEqual('F');
      expect(ContactMetrics.from(rebuilt).total).assertEqual(15);
      expect(ContactMetrics.from(rebuilt).categories).assertEqual(6);
    });

    /**
     * @tc.name   mapperRoundTripCountsFifteenMatches
     * @tc.desc   All fifteen rows survive a full map-rebuild cycle with sameContact true.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mapperRoundTripCountsFifteenMatches', 0, () => {
      const rows = createSeedContacts();
      const buckets = ContactMapper.toBuckets(rows);
      let equal = 0;
      for (let index = 0; index < rows.length; index++) {
        if (sameContact(ContactMapper.fromBucket(buckets[index]), rows[index])) {
          equal = equal + 1;
        }
      }
      expect(equal).assertEqual(15);
      expect(buckets.length).assertEqual(15);
      expect(buckets[0].get(FIELD_NAME)).assertEqual('艾德里安');
      expect(buckets[7].get(FIELD_PHONE)).assertEqual('11111111111');
      expect(buckets[7].get(FIELD_CATEGORY)).assertEqual('C');
      expect(buckets[13].get(FIELD_EMAIL)).assertEqual('connor@example.com');
    });

    /**
     * @tc.name   describeOfFullRowHasSixEqualsSigns
     * @tc.desc   A fully populated descriptor exposes six key/value separators and no empty segment.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('describeOfFullRowHasSixEqualsSigns', 0, () => {
      const bucket = ContactMapper.toBucket(contactOf('林岸', '13800138007', 'lin@example.com',
        '上海市徐汇区', 'app.media.avatar_lin', 'C'));
      const described = bucket.describe();
      expect(described.split('=').length).assertEqual(7);
      expect(described.split(';').length).assertEqual(6);
      expect(described.indexOf('==')).assertEqual(-1);
      expect(described.startsWith('name=林岸;')).assertTrue();
      expect(described.endsWith('category=C')).assertTrue();
      expect(described.indexOf('avatar=app.media.avatar_lin') > 0).assertTrue();
    });
    /**
     * @tc.name   allSixFieldsAreAlwaysStrings
     * @tc.desc   No field is ever undefined, even after a bucket round-trip of a default contact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldSemantics scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('allSixFieldsAreAlwaysStrings', 0, () => {
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(new Contact()));
      const values = [restored.name, restored.phone, restored.email, restored.address,
        restored.avatar, restored.category];
      let defined = 0;
      for (let index = 0; index < values.length; index++) {
        if (values[index] !== undefined) {
          defined = defined + 1;
        }
      }
      expect(defined).assertEqual(6);
      expect(values.length).assertEqual(6);
      expect(restored.name === undefined).assertFalse();
      expect(restored.category === undefined).assertFalse();
      expect(joined(values, '|')).assertEqual('|||||');
      expect(BUCKET_KEYS.length).assertEqual(values.length);
    });
  });
}
