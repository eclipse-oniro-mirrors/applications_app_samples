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
  KEY_BACK,
  ensureContactsPage,
  getDriver,
  pressAndWait,
  serializedDelay,
  clickSampleButton,
  TEXT_ADD_BY_PERMISSION,
  TEXT_SELECT_BY_PICKER
} from '../Shared/ContactsDriver';
import {
  ContactRecord,
  ContactFactory,
  ContactValidator,
  ContactPermissionState
} from '../Shared/ContactModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Contact]';
const BUNDLE: string = 'Contact_';

enum RecoveryKind {
  PERMISSION_DENIED = 0,
  PICKER_CANCELLED = 1,
  PROVIDER_FAILURE = 2,
  CAPABILITY_MISSING = 3
}

interface RecoveryRecord {
  kind: RecoveryKind;
  recovered: boolean;
  attempts: number;
  timestamp: number;
}

class RecoveryStrategy {
  public static readonly MAX_RETRIES: number = 3;
  private attempts: Map<RecoveryKind, number> = new Map<RecoveryKind, number>();

  public isRetryable(kind: RecoveryKind): boolean {
    return kind === RecoveryKind.PROVIDER_FAILURE || kind === RecoveryKind.PERMISSION_DENIED;
  }

  public shouldRetry(kind: RecoveryKind): boolean {
    const used: number = this.attempts.get(kind) ?? 0;
    return this.isRetryable(kind) && used < RecoveryStrategy.MAX_RETRIES;
  }

  public mark(kind: RecoveryKind): void {
    const used: number = this.attempts.get(kind) ?? 0;
    this.attempts.set(kind, used + 1);
  }

  public reset(): void {
    this.attempts.clear();
  }

  public getAttempts(kind: RecoveryKind): number {
    return this.attempts.get(kind) ?? 0;
  }
}

class RecoveryTracker {
  private records: RecoveryRecord[] = [];
  private recoveredCount: number = 0;

  public record(kind: RecoveryKind, recovered: boolean, attempts: number): void {
    this.records.push({ kind: kind, recovered: recovered, attempts: attempts, timestamp: Date.now() });
    if (recovered) {
      this.recoveredCount++;
    }
  }

  public getRecords(): RecoveryRecord[] {
    return this.records.map((r: RecoveryRecord) => r);
  }

  public getRecoveredCount(): number {
    return this.recoveredCount;
  }

  public recoveryRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.recoveredCount / this.records.length;
  }

  public reset(): void {
    this.records = [];
    this.recoveredCount = 0;
  }
}

