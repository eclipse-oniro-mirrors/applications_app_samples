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
  clickSampleButtonAt,
  TEXT_ADD_BY_PICKER,
  sampleButtons,
  DELAY_AFTER_PICKER,
  contactPageComponentCount,
  waitForStableContactPage
} from '../Shared/ContactsDriver';
import {
  ContactFactory,
  ContactRecord,
  ContactValidator,
  ContactNormalizer,
  PickerSession,
  ContactPermissionState
} from '../Shared/ContactModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Contact]';
const BUNDLE: string = 'Contact_';

// 输入通道枚举
enum InputChannel {
  TOUCH = 'touch',
  KEYBOARD = 'keyboard',
  REMOTE = 'remote'
}

interface InputEvent {
  channel: InputChannel;
  target: string;
  delivered: boolean;
  timestamp: number;
}

class InputEventLog {
  private events: InputEvent[] = [];

  public record(channel: InputChannel, target: string, delivered: boolean): void {
    this.events.push({ channel: channel, target: target, delivered: delivered, timestamp: Date.now() });
  }

  public getEvents(): InputEvent[] {
    return this.events.map((e: InputEvent) => e);
  }

  public count(): number {
    return this.events.length;
  }

  public countDelivered(): number {
    return this.events.filter((e: InputEvent) => e.delivered).length;
  }

  public reset(): void {
    this.events = [];
  }
}

// 联系人输入过滤器：名称、号码、邮箱、整条记录的合法性判断
class ContactInputFilter {
  public isPhoneAllowed(phone: string): boolean {
    return ContactValidator.isValidPhone(phone);
  }

  public isNameAllowed(name: string): boolean {
    return ContactValidator.isValidName(name);
  }

  public isEmailAllowed(email: string): boolean {
    return ContactValidator.isValidEmail(email);
  }

  public isRecordAllowed(record: ContactRecord): boolean {
    return ContactValidator.isValidRecord(record);
  }
}

// 输入通道统计：按通道累计送达/丢弃次数
class InputChannelStatistics {
  private delivered: Map<InputChannel, number> = new Map<InputChannel, number>();
  private dropped: Map<InputChannel, number> = new Map<InputChannel, number>();

  public recordDelivered(channel: InputChannel): void {
    const current: number = this.delivered.get(channel) ?? 0;
    this.delivered.set(channel, current + 1);
  }

  public recordDropped(channel: InputChannel): void {
    const current: number = this.dropped.get(channel) ?? 0;
    this.dropped.set(channel, current + 1);
  }

  public deliveredCount(): number {
    let sum: number = 0;
    this.delivered.forEach((value: number) => {
      sum += value;
    });
    return sum;
  }

  public droppedCount(): number {
    let sum: number = 0;
    this.dropped.forEach((value: number) => {
      sum += value;
    });
    return sum;
  }

  public total(): number {
    return this.deliveredCount() + this.droppedCount();
  }

  public countByChannel(channel: InputChannel): number {
    return (this.delivered.get(channel) ?? 0) + (this.dropped.get(channel) ?? 0);
  }

  public reset(): void {
    this.delivered.clear();
    this.dropped.clear();
  }
}

class InputTargetResolver {
  public static resolve(label: string): number {
    const labels: string[] = sampleButtons();
    return labels.indexOf(label);
  }

  public static isValidIndex(index: number): boolean {
    return index >= 0 && index < sampleButtons().length;
  }
}

