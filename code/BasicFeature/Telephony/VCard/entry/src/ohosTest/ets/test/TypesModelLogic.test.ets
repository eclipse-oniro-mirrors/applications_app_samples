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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  CapabilityCheck,
  ContactLoadState,
  ContactSummary,
  ContactDraft,
  HistoryAction,
  HistoryEntry,
  HistoryStats,
  ImportResult,
  ExportResult,
  PickedFile,
  PermissionState,
  VCardCard,
  VCardConstants,
  VCardPreview,
  VCardSettings,
  VersionChoice,
  createVersionChoices
} from 'library';

const DOMAIN: number = 0xF811;

export default function typesModelLogicTest() {
  describe('TypesModelLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_0100
     * @tc.name      testContactLoadStateEnum0001
     * @tc.desc      Verify the ContactLoadState enum exposes the exact ordinal
     *               values from IDLE through ERROR required by UI state code.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testContactLoadStateEnum0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testContactLoadStateEnum0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ContactLoadState.IDLE).assertEqual(0);
      expect(ContactLoadState.LOADING).assertEqual(1);
      expect(ContactLoadState.READY).assertEqual(2);
      expect(ContactLoadState.DENIED).assertEqual(3);
      expect(ContactLoadState.ERROR).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_0200
     * @tc.name      testHistoryActionEnum0001
     * @tc.desc      Verify the HistoryAction enum assigns IMPORT 0 through
     *               DELETE 4 so history rows encode actions consistently.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testHistoryActionEnum0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testHistoryActionEnum0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(HistoryAction.IMPORT).assertEqual(0);
      expect(HistoryAction.EXPORT).assertEqual(1);
      expect(HistoryAction.CREATE).assertEqual(2);
      expect(HistoryAction.UPDATE).assertEqual(3);
      expect(HistoryAction.DELETE).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_0300
     * @tc.name      testContactSummaryDefault0001
     * @tc.desc      Verify a fresh ContactSummary carries id -1, the hash
     *               initial placeholder and empty text plus array fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testContactSummaryDefault0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testContactSummaryDefault0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const summary: ContactSummary = new ContactSummary();
      expect(summary.id).assertEqual(-1);
      expect(summary.key).assertEqual('');
      expect(summary.fullName).assertEqual('');
      expect(summary.initial).assertEqual('#');
      expect(summary.organization).assertEqual('');
      expect(summary.jobTitle).assertEqual('');
      expect(summary.note).assertEqual('');
      expect(summary.phones.length).assertEqual(0);
      expect(summary.emails.length).assertEqual(0);
      expect(summary.addresses.length).assertEqual(0);
      expect(summary.websites.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_0400
     * @tc.name      testContactSummaryAssign0001
     * @tc.desc      Verify every ContactSummary field round-trips an assigned
     *               value and appended list items keep insertion order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testContactSummaryAssign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testContactSummaryAssign0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const summary: ContactSummary = new ContactSummary();
      summary.id = 12;
      summary.key = 'preview_12';
      summary.fullName = 'Hao Yun';
      summary.initial = 'H';
      summary.organization = 'Cloud Studio';
      summary.jobTitle = 'Illustrator';
      summary.note = 'assigned';
      summary.phones.push('+8613500001234');
      summary.emails.push('hao.yun@studio.example');
      summary.addresses.push('9 Park Road City');
      summary.websites.push('https://studio.example/hao');
      expect(summary.id).assertEqual(12);
      expect(summary.key).assertEqual('preview_12');
      expect(summary.fullName).assertEqual('Hao Yun');
      expect(summary.initial).assertEqual('H');
      expect(summary.organization).assertEqual('Cloud Studio');
      expect(summary.jobTitle).assertEqual('Illustrator');
      expect(summary.note).assertEqual('assigned');
      expect(summary.phones[0]).assertEqual('+8613500001234');
      expect(summary.emails[0]).assertEqual('hao.yun@studio.example');
      expect(summary.addresses[0]).assertEqual('9 Park Road City');
      expect(summary.websites[0]).assertEqual('https://studio.example/hao');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_0500
     * @tc.name      testContactDraftDefault0001
     * @tc.desc      Verify a new ContactDraft starts with six empty string
     *               fields ready for the manual create form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testContactDraftDefault0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testContactDraftDefault0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const draft: ContactDraft = new ContactDraft();
      expect(draft.fullName).assertEqual('');
      expect(draft.phone).assertEqual('');
      expect(draft.email).assertEqual('');
      expect(draft.organization).assertEqual('');
      expect(draft.jobTitle).assertEqual('');
      expect(draft.note).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_0600
     * @tc.name      testContactDraftAssign0001
     * @tc.desc      Verify ContactDraft fields accept CJK and mixed values and
     *               read back exactly what the form assigned.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testContactDraftAssign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testContactDraftAssign0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const draft: ContactDraft = new ContactDraft();
      draft.fullName = '王小明';
      draft.phone = '+8613800009876';
      draft.email = 'xm.wang@mail.example';
      draft.organization = '云途科技';
      draft.jobTitle = '研发工程师';
      draft.note = '来自表单';
      expect(draft.fullName).assertEqual('王小明');
      expect(draft.phone).assertEqual('+8613800009876');
      expect(draft.email).assertEqual('xm.wang@mail.example');
      expect(draft.organization).assertEqual('云途科技');
      expect(draft.jobTitle).assertEqual('研发工程师');
      expect(draft.note).assertEqual('来自表单');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_0700
     * @tc.name      testPermissionStateDefault0001
     * @tc.desc      Verify a new PermissionState reports an empty name and both
     *               declared and granted flags cleared to false.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPermissionStateDefault0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testPermissionStateDefault0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const state: PermissionState = new PermissionState();
      expect(state.name).assertEqual('');
      expect(state.declared).assertFalse();
      expect(state.granted).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_0800
     * @tc.name      testPermissionStateAssign0001
     * @tc.desc      Verify PermissionState flags flip to true independently and
     *               the permission name round-trips the assigned string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPermissionStateAssign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testPermissionStateAssign0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const state: PermissionState = new PermissionState();
      state.name = VCardConstants.READ_CONTACTS;
      state.declared = true;
      expect(state.name).assertEqual('ohos.permission.READ_CONTACTS');
      expect(state.declared).assertTrue();
      expect(state.granted).assertFalse();
      state.granted = true;
      expect(state.granted).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_0900
     * @tc.name      testVCardCardDefault0001
     * @tc.desc      Verify a fresh VCardCard keeps every text field empty and
     *               every list field at zero length before parsing fills it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testVCardCardDefault0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testVCardCardDefault0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: VCardCard = new VCardCard();
      expect(card.fullName).assertEqual('');
      expect(card.organization).assertEqual('');
      expect(card.jobTitle).assertEqual('');
      expect(card.note).assertEqual('');
      expect(card.version).assertEqual('');
      expect(card.phones.length).assertEqual(0);
      expect(card.emails.length).assertEqual(0);
      expect(card.addresses.length).assertEqual(0);
      expect(card.websites.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_1000
     * @tc.name      testVCardCardAssign0001
     * @tc.desc      Verify VCardCard fields and lists round-trip assigned and
     *               appended values in stable insertion order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testVCardCardAssign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testVCardCardAssign0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: VCardCard = new VCardCard();
      card.fullName = 'Mei Lin';
      card.organization = 'Aurora Lab';
      card.jobTitle = 'Researcher';
      card.note = 'model case';
      card.version = '3.0';
      card.phones.push('+8613100001234');
      card.phones.push('+8613100005678');
      card.emails.push('mei.lin@aurora.example');
      card.addresses.push('3 Star Avenue City');
      card.websites.push('https://aurora.example/mei');
      expect(card.fullName).assertEqual('Mei Lin');
      expect(card.organization).assertEqual('Aurora Lab');
      expect(card.jobTitle).assertEqual('Researcher');
      expect(card.note).assertEqual('model case');
      expect(card.version).assertEqual('3.0');
      expect(card.phones.length).assertEqual(2);
      expect(card.phones[1]).assertEqual('+8613100005678');
      expect(card.emails[0]).assertEqual('mei.lin@aurora.example');
      expect(card.addresses[0]).assertEqual('3 Star Avenue City');
      expect(card.websites[0]).assertEqual('https://aurora.example/mei');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_1100
     * @tc.name      testVCardPreviewDefault0001
     * @tc.desc      Verify a fresh VCardPreview leaves counters, texts and the
     *               card list cleared so pages can render blank previews.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testVCardPreviewDefault0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testVCardPreviewDefault0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = new VCardPreview();
      expect(preview.fileName).assertEqual('');
      expect(preview.filePath).assertEqual('');
      expect(preview.content).assertEqual('');
      expect(preview.versionText).assertEqual('');
      expect(preview.errorMessage).assertEqual('');
      expect(preview.sizeBytes).assertEqual(0);
      expect(preview.cardCount).assertEqual(0);
      expect(preview.phoneCount).assertEqual(0);
      expect(preview.emailCount).assertEqual(0);
      expect(preview.organizationCount).assertEqual(0);
      expect(preview.addressCount).assertEqual(0);
      expect(preview.cards.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_1200
     * @tc.name      testVCardPreviewAssign0001
     * @tc.desc      Verify VCardPreview counters and nested cards keep assigned
     *               values including a pushed card readable by index.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testVCardPreviewAssign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testVCardPreviewAssign0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = new VCardPreview();
      preview.fileName = 'assigned.vcf';
      preview.filePath = '/data/storage/assigned.vcf';
      preview.content = 'BEGIN:VCARD';
      preview.versionText = '3.0';
      preview.sizeBytes = 64;
      preview.cardCount = 1;
      preview.phoneCount = 1;
      preview.emailCount = 1;
      preview.organizationCount = 1;
      preview.addressCount = 1;
      const card: VCardCard = new VCardCard();
      card.fullName = 'Nested Card';
      preview.cards.push(card);
      expect(preview.fileName).assertEqual('assigned.vcf');
      expect(preview.filePath).assertEqual('/data/storage/assigned.vcf');
      expect(preview.content).assertEqual('BEGIN:VCARD');
      expect(preview.versionText).assertEqual('3.0');
      expect(preview.sizeBytes).assertEqual(64);
      expect(preview.cardCount).assertEqual(1);
      expect(preview.cards[0].fullName).assertEqual('Nested Card');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_1300
     * @tc.name      testPickedFileModel0001
     * @tc.desc      Verify PickedFile defaults to empty strings and zero size
     *               then round-trips picker results without transformation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPickedFileModel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPickedFileModel0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: PickedFile = new PickedFile();
      expect(empty.uri).assertEqual('');
      expect(empty.name).assertEqual('');
      expect(empty.sizeBytes).assertEqual(0);
      const picked: PickedFile = new PickedFile();
      picked.uri = 'file://docs/import/contacts.vcf';
      picked.name = 'contacts.vcf';
      picked.sizeBytes = 2048;
      expect(picked.uri).assertEqual('file://docs/import/contacts.vcf');
      expect(picked.name).assertEqual('contacts.vcf');
      expect(picked.sizeBytes).assertEqual(2048);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_1400
     * @tc.name      testImportResultDefault0001
     * @tc.desc      Verify a new ImportResult is unsuccessful with zero code,
     *               message and card count until the import service fills it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImportResultDefault0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testImportResultDefault0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const result: ImportResult = new ImportResult();
      expect(result.success).assertFalse();
      expect(result.code).assertEqual(0);
      expect(result.message).assertEqual('');
      expect(result.filePath).assertEqual('');
      expect(result.fileName).assertEqual('');
      expect(result.cardCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_1500
     * @tc.name      testImportResultAssign0001
     * @tc.desc      Verify ImportResult assignment records success, the system
     *               error code, the source paths and the parsed card count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testImportResultAssign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testImportResultAssign0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const result: ImportResult = new ImportResult();
      result.success = true;
      result.code = 8300003;
      result.message = 'imported';
      result.filePath = '/data/vcard/import/in.vcf';
      result.fileName = 'in.vcf';
      result.cardCount = 3;
      expect(result.success).assertTrue();
      expect(result.code).assertEqual(8300003);
      expect(result.message).assertEqual('imported');
      expect(result.filePath).assertEqual('/data/vcard/import/in.vcf');
      expect(result.fileName).assertEqual('in.vcf');
      expect(result.cardCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_1600
     * @tc.name      testExportResultDefault0001
     * @tc.desc      Verify a new ExportResult starts fully cleared including
     *               content, byte size and requested card count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testExportResultDefault0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testExportResultDefault0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const result: ExportResult = new ExportResult();
      expect(result.success).assertFalse();
      expect(result.code).assertEqual(0);
      expect(result.message).assertEqual('');
      expect(result.filePath).assertEqual('');
      expect(result.content).assertEqual('');
      expect(result.bytes).assertEqual(0);
      expect(result.cardCount).assertEqual(0);
      expect(result.requestedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_1700
     * @tc.name      testExportResultAssign0001
     * @tc.desc      Verify ExportResult round-trips payload content, byte size
     *               and both actual and requested card counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testExportResultAssign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testExportResultAssign0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const result: ExportResult = new ExportResult();
      result.success = true;
      result.code = 201;
      result.message = 'exported';
      result.filePath = '/data/vcard/export/out.vcf';
      result.content = 'BEGIN:VCARD\r\nEND:VCARD\r\n';
      result.bytes = 26;
      result.cardCount = 1;
      result.requestedCount = 1;
      expect(result.success).assertTrue();
      expect(result.code).assertEqual(201);
      expect(result.message).assertEqual('exported');
      expect(result.filePath).assertEqual('/data/vcard/export/out.vcf');
      expect(result.content).assertEqual('BEGIN:VCARD\r\nEND:VCARD\r\n');
      expect(result.bytes).assertEqual(26);
      expect(result.cardCount).assertEqual(1);
      expect(result.requestedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_1800
     * @tc.name      testVCardSettingsDefault0001
     * @tc.desc      Verify VCardSettings defaults to version index 0, UTF-8
     *               charset, auto jump enabled and a 20 entry history limit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testVCardSettingsDefault0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testVCardSettingsDefault0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      expect(settings.defaultVersion).assertEqual(0);
      expect(settings.defaultCharset).assertEqual('UTF-8');
      expect(settings.autoJumpToContacts).assertTrue();
      expect(settings.historyLimit).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_1900
     * @tc.name      testVCardSettingsAssign0001
     * @tc.desc      Verify settings accept a history limit from the shipped
     *               option list and charset switching to GBK round-trips.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVCardSettingsAssign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testVCardSettingsAssign0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      settings.defaultVersion = 2;
      settings.defaultCharset = VCardConstants.CHARSET_GBK;
      settings.autoJumpToContacts = false;
      settings.historyLimit = 50;
      expect(settings.defaultVersion).assertEqual(2);
      expect(settings.defaultCharset).assertEqual('GBK');
      expect(settings.autoJumpToContacts).assertFalse();
      expect(settings.historyLimit).assertEqual(50);
      const options: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      let found: boolean = false;
      for (let i = 0; i < options.length; i++) {
        if (options[i] === 50) {
          found = true;
        }
      }
      expect(found).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_2000
     * @tc.name      testHistoryEntryDefault0001
     * @tc.desc      Verify a new HistoryEntry defaults to an IMPORT action with
     *               empty target, zero counts and an unsuccessful flag.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testHistoryEntryDefault0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testHistoryEntryDefault0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entry: HistoryEntry = new HistoryEntry();
      expect(entry.id).assertEqual('');
      expect(entry.action).assertEqual(0);
      expect(entry.target).assertEqual('');
      expect(entry.cardCount).assertEqual(0);
      expect(entry.success).assertFalse();
      expect(entry.code).assertEqual(0);
      expect(entry.timestamp).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_2100
     * @tc.name      testHistoryEntryAssign0001
     * @tc.desc      Verify HistoryEntry stores the EXPORT action ordinal plus
     *               target text, counters and a millisecond timestamp.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testHistoryEntryAssign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testHistoryEntryAssign0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entry: HistoryEntry = new HistoryEntry();
      entry.id = 'h_0001';
      entry.action = HistoryAction.EXPORT;
      entry.target = 'out.vcf';
      entry.cardCount = 5;
      entry.success = true;
      entry.code = 0;
      entry.timestamp = 1770000000000;
      expect(entry.id).assertEqual('h_0001');
      expect(entry.action).assertEqual(1);
      expect(entry.target).assertEqual('out.vcf');
      expect(entry.cardCount).assertEqual(5);
      expect(entry.success).assertTrue();
      expect(entry.timestamp).assertEqual(1770000000000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_2200
     * @tc.name      testHistoryStatsModel0001
     * @tc.desc      Verify HistoryStats starts with all five counters at zero
     *               so the history page shows an empty summary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testHistoryStatsModel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testHistoryStatsModel0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stats: HistoryStats = new HistoryStats();
      expect(stats.total).assertEqual(0);
      expect(stats.importCount).assertEqual(0);
      expect(stats.exportCount).assertEqual(0);
      expect(stats.contactCount).assertEqual(0);
      expect(stats.successCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_2300
     * @tc.name      testHistoryStatsAssign0001
     * @tc.desc      Verify HistoryStats counters round-trip assigned values and
     *               stay ordered with success below total.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryStatsAssign0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryStatsAssign0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stats: HistoryStats = new HistoryStats();
      stats.total = 10;
      stats.importCount = 6;
      stats.exportCount = 4;
      stats.contactCount = 42;
      stats.successCount = 8;
      expect(stats.total).assertEqual(10);
      expect(stats.importCount).assertEqual(6);
      expect(stats.exportCount).assertEqual(4);
      expect(stats.contactCount).assertEqual(42);
      expect(stats.successCount).assertEqual(8);
      expect(stats.successCount).assertLess(stats.total);
      expect(stats.importCount + stats.exportCount).assertEqual(stats.total);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_2400
     * @tc.name      testVersionChoiceFactory0001
     * @tc.desc      Verify createVersionChoices returns the three shipped
     *               choices with ordered values, labels and resource details.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVersionChoiceFactory0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testVersionChoiceFactory0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const choices: VersionChoice[] = createVersionChoices();
      expect(choices.length).assertEqual(3);
      expect(choices[0].value).assertEqual(0);
      expect(choices[0].label).assertEqual('2.1');
      expect(choices[1].value).assertEqual(1);
      expect(choices[1].label).assertEqual('3.0');
      expect(choices[2].value).assertEqual(2);
      expect(choices[2].label).assertEqual('4.0');
      expect(choices[0].description).not().assertNull();
      expect(choices[1].description).not().assertNull();
      expect(choices[2].description).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_2500
     * @tc.name      testVersionChoiceCtor0001
     * @tc.desc      Verify the VersionChoice constructor stores value, label
     *               and description exactly as supplied by callers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVersionChoiceCtor0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testVersionChoiceCtor0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const choice: VersionChoice = new VersionChoice(9, '9.9', 'future draft');
      expect(choice.value).assertEqual(9);
      expect(choice.label).assertEqual('9.9');
      expect(choice.description).assertEqual('future draft');
      const second: VersionChoice = new VersionChoice(1, '3.0', 'text detail');
      expect(second.value).assertEqual(1);
      expect(second.label).assertEqual('3.0');
      expect(second.description).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_2600
     * @tc.name      testCapabilityCheckModel0001
     * @tc.desc      Verify CapabilityCheck keeps key, name, supported flag and
     *               detail for both supported and unsupported outcomes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCapabilityCheckModel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCapabilityCheckModel0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const ok: CapabilityCheck = new CapabilityCheck('vcf_import', 'vCard Import', true, 'available');
      expect(ok.key).assertEqual('vcf_import');
      expect(ok.name).assertEqual('vCard Import');
      expect(ok.supported).assertTrue();
      expect(ok.detail).assertEqual('available');
      const bad: CapabilityCheck = new CapabilityCheck('gbk_decode', 'GBK Decode', false, 'missing');
      expect(bad.key).assertEqual('gbk_decode');
      expect(bad.supported).assertFalse();
      expect(bad.detail).assertEqual('missing');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_2700
     * @tc.name      testConstantsCrossCheck0001
     * @tc.desc      Verify the shipped VCardConstants values match the values
     *               the parser, services and pages rely on today.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConstantsCrossCheck0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testConstantsCrossCheck0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.PREVIEW_CARD_LIMIT).assertEqual(20);
      expect(VCardConstants.PREVIEW_LINE_LIMIT).assertEqual(24);
      expect(VCardConstants.DEFAULT_HISTORY_LIMIT).assertEqual(20);
      expect(VCardConstants.HISTORY_LIMIT_MAX).assertEqual(100);
      expect(VCardConstants.MAX_FILE_BYTES).assertEqual(2097152);
      expect(VCardConstants.CHARSET_UTF8).assertEqual('UTF-8');
      expect(VCardConstants.CHARSET_GBK).assertEqual('GBK');
      expect(VCardConstants.VCARD_DIR).assertEqual('vcard');
      expect(VCardConstants.IMPORT_DIR).assertEqual('import');
      expect(VCardConstants.EXPORT_DIR).assertEqual('export');
      expect(VCardConstants.SAMPLE_FILE_NAME).assertEqual('sample_contacts.vcf');
      expect(VCardConstants.PREFERENCE_SETTINGS).assertEqual('vcard_settings');
      expect(VCardConstants.PREFERENCE_HISTORY).assertEqual('vcard_history');
      expect(VCardConstants.READ_CONTACTS).assertEqual('ohos.permission.READ_CONTACTS');
      expect(VCardConstants.WRITE_CONTACTS).assertEqual('ohos.permission.WRITE_CONTACTS');
      expect(VCardConstants.VCARD_SYSCAP).assertEqual('SystemCapability.Telephony.CoreService');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_2800
     * @tc.name      testHistoryLimitOptions0001
     * @tc.desc      Verify the history limit option list contains exactly the
     *               four shipped sizes in ascending order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryLimitOptions0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryLimitOptions0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const options: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      expect(options.length).assertEqual(4);
      expect(options[0]).assertEqual(5);
      expect(options[1]).assertEqual(10);
      expect(options[2]).assertEqual(20);
      expect(options[3]).assertEqual(50);
      expect(options[3]).assertLarger(options[2]);
      expect(options[1]).assertLarger(options[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_2900
     * @tc.name      testVCardCardArrayOps0001
     * @tc.desc      Verify pushing several values into VCardCard list fields
     *               keeps order and length for every collection type.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVCardCardArrayOps0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testVCardCardArrayOps0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const card: VCardCard = new VCardCard();
      card.phones.push('111');
      card.phones.push('222');
      card.phones.push('333');
      card.emails.push('one@example.cn');
      card.emails.push('two@example.cn');
      card.addresses.push('Home');
      card.addresses.push('Work');
      card.websites.push('http://site.example.cn');
      expect(card.phones.length).assertEqual(3);
      expect(card.phones[1]).assertEqual('222');
      expect(card.emails.length).assertEqual(2);
      expect(card.emails[0]).assertEqual('one@example.cn');
      expect(card.addresses.length).assertEqual(2);
      expect(card.addresses[1]).assertEqual('Work');
      expect(card.websites.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_3000
     * @tc.name      testContactSummaryCopyShape0001
     * @tc.desc      Verify ContactSummary array fields can be replaced by a
     *               fresh empty list and then refilled without stale entries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testContactSummaryCopyShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testContactSummaryCopyShape0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const contact: ContactSummary = new ContactSummary();
      contact.phones.push('legacy');
      expect(contact.phones.length).assertEqual(1);
      const fresh: string[] = [];
      contact.phones = fresh;
      expect(contact.phones.length).assertEqual(0);
      contact.phones.push('new');
      expect(contact.phones.length).assertEqual(1);
      expect(contact.phones[0]).assertEqual('new');
      expect(contact.fullName).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_3100
     * @tc.name      testHistoryEntryActionCycle0001
     * @tc.desc      Verify HistoryEntry.action accepts every HistoryAction
     *               value and stores the exact ordinal per assignment.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryEntryActionCycle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryEntryActionCycle0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entry: HistoryEntry = new HistoryEntry();
      entry.action = HistoryAction.IMPORT;
      expect(entry.action).assertEqual(0);
      entry.action = HistoryAction.CREATE;
      expect(entry.action).assertEqual(2);
      entry.action = HistoryAction.UPDATE;
      expect(entry.action).assertEqual(3);
      entry.action = HistoryAction.DELETE;
      expect(entry.action).assertEqual(4);
      expect(HistoryAction.EXPORT).assertEqual(1);
      expect(HistoryAction.DELETE).assertLarger(HistoryAction.IMPORT);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_3200
     * @tc.name      testVCardPreviewCounters0001
     * @tc.desc      Verify VCardPreview counters are independent storage slots
     *               that each keep their own assigned value on readback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVCardPreviewCounters0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testVCardPreviewCounters0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = new VCardPreview();
      preview.cardCount = 25;
      preview.phoneCount = 30;
      preview.emailCount = 12;
      preview.organizationCount = 7;
      preview.addressCount = 9;
      preview.sizeBytes = 2048;
      expect(preview.cardCount).assertEqual(25);
      expect(preview.phoneCount).assertEqual(30);
      expect(preview.emailCount).assertEqual(12);
      expect(preview.organizationCount).assertEqual(7);
      expect(preview.addressCount).assertEqual(9);
      expect(preview.sizeBytes).assertEqual(2048);
      expect(preview.phoneCount).assertLarger(preview.cardCount);
      expect(preview.emailCount).assertLess(preview.cardCount);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_3300
     * @tc.name      testPermissionStateToggle0001
     * @tc.desc      Verify PermissionState flags can represent the mixed
     *               declared-but-not-granted state and then flip to granted.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStateToggle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStateToggle0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const state: PermissionState = new PermissionState();
      state.name = 'ohos.permission.READ_CONTACTS';
      state.declared = true;
      state.granted = false;
      expect(state.declared).assertTrue();
      expect(state.granted).assertFalse();
      expect(state.name).assertEqual('ohos.permission.READ_CONTACTS');
      state.granted = true;
      expect(state.granted).assertTrue();
      expect(state.declared).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_TYP_3400
     * @tc.name      testImportExportPair0001
     * @tc.desc      Verify ImportResult and ExportResult are independent
     *               objects whose success flags and codes never interfere.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testImportExportPair0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testImportExportPair0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const imported: ImportResult = new ImportResult();
      imported.success = true;
      imported.code = 0;
      imported.cardCount = 4;
      imported.message = 'ok';
      const exported: ExportResult = new ExportResult();
      exported.success = false;
      exported.code = 201;
      exported.message = 'denied';
      expect(imported.success).assertTrue();
      expect(exported.success).assertFalse();
      expect(imported.code).assertEqual(0);
      expect(exported.code).assertEqual(201);
      expect(imported.message !== exported.message).assertTrue();
      expect(imported.cardCount).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
