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

function repeatChar(ch: string, count: number): string {
  let result: string = '';
  for (let index = 0; index < count; index++) {
    result += ch;
  }
  return result;
}

export default function formatMatrix2Test(): void {
  describe('FormatMatrix2Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0001
     * @tc.name      testSizeBoundaries0001
     * @tc.desc      unit switches happen exactly at 1024 boundaries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSizeBoundaries0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatSize(MB - 1, 0)).assertEqual('1024 KB');
      expect(formatSize(MB, 0)).assertEqual('1 MB');
      expect(formatSize(GB, 0)).assertEqual('1 GB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0002
     * @tc.name      testSizeFractions0002
     * @tc.desc      fractional sizes round to the requested precision
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSizeFractions0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatSize(KB * 1.5, 0)).assertEqual('2 KB');
      expect(formatSize(MB * 2.25, 1)).assertEqual('2.3 MB');
      expect(formatSize(GB + GB / 2, 1)).assertEqual('1.5 GB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0003
     * @tc.name      testParseSizeFormats0003
     * @tc.desc      size parsing accepts varied text formats
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizeFormats0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(parseSize(' 2 gb ')).assertEqual(GB * 2);
      expect(parseSize('512B')).assertEqual(512);
      expect(parseSize('0.5K')).assertEqual(512);
      expect(parseSize('1.25M')).assertEqual(MB + MB / 4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0004
     * @tc.name      testParseSizeMalformed0004
     * @tc.desc      malformed sizes are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizeMalformed0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(parseSize('1..5MB')).assertEqual(-1);
      expect(parseSize('.MB')).assertEqual(-1);
      expect(parseSize('MB1')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0005
     * @tc.name      testTimestampCentury0005
     * @tc.desc      century boundaries format correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimestampCentury0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatTimestamp(946684800, true)).assertEqual('2000/01/01 00:00:00');
      expect(formatTimestamp(2147483647, true)).assertEqual('2038/01/19 03:14:07');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0006
     * @tc.name      testTimestampRounding0006
     * @tc.desc      fractional seconds are floored before formatting
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimestampRounding0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatTimestamp(86399.9, true)).assertEqual('1970/01/01 23:59:59');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0007
     * @tc.name      testDateOnlyCentury0007
     * @tc.desc      date only output drops time consistently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDateOnlyCentury0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatDateOnly(946684800, true)).assertEqual('2000/01/01');
      expect(formatDateOnly(0, true)).assertEqual('1970/01/01');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0008
     * @tc.name      testRelativeThresholds0008
     * @tc.desc      relative labels switch at the documented thresholds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeThresholds0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const now: number = 2000000;
      expect(formatRelative(now - 1, now, true)).assertEqual('刚刚');
      expect(formatRelative(now - 61, now, true)).assertEqual('1分钟前');
      expect(formatRelative(now - 3601, now, true)).assertEqual('1小时前');
      expect(formatRelative(now - 86401, now, true)).assertEqual('昨天');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0009
     * @tc.name      testDurationLarge0009
     * @tc.desc      durations above a day format in hours
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationLarge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatDuration(86400)).assertEqual('24:00:00');
      expect(formatDuration(90061)).assertEqual('25:01:01');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0010
     * @tc.name      testPercentEdges0010
     * @tc.desc      percentage edges round correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentEdges0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatPercent(1, 1000, 1)).assertEqual('0.1%');
      expect(formatPercent(999, 1000, 1)).assertEqual('99.9%');
      expect(formatPercent(1, 8, 2)).assertEqual('12.5%');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0011
     * @tc.name      testTruncateMarker0011
     * @tc.desc      markers longer than the width are replaced by raw cuts
     * @type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateMarker0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(truncateEnd('abcdef', 2, '...')).assertEqual('ab');
      expect(truncateMiddle('abcdef', 2, '...')).assertEqual('ab');
      expect(truncateMiddle('abcdef', 1, '...')).assertEqual('a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0012
     * @tc.name      testSanitizeMixed0012
     * @tc.desc      sanitizing handles mixed illegal and legal characters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSanitizeMixed0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(sanitizeFileName('  a/b\\c:d*e?f"g<h>i|j  ')).assertEqual('abcdefghij');
      expect(sanitizeFileName('报告<2026>.txt')).assertEqual('报告2026.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0013
     * @tc.name      testSanitizeReservedCase0013
     * @tc.desc      reserved names are detected case insensitively
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSanitizeReservedCase0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(sanitizeFileName('Con')).assertEqual('_Con');
      expect(sanitizeFileName('PRN')).assertEqual('_PRN');
      expect(sanitizeFileName('lpt2')).assertEqual('_lpt2');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0014
     * @tc.name      testEnsureExtensionMulti0014
     * @tc.desc      extension checks handle multi dot names
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEnsureExtensionMulti0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(ensureExtension('a.tar.gz', 'gz')).assertEqual('a.tar.gz');
      expect(ensureExtension('a.tar', 'gz')).assertEqual('a.tar.gz');
      expect(ensureExtension('a', 'GZ')).assertEqual('a.GZ');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0015
     * @tc.name      testUniqueNameMulti0015
     * @tc.desc      duplicate suffixes work for multi dot names
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUniqueNameMulti0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(uniqueName('a.tar.gz', 1)).assertEqual('a.tar(1).gz');
      expect(uniqueName('a.tar.gz', 2)).assertEqual('a.tar(2).gz');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0016
     * @tc.name      testMaskAccountSweep0016
     * @tc.desc      account masking covers every length band
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskAccountSweep0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(maskAccount('')).assertEqual('');
      expect(maskAccount('a')).assertEqual('**');
      expect(maskAccount('abc')).assertEqual('a**c');
      expect(maskAccount('abcde')).assertEqual('ab***de');
      expect(maskAccount('abcdefghijklmn')).assertEqual('ab***mn');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0017
     * @tc.name      testExpiryEdges0017
     * @tc.desc      expiry labels cover boundary inputs
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpiryEdges0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatExpiry(0, true)).assertEqual('永久');
      expect(formatExpiry(1, true)).assertEqual('1970/01/01');
      expect(formatExpiry(946684800, true)).assertEqual('2000/01/01');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0018
     * @tc.name      testPadLeftWidths0018
     * @tc.desc      padding works for widths up to six
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPadLeftWidths0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(padLeft(1, 6)).assertEqual('000001');
      expect(padLeft(12, 6)).assertEqual('000012');
      expect(padLeft(123456, 6)).assertEqual('123456');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0019
     * @tc.name      testSanitizeDotsOnly0019
     * @tc.desc      dot and space only names become unnamed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSanitizeDotsOnly0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(sanitizeFileName(' . . ')).assertEqual('unnamed');
      expect(sanitizeFileName('....')).assertEqual('unnamed');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0020
     * @tc.name      testDurationZeroBoundary0020
     * @tc.desc      zero and one second durations format correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationZeroBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatDuration(0)).assertEqual('0:00');
      expect(formatDuration(1)).assertEqual('0:01');
      expect(formatDuration(59.99)).assertEqual('0:59');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0021
     * @tc.name      testRelativeFutureBoundary0021
     * @tc.desc      future timestamps are labeled separately
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeFutureBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatRelative(101, 100, true)).assertEqual('未来');
      expect(formatRelative(100, 100, true)).assertEqual('刚刚');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0022
     * @tc.name      testTruncateChineseWidth0022
     * @tc.desc      chinese truncation uses code units
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateChineseWidth0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(truncateEnd('年度报告文件', 4, '…')).assertEqual('年度报…');
      expect(truncateMiddle('年度报告文件', 5, '…')).assertEqual('年度…文件');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0023
     * @tc.name      testSizeZeroDecimals0023
     * @tc.desc      zero decimals keep integers intact
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSizeZeroDecimals0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatSize(100 * KB, 0)).assertEqual('100 KB');
      expect(formatSize(100 * MB, 0)).assertEqual('100 MB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMATMATRIX2_0024
     * @tc.name      testPercentNegativeValue0024
     * @tc.desc      negative percentages keep their sign
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentNegativeValue0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(formatPercent(-50, 100, 0)).assertEqual('-50%');
      expect(formatPercent(-1, 3, 1)).assertEqual('-33.3%');
    })
  });
}
