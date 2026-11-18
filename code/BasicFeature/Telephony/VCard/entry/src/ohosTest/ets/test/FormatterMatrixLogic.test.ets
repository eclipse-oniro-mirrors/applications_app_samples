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
import { Formatter } from 'library';

const DOMAIN: number = 0xF811;

export default function formatterMatrixLogicTest() {
  describe('FormatterMatrixLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_0100
     * @tc.name      testFormatterBytes0001
     * @tc.desc      Verify bytes() renders the plain B unit for an assorted
     *               matrix of sub-kilobyte sizes far away from the thresholds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.bytes(2)).assertEqual('2 B');
      expect(Formatter.bytes(10)).assertEqual('10 B');
      expect(Formatter.bytes(100)).assertEqual('100 B');
      expect(Formatter.bytes(512)).assertEqual('512 B');
      expect(Formatter.bytes(1000)).assertEqual('1000 B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_0200
     * @tc.name      testFormatterBytes0002
     * @tc.desc      Verify bytes() keeps one decimal KB formatting across the
     *               entry matrix surrounding the 2 KB step and rounding gaps.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.bytes(1026)).assertEqual('1.0 KB');
      expect(Formatter.bytes(1999)).assertEqual('2.0 KB');
      expect(Formatter.bytes(2047)).assertEqual('2.0 KB');
      expect(Formatter.bytes(2048)).assertEqual('2.0 KB');
      expect(Formatter.bytes(2049)).assertEqual('2.0 KB');
      expect(Formatter.bytes(2559)).assertEqual('2.5 KB');
      expect(Formatter.bytes(2560)).assertEqual('2.5 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_0300
     * @tc.name      testFormatterBytes0003
     * @tc.desc      Verify bytes() renders whole and fractional KB values in
     *               the mid-range matrix between 3 KB and 640 KB.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.bytes(3072)).assertEqual('3.0 KB');
      expect(Formatter.bytes(4096)).assertEqual('4.0 KB');
      expect(Formatter.bytes(5120)).assertEqual('5.0 KB');
      expect(Formatter.bytes(10240)).assertEqual('10.0 KB');
      expect(Formatter.bytes(10486)).assertEqual('10.2 KB');
      expect(Formatter.bytes(512000)).assertEqual('500.0 KB');
      expect(Formatter.bytes(655360)).assertEqual('640.0 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_0400
     * @tc.name      testFormatterBytes0004
     * @tc.desc      Verify bytes() rounds the upper KB band up to the display
     *               limit just before the MB threshold takes over.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.bytes(524287)).assertEqual('512.0 KB');
      expect(Formatter.bytes(524289)).assertEqual('512.0 KB');
      expect(Formatter.bytes(1047552)).assertEqual('1023.0 KB');
      expect(Formatter.bytes(1048574)).assertEqual('1024.0 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_0500
     * @tc.name      testFormatterBytes0005
     * @tc.desc      Verify bytes() switches to two decimal MB formatting for
     *               the entry matrix starting one byte above the threshold.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.bytes(1048577)).assertEqual('1.00 MB');
      expect(Formatter.bytes(1049088)).assertEqual('1.00 MB');
      expect(Formatter.bytes(1049599)).assertEqual('1.00 MB');
      expect(Formatter.bytes(1572864)).assertEqual('1.50 MB');
      expect(Formatter.bytes(2097152)).assertEqual('2.00 MB');
      expect(Formatter.bytes(2621440)).assertEqual('2.50 MB');
      expect(Formatter.bytes(3932160)).assertEqual('3.75 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_0600
     * @tc.name      testFormatterBytes0006
     * @tc.desc      Verify bytes() keeps exact two decimal MB output for the
     *               large whole-megabyte matrix up to half a gigabyte.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.bytes(4194304)).assertEqual('4.00 MB');
      expect(Formatter.bytes(5242880)).assertEqual('5.00 MB');
      expect(Formatter.bytes(10485760)).assertEqual('10.00 MB');
      expect(Formatter.bytes(52428800)).assertEqual('50.00 MB');
      expect(Formatter.bytes(104857600)).assertEqual('100.00 MB');
      expect(Formatter.bytes(536870912)).assertEqual('512.00 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_0700
     * @tc.name      testFormatterBytes0007
     * @tc.desc      Verify bytes() stays in MB formatting with correct rounding
     *               across gigabyte-level boundaries up to three GiB.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.bytes(1072693248)).assertEqual('1023.00 MB');
      expect(Formatter.bytes(1073741823)).assertEqual('1024.00 MB');
      expect(Formatter.bytes(1073741824)).assertEqual('1024.00 MB');
      expect(Formatter.bytes(1610612736)).assertEqual('1536.00 MB');
      expect(Formatter.bytes(2147483647)).assertEqual('2048.00 MB');
      expect(Formatter.bytes(2147483648)).assertEqual('2048.00 MB');
      expect(Formatter.bytes(3221225472)).assertEqual('3072.00 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_0800
     * @tc.name      testFormatterBytes0008
     * @tc.desc      Verify bytes() treats every negative size as plain B output
     *               because both unit thresholds are positive comparisons.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.bytes(-2)).assertEqual('-2 B');
      expect(Formatter.bytes(-512)).assertEqual('-512 B');
      expect(Formatter.bytes(-1000)).assertEqual('-1000 B');
      expect(Formatter.bytes(-1024)).assertEqual('-1024 B');
      expect(Formatter.bytes(-1048576)).assertEqual('-1048576 B');
      expect(Formatter.bytes(-2147483648)).assertEqual('-2147483648 B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_0900
     * @tc.name      testFormatterTime0001
     * @tc.desc      Verify time() renders real February 29 stamps for the leap
     *               years 2024, 2000 and 2400 with zero padded fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterTime0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stampLeap4: number = new Date(2024, 1, 29, 12, 30, 45).getTime();
      expect(Formatter.time(stampLeap4)).assertEqual('2024-02-29 12:30:45');
      const stampLeap400: number = new Date(2000, 1, 29, 6, 6, 6).getTime();
      expect(Formatter.time(stampLeap400)).assertEqual('2000-02-29 06:06:06');
      const stampLeap2400: number = new Date(2400, 1, 29, 23, 59, 59).getTime();
      expect(Formatter.time(stampLeap2400)).assertEqual('2400-02-29 23:59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_1000
     * @tc.name      testFormatterTime0002
     * @tc.desc      Verify time() renders the last non-leap February day and
     *               rolls invalid February 29 input onto March 1 per Date.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterTime0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterTime0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stampFeb28: number = new Date(2026, 1, 28, 23, 59, 59).getTime();
      expect(Formatter.time(stampFeb28)).assertEqual('2026-02-28 23:59:59');
      const stampRoll2026: number = new Date(2026, 1, 29, 0, 0, 0).getTime();
      expect(Formatter.time(stampRoll2026)).assertEqual('2026-03-01 00:00:00');
      const stampRoll2100: number = new Date(2100, 1, 29, 0, 0, 0).getTime();
      expect(Formatter.time(stampRoll2100)).assertEqual('2100-03-01 00:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_1100
     * @tc.name      testFormatterTime0003
     * @tc.desc      Verify time() zero pads the first day of several months
     *               including the all-zero midnight moment of January.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterTime0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterTime0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stampJan: number = new Date(2026, 0, 1, 0, 0, 0).getTime();
      expect(Formatter.time(stampJan)).assertEqual('2026-01-01 00:00:00');
      const stampApr: number = new Date(2026, 3, 1, 0, 0, 1).getTime();
      expect(Formatter.time(stampApr)).assertEqual('2026-04-01 00:00:01');
      const stampNextYear: number = new Date(2027, 0, 1, 13, 14, 15).getTime();
      expect(Formatter.time(stampNextYear)).assertEqual('2027-01-01 13:14:15');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_1200
     * @tc.name      testFormatterTime0004
     * @tc.desc      Verify time() renders month-end stamps at the maximal
     *               23:59:59 clock for 31, 30 and 28 day months.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterTime0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterTime0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stampJanEnd: number = new Date(2026, 0, 31, 23, 59, 59).getTime();
      expect(Formatter.time(stampJanEnd)).assertEqual('2026-01-31 23:59:59');
      const stampAprEnd: number = new Date(2026, 3, 30, 23, 59, 59).getTime();
      expect(Formatter.time(stampAprEnd)).assertEqual('2026-04-30 23:59:59');
      const stampFebEnd: number = new Date(2025, 1, 28, 23, 59, 59).getTime();
      expect(Formatter.time(stampFebEnd)).assertEqual('2025-02-28 23:59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_1300
     * @tc.name      testFormatterTime0005
     * @tc.desc      Verify time() renders the epoch start, the pre-epoch
     *               second and the 2038 boundary date with negative or large
     *               timestamps handled by the local Date fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterTime0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterTime0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stampEpoch: number = new Date(1970, 0, 1, 0, 0, 0).getTime();
      expect(Formatter.time(stampEpoch)).assertEqual('1970-01-01 00:00:00');
      const stampPreEpoch: number = new Date(1969, 11, 31, 23, 59, 59).getTime();
      expect(Formatter.time(stampPreEpoch)).assertEqual('1969-12-31 23:59:59');
      const stamp2038: number = new Date(2038, 0, 19, 3, 14, 8).getTime();
      expect(Formatter.time(stamp2038)).assertEqual('2038-01-19 03:14:08');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_1400
     * @tc.name      testFormatterTime0006
     * @tc.desc      Verify time() ignores the millisecond component and keeps
     *               seconds unchanged for stamps carrying sub-second parts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterTime0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterTime0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stampMs999: number = new Date(2026, 5, 15, 10, 20, 30, 999).getTime();
      expect(Formatter.time(stampMs999)).assertEqual('2026-06-15 10:20:30');
      const stampMs500: number = new Date(2026, 11, 31, 23, 59, 59, 500).getTime();
      expect(Formatter.time(stampMs500)).assertEqual('2026-12-31 23:59:59');
      const stampMs1: number = new Date(2024, 1, 29, 0, 0, 0, 1).getTime();
      expect(Formatter.time(stampMs1)).assertEqual('2024-02-29 00:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_1500
     * @tc.name      testFormatterFileStamp0001
     * @tc.desc      Verify fileStamp() splits into an eight digit date part and
     *               a six digit time part around the underscore at index 8.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterFileStamp0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterFileStamp0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stamp: number = new Date(2025, 5, 30, 18, 45, 59).getTime();
      const text: string = Formatter.fileStamp(stamp);
      expect(text).assertEqual('20250630_184559');
      expect(text.length).assertEqual(15);
      expect(text.charAt(8)).assertEqual('_');
      expect(text.indexOf('_')).assertEqual(8);
      expect(text.lastIndexOf('_')).assertEqual(8);
      expect(text.substring(0, 8)).assertEqual('20250630');
      expect(text.substring(9)).assertEqual('184559');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_1600
     * @tc.name      testFormatterFileStamp0002
     * @tc.desc      Verify fileStamp() zero pads single digit month, day, hour,
     *               minute and second fields inside the compact stamp.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterFileStamp0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterFileStamp0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stampLeapZero: number = new Date(2024, 1, 29, 0, 0, 0).getTime();
      expect(Formatter.fileStamp(stampLeapZero)).assertEqual('20240229_000000');
      const stampJan: number = new Date(2027, 0, 1, 9, 30, 5).getTime();
      expect(Formatter.fileStamp(stampJan)).assertEqual('20270101_093005');
      const stampAug: number = new Date(2029, 7, 9, 6, 7, 8).getTime();
      expect(Formatter.fileStamp(stampAug)).assertEqual('20290809_060708');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_1700
     * @tc.name      testFormatterFileStamp0003
     * @tc.desc      Verify fileStamp() emits only digit characters outside the
     *               separator so generated names stay filesystem friendly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterFileStamp0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterFileStamp0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const isAllDigits = (text: string, start: number, end: number): boolean => {
        for (let i = start; i < end; i++) {
          const code: number = text.charCodeAt(i);
          if (code < 48 || code > 57) {
            return false;
          }
        }
        return true;
      };
      const stamp: number = new Date(2028, 11, 15, 6, 7, 8).getTime();
      const text: string = Formatter.fileStamp(stamp);
      expect(text).assertEqual('20281215_060708');
      expect(text.length).assertEqual(15);
      expect(text.substring(0, 8).length).assertEqual(8);
      expect(text.substring(9).length).assertEqual(6);
      expect(isAllDigits(text, 0, 8)).assertTrue();
      expect(isAllDigits(text, 9, 15)).assertTrue();
      expect(text.indexOf('-')).assertEqual(-1);
      expect(text.indexOf(':')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_1800
     * @tc.name      testFormatterFileStamp0004
     * @tc.desc      Verify fileStamp() renders boundary moments such as the
     *               last second of a year and of non-leap and leap Februaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterFileStamp0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterFileStamp0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stampYearEnd: number = new Date(2025, 11, 31, 23, 59, 59).getTime();
      expect(Formatter.fileStamp(stampYearEnd)).assertEqual('20251231_235959');
      const stampFebEnd: number = new Date(2026, 1, 28, 12, 0, 0).getTime();
      expect(Formatter.fileStamp(stampFebEnd)).assertEqual('20260228_120000');
      const stampLeapEnd: number = new Date(2024, 1, 29, 23, 59, 59).getTime();
      expect(Formatter.fileStamp(stampLeapEnd)).assertEqual('20240229_235959');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_1900
     * @tc.name      testFormatterInitial0001
     * @tc.desc      Verify initial() returns the uppercased first letter for
     *               the uppercase matrix of names starting from A through G.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterInitial0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterInitial0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.initial('Bob')).assertEqual('B');
      expect(Formatter.initial('CHARLIE')).assertEqual('C');
      expect(Formatter.initial('david')).assertEqual('D');
      expect(Formatter.initial('Eve')).assertEqual('E');
      expect(Formatter.initial('frank')).assertEqual('F');
      expect(Formatter.initial('Grace')).assertEqual('G');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_2000
     * @tc.name      testFormatterInitial0002
     * @tc.desc      Verify initial() normalizes every lowercase leading letter
     *               in the matrix from H through M to its capital form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterInitial0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterInitial0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.initial('henry')).assertEqual('H');
      expect(Formatter.initial('ivy')).assertEqual('I');
      expect(Formatter.initial('jack')).assertEqual('J');
      expect(Formatter.initial('kate')).assertEqual('K');
      expect(Formatter.initial('liam')).assertEqual('L');
      expect(Formatter.initial('mia')).assertEqual('M');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_2100
     * @tc.name      testFormatterInitial0003
     * @tc.desc      Verify initial() skips tabs and newlines as well as spaces
     *               before reading the first meaningful letter of the name.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterInitial0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterInitial0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.initial('\tNina')).assertEqual('N');
      expect(Formatter.initial('\nOscar\n')).assertEqual('O');
      expect(Formatter.initial('  Peter  ')).assertEqual('P');
      expect(Formatter.initial(' Q ')).assertEqual('Q');
      expect(Formatter.initial('   Ruth')).assertEqual('R');
      expect(Formatter.initial('\t  Sam')).assertEqual('S');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_2200
     * @tc.name      testFormatterInitial0004
     * @tc.desc      Verify initial() falls back to the hash placeholder for
     *               digits, CJK names, full-width capitals and Greek letters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterInitial0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterInitial0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.initial('9lives')).assertEqual('#');
      expect(Formatter.initial('007bond')).assertEqual('#');
      expect(Formatter.initial('张伟')).assertEqual('#');
      expect(Formatter.initial('李雷')).assertEqual('#');
      expect(Formatter.initial('日本語')).assertEqual('#');
      expect(Formatter.initial('Ａlice')).assertEqual('#');
      expect(Formatter.initial('Ωmega')).assertEqual('#');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_2300
     * @tc.name      testFormatterInitial0005
     * @tc.desc      Verify initial() maps surrogate pair emoji, accented Latin
     *               letters and the dotless i through the Unicode first char.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterInitial0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterInitial0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.initial('😀')).assertEqual('#');
      expect(Formatter.initial(' 🌟Star')).assertEqual('#');
      expect(Formatter.initial('émile')).assertEqual('#');
      expect(Formatter.initial('ıvan')).assertEqual('I');
      expect(Formatter.initial('œuf')).assertEqual('#');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_2400
     * @tc.name      testFormatterInitial0006
     * @tc.desc      Verify initial() handles mixed-case words and single
     *               letters in the tail matrix of the alphabet X through Z.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterInitial0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterInitial0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.initial('mIxEd')).assertEqual('M');
      expect(Formatter.initial('x')).assertEqual('X');
      expect(Formatter.initial('Y')).assertEqual('Y');
      expect(Formatter.initial('z')).assertEqual('Z');
      expect(Formatter.initial(' Noah')).assertEqual('N');
      expect(Formatter.initial('oLivia')).assertEqual('O');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_2500
     * @tc.name      testFormatterBytes0009
     * @tc.desc      Verify bytes() output carries the exact unit token B, KB
     *               or MB together with the expected numeric prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const bText: string = Formatter.bytes(750);
      expect(bText).assertContain(' B');
      expect(bText).assertContain('750');
      const kbText: string = Formatter.bytes(4096);
      expect(kbText).assertContain(' KB');
      expect(kbText).assertContain('4.0');
      const mbText: string = Formatter.bytes(7340032);
      expect(mbText).assertContain(' MB');
      expect(mbText).assertContain('7.00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_2600
     * @tc.name      testFormatterBytes0010
     * @tc.desc      Verify the decimal separator appears in KB and MB outputs
     *               while the B tier keeps an integer-only rendering.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.bytes(640)).assertEqual('640 B');
      expect(Formatter.bytes(1011)).assertEqual('1011 B');
      expect(Formatter.bytes(5120)).assertContain('.');
      expect(Formatter.bytes(4194304)).assertContain('.');
      expect(Formatter.bytes(5120)).assertEqual('5.0 KB');
      expect(Formatter.bytes(4194304)).assertEqual('4.00 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_2700
     * @tc.name      testFormatterBytes0011
     * @tc.desc      Verify every power-of-two size from 1 through 512 renders
     *               as the plain byte count followed by the B unit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let power: number = 1;
      for (let i = 0; i < 10; i++) {
        const expected: string = '' + power + ' B';
        expect(Formatter.bytes(power)).assertEqual(expected);
        power = power * 2;
      }
      expect(power).assertEqual(1024);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_2800
     * @tc.name      testFormatterBytes0012
     * @tc.desc      Verify whole mebibyte multiples from one through eight
     *               render with the two decimal MB pattern N.00 MB.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 1; i <= 8; i++) {
        const expected: string = '' + i + '.00 MB';
        expect(Formatter.bytes(i * 1048576)).assertEqual(expected);
      }
      expect(Formatter.bytes(9 * 1048576)).assertEqual('9.00 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_2900
     * @tc.name      testFormatterBytes0013
     * @tc.desc      Verify odd sizes round to the expected one or two decimal
     *               figures instead of truncating or shifting units.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.bytes(2050)).assertEqual('2.0 KB');
      expect(Formatter.bytes(1032)).assertEqual('1.0 KB');
      expect(Formatter.bytes(7852)).assertEqual('7.7 KB');
      expect(Formatter.bytes(999424)).assertEqual('976.0 KB');
      expect(Formatter.bytes(1300000)).assertEqual('1.24 MB');
      expect(Formatter.bytes(2457600)).assertEqual('2.34 MB');
      expect(Formatter.bytes(3600000)).assertEqual('3.43 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_3000
     * @tc.name      testFormatterBytes0014
     * @tc.desc      Verify the 512 KiB approach ladder keeps one decimal KB
     *               figures climbing toward the upper KB range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterBytes0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterBytes0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.bytes(460800)).assertEqual('450.0 KB');
      expect(Formatter.bytes(471040)).assertEqual('460.0 KB');
      expect(Formatter.bytes(491520)).assertEqual('480.0 KB');
      expect(Formatter.bytes(507904)).assertEqual('496.0 KB');
      expect(Formatter.bytes(516096)).assertEqual('504.0 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_3100
     * @tc.name      testFormatterTime0007
     * @tc.desc      Verify the rendered timestamp keeps its exact 19 character
     *               shape with dashes, space and colons at fixed positions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterTime0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterTime0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stamp: number = new Date(2027, 4, 17, 9, 41, 7).getTime();
      const text: string = Formatter.time(stamp);
      expect(text).assertEqual('2027-05-17 09:41:07');
      expect(text.length).assertEqual(19);
      expect(text.charAt(4)).assertEqual('-');
      expect(text.charAt(7)).assertEqual('-');
      expect(text.charAt(10)).assertEqual(' ');
      expect(text.charAt(13)).assertEqual(':');
      expect(text.charAt(16)).assertEqual(':');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_3200
     * @tc.name      testFormatterTime0008
     * @tc.desc      Verify the first day of every month in 2026 renders the
     *               right padded month number and a fixed noon suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterTime0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterTime0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let m = 0; m < 12; m++) {
        const stamp: number = new Date(2026, m, 1, 12, 0, 0).getTime();
        const text: string = Formatter.time(stamp);
        let prefix: string;
        if (m < 9) {
          prefix = '2026-0' + (m + 1) + '-01';
        } else {
          prefix = '2026-' + (m + 1) + '-01';
        }
        expect(text).assertContain(prefix);
        expect(text.substring(11)).assertEqual('12:00:00');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_3300
     * @tc.name      testFormatterTime0009
     * @tc.desc      Verify leap year month-end days of 31, 29 and 30 render
     *               unchanged late in the evening at 22:22:22.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterTime0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterTime0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stampA: number = new Date(2024, 0, 31, 22, 22, 22).getTime();
      expect(Formatter.time(stampA)).assertEqual('2024-01-31 22:22:22');
      const stampB: number = new Date(2024, 1, 29, 22, 22, 22).getTime();
      expect(Formatter.time(stampB)).assertEqual('2024-02-29 22:22:22');
      const stampC: number = new Date(2024, 3, 30, 22, 22, 22).getTime();
      expect(Formatter.time(stampC)).assertEqual('2024-04-30 22:22:22');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_3400
     * @tc.name      testFormatterTime0010
     * @tc.desc      Verify century-spanning and far-future dates render with
     *               correct four digit years without overflow artifacts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterTime0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterTime0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stampA: number = new Date(2001, 8, 9, 1, 46, 40).getTime();
      expect(Formatter.time(stampA)).assertEqual('2001-09-09 01:46:40');
      const stampB: number = new Date(2050, 5, 15, 12, 0, 0).getTime();
      expect(Formatter.time(stampB)).assertEqual('2050-06-15 12:00:00');
      const stampC: number = new Date(2099, 11, 31, 23, 59, 59).getTime();
      expect(Formatter.time(stampC)).assertEqual('2099-12-31 23:59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_3500
     * @tc.name      testFormatterFileStamp0005
     * @tc.desc      Verify fileStamp() equals time() with separators removed,
     *               rebuilt by concatenating the digit groups in order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterFileStamp0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterFileStamp0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stampA: number = new Date(2026, 7, 9, 14, 30, 25).getTime();
      const timeA: string = Formatter.time(stampA);
      expect(timeA).assertEqual('2026-08-09 14:30:25');
      const rebuiltA: string = timeA.substring(0, 4) + timeA.substring(5, 7) + timeA.substring(8, 10) +
        '_' + timeA.substring(11, 13) + timeA.substring(14, 16) + timeA.substring(17, 19);
      expect(Formatter.fileStamp(stampA)).assertEqual(rebuiltA);
      const stampB: number = new Date(2025, 2, 17, 8, 5, 3).getTime();
      const timeB: string = Formatter.time(stampB);
      expect(timeB).assertEqual('2025-03-17 08:05:03');
      const rebuiltB: string = timeB.substring(0, 4) + timeB.substring(5, 7) + timeB.substring(8, 10) +
        '_' + timeB.substring(11, 13) + timeB.substring(14, 16) + timeB.substring(17, 19);
      expect(Formatter.fileStamp(stampB)).assertEqual(rebuiltB);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_3600
     * @tc.name      testFormatterFileStamp0006
     * @tc.desc      Verify a six year loop of stamps always has length 15, an
     *               underscore at index 8 and a fixed time suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterFileStamp0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterFileStamp0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const years: number[] = [2023, 2024, 2025, 2026, 2027, 2028];
      for (let i = 0; i < years.length; i++) {
        const stamp: number = new Date(years[i], 5, 15, 10, 30, 45).getTime();
        const text: string = Formatter.fileStamp(stamp);
        expect(text.length).assertEqual(15);
        expect(text.charAt(8)).assertEqual('_');
        expect(text.indexOf('_')).assertEqual(8);
        expect(text.substring(0, 4)).assertEqual('' + years[i]);
        expect(text.substring(9)).assertEqual('103045');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_3700
     * @tc.name      testFormatterFileStamp0007
     * @tc.desc      Verify both digit groups of a stamp pass the charCode
     *               digit check while the separator code equals underscore.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterFileStamp0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterFileStamp0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stamp: number = new Date(2030, 0, 2, 3, 4, 5).getTime();
      const text: string = Formatter.fileStamp(stamp);
      expect(text).assertEqual('20300102_030405');
      const isAllDigits = (start: number, end: number): boolean => {
        for (let i = start; i < end; i++) {
          const code: number = text.charCodeAt(i);
          if (code < 48 || code > 57) {
            return false;
          }
        }
        return true;
      };
      expect(isAllDigits(0, 8)).assertTrue();
      expect(isAllDigits(9, 15)).assertTrue();
      expect(text.charCodeAt(8)).assertEqual(95);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_3800
     * @tc.name      testFormatterFileStamp0008
     * @tc.desc      Verify midnight stamps for three distant dates all end
     *               with the six zero time suffix after the underscore.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterFileStamp0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterFileStamp0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stamps: string[] = [];
      stamps.push(Formatter.fileStamp(new Date(2025, 3, 12, 0, 0, 0).getTime()));
      stamps.push(Formatter.fileStamp(new Date(2026, 9, 7, 0, 0, 0).getTime()));
      stamps.push(Formatter.fileStamp(new Date(2027, 0, 19, 0, 0, 0).getTime()));
      expect(stamps[0]).assertEqual('20250412_000000');
      expect(stamps[1]).assertEqual('20261007_000000');
      expect(stamps[2]).assertEqual('20270119_000000');
      for (let i = 0; i < stamps.length; i++) {
        expect(stamps[i].substring(9)).assertEqual('000000');
        expect(stamps[i].length).assertEqual(15);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_3900
     * @tc.name      testFormatterInitial0007
     * @tc.desc      Verify the full A to Z ladder maps both upper and lower
     *               ASCII letters to the identical capital initial.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterInitial0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterInitial0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let i = 0; i < 26; i++) {
        const upper: string = String.fromCharCode(65 + i);
        expect(Formatter.initial(upper)).assertEqual(upper);
        const lower: string = String.fromCharCode(97 + i);
        expect(Formatter.initial(lower)).assertEqual(upper);
      }
      expect(Formatter.initial('Zz')).assertEqual('Z');
      expect(Formatter.initial('aA')).assertEqual('A');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_4000
     * @tc.name      testFormatterInitial0008
     * @tc.desc      Verify whitespace-only names collapse to the hash while
     *               inner spaces never break the leading letter extraction.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterInitial0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterInitial0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.initial('      ')).assertEqual('#');
      expect(Formatter.initial('\t\t\t')).assertEqual('#');
      expect(Formatter.initial('\n \n')).assertEqual('#');
      expect(Formatter.initial('Bo b')).assertEqual('B');
      expect(Formatter.initial('Bob ')).assertEqual('B');
      expect(Formatter.initial(' Bob')).assertEqual('B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_4100
     * @tc.name      testFormatterInitial0009
     * @tc.desc      Verify two character names keep only the first letter
     *               rule whatever the second character happens to be.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterInitial0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterInitial0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.initial('Al')).assertEqual('A');
      expect(Formatter.initial('bZ')).assertEqual('B');
      expect(Formatter.initial('Za')).assertEqual('Z');
      expect(Formatter.initial('1a')).assertEqual('#');
      expect(Formatter.initial('中a')).assertEqual('#');
      expect(Formatter.initial('éa')).assertEqual('#');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_4200
     * @tc.name      testFormatterInitial0010
     * @tc.desc      Verify long multi-syllable names still reduce to exactly
     *               one capital taken from the first character position.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterInitial0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterInitial0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.initial('Alexander')).assertEqual('A');
      expect(Formatter.initial('bartholomew')).assertEqual('B');
      expect(Formatter.initial('CHRISTOPHER')).assertEqual('C');
      expect(Formatter.initial('  Zephyrine  ')).assertEqual('Z');
      expect(Formatter.initial('washington')).assertEqual('W');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_FMAT_4300
     * @tc.name      testFormatterInitial0011
     * @tc.desc      Verify uppercase accented Latin capitals beyond the ASCII
     *               range fall back to the hash placeholder consistently.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatterInitial0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatterInitial0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Formatter.initial('Émile')).assertEqual('#');
      expect(Formatter.initial('Ñoño')).assertEqual('#');
      expect(Formatter.initial('Åse')).assertEqual('#');
      expect(Formatter.initial('Ünal')).assertEqual('#');
      expect(Formatter.initial('Øystein')).assertEqual('#');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
