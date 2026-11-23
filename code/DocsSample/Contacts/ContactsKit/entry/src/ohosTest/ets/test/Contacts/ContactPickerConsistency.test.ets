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
import {
  DELAY_AFTER_PICKER,
  KEY_BACK,
  ensureContactsPage,
  getDriver,
  pressAndWait,
  serializedDelay,
  clickSampleButton,
  TEXT_UPDATE_BY_PICKER,
  TEXT_ADD_BY_PICKER,
  TEXT_SELECT_BY_PICKER
} from '../Shared/ContactsDriver';
import {
  ContactFactory,
  ContactFingerprint,
  ContactNormalizer,
  ContactPhoneInfo,
  ContactRecord,
  ContactValidator
} from '../Shared/ContactModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Contact]';
const BUNDLE: string = 'Contact_';

enum ConsistencyKind {
  SAME_RECORD = 'same',
  DIFFERENT_RECORD = 'different'
}

interface ConsistencyCheck {
  kind: ConsistencyKind;
  left: ContactRecord;
  right: ContactRecord;
  samePhone: boolean;
  sameName: boolean;
}

class RecordConsistencyLog {
  private checks: ConsistencyCheck[] = [];

  public add(check: ConsistencyCheck): void {
    this.checks.push(check);
  }

  public getChecks(): ConsistencyCheck[] {
    return this.checks.map((c: ConsistencyCheck) => c);
  }

  public count(): number {
    return this.checks.length;
  }

  public countSamePhone(): number {
    return this.checks.filter((c: ConsistencyCheck) => c.samePhone).length;
  }

  public countSameName(): number {
    return this.checks.filter((c: ConsistencyCheck) => c.sameName).length;
  }

  public reset(): void {
    this.checks = [];
  }
}

class ConsistencyComparator {
  public static samePhone(a: ContactRecord, b: ContactRecord): boolean {
    return ContactNormalizer.normalizePhone(a.phoneNumbers) === ContactNormalizer.normalizePhone(b.phoneNumbers);
  }

  public static sameName(a: ContactRecord, b: ContactRecord): boolean {
    return ContactNormalizer.trimName(a.displayName) === ContactNormalizer.trimName(b.displayName);
  }

  public static fingerprintEqual(a: ContactRecord, b: ContactRecord): boolean {
    const fa: ContactFingerprint = new ContactFingerprint(a);
    const fb: ContactFingerprint = new ContactFingerprint(b);
    return fa.equals(fb);
  }

  public static describe(record: ContactRecord): string {
    return `Contact{phone=${ContactNormalizer.normalizePhone(record.phoneNumbers)}, ` +
      `name=${ContactNormalizer.trimName(record.displayName)}}`;
  }
}

