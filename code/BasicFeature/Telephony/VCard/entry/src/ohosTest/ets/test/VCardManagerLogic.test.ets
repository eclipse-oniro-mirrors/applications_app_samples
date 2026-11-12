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
  ContactSummary,
  createVersionChoices,
  ErrorCodeMap,
  ExportResult,
  HistoryAction,
  HistoryEntry,
  HistoryStats,
  ImportResult,
  PermissionState,
  VCardConstants,
  VCardManager,
  VCardPreview,
  VCardSettings
} from 'library';

const DOMAIN: number = 0xF811;
const CARD_V30: string = 'BEGIN:VCARD\nVERSION:3.0\nFN:John Doe\nTEL:+8613800000000\n' +
  'EMAIL:john@example.com\nORG:Acme\nEND:VCARD\n';

function makeEntry(action: number, success: boolean): HistoryEntry {
  const entry: HistoryEntry = new HistoryEntry();
  entry.action = action;
  entry.success = success;
  return entry;
}

export default function vCardManagerLogicTest() {
  describe('VCardManagerLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_MANAGER_0100
     * @tc.name      testManagerStats0001
     * @tc.desc      Verify makeStats on an empty history list returns every
     *               counter as zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testManagerStats0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testManagerStats0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stats: HistoryStats = VCardManager.makeStats([]);
      expect(stats.total).assertEqual(0);
      expect(stats.importCount).assertEqual(0);
      expect(stats.exportCount).assertEqual(0);
      expect(stats.contactCount).assertEqual(0);
      expect(stats.successCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_MANAGER_0200
     * @tc.name      testManagerStats0002
     * @tc.desc      Verify makeStats counts import, export, contact actions and
     *               successes independently over a mixed history list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testManagerStats0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testManagerStats0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const entries: HistoryEntry[] = [
        makeEntry(HistoryAction.IMPORT, true),
        makeEntry(HistoryAction.IMPORT, false),
        makeEntry(HistoryAction.EXPORT, true),
        makeEntry(HistoryAction.CREATE, true),
        makeEntry(HistoryAction.UPDATE, false),
        makeEntry(HistoryAction.DELETE, false)
      ];
      const stats: HistoryStats = VCardManager.makeStats(entries);
      expect(stats.total).assertEqual(6);
      expect(stats.importCount).assertEqual(2);
      expect(stats.exportCount).assertEqual(1);
      expect(stats.contactCount).assertEqual(3);
      expect(stats.successCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_MANAGER_0300
     * @tc.name      testManagerExplain0001
     * @tc.desc      Verify explain maps permission-denied 201 to error and
     *               parameter errors 401 and 8300001 to warning severity.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testManagerExplain0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testManagerExplain0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const denied = VCardManager.explain(201);
      expect(denied.code).assertEqual(201);
      expect(denied.severity).assertEqual('error');
      expect(VCardManager.explain(401).severity).assertEqual('warning');
      expect(VCardManager.explain(8300001).severity).assertEqual('warning');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_MANAGER_0400
     * @tc.name      testManagerExplain0002
     * @tc.desc      Verify explain maps system errors, unknown code and unknown
     *               inputs to error severity and preserves the original code.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testManagerExplain0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testManagerExplain0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardManager.explain(8300003).severity).assertEqual('error');
      expect(VCardManager.explain(8300999).severity).assertEqual('error');
      expect(VCardManager.explain(13900002).severity).assertEqual('error');
      const unknown = VCardManager.explain(424242);
      expect(unknown.code).assertEqual(424242);
      expect(unknown.severity).assertEqual('error');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_MANAGER_0500
     * @tc.name      testManagerPreviewContent0001
     * @tc.desc      Verify previewContent delegates to the parser for a valid
     *               card and returns EMPTY_CONTENT and NO_CARD error markers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testManagerPreviewContent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testManagerPreviewContent0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const ok: VCardPreview = VCardManager.previewContent(CARD_V30, 'ok.vcf');
      expect(ok.errorMessage).assertEqual('');
      expect(ok.cardCount).assertEqual(1);
      expect(ok.versionText).assertEqual('3.0');
      const empty: VCardPreview = VCardManager.previewContent('', 'e.vcf');
      expect(empty.errorMessage).assertEqual('EMPTY_CONTENT');
      const noCard: VCardPreview = VCardManager.previewContent('NOT A CARD', 'n.vcf');
      expect(noCard.errorMessage).assertEqual('NO_CARD');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_MANAGER_0600
     * @tc.name      testManagerPreviewContacts0001
     * @tc.desc      Verify previewToContacts maps a parsed preview card into a
     *               contact summary with preview key and copied fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testManagerPreviewContacts0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testManagerPreviewContacts0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const preview: VCardPreview = VCardManager.previewContent(CARD_V30, 'map.vcf');
      const contacts: ContactSummary[] = VCardManager.previewToContacts(preview);
      expect(contacts.length).assertEqual(1);
      expect(contacts[0].key).assertEqual('preview_0');
      expect(contacts[0].fullName).assertEqual('John Doe');
      expect(contacts[0].phones.length).assertEqual(1);
      expect(contacts[0].emails[0]).assertEqual('john@example.com');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_MANAGER_0700
     * @tc.name      testManagerConstants0001
     * @tc.desc      Verify VCardConstants exposes the charsets, history limit
     *               options and preview/file size caps used across the app.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testManagerConstants0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testManagerConstants0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.CHARSET_UTF8).assertEqual('UTF-8');
      expect(VCardConstants.CHARSET_GBK).assertEqual('GBK');
      expect(VCardConstants.HISTORY_LIMIT_OPTIONS.length).assertEqual(4);
      expect(VCardConstants.HISTORY_LIMIT_OPTIONS[0]).assertEqual(5);
      expect(VCardConstants.HISTORY_LIMIT_OPTIONS[1]).assertEqual(10);
      expect(VCardConstants.HISTORY_LIMIT_OPTIONS[2]).assertEqual(20);
      expect(VCardConstants.HISTORY_LIMIT_OPTIONS[3]).assertEqual(50);
      expect(VCardConstants.PREVIEW_CARD_LIMIT).assertEqual(20);
      expect(VCardConstants.DEFAULT_HISTORY_LIMIT).assertEqual(20);
      expect(VCardConstants.HISTORY_LIMIT_MAX).assertEqual(100);
      expect(VCardConstants.MAX_FILE_BYTES).assertEqual(2097152);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_MANAGER_0800
     * @tc.name      testManagerVersionChoices0001
     * @tc.desc      Verify createVersionChoices offers the 2.1, 3.0 and 4.0
     *               options in order with matching values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testManagerVersionChoices0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testManagerVersionChoices0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const choices = createVersionChoices();
      expect(choices.length).assertEqual(3);
      expect(choices[0].value).assertEqual(0);
      expect(choices[0].label).assertEqual('2.1');
      expect(choices[1].value).assertEqual(1);
      expect(choices[1].label).assertEqual('3.0');
      expect(choices[2].value).assertEqual(2);
      expect(choices[2].label).assertEqual('4.0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_MANAGER_0900
     * @tc.name      testManagerModelDefaults0001
     * @tc.desc      Verify the model classes expose safe defaults so pages can
     *               render before any system call resolves.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testManagerModelDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testManagerModelDefaults0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const importResult: ImportResult = new ImportResult();
      expect(importResult.success).assertFalse();
      expect(importResult.code).assertEqual(0);
      expect(importResult.cardCount).assertEqual(0);
      const exportResult: ExportResult = new ExportResult();
      expect(exportResult.success).assertFalse();
      expect(exportResult.bytes).assertEqual(0);
      const state: PermissionState = new PermissionState();
      expect(state.declared).assertFalse();
      expect(state.granted).assertFalse();
      const summary: ContactSummary = new ContactSummary();
      expect(summary.id).assertEqual(-1);
      expect(summary.initial).assertEqual('#');
      const settings: VCardSettings = new VCardSettings();
      expect(settings.defaultVersion).assertEqual(0);
      expect(settings.defaultCharset).assertEqual('UTF-8');
      expect(settings.autoJumpToContacts).assertTrue();
      expect(settings.historyLimit).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_MANAGER_1000
     * @tc.name      testManagerErrorCodeMap0001
     * @tc.desc      Verify ErrorCodeMap.explain keeps the requested code on the
     *               returned explanation object for known mappings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testManagerErrorCodeMap0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testManagerErrorCodeMap0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const param = ErrorCodeMap.explain(401);
      expect(param.code).assertEqual(401);
      expect(param.severity).assertEqual('warning');
      const file = ErrorCodeMap.explain(13900002);
      expect(file.code).assertEqual(13900002);
      expect(file.severity).assertEqual('error');
      const unknown = ErrorCodeMap.explain(-7);
      expect(unknown.code).assertEqual(-7);
      expect(unknown.severity).assertEqual('error');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
