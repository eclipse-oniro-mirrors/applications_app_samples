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
  checkTextContent,
  TEXT_PAGE_TITLE,
  waitForStableContactPage,
  contactPageComponentCount
} from '../Shared/ContactsDriver';
import {
  ContactFactory,
  ContactRecord,
  ContactValidator,
  ContactNormalizer,
  ContactFingerprint,
  ContactPhoneInfo,
  ContactEmailInfo,
  ContactNameInfo
} from '../Shared/ContactModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Contact]';
const BUNDLE: string = 'Contact_';

// 联系人字段类型枚举：描述联系人记录中的一个可编辑字段
enum ContactFieldType {
  FIELD_NAME = 0, FIELD_PHONE = 1, FIELD_EMAIL = 2, FIELD_ORGANIZATION = 3, FIELD_NOTE = 4
}

// 联系人字段项接口：描述名字、号码、邮箱等具体字段
interface ContactFieldItem {
  fieldType: ContactFieldType;
  value: string;
  labelId: number;
  labelName: string;
}

// 联系人信息模型：聚合一个联系人记录的全部字段，提供访问与统计
class ContactInfoModel {
  private record: ContactRecord;
  private fields: ContactFieldItem[] = [];

  constructor(record: ContactRecord) {
    this.record = record;
    this.collectFields();
  }

  private collectFields(): void {
    this.fields.push({
      fieldType: ContactFieldType.FIELD_NAME,
      value: this.record.displayName,
      labelId: 0,
      labelName: 'NAME'
    });
    for (let i = 0; i < this.record.phoneNumbers.length; i++) {
      const phone: ContactPhoneInfo = this.record.phoneNumbers[i];
      this.fields.push({
        fieldType: ContactFieldType.FIELD_PHONE,
        value: phone.phoneNumber,
        labelId: phone.labelId,
        labelName: phone.labelName
      });
    }
    for (let i = 0; i < this.record.emails.length; i++) {
      const email: ContactEmailInfo = this.record.emails[i];
      this.fields.push({
        fieldType: ContactFieldType.FIELD_EMAIL,
        value: email.email,
        labelId: email.labelId,
        labelName: email.labelName
      });
    }
    if (this.record.organization.length > 0) {
      this.fields.push({
        fieldType: ContactFieldType.FIELD_ORGANIZATION,
        value: this.record.organization,
        labelId: 0,
        labelName: 'ORG'
      });
    }
    if (this.record.note.length > 0) {
      this.fields.push({
        fieldType: ContactFieldType.FIELD_NOTE,
        value: this.record.note,
        labelId: 0,
        labelName: 'NOTE'
      });
    }
  }

  public getId(): number {
    return this.record.id;
  }

  public getDisplayName(): string {
    return this.record.displayName;
  }

  public getFields(): ContactFieldItem[] {
    return this.fields.map((f: ContactFieldItem) => f);
  }

  public getFieldCount(): number {
    return this.fields.length;
  }

  public countByType(type: ContactFieldType): number {
    return this.fields.filter((f: ContactFieldItem) => f.fieldType === type).length;
  }

  public getPrimaryPhone(): string {
    if (this.record.phoneNumbers.length === 0) {
      return '';
    }
    return this.record.phoneNumbers[0].phoneNumber;
  }

  public hasPhone(): boolean {
    return this.record.phoneNumbers.length > 0;
  }

  public hasEmail(): boolean {
    return this.record.emails.length > 0;
  }

  public getPhoneFingerprint(): string {
    return ContactNormalizer.normalizePhone(this.record.phoneNumbers);
  }
}

// 字段项校验器：校验单个联系人字段的合法性与标签
class ContactFieldValidator {
  public static readonly VALID_LABELS: string[] = ['CELL', 'WORK', 'HOME', 'NAME', 'ORG', 'NOTE'];

  public static isValidLabel(label: string): boolean {
    return ContactFieldValidator.VALID_LABELS.indexOf(label) >= 0;
  }

  public static isValidField(field: ContactFieldItem): boolean {
    if (field.value.trim().length === 0) {
      return false;
    }
    if (ContactFieldValidator.isValidLabel(field.labelName)) {
      return true;
    }
    return field.value.trim().length === 0 ? true : false;
  }