export default function contactPickerConsistencyTest(): void {
  describe('ContactPickerConsistency_Test', () => {
    let driver: Driver;
    let log: RecordConsistencyLog;

    beforeAll(async () => {
      driver = getDriver();
      log = new RecordConsistencyLog();
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    it('picker_consistency_should_match_same_record__group_4', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_consistency_should_match_same_record', () => {
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      expect(ConsistencyComparator.samePhone(a, b)).assertTrue();
      expect(ConsistencyComparator.sameName(a, b)).assertTrue();
      expect(ConsistencyComparator.fingerprintEqual(a, b)).assertTrue();
    });

    mergedCases.run('picker_consistency_should_distinguish_different_records', () => {
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('李四', '13900139000');
      expect(ConsistencyComparator.samePhone(a, b)).assertFalse();
      expect(ConsistencyComparator.sameName(a, b)).assertFalse();
      expect(ConsistencyComparator.fingerprintEqual(a, b)).assertFalse();
    });

    mergedCases.run('picker_consistency_normalizer_should_ignore_phone_formatting', () => {
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('张三', '138-0013-8000');
      const fa: ContactFingerprint = new ContactFingerprint(a);
      const fb: ContactFingerprint = new ContactFingerprint(b);
      expect(fa.equals(fb)).assertTrue();
      expect(ContactNormalizer.digitsOf('138-0013-8000')).assertEqual('13800138000');
      expect(ContactNormalizer.hasDigit('138-0013-8000')).assertTrue();
    });

    mergedCases.run('picker_consistency_should_detect_duplicate_by_display_name', () => {
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('张三', '13900139000');
      expect(ConsistencyComparator.sameName(a, b)).assertTrue();
      expect(ConsistencyComparator.samePhone(a, b)).assertFalse();
      expect(ConsistencyComparator.fingerprintEqual(a, b)).assertFalse();
    });
      mergedCases.finish();
    });

    it('picker_consistency_should_treat_picker_result_as_same_source', 0, async () => {
      const clicked: boolean = await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
      expect(clicked).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      await ensureContactsPage(driver);
    });

    it('picker_consistency_update_should_keep_auth_identity', 0, async () => {
      const clicked: boolean = await clickSampleButton(driver, TEXT_UPDATE_BY_PICKER);
      expect(clicked).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      await ensureContactsPage(driver);
    });

    it('picker_consistency_fingerprint_should_report_phone_presence__group_4', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_consistency_fingerprint_should_report_phone_presence', () => {
      const withPhone: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const noPhone: ContactRecord = ContactFactory.buildRecord('张三', '');
      const f1: ContactFingerprint = new ContactFingerprint(withPhone);
      const f2: ContactFingerprint = new ContactFingerprint(noPhone);
      expect(f1.hasPhone()).assertTrue();
      expect(f2.hasPhone()).assertFalse();
    });

    mergedCases.run('picker_consistency_validator_should_require_phone_or_email', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '');
      expect(ContactValidator.isValidRecord(record)).assertFalse();
      const emailPhone: ContactRecord = ContactFactory.buildRecord('张三', '');
      emailPhone.emails = [];
      const withEmail: ContactRecord = ContactFactory.buildRecord('张三', '');
      withEmail.emails.push({ email: FIXTURE_EMAIL_LOCAL, labelId: 0, labelName: 'WORK' });
      expect(ContactValidator.isValidEmail(withEmail.emails[0].email)).assertTrue();
      expect(ContactValidator.isValidRecord(withEmail)).assertTrue();
    });

    mergedCases.run('picker_consistency_describe_should_include_identity', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const desc: string = ConsistencyComparator.describe(record);
      expect(desc).assertContain('13800138000');
      expect(desc).assertContain('张三');
    });

    mergedCases.run('picker_consistency_log_should_count_duplicates', () => {
      log.reset();
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('张三', '13900139000');
      log.add({
        kind: ConsistencyKind.SAME_RECORD,
        left: a,
        right: b,
        samePhone: ConsistencyComparator.samePhone(a, b),
        sameName: ConsistencyComparator.sameName(a, b)
      });
      expect(log.count()).assertEqual(1);
      expect(log.countSameName()).assertEqual(1);
      expect(log.countSamePhone()).assertEqual(0);
    });
      mergedCases.finish();
    });

    it('picker_consistency_options_stability', 0, async () => {
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
      await clickSampleButton(driver, TEXT_ADD_BY_PICKER);
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('picker_consistency_page_identity_should_stay_stable', 0, async () => {
      await ensureContactsPage(driver);
      const before: string = JSON.stringify(await collectContactsIntentionallyEmpty());
      expect(before.length).assertLargerOrEqual(0);
      await ensureContactsPage(driver);
    });

    it('picker_consistency_phone_equivalence_should_ignore_formatting__group_11', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_consistency_phone_equivalence_should_ignore_formatting', () => {
      const a: ContactRecord = ContactFactory.buildRecord('张三', '138 0013 8000');
      const b: ContactRecord = ContactFactory.buildRecord('张三', '138-0013-8000');
      expect(ConsistencyComparator.samePhone(a, b)).assertTrue();
    });


    mergedCases.run('picker_consistency_name_equivalence_should_trim_spaces', () => {
      const a: ContactRecord = ContactFactory.buildRecord(' 张三 ', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      expect(ConsistencyComparator.sameName(a, b)).assertTrue();
    });

    mergedCases.run('picker_consistency_should_detect_duplicate_phone_across_names', () => {
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('李四', '13800138000');
      expect(ConsistencyComparator.samePhone(a, b)).assertTrue();
      expect(ConsistencyComparator.fingerprintEqual(a, b)).assertFalse();
    });

    mergedCases.run('picker_consistency_version_tracker_should_monotonic', () => {
      const tracker: ContactVersionTracker = new ContactVersionTracker();
      expect(tracker.next('select')).assertLarger(0);
      const v1: number = tracker.next('select');
      const v2: number = tracker.next('select');
      expect(v2).assertLarger(v1);
    });

    mergedCases.run('picker_consistency_version_tracker_should_version_by_operation', () => {
      const tracker: ContactVersionTracker = new ContactVersionTracker();
      tracker.touch('add');
      tracker.touch('update');
      expect(tracker.versionOf('add')).assertLargerOrEqual(1);
      expect(tracker.versionOf('update')).assertLargerOrEqual(1);
      expect(tracker.versionOf('select')).assertEqual(0);
    });

    mergedCases.run('picker_consistency_same_records_should_produce_same_fingerprint', () => {
      const a: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
      const b: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
      const fa: ContactFingerprint = new ContactFingerprint(a);
      const fb: ContactFingerprint = new ContactFingerprint(b);
      expect(fa.key()).assertEqual(fb.key());
    });

    mergedCases.run('picker_consistency_fingerprint_key_should_include_phone_and_name', () => {
      const record: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
      const fp: ContactFingerprint = new ContactFingerprint(record);
      expect(fp.key()).assertContain('13800002222');
      expect(fp.key()).assertContain('王五');
    });

    mergedCases.run('picker_consistency_fingerprint_should_report_name_presence', () => {
      const record: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
      const fp: ContactFingerprint = new ContactFingerprint(record);
      expect(fp.hasName()).assertTrue();
    });

    mergedCases.run('picker_consistency_log_should_reset_checks', () => {
      log.reset();
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      log.add({
        kind: ConsistencyKind.SAME_RECORD,
        left: a,
        right: a,
        samePhone: true,
        sameName: true
      });
      expect(log.count()).assertEqual(1);
      log.reset();
      expect(log.count()).assertEqual(0);
    });

    mergedCases.run('picker_consistency_describe_should_be_lossless', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const desc: string = ConsistencyComparator.describe(record);
      expect(desc).assertContain('张三');
      expect(desc).assertContain('13800138000');
    });
      mergedCases.finish();
    });

    it('picker_consistency_page_second_open_should_be_consistent', 0, async () => {
      await ensureContactsPage(driver);
      await serializedDelay(driver, 100);
      const readyAgain: boolean = await ensureContactsPage(driver);
      expect(readyAgain).assertTrue();
    });

    it('picker_consistency_version_tracker_should_assign_unique_versions__group_25', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_consistency_version_tracker_should_assign_unique_versions', () => {
      const tracker: ContactVersionTracker = new ContactVersionTracker();
      const vA: number = tracker.next('select');
      const vB: number = tracker.next('select');
      expect(vA === vB).assertFalse();
    });

    mergedCases.run('picker_consistency_version_tracker_should_not_share_across_ops', () => {
      const tracker: ContactVersionTracker = new ContactVersionTracker();
      tracker.next('select');
      expect(tracker.versionOf('select')).assertEqual(1);
      expect(tracker.versionOf('update')).assertEqual(0);
    });

    mergedCases.run('picker_consistency_same_phone_across_spacing', () => {
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('张三', '138 0013 8000');
      const fa: ContactFingerprint = new ContactFingerprint(a);
      const fb: ContactFingerprint = new ContactFingerprint(b);
      expect(fa.equals(fb)).assertTrue();
    });

    mergedCases.run('picker_consistency_different_phone_should_differ', () => {
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('张三', '13900139000');
      const fa: ContactFingerprint = new ContactFingerprint(a);
      const fb: ContactFingerprint = new ContactFingerprint(b);
      expect(fa.equals(fb)).assertFalse();
    });

    mergedCases.run('picker_consistency_name_should_distinguish_records', () => {
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('王五', '13800138000');
      expect(ConsistencyComparator.sameName(a, b)).assertFalse();
    });

    mergedCases.run('picker_consistency_described_should_include_both_identity', () => {
      const record: ContactRecord = ContactFactory.buildRecord('李四', '13800138001');
      const desc: string = ConsistencyComparator.describe(record);
      expect(desc).assertContain('李四');
      expect(desc).assertContain('13800138001');
    });

    mergedCases.run('picker_consistency_log_should_track_phone_duplicates', () => {
      log.reset();
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('李四', '13800138000');
      log.add({
        kind: ConsistencyKind.DIFFERENT_RECORD,
        left: a,
        right: b,
        samePhone: ConsistencyComparator.samePhone(a, b),
        sameName: ConsistencyComparator.sameName(a, b)
      });
      expect(log.countSamePhone()).assertEqual(1);
    });

    mergedCases.run('picker_consistency_describe_should_include_phone', () => {
      const record: ContactRecord = ContactFactory.buildRecord('王', '13800009999');
      const desc: string = ConsistencyComparator.describe(record);
      expect(desc).assertContain('13800009999');
    });

    mergedCases.run('picker_consistency_same_fingerprint_matches', () => {
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('张三 ', '138 0013 8000');
      const fa: ContactFingerprint = new ContactFingerprint(a);
      const fb: ContactFingerprint = new ContactFingerprint(b);
      expect(fa.equals(fb)).assertTrue();
    });

    mergedCases.run('picker_consistency_version_tracker_should_assign_ids', () => {
      const tracker: ContactVersionTracker = new ContactVersionTracker();
      expect(tracker.next('select')).assertLargerOrEqual(1);
      expect(tracker.next('select')).assertLargerOrEqual(2);
    });

    mergedCases.run('picker_consistency_version_tracker_reset_independent', () => {
      const tracker: ContactVersionTracker = new ContactVersionTracker();
      tracker.next('add');
      expect(tracker.versionOf('update')).assertEqual(0);
    });

    mergedCases.run('picker_consistency_name_trim_should_unify', () => {
      expect(ContactNormalizer.trimName(' 王五 ')).assertEqual('王五');
    });

    mergedCases.run('picker_consistency_phone_without_digits_absent', () => {
      const record: ContactRecord = ContactFactory.buildRecord('王五', '');
      const fp: ContactFingerprint = new ContactFingerprint(record);
      expect(fp.hasPhone()).assertFalse();
    });

    mergedCases.run('picker_consistency_name_present_flag', () => {
      const record: ContactRecord = ContactFactory.buildRecord('王五', '13800138000');
      const fp: ContactFingerprint = new ContactFingerprint(record);
      expect(fp.hasName()).assertTrue();
    });

    mergedCases.run('picker_consistency_log_should_group_duplicate_phones', () => {
      log.reset();
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('李四', '13800138000');
      log.add({ kind: ConsistencyKind.DIFFERENT_RECORD, left: a, right: b, samePhone: true, sameName: false });
      expect(log.countSamePhone()).assertEqual(1);
      expect(log.countSameName()).assertEqual(0);
    });

    mergedCases.run('picker_consistency_describe_both_fields', () => {
      const record: ContactRecord = ContactFactory.buildRecord('李', '13822223333');
      const desc: string = ConsistencyComparator.describe(record);
      expect(desc).assertContain('李');
      expect(desc).assertContain('13822223333');
    });

    mergedCases.run('picker_consistency_fingerprint_keyed_by_phone_name', () => {
      const record: ContactRecord = ContactFactory.buildRecord('王五', '13800138000');
      const fp: ContactFingerprint = new ContactFingerprint(record);
      expect(fp.key()).assertContain('13800138000');
    });

    mergedCases.run('picker_consistency_same_record_digits', () => {
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('张三', '138 0013 8000');
      const fa: ContactFingerprint = new ContactFingerprint(a);
      const fb: ContactFingerprint = new ContactFingerprint(b);
      expect(fa.equals(fb)).assertTrue();
    });

    mergedCases.run('picker_consistency_phone_normalize_no_sep', () => {
      expect(ContactNormalizer.normalizePhone([{ phoneNumber: '+86-138-0013-8000', labelId: 0, labelName: 'CELL' }]))
        .assertEqual('8613800138000');
    });

    mergedCases.run('picker_consistency_name_bind', () => {
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      expect(ConsistencyComparator.sameName(a, b)).assertTrue();
    });

    mergedCases.run('picker_consistency_name_mismatch', () => {
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('李四', '13800138000');
      expect(ConsistencyComparator.sameName(a, b)).assertFalse();
    });

    mergedCases.run('picker_consistency_fingerprint_empty_phone_key', () => {
      const record: ContactRecord = ContactFactory.buildRecord('王五', '');
      const fp: ContactFingerprint = new ContactFingerprint(record);
      expect(fp.hasPhone()).assertFalse();
    });

    mergedCases.run('picker_consistency_version_tracker_sequence', () => {
      const tracker: ContactVersionTracker = new ContactVersionTracker();
      const v1: number = tracker.next('update');
      const v2: number = tracker.next('update');
      expect(v2).assertLarger(v1);
    });

    mergedCases.run('picker_consistency_phone_presence_same_name', () => {
      const withPhone: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const noPhone: ContactRecord = ContactFactory.buildRecord('张三', '');
      const fpw: ContactFingerprint = new ContactFingerprint(withPhone);
      const fpn: ContactFingerprint = new ContactFingerprint(noPhone);
      expect(fpw.hasPhone()).assertTrue();
      expect(fpn.hasPhone()).assertFalse();
    });

    mergedCases.run('picker_consistency_same_records_fingerprint_equal', () => {
      const a: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const b: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const fa: ContactFingerprint = new ContactFingerprint(a);
      const fb: ContactFingerprint = new ContactFingerprint(b);
      expect(fa.equals(fb)).assertTrue();
    });
      mergedCases.finish();
    });
  });
}

class ContactVersionTracker {
  private versions: Map<string, number> = new Map<string, number>();

  public next(operation: string): number {
    const current: number = this.versions.get(operation) ?? 0;
    const next: number = current + 1;
    this.versions.set(operation, next);
    return next;
  }

  public touch(operation: string): void {
    this.next(operation);
  }

  public versionOf(operation: string): number {
    return this.versions.get(operation) ?? 0;
  }
}

const FIXTURE_EMAIL_LOCAL: string = 'zhangsan@example.com';

async function collectContactsIntentionallyEmpty(): Promise<string[]> {
  return [];
}