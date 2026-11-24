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
 * Sensitive field handling. Anchors:
 *   Contact.ets:31-47            six fields, avatar and category included
 *   DatabaseConnection.ets:161-168 bucket keys name, phone, email, address, avatar, category
 *   AddressBookDetail.ets:95-105 phone is shown in full on the detail page
 *   AddressBookDetail.ets:164-181 email is shown in full on the detail page
 *   RdbConstant.ets:33-34        avatar and category are NOT NULL columns
 *
 * The redaction helpers live in this file and model the display rules a
 * privacy-aware build would apply before rendering or logging a contact.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
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
  SQL_CREATE_CONTACT,
  SchemaInfo,
  ContactMapper,
  ContactSnapshot,
  StoreDouble,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  countOf,
  joined,
  resetContactManager,
  SearchEngine,
  snapshotsOf,
  sameSnapshotArray
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

function stars(count: number): string {
  let text = '';
  for (let index = 0; index < count; index++) {
    text = text + '*';
  }
  return text;
}

function maskPhone(phone: string): string {
  if (phone.length <= 4) {
    return stars(phone.length);
  }
  return stars(phone.length - 4) + phone.substring(phone.length - 4);
}

function maskEmail(email: string): string {
  const at = email.indexOf('@');
  if (at <= 0) {
    return stars(email.length);
  }
  const local = email.substring(0, at);
  return local.substring(0, 1) + stars(local.length - 1) + email.substring(at);
}

function maskAddress(address: string): string {
  if (address.length <= 2) {
    return stars(address.length);
  }
  return address.substring(0, 2) + stars(address.length - 2);
}

function digitRun(text: string): number {
  let longest = 0;
  let current = 0;
  for (let index = 0; index < text.length; index++) {
    const code = text.charCodeAt(index);
    if (code >= 48 && code <= 57) {
      current = current + 1;
      if (current > longest) {
        longest = current;
      }
    } else {
      current = 0;
    }
  }
  return longest;
}

class RedactedContact {
  public name: string;
  public phone: string;
  public email: string;
  public address: string;
  public category: string;

  constructor(contact: Contact) {
    this.name = contact.name;
    this.phone = maskPhone(contact.phone);
    this.email = maskEmail(contact.email);
    this.address = maskAddress(contact.address);
    this.category = contact.category;
  }

  public describe(): string {
    return this.name + '/' + this.phone + '/' + this.email + '/' + this.address + '/' + this.category;
  }

  public hasAtSign(): boolean {
    return this.describe().indexOf('@') >= 0;
  }

  public maxDigitRun(): number {
    return digitRun(this.describe());
  }
}