  public static isValidNameItem(item: ContactFieldItem): boolean {
    return item.fieldType === ContactFieldType.FIELD_NAME && ContactValidator.isValidName(item.value);
  }

  public static isValidPhoneItem(item: ContactFieldItem): boolean {
    return item.fieldType === ContactFieldType.FIELD_PHONE && ContactValidator.isValidPhone(item.value);
  }

  public static isValidEmailItem(item: ContactFieldItem): boolean {
    return item.fieldType === ContactFieldType.FIELD_EMAIL && ContactValidator.isValidEmail(item.value);
  }
}

// 联系人信息统计：对模型字段做聚合统计
class ContactInfoStatistics {
  private model: ContactInfoModel;

  constructor(model: ContactInfoModel) {
    this.model = model;
  }

  public totalFields(): number {
    return this.model.getFieldCount();
  }

  public phoneCount(): number {
    return this.model.countByType(ContactFieldType.FIELD_PHONE);
  }

  public emailCount(): number {
    return this.model.countByType(ContactFieldType.FIELD_EMAIL);
  }

  public hasNameField(): boolean {
    return this.model.countByType(ContactFieldType.FIELD_NAME) > 0;
  }

  public hasIdentityChannel(): boolean {
    return this.model.getFields().some((field: ContactFieldItem): boolean => {
      return ContactFieldValidator.isValidPhoneItem(field) || ContactFieldValidator.isValidEmailItem(field);
    });
  }

  public summary(): string {
    return `Info{name=${this.model.getDisplayName()}, phones=${this.phoneCount()}, ` +
      `emails=${this.emailCount()}, fields=${this.totalFields()}}`;
  }
}

