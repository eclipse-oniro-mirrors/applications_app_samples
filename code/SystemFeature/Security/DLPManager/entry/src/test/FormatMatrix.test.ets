/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { ensureExtension, formatDateOnly, formatDuration, formatExpiry, formatPercent, formatRelative,
  formatSize, formatTimestamp, maskAccount, padLeft, parseSize, sanitizeFileName, truncateEnd,
  truncateMiddle, uniqueName } from '../main/ets/core/FormatCore';

const KB: number = 1024;
const MB: number = 1024 * 1024;
const GB: number = 1024 * 1024 * 1024;
const TB: number = 1024 * 1024 * 1024 * 1024;

function repeatChar(ch: string, count: number): string {
  let result: string = '';
  for (let index = 0; index < count; index++) {
    result += ch;
  }
  return result;
}

export default function formatMatrixTest(): void {
  describe('FormatMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0001
     * @tc.name      testBytesUnits0001
     * @tc.desc      byte values keep the B unit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBytesUnits0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBytesUnits0001 begin');
      expect(formatSize(0, 1)).assertEqual('0 B');
      expect(formatSize(1, 1)).assertEqual('1 B');
      expect(formatSize(512, 1)).assertEqual('512 B');
      expect(formatSize(1023, 1)).assertEqual('1023 B');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0002
     * @tc.name      testKilobyteUnits0002
     * @tc.desc      kilobyte values switch to KB
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testKilobyteUnits0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testKilobyteUnits0002 begin');
      expect(formatSize(KB, 1)).assertEqual('1 KB');
      expect(formatSize(KB + 1, 1)).assertEqual('1 KB');
      expect(formatSize(KB * 2, 0)).assertEqual('2 KB');
      expect(formatSize(KB * 10, 1)).assertEqual('10 KB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0003
     * @tc.name      testMegabyteUnits0003
     * @tc.desc      megabyte values switch to MB
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMegabyteUnits0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMegabyteUnits0003 begin');
      expect(formatSize(MB, 2)).assertEqual('1 MB');
      expect(formatSize(MB + MB / 2, 1)).assertEqual('1.5 MB');
      expect(formatSize(MB * 10, 0)).assertEqual('10 MB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0004
     * @tc.name      testGigabyteUnits0004
     * @tc.desc      gigabyte values switch to GB
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testGigabyteUnits0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testGigabyteUnits0004 begin');
      expect(formatSize(GB, 1)).assertEqual('1 GB');
      expect(formatSize(GB * 2 + GB / 2, 1)).assertEqual('2.5 GB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0005
     * @tc.name      testTerabyteUnits0005
     * @tc.desc      terabyte values switch to TB
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTerabyteUnits0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTerabyteUnits0005 begin');
      expect(formatSize(TB, 1)).assertEqual('1 TB');
      expect(formatSize(TB * 2, 1)).assertEqual('2 TB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0006
     * @tc.name      testNegativeSize0006
     * @tc.desc      negative sizes keep the minus sign
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNegativeSize0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNegativeSize0006 begin');
      expect(formatSize(-2048, 1)).assertEqual('-2 KB');
      expect(formatSize(-1, 0)).assertEqual('-1 B');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0007
     * @tc.name      testSizeDecimals0007
     * @tc.desc      decimal settings change the precision
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSizeDecimals0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSizeDecimals0007 begin');
      expect(formatSize(KB + 128, 0)).assertEqual('1 KB');
      expect(formatSize(KB + 128, 1)).assertEqual('1.1 KB');
      expect(formatSize(KB + 128, 2)).assertEqual('1.13 KB');
      expect(formatSize(KB + 128, 3)).assertEqual('1.125 KB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0008
     * @tc.name      testSizeInvalid0008
     * @tc.desc      non finite sizes fall back to zero bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSizeInvalid0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSizeInvalid0008 begin');
      expect(formatSize(Number.NaN, 1)).assertEqual('0 B');
      expect(formatSize(Number.POSITIVE_INFINITY, 1)).assertEqual('0 B');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0009
     * @tc.name      testParseSizeUnits0009
     * @tc.desc      size parsing covers every supported unit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizeUnits0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSizeUnits0009 begin');
      expect(parseSize('0')).assertEqual(0);
      expect(parseSize('512')).assertEqual(512);
      expect(parseSize('1KB')).assertEqual(KB);
      expect(parseSize('1K')).assertEqual(KB);
      expect(parseSize('1.5MB')).assertEqual(MB + MB / 2);
      expect(parseSize('2GB')).assertEqual(GB * 2);
      expect(parseSize('1TB')).assertEqual(TB);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0010
     * @tc.name      testParseSizeInvalid0010
     * @tc.desc      invalid size texts are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizeInvalid0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSizeInvalid0010 begin');
      expect(parseSize('')).assertEqual(-1);
      expect(parseSize('PB')).assertEqual(-1);
      expect(parseSize('1PB')).assertEqual(-1);
      expect(parseSize('-1KB')).assertEqual(-1);
      expect(parseSize('1.2.3MB')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0011
     * @tc.name      testParseSizeRoundTrip0011
     * @tc.desc      formatted sizes parse back within one unit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizeRoundTrip0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSizeRoundTrip0011 begin');
      expect(parseSize(formatSize(MB * 4, 1))).assertEqual(MB * 4);
      expect(parseSize(formatSize(GB, 1))).assertEqual(GB);
      expect(parseSize(formatSize(KB * 16, 0))).assertEqual(KB * 16);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0012
     * @tc.name      testTimestampMorning0012
     * @tc.desc      early timestamps format with padding
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimestampMorning0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTimestampMorning0012 begin');
      expect(formatTimestamp(0, true)).assertEqual('1970/01/01 00:00:00');
      expect(formatTimestamp(59, true)).assertEqual('1970/01/01 00:00:59');
      expect(formatTimestamp(3600, true)).assertEqual('1970/01/01 01:00:00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0013
     * @tc.name      testTimestampDays0013
     * @tc.desc      day boundaries format correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimestampDays0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTimestampDays0013 begin');
      expect(formatTimestamp(86400, true)).assertEqual('1970/01/02 00:00:00');
      expect(formatTimestamp(604800, true)).assertEqual('1970/01/08 00:00:00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0014
     * @tc.name      testTimestampModern0014
     * @tc.desc      modern timestamps format correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimestampModern0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTimestampModern0014 begin');
      expect(formatTimestamp(1700000000, true)).assertEqual('2023/11/14 22:13:20');
      expect(formatTimestamp(1704067200, true)).assertEqual('2024/01/01 00:00:00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0015
     * @tc.name      testTimestampInvalid0015
     * @tc.desc      invalid timestamps return empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimestampInvalid0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTimestampInvalid0015 begin');
      expect(formatTimestamp(-1, true)).assertEqual('');
      expect(formatTimestamp(Number.NaN, true)).assertEqual('');
      expect(formatDateOnly(-1, true)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0016
     * @tc.name      testDateOnly0016
     * @tc.desc      date only output drops the time part
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDateOnly0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDateOnly0016 begin');
      expect(formatDateOnly(1700000000, true)).assertEqual('2023/11/14');
      expect(formatDateOnly(86400, true)).assertEqual('1970/01/02');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0017
     * @tc.name      testRelativeMinutes0017
     * @tc.desc      relative minutes follow the thresholds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeMinutes0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeMinutes0017 begin');
      const now: number = 100000;
      expect(formatRelative(now, now, true)).assertEqual('刚刚');
      expect(formatRelative(now - 59, now, true)).assertEqual('刚刚');
      expect(formatRelative(now - 60, now, true)).assertEqual('1分钟前');
      expect(formatRelative(now - 3599, now, true)).assertEqual('59分钟前');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0018
     * @tc.name      testRelativeHours0018
     * @tc.desc      relative hours follow the thresholds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeHours0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeHours0018 begin');
      const now: number = 100000;
      expect(formatRelative(now - 3600, now, true)).assertEqual('1小时前');
      expect(formatRelative(now - 86399, now, true)).assertEqual('23小时前');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0019
     * @tc.name      testRelativeDays0019
     * @tc.desc      relative days follow the thresholds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeDays0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeDays0019 begin');
      const now: number = 1000000;
      expect(formatRelative(now - 86400, now, true)).assertEqual('昨天');
      expect(formatRelative(now - 172800, now, true)).assertEqual('2天前');
      expect(formatRelative(now - 604799, now, true)).assertEqual('6天前');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0020
     * @tc.name      testRelativeFallbacks0020
     * @tc.desc      old and future timestamps fall back safely
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeFallbacks0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeFallbacks0020 begin');
      expect(formatRelative(0, 604800, true)).assertEqual('1970/01/01');
      expect(formatRelative(200, 100, true)).assertEqual('未来');
      expect(formatRelative(-1, 100, true)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0021
     * @tc.name      testDurationSweep0021
     * @tc.desc      durations format with or without hours
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationSweep0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDurationSweep0021 begin');
      expect(formatDuration(0)).assertEqual('0:00');
      expect(formatDuration(9)).assertEqual('0:09');
      expect(formatDuration(60)).assertEqual('1:00');
      expect(formatDuration(3599)).assertEqual('59:59');
      expect(formatDuration(3600)).assertEqual('1:00:00');
      expect(formatDuration(86399)).assertEqual('23:59:59');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0022
     * @tc.name      testDurationInvalid0022
     * @tc.desc      invalid durations use the placeholder
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationInvalid0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDurationInvalid0022 begin');
      expect(formatDuration(-1)).assertEqual('--:--');
      expect(formatDuration(Number.NaN)).assertEqual('--:--');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0023
     * @tc.name      testPercentSweep0023
     * @tc.desc      percentages cover typical ratios
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentSweep0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPercentSweep0023 begin');
      expect(formatPercent(0, 100, 1)).assertEqual('0%');
      expect(formatPercent(1, 100, 1)).assertEqual('1%');
      expect(formatPercent(50, 100, 1)).assertEqual('50%');
      expect(formatPercent(100, 100, 1)).assertEqual('100%');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0024
     * @tc.name      testPercentPrecision0024
     * @tc.desc      percentage precision follows the requested decimals
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentPrecision0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPercentPrecision0024 begin');
      expect(formatPercent(1, 3, 0)).assertEqual('33%');
      expect(formatPercent(1, 3, 1)).assertEqual('33.3%');
      expect(formatPercent(1, 3, 2)).assertEqual('33.33%');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0025
     * @tc.name      testPercentEdge0025
     * @tc.desc      overflow and invalid totals are handled
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentEdge0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPercentEdge0025 begin');
      expect(formatPercent(200, 100, 0)).assertEqual('200%');
      expect(formatPercent(1, 0, 1)).assertEqual('0%');
      expect(formatPercent(1, -5, 1)).assertEqual('0%');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0026
     * @tc.name      testTruncateMatrix0026
     * @tc.desc      truncation keeps the requested width
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateMatrix0026 begin');
      expect(truncateEnd('abcdef', 5, '...')).assertEqual('ab...');
      expect(truncateMiddle('abcdefgh', 7, '...')).assertEqual('ab...gh');
      expect(truncateMiddle('abcdefgh', 5, '...')).assertEqual('a...h');
      expect(truncateEnd('你好世界', 3, '…')).assertEqual('你好…');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0027
     * @tc.name      testSanitizeMatrix0027
     * @tc.desc      illegal characters are removed and trimmed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSanitizeMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSanitizeMatrix0027 begin');
      expect(sanitizeFileName('a|b/c\\d:e*f?g"h<i>j')).assertEqual('abcdefghij');
      expect(sanitizeFileName('  .a.b.  ')).assertEqual('a.b');
      expect(sanitizeFileName('a' + String.fromCharCode(0x0A) + 'b')).assertEqual('ab');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0028
     * @tc.name      testSanitizeEdges0028
     * @tc.desc      empty and reserved names are handled
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSanitizeEdges0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSanitizeEdges0028 begin');
      expect(sanitizeFileName('')).assertEqual('unnamed');
      expect(sanitizeFileName('...')).assertEqual('unnamed');
      expect(sanitizeFileName('aux')).assertEqual('_aux');
      expect(sanitizeFileName('com1')).assertEqual('_com1');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0029
     * @tc.name      testSanitizeLength0029
     * @tc.desc      long names are limited to 255 code units
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSanitizeLength0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSanitizeLength0029 begin');
      expect(sanitizeFileName(repeatChar('a', 400)).length).assertEqual(255);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0030
     * @tc.name      testEnsureExtensionMatrix0030
     * @tc.desc      extensions are added only when missing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEnsureExtensionMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEnsureExtensionMatrix0030 begin');
      expect(ensureExtension('report', 'txt')).assertEqual('report.txt');
      expect(ensureExtension('report', '.txt')).assertEqual('report.txt');
      expect(ensureExtension('report.TXT', 'txt')).assertEqual('report.TXT');
      expect(ensureExtension('report', '')).assertEqual('report');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0031
     * @tc.name      testUniqueNameMatrix0031
     * @tc.desc      duplicate suffixes are inserted before the extension
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUniqueNameMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUniqueNameMatrix0031 begin');
      expect(uniqueName('a.txt', 0)).assertEqual('a.txt');
      expect(uniqueName('a.txt', 1)).assertEqual('a(1).txt');
      expect(uniqueName('a.txt', 99)).assertEqual('a(99).txt');
      expect(uniqueName('.gitignore', 2)).assertEqual('.gitignore(2)');
      expect(uniqueName('noext', 3)).assertEqual('noext(3)');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0032
     * @tc.name      testMaskMatrix0032
     * @tc.desc      account masks hide the middle characters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaskMatrix0032 begin');
      expect(maskAccount('')).assertEqual('');
      expect(maskAccount('ab')).assertEqual('**');
      expect(maskAccount('abcd')).assertEqual('a**d');
      expect(maskAccount('abcdefgh')).assertEqual('ab***gh');
      expect(maskAccount('张三丰')).assertEqual('张**丰');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0033
     * @tc.name      testExpiryMatrix0033
     * @tc.desc      expiry labels cover permanent and dated policies
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpiryMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExpiryMatrix0033 begin');
      expect(formatExpiry(0, true)).assertEqual('永久');
      expect(formatExpiry(-10, true)).assertEqual('永久');
      expect(formatExpiry(Number.NaN, true)).assertEqual('永久');
      expect(formatExpiry(1700000000, true)).assertEqual('2023/11/14');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX_0034
     * @tc.name      testPadLeftMatrix0034
     * @tc.desc      zero padding covers seconds and years
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPadLeftMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPadLeftMatrix0034 begin');
      expect(padLeft(0, 2)).assertEqual('00');
      expect(padLeft(9, 2)).assertEqual('09');
      expect(padLeft(10, 2)).assertEqual('10');
      expect(padLeft(2026, 4)).assertEqual('2026');
      expect(padLeft(7, 4)).assertEqual('0007');
    })
  });
}