export default function contactInputInteractionTest(): void {
  describe('ContactInputInteraction_Test', () => {
    let driver: Driver;
    let log: InputEventLog;

    beforeAll(async () => {
      driver = getDriver();
      log = new InputEventLog();
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    it('input_interaction_touch_should_resolve_selected_button', 0, () => {
      const index: number = InputTargetResolver.resolve(sampleButtons()[0]);
      expect(InputTargetResolver.isValidIndex(index)).assertTrue();
      expect(index).assertEqual(0);
    });

    it('input_interaction_touch_should_deliver_to_first_button', 0, async () => {
      const clicked: boolean = await clickSampleButtonAt(driver, 0);
      expect(clicked).assertTrue();
      log.record(InputChannel.TOUCH, sampleButtons()[0], clicked);
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      await ensureContactsPage(driver);
      expect(log.countDelivered()).assertEqual(1);
    });

    it('input_interaction_should_locate_all_targets__group_4', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('input_interaction_should_locate_all_targets', () => {
      const labels: string[] = sampleButtons();
      for (let i = 0; i < labels.length; i++) {
        expect(InputTargetResolver.resolve(labels[i])).assertEqual(i);
      }
    });

    mergedCases.run('input_interaction_text_normalization_should_be_stable', () => {
      expect(ContactNormalizer.digitsOf('139 1234 5678')).assertEqual('13912345678');
      expect(ContactNormalizer.trimName('  张三  ')).assertEqual('张三');
      expect(ContactNormalizer.hasDigit('hello')).assertFalse();
    });

    mergedCases.run('input_interaction_input_validation_should_reject_bad_phone', () => {
      expect(ContactValidator.isValidPhone('5012345678901234567890')).assertFalse();
      expect(ContactValidator.isValidPhone('13800138000')).assertTrue();
      expect(ContactValidator.isValidPhone('')).assertFalse();
    });

    mergedCases.run('input_interaction_log_should_count_events', () => {
      log.reset();
      log.record(InputChannel.KEYBOARD, '1', true);
      log.record(InputChannel.REMOTE, '2', false);
      expect(log.count()).assertEqual(2);
      expect(log.countDelivered()).assertEqual(1);
    });
      mergedCases.finish();
    });

    it('input_interaction_add_picker_should_keep_alive', 0, async () => {
      await ensureContactsPage(driver);
      const clicked: boolean = await clickSampleButton(driver, TEXT_ADD_BY_PICKER);
      expect(clicked).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      await ensureContactsPage(driver);
    });

    it('input_interaction_resolver_should_reject_unknown_target__group_2', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('input_interaction_resolver_should_reject_unknown_target', () => {
      expect(InputTargetResolver.resolve('nonexistent')).assertEqual(-1);
      expect(InputTargetResolver.isValidIndex(-1)).assertFalse();
      expect(InputTargetResolver.isValidIndex(99)).assertFalse();
    });

    mergedCases.run('input_interaction_model_should_validate_contact', () => {
      const record: ContactRecord = ContactFactory.buildRecord('钱七', '13800004444');
      expect(ContactValidator.isValidRecord(record)).assertTrue();
      const invalid: ContactRecord = ContactFactory.buildRecord('', '123');
      expect(ContactValidator.isValidRecord(invalid)).assertFalse();
    });
      mergedCases.finish();
    });

    it('input_interaction_remote_navigation_should_keep_page', 0, async () => {
      await ensureContactsPage(driver);
      await pressAndWait(driver, KEY_BACK, 1, 100);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('input_interaction_touch_event_log_should_reset__group_11', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('input_interaction_touch_event_log_should_reset', () => {
      log.reset();
      log.record(InputChannel.TOUCH, 'A', true);
      expect(log.count()).assertEqual(1);
      log.reset();
      expect(log.count()).assertEqual(0);
    });


    mergedCases.run('input_interaction_input_filter_should_block_bad_name', () => {
      const filter: ContactInputFilter = new ContactInputFilter();
      expect(filter.isNameAllowed('张三')).assertTrue();
      expect(filter.isNameAllowed('')).assertFalse();
      expect(filter.isNameAllowed('  ')).assertFalse();
    });

    mergedCases.run('input_interaction_input_filter_should_allow_email', () => {
      const filter: ContactInputFilter = new ContactInputFilter();
      expect(filter.isEmailAllowed('a@example.com')).assertTrue();
      expect(filter.isEmailAllowed('broken')).assertFalse();
    });

    mergedCases.run('input_interaction_channel_statistics_should_count_delivered', () => {
      const stats: InputChannelStatistics = new InputChannelStatistics();
      stats.recordDelivered(InputChannel.TOUCH);
      stats.recordDropped(InputChannel.REMOTE);
      stats.recordDelivered(InputChannel.KEYBOARD);
      expect(stats.deliveredCount()).assertEqual(2);
      expect(stats.droppedCount()).assertEqual(1);
      expect(stats.total()).assertEqual(3);
    });

    mergedCases.run('input_interaction_channel_statistics_should_breakdown_by_channel', () => {
      const stats: InputChannelStatistics = new InputChannelStatistics();
      stats.recordDelivered(InputChannel.TOUCH);
      stats.recordDelivered(InputChannel.TOUCH);
      stats.recordDelivered(InputChannel.REMOTE);
      expect(stats.countByChannel(InputChannel.TOUCH)).assertEqual(2);
      expect(stats.countByChannel(InputChannel.REMOTE)).assertEqual(1);
      expect(stats.countByChannel(InputChannel.KEYBOARD)).assertEqual(0);
    });

    mergedCases.run('input_interaction_touch_resolver_should_map_all_labels', () => {
      const labels: string[] = sampleButtons();
      for (let i = 0; i < labels.length; i++) {
        expect(InputTargetResolver.resolve(labels[i])).assertEqual(i);
      }
    });

    mergedCases.run('input_interaction_touch_resolver_should_reject_unknown', () => {
      expect(InputTargetResolver.resolve('nope')).assertEqual(-1);
      expect(InputTargetResolver.isValidIndex(-1)).assertFalse();
    });

    mergedCases.run('input_interaction_normalizer_should_handle_plus_country_code', () => {
      expect(ContactNormalizer.digitsOf('+86 138 0013 8000')).assertEqual('8613800138000');
      expect(ContactNormalizer.digitsOf('138-0013-8000')).assertEqual('13800138000');
    });

    mergedCases.run('input_interaction_normalizer_should_trim_whitespace', () => {
      expect(ContactNormalizer.trimName('  王 五  ')).assertEqual('王 五');
      expect(ContactNormalizer.trimName('张三')).assertEqual('张三');
    });

    mergedCases.run('input_interaction_model_should_reject_oversized_phone', () => {
      expect(ContactValidator.isValidPhone('1380013800013800138000138000')).assertFalse();
      expect(ContactValidator.isValidPhone('13800138000')).assertTrue();
    });
      mergedCases.finish();
    });

    it('input_interaction_page_touch_should_keep_sessions_serialized', 0, async () => {
      await ensureContactsPage(driver);
      const s1: PickerSession = new PickerSession();
      const s2: PickerSession = new PickerSession();
      s1.open();
      s2.open();
      expect(s1.isOpened()).assertTrue();
      expect(s2.isOpened()).assertTrue();
      s1.resolve(1);
      s2.cancel();
      expect(s1.getResultCount()).assertEqual(1);
      expect(s2.getResultCount()).assertEqual(0);
    });

    it('input_interaction_keyboard_should_select_buttons', 0, async () => {
      await ensureContactsPage(driver);
      const index: number = InputTargetResolver.resolve(sampleButtons()[0]);
      expect(index).assertEqual(0);
      const clicked: boolean = await clickSampleButtonAt(driver, index);
      expect(clicked).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_PICKER);
      await ensureContactsPage(driver);
    });

    it('input_interaction_remote_back_should_return_home', 0, async () => {
      await ensureContactsPage(driver);
      await pressAndWait(driver, KEY_BACK, 1, 100);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('input_interaction_filter_should_validate_record_input__group_4', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('input_interaction_filter_should_validate_record_input', () => {
      const filter: ContactInputFilter = new ContactInputFilter();
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      expect(filter.isRecordAllowed(record)).assertTrue();
    });

    mergedCases.run('input_interaction_filter_should_reject_record_without_channel', () => {
      const filter: ContactInputFilter = new ContactInputFilter();
      const record: ContactRecord = ContactFactory.buildRecord('张三', '');
      expect(filter.isRecordAllowed(record)).assertFalse();
    });

    mergedCases.run('input_interaction_channel_statistics_reset_should_clear', () => {
      const stats: InputChannelStatistics = new InputChannelStatistics();
      stats.recordDelivered(InputChannel.TOUCH);
      expect(stats.total()).assertEqual(1);
      stats.reset();
      expect(stats.total()).assertEqual(0);
    });

    mergedCases.run('input_interaction_permission_state_should_gate_touch_add', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(0, -1);
      expect(state.canWrite()).assertFalse();
      state.applyAuthResults(0, 0);
      expect(state.canWrite()).assertTrue();
    });
      mergedCases.finish();
    });

    it('input_interaction_touch_should_keep_page_render', 0, async () => {
      await ensureContactsPage(driver);
      await waitForStableContactPage(driver);
      expect(await contactPageComponentCount(driver)).assertLargerOrEqual(1);
    });

    it('input_interaction_filter_phone_length_boundary__group_8', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('input_interaction_filter_phone_length_boundary', () => {
      const filter: ContactInputFilter = new ContactInputFilter();
      expect(filter.isPhoneAllowed('000')).assertTrue();
      expect(filter.isPhoneAllowed('00')).assertFalse();
      expect(filter.isPhoneAllowed('1380013800013800013800')).assertFalse();
    });

    mergedCases.run('input_interaction_filter_name_max_length', () => {
      const filter: ContactInputFilter = new ContactInputFilter();
      const longName: string = new Array(200).join('名');
      expect(filter.isNameAllowed(longName)).assertFalse();
      expect(filter.isNameAllowed('张三')).assertTrue();
    });

    mergedCases.run('input_interaction_filter_email_must_have_domain', () => {
      const filter: ContactInputFilter = new ContactInputFilter();
      expect(filter.isEmailAllowed('a@')).assertFalse();
      expect(filter.isEmailAllowed('a@b.org')).assertTrue();
      expect(filter.isEmailAllowed('@b.org')).assertFalse();
    });

    mergedCases.run('input_interaction_channel_breakdown_should_be_exact', () => {
      const stats: InputChannelStatistics = new InputChannelStatistics();
      stats.recordDelivered(InputChannel.TOUCH);
      stats.recordDelivered(InputChannel.TOUCH);
      stats.recordDelivered(InputChannel.KEYBOARD);
      stats.recordDropped(InputChannel.REMOTE);
      expect(stats.countByChannel(InputChannel.TOUCH)).assertEqual(2);
      expect(stats.countByChannel(InputChannel.KEYBOARD)).assertEqual(1);
      expect(stats.countByChannel(InputChannel.REMOTE)).assertEqual(1);
      expect(stats.deliveredCount()).assertEqual(3);
      expect(stats.droppedCount()).assertEqual(1);
    });

    mergedCases.run('input_interaction_event_log_should_preserve_order', () => {
      log.reset();
      log.record(InputChannel.TOUCH, 'A', true);
      log.record(InputChannel.KEYBOARD, 'B', false);
      const events = log.getEvents();
      expect(events.length).assertEqual(2);
      expect(events[0].target).assertEqual('A');
      expect(events[1].target).assertEqual('B');
    });

    mergedCases.run('input_interaction_record_should_require_identity_channel', () => {
      const filter: ContactInputFilter = new ContactInputFilter();
      const withEmail: ContactRecord = ContactFactory.buildRecord('李四', '');
      withEmail.emails.push({ email: 'lisi@example.com', labelId: 0, labelName: 'WORK' });
      expect(filter.isRecordAllowed(withEmail)).assertTrue();
    });

    mergedCases.run('input_interaction_permission_gate_should_apply_auth_results', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(-1, 0);
      expect(state.canRead()).assertFalse();
      expect(state.canWrite()).assertTrue();
    });

    mergedCases.run('input_interaction_sessions_should_be_distinct', () => {
      const first: PickerSession = new PickerSession();
      const second: PickerSession = new PickerSession();
      first.open();
      expect(first.isOpened()).assertTrue();
      expect(second.isOpened()).assertFalse();
      second.open();
      expect(second.isOpened()).assertTrue();
      first.cancel();
      expect(first.isCancelled()).assertTrue();
      expect(second.isCancelled()).assertFalse();
    });
      mergedCases.finish();
    });

    it('input_interaction_touch_navigation_should_stay_on_page', 0, async () => {
      await ensureContactsPage(driver);
      const ready: boolean = await waitForStableContactPage(driver);
      expect(ready).assertTrue();
    });

    it('input_interaction_resolver_should_only_map_four_buttons', 0, () => {
      const targets: number[] = sampleButtons().map((label: string) => InputTargetResolver.resolve(label));
      expect(targets.length).assertEqual(4);
      const maxTarget: number = Math.max(targets[0], targets[1], targets[2], targets[3]);
      expect(maxTarget).assertEqual(3);
    });

    it('input_interaction_remote_keys_should_not_close_page_forever', 0, async () => {
      await ensureContactsPage(driver);
      await pressAndWait(driver, KEY_BACK, 1, 80);
      const restored: boolean = await ensureContactsPage(driver);
      expect(restored).assertTrue();
    });

    it('input_interaction_record_should_reject_empty_name__group_9', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('input_interaction_record_should_reject_empty_name', () => {
      const record: ContactRecord = ContactFactory.buildRecord('', '13800138000');
      expect(ContactValidator.isValidRecord(record)).assertFalse();
    });

    mergedCases.run('input_interaction_record_should_accept_email_without_phone', () => {
      const record: ContactRecord = ContactFactory.buildRecord('钱七', '');
      record.emails.push({ email: 'qianqi@example.com', labelId: 0, labelName: 'WORK' });
      expect(ContactValidator.isValidRecord(record)).assertTrue();
    });

    mergedCases.run('input_interaction_channel_stats_zero_default', () => {
      const stats: InputChannelStatistics = new InputChannelStatistics();
      expect(stats.total()).assertEqual(0);
      expect(stats.countByChannel(InputChannel.TOUCH)).assertEqual(0);
    });

    mergedCases.run('input_interaction_filter_rejects_oversized_name', () => {
      const filter: ContactInputFilter = new ContactInputFilter();
      const longName: string = new Array(300).join('名');
      expect(filter.isNameAllowed(longName)).assertFalse();
    });

    mergedCases.run('input_interaction_touch_should_resolve_second_button', () => {
      const index: number = InputTargetResolver.resolve(sampleButtons()[1]);
      expect(index).assertEqual(1);
    });

    mergedCases.run('input_interaction_sessions_should_be_resolvable', () => {
      const session: PickerSession = new PickerSession();
      session.open();
      session.resolve(2);
      expect(session.getResultCount()).assertEqual(2);
    });

    mergedCases.run('input_interaction_record_should_require_name_or_channel', () => {
      const filter: ContactInputFilter = new ContactInputFilter();
      const record: ContactRecord = ContactFactory.buildRecord('', '123');
      expect(filter.isRecordAllowed(record)).assertFalse();
    });

    mergedCases.run('input_interaction_filter_rejects_short_phone', () => {
      const filter: ContactInputFilter = new ContactInputFilter();
      expect(filter.isPhoneAllowed('12')).assertFalse();
    });

    mergedCases.run('input_interaction_stats_should_reset_per_case', () => {
      const stats: InputChannelStatistics = new InputChannelStatistics();
      stats.recordDelivered(InputChannel.REMOTE);
      expect(stats.total()).assertEqual(1);
      stats.reset();
      expect(stats.total()).assertEqual(0);
    });
      mergedCases.finish();
    });

    it('input_interaction_touch_should_open_third_button', 0, async () => {
      await ensureContactsPage(driver);
      const clicked: boolean = await clickSampleButtonAt(driver, 2);
      expect(clicked).assertTrue();
      await serializedDelay(driver, 200);
      await ensureContactsPage(driver);
    });

    it('input_interaction_keyboard_back_should_return_home', 0, async () => {
      await ensureContactsPage(driver);
      await pressAndWait(driver, KEY_BACK, 1, 80);
      expect(await ensureContactsPage(driver)).assertTrue();
    });

    it('input_interaction_normalizer_should_drop_symbols', 0, () => {
      expect(ContactNormalizer.digitsOf('(138) 001-3800')).assertEqual('1380013800');
    });

    it('input_interaction_remote_should_keep_page_stable', 0, async () => {
      await ensureContactsPage(driver);
      const c1: number = await contactPageComponentCount(driver);
      await serializedDelay(driver, 60);
      const c2: number = await contactPageComponentCount(driver);
      expect(Math.abs(c2 - c1)).assertLessOrEqual(10);
    });

    it('input_interaction_channel_stats_breakdown__group_6', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('input_interaction_channel_stats_breakdown', () => {
      const stats: InputChannelStatistics = new InputChannelStatistics();
      stats.recordDelivered(InputChannel.TOUCH);
      stats.recordDelivered(InputChannel.TOUCH);
      stats.recordDropped(InputChannel.REMOTE);
      expect(stats.countByChannel(InputChannel.TOUCH)).assertEqual(2);
      expect(stats.total()).assertEqual(3);
    });

    mergedCases.run('input_interaction_filter_phone_short_reject', () => {
      const filter: ContactInputFilter = new ContactInputFilter();
      expect(filter.isPhoneAllowed('12')).assertFalse();
    });

    mergedCases.run('input_interaction_resolver_fourth_button', () => {
      const index: number = InputTargetResolver.resolve(sampleButtons()[3]);
      expect(index).assertEqual(3);
    });

    mergedCases.run('input_interaction_email_only_record_valid', () => {
      const record: ContactRecord = ContactFactory.buildRecord('王', '');
      record.emails.push({ email: 'w@example.com', labelId: 0, labelName: 'WORK' });
      const filter: ContactInputFilter = new ContactInputFilter();
      expect(filter.isRecordAllowed(record)).assertTrue();
    });

    mergedCases.run('input_interaction_permission_write_gate', () => {
      const state: ContactPermissionState = new ContactPermissionState();
      state.applyAuthResults(0, 0);
      expect(state.canWrite()).assertTrue();
    });

    mergedCases.run('input_interaction_normalizer_drop_punctuation', () => {
      expect(ContactNormalizer.digitsOf('(86) 138-0013-8000')).assertEqual('8613800138000');
    });
      mergedCases.finish();
    });

    it('input_interaction_page_should_restore_after_helper', 0, async () => {
      await ensureContactsPage(driver);
      expect(await ensureContactsPage(driver)).assertTrue();
    });

    it('input_interaction_session_cancel_semantics__group_6', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('input_interaction_session_cancel_semantics', () => {
      const session: PickerSession = new PickerSession();
      session.open();
      session.cancel();
      expect(session.isCancelled()).assertTrue();
      expect(session.getResultCount()).assertEqual(0);
    });

    mergedCases.run('input_interaction_multiplier_filter_name', () => {
      const filter: ContactInputFilter = new ContactInputFilter();
      expect(filter.isNameAllowed('张三')).assertTrue();
      expect(filter.isNameAllowed('')).assertFalse();
    });

    mergedCases.run('input_interaction_multiplier_filter_phone', () => {
      const filter: ContactInputFilter = new ContactInputFilter();
      expect(filter.isPhoneAllowed('13800138000')).assertTrue();
      expect(filter.isPhoneAllowed('12')).assertFalse();
    });

    mergedCases.run('input_interaction_filter_email_validation', () => {
      const filter: ContactInputFilter = new ContactInputFilter();
      expect(filter.isEmailAllowed('a@b.com')).assertTrue();
      expect(filter.isEmailAllowed('invalid')).assertFalse();
    });

    mergedCases.run('input_interaction_normalizer_no_separators', () => {
      expect(ContactNormalizer.digitsOf('13800138000')).assertEqual('13800138000');
      expect(ContactNormalizer.hasDigit('no')).assertFalse();
    });

    mergedCases.run('input_interaction_resolver_index_in_range', () => {
      expect(InputTargetResolver.isValidIndex(3)).assertTrue();
      expect(InputTargetResolver.isValidIndex(4)).assertFalse();
    });
      mergedCases.finish();
    });
  });
}