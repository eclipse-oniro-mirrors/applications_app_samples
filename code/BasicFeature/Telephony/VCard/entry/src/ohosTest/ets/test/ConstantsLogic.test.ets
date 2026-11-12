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
import { Formatter, VCardConstants, VCardSettings } from 'library';

const DOMAIN: number = 0xF811;

export default function constantsLogicTest() {
  describe('ConstantsLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_0100
     * @tc.name      testCharsetValues0001
     * @tc.desc      Verify the two shipped charset constants hold the exact
     *               UTF-8 and GBK spellings used by export code paths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCharsetValues0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCharsetValues0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.CHARSET_UTF8).assertEqual('UTF-8');
      expect(VCardConstants.CHARSET_GBK).assertEqual('GBK');
      expect(typeof VCardConstants.CHARSET_UTF8).assertEqual('string');
      expect(typeof VCardConstants.CHARSET_GBK).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_0200
     * @tc.name      testCharsetValues0002
     * @tc.desc      Verify charset constant shapes include the dash position,
     *               uppercase letters and clearly distinct lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCharsetValues0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCharsetValues0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const utf8: string = VCardConstants.CHARSET_UTF8;
      const gbk: string = VCardConstants.CHARSET_GBK;
      expect(utf8.length).assertEqual(5);
      expect(utf8.indexOf('-')).assertEqual(3);
      expect(utf8.charAt(4)).assertEqual('8');
      expect(gbk.length).assertEqual(3);
      expect(gbk.indexOf('-')).assertEqual(-1);
      expect(utf8 !== gbk).assertTrue();
      expect(utf8.charAt(0)).assertEqual('U');
      expect(gbk.charAt(0)).assertEqual('G');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_0300
     * @tc.name      testHistoryLimits0001
     * @tc.desc      Verify the default and maximum history limits keep their
     *               documented numeric values and ordering relationship.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryLimits0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryLimits0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.DEFAULT_HISTORY_LIMIT).assertEqual(20);
      expect(VCardConstants.HISTORY_LIMIT_MAX).assertEqual(100);
      expect(typeof VCardConstants.DEFAULT_HISTORY_LIMIT).assertEqual('number');
      expect(typeof VCardConstants.HISTORY_LIMIT_MAX).assertEqual('number');
      expect(VCardConstants.HISTORY_LIMIT_MAX).assertLarger(VCardConstants.DEFAULT_HISTORY_LIMIT);
      expect(VCardConstants.DEFAULT_HISTORY_LIMIT * 5).assertEqual(VCardConstants.HISTORY_LIMIT_MAX);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_0400
     * @tc.name      testHistoryLimits0002
     * @tc.desc      Verify the history limit option list holds exactly five,
     *               ten, twenty and fifty in ascending order without gaps.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryLimits0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryLimits0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const options: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      expect(options.length).assertEqual(4);
      expect(options[0]).assertEqual(5);
      expect(options[1]).assertEqual(10);
      expect(options[2]).assertEqual(20);
      expect(options[3]).assertEqual(50);
      for (let i = 1; i < options.length; i++) {
        expect(options[i]).assertLarger(options[i - 1]);
      }
      for (let i = 0; i < options.length; i++) {
        expect(options[i]).assertLess(VCardConstants.HISTORY_LIMIT_MAX);
      }
      let sum: number = 0;
      for (let i = 0; i < options.length; i++) {
        sum = sum + options[i];
      }
      expect(sum).assertEqual(85);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_0500
     * @tc.name      testPreviewLimits0001
     * @tc.desc      Verify the preview card and line limits keep their exact
     *               numeric values with the line limit above the card count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPreviewLimits0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPreviewLimits0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.PREVIEW_CARD_LIMIT).assertEqual(20);
      expect(VCardConstants.PREVIEW_LINE_LIMIT).assertEqual(24);
      expect(typeof VCardConstants.PREVIEW_CARD_LIMIT).assertEqual('number');
      expect(typeof VCardConstants.PREVIEW_LINE_LIMIT).assertEqual('number');
      expect(VCardConstants.PREVIEW_LINE_LIMIT).assertLarger(VCardConstants.PREVIEW_CARD_LIMIT);
      expect(VCardConstants.PREVIEW_CARD_LIMIT).assertLess(VCardConstants.MAX_FILE_BYTES);
      expect(VCardConstants.PREVIEW_LINE_LIMIT).assertLess(VCardConstants.MAX_FILE_BYTES);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_0600
     * @tc.name      testPreviewLimits0002
     * @tc.desc      Verify numeric relations between preview limits, the
     *               default history limit and the maximum history limit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPreviewLimits0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPreviewLimits0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.PREVIEW_CARD_LIMIT).assertEqual(VCardConstants.DEFAULT_HISTORY_LIMIT);
      expect(VCardConstants.PREVIEW_LINE_LIMIT - VCardConstants.PREVIEW_CARD_LIMIT).assertEqual(4);
      expect(VCardConstants.PREVIEW_CARD_LIMIT * 5).assertEqual(VCardConstants.HISTORY_LIMIT_MAX);
      expect(VCardConstants.PREVIEW_LINE_LIMIT).assertLarger(VCardConstants.DEFAULT_HISTORY_LIMIT);
      expect(VCardConstants.PREVIEW_LINE_LIMIT).assertLess(VCardConstants.HISTORY_LIMIT_MAX);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_0700
     * @tc.name      testMaxFileBytes0001
     * @tc.desc      Verify the maximum import file size equals two mebibytes
     *               through several equivalent arithmetic decompositions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMaxFileBytes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMaxFileBytes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.MAX_FILE_BYTES).assertEqual(2097152);
      expect(VCardConstants.MAX_FILE_BYTES).assertEqual(2 * 1024 * 1024);
      expect(VCardConstants.MAX_FILE_BYTES).assertEqual(2048 * 1024);
      expect(VCardConstants.MAX_FILE_BYTES).assertEqual(512 * 4096);
      expect(VCardConstants.MAX_FILE_BYTES).assertLarger(1024 * 1024);
      expect(VCardConstants.MAX_FILE_BYTES).assertLess(3 * 1024 * 1024);
      expect(typeof VCardConstants.MAX_FILE_BYTES).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_0800
     * @tc.name      testMaxFileBytes0002
     * @tc.desc      Verify Formatter.bytes renders the maximum file size and
     *               its quarter, three quarter and one byte below boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMaxFileBytes0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMaxFileBytes0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const max: number = VCardConstants.MAX_FILE_BYTES;
      expect(Formatter.bytes(max)).assertEqual('2.00 MB');
      expect(Formatter.bytes(max - 1)).assertEqual('2.00 MB');
      expect(Formatter.bytes(max * 3 / 4)).assertEqual('1.50 MB');
      expect(Formatter.bytes(max / 4)).assertEqual('512.0 KB');
      expect(Formatter.bytes(max / 2)).assertEqual('1.00 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_0900
     * @tc.name      testMaxFileBytes0003
     * @tc.desc      Verify small numeric constants flow through Formatter
     *               bytes as plain B values matching their own magnitudes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMaxFileBytes0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMaxFileBytes0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.bytes(VCardConstants.DEFAULT_HISTORY_LIMIT)).assertEqual('20 B');
      expect(Formatter.bytes(VCardConstants.PREVIEW_LINE_LIMIT)).assertEqual('24 B');
      expect(Formatter.bytes(VCardConstants.HISTORY_LIMIT_MAX)).assertEqual('100 B');
      expect(Formatter.bytes(VCardConstants.PREVIEW_CARD_LIMIT)).assertEqual('20 B');
      expect(Formatter.bytes(VCardConstants.HISTORY_LIMIT_OPTIONS[0])).assertEqual('5 B');
      expect(Formatter.bytes(VCardConstants.HISTORY_LIMIT_OPTIONS[3])).assertEqual('50 B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_1000
     * @tc.name      testDirValues0001
     * @tc.desc      Verify the three storage directory constants hold the
     *               exact lowercase names with their documented lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDirValues0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDirValues0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.VCARD_DIR).assertEqual('vcard');
      expect(VCardConstants.IMPORT_DIR).assertEqual('import');
      expect(VCardConstants.EXPORT_DIR).assertEqual('export');
      expect(typeof VCardConstants.VCARD_DIR).assertEqual('string');
      expect(typeof VCardConstants.IMPORT_DIR).assertEqual('string');
      expect(typeof VCardConstants.EXPORT_DIR).assertEqual('string');
      expect(VCardConstants.VCARD_DIR.length).assertEqual(5);
      expect(VCardConstants.IMPORT_DIR.length).assertEqual(6);
      expect(VCardConstants.EXPORT_DIR.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_1100
     * @tc.name      testDirValues0002
     * @tc.desc      Verify directory names stay distinct and contain only
     *               safe lowercase letters without dots or slashes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDirValues0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDirValues0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const dirs: string[] = [VCardConstants.VCARD_DIR, VCardConstants.IMPORT_DIR, VCardConstants.EXPORT_DIR];
      expect(dirs[0] !== dirs[1]).assertTrue();
      expect(dirs[0] !== dirs[2]).assertTrue();
      expect(dirs[1] !== dirs[2]).assertTrue();
      const isPlainName = (name: string): boolean => {
        for (let i = 0; i < name.length; i++) {
          const code: number = name.charCodeAt(i);
          if (code < 97 || code > 122) {
            return false;
          }
        }
        return true;
      };
      expect(isPlainName(dirs[0])).assertTrue();
      expect(isPlainName(dirs[1])).assertTrue();
      expect(isPlainName(dirs[2])).assertTrue();
      expect(dirs[0].indexOf('.')).assertEqual(-1);
      expect(dirs[1].indexOf('/')).assertEqual(-1);
      expect(dirs[2].indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_1200
     * @tc.name      testSampleFileValues0001
     * @tc.desc      Verify the sample file name constant keeps its exact
     *               spelling with underscore and extension at fixed indices.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSampleFileValues0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSampleFileValues0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const name: string = VCardConstants.SAMPLE_FILE_NAME;
      expect(name).assertEqual('sample_contacts.vcf');
      expect(name.length).assertEqual(19);
      expect(name.indexOf('_')).assertEqual(6);
      expect(name.indexOf('.')).assertEqual(15);
      expect(name.lastIndexOf('.')).assertEqual(15);
      expect(name.substring(16)).assertEqual('vcf');
      expect(name.substring(0, 6)).assertEqual('sample');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_1300
     * @tc.name      testSampleFileValues0002
     * @tc.desc      Verify the sample file name embeds the contacts word,
     *       [compacted after tool execution: omitted 1018 chars]
     * @tc.level     Level 1
     */
    it('testSampleFileValues0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSampleFileValues0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const name: string = VCardConstants.SAMPLE_FILE_NAME;
      expect(name.indexOf('contacts')).assertEqual(7);
      expect(name.indexOf('.vcf')).assertEqual(15);
      expect(name !== VCardConstants.VCARD_DIR).assertTrue();
      expect(name !== VCardConstants.IMPORT_DIR).assertTrue();
      expect(name !== VCardConstants.EXPORT_DIR).assertTrue();
      expect(name.indexOf(' ')).assertEqual(-1);
      expect(name.length).assertLarger(VCardConstants.VCARD_DIR.length);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_1400
     * @tc.name      testPrefKeyValues0001
     * @tc.desc      Verify both preference key constants keep their exact
     *               spellings, shared vcard_ prefix and own lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefKeyValues0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPrefKeyValues0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settingsKey: string = VCardConstants.PREFERENCE_SETTINGS;
      const historyKey: string = VCardConstants.PREFERENCE_HISTORY;
      expect(settingsKey).assertEqual('vcard_settings');
      expect(historyKey).assertEqual('vcard_history');
      expect(settingsKey.length).assertEqual(14);
      expect(historyKey.length).assertEqual(13);
      expect(settingsKey.substring(0, 6)).assertEqual('vcard_');
      expect(historyKey.substring(0, 6)).assertEqual('vcard_');
      expect(settingsKey !== historyKey).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_1500
     * @tc.name      testPrefKeyValues0002
     * @tc.desc      Verify preference key suffixes split at the underscore
     *               and the whole keys use only lowercase safe characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefKeyValues0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPrefKeyValues0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settingsKey: string = VCardConstants.PREFERENCE_SETTINGS;
      const historyKey: string = VCardConstants.PREFERENCE_HISTORY;
      expect(settingsKey.substring(6)).assertEqual('settings');
      expect(historyKey.substring(6)).assertEqual('history');
      expect(settingsKey.indexOf('_')).assertEqual(5);
      expect(historyKey.indexOf('_')).assertEqual(5);
      const isSafeKey = (key: string): boolean => {
        for (let i = 0; i < key.length; i++) {
          const code: number = key.charCodeAt(i);
          if (code !== 95 && (code < 97 || code > 122)) {
            return false;
          }
        }
        return true;
      };
      expect(isSafeKey(settingsKey)).assertTrue();
      expect(isSafeKey(historyKey)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_1600
     * @tc.name      testPermissionStringValues0001
     * @tc.desc      Verify the contact permission constants hold the exact
     *               ohos permission strings with their documented lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStringValues0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStringValues0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const read: string = VCardConstants.READ_CONTACTS;
      const write: string = VCardConstants.WRITE_CONTACTS;
      expect(read).assertEqual('ohos.permission.READ_CONTACTS');
      expect(write).assertEqual('ohos.permission.WRITE_CONTACTS');
      expect(read.length).assertEqual(29);
      expect(write.length).assertEqual(30);
      expect(read !== write).assertTrue();
      expect(read.indexOf(write)).assertEqual(-1);
      expect(write.indexOf(read)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_1700
     * @tc.name      testPermissionStringValues0002
     * @tc.desc      Verify both permission strings share the module prefix
     *               and the syscap constant spells the telephony capability.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStringValues0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStringValues0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const read: string = VCardConstants.READ_CONTACTS;
      const write: string = VCardConstants.WRITE_CONTACTS;
      const syscap: string = VCardConstants.VCARD_SYSCAP;
      expect(read.substring(0, 16)).assertEqual(write.substring(0, 16));
      expect(read.substring(0, 16)).assertEqual('ohos.permission.');
      expect(read.indexOf('CONTACTS')).assertLarger(0);
      expect(write.indexOf('CONTACTS')).assertLarger(0);
      expect(syscap).assertEqual('SystemCapability.Telephony.CoreService');
      expect(syscap.length).assertEqual(38);
      expect(syscap.indexOf('Telephony')).assertLarger(0);
      expect(syscap.indexOf('CoreService')).assertLarger(0);
      expect(syscap.indexOf('ohos.permission')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_1800
     * @tc.name      testConstantTypesNumber0001
     * @tc.desc      Verify every numeric constant carries the primitive
     *               number type required by arithmetic call sites.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConstantTypesNumber0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testConstantTypesNumber0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(typeof VCardConstants.DEFAULT_HISTORY_LIMIT).assertEqual('number');
      expect(typeof VCardConstants.PREVIEW_CARD_LIMIT).assertEqual('number');
      expect(typeof VCardConstants.PREVIEW_LINE_LIMIT).assertEqual('number');
      expect(typeof VCardConstants.MAX_FILE_BYTES).assertEqual('number');
      expect(typeof VCardConstants.HISTORY_LIMIT_MAX).assertEqual('number');
      expect(typeof VCardConstants.HISTORY_LIMIT_OPTIONS).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_1900
     * @tc.name      testConstantTypesString0001
     * @tc.desc      Verify every string constant carries the primitive
     *               string type required by path and preference call sites.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConstantTypesString0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testConstantTypesString0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(typeof VCardConstants.READ_CONTACTS).assertEqual('string');
      expect(typeof VCardConstants.WRITE_CONTACTS).assertEqual('string');
      expect(typeof VCardConstants.VCARD_SYSCAP).assertEqual('string');
      expect(typeof VCardConstants.CHARSET_UTF8).assertEqual('string');
      expect(typeof VCardConstants.CHARSET_GBK).assertEqual('string');
      expect(typeof VCardConstants.VCARD_DIR).assertEqual('string');
      expect(typeof VCardConstants.IMPORT_DIR).assertEqual('string');
      expect(typeof VCardConstants.EXPORT_DIR).assertEqual('string');
      expect(typeof VCardConstants.SAMPLE_FILE_NAME).assertEqual('string');
      expect(typeof VCardConstants.PREFERENCE_SETTINGS).assertEqual('string');
      expect(typeof VCardConstants.PREFERENCE_HISTORY).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_2000
     * @tc.name      testOptionsMembership0001
     * @tc.desc      Verify option membership lookups succeed for shipped
     *               sizes and fail for unshipped sizes including the max.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOptionsMembership0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testOptionsMembership0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const options: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      expect(options.indexOf(5)).assertEqual(0);
      expect(options.indexOf(10)).assertEqual(1);
      expect(options.indexOf(20)).assertEqual(2);
      expect(options.indexOf(50)).assertEqual(3);
      expect(options.indexOf(VCardConstants.DEFAULT_HISTORY_LIMIT)).assertLarger(-1);
      expect(options.indexOf(VCardConstants.HISTORY_LIMIT_MAX)).assertEqual(-1);
      expect(options.indexOf(7)).assertEqual(-1);
      expect(options.indexOf(0)).assertEqual(-1);
      expect(options.indexOf(100)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_2100
     * @tc.name      testOptionsArithmetic0001
     * @tc.desc      Verify option values pair up into clean multiples with
     *               no duplicates across the whole shipped list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOptionsArithmetic0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testOptionsArithmetic0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const options: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      expect(options[1]).assertEqual(options[0] * 2);
      expect(options[2]).assertEqual(options[1] * 2);
      expect(options[3]).assertEqual(options[2] * 2 + 10);
      expect(options[3]).assertEqual(options[0] * 10);
      for (let i = 0; i < options.length; i++) {
        for (let j = i + 1; j < options.length; j++) {
          expect(options[i] !== options[j]).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_2200
     * @tc.name      testSettingsCross0001
     * @tc.desc      Verify the settings model defaults line up with the
     *               shipped charset and history limit constants exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSettingsCross0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSettingsCross0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settings: VCardSettings = new VCardSettings();
      expect(settings.defaultCharset).assertEqual(VCardConstants.CHARSET_UTF8);
      expect(settings.historyLimit).assertEqual(VCardConstants.DEFAULT_HISTORY_LIMIT);
      expect(VCardConstants.HISTORY_LIMIT_OPTIONS.indexOf(settings.historyLimit)).assertLarger(-1);
      expect(settings.historyLimit).assertLess(VCardConstants.HISTORY_LIMIT_MAX);
      expect(settings.autoJumpToContacts).assertTrue();
      expect(settings.defaultVersion).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_2300
     * @tc.name      testHistoryLimitTypes0001
     * @tc.desc      Verify every element inside the history limit option
     *               list carries the primitive number type.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHistoryLimitTypes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testHistoryLimitTypes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const options: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      for (let i = 0; i < options.length; i++) {
        expect(typeof options[i]).assertEqual('number');
        expect(options[i]).assertLarger(0);
      }
      expect(Array.isArray(options)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_2400
     * @tc.name      testDirWordEmbedding0001
     * @tc.desc      Verify directory names embed their meaningful words at
     *               the documented offset positions inside each name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDirWordEmbedding0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDirWordEmbedding0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.IMPORT_DIR.indexOf('port')).assertEqual(2);
      expect(VCardConstants.EXPORT_DIR.indexOf('port')).assertEqual(2);
      expect(VCardConstants.VCARD_DIR.indexOf('card')).assertEqual(1);
      expect(VCardConstants.IMPORT_DIR.indexOf('im')).assertEqual(0);
      expect(VCardConstants.EXPORT_DIR.indexOf('ex')).assertEqual(0);
      expect(VCardConstants.VCARD_DIR.indexOf('v')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_2500
     * @tc.name      testSampleNameComposition0001
     * @tc.desc      Verify the sample file name reconstructs exactly from
     *               its base word, separator, subject and extension parts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSampleNameComposition0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSampleNameComposition0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const rebuilt: string = 'sample' + '_' + 'contacts' + '.' + 'vcf';
      expect(rebuilt).assertEqual(VCardConstants.SAMPLE_FILE_NAME);
      const altRebuilt: string = 'sample_contacts' + '.vcf';
      expect(altRebuilt).assertEqual(VCardConstants.SAMPLE_FILE_NAME);
      const thirdRebuilt: string = 'sample' + '_contacts.vcf';
      expect(thirdRebuilt).assertEqual(VCardConstants.SAMPLE_FILE_NAME);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_2600
     * @tc.name      testPrefKeyComposition0001
     * @tc.desc      Verify preference keys rebuild from the vcard word plus
     *               underscore plus topic, matching the directory base word.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefKeyComposition0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPrefKeyComposition0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settingsKey: string = 'vcard' + '_' + 'settings';
      const historyKey: string = 'vcard' + '_' + 'history';
      expect(settingsKey).assertEqual(VCardConstants.PREFERENCE_SETTINGS);
      expect(historyKey).assertEqual(VCardConstants.PREFERENCE_HISTORY);
      expect(VCardConstants.VCARD_DIR).assertEqual('vcard');
      expect(VCardConstants.PREFERENCE_SETTINGS.substring(0, 5)).assertEqual(VCardConstants.VCARD_DIR);
      expect(VCardConstants.PREFERENCE_HISTORY.substring(0, 5)).assertEqual(VCardConstants.VCARD_DIR);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_2700
     * @tc.name      testCharsetCaseShape0001
     * @tc.desc      Verify charset constants contain only uppercase letters,
     *               digits and dashes as their spellings require.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCharsetCaseShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCharsetCaseShape0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const isUpperToken = (value: string): boolean => {
        for (let i = 0; i < value.length; i++) {
          const code: number = value.charCodeAt(i);
          const upperLetter: boolean = code >= 65 && code <= 90;
          const digit: boolean = code >= 48 && code <= 57;
          const dash: boolean = code === 45;
          if (!upperLetter && !digit && !dash) {
            return false;
          }
        }
        return true;
      };
      expect(isUpperToken(VCardConstants.CHARSET_UTF8)).assertTrue();
      expect(isUpperToken(VCardConstants.CHARSET_GBK)).assertTrue();
      expect(VCardConstants.CHARSET_UTF8.toLowerCase() !== VCardConstants.CHARSET_UTF8).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_2800
     * @tc.name      testPermissionStringCaseShape0001
     * @tc.desc      Verify permission strings only mix lowercase module
     *               words, dots, uppercase action words and underscores.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPermissionStringCaseShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPermissionStringCaseShape0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const isPermissionShape = (value: string): boolean => {
        for (let i = 0; i < value.length; i++) {
          const code: number = value.charCodeAt(i);
          const lowerLetter: boolean = code >= 97 && code <= 122;
          const upperLetter: boolean = code >= 65 && code <= 90;
          const dot: boolean = code === 46;
          const underscore: boolean = code === 95;
          if (!lowerLetter && !upperLetter && !dot && !underscore) {
            return false;
          }
        }
        return true;
      };
      expect(isPermissionShape(VCardConstants.READ_CONTACTS)).assertTrue();
      expect(isPermissionShape(VCardConstants.WRITE_CONTACTS)).assertTrue();
      expect(isPermissionShape(VCardConstants.VCARD_SYSCAP)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_2900
     * @tc.name      testConstantsNumericOrder0001
     * @tc.desc      Verify the numeric constants form a strictly increasing
     *               chain from the smallest option to the file ceiling.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConstantsNumericOrder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testConstantsNumericOrder0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.HISTORY_LIMIT_OPTIONS[0]).assertEqual(5);
      expect(VCardConstants.DEFAULT_HISTORY_LIMIT).assertLarger(VCardConstants.HISTORY_LIMIT_OPTIONS[1] - 1);
      expect(VCardConstants.PREVIEW_LINE_LIMIT).assertLarger(VCardConstants.PREVIEW_CARD_LIMIT);
      expect(VCardConstants.HISTORY_LIMIT_MAX).assertLarger(VCardConstants.PREVIEW_LINE_LIMIT);
      expect(VCardConstants.MAX_FILE_BYTES).assertLarger(VCardConstants.HISTORY_LIMIT_MAX);
      expect(VCardConstants.HISTORY_LIMIT_OPTIONS[0]).assertLess(VCardConstants.MAX_FILE_BYTES);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_3000
     * @tc.name      testSyscapSegments0001
     * @tc.desc      Verify the syscap constant splits into its three dotted
     *               segments at the documented character offsets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSyscapSegments0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSyscapSegments0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const syscap: string = VCardConstants.VCARD_SYSCAP;
      expect(syscap.substring(0, 16)).assertEqual('SystemCapability');
      expect(syscap.substring(17, 26)).assertEqual('Telephony');
      expect(syscap.substring(27)).assertEqual('CoreService');
      expect(syscap.indexOf('.')).assertEqual(16);
      expect(syscap.lastIndexOf('.')).assertEqual(26);
      expect(syscap.charAt(16)).assertEqual('.');
      expect(syscap.charAt(26)).assertEqual('.');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_3100
     * @tc.name      testMaxBytesDivisors0001
     * @tc.desc      Verify the maximum file size divides cleanly by its
     *               binary divisors without any remainder left behind.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMaxBytesDivisors0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testMaxBytesDivisors0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const max: number = VCardConstants.MAX_FILE_BYTES;
      expect(max % 1024).assertEqual(0);
      expect(max % (1024 * 1024)).assertEqual(0);
      expect(max / 1024).assertEqual(2048);
      expect(max / 2048).assertEqual(1024);
      expect(max / (1024 * 1024)).assertEqual(2);
      expect(max / 512).assertEqual(4096);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_3200
     * @tc.name      testPreviewVsOptions0001
     * @tc.desc      Verify the preview card limit sits inside the options
     *               list while the line limit stays outside of it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPreviewVsOptions0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPreviewVsOptions0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const options: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      expect(options.indexOf(VCardConstants.PREVIEW_CARD_LIMIT)).assertEqual(2);
      expect(options.indexOf(VCardConstants.PREVIEW_LINE_LIMIT)).assertEqual(-1);
      expect(options.indexOf(VCardConstants.DEFAULT_HISTORY_LIMIT)).assertEqual(2);
      expect(options.indexOf(VCardConstants.PREVIEW_LINE_LIMIT - 4)).assertEqual(2);
      expect(VCardConstants.PREVIEW_LINE_LIMIT).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_3300
     * @tc.name      testConstantsReadStability0001
     * @tc.desc      Verify repeated reads of the constants return identical
     *               values proving they act as stable readonly sources.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConstantsReadStability0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testConstantsReadStability0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const optionsA: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      const optionsB: number[] = VCardConstants.HISTORY_LIMIT_OPTIONS;
      expect(optionsA.length).assertEqual(optionsB.length);
      for (let i = 0; i < optionsA.length; i++) {
        expect(optionsA[i]).assertEqual(optionsB[i]);
      }
      expect(VCardConstants.CHARSET_UTF8 === VCardConstants.CHARSET_UTF8).assertTrue();
      expect(VCardConstants.VCARD_DIR === VCardConstants.VCARD_DIR).assertTrue();
      expect(VCardConstants.READ_CONTACTS === VCardConstants.READ_CONTACTS).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_3400
     * @tc.name      testSampleNameCharDomain0001
     * @tc.desc      Verify the sample file name uses only lowercase letters,
     *               one underscore and one dot across its full length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSampleNameCharDomain0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSampleNameCharDomain0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const name: string = VCardConstants.SAMPLE_FILE_NAME;
      let underscores: number = 0;
      let dots: number = 0;
      for (let i = 0; i < name.length; i++) {
        const code: number = name.charCodeAt(i);
        const lowerLetter: boolean = code >= 97 && code <= 122;
        if (code === 95) {
          underscores++;
        } else if (code === 46) {
          dots++;
        } else if (!lowerLetter) {
          expect(lowerLetter).assertTrue();
        }
      }
      expect(underscores).assertEqual(1);
      expect(dots).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_3500
     * @tc.name      testPrefKeysDistinctDirs0001
     * @tc.desc      Verify preference keys differ from every directory name
     *               so storage paths and preference ids never collide.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefKeysDistinctDirs0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPrefKeysDistinctDirs0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const settingsKey: string = VCardConstants.PREFERENCE_SETTINGS;
      const historyKey: string = VCardConstants.PREFERENCE_HISTORY;
      const dirs: string[] = [VCardConstants.VCARD_DIR, VCardConstants.IMPORT_DIR, VCardConstants.EXPORT_DIR];
      for (let i = 0; i < dirs.length; i++) {
        expect(settingsKey !== dirs[i]).assertTrue();
        expect(historyKey !== dirs[i]).assertTrue();
      }
      expect(settingsKey.indexOf(dirs[0])).assertEqual(0);
      expect(historyKey.indexOf(dirs[0])).assertEqual(0);
      expect(settingsKey.length).assertLarger(dirs[0].length);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_CONS_3600
     * @tc.name      testCrossDomainIsolation0001
     * @tc.desc      Verify permission, charset and syscap constants never
     *               absorb each other keywords across constant domains.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCrossDomainIsolation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testCrossDomainIsolation0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(VCardConstants.READ_CONTACTS.indexOf('UTF')).assertEqual(-1);
      expect(VCardConstants.CHARSET_UTF8.indexOf('permission')).assertEqual(-1);
      expect(VCardConstants.CHARSET_GBK.indexOf('CONTACTS')).assertEqual(-1);
      expect(VCardConstants.VCARD_SYSCAP.indexOf('READ')).assertEqual(-1);
      expect(VCardConstants.VCARD_SYSCAP.indexOf('WRITE')).assertEqual(-1);
      expect(VCardConstants.READ_CONTACTS.indexOf('SystemCapability')).assertEqual(-1);
      expect(VCardConstants.WRITE_CONTACTS.indexOf('CoreService')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