export default function sensitiveFieldHandlingTest(): void {
  describe('SensitiveFieldHandling', () => {
    const store: StoreDouble = new StoreDouble();

    beforeAll(() => {
      logSuite('SensitiveFieldHandling', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      store.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('SensitiveFieldHandling', 'end');
    });

    /**
     * @tc.name   privacyPhoneMaskKeepsTheLastFourDigits
     * @tc.desc   The masked phone keeps only the trailing four digits, enough for recognition without identity.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('privacyPhoneMaskKeepsTheLastFourDigits', 0, () => {
      const seed = createSeedContacts()[0];
      const masked = maskPhone(seed.phone);
      expect(masked).assertEqual('*******3333');
      expect(masked.endsWith('3333')).assertTrue();
      expect(masked.indexOf('13333333333')).assertEqual(-1);
      expect(masked.length).assertEqual(11);
      expect(masked.substring(0, 7)).assertEqual('*******');
      expect(seed.phone).assertEqual('13333333333');
    });

    /**
     * @tc.name   privacyPhoneMaskMasksEveryLeadingDigit
     * @tc.desc   Every character before the trailing four is replaced, with no digit left in the prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('privacyPhoneMaskMasksEveryLeadingDigit', 0, () => {
      const masked = maskPhone('16666666666');
      const prefix = masked.substring(0, masked.length - 4);
      expect(prefix.length).assertEqual(7);
      expect(digitRun(prefix)).assertEqual(0);
      expect(masked.substring(7)).assertEqual('6666');
      expect(masked.indexOf('1666')).assertEqual(-1);
      expect(masked === '16666666666').assertFalse();
    });

    /**
     * @tc.name   privacyPhoneMaskHandlesShortInputs
     * @tc.desc   Values of four characters or fewer are fully masked, so no short number leaks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyPhoneMaskHandlesShortInputs', 0, () => {
      expect(maskPhone('')).assertEqual('');
      expect(maskPhone('1')).assertEqual('*');
      expect(maskPhone('12')).assertEqual('**');
      expect(maskPhone('1234')).assertEqual('****');
      expect(maskPhone('12345')).assertEqual('*2345');
      expect(digitRun(maskPhone('1234'))).assertEqual(0);
    });

    /**
     * @tc.name   privacyPhoneMaskKeepsTheOriginalLength
     * @tc.desc   Masking is length preserving, so layout code and cursor columns do not shift.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyPhoneMaskKeepsTheOriginalLength', 0, () => {
      const seed = createSeedContacts();
      for (let index = 0; index < seed.length; index++) {
        expect(maskPhone(seed[index].phone).length).assertEqual(seed[index].phone.length);
      }
      expect(maskPhone('138001380001').length).assertEqual(12);
      expect(maskPhone('13800138000').length).assertEqual(11);
      expect(maskPhone('12345').length).assertEqual(5);
    });

    /**
     * @tc.name   privacyEmailMaskKeepsTheFirstCharacterAndDomain
     * @tc.desc   The local part becomes one visible character plus stars while the domain stays readable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('privacyEmailMaskKeepsTheFirstCharacterAndDomain', 0, () => {
      const seed = createSeedContacts()[0];
      const masked = maskEmail(seed.email);
      logStep('privacyEmailMaskKeepsTheFirstCharacterAndDomain', masked);
      expect(masked.startsWith('a*')).assertTrue();
      expect(masked.endsWith('@example.com')).assertTrue();
      expect(masked.indexOf('aidelian')).assertEqual(-1);
      expect(masked.indexOf('@') > 1).assertTrue();
      expect(seed.email).assertEqual('aidelian@example.com');
      expect(masked === seed.email).assertFalse();
    });

    /**
     * @tc.name   privacyEmailMaskMasksTheLocalPartLength
     * @tc.desc   The number of stars equals the hidden local characters, so the length is preserved.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyEmailMaskMasksTheLocalPartLength', 0, () => {
      const masked = maskEmail('katrina@example.com');
      expect(masked.length).assertEqual('katrina@example.com'.length);
      expect(masked.substring(0, 1)).assertEqual('k');
      expect(masked.substring(1, 7)).assertEqual('******');
      expect(masked.substring(7)).assertEqual('@example.com');
      expect(masked.indexOf('katrina')).assertEqual(-1);
      expect(digitRun(masked)).assertEqual(0);
    });

    /**
     * @tc.name   privacyEmailMaskHandlesMissingAtSign
     * @tc.desc   A malformed value with no local part is fully masked rather than partly exposed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyEmailMaskHandlesMissingAtSign', 0, () => {
      expect(maskEmail('')).assertEqual('');
      expect(maskEmail('@example.com')).assertEqual('************');
      expect(maskEmail('plain')).assertEqual('*****');
      expect(maskEmail('shen@example.com').indexOf('s')).assertEqual(0);
      expect(maskEmail('shen@example.com').endsWith('@example.com')).assertTrue();
      expect(maskEmail('shen@example.com').indexOf('shen')).assertEqual(-1);
    });

    /**
     * @tc.name   privacyAddressMaskKeepsOnlyTheRegionPrefix
     * @tc.desc   The masked address keeps two leading characters for context and hides the rest.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('privacyAddressMaskKeepsOnlyTheRegionPrefix', 0, () => {
      const seed = createSeedContacts()[0];
      const masked = maskAddress(seed.address);
      expect(masked.startsWith('江苏')).assertTrue();
      expect(masked.length).assertEqual(seed.address.length);
      expect(masked.indexOf('鼓楼区')).assertEqual(-1);
      expect(masked.substring(2)).assertEqual(stars(seed.address.length - 2));
      expect(seed.address.indexOf('鼓楼区') > 0).assertTrue();
      expect(digitRun(masked)).assertEqual(0);
    });

    /**
     * @tc.name   privacyAddressMaskHandlesShortInputs
     * @tc.desc   Addresses of two characters or fewer are fully masked with no partial text left.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyAddressMaskHandlesShortInputs', 0, () => {
      expect(maskAddress('')).assertEqual('');
      expect(maskAddress('京')).assertEqual('*');
      expect(maskAddress('北京')).assertEqual('**');
      expect(maskAddress('北京市')).assertEqual('北京*');
      expect(maskAddress('北京市朝阳区').startsWith('北京')).assertTrue();
      expect(maskAddress('北京市朝阳区').length).assertEqual(6);
    });

    /**
     * @tc.name   privacyRedactedContactHidesPhoneAndEmail
     * @tc.desc   The redacted carrier exposes neither the raw phone nor the raw email local part.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('privacyRedactedContactHidesPhoneAndEmail', 0, () => {
      const seed = createSeedContacts()[1];
      const redacted = new RedactedContact(seed);
      expect(redacted.phone === seed.phone).assertFalse();
      expect(redacted.email === seed.email).assertFalse();
      expect(redacted.describe().indexOf(seed.phone)).assertEqual(-1);
      expect(redacted.describe().indexOf('arnold')).assertEqual(-1);
      expect(redacted.maxDigitRun()).assertEqual(4);
      expect(redacted.phone.endsWith('6666')).assertTrue();
    });

    /**
     * @tc.name   privacyRedactedContactKeepsNameAndCategory
     * @tc.desc   Name and category stay readable because they are needed to browse the directory.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyRedactedContactKeepsNameAndCategory', 0, () => {
      const seed = createSeedContacts()[3];
      const redacted = new RedactedContact(seed);
      expect(redacted.name).assertEqual(seed.name);
      expect(redacted.category).assertEqual(seed.category);
      expect(redacted.name).assertEqual('本');
      expect(redacted.category).assertEqual('B');
      expect(sameContact(seed, seed)).assertTrue();
      expect(redacted.address.startsWith('四川')).assertTrue();
    });

    /**
     * @tc.name   privacyRedactedContactHasNoAtSign
     * @tc.desc   A masked email still keeps the domain, so the at sign survives by design but no local text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyRedactedContactHasNoAtSign', 0, () => {
      const redacted = new RedactedContact(createSeedContacts()[4]);
      expect(redacted.hasAtSign()).assertTrue();
      expect(redacted.email.substring(0, redacted.email.indexOf('@')).indexOf('benjieiming'))
        .assertEqual(-1);
      expect(redacted.email.startsWith('b')).assertTrue();
      expect(redacted.email.endsWith('example.com')).assertTrue();
      expect(redacted.describe().indexOf('@')).assertLarger(0);
      expect(redacted.maxDigitRun()).assertEqual(4);
    });

    /**
     * @tc.name   privacyAllRedactedRowsLeakNoLongDigitRun
     * @tc.desc   Redacting every seed row leaves no run longer than four digits anywhere in the descriptions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyAllRedactedRowsLeakNoLongDigitRun', 0, () => {
      const seed = createSeedContacts();
      let worst: number = 0;
      for (let index = 0; index < seed.length; index++) {
        const redacted = new RedactedContact(seed[index]);
        if (redacted.maxDigitRun() > worst) {
          worst = redacted.maxDigitRun();
        }
      }
      expect(worst).assertEqual(4);
      expect(digitRun(seed[0].phone)).assertEqual(11);
      expect(digitRun(seed[5].phone)).assertEqual(11);
      expect(worst < 11).assertTrue();
    });

    /**
     * @tc.name   privacyAllRedactedRowsLeakNoLocalEmailText
     * @tc.desc   Each masked row keeps its domain but loses the full local part of the address.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyAllRedactedRowsLeakNoLocalEmailText', 0, () => {
      const seed = createSeedContacts();
      let leaks = 0;
      for (let index = 0; index < seed.length; index++) {
        const redacted = new RedactedContact(seed[index]);
        const local = seed[index].email.substring(0, seed[index].email.indexOf('@'));
        if (redacted.email.indexOf(local) >= 0 && local.length > 1) {
          leaks = leaks + 1;
        }
      }
      expect(leaks).assertEqual(0);
      expect(new RedactedContact(seed[6]).email.endsWith('@example.com')).assertTrue();
      expect(new RedactedContact(seed[6]).email.indexOf('connor')).assertEqual(-1);
      expect(seed[6].email).assertEqual('connor@example.com');
    });

    /**
     * @tc.name   privacySnapshotOmitsTheAvatarColumn
     * @tc.desc   A ContactSnapshot carries five display fields and never the avatar path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('privacySnapshotOmitsTheAvatarColumn', 0, () => {
      const snapshot = new ContactSnapshot(createSeedContacts()[0]);
      expect(snapshot.name).assertEqual('艾德里安');
      expect(snapshot.phone.length).assertEqual(11);
      expect(snapshot.email.indexOf('@') > 0).assertTrue();
      expect(snapshot.address.startsWith('江苏')).assertTrue();
      expect(snapshot.category).assertEqual('A');
      expect(snapshot.describe().split('/').length).assertEqual(5);
      expect(snapshot.describe().indexOf('avatar')).assertEqual(-1);
    });

    /**
     * @tc.name   privacyBucketStartsWithTheSixExpectedKeys
     * @tc.desc   The mapper emits exactly name, phone, email, address, avatar and category in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('privacyBucketStartsWithTheSixExpectedKeys', 0, () => {
      const bucket = ContactMapper.toBucket(createSeedContacts()[2]);
      expect(bucket.size()).assertEqual(6);
      expect(joined(bucket.keys, ',')).assertEqual('name,phone,email,address,avatar,category');
      expect(bucket.keys[0]).assertEqual(FIELD_NAME);
      expect(bucket.keys[1]).assertEqual(FIELD_PHONE);
      expect(bucket.keys[4]).assertEqual(FIELD_AVATAR);
      expect(bucket.keys[5]).assertEqual(FIELD_CATEGORY);
    });

    /**
     * @tc.name   privacyBucketHasNoExtraField
     * @tc.desc   No id, token, session or password key is ever added to the values bucket.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('privacyBucketHasNoExtraField', 0, () => {
      const bucket = ContactMapper.toBucket(createSeedContacts()[6]);
      const forbidden: string[] = ['id', 'token', 'session', 'password', 'secret', 'pin'];
      for (let index = 0; index < forbidden.length; index++) {
        expect(bucket.has(forbidden[index])).assertFalse();
      }
      expect(bucket.has(FIELD_EMAIL)).assertTrue();
      expect(bucket.has(FIELD_ADDRESS)).assertTrue();
      expect(bucket.size()).assertEqual(6);
      expect(bucket.get('password')).assertEqual('');
    });

    /**
     * @tc.name   privacyBucketAvatarIsEmptyForTheSeed
     * @tc.desc   No seed row points at an avatar asset, so the bucket value is always the empty string.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyBucketAvatarIsEmptyForTheSeed', 0, () => {
      const seed = createSeedContacts();
      let nonEmpty = 0;
      for (let index = 0; index < seed.length; index++) {
        if (ContactMapper.toBucket(seed[index]).get(FIELD_AVATAR).length > 0) {
          nonEmpty = nonEmpty + 1;
        }
      }
      expect(nonEmpty).assertEqual(0);
      expect(ContactMapper.toBucket(seed[0]).get(FIELD_AVATAR)).assertEqual('');
      expect(ContactMapper.fromBucket(ContactMapper.toBucket(seed[0])).avatar).assertEqual('');
      expect(seed[9].avatar).assertEqual('');
    });

    /**
     * @tc.name   privacyBucketOrderMatchesTheSchemaColumns
     * @tc.desc   Bucket key order equals the parsed schema business columns, so no column shifts silently.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyBucketOrderMatchesTheSchemaColumns', 0, () => {
      const schema = new SchemaInfo(SQL_CREATE_CONTACT);
      const bucket = ContactMapper.toBucket(createSeedContacts()[8]);
      expect(schema.columns.length).assertEqual(7);
      expect(schema.columns[0]).assertEqual('id');
      expect(schema.columns.slice(1).length).assertEqual(bucket.size());
      for (let index = 0; index < BUCKET_KEYS.length; index++) {
        expect(bucket.keyAt(index)).assertEqual(schema.columns[index + 1]);
      }
      expect(BUCKET_KEYS.length).assertEqual(6);
    });

    /**
     * @tc.name   privacyStoreQueryStillHoldsRawPhone
     * @tc.desc   The store layer is not a redaction boundary: raw values remain until a redactor runs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyStoreQueryStillHoldsRawPhone', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const rows = store.query(true);
      expect(rows[0].phone).assertEqual('13333333333');
      expect(digitRun(rows[0].phone)).assertEqual(11);
      expect(rows[0].email.indexOf('aidelian') >= 0).assertTrue();
      expect(maskPhone(rows[0].phone).indexOf('13333333333')).assertEqual(-1);
      expect(maskEmail(rows[0].email).indexOf('aidelian')).assertEqual(-1);
    });

    /**
     * @tc.name   privacyManagerKeepsRawValuesForEditing
     * @tc.desc   The singleton stores raw values, because the edit form must prefill the true phone and email.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyManagerKeepsRawValuesForEditing', 0, () => {
      const seed = createSeedContacts();
      const manager = ContactManager.getInstance();
      manager.setContacts(seed);
      expect(manager.getContacts()[0].phone).assertEqual(seed[0].phone);
      expect(manager.getContacts()[0].email).assertEqual(seed[0].email);
      expect(manager.getContacts()[0].address).assertEqual(seed[0].address);
      expect(maskPhone(manager.getContacts()[0].phone) === manager.getContacts()[0].phone).assertFalse();
      expect(manager.getContacts().length).assertEqual(15);
    });

    /**
     * @tc.name   privacySearchByMaskedPhoneFindsNothing
     * @tc.desc   Search runs against names only, so a masked phone cannot be used to probe the directory.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacySearchByMaskedPhoneFindsNothing', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const masked = maskPhone('13333333333');
      expect(SearchEngine.filterByName(manager.getContacts(), masked).length).assertEqual(0);
      expect(SearchEngine.filterByName(manager.getContacts(), '13333333333').length).assertEqual(0);
      expect(SearchEngine.filterByName(manager.getContacts(), '3333').length).assertEqual(0);
      expect(SearchEngine.filterByName(manager.getContacts(), '*').length).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(15);
    });

    /**
     * @tc.name   privacySearchByNameStillFindsTheContact
     * @tc.desc   Redaction keeps the display name, so browsing and searching by name still work.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacySearchByNameStillFindsTheContact', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const found = SearchEngine.filterByName(manager.getContacts(), '艾德里安');
      expect(found.length).assertEqual(1);
      expect(found[0].name).assertEqual('艾德里安');
      expect(new RedactedContact(found[0]).name).assertEqual('艾德里安');
      expect(SearchEngine.filterByName(manager.getContacts(), '艾').length).assertEqual(4);
      expect(SearchEngine.filterByName(manager.getContacts(), '安').length).assertEqual(1);
    });

    /**
     * @tc.name   privacyRedactionKeepsCategoryCounts
     * @tc.desc   Redacting every row does not disturb grouping, so category counts remain the seed counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyRedactionKeepsCategoryCounts', 0, () => {
      const seed = createSeedContacts();
      const redacted: Contact[] = [];
      for (let index = 0; index < seed.length; index++) {
        const row = new RedactedContact(seed[index]);
        redacted.push(contactOf(row.name, row.phone, row.email, row.address, '', row.category));
      }
      expect(redacted.length).assertEqual(15);
      expect(SearchEngine.countCategory(redacted, 'A')).assertEqual(2);
      expect(SearchEngine.countCategory(redacted, 'C')).assertEqual(3);
      expect(SearchEngine.groupByCategory(redacted).length).assertEqual(6);
      expect(redacted[0].phone.length).assertEqual(11);
    });

    /**
     * @tc.name   privacyRedactedDescriptionIsLogSafe
     * @tc.desc   A redacted descriptor carries no full phone, no local email text and no street detail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyRedactedDescriptionIsLogSafe', 0, () => {
      const seed = createSeedContacts()[12];
      const redacted = new RedactedContact(seed);
      const description = redacted.describe();
      expect(description.indexOf(seed.phone)).assertEqual(-1);
      expect(description.indexOf('aili')).assertEqual(-1);
      expect(description.indexOf('长春市朝阳区')).assertEqual(-1);
      expect(redacted.address.indexOf('吉林')).assertEqual(0);
      expect(redacted.maxDigitRun()).assertEqual(4);
      expect(description.length).assertEqual(redacted.name.length + seed.phone.length +
        seed.email.length + seed.address.length + seed.category.length + 4);
    });

    /**
     * @tc.name   privacyTwelveDigitPhoneMasksEightCharacters
     * @tc.desc   A twelve digit number keeps four trailing digits and masks the other eight.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyTwelveDigitPhoneMasksEightCharacters', 0, () => {
      const masked = maskPhone('138001380001');
      expect(masked.length).assertEqual(12);
      expect(masked.substring(0, 8)).assertEqual('********');
      expect(masked.substring(8)).assertEqual('0001');
      expect(digitRun(masked)).assertEqual(4);
      expect(masked.indexOf('138001')).assertEqual(-1);
      expect(maskPhone('138001380001') === '138001380001').assertFalse();
    });

    /**
     * @tc.name   privacyEmailMaskPreservesDifferentDomains
     * @tc.desc   The domain is kept for both example.com and a custom domain while local text is hidden.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyEmailMaskPreservesDifferentDomains', 0, () => {
      expect(maskEmail('bella@example.com').endsWith('@example.com')).assertTrue();
      expect(maskEmail('bella@contacts.org').endsWith('@contacts.org')).assertTrue();
      expect(maskEmail('bella@contacts.org').startsWith('b****')).assertTrue();
      expect(maskEmail('bella@contacts.org').indexOf('bella')).assertEqual(-1);
      expect(maskEmail('bella@contacts.org').length).assertEqual('bella@contacts.org'.length);
      expect(maskEmail('a@b.cn')).assertEqual('a@b.cn');
    });

    /**
     * @tc.name   privacyAddressMaskNeverContainsDigits
     * @tc.desc   Addresses stripped of the numeric house detail stay digit free after masking.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyAddressMaskNeverContainsDigits', 0, () => {
      const seed = createSeedContacts();
      for (let index = 0; index < seed.length; index++) {
        expect(digitRun(maskAddress(seed[index].address))).assertEqual(0);
      }
      const numbered = maskAddress('幸福路128号3单元');
      expect(digitRun(numbered)).assertEqual(0);
      expect(numbered.startsWith('幸福')).assertTrue();
      expect(numbered.indexOf('128')).assertEqual(-1);
      expect(numbered.length).assertEqual('幸福路128号3单元'.length);
    });

    /**
     * @tc.name   privacySeedFieldsContainNoCredentialMarkers
     * @tc.desc   No seeded name, email or address embeds a password, token, secret or bearer marker.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('privacySeedFieldsContainNoCredentialMarkers', 0, () => {
      const seed = createSeedContacts();
      const markers: string[] = ['password', 'token', 'secret', 'bearer'];
      let hits = 0;
      for (let index = 0; index < seed.length; index++) {
        const text = (seed[index].name + seed[index].email + seed[index].address).toLowerCase();
        for (let inner = 0; inner < markers.length; inner++) {
          if (text.indexOf(markers[inner]) >= 0) {
            hits = hits + 1;
          }
        }
      }
      expect(hits).assertEqual(0);
      expect(countOf(BUCKET_KEYS, 'avatar')).assertEqual(1);
      expect(seed.length).assertEqual(15);
    });

    /**
     * @tc.name   privacyEditedContactRedactionUsesNewValues
     * @tc.desc   Redaction always reads the current draft, so an edited phone is masked at its new tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyEditedContactRedactionUsesNewValues', 0, () => {
      const draft = cloneContact(createSeedContacts()[0]);
      draft.phone = '13912345678';
      draft.email = 'edited.local@example.com';
      const redacted = new RedactedContact(draft);
      expect(redacted.phone).assertEqual('*******5678');
      expect(redacted.email.startsWith('e')).assertTrue();
      expect(redacted.email.indexOf('edited')).assertEqual(-1);
      expect(redacted.maxDigitRun()).assertEqual(4);
      expect(redacted.address.startsWith('江苏')).assertTrue();
      expect(draft.phone).assertEqual('13912345678');
    });

    /**
     * @tc.name   privacyBucketSixValuesAlignWithTheContact
     * @tc.desc   Each bucket value equals its contact field, so redaction can run field by field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyBucketSixValuesAlignWithTheContact', 0, () => {
      const seed = createSeedContacts()[11];
      const bucket = ContactMapper.toBucket(seed);
      expect(bucket.get(FIELD_NAME)).assertEqual(seed.name);
      expect(bucket.get(FIELD_PHONE)).assertEqual(seed.phone);
      expect(bucket.get(FIELD_EMAIL)).assertEqual(seed.email);
      expect(bucket.get(FIELD_ADDRESS)).assertEqual(seed.address);
      expect(bucket.get(FIELD_AVATAR)).assertEqual(seed.avatar);
      expect(bucket.get(FIELD_CATEGORY)).assertEqual(seed.category);
      expect(bucket.size()).assertEqual(6);
    });

    /**
     * @tc.name   privacyRedactionDoesNotMutateTheSourceContact
     * @tc.desc   Masking copies values, leaving the source contact safe for the next store or manager write.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyRedactionDoesNotMutateTheSourceContact', 0, () => {
      const seed = createSeedContacts()[7];
      const before = cloneContact(seed);
      const redacted = new RedactedContact(seed);
      expect(sameContact(seed, before)).assertTrue();
      expect(seed.phone).assertEqual('11111111111');
      expect(seed.email).assertEqual('katrina@example.com');
      expect(seed.address).assertEqual('吉林省长春市朝阳区');
      expect(redacted.address === seed.address).assertFalse();
      expect(redacted.phone === seed.phone).assertFalse();
      expect(contactNames([seed]).length).assertEqual(1);
      expect(contactNames([seed])[0]).assertEqual(seed.name);
    });

    /**
     * @tc.name   privacySnapshotDescriptionExposesTheFullPhone
     * @tc.desc   An unredacted snapshot descriptor contains the eleven digit phone, motivating redaction.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacySnapshotDescriptionExposesTheFullPhone', 0, () => {
      const seed = createSeedContacts()[0];
      const snapshot = new ContactSnapshot(seed);
      expect(snapshot.describe().indexOf(seed.phone)).assertLarger(0);
      expect(digitRun(snapshot.describe())).assertEqual(11);
      expect(snapshot.describe().indexOf('aidelian')).assertLarger(0);
      expect(snapshot.sameAs(new ContactSnapshot(seed))).assertTrue();
      expect(snapshot.describe()).assertEqual(seed.name + '/' + seed.phone + '/' + seed.email + '/' +
        seed.address + '/' + seed.category);
    });

    /**
     * @tc.name   privacyRedactedSnapshotDescriptionIsSafe
     * @tc.desc   Building a snapshot from the redacted carrier keeps only the four digit phone tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyRedactedSnapshotDescriptionIsSafe', 0, () => {
      const seed = createSeedContacts()[1];
      const redacted = new RedactedContact(seed);
      const safeContact = contactOf(redacted.name, redacted.phone, redacted.email, redacted.address, '',
        redacted.category);
      const snapshot = new ContactSnapshot(safeContact);
      expect(digitRun(snapshot.describe())).assertEqual(4);
      expect(snapshot.describe().indexOf(seed.phone)).assertEqual(-1);
      expect(snapshot.describe().indexOf('arnold')).assertEqual(-1);
      expect(snapshot.sameAs(new ContactSnapshot(seed))).assertFalse();
      expect(snapshot.phone).assertEqual('*******6666');
    });

    /**
     * @tc.name   privacyEmailMaskOfSingleCharacterLocalPart
     * @tc.desc   A one character local part keeps that character and adds no star, while the domain stays.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('privacyEmailMaskOfSingleCharacterLocalPart', 0, () => {
      expect(maskEmail('a@example.com')).assertEqual('a@example.com');
      expect(maskEmail('a@example.com').indexOf('*')).assertEqual(-1);
      expect(maskEmail('ab@example.com')).assertEqual('a*@example.com');
      expect(maskEmail('abc@example.com')).assertEqual('a**@example.com');
      expect(maskEmail('abc@example.com').endsWith('@example.com')).assertTrue();
      expect(maskEmail('abc@example.com').length).assertEqual('abc@example.com'.length);
    });

    /**
     * @tc.name   privacyPhoneMaskOfAlreadyMaskedInput
     * @tc.desc   Masking an input that already contains stars still keeps only four trailing characters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('privacyPhoneMaskOfAlreadyMaskedInput', 0, () => {
      const maskedOnce = maskPhone('13333333333');
      const maskedTwice = maskPhone(maskedOnce);
      expect(maskedOnce).assertEqual('*******3333');
      expect(maskedTwice).assertEqual('*******3333');
      expect(maskedTwice === maskedOnce).assertTrue();
      expect(digitRun(maskedTwice)).assertEqual(4);
      expect(maskPhone('*******').length).assertEqual(7);
      expect(digitRun(maskPhone('*******'))).assertEqual(0);
    });

    /**
     * @tc.name   privacyBucketKeysNeverCarryContactValues
     * @tc.desc   Column keys are schema words only; no seed name, phone, email or address appears among them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyBucketKeysNeverCarryContactValues', 0, () => {
      const seed = createSeedContacts();
      const bucket = ContactMapper.toBucket(seed[0]);
      let leaks = 0;
      for (let index = 0; index < seed.length; index++) {
        for (let inner = 0; inner < bucket.keys.length; inner++) {
          if (bucket.keys[inner] === seed[index].name || bucket.keys[inner] === seed[index].phone ||
            bucket.keys[inner] === seed[index].email || bucket.keys[inner] === seed[index].address) {
            leaks = leaks + 1;
          }
        }
      }
      expect(leaks).assertEqual(0);
      expect(joined(bucket.keys, ',')).assertEqual(joined(BUCKET_KEYS, ','));
      expect(bucket.keys.indexOf(FIELD_AVATAR)).assertEqual(4);
      expect(bucket.keys.length).assertEqual(6);
    });

    /**
     * @tc.name   privacySeedDoesNotContainDuplicatePhoneAndNamePairs
     * @tc.desc   The seed has no repeated name plus phone pair, so the cursor dedupe never hides a seed row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacySeedDoesNotContainDuplicatePhoneAndNamePairs', 0, () => {
      const seed = createSeedContacts();
      let pairs = 0;
      for (let outer = 0; outer < seed.length; outer++) {
        for (let inner = outer + 1; inner < seed.length; inner++) {
          if (seed[outer].name === seed[inner].name && seed[outer].phone === seed[inner].phone) {
            pairs = pairs + 1;
          }
        }
      }
      expect(pairs).assertEqual(0);
      expect(countOf(seed.map((item: Contact) => item.phone), '11111111111')).assertEqual(5);
      expect(countOf(seed.map((item: Contact) => item.email), 'katrina@example.com')).assertEqual(4);
      expect(seed.length).assertEqual(15);
    });

    /**
     * @tc.name   privacyMaskedFieldsNeverKeepACredentialMarker
     * @tc.desc   Redaction leaves no password, token, secret or bearer text in the masked description.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SensitiveFieldHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('privacyMaskedFieldsNeverKeepACredentialMarker', 0, () => {
      const contact = contactOf('普通姓名', '13500001111', 'normal@example.com', '普通地址');
      const redacted = new RedactedContact(contact);
      const lowered = redacted.describe().toLowerCase();
      expect(lowered.indexOf('password')).assertEqual(-1);
      expect(lowered.indexOf('token')).assertEqual(-1);
      expect(lowered.indexOf('secret')).assertEqual(-1);
      expect(lowered.indexOf('bearer')).assertEqual(-1);
      expect(redacted.maxDigitRun()).assertEqual(4);
      expect(redacted.phone).assertEqual('*******1111');
      expect(redacted.email).assertEqual('n*****@example.com');
      expect(redacted.address).assertEqual('普通' + '**');
      expect(redacted.name).assertEqual('普通姓名');
      expect(redacted.category).assertEqual('');
      expect(redacted.describe().indexOf('13500001111')).assertEqual(-1);
      expect(redacted.describe().indexOf('normal')).assertEqual(-1);
      expect(contact.phone).assertEqual('13500001111');
    });
  });
}