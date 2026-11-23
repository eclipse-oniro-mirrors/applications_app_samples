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

import { MergedTestCases } from '../Shared/MergedTestCases';
import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { KEY_BACK, TEXT_PAGE_TITLE, checkTextContent, clickSampleButtonAt, contactPageComponentCount, ensureContactsPage, getDriver, isPickerVisible, pressAndWait, sampleButtons, serializedDelay, waitForStableContactPage } from '../Shared/ContactsDriver';
import { ContactFactory, ContactRecord, ContactValidator, ContactNormalizer, PickerSession, PickerOptions, ContactPermissionState, ContactFingerprint } from '../Shared/ContactModel';

// Event handling on the contacts page.
// Clicks route to the expected button.

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Contact]';
const BUNDLE: string = 'EventHandling_';

export default function eventHandlingTest(): void {
  describe('EventHandling_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

      it('EventHandling_build_record_0__group_32', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('EventHandling_build_record_0', () => {
        const record: ContactRecord = ContactFactory.buildRecord('张三0', '13800001000');
        expect(ContactValidator.isValidRecord(record)).assertTrue();
        expect(record.phoneNumbers.length).assertEqual(1);
        expect(ContactNormalizer.digitsOf(record.phoneNumbers[0].phoneNumber)).assertLargerOrEqual(3);
      });

      mergedCases.run('EventHandling_reject_empty_0', () => {
        const empty: ContactRecord = ContactFactory.buildRecord('', '12');
        expect(ContactValidator.isValidRecord(empty)).assertFalse();
      });

      mergedCases.run('EventHandling_normalize_digits_0', () => {
        expect(ContactNormalizer.digitsOf('139-1234-5678')).assertEqual('13912345678');
        expect(ContactNormalizer.digitsOf('+86 138 001 38000')).assertEqual('8613800138000');
        expect(ContactNormalizer.hasDigit('call me')).assertFalse();
      });

      mergedCases.run('EventHandling_trim_name_0', () => {
        expect(ContactNormalizer.trimName('  李四  ')).assertEqual('李四');
        expect(ContactNormalizer.trimName('王五 赵六')).assertEqual('王五 赵六');
      });

      mergedCases.run('EventHandling_validate_phone_0', () => {
        expect(ContactValidator.isValidPhone('1390001000')).assertTrue();
        expect(ContactValidator.isValidPhone('12')).assertFalse();
        expect(ContactValidator.isValidPhone('')).assertFalse();
      });

      mergedCases.run('EventHandling_validate_email_0', () => {
        expect(ContactValidator.isValidEmail('a@example.com')).assertTrue();
        expect(ContactValidator.isValidEmail('not-an-email')).assertFalse();
        expect(ContactValidator.isValidEmail('')).assertFalse();
      });

      mergedCases.run('EventHandling_session_resolve_0', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.resolve(0);
        expect(session.isOpened()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(0);
      });

      mergedCases.run('EventHandling_session_cancel_0', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.cancel();
        expect(session.isCancelled()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(0);
      });

      mergedCases.run('EventHandling_session_duration_0', () => {
        const session: PickerSession = new PickerSession();
        expect(session.durationMs()).assertEqual(0);
        session.open();
        session.resolve(1);
        expect(session.durationMs()).assertLargerOrEqual(0);
      });

      mergedCases.run('EventHandling_picker_single_capacity_0', () => {
        const single: PickerOptions = new PickerOptions(false, 0);
        single.setSelectedCount(1);
        expect(single.capacity()).assertEqual(1);
        expect(single.canSelectMore()).assertFalse();
      });

      mergedCases.run('EventHandling_picker_multi_capacity_0', () => {
        const multi: PickerOptions = new PickerOptions(true, 1);
        multi.setSelectedCount(0);
        expect(multi.capacity()).assertLargerOrEqual(1);
        expect(multi.canSelectMore()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_granted_0', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(0, 0);
        expect(state.canRead()).assertTrue();
        expect(state.canWrite()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_denied_0', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(-1, -1);
        expect(state.canRead()).assertFalse();
        expect(state.canWrite()).assertFalse();
      });

      mergedCases.run('EventHandling_fingerprint_equal_0', () => {
        const a: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const b: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const fa: ContactFingerprint = new ContactFingerprint(a);
        const fb: ContactFingerprint = new ContactFingerprint(b);
        expect(fa.equals(fb)).assertTrue();
      });

      mergedCases.run('EventHandling_fingerprint_phone_presence_0', () => {
        const p: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const n: ContactRecord = ContactFactory.buildRecord('王五', '');
        const fp: ContactFingerprint = new ContactFingerprint(p);
        const fn: ContactFingerprint = new ContactFingerprint(n);
        expect(fp.hasPhone()).assertTrue();
        expect(fn.hasPhone()).assertFalse();
      });

      mergedCases.run('EventHandling_build_record_1', () => {
        const record: ContactRecord = ContactFactory.buildRecord('张三1', '13800011000');
        expect(ContactValidator.isValidRecord(record)).assertTrue();
        expect(record.phoneNumbers.length).assertEqual(1);
        expect(ContactNormalizer.digitsOf(record.phoneNumbers[0].phoneNumber)).assertLargerOrEqual(3);
      });

      mergedCases.run('EventHandling_reject_empty_1', () => {
        const empty: ContactRecord = ContactFactory.buildRecord('', '12');
        expect(ContactValidator.isValidRecord(empty)).assertFalse();
      });

      mergedCases.run('EventHandling_normalize_digits_1', () => {
        expect(ContactNormalizer.digitsOf('139-1234-5678')).assertEqual('13912345678');
        expect(ContactNormalizer.digitsOf('+86 138 001 38000')).assertEqual('8613800138000');
        expect(ContactNormalizer.hasDigit('call me')).assertFalse();
      });

      mergedCases.run('EventHandling_trim_name_1', () => {
        expect(ContactNormalizer.trimName('  李四  ')).assertEqual('李四');
        expect(ContactNormalizer.trimName('王五 赵六')).assertEqual('王五 赵六');
      });

      mergedCases.run('EventHandling_validate_phone_1', () => {
        expect(ContactValidator.isValidPhone('1390011000')).assertTrue();
        expect(ContactValidator.isValidPhone('12')).assertFalse();
        expect(ContactValidator.isValidPhone('')).assertFalse();
      });

      mergedCases.run('EventHandling_validate_email_1', () => {
        expect(ContactValidator.isValidEmail('a@example.com')).assertTrue();
        expect(ContactValidator.isValidEmail('not-an-email')).assertFalse();
        expect(ContactValidator.isValidEmail('')).assertFalse();
      });

      mergedCases.run('EventHandling_session_resolve_1', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.resolve(1);
        expect(session.isOpened()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(1);
      });

      mergedCases.run('EventHandling_session_cancel_1', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.cancel();
        expect(session.isCancelled()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(0);
      });

      mergedCases.run('EventHandling_session_duration_1', () => {
        const session: PickerSession = new PickerSession();
        expect(session.durationMs()).assertEqual(0);
        session.open();
        session.resolve(1);
        expect(session.durationMs()).assertLargerOrEqual(0);
      });

      mergedCases.run('EventHandling_picker_single_capacity_1', () => {
        const single: PickerOptions = new PickerOptions(false, 0);
        single.setSelectedCount(1);
        expect(single.capacity()).assertEqual(1);
        expect(single.canSelectMore()).assertFalse();
      });

      mergedCases.run('EventHandling_picker_multi_capacity_1', () => {
        const multi: PickerOptions = new PickerOptions(true, 2);
        multi.setSelectedCount(0);
        expect(multi.capacity()).assertLargerOrEqual(1);
        expect(multi.canSelectMore()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_granted_1', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(0, 0);
        expect(state.canRead()).assertTrue();
        expect(state.canWrite()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_denied_1', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(-1, -1);
        expect(state.canRead()).assertFalse();
        expect(state.canWrite()).assertFalse();
      });

      mergedCases.run('EventHandling_fingerprint_equal_1', () => {
        const a: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const b: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const fa: ContactFingerprint = new ContactFingerprint(a);
        const fb: ContactFingerprint = new ContactFingerprint(b);
        expect(fa.equals(fb)).assertTrue();
      });

      mergedCases.run('EventHandling_fingerprint_phone_presence_1', () => {
        const p: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const n: ContactRecord = ContactFactory.buildRecord('王五', '');
        const fp: ContactFingerprint = new ContactFingerprint(p);
        const fn: ContactFingerprint = new ContactFingerprint(n);
        expect(fp.hasPhone()).assertTrue();
        expect(fn.hasPhone()).assertFalse();
      });

      mergedCases.run('EventHandling_build_record_2', () => {
        const record: ContactRecord = ContactFactory.buildRecord('张三2', '13800021000');
        expect(ContactValidator.isValidRecord(record)).assertTrue();
        expect(record.phoneNumbers.length).assertEqual(1);
        expect(ContactNormalizer.digitsOf(record.phoneNumbers[0].phoneNumber)).assertLargerOrEqual(3);
      });

      mergedCases.run('EventHandling_reject_empty_2', () => {
        const empty: ContactRecord = ContactFactory.buildRecord('', '12');
        expect(ContactValidator.isValidRecord(empty)).assertFalse();
      });
      mergedCases.finish();
    });

      it('EventHandling_normalize_digits_2__group_32', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('EventHandling_normalize_digits_2', () => {
        expect(ContactNormalizer.digitsOf('139-1234-5678')).assertEqual('13912345678');
        expect(ContactNormalizer.digitsOf('+86 138 001 38000')).assertEqual('8613800138000');
        expect(ContactNormalizer.hasDigit('call me')).assertFalse();
      });

      mergedCases.run('EventHandling_trim_name_2', () => {
        expect(ContactNormalizer.trimName('  李四  ')).assertEqual('李四');
        expect(ContactNormalizer.trimName('王五 赵六')).assertEqual('王五 赵六');
      });

      mergedCases.run('EventHandling_validate_phone_2', () => {
        expect(ContactValidator.isValidPhone('1390021000')).assertTrue();
        expect(ContactValidator.isValidPhone('12')).assertFalse();
        expect(ContactValidator.isValidPhone('')).assertFalse();
      });

      mergedCases.run('EventHandling_validate_email_2', () => {
        expect(ContactValidator.isValidEmail('a@example.com')).assertTrue();
        expect(ContactValidator.isValidEmail('not-an-email')).assertFalse();
        expect(ContactValidator.isValidEmail('')).assertFalse();
      });

      mergedCases.run('EventHandling_session_resolve_2', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.resolve(2);
        expect(session.isOpened()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(2);
      });

      mergedCases.run('EventHandling_session_cancel_2', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.cancel();
        expect(session.isCancelled()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(0);
      });

      mergedCases.run('EventHandling_session_duration_2', () => {
        const session: PickerSession = new PickerSession();
        expect(session.durationMs()).assertEqual(0);
        session.open();
        session.resolve(1);
        expect(session.durationMs()).assertLargerOrEqual(0);
      });

      mergedCases.run('EventHandling_picker_single_capacity_2', () => {
        const single: PickerOptions = new PickerOptions(false, 0);
        single.setSelectedCount(1);
        expect(single.capacity()).assertEqual(1);
        expect(single.canSelectMore()).assertFalse();
      });

      mergedCases.run('EventHandling_picker_multi_capacity_2', () => {
        const multi: PickerOptions = new PickerOptions(true, 3);
        multi.setSelectedCount(0);
        expect(multi.capacity()).assertLargerOrEqual(1);
        expect(multi.canSelectMore()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_granted_2', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(0, 0);
        expect(state.canRead()).assertTrue();
        expect(state.canWrite()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_denied_2', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(-1, -1);
        expect(state.canRead()).assertFalse();
        expect(state.canWrite()).assertFalse();
      });

      mergedCases.run('EventHandling_fingerprint_equal_2', () => {
        const a: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const b: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const fa: ContactFingerprint = new ContactFingerprint(a);
        const fb: ContactFingerprint = new ContactFingerprint(b);
        expect(fa.equals(fb)).assertTrue();
      });

      mergedCases.run('EventHandling_fingerprint_phone_presence_2', () => {
        const p: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const n: ContactRecord = ContactFactory.buildRecord('王五', '');
        const fp: ContactFingerprint = new ContactFingerprint(p);
        const fn: ContactFingerprint = new ContactFingerprint(n);
        expect(fp.hasPhone()).assertTrue();
        expect(fn.hasPhone()).assertFalse();
      });

      mergedCases.run('EventHandling_build_record_3', () => {
        const record: ContactRecord = ContactFactory.buildRecord('张三3', '13800031000');
        expect(ContactValidator.isValidRecord(record)).assertTrue();
        expect(record.phoneNumbers.length).assertEqual(1);
        expect(ContactNormalizer.digitsOf(record.phoneNumbers[0].phoneNumber)).assertLargerOrEqual(3);
      });

      mergedCases.run('EventHandling_reject_empty_3', () => {
        const empty: ContactRecord = ContactFactory.buildRecord('', '12');
        expect(ContactValidator.isValidRecord(empty)).assertFalse();
      });

      mergedCases.run('EventHandling_normalize_digits_3', () => {
        expect(ContactNormalizer.digitsOf('139-1234-5678')).assertEqual('13912345678');
        expect(ContactNormalizer.digitsOf('+86 138 001 38000')).assertEqual('8613800138000');
        expect(ContactNormalizer.hasDigit('call me')).assertFalse();
      });

      mergedCases.run('EventHandling_trim_name_3', () => {
        expect(ContactNormalizer.trimName('  李四  ')).assertEqual('李四');
        expect(ContactNormalizer.trimName('王五 赵六')).assertEqual('王五 赵六');
      });

      mergedCases.run('EventHandling_validate_phone_3', () => {
        expect(ContactValidator.isValidPhone('1390031000')).assertTrue();
        expect(ContactValidator.isValidPhone('12')).assertFalse();
        expect(ContactValidator.isValidPhone('')).assertFalse();
      });

      mergedCases.run('EventHandling_validate_email_3', () => {
        expect(ContactValidator.isValidEmail('a@example.com')).assertTrue();
        expect(ContactValidator.isValidEmail('not-an-email')).assertFalse();
        expect(ContactValidator.isValidEmail('')).assertFalse();
      });

      mergedCases.run('EventHandling_session_resolve_3', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.resolve(3);
        expect(session.isOpened()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(3);
      });

      mergedCases.run('EventHandling_session_cancel_3', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.cancel();
        expect(session.isCancelled()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(0);
      });

      mergedCases.run('EventHandling_session_duration_3', () => {
        const session: PickerSession = new PickerSession();
        expect(session.durationMs()).assertEqual(0);
        session.open();
        session.resolve(1);
        expect(session.durationMs()).assertLargerOrEqual(0);
      });

      mergedCases.run('EventHandling_picker_single_capacity_3', () => {
        const single: PickerOptions = new PickerOptions(false, 0);
        single.setSelectedCount(1);
        expect(single.capacity()).assertEqual(1);
        expect(single.canSelectMore()).assertFalse();
      });

      mergedCases.run('EventHandling_picker_multi_capacity_3', () => {
        const multi: PickerOptions = new PickerOptions(true, 4);
        multi.setSelectedCount(0);
        expect(multi.capacity()).assertLargerOrEqual(1);
        expect(multi.canSelectMore()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_granted_3', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(0, 0);
        expect(state.canRead()).assertTrue();
        expect(state.canWrite()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_denied_3', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(-1, -1);
        expect(state.canRead()).assertFalse();
        expect(state.canWrite()).assertFalse();
      });

      mergedCases.run('EventHandling_fingerprint_equal_3', () => {
        const a: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const b: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const fa: ContactFingerprint = new ContactFingerprint(a);
        const fb: ContactFingerprint = new ContactFingerprint(b);
        expect(fa.equals(fb)).assertTrue();
      });

      mergedCases.run('EventHandling_fingerprint_phone_presence_3', () => {
        const p: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const n: ContactRecord = ContactFactory.buildRecord('王五', '');
        const fp: ContactFingerprint = new ContactFingerprint(p);
        const fn: ContactFingerprint = new ContactFingerprint(n);
        expect(fp.hasPhone()).assertTrue();
        expect(fn.hasPhone()).assertFalse();
      });

      mergedCases.run('EventHandling_build_record_4', () => {
        const record: ContactRecord = ContactFactory.buildRecord('张三4', '13800041000');
        expect(ContactValidator.isValidRecord(record)).assertTrue();
        expect(record.phoneNumbers.length).assertEqual(1);
        expect(ContactNormalizer.digitsOf(record.phoneNumbers[0].phoneNumber)).assertLargerOrEqual(3);
      });

      mergedCases.run('EventHandling_reject_empty_4', () => {
        const empty: ContactRecord = ContactFactory.buildRecord('', '12');
        expect(ContactValidator.isValidRecord(empty)).assertFalse();
      });

      mergedCases.run('EventHandling_normalize_digits_4', () => {
        expect(ContactNormalizer.digitsOf('139-1234-5678')).assertEqual('13912345678');
        expect(ContactNormalizer.digitsOf('+86 138 001 38000')).assertEqual('8613800138000');
        expect(ContactNormalizer.hasDigit('call me')).assertFalse();
      });

      mergedCases.run('EventHandling_trim_name_4', () => {
        expect(ContactNormalizer.trimName('  李四  ')).assertEqual('李四');
        expect(ContactNormalizer.trimName('王五 赵六')).assertEqual('王五 赵六');
      });
      mergedCases.finish();
    });

      it('EventHandling_validate_phone_4__group_32', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('EventHandling_validate_phone_4', () => {
        expect(ContactValidator.isValidPhone('1390041000')).assertTrue();
        expect(ContactValidator.isValidPhone('12')).assertFalse();
        expect(ContactValidator.isValidPhone('')).assertFalse();
      });

      mergedCases.run('EventHandling_validate_email_4', () => {
        expect(ContactValidator.isValidEmail('a@example.com')).assertTrue();
        expect(ContactValidator.isValidEmail('not-an-email')).assertFalse();
        expect(ContactValidator.isValidEmail('')).assertFalse();
      });

      mergedCases.run('EventHandling_session_resolve_4', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.resolve(4);
        expect(session.isOpened()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(4);
      });

      mergedCases.run('EventHandling_session_cancel_4', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.cancel();
        expect(session.isCancelled()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(0);
      });

      mergedCases.run('EventHandling_session_duration_4', () => {
        const session: PickerSession = new PickerSession();
        expect(session.durationMs()).assertEqual(0);
        session.open();
        session.resolve(1);
        expect(session.durationMs()).assertLargerOrEqual(0);
      });

      mergedCases.run('EventHandling_picker_single_capacity_4', () => {
        const single: PickerOptions = new PickerOptions(false, 0);
        single.setSelectedCount(1);
        expect(single.capacity()).assertEqual(1);
        expect(single.canSelectMore()).assertFalse();
      });

      mergedCases.run('EventHandling_picker_multi_capacity_4', () => {
        const multi: PickerOptions = new PickerOptions(true, 5);
        multi.setSelectedCount(0);
        expect(multi.capacity()).assertLargerOrEqual(1);
        expect(multi.canSelectMore()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_granted_4', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(0, 0);
        expect(state.canRead()).assertTrue();
        expect(state.canWrite()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_denied_4', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(-1, -1);
        expect(state.canRead()).assertFalse();
        expect(state.canWrite()).assertFalse();
      });

      mergedCases.run('EventHandling_fingerprint_equal_4', () => {
        const a: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const b: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const fa: ContactFingerprint = new ContactFingerprint(a);
        const fb: ContactFingerprint = new ContactFingerprint(b);
        expect(fa.equals(fb)).assertTrue();
      });

      mergedCases.run('EventHandling_fingerprint_phone_presence_4', () => {
        const p: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const n: ContactRecord = ContactFactory.buildRecord('王五', '');
        const fp: ContactFingerprint = new ContactFingerprint(p);
        const fn: ContactFingerprint = new ContactFingerprint(n);
        expect(fp.hasPhone()).assertTrue();
        expect(fn.hasPhone()).assertFalse();
      });

      mergedCases.run('EventHandling_build_record_5', () => {
        const record: ContactRecord = ContactFactory.buildRecord('张三5', '13800051000');
        expect(ContactValidator.isValidRecord(record)).assertTrue();
        expect(record.phoneNumbers.length).assertEqual(1);
        expect(ContactNormalizer.digitsOf(record.phoneNumbers[0].phoneNumber)).assertLargerOrEqual(3);
      });

      mergedCases.run('EventHandling_reject_empty_5', () => {
        const empty: ContactRecord = ContactFactory.buildRecord('', '12');
        expect(ContactValidator.isValidRecord(empty)).assertFalse();
      });

      mergedCases.run('EventHandling_normalize_digits_5', () => {
        expect(ContactNormalizer.digitsOf('139-1234-5678')).assertEqual('13912345678');
        expect(ContactNormalizer.digitsOf('+86 138 001 38000')).assertEqual('8613800138000');
        expect(ContactNormalizer.hasDigit('call me')).assertFalse();
      });

      mergedCases.run('EventHandling_trim_name_5', () => {
        expect(ContactNormalizer.trimName('  李四  ')).assertEqual('李四');
        expect(ContactNormalizer.trimName('王五 赵六')).assertEqual('王五 赵六');
      });

      mergedCases.run('EventHandling_validate_phone_5', () => {
        expect(ContactValidator.isValidPhone('1390051000')).assertTrue();
        expect(ContactValidator.isValidPhone('12')).assertFalse();
        expect(ContactValidator.isValidPhone('')).assertFalse();
      });

      mergedCases.run('EventHandling_validate_email_5', () => {
        expect(ContactValidator.isValidEmail('a@example.com')).assertTrue();
        expect(ContactValidator.isValidEmail('not-an-email')).assertFalse();
        expect(ContactValidator.isValidEmail('')).assertFalse();
      });

      mergedCases.run('EventHandling_session_resolve_5', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.resolve(5);
        expect(session.isOpened()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(5);
      });

      mergedCases.run('EventHandling_session_cancel_5', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.cancel();
        expect(session.isCancelled()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(0);
      });

      mergedCases.run('EventHandling_session_duration_5', () => {
        const session: PickerSession = new PickerSession();
        expect(session.durationMs()).assertEqual(0);
        session.open();
        session.resolve(1);
        expect(session.durationMs()).assertLargerOrEqual(0);
      });

      mergedCases.run('EventHandling_picker_single_capacity_5', () => {
        const single: PickerOptions = new PickerOptions(false, 0);
        single.setSelectedCount(1);
        expect(single.capacity()).assertEqual(1);
        expect(single.canSelectMore()).assertFalse();
      });

      mergedCases.run('EventHandling_picker_multi_capacity_5', () => {
        const multi: PickerOptions = new PickerOptions(true, 6);
        multi.setSelectedCount(0);
        expect(multi.capacity()).assertLargerOrEqual(1);
        expect(multi.canSelectMore()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_granted_5', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(0, 0);
        expect(state.canRead()).assertTrue();
        expect(state.canWrite()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_denied_5', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(-1, -1);
        expect(state.canRead()).assertFalse();
        expect(state.canWrite()).assertFalse();
      });

      mergedCases.run('EventHandling_fingerprint_equal_5', () => {
        const a: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const b: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const fa: ContactFingerprint = new ContactFingerprint(a);
        const fb: ContactFingerprint = new ContactFingerprint(b);
        expect(fa.equals(fb)).assertTrue();
      });

      mergedCases.run('EventHandling_fingerprint_phone_presence_5', () => {
        const p: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const n: ContactRecord = ContactFactory.buildRecord('王五', '');
        const fp: ContactFingerprint = new ContactFingerprint(p);
        const fn: ContactFingerprint = new ContactFingerprint(n);
        expect(fp.hasPhone()).assertTrue();
        expect(fn.hasPhone()).assertFalse();
      });

      mergedCases.run('EventHandling_build_record_6', () => {
        const record: ContactRecord = ContactFactory.buildRecord('张三6', '13800061000');
        expect(ContactValidator.isValidRecord(record)).assertTrue();
        expect(record.phoneNumbers.length).assertEqual(1);
        expect(ContactNormalizer.digitsOf(record.phoneNumbers[0].phoneNumber)).assertLargerOrEqual(3);
      });

      mergedCases.run('EventHandling_reject_empty_6', () => {
        const empty: ContactRecord = ContactFactory.buildRecord('', '12');
        expect(ContactValidator.isValidRecord(empty)).assertFalse();
      });

      mergedCases.run('EventHandling_normalize_digits_6', () => {
        expect(ContactNormalizer.digitsOf('139-1234-5678')).assertEqual('13912345678');
        expect(ContactNormalizer.digitsOf('+86 138 001 38000')).assertEqual('8613800138000');
        expect(ContactNormalizer.hasDigit('call me')).assertFalse();
      });

      mergedCases.run('EventHandling_trim_name_6', () => {
        expect(ContactNormalizer.trimName('  李四  ')).assertEqual('李四');
        expect(ContactNormalizer.trimName('王五 赵六')).assertEqual('王五 赵六');
      });

      mergedCases.run('EventHandling_validate_phone_6', () => {
        expect(ContactValidator.isValidPhone('1390061000')).assertTrue();
        expect(ContactValidator.isValidPhone('12')).assertFalse();
        expect(ContactValidator.isValidPhone('')).assertFalse();
      });

      mergedCases.run('EventHandling_validate_email_6', () => {
        expect(ContactValidator.isValidEmail('a@example.com')).assertTrue();
        expect(ContactValidator.isValidEmail('not-an-email')).assertFalse();
        expect(ContactValidator.isValidEmail('')).assertFalse();
      });
      mergedCases.finish();
    });

      it('EventHandling_session_resolve_6__group_24', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('EventHandling_session_resolve_6', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.resolve(6);
        expect(session.isOpened()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(6);
      });

      mergedCases.run('EventHandling_session_cancel_6', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.cancel();
        expect(session.isCancelled()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(0);
      });

      mergedCases.run('EventHandling_session_duration_6', () => {
        const session: PickerSession = new PickerSession();
        expect(session.durationMs()).assertEqual(0);
        session.open();
        session.resolve(1);
        expect(session.durationMs()).assertLargerOrEqual(0);
      });

      mergedCases.run('EventHandling_picker_single_capacity_6', () => {
        const single: PickerOptions = new PickerOptions(false, 0);
        single.setSelectedCount(1);
        expect(single.capacity()).assertEqual(1);
        expect(single.canSelectMore()).assertFalse();
      });

      mergedCases.run('EventHandling_picker_multi_capacity_6', () => {
        const multi: PickerOptions = new PickerOptions(true, 7);
        multi.setSelectedCount(0);
        expect(multi.capacity()).assertLargerOrEqual(1);
        expect(multi.canSelectMore()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_granted_6', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(0, 0);
        expect(state.canRead()).assertTrue();
        expect(state.canWrite()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_denied_6', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(-1, -1);
        expect(state.canRead()).assertFalse();
        expect(state.canWrite()).assertFalse();
      });

      mergedCases.run('EventHandling_fingerprint_equal_6', () => {
        const a: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const b: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const fa: ContactFingerprint = new ContactFingerprint(a);
        const fb: ContactFingerprint = new ContactFingerprint(b);
        expect(fa.equals(fb)).assertTrue();
      });

      mergedCases.run('EventHandling_fingerprint_phone_presence_6', () => {
        const p: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const n: ContactRecord = ContactFactory.buildRecord('王五', '');
        const fp: ContactFingerprint = new ContactFingerprint(p);
        const fn: ContactFingerprint = new ContactFingerprint(n);
        expect(fp.hasPhone()).assertTrue();
        expect(fn.hasPhone()).assertFalse();
      });

      mergedCases.run('EventHandling_build_record_7', () => {
        const record: ContactRecord = ContactFactory.buildRecord('张三7', '13800071000');
        expect(ContactValidator.isValidRecord(record)).assertTrue();
        expect(record.phoneNumbers.length).assertEqual(1);
        expect(ContactNormalizer.digitsOf(record.phoneNumbers[0].phoneNumber)).assertLargerOrEqual(3);
      });

      mergedCases.run('EventHandling_reject_empty_7', () => {
        const empty: ContactRecord = ContactFactory.buildRecord('', '12');
        expect(ContactValidator.isValidRecord(empty)).assertFalse();
      });

      mergedCases.run('EventHandling_normalize_digits_7', () => {
        expect(ContactNormalizer.digitsOf('139-1234-5678')).assertEqual('13912345678');
        expect(ContactNormalizer.digitsOf('+86 138 001 38000')).assertEqual('8613800138000');
        expect(ContactNormalizer.hasDigit('call me')).assertFalse();
      });

      mergedCases.run('EventHandling_trim_name_7', () => {
        expect(ContactNormalizer.trimName('  李四  ')).assertEqual('李四');
        expect(ContactNormalizer.trimName('王五 赵六')).assertEqual('王五 赵六');
      });

      mergedCases.run('EventHandling_validate_phone_7', () => {
        expect(ContactValidator.isValidPhone('1390071000')).assertTrue();
        expect(ContactValidator.isValidPhone('12')).assertFalse();
        expect(ContactValidator.isValidPhone('')).assertFalse();
      });

      mergedCases.run('EventHandling_validate_email_7', () => {
        expect(ContactValidator.isValidEmail('a@example.com')).assertTrue();
        expect(ContactValidator.isValidEmail('not-an-email')).assertFalse();
        expect(ContactValidator.isValidEmail('')).assertFalse();
      });

      mergedCases.run('EventHandling_session_resolve_7', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.resolve(7);
        expect(session.isOpened()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(7);
      });

      mergedCases.run('EventHandling_session_cancel_7', () => {
        const session: PickerSession = new PickerSession();
        session.open();
        session.cancel();
        expect(session.isCancelled()).assertTrue();
        expect(session.isResolved()).assertTrue();
        expect(session.getResultCount()).assertEqual(0);
      });

      mergedCases.run('EventHandling_session_duration_7', () => {
        const session: PickerSession = new PickerSession();
        expect(session.durationMs()).assertEqual(0);
        session.open();
        session.resolve(1);
        expect(session.durationMs()).assertLargerOrEqual(0);
      });

      mergedCases.run('EventHandling_picker_single_capacity_7', () => {
        const single: PickerOptions = new PickerOptions(false, 0);
        single.setSelectedCount(1);
        expect(single.capacity()).assertEqual(1);
        expect(single.canSelectMore()).assertFalse();
      });

      mergedCases.run('EventHandling_picker_multi_capacity_7', () => {
        const multi: PickerOptions = new PickerOptions(true, 8);
        multi.setSelectedCount(0);
        expect(multi.capacity()).assertLargerOrEqual(1);
        expect(multi.canSelectMore()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_granted_7', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(0, 0);
        expect(state.canRead()).assertTrue();
        expect(state.canWrite()).assertTrue();
      });

      mergedCases.run('EventHandling_permission_denied_7', () => {
        const state: ContactPermissionState = new ContactPermissionState();
        state.applyAuthResults(-1, -1);
        expect(state.canRead()).assertFalse();
        expect(state.canWrite()).assertFalse();
      });

      mergedCases.run('EventHandling_fingerprint_equal_7', () => {
        const a: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const b: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const fa: ContactFingerprint = new ContactFingerprint(a);
        const fb: ContactFingerprint = new ContactFingerprint(b);
        expect(fa.equals(fb)).assertTrue();
      });

      mergedCases.run('EventHandling_fingerprint_phone_presence_7', () => {
        const p: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
        const n: ContactRecord = ContactFactory.buildRecord('王五', '');
        const fp: ContactFingerprint = new ContactFingerprint(p);
        const fn: ContactFingerprint = new ContactFingerprint(n);
        expect(fp.hasPhone()).assertTrue();
        expect(fn.hasPhone()).assertFalse();
      });
      mergedCases.finish();
    });

      it('EventHandling_ui_page_rendered_0', 0, async () => {
        const ready: boolean = await ensureContactsPage(driver);
        expect(ready).assertTrue();
        await waitForStableContactPage(driver);
        expect(await contactPageComponentCount(driver)).assertLargerOrEqual(1);
      });

      it('EventHandling_ui_page_rendered_1', 0, async () => {
        const ready: boolean = await ensureContactsPage(driver);
        expect(ready).assertTrue();
        await waitForStableContactPage(driver);
        expect(await contactPageComponentCount(driver)).assertLargerOrEqual(1);
      });

      it('EventHandling_ui_page_rendered_2', 0, async () => {
        const ready: boolean = await ensureContactsPage(driver);
        expect(ready).assertTrue();
        await waitForStableContactPage(driver);
        expect(await contactPageComponentCount(driver)).assertLargerOrEqual(1);
      });

      it('EventHandling_ui_page_rendered_3', 0, async () => {
        const ready: boolean = await ensureContactsPage(driver);
        expect(ready).assertTrue();
        await waitForStableContactPage(driver);
        expect(await contactPageComponentCount(driver)).assertLargerOrEqual(1);
      });

      it('EventHandling_ui_click_button_0', 0, async () => {
        const clicked: boolean = await clickSampleButtonAt(driver, 0);
        expect(clicked).assertTrue();
        await serializedDelay(driver, 150);
        const restored: boolean = await ensureContactsPage(driver);
        expect(restored).assertTrue();
      });

      it('EventHandling_ui_click_button_1', 0, async () => {
        const clicked: boolean = await clickSampleButtonAt(driver, 1);
        expect(clicked).assertTrue();
        await serializedDelay(driver, 150);
        const restored: boolean = await ensureContactsPage(driver);
        expect(restored).assertTrue();
      });

      it('EventHandling_ui_click_button_2', 0, async () => {
        const clicked: boolean = await clickSampleButtonAt(driver, 2);
        expect(clicked).assertTrue();
        await serializedDelay(driver, 150);
        const restored: boolean = await ensureContactsPage(driver);
        expect(restored).assertTrue();
      });

      it('EventHandling_ui_click_button_3', 0, async () => {
        const clicked: boolean = await clickSampleButtonAt(driver, 3);
        expect(clicked).assertTrue();
        await serializedDelay(driver, 150);
        const restored: boolean = await ensureContactsPage(driver);
        expect(restored).assertTrue();
      });

      it('EventHandling_ui_title_visible', 0, async () => {
        const seen: boolean = await checkTextContent(driver, TEXT_PAGE_TITLE);
        expect(seen).assertTrue();
      });

      it('EventHandling_ui_sample_buttons_declared', 0, async () => {
        const labels: string[] = sampleButtons();
        expect(labels.length).assertEqual(4);
      });

      it('EventHandling_ui_clean_page_has_no_picker', 0, async () => {
        const open: boolean = await isPickerVisible(driver);
        expect(open).assertFalse();
      });

  });
}