export default function contactPickerErrorRecoveryTest(): void {
  describe('ContactPickerErrorRecovery_Test', () => {
    let driver: Driver;
    let strategy: RecoveryStrategy;
    let tracker: RecoveryTracker;

    beforeAll(async () => {
      driver = getDriver();
      strategy = new RecoveryStrategy();
      tracker = new RecoveryTracker();
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    it('picker_recovery_should_retry_permission_denied__group_9', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_recovery_should_retry_permission_denied', () => {
      strategy.reset();
      expect(strategy.isRetryable(RecoveryKind.PERMISSION_DENIED)).assertTrue();
      expect(strategy.shouldRetry(RecoveryKind.PERMISSION_DENIED)).assertTrue();
    });

    mergedCases.run('picker_recovery_should_not_retry_picker_cancelled', () => {
      strategy.reset();
      expect(strategy.isRetryable(RecoveryKind.PICKER_CANCELLED)).assertFalse();
      expect(strategy.shouldRetry(RecoveryKind.PICKER_CANCELLED)).assertFalse();
    });

    mergedCases.run('picker_recovery_should_not_retry_capability_missing', () => {
      strategy.reset();
      expect(strategy.isRetryable(RecoveryKind.CAPABILITY_MISSING)).assertFalse();
    });

    mergedCases.run('picker_recovery_should_exhaust_retries_after_max', () => {
      strategy.reset();
      for (let i = 0; i < RecoveryStrategy.MAX_RETRIES; i++) {
        expect(strategy.shouldRetry(RecoveryKind.PROVIDER_FAILURE)).assertTrue();
        strategy.mark(RecoveryKind.PROVIDER_FAILURE);
      }
      expect(strategy.shouldRetry(RecoveryKind.PROVIDER_FAILURE)).assertFalse();
      expect(strategy.getAttempts(RecoveryKind.PROVIDER_FAILURE)).assertEqual(RecoveryStrategy.MAX_RETRIES);
    });

    mergedCases.run('picker_recovery_tracker_should_count_recoveries', () => {
      tracker.reset();
      tracker.record(RecoveryKind.PERMISSION_DENIED, true, 1);
      tracker.record(RecoveryKind.PICKER_CANCELLED, true, 0);
      tracker.record(RecoveryKind.PROVIDER_FAILURE, false, 3);
      expect(tracker.getRecoveredCount()).assertEqual(2);
      expect(tracker.recoveryRate()).assertEqual(2 / 3);
    });

    mergedCases.run('picker_recovery_should_retry_provider_failure_once', () => {
      strategy.reset();
      strategy.mark(RecoveryKind.PROVIDER_FAILURE);
      expect(strategy.shouldRetry(RecoveryKind.PROVIDER_FAILURE)).assertTrue();
      strategy.mark(RecoveryKind.PROVIDER_FAILURE);
      expect(strategy.shouldRetry(RecoveryKind.PROVIDER_FAILURE)).assertTrue();
    });

    mergedCases.run('picker_recovery_permission_state_should_apply_denied', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(-1, -1);
      expect(state.canRead()).assertFalse();
      expect(state.canWrite()).assertFalse();
    });

    mergedCases.run('picker_recovery_permission_state_should_apply_granted', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(0, 0);
      expect(state.canRead()).assertTrue();
      expect(state.canWrite()).assertTrue();
    });

    mergedCases.run('picker_recovery_should_validate_contact_after_denied', () => {
      const record: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
      expect(ContactValidator.isValidRecord(record)).assertTrue();
    });
      mergedCases.finish();
    });

    it('picker_recovery_page_should_survive_add_permission_error', 0, async () => {
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
      await clickSampleButton(driver, TEXT_ADD_BY_PERMISSION);
      await serializedDelay(driver, 300);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('picker_recovery_page_should_survive_picker_cancel', 0, async () => {
      await ensureContactsPage(driver);
      await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
      await serializedDelay(driver, 300);
      await pressAndWait(driver, KEY_BACK, 1, 100);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('picker_recovery_tracker_reset_should_clear_counters__group_9', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_recovery_tracker_reset_should_clear_counters', () => {
      tracker.reset();
      tracker.record(RecoveryKind.PERMISSION_DENIED, true, 1);
      expect(tracker.getRecords().length).assertEqual(1);
      tracker.reset();
      expect(tracker.getRecords().length).assertEqual(0);
      expect(tracker.getRecoveredCount()).assertEqual(0);
    });

    mergedCases.run('picker_recovery_should_allow_retry_after_reset', () => {
      strategy.reset();
      for (let i = 0; i < RecoveryStrategy.MAX_RETRIES; i++) {
        strategy.mark(RecoveryKind.PROVIDER_FAILURE);
      }
      expect(strategy.shouldRetry(RecoveryKind.PROVIDER_FAILURE)).assertFalse();
      strategy.reset();
      expect(strategy.shouldRetry(RecoveryKind.PROVIDER_FAILURE)).assertTrue();
    });

    mergedCases.run('picker_recovery_permission_denied_should_be_retryable_once', () => {
      strategy.reset();
      expect(strategy.isRetryable(RecoveryKind.PERMISSION_DENIED)).assertTrue();
      strategy.mark(RecoveryKind.PERMISSION_DENIED);
      expect(strategy.getAttempts(RecoveryKind.PERMISSION_DENIED)).assertEqual(1);
      expect(strategy.shouldRetry(RecoveryKind.PERMISSION_DENIED)).assertTrue();
    });

    mergedCases.run('picker_recovery_cancelled_and_capability_should_not_be_retryable', () => {
      strategy.reset();
      expect(strategy.isRetryable(RecoveryKind.PICKER_CANCELLED)).assertFalse();
      expect(strategy.isRetryable(RecoveryKind.CAPABILITY_MISSING)).assertFalse();
      expect(strategy.shouldRetry(RecoveryKind.PICKER_CANCELLED)).assertFalse();
    });

    mergedCases.run('picker_recovery_tracker_should_accept_recovery_records', () => {
      tracker.reset();
      tracker.record(RecoveryKind.PERMISSION_DENIED, true, 2);
      expect(tracker.getRecords().length).assertEqual(1);
      expect(tracker.getRecoveredCount()).assertEqual(1);
    });

    mergedCases.run('picker_recovery_tracker_should_report_failure_rate', () => {
      tracker.reset();
      tracker.record(RecoveryKind.PROVIDER_FAILURE, false, 3);
      tracker.record(RecoveryKind.PICKER_CANCELLED, true, 0);
      expect(tracker.recoveryRate()).assertEqual(0.5);
    });

    mergedCases.run('picker_recovery_permission_state_should_allow_after_regrant', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(-1, -1);
      expect(state.canRead()).assertFalse();
      state.applyAuthResults(0, 0);
      expect(state.canRead()).assertTrue();
      expect(state.canWrite()).assertTrue();
    });

    mergedCases.run('picker_recovery_permission_state_should_allow_read_only', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(0, -1);
      expect(state.canRead()).assertTrue();
      expect(state.canWrite()).assertFalse();
    });

    mergedCases.run('picker_recovery_should_validate_contact_after_retry', () => {
      strategy.reset();
      strategy.mark(RecoveryKind.PROVIDER_FAILURE);
      const record: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
      expect(ContactValidator.isValidRecord(record)).assertTrue();
      expect(strategy.shouldRetry(RecoveryKind.PROVIDER_FAILURE)).assertTrue();
    });
      mergedCases.finish();
    });

    it('picker_recovery_page_should_survive_repeated_error_flow', 0, async () => {
      await ensureContactsPage(driver);
      for (let i = 0; i < 3; i++) {
        const ready: boolean = await ensureContactsPage(driver);
        expect(ready).assertTrue();
        await serializedDelay(driver, 100);
      }
    });

    it('picker_recovery_page_should_stay_stable_after_permission_try', 0, async () => {
      await ensureContactsPage(driver);
      await clickSampleButton(driver, TEXT_ADD_BY_PERMISSION);
      await serializedDelay(driver, 300);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('picker_recovery_provider_failure_should_exhaust_after_three__group_12', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_recovery_provider_failure_should_exhaust_after_three', () => {
      strategy.reset();
      for (let i = 0; i < RecoveryStrategy.MAX_RETRIES; i++) {
        strategy.mark(RecoveryKind.PROVIDER_FAILURE);
      }
      expect(strategy.getAttempts(RecoveryKind.PROVIDER_FAILURE)).assertEqual(RecoveryStrategy.MAX_RETRIES);
      expect(strategy.shouldRetry(RecoveryKind.PROVIDER_FAILURE)).assertFalse();
    });

    // 权限拒绝恢复：第一次拒绝后可重试
    mergedCases.run('picker_recovery_permission_denied_should_retry', () => {
      strategy.reset();
      strategy.mark(RecoveryKind.PERMISSION_DENIED);
      expect(strategy.getAttempts(RecoveryKind.PERMISSION_DENIED)).assertEqual(1);
      expect(strategy.shouldRetry(RecoveryKind.PERMISSION_DENIED)).assertTrue();
    });

    // 权限恢复：连续两次拒绝后仍可重试直至上限
    mergedCases.run('picker_recovery_permission_denied_exhaust', () => {
      strategy.reset();
      for (let i = 0; i < RecoveryStrategy.MAX_RETRIES; i++) {
        strategy.mark(RecoveryKind.PERMISSION_DENIED);
      }
      expect(strategy.shouldRetry(RecoveryKind.PERMISSION_DENIED)).assertFalse();
    });

    // 选择器取消恢复：不是可重试错误
    mergedCases.run('picker_recovery_cancelled_not_retryable', () => {
      strategy.reset();
      strategy.mark(RecoveryKind.PICKER_CANCELLED);
      expect(strategy.shouldRetry(RecoveryKind.PICKER_CANCELLED)).assertFalse();
    });

    // 能力缺失恢复：不可重试
    mergedCases.run('picker_recovery_capability_not_retryable', () => {
      strategy.reset();
      strategy.mark(RecoveryKind.CAPABILITY_MISSING);
      expect(strategy.shouldRetry(RecoveryKind.CAPABILITY_MISSING)).assertFalse();
    });

    // 恢复统计：恢复率应随成功恢复上升
    mergedCases.run('picker_recovery_rate_should_improve', () => {
      tracker.reset();
      tracker.record(RecoveryKind.PERMISSION_DENIED, true, 1);
      tracker.record(RecoveryKind.PICKER_CANCELLED, true, 0);
      tracker.record(RecoveryKind.PROVIDER_FAILURE, false, 3);
      expect(tracker.recoveryRate()).assertEqual(2 / 3);
    });

    // 恢复策略重置后应恢复默认尝试数
    mergedCases.run('picker_recovery_reset_should_restore_defaults', () => {
      strategy.reset();
      expect(strategy.getAttempts(RecoveryKind.PROVIDER_FAILURE)).assertEqual(0);
      expect(strategy.shouldRetry(RecoveryKind.PROVIDER_FAILURE)).assertTrue();
    });

    // 恢复追踪记录与清空
    mergedCases.run('picker_recovery_tracker_clear', () => {
      tracker.reset();
      tracker.record(RecoveryKind.PROVIDER_FAILURE, false, 3);
      expect(tracker.getRecords().length).assertEqual(1);
      tracker.reset();
      expect(tracker.getRecords().length).assertEqual(0);
    });

    // 权限状态：先拒后授可写
    mergedCases.run('picker_recovery_regrant_enables_write', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(-1, -1);
      expect(state.canWrite()).assertFalse();
      state.applyAuthResults(0, 0);
      expect(state.canWrite()).assertTrue();
    });

    // 权限状态：只读授予不允许写入
    mergedCases.run('picker_recovery_read_only_no_write', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(0, -1);
      expect(state.canRead()).assertTrue();
      expect(state.canWrite()).assertFalse();
    });

    // 模型校验：恢复流程仍要求合法联系人
    mergedCases.run('picker_recovery_should_validate_contact_after_error', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      expect(ContactValidator.isValidRecord(record)).assertTrue();
    });

    // 模型校验：非法联系人应被拒绝
    mergedCases.run('picker_recovery_should_reject_invalid_contact', () => {
      const record: ContactRecord = ContactFactory.buildRecord('', '');
      expect(ContactValidator.isValidRecord(record)).assertFalse();
    });
      mergedCases.finish();
    });

    // 页面级恢复：连续进入应稳定
    it('picker_recovery_page_repeated_enter_stable', 0, async () => {
      await ensureContactsPage(driver);
      await serializedDelay(driver, 60);
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
    });

    // 页面级恢复：权限尝试后页面不消失
    it('picker_recovery_page_after_permission_try', 0, async () => {
      await ensureContactsPage(driver);
      await clickSampleButton(driver, TEXT_ADD_BY_PERMISSION);
      await serializedDelay(driver, 250);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    // 页面级恢复：选择器打开后返回
    it('picker_recovery_page_after_picker_try', 0, async () => {
      await ensureContactsPage(driver);
      await clickSampleButton(driver, TEXT_SELECT_BY_PICKER);
      await serializedDelay(driver, 250);
      await pressAndWait(driver, KEY_BACK, 1, 80);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    // 页面级恢复：Back 后恢复主页
    it('picker_recovery_back_returns_home', 0, async () => {
      await ensureContactsPage(driver);
      await pressAndWait(driver, KEY_BACK, 1, 80);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    // 恢复策略：provider 失败可重试两次
    it('picker_recovery_provider_two_retries__group_7', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_recovery_provider_two_retries', () => {
      strategy.reset();
      strategy.mark(RecoveryKind.PROVIDER_FAILURE);
      strategy.mark(RecoveryKind.PROVIDER_FAILURE);
      expect(strategy.shouldRetry(RecoveryKind.PROVIDER_FAILURE)).assertTrue();
    });

    // 恢复统计：空记录恢复率应为零
    mergedCases.run('picker_recovery_rate_zero_empty', () => {
      tracker.reset();
      expect(tracker.recoveryRate()).assertEqual(0);
    });

    // 恢复：权限拒绝可重试至上限
    mergedCases.run('picker_recovery_permission_exhaust', () => {
      strategy.reset();
      for (let i = 0; i < RecoveryStrategy.MAX_RETRIES; i++) {
        strategy.mark(RecoveryKind.PERMISSION_DENIED);
      }
      expect(strategy.shouldRetry(RecoveryKind.PERMISSION_DENIED)).assertFalse();
    });

    // 恢复：取消不可重试
    mergedCases.run('picker_recovery_cancelled_no_retry', () => {
      strategy.reset();
      strategy.mark(RecoveryKind.PICKER_CANCELLED);
      expect(strategy.shouldRetry(RecoveryKind.PICKER_CANCELLED)).assertFalse();
    });

    // 恢复：能力缺失不可重试
    mergedCases.run('picker_recovery_capability_no_retry', () => {
      strategy.reset();
      strategy.mark(RecoveryKind.CAPABILITY_MISSING);
      expect(strategy.shouldRetry(RecoveryKind.CAPABILITY_MISSING)).assertFalse();
    });

    // 恢复：provider 一次失败仍可重试
    mergedCases.run('picker_recovery_provider_single_failure', () => {
      strategy.reset();
      strategy.mark(RecoveryKind.PROVIDER_FAILURE);
      expect(strategy.shouldRetry(RecoveryKind.PROVIDER_FAILURE)).assertTrue();
    });

    // 恢复：追踪器成功恢复计数
    mergedCases.run('picker_recovery_tracker_recovered', () => {
      tracker.reset();
      tracker.record(RecoveryKind.PERMISSION_DENIED, true, 1);
      tracker.record(RecoveryKind.PICKER_CANCELLED, true, 0);
      expect(tracker.getRecoveredCount()).assertEqual(2);
    });
      mergedCases.finish();
    });

    // 页面：重复权限进入稳定
    it('picker_recovery_page_stable_reentry', 0, async () => {
      await ensureContactsPage(driver);
      await serializedDelay(driver, 80);
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
    });

    // 模型：恢复后应保留合法联系人
    it('picker_recovery_valid_contact_survives__group_12', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('picker_recovery_valid_contact_survives', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      expect(ContactValidator.isValidRecord(record)).assertTrue();
    });

    mergedCases.run('picker_recovery_regrant_enables_read', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(0, 0);
      expect(state.canRead()).assertTrue();
    });

    mergedCases.run('picker_recovery_auth_grant_enables_write', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(0, 0);
      expect(state.canWrite()).assertTrue();
    });

    mergedCases.run('picker_recovery_default_permission_denied', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      expect(state.canRead()).assertFalse();
      expect(state.canWrite()).assertFalse();
    });

    mergedCases.run('picker_recovery_validate_invalid_name_rejected', () => {
      const record: ContactRecord = ContactFactory.buildRecord('', '13800138000');
      expect(ContactValidator.isValidRecord(record)).assertFalse();
    });

    mergedCases.run('picker_recovery_validate_phone_short_rejected', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '12');
      expect(ContactValidator.isValidRecord(record)).assertFalse();
    });

    mergedCases.run('picker_recovery_validate_email_only_accepted', () => {
      const record: ContactRecord = ContactFactory.buildRecord('李四', '');
      record.emails.push({ email: 'lisi@example.com', labelId: 0, labelName: 'WORK' });
      expect(ContactValidator.isValidRecord(record)).assertTrue();
    });

    mergedCases.run('picker_recovery_validate_no_channel_rejected', () => {
      const record: ContactRecord = ContactFactory.buildRecord('李四', '');
      expect(ContactValidator.isValidRecord(record)).assertFalse();
    });

    mergedCases.run('picker_recovery_validate_plain_email_format', () => {
      expect(ContactValidator.isValidEmail('a@example.com')).assertTrue();
      expect(ContactValidator.isValidEmail('invalid')).assertFalse();
    });

    mergedCases.run('picker_recovery_validate_empty_email_format', () => {
      expect(ContactValidator.isValidEmail('')).assertFalse();
    });

    mergedCases.run('picker_recovery_validate_email_no_domain', () => {
      expect(ContactValidator.isValidEmail('a@')).assertFalse();
    });

    mergedCases.run('picker_recovery_validate_email_with_domain', () => {
      expect(ContactValidator.isValidEmail('a@example.com')).assertTrue();
    });
      mergedCases.finish();
    });
  });
}