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
  createVersionChoices,
  ErrorCodeMap,
  ErrorExplain,
  ExportResult,
  Formatter,
  VCardConstants,
  VersionChoice,
  VCardSettings
} from 'library';

const DOMAIN: number = 0xF811;
const SAMPLE_EXPORT_TEXT: string = 'BEGIN:VCARD\nVERSION:3.0\nFN:Export Demo\nTEL:+8613800000001\nEND:VCARD\n';

export default function exportLogicTest() {
  describe('ExportLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_0100
     * @tc.name      testExportResultDefaults0001
     * @tc.desc      Verify every ExportResult field starts from a safe default
     *               so a failed export never leaks stale values into the page.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportResultDefaults0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportResultDefaults0001';
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
      const second: ExportResult = new ExportResult();
      expect(second.success).assertFalse();
      expect(second.requestedCount).assertEqual(0);
      expect(result === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_0200
     * @tc.name      testExportResultRequest0001
     * @tc.desc      Verify requestedCount mirrors the size of the requested id
     *               list including the empty selection case.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testExportResultRequest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testExportResultRequest0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const emptyIds: number[] = [];
      const singleIds: number[] = [7];
      const manyIds: number[] = [1, 2, 3];
      const result: ExportResult = new ExportResult();
      result.requestedCount = emptyIds.length;
      expect(result.requestedCount).assertEqual(0);
      result.requestedCount = singleIds.length;
      expect(result.requestedCount).assertEqual(1);
      result.requestedCount = manyIds.length;
      expect(result.requestedCount).assertEqual(3);
      expect(result.cardCount).assertEqual(0);
      expect(result.success).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_0300
     * @tc.name      testExportResultFailure0001
     * @tc.desc      Verify the failure branch fields preserve negative, system
     *               and permission codes together with the raw message text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testExportResultFailure0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testExportResultFailure0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const denied: ExportResult = new ExportResult();
      denied.success = false;
      denied.code = 201;
      denied.message = 'permission denied';
      expect(denied.success).assertFalse();
      expect(denied.code).assertEqual(201);
      expect(denied.message).assertEqual('permission denied');
      const systemError: ExportResult = new ExportResult();
      systemError.code = 8300999;
      expect(systemError.code).assertEqual(8300999);
      const negative: ExportResult = new ExportResult();
      negative.code = -1;
      expect(negative.code).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_0400
     * @tc.name      testExportResultPayload0001
     * @tc.desc      Verify the payload fields filePath, content, bytes and
     *               cardCount accept and report the values the service fills.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportResultPayload0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportResultPayload0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const result: ExportResult = new ExportResult();
      result.filePath = '/data/storage/el2/base/vcard/export/demo.vcf';
      result.content = SAMPLE_EXPORT_TEXT;
      result.bytes = 2048;
      result.cardCount = 1;
      expect(result.filePath).assertContain('export');
      expect(result.filePath).assertContain('demo.vcf');
      expect(result.content).assertContain('BEGIN:VCARD');
      expect(result.content).assertContain('END:VCARD');
      expect(result.content.length).assertEqual(SAMPLE_EXPORT_TEXT.length);
      expect(result.bytes).assertEqual(2048);
      expect(result.cardCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_0500
     * @tc.name      testExportStamp0001
     * @tc.desc      Verify fileStamp renders a leap-day export name with zero
     *               padded midnight components and the underscore separator.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportStamp0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportStamp0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const leap: number = new Date(2024, 1, 29, 0, 0, 0).getTime();
      const stamp: string = Formatter.fileStamp(leap);
      expect(stamp).assertEqual('20240229_000000');
      expect(stamp.length).assertEqual(15);
      expect(stamp.charAt(8)).assertEqual('_');
      expect(stamp).assertContain('2024');
      expect(stamp).assertContain('0229');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_0600
     * @tc.name      testExportStamp0002
     * @tc.desc      Verify fileStamp zero pads every single digit month, day,
     *               hour, minute and second component of the export name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportStamp0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportStamp0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const june: number = new Date(2025, 5, 3, 4, 5, 6).getTime();
      expect(Formatter.fileStamp(june)).assertEqual('20250603_040506');
      const sept: number = new Date(2026, 8, 17, 21, 9, 3).getTime();
      expect(Formatter.fileStamp(sept)).assertEqual('20260917_210903');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_0700
     * @tc.name      testExportStamp0003
     * @tc.desc      Verify fileStamp keeps the compact shape at year boundary
     *               dates without separators inside the date half.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportStamp0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportStamp0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const eve: number = new Date(2027, 11, 31, 0, 0, 0).getTime();
      expect(Formatter.fileStamp(eve)).assertEqual('20271231_000000');
      const newYear: number = new Date(2028, 0, 1, 12, 0, 0).getTime();
      const stamp: string = Formatter.fileStamp(newYear);
      expect(stamp).assertEqual('20280101_120000');
      expect(stamp.indexOf('_')).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_0800
     * @tc.name      testExportPathAssembly0001
     * @tc.desc      Verify the exported copy path is assembled as export dir,
     *               slash, timestamp stamp, underscore and original file name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testExportPathAssembly0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testExportPathAssembly0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stamp: string = Formatter.fileStamp(new Date(2026, 3, 2, 8, 7, 6).getTime());
      expect(stamp).assertEqual('20260402_080706');
      const dir: string = VCardConstants.EXPORT_DIR;
      const target: string = dir + '/' + stamp + '_' + 'demo.vcf';
      expect(target).assertEqual('export/20260402_080706_demo.vcf');
      expect(target.indexOf(dir)).assertEqual(0);
      expect(target.indexOf(stamp)).assertLarger(0);
      expect(target).assertContain(stamp + '_demo.vcf');
      expect(target).assertContain('.vcf');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_0900
     * @tc.name      testExportDirConstants0001
     * @tc.desc      Verify the sandbox directory names and sample file name are
     *               distinct lowercase vCard specific identifiers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportDirConstants0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportDirConstants0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.VCARD_DIR).assertEqual('vcard');
      expect(VCardConstants.EXPORT_DIR).assertEqual('export');
      expect(VCardConstants.IMPORT_DIR).assertEqual('import');
      expect(VCardConstants.VCARD_DIR === VCardConstants.EXPORT_DIR).assertFalse();
      expect(VCardConstants.EXPORT_DIR === VCardConstants.IMPORT_DIR).assertFalse();
      expect(VCardConstants.SAMPLE_FILE_NAME).assertContain('.vcf');
      expect(VCardConstants.SAMPLE_FILE_NAME).assertEqual('sample_contacts.vcf');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_1000
     * @tc.name      testExportBytes0001
     * @tc.desc      Verify bytes() renders the exported file size with B, KB
     *               and MB units across fresh boundary inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportBytes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportBytes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.bytes(2)).assertEqual('2 B');
      expect(Formatter.bytes(512)).assertEqual('512 B');
      expect(Formatter.bytes(2048)).assertEqual('2.0 KB');
      expect(Formatter.bytes(4096)).assertEqual('4.0 KB');
      expect(Formatter.bytes(1048577)).assertEqual('1.00 MB');
      expect(Formatter.bytes(2097152)).assertEqual('2.00 MB');
      expect(Formatter.bytes(5242880)).assertEqual('5.00 MB');
      expect(Formatter.bytes(1073741824)).assertEqual('1024.00 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_1100
     * @tc.name      testExportVersionChoices0001
     * @tc.desc      Verify the version choice list is strictly ascending and
     *               every label is a distinct dotted version string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportVersionChoices0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportVersionChoices0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const choices: VersionChoice[] = createVersionChoices();
      expect(choices[0].value).assertLess(choices[1].value);
      expect(choices[1].value).assertLess(choices[2].value);
      expect(choices[0].label === choices[1].label).assertFalse();
      expect(choices[1].label === choices[2].label).assertFalse();
      expect(choices[0].label).assertContain('.');
      expect(choices[1].label).assertContain('.');
      expect(choices[2].label).assertContain('.');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_1200
     * @tc.name      testExportVersionChoices0002
     * @tc.desc      Verify createVersionChoices returns a fresh array per call
     *               so mutating one result never leaks into another caller.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportVersionChoices0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportVersionChoices0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: VersionChoice[] = createVersionChoices();
      const second: VersionChoice[] = createVersionChoices();
      const extra: VersionChoice = new VersionChoice(9, '9.9', 'custom extra');
      first.push(extra);
      expect(first === second).assertFalse();
      expect(first.length).assertEqual(4);
      expect(second.length).assertEqual(3);
      expect(first[3].value).assertEqual(9);
      expect(first[3].label).assertEqual('9.9');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_1300
     * @tc.name      testExportVersionChoice0001
     * @tc.desc      Verify the VersionChoice constructor stores custom value,
     *               label and description arguments verbatim.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportVersionChoice0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportVersionChoice0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const custom: VersionChoice = new VersionChoice(7, 'X.7', 'custom description');
      expect(custom.value).assertEqual(7);
      expect(custom.label).assertEqual('X.7');
      expect(custom.description).assertEqual('custom description');
      expect(custom.description).not().assertNull();
      const minimal: VersionChoice = new VersionChoice(-2, '', '');
      expect(minimal.value).assertEqual(-2);
      expect(minimal.label).assertEqual('');
      expect(minimal.description).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_1400
     * @tc.name      testExportVersionSpace0001
     * @tc.desc      Verify settings.defaultVersion accepts and reports each of
     *               the three version values exported by the choice factory.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportVersionSpace0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportVersionSpace0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      const choices: VersionChoice[] = createVersionChoices();
      settings.defaultVersion = choices[0].value;
      expect(settings.defaultVersion).assertEqual(choices[0].value);
      settings.defaultVersion = choices[1].value;
      expect(settings.defaultVersion).assertEqual(choices[1].value);
      settings.defaultVersion = choices[2].value;
      expect(settings.defaultVersion).assertEqual(choices[2].value);
      settings.defaultVersion = choices[0].value;
      expect(settings.defaultVersion).assertEqual(choices[0].value);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_1500
     * @tc.name      testExportSettingsCharset0001
     * @tc.desc      Verify the charset setting round trips between the UTF-8
     *               and GBK constants exported by VCardConstants.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportSettingsCharset0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportSettingsCharset0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      expect(settings.defaultCharset).assertEqual(VCardConstants.CHARSET_UTF8);
      settings.defaultCharset = VCardConstants.CHARSET_GBK;
      expect(settings.defaultCharset).assertEqual(VCardConstants.CHARSET_GBK);
      settings.defaultCharset = VCardConstants.CHARSET_UTF8;
      expect(settings.defaultCharset).assertEqual(VCardConstants.CHARSET_UTF8);
      expect(VCardConstants.CHARSET_UTF8 === VCardConstants.CHARSET_GBK).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_1600
     * @tc.name      testExportSettingsJump0001
     * @tc.desc      Verify the auto jump flag toggles both ways and returns to
     *               its enabled default on demand.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportSettingsJump0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportSettingsJump0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      expect(settings.autoJumpToContacts).assertTrue();
      settings.autoJumpToContacts = false;
      expect(settings.autoJumpToContacts).assertFalse();
      settings.autoJumpToContacts = true;
      expect(settings.autoJumpToContacts).assertTrue();
      settings.autoJumpToContacts = false;
      expect(settings.autoJumpToContacts).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_1700
     * @tc.name      testExportSettingsLimit0001
     * @tc.desc      Verify the history limit setting stores every offered limit
     *               option and the maximum bound without mutation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportSettingsLimit0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportSettingsLimit0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      const options: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      for (let i = 0; i < options.length; i++) {
        settings.historyLimit = options[i];
        expect(settings.historyLimit).assertEqual(options[i]);
      }
      settings.historyLimit = VCardConstants.HISTORY_LIMIT_MAX;
      expect(settings.historyLimit).assertEqual(VCardConstants.HISTORY_LIMIT_MAX);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_1800
     * @tc.name      testExportErrorExplain0001
     * @tc.desc      Verify explain for export relevant known codes keeps code
     *               identity and returns non-null title, reason and suggestion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportErrorExplain0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportErrorExplain0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const denied: ErrorExplain = ErrorCodeMap.explain(201);
      expect(denied.code).assertEqual(201);
      expect(denied.title).not().assertNull();
      expect(denied.reason).not().assertNull();
      expect(denied.suggestion).not().assertNull();
      const missing: ErrorExplain = ErrorCodeMap.explain(13900002);
      expect(missing.code).assertEqual(13900002);
      expect(missing.title).not().assertNull();
      expect(missing.reason).not().assertNull();
      expect(missing.suggestion).not().assertNull();
      const unknown: ErrorExplain = ErrorCodeMap.explain(8300999);
      expect(unknown.code).assertEqual(8300999);
      expect(unknown.title).not().assertNull();
      expect(unknown.reason).not().assertNull();
      expect(unknown.suggestion).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_1900
     * @tc.name      testExportErrorExplain0002
     * @tc.desc      Verify explain falls back to the error severity branch for
     *               codes outside the known mapping table.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportErrorExplain0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportErrorExplain0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const big: ErrorExplain = ErrorCodeMap.explain(999999);
      expect(big.code).assertEqual(999999);
      expect(big.severity).assertEqual('error');
      expect(big.title).not().assertNull();
      const tiny: ErrorExplain = ErrorCodeMap.explain(-1);
      expect(tiny.code).assertEqual(-1);
      expect(tiny.severity).assertEqual('error');
      expect(tiny.suggestion).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_2000
     * @tc.name      testExportContentDisplay0001
     * @tc.desc      Verify the exported preview text keeps its length and card
     *               markers and the byte display stays in the B unit for it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportContentDisplay0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportContentDisplay0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const result: ExportResult = new ExportResult();
      result.content = SAMPLE_EXPORT_TEXT;
      result.requestedCount = 1;
      result.cardCount = 1;
      expect(result.content).assertContain('VERSION:3.0');
      expect(result.content).assertContain('FN:Export Demo');
      expect(result.content.length).assertEqual(SAMPLE_EXPORT_TEXT.length);
      expect(result.content.length).assertLess(1024);
      expect(Formatter.bytes(result.content.length)).assertContain(' B');
      expect(result.requestedCount).assertEqual(result.cardCount);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_2100
     * @tc.name      testExportResultFreshness0001
     * @tc.desc      Verify two ExportResult instances are fully independent so
     *               mutating one never changes the other instance defaults.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportResultFreshness0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportResultFreshness0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const dirty: ExportResult = new ExportResult();
      const clean: ExportResult = new ExportResult();
      dirty.success = true;
      dirty.code = 401;
      dirty.message = 'stale';
      dirty.filePath = '/tmp/old.vcf';
      dirty.bytes = 99;
      dirty.cardCount = 4;
      dirty.requestedCount = 9;
      expect(clean.success).assertFalse();
      expect(clean.code).assertEqual(0);
      expect(clean.message).assertEqual('');
      expect(clean.filePath).assertEqual('');
      expect(clean.bytes).assertEqual(0);
      expect(clean.cardCount).assertEqual(0);
      expect(clean.requestedCount).assertEqual(0);
      expect(dirty.success).assertTrue();
      expect(dirty.requestedCount).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_2200
     * @tc.name      testExportCountRelation0001
     * @tc.desc      Verify requestedCount always reports at least cardCount so
     *               the page can show skipped contacts during export.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportCountRelation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportCountRelation0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const partial: ExportResult = new ExportResult();
      partial.requestedCount = 5;
      partial.cardCount = 2;
      expect(partial.requestedCount >= partial.cardCount).assertTrue();
      const full: ExportResult = new ExportResult();
      full.requestedCount = 3;
      full.cardCount = 3;
      expect(full.requestedCount >= full.cardCount).assertTrue();
      expect(full.requestedCount).assertEqual(full.cardCount);
      const none: ExportResult = new ExportResult();
      expect(none.requestedCount >= none.cardCount).assertTrue();
      expect(none.requestedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_2300
     * @tc.name      testExportStamp0004
     * @tc.desc      Verify fileStamp keeps the compact 15 character shape when
     *               every date and time component uses two digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportStamp0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportStamp0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const december: number = new Date(2026, 11, 25, 10, 11, 12).getTime();
      const stamp: string = Formatter.fileStamp(december);
      expect(stamp).assertEqual('20261225_101112');
      expect(stamp.length).assertEqual(15);
      expect(stamp.substring(0, 4)).assertEqual('2026');
      expect(stamp.substring(8, 9)).assertEqual('_');
      const october: number = new Date(2026, 9, 20, 23, 45, 59).getTime();
      expect(Formatter.fileStamp(october)).assertEqual('20261020_234559');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_2400
     * @tc.name      testExportSkipEmpty0001
     * @tc.desc      Verify the empty preview content contract behind the save
     *               skip branch so an empty export never writes a file.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportSkipEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportSkipEmpty0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const fresh: ExportResult = new ExportResult();
      expect(fresh.content.length === 0).assertTrue();
      expect(fresh.filePath.length === 0).assertTrue();
      const filled: ExportResult = new ExportResult();
      filled.content = SAMPLE_EXPORT_TEXT;
      expect(filled.content.length === 0).assertFalse();
      expect(filled.content.length).assertLarger(0);
      const cleared: ExportResult = new ExportResult();
      cleared.content = '';
      expect(cleared.content.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_2500
     * @tc.name      testExportVersionCharsetMatrix0001
     * @tc.desc      Verify version and charset settings store every valid
     *               version paired with each exported charset constant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportVersionCharsetMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportVersionCharsetMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      settings.defaultVersion = 1;
      settings.defaultCharset = VCardConstants.CHARSET_GBK;
      expect(settings.defaultVersion).assertEqual(1);
      expect(settings.defaultCharset).assertEqual(VCardConstants.CHARSET_GBK);
      settings.defaultVersion = 2;
      expect(settings.defaultVersion).assertEqual(2);
      expect(settings.defaultCharset).assertEqual(VCardConstants.CHARSET_GBK);
      settings.defaultVersion = 0;
      settings.defaultCharset = VCardConstants.CHARSET_UTF8;
      expect(settings.defaultVersion).assertEqual(0);
      expect(settings.defaultCharset).assertEqual(VCardConstants.CHARSET_UTF8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_2600
     * @tc.name      testExportErrorExplain0003
     * @tc.desc      Verify the remaining known codes 8300001 and 8300003 keep
     *               their identity and provide complete explanation fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportErrorExplain0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportErrorExplain0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const invalid: ErrorExplain = ErrorCodeMap.explain(8300001);
      expect(invalid.code).assertEqual(8300001);
      expect(invalid.title).not().assertNull();
      expect(invalid.reason).not().assertNull();
      expect(invalid.suggestion).not().assertNull();
      const system: ErrorExplain = ErrorCodeMap.explain(8300003);
      expect(system.code).assertEqual(8300003);
      expect(system.title).not().assertNull();
      expect(system.reason).not().assertNull();
      expect(system.suggestion).not().assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_2700
     * @tc.name      testExportStampUniqueness0001
     * @tc.desc      Verify fileStamp is deterministic for one instant and
     *               changes when the instant moves by one second.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportStampUniqueness0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportStampUniqueness0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = new Date(2026, 5, 15, 9, 30, 20).getTime();
      const left: string = Formatter.fileStamp(base);
      const right: string = Formatter.fileStamp(base);
      expect(left === right).assertTrue();
      expect(left).assertEqual('20260615_093020');
      const next: string = Formatter.fileStamp(base + 1000);
      expect(next === left).assertFalse();
      expect(next).assertEqual('20260615_093021');
      expect(next.substring(0, 8)).assertEqual(left.substring(0, 8));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_2800
     * @tc.name      testExportBytesDisplay0002
     * @tc.desc      Verify the bytes display of freshly assigned result sizes
     *               rounds to one KB digit or two MB digits as documented.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportBytesDisplay0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportBytesDisplay0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const small: ExportResult = new ExportResult();
      small.bytes = 6144;
      expect(Formatter.bytes(small.bytes)).assertEqual('6.0 KB');
      const mid: ExportResult = new ExportResult();
      mid.bytes = 999424;
      expect(Formatter.bytes(mid.bytes)).assertEqual('976.0 KB');
      const big: ExportResult = new ExportResult();
      big.bytes = 1572864;
      expect(Formatter.bytes(big.bytes)).assertEqual('1.50 MB');
      const huge: ExportResult = new ExportResult();
      huge.bytes = 2621440;
      expect(Formatter.bytes(huge.bytes)).assertEqual('2.50 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_2900
     * @tc.name      testExportDirShape0001
     * @tc.desc      Verify directory and sample name constants keep their
     *       	       exact lengths and the sample keeps the .vcf suffix index.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportDirShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportDirShape0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.VCARD_DIR.length).assertEqual(5);
      expect(VCardConstants.EXPORT_DIR.length).assertEqual(6);
      expect(VCardConstants.IMPORT_DIR.length).assertEqual(6);
      expect(VCardConstants.VCARD_DIR === VCardConstants.IMPORT_DIR).assertFalse();
      expect(VCardConstants.SAMPLE_FILE_NAME.length).assertEqual(19);
      expect(VCardConstants.SAMPLE_FILE_NAME.indexOf('.vcf')).assertEqual(15);
      expect(VCardConstants.EXPORT_DIR === 'EXPORT').assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_3000
     * @tc.name      testExportCodeMessagePair0001
     * @tc.desc      Verify the failure result keeps a stable pairing between
     *               the error code and the raw message text stored on it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportCodeMessagePair0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportCodeMessagePair0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const param: ExportResult = new ExportResult();
      param.code = 401;
      param.message = 'parameter error';
      expect(param.code).assertEqual(401);
      expect(param.message).assertEqual('parameter error');
      const file: ExportResult = new ExportResult();
      file.code = 13900002;
      file.message = 'file not found';
      expect(file.code).assertEqual(13900002);
      expect(file.message).assertEqual('file not found');
      const system: ExportResult = new ExportResult();
      system.code = 8300003;
      system.message = 'system error';
      expect(system.code).assertEqual(8300003);
      expect(system.message).assertEqual('system error');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_3100
     * @tc.name      testExportNameCollision0001
     * @tc.desc      Verify stamp based target names differ for different file
     *               names and stay deterministic for the same file name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportNameCollision0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportNameCollision0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stamp: string = Formatter.fileStamp(new Date(2026, 6, 8, 14, 20, 5).getTime());
      expect(stamp).assertEqual('20260708_142005');
      const dir: string = VCardConstants.EXPORT_DIR;
      const targetA: string = dir + '/' + stamp + '_' + 'a.vcf';
      const targetB: string = dir + '/' + stamp + '_' + 'b.vcf';
      expect(targetA === targetB).assertFalse();
      expect(targetA).assertContain(stamp);
      expect(targetB).assertContain(stamp);
      const targetAgain: string = dir + '/' + stamp + '_' + 'a.vcf';
      expect(targetAgain === targetA).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_3200
     * @tc.name      testExportStampYearStart0001
     * @tc.desc      Verify the first second of a year renders with zero padded
     *               month, day and time segments in the stamp.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportStampYearStart0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportStampYearStart0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stamp: string = Formatter.fileStamp(new Date(2027, 0, 1, 0, 0, 1).getTime());
      expect(stamp).assertEqual('20270101_000001');
      expect(stamp.length).assertEqual(15);
      expect(stamp.charAt(8)).assertEqual('_');
      expect(stamp.charAt(14)).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_3300
     * @tc.name      testExportMessageShare0001
     * @tc.desc      Verify two failing results sharing one error keep equal
     *               code and message text while fresh results stay silent.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportMessageShare0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportMessageShare0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const left: ExportResult = new ExportResult();
      const right: ExportResult = new ExportResult();
      left.code = 8300001;
      left.message = 'invalid parameter';
      right.code = left.code;
      right.message = left.message;
      expect(right.code).assertEqual(8300001);
      expect(right.message === left.message).assertTrue();
      const fresh: ExportResult = new ExportResult();
      expect(fresh.message === '').assertTrue();
      expect(fresh.code).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_3400
     * @tc.name      testExportMinuteStep0001
     * @tc.desc      Verify stamps one minute apart share the date segment and
     *               still differ in the full stamp text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportMinuteStep0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportMinuteStep0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = new Date(2026, 8, 9, 7, 30, 0).getTime();
      const first: string = Formatter.fileStamp(base);
      const second: string = Formatter.fileStamp(base + 60000);
      expect(first).assertEqual('20260909_073000');
      expect(second).assertEqual('20260909_073100');
      expect(first === second).assertFalse();
      expect(first.substring(0, 8) === second.substring(0, 8)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_EXIM_3500
     * @tc.name      testExportChoicesStable0001
     * @tc.desc      Verify repeated factory calls yield identical value and
     *               label sequences for stable export version dialogs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExportChoicesStable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testExportChoicesStable0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const left: VersionChoice[] = createVersionChoices();
      const right: VersionChoice[] = createVersionChoices();
      expect(left[0].label === right[0].label).assertTrue();
      expect(left[1].label === right[1].label).assertTrue();
      expect(left[2].label === right[2].label).assertTrue();
      expect(left[0].value).assertEqual(right[0].value);
      expect(left[2].value).assertEqual(right[2].value);
      expect(left[2].value).assertLarger(left[0].value);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