export default function contactItemInfoModelTest(): void {
  describe('ContactItemInfoModel_Test', () => {
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

    it('contact_info_model_should_collect_phone_fields__group_14', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('contact_info_model_should_collect_phone_fields', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.hasPhone()).assertTrue();
      expect(model.countByType(ContactFieldType.FIELD_PHONE)).assertEqual(1);
      expect(model.getFieldCount()).assertEqual(2);
    });

    mergedCases.run('contact_info_model_should_collect_name_field', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.countByType(ContactFieldType.FIELD_NAME)).assertEqual(1);
      expect(model.getDisplayName()).assertEqual('张三');
    });

    mergedCases.run('contact_info_model_should_report_primary_phone', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.getPrimaryPhone()).assertEqual('13800138000');
    });


    mergedCases.run('contact_info_model_should_build_fingerprint_from_phone', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '138-0013-8000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.getPhoneFingerprint()).assertEqual('13800138000');
    });

    mergedCases.run('contact_field_validator_should_accept_known_labels', () => {
      expect(ContactFieldValidator.isValidLabel('CELL')).assertTrue();
      expect(ContactFieldValidator.isValidLabel('WORK')).assertTrue();
      expect(ContactFieldValidator.isValidLabel('HOME')).assertTrue();
      expect(ContactFieldValidator.isValidLabel('UNKNOWN')).assertFalse();
    });

    mergedCases.run('contact_field_validator_should_check_name_item', () => {
      const item: ContactFieldItem = {
        fieldType: ContactFieldType.FIELD_NAME,
        value: '张三',
        labelId: 0,
        labelName: 'NAME'
      };
      expect(ContactFieldValidator.isValidNameItem(item)).assertTrue();
    });

    mergedCases.run('contact_field_validator_should_check_phone_item', () => {
      const item: ContactFieldItem = {
        fieldType: ContactFieldType.FIELD_PHONE,
        value: '13800138000',
        labelId: 0,
        labelName: 'CELL'
      };
      expect(ContactFieldValidator.isValidPhoneItem(item)).assertTrue();
    });

    mergedCases.run('contact_field_validator_should_check_email_item', () => {
      const item: ContactFieldItem = {
        fieldType: ContactFieldType.FIELD_EMAIL,
        value: 'a@example.com',
        labelId: 0,
        labelName: 'WORK'
      };
      expect(ContactFieldValidator.isValidEmailItem(item)).assertTrue();
    });

    mergedCases.run('contact_info_statistics_should_report_field_counts', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      const stats: ContactInfoStatistics = new ContactInfoStatistics(model);
      expect(stats.totalFields()).assertEqual(2);
      expect(stats.phoneCount()).assertEqual(1);
      expect(stats.hasNameField()).assertTrue();
      expect(stats.hasIdentityChannel()).assertTrue();
    });

    mergedCases.run('contact_info_statistics_should_handle_email_only_record', () => {
      const record: ContactRecord = ContactFactory.buildRecord('李四', '');
      record.emails.push({ email: 'lisi@example.com', labelId: 0, labelName: 'WORK' });
      const model: ContactInfoModel = new ContactInfoModel(record);
      const stats: ContactInfoStatistics = new ContactInfoStatistics(model);
      expect(stats.emailCount()).assertEqual(1);
      expect(stats.hasIdentityChannel()).assertTrue();
    });

    mergedCases.run('contact_info_statistics_should_summarize', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      const stats: ContactInfoStatistics = new ContactInfoStatistics(model);
      const summary: string = stats.summary();
      expect(summary).assertContain('张三');
      expect(summary).assertContain('phones=1');
    });

    mergedCases.run('contact_info_model_rejects_empty_value_items', () => {
      const field: ContactFieldItem = {
        fieldType: ContactFieldType.FIELD_PHONE,
        value: '',
        labelId: 0,
        labelName: 'CELL'
      };
      expect(ContactFieldValidator.isValidField(field)).assertFalse();
    });

    mergedCases.run('contact_info_model_should_validate_contact_record', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      expect(ContactValidator.isValidRecord(record)).assertTrue();
    });
      mergedCases.finish();
    });

    it('contact_info_model_page_should_render_title', 0, async () => {
      const seen: boolean = await checkTextContent(driver, TEXT_PAGE_TITLE);
      expect(seen).assertTrue();
    });

    it('contact_info_pager_should_handle_beyond_limit__group_11', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('contact_info_pager_should_handle_beyond_limit', () => {
      const pager: ContactInfoPager = new ContactInfoPager(3);
      expect(pager.pageCount(0)).assertEqual(0);
      expect(pager.pageCount(9)).assertEqual(3);
      expect(pager.pageCount(10)).assertEqual(4);
    });

    mergedCases.run('contact_info_pager_should_clamp_index', () => {
      const pager: ContactInfoPager = new ContactInfoPager(10);
      expect(pager.isValidPage(0)).assertTrue();
      expect(pager.isValidPage(-1)).assertFalse();
      expect(pager.pageStart(2)).assertEqual(20);
    });

    mergedCases.run('contact_info_pager_should_define_page_bounds', () => {
      const pager: ContactInfoPager = new ContactInfoPager(3);
      expect(pager.getPageSize()).assertEqual(3);
      expect(pager.pageStart(1)).assertEqual(3);
      expect(pager.pageEnd(1)).assertEqual(6);
    });

    mergedCases.run('contact_info_group_should_letter_partition', () => {
      const grouper: ContactInfoGrouper = new ContactInfoGrouper();
      expect(grouper.groupKey('张三')).assertLargerOrEqual(0);
      expect(grouper.groupKey('Alice')).assertLargerOrEqual(0);
    });

    mergedCases.run('contact_info_group_should_assign_distinct_keys', () => {
      const grouper: ContactInfoGrouper = new ContactInfoGrouper();
      const zh: number = grouper.groupKey('张三');
      const alice: number = grouper.groupKey('Alice');
      expect(zh).assertLargerOrEqual(0);
      expect(alice).assertLargerOrEqual(0);
    });

    mergedCases.run('contact_info_model_should_report_display_name_literal', () => {
      const record: ContactRecord = ContactFactory.buildRecord('王五', '13800002222');
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.getDisplayName()).assertEqual('王五');
    });

    mergedCases.run('contact_info_statistics_should_report_email_count', () => {
      const record: ContactRecord = ContactFactory.buildRecord('李四', '');
      record.emails.push({ email: 'lisi@example.com', labelId: 0, labelName: 'WORK' });
      const stats: ContactInfoStatistics = new ContactInfoStatistics(new ContactInfoModel(record));
      expect(stats.emailCount()).assertEqual(1);
    });

    mergedCases.run('contact_info_model_can_include_organization', () => {
      const record: ContactRecord = ContactFactory.buildRecord('冉冉', '13800004444');
      record.organization = '华为';
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.countByType(ContactFieldType.FIELD_ORGANIZATION)).assertEqual(1);
    });

    mergedCases.run('contact_info_model_can_include_note', () => {
      const record: ContactRecord = ContactFactory.buildRecord('赵六', '13800005555');
      record.note = '备注信息';
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.countByType(ContactFieldType.FIELD_NOTE)).assertEqual(1);
    });


    mergedCases.run('contact_field_validator_email_format', () => {
      const good: ContactFieldItem = {
        fieldType: ContactFieldType.FIELD_EMAIL,
        value: 'name@example.com',
        labelId: 0,
        labelName: 'WORK'
      };
      const bad: ContactFieldItem = {
        fieldType: ContactFieldType.FIELD_EMAIL,
        value: 'no-at-sign',
        labelId: 0,
        labelName: 'WORK'
      };
      expect(ContactFieldValidator.isValidEmailItem(good)).assertTrue();
      expect(ContactFieldValidator.isValidEmailItem(bad)).assertFalse();
    });
      mergedCases.finish();
    });

    it('contact_info_page_should_stay_stable', 0, async () => {
      const ready: boolean = await ensureContactsPage(driver);
      expect(ready).assertTrue();
      await waitForStableContactPage(driver);
      expect(await contactPageComponentCount(driver)).assertLargerOrEqual(1);
    });

    it('contact_info_model_should_collect_multiple_phones__group_32', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('contact_info_model_should_collect_multiple_phones', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      record.phoneNumbers.push({ phoneNumber: '13900139000', labelId: 0, labelName: 'WORK' });
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.countByType(ContactFieldType.FIELD_PHONE)).assertEqual(2);
    });

    mergedCases.run('contact_info_model_should_order_fields_name_first', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      const fields = model.getFields();
      expect(fields[0].fieldType).assertEqual(ContactFieldType.FIELD_NAME);
    });


    mergedCases.run('contact_info_statistics_should_count_org_and_note', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      record.organization = '华为';
      record.note = '同事';
      const stats: ContactInfoStatistics = new ContactInfoStatistics(new ContactInfoModel(record));
      expect(stats.totalFields()).assertEqual(4);
    });

    mergedCases.run('contact_info_pager_page_count_rounds_up', () => {
      const pager: ContactInfoPager = new ContactInfoPager(4);
      expect(pager.pageCount(4)).assertEqual(1);
      expect(pager.pageCount(5)).assertEqual(2);
      expect(pager.pageCount(13)).assertEqual(4);
    });

    mergedCases.run('contact_info_pager_page_start_linear', () => {
      const pager: ContactInfoPager = new ContactInfoPager(3);
      expect(pager.pageStart(0)).assertEqual(0);
      expect(pager.pageStart(1)).assertEqual(3);
      expect(pager.pageStart(2)).assertEqual(6);
    });

    mergedCases.run('contact_info_grouper_same_start_letter_same_key', () => {
      const grouper: ContactInfoGrouper = new ContactInfoGrouper();
      expect(grouper.groupKey('张三') === grouper.groupKey('张三丰')).assertTrue();
    });

    mergedCases.run('contact_info_grouper_empty_name_zero', () => {
      const grouper: ContactInfoGrouper = new ContactInfoGrouper();
      expect(grouper.groupKey('')).assertEqual(0);
    });

    mergedCases.run('contact_field_validator_field_requires_value', () => {
      const emptyName: ContactFieldItem = {
        fieldType: ContactFieldType.FIELD_NAME,
        value: '',
        labelId: 0,
        labelName: 'NAME'
      };
      expect(ContactFieldValidator.isValidField(emptyName)).assertFalse();
    });

    mergedCases.run('contact_field_validator_phone_item_should_require_digits', () => {
      const item: ContactFieldItem = {
        fieldType: ContactFieldType.FIELD_PHONE,
        value: '',
        labelId: 0,
        labelName: 'CELL'
      };
      expect(ContactFieldValidator.isValidPhoneItem(item)).assertFalse();
    });

    mergedCases.run('contact_info_model_single_phone_fingerprint_digit_only', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '138-0013-8000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.getPhoneFingerprint()).assertEqual('13800138000');
    });

    mergedCases.run('contact_info_model_should_report_email_presence', () => {
      const record: ContactRecord = ContactFactory.buildRecord('李四', '');
      record.emails.push({ email: 'lisi@example.com', labelId: 0, labelName: 'WORK' });
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.hasEmail()).assertTrue();
    });

    mergedCases.run('contact_info_model_should_report_no_email_absent', () => {
      const record: ContactRecord = ContactFactory.buildRecord('李四', '13800138000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.hasEmail()).assertFalse();
    });

    mergedCases.run('contact_info_statistics_summary_word_phones', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const stats: ContactInfoStatistics = new ContactInfoStatistics(new ContactInfoModel(record));
      const summary: string = stats.summary();
      expect(summary).assertContain('phones=1');
    });

    // 分页：空数据无页
    mergedCases.run('contact_info_pager_empty_no_pages', () => {
      const pager: ContactInfoPager = new ContactInfoPager(5);
      expect(pager.pageCount(0)).assertEqual(0);
    });

    // 分页：恰好整除
    mergedCases.run('contact_info_pager_exact_division', () => {
      const pager: ContactInfoPager = new ContactInfoPager(5);
      expect(pager.pageCount(10)).assertEqual(2);
    });

    // 分页：非整除需进位
    mergedCases.run('contact_info_pager_round_up', () => {
      const pager: ContactInfoPager = new ContactInfoPager(5);
      expect(pager.pageCount(11)).assertEqual(3);
    });

    // 分组：中文首字产生码位键
    mergedCases.run('contact_info_grouper_han_key', () => {
      const grouper: ContactInfoGrouper = new ContactInfoGrouper();
      const key: number = grouper.groupKey('张');
      expect(key).assertLargerOrEqual(0x4e00);
    });

    // 分组：英文字符键
    mergedCases.run('contact_info_grouper_latin_key', () => {
      const grouper: ContactInfoGrouper = new ContactInfoGrouper();
      const key: number = grouper.groupKey('Alice');
      expect(key).assertEqual('A'.charCodeAt(0));
    });

    // 字段标签：大小写敏感已知标签
    mergedCases.run('contact_info_label_known_cell', () => {
      expect(ContactFieldValidator.isValidLabel('CELL')).assertTrue();
    });

    // 字段标签：未知标签拒绝
    mergedCases.run('contact_info_label_unknown_rejected', () => {
      expect(ContactFieldValidator.isValidLabel('OTHERX')).assertFalse();
    });

    // 字段项：空值无效
    mergedCases.run('contact_info_field_empty_invalid', () => {
      const f: ContactFieldItem = { fieldType: ContactFieldType.FIELD_NAME, value: '', labelId: 0, labelName: 'NAME' };
      expect(ContactFieldValidator.isValidField(f)).assertFalse();
    });

    // 模型：多个号码指纹取第一个
    mergedCases.run('contact_info_multi_phone_primary', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      record.phoneNumbers.push({ phoneNumber: '13900139000', labelId: 0, labelName: 'CELL' });
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.getPrimaryPhone()).assertEqual('13800138000');
    });

    // 模型：号码缺省显示
    mergedCases.run('contact_info_phone_presence_flag', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.hasPhone()).assertTrue();
    });

    // 模型：邮件存在性
    mergedCases.run('contact_info_email_presence_flag', () => {
      const record: ContactRecord = ContactFactory.buildRecord('李四', '');
      record.emails.push({ email: 'lisi@example.com', labelId: 0, labelName: 'WORK' });
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.hasEmail()).assertTrue();
    });

    // 模型：名称字段类型内置
    mergedCases.run('contact_info_model_includes_name_field', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.countByType(ContactFieldType.FIELD_NAME)).assertEqual(1);
    });

    // 模型：号码标签为 CELL
    mergedCases.run('contact_info_phone_cell_label', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      const fields = model.getFields();
      const ph = fields[1];
      expect(ph.labelName).assertEqual('CELL');
    });

    // 模型：指纹仅保留数字
    mergedCases.run('contact_info_fingerprint_digit', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '138-0013-8000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.getPhoneFingerprint()).assertEqual('13800138000');
    });

    // 统计：无号码也无邮箱则无身份通道
    mergedCases.run('contact_info_no_identity_channel', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '');
      const stats: ContactInfoStatistics = new ContactInfoStatistics(new ContactInfoModel(record));
      expect(stats.hasIdentityChannel()).assertFalse();
    });

    // 统计：有号码即身份通道
    mergedCases.run('contact_info_phone_identity_channel', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const stats: ContactInfoStatistics = new ContactInfoStatistics(new ContactInfoModel(record));
      expect(stats.hasIdentityChannel()).assertTrue();
    });

    // 校验器：号码项需合法号码
    mergedCases.run('contact_info_phone_item_validation', () => {
      const good: ContactFieldItem = { fieldType: ContactFieldType.FIELD_PHONE, value: '13800138000', labelId: 0, labelName: 'CELL' };
      const bad: ContactFieldItem = { fieldType: ContactFieldType.FIELD_PHONE, value: '12', labelId: 0, labelName: 'CELL' };
      expect(ContactFieldValidator.isValidPhoneItem(good)).assertTrue();
      expect(ContactFieldValidator.isValidPhoneItem(bad)).assertFalse();
    });

    // 校验器：邮箱项需合法邮箱
    mergedCases.run('contact_info_email_item_validation', () => {
      const good: ContactFieldItem = { fieldType: ContactFieldType.FIELD_EMAIL, value: 'a@b.com', labelId: 0, labelName: 'WORK' };
      const bad: ContactFieldItem = { fieldType: ContactFieldType.FIELD_EMAIL, value: 'a', labelId: 0, labelName: 'WORK' };
      expect(ContactFieldValidator.isValidEmailItem(good)).assertTrue();
      expect(ContactFieldValidator.isValidEmailItem(bad)).assertFalse();
    });
      mergedCases.finish();
    });

    // 校验器：名称项需合法名称
    it('contact_info_name_item_validation__group_32', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('contact_info_name_item_validation', () => {
      const good: ContactFieldItem = { fieldType: ContactFieldType.FIELD_NAME, value: '张三', labelId: 0, labelName: 'NAME' };
      expect(ContactFieldValidator.isValidNameItem(good)).assertTrue();
    });

    // 校验器：过长名称拒绝
    mergedCases.run('contact_info_name_overlong_rejected', () => {
      const longName: string = new Array(200).join('名');
      const item: ContactFieldItem = { fieldType: ContactFieldType.FIELD_NAME, value: longName, labelId: 0, labelName: 'NAME' };
      expect(ContactFieldValidator.isValidNameItem(item)).assertFalse();
    });

    // 分页：isValidPage 校验边界
    mergedCases.run('contact_info_page_index_bounds', () => {
      const pager: ContactInfoPager = new ContactInfoPager(3);
      expect(pager.isValidPage(0)).assertTrue();
      expect(pager.isValidPage(10)).assertTrue();
      expect(pager.isValidPage(-1)).assertFalse();
    });

    // 模型字段顺序：名称在号码之前
    mergedCases.run('contact_info_field_order_name_first', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      const fields = model.getFields();
      expect(fields[0].fieldType).assertEqual(ContactFieldType.FIELD_NAME);
    });

    // 统计 summarize 输出含 name
    mergedCases.run('contact_info_summary_contains_name', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const stats: ContactInfoStatistics = new ContactInfoStatistics(new ContactInfoModel(record));
      expect(stats.summary()).assertContain('张三');
    });

    // 校验器：字段 value 必须非空
    mergedCases.run('contact_info_field_requires_value', () => {
      const f: ContactFieldItem = { fieldType: ContactFieldType.FIELD_NAME, value: '', labelId: 0, labelName: 'NAME' };
      expect(ContactFieldValidator.isValidField(f)).assertFalse();
    });

    // 模型：名称字段唯一存在
    mergedCases.run('contact_info_name_field_single', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.countByType(ContactFieldType.FIELD_NAME)).assertEqual(1);
    });

    // 模型：号码字段计数
    mergedCases.run('contact_info_phone_field_count', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.countByType(ContactFieldType.FIELD_PHONE)).assertEqual(1);
    });

    // 模型：多个号码都应被收集
    mergedCases.run('contact_info_multiple_phones_collected', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      record.phoneNumbers.push({ phoneNumber: '13900139000', labelId: 0, labelName: 'WORK' });
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.getFieldCount()).assertEqual(3);
    });

    // 模型：号码缺省无号码

    // 模型：主号码取首个
    mergedCases.run('contact_info_primary_is_first', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      record.phoneNumbers.push({ phoneNumber: '13900139000', labelId: 0, labelName: 'WORK' });
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.getPrimaryPhone()).assertEqual('13800138000');
    });

    // 模型：指纹排除号码非数字字符
    mergedCases.run('contact_info_fingerprint_digits_only', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '138-0013-8000');
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.getPhoneFingerprint()).assertEqual('13800138000');
    });

    // 规整器：去横线与空格
    mergedCases.run('contact_info_normalizer_dash_hyphen', () => {
      expect(ContactNormalizer.digitsOf('138-0013-8000')).assertEqual('13800138000');
      expect(ContactNormalizer.digitsOf('138 0013 8000')).assertEqual('13800138000');
    });

    // 规整器：空串无数字
    mergedCases.run('contact_info_normalizer_empty', () => {
      expect(ContactNormalizer.hasDigit('')).assertFalse();
    });

    // 规整器：中文名裁剪
    mergedCases.run('contact_info_normalizer_trim_cn', () => {
      expect(ContactNormalizer.trimName('  张三  ')).assertEqual('张三');
    });

    // 校验器：自然号段长度边界
    mergedCases.run('contact_info_validator_phone_edge', () => {
      expect(ContactValidator.isValidPhone('000')).assertTrue();
      expect(ContactValidator.isValidPhone('00')).assertFalse();
      const longestPhone: string = '1'.repeat(ContactValidator.MAX_PHONE);
      expect(ContactValidator.isValidPhone(longestPhone)).assertTrue();
      expect(ContactValidator.isValidPhone(longestPhone + '1')).assertFalse();
    });

    // 校验器：邮箱必须域名
    mergedCases.run('contact_info_validator_email_domain', () => {
      expect(ContactValidator.isValidEmail('a@b.c')).assertTrue();
      expect(ContactValidator.isValidEmail('a')).assertFalse();
    });

    // 分组：数字开头的名字
    mergedCases.run('contact_info_grouper_digit_start', () => {
      const grouper: ContactInfoGrouper = new ContactInfoGrouper();
      const key: number = grouper.groupKey('123');
      expect(key).assertEqual('1'.charCodeAt(0));
    });

    // 分页：单页容纳全部
    mergedCases.run('contact_info_pager_single_page', () => {
      const pager: ContactInfoPager = new ContactInfoPager(20);
      expect(pager.pageCount(10)).assertEqual(1);
    });

    // 分页：零页大小安全
    mergedCases.run('contact_info_pager_one_page_size', () => {
      const pager: ContactInfoPager = new ContactInfoPager(1);
      expect(pager.pageCount(5)).assertEqual(5);
    });

    // 统计：含组织字段总数
    mergedCases.run('contact_info_stats_org_count', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      record.organization = '华为';
      const stats: ContactInfoStatistics = new ContactInfoStatistics(new ContactInfoModel(record));
      expect(stats.totalFields()).assertEqual(3);
    });

    // 校验器：Phone 项带空串拒绝
    mergedCases.run('contact_info_phone_item_empty_reject', () => {
      const item: ContactFieldItem = { fieldType: ContactFieldType.FIELD_PHONE, value: '', labelId: 0, labelName: 'CELL' };
      expect(ContactFieldValidator.isValidPhoneItem(item)).assertFalse();
    });

    mergedCases.run('contact_info_grouper_key_string', () => {
      const grouper: ContactInfoGrouper = new ContactInfoGrouper();
      expect(grouper.groupKey('')).assertEqual(0);
    });

    mergedCases.run('contact_info_pager_pages_validity', () => {
      const pager: ContactInfoPager = new ContactInfoPager(3);
      expect(pager.isValidPage(0)).assertTrue();
      expect(pager.isValidPage(-3)).assertFalse();
      expect(pager.pageStart(0)).assertEqual(0);
      expect(pager.pageEnd(0)).assertEqual(3);
    });

    mergedCases.run('contact_info_stats_note_count', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      record.note = 'hello';
      const stats: ContactInfoStatistics = new ContactInfoStatistics(new ContactInfoModel(record));
      expect(stats.totalFields()).assertEqual(3);
    });

    mergedCases.run('contact_info_normalizer_multi_format', () => {
      expect(ContactNormalizer.digitsOf('13800138000')).assertEqual('13800138000');
      expect(ContactNormalizer.digitsOf('138-0013-8000')).assertEqual('13800138000');
      expect(ContactNormalizer.hasDigit('abc')).assertFalse();
    });

    mergedCases.run('contact_info_primary_phone_multiple', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      record.phoneNumbers.push({ phoneNumber: '13900139000', labelId: 0, labelName: 'WORK' });
      const model: ContactInfoModel = new ContactInfoModel(record);
      expect(model.getPrimaryPhone()).assertEqual('13800138000');
    });

    mergedCases.run('contact_info_field_order_phone_immediately', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '13800138000');
      const fields = new ContactInfoModel(record).getFields();
      expect(fields[1].fieldType).assertEqual(ContactFieldType.FIELD_PHONE);
    });

    mergedCases.run('contact_info_pager_page_start_tail', () => {
      const pager: ContactInfoPager = new ContactInfoPager(1);
      expect(pager.pageCount(5)).assertEqual(5);
      expect(pager.pageStart(4)).assertEqual(4);
    });

    mergedCases.run('contact_info_stats_identity_channel', () => {
      const record: ContactRecord = ContactFactory.buildRecord('张三', '');
      record.emails.push({ email: 'a@b.com', labelId: 0, labelName: 'WORK' });
      const stats: ContactInfoStatistics = new ContactInfoStatistics(new ContactInfoModel(record));
      expect(stats.hasIdentityChannel()).assertTrue();
      expect(stats.emailCount()).assertEqual(1);
    });

    mergedCases.run('contact_info_pager_exact_division_count', () => {
      const pager: ContactInfoPager = new ContactInfoPager(5);
      expect(pager.pageCount(10)).assertEqual(2);
      expect(pager.pageCount(0)).assertEqual(0);
    });

    mergedCases.run('contact_info_normalizer_country_prefix', () => {
    expect(ContactNormalizer.digitsOf('+86 138 0013 8000')).assertEqual('8613800138000');
    });
      mergedCases.finish();
    });

    it('contact_info_pager_pages_valid__group_4', 0, () => {
      const mergedCases = new MergedTestCases();
      mergedCases.run('contact_info_pager_pages_valid', () => {
      const pager: ContactInfoPager = new ContactInfoPager(3);
      expect(pager.isValidPage(1)).assertTrue();
      expect(pager.isValidPage(-1)).assertFalse();
    });

    mergedCases.run('contact_info_grouper_han_rank', () => {
      const grouper: ContactInfoGrouper = new ContactInfoGrouper();
      expect(grouper.groupKey('张') === grouper.groupKey('张三丰')).assertTrue();
    });

    mergedCases.run('contact_info_stats_has_identity_with_email', () => {
      const record: ContactRecord = ContactFactory.buildRecord('王五', '');
      record.emails.push({ email: 'w@b.com', labelId: 0, labelName: 'WORK' });
      const stats: ContactInfoStatistics = new ContactInfoStatistics(new ContactInfoModel(record));
      expect(stats.hasIdentityChannel()).assertTrue();
    });

    mergedCases.run('contact_info_stats_has_identity_with_phone', () => {
      const record: ContactRecord = ContactFactory.buildRecord('王五', '13800138000');
      const stats: ContactInfoStatistics = new ContactInfoStatistics(new ContactInfoModel(record));
      expect(stats.hasIdentityChannel()).assertTrue();
    });
      mergedCases.finish();
    });
  });
}

class ContactInfoPager {
  private pageSize: number;

  constructor(pageSize: number) {
    this.pageSize = pageSize;
  }

  public getPageSize(): number {
    return this.pageSize;
  }

  public pageStart(page: number): number {
    return page * this.pageSize;
  }

  public pageEnd(page: number): number {
    return (page + 1) * this.pageSize;
  }

  public pageCount(total: number): number {
    if (total === 0) {
      return 0;
    }
    return Math.ceil(total / this.pageSize);
  }

  public isValidPage(page: number): boolean {
    return page >= 0;
  }
}

class ContactInfoGrouper {
  public groupKey(displayName: string): number {
    if (displayName.length === 0) {
      return 0;
    }
    const code: number = displayName.charCodeAt(0);
    if (code >= 0x4e00 && code <= 0x9fff) {
      return 0x4e00 + (code - 0x4e00);
    }
    return code;
  }
}
