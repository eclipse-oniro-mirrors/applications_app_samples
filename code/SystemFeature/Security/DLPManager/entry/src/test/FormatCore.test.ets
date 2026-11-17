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
import { padLeft, formatSize, parseSize, formatTimestamp, formatDateOnly, formatRelative, formatDuration,
  formatPercent, truncateEnd, truncateMiddle, sanitizeFileName, ensureExtension, uniqueName, maskAccount,
  formatExpiry } from '../main/ets/core/FormatCore';

const KB: number = 1024;
const MB: number = 1024 * 1024;
const GB: number = 1024 * 1024 * 1024;
const TB: number = 1024 * 1024 * 1024 * 1024;
const SAMPLE_SEC: number = 1700000000;

export default function formatCoreTest(): void {
  describe('FormatCoreTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0001
     * @tc.name      testPadLeft0001
     * @tc.desc      zero is padded to the requested width
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPadLeft0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPadLeft0001 begin');
      console.info('testPadLeft0001 begin');
      expect(padLeft(0, 2)).assertEqual('00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0002
     * @tc.name      testPadLeft0002
     * @tc.desc      single digit is padded with a leading zero
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPadLeft0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPadLeft0002 begin');
      console.info('testPadLeft0002 begin');
      expect(padLeft(5, 2)).assertEqual('05');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0003
     * @tc.name      testPadLeft0003
     * @tc.desc      two digits already reach the width
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPadLeft0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPadLeft0003 begin');
      console.info('testPadLeft0003 begin');
      expect(padLeft(12, 2)).assertEqual('12');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0004
     * @tc.name      testPadLeft0004
     * @tc.desc      wider target keeps numeric content intact
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPadLeft0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPadLeft0004 begin');
      console.info('testPadLeft0004 begin');
      expect(padLeft(123, 5)).assertEqual('00123');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0005
     * @tc.name      testPadLeft0005
     * @tc.desc      narrow target does not truncate
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPadLeft0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPadLeft0005 begin');
      console.info('testPadLeft0005 begin');
      expect(padLeft(123, 1)).assertEqual('123');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0006
     * @tc.name      testPadLeft0006
     * @tc.desc      year width padding produces four digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPadLeft0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPadLeft0006 begin');
      console.info('testPadLeft0006 begin');
      expect(padLeft(7, 4)).assertEqual('0007');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0007
     * @tc.name      testPadLeft0007
     * @tc.desc      width of ten keeps ten characters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPadLeft0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPadLeft0007 begin');
      console.info('testPadLeft0007 begin');
      expect(padLeft(1, 10)).assertEqual('0000000001');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0008
     * @tc.name      testFormatSizeZero0008
     * @tc.desc      zero bytes renders as zero B
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatSizeZero0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatSizeZero0008 begin');
      console.info('testFormatSizeZero0008 begin');
      expect(formatSize(0, 1)).assertEqual('0 B');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0009
     * @tc.name      testFormatSizeBytes0009
     * @tc.desc      small byte counts keep the B unit without decimals
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatSizeBytes0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatSizeBytes0009 begin');
      console.info('testFormatSizeBytes0009 begin');
      expect(formatSize(1, 2)).assertEqual('1 B');
      expect(formatSize(999, 2)).assertEqual('999 B');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0010
     * @tc.name      testFormatSizeKbBoundary0010
     * @tc.desc      exactly one kilobyte switches unit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatSizeKbBoundary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatSizeKbBoundary0010 begin');
      console.info('testFormatSizeKbBoundary0010 begin');
      expect(formatSize(1023, 1)).assertEqual('1023 B');
      expect(formatSize(KB, 1)).assertEqual('1 KB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0011
     * @tc.name      testFormatSizeFraction0011
     * @tc.desc      fractional kilobytes keep one decimal
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatSizeFraction0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatSizeFraction0011 begin');
      console.info('testFormatSizeFraction0011 begin');
      expect(formatSize(KB + 512, 1)).assertEqual('1.5 KB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0012
     * @tc.name      testFormatSizeTrimZeros0012
     * @tc.desc      trailing zeros are trimmed from decimals
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatSizeTrimZeros0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatSizeTrimZeros0012 begin');
      console.info('testFormatSizeTrimZeros0012 begin');
      expect(formatSize(2 * KB, 3)).assertEqual('2 KB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0013
     * @tc.name      testFormatSizeMegabyte0013
     * @tc.desc      megabyte values use the MB unit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatSizeMegabyte0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatSizeMegabyte0013 begin');
      console.info('testFormatSizeMegabyte0013 begin');
      expect(formatSize(MB, 1)).assertEqual('1 MB');
      expect(formatSize(MB * 2, 0)).assertEqual('2 MB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0014
     * @tc.name      testFormatSizeMegabyteDecimal0014
     * @tc.desc      megabytes round to the requested decimals
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatSizeMegabyteDecimal0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatSizeMegabyteDecimal0014 begin');
      console.info('testFormatSizeMegabyteDecimal0014 begin');
      expect(formatSize(1500000, 2)).assertEqual('1.43 MB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0015
     * @tc.name      testFormatSizeGigabyte0015
     * @tc.desc      gigabyte values use the GB unit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatSizeGigabyte0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatSizeGigabyte0015 begin');
      console.info('testFormatSizeGigabyte0015 begin');
      expect(formatSize(GB, 3)).assertEqual('1 GB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0016
     * @tc.name      testFormatSizeTerabyte0016
     * @tc.desc      terabyte is the largest supported unit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatSizeTerabyte0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatSizeTerabyte0016 begin');
      console.info('testFormatSizeTerabyte0016 begin');
      expect(formatSize(TB, 1)).assertEqual('1 TB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0017
     * @tc.name      testFormatSizeHuge0017
     * @tc.desc      values beyond terabyte stay in the TB unit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatSizeHuge0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatSizeHuge0017 begin');
      console.info('testFormatSizeHuge0017 begin');
      expect(formatSize(TB * 1024, 1)).assertEqual('1024 TB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0018
     * @tc.name      testFormatSizeNegative0018
     * @tc.desc      negative sizes keep a minus sign
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatSizeNegative0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatSizeNegative0018 begin');
      console.info('testFormatSizeNegative0018 begin');
      expect(formatSize(-KB, 1)).assertEqual('-1 KB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0019
     * @tc.name      testFormatSizeInvalid0019
     * @tc.desc      non finite sizes fall back to zero B
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatSizeInvalid0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatSizeInvalid0019 begin');
      console.info('testFormatSizeInvalid0019 begin');
      expect(formatSize(Number.POSITIVE_INFINITY, 1)).assertEqual('0 B');
      expect(formatSize(Number.NaN, 1)).assertEqual('0 B');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0020
     * @tc.name      testFormatSizeDecimalsClamp0020
     * @tc.desc      decimals above three are clamped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFormatSizeDecimalsClamp0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFormatSizeDecimalsClamp0020 begin');
      console.info('testFormatSizeDecimalsClamp0020 begin');
      expect(formatSize(KB + 128, 9)).assertEqual('1.125 KB');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0021
     * @tc.name      testParseSizePlainNumber0021
     * @tc.desc      plain numbers are treated as bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizePlainNumber0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSizePlainNumber0021 begin');
      console.info('testParseSizePlainNumber0021 begin');
      expect(parseSize('0')).assertEqual(0);
      expect(parseSize('1')).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0022
     * @tc.name      testParseSizeWithByteUnit0022
     * @tc.desc      B suffix keeps the byte value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizeWithByteUnit0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSizeWithByteUnit0022 begin');
      console.info('testParseSizeWithByteUnit0022 begin');
      expect(parseSize('1B')).assertEqual(1);
      expect(parseSize('256 b')).assertEqual(256);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0023
     * @tc.name      testParseSizeKilobyte0023
     * @tc.desc      KB and K both mean 1024 bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizeKilobyte0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSizeKilobyte0023 begin');
      console.info('testParseSizeKilobyte0023 begin');
      expect(parseSize('1KB')).assertEqual(KB);
      expect(parseSize('1K')).assertEqual(KB);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0024
     * @tc.name      testParseSizeLowercase0024
     * @tc.desc      lowercase units are accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizeLowercase0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSizeLowercase0024 begin');
      console.info('testParseSizeLowercase0024 begin');
      expect(parseSize('2kb')).assertEqual(KB * 2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0025
     * @tc.name      testParseSizeMegabyte0025
     * @tc.desc      decimal megabytes convert to bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizeMegabyte0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSizeMegabyte0025 begin');
      console.info('testParseSizeMegabyte0025 begin');
      expect(parseSize('1.5MB')).assertEqual(MB * 1.5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0026
     * @tc.name      testParseSizeSpaces0026
     * @tc.desc      spaces between number and unit are allowed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizeSpaces0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSizeSpaces0026 begin');
      console.info('testParseSizeSpaces0026 begin');
      expect(parseSize(' 2 GB ')).assertEqual(GB * 2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0027
     * @tc.name      testParseSizeTerabyte0027
     * @tc.desc      terabyte suffix converts correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizeTerabyte0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSizeTerabyte0027 begin');
      console.info('testParseSizeTerabyte0027 begin');
      expect(parseSize('1T')).assertEqual(TB);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0028
     * @tc.name      testParseSizeInvalidUnit0028
     * @tc.desc      unknown units are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizeInvalidUnit0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSizeInvalidUnit0028 begin');
      console.info('testParseSizeInvalidUnit0028 begin');
      expect(parseSize('1PB')).assertEqual(-1);
      expect(parseSize('1,5MB')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0029
     * @tc.name      testParseSizeInvalidText0029
     * @tc.desc      text without digits is rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizeInvalidText0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSizeInvalidText0029 begin');
      console.info('testParseSizeInvalidText0029 begin');
      expect(parseSize('KB')).assertEqual(-1);
      expect(parseSize('-1KB')).assertEqual(-1);
      expect(parseSize('')).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0030
     * @tc.name      testParseSizeRound0030
     * @tc.desc      fractional bytes are rounded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizeRound0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSizeRound0030 begin');
      console.info('testParseSizeRound0030 begin');
      expect(parseSize('12.5')).assertEqual(13);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0031
     * @tc.name      testParseSizeRoundTrip0031
     * @tc.desc      formatted sizes parse back to the source value
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testParseSizeRoundTrip0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testParseSizeRoundTrip0031 begin');
      console.info('testParseSizeRoundTrip0031 begin');
      expect(parseSize(formatSize(KB * 2, 1))).assertEqual(KB * 2);
      expect(parseSize(formatSize(MB * 4, 0))).assertEqual(MB * 4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0032
     * @tc.name      testTimestampEpoch0032
     * @tc.desc      epoch formats in utc
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimestampEpoch0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTimestampEpoch0032 begin');
      console.info('testTimestampEpoch0032 begin');
      expect(formatTimestamp(0, true)).assertEqual('1970/01/01 00:00:00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0033
     * @tc.name      testTimestampSecond0033
     * @tc.desc      one second after epoch formats correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimestampSecond0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTimestampSecond0033 begin');
      console.info('testTimestampSecond0033 begin');
      expect(formatTimestamp(1, true)).assertEqual('1970/01/01 00:00:01');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0034
     * @tc.name      testTimestampDayEnd0034
     * @tc.desc      last second of a day formats correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimestampDayEnd0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTimestampDayEnd0034 begin');
      console.info('testTimestampDayEnd0034 begin');
      expect(formatTimestamp(86399, true)).assertEqual('1970/01/01 23:59:59');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0035
     * @tc.name      testTimestampNextDay0035
     * @tc.desc      start of the second day is zero padded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimestampNextDay0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTimestampNextDay0035 begin');
      console.info('testTimestampNextDay0035 begin');
      expect(formatTimestamp(86400, true)).assertEqual('1970/01/02 00:00:00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0036
     * @tc.name      testTimestampSample0036
     * @tc.desc      a known timestamp matches the reference string
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimestampSample0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTimestampSample0036 begin');
      console.info('testTimestampSample0036 begin');
      expect(formatTimestamp(SAMPLE_SEC, true)).assertEqual('2023/11/14 22:13:20');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0037
     * @tc.name      testTimestampLeapDay0037
     * @tc.desc      leap day is handled by the date conversion
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimestampLeapDay0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTimestampLeapDay0037 begin');
      console.info('testTimestampLeapDay0037 begin');
      expect(formatTimestamp(1709251199, true)).assertEqual('2024/02/29 23:59:59');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0038
     * @tc.name      testTimestampFraction0038
     * @tc.desc      fractional seconds are floored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimestampFraction0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTimestampFraction0038 begin');
      console.info('testTimestampFraction0038 begin');
      expect(formatTimestamp(1.9, true)).assertEqual('1970/01/01 00:00:01');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0039
     * @tc.name      testTimestampNegative0039
     * @tc.desc      negative timestamps return empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimestampNegative0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTimestampNegative0039 begin');
      console.info('testTimestampNegative0039 begin');
      expect(formatTimestamp(-1, true)).assertEqual('');
      expect(formatTimestamp(Number.NaN, true)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0040
     * @tc.name      testTimestampInfinite0040
     * @tc.desc      infinite timestamps return empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTimestampInfinite0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTimestampInfinite0040 begin');
      console.info('testTimestampInfinite0040 begin');
      expect(formatTimestamp(Number.POSITIVE_INFINITY, true)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0041
     * @tc.name      testDateOnlySample0041
     * @tc.desc      date only keeps the first ten characters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDateOnlySample0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDateOnlySample0041 begin');
      console.info('testDateOnlySample0041 begin');
      expect(formatDateOnly(SAMPLE_SEC, true)).assertEqual('2023/11/14');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0042
     * @tc.name      testDateOnlyEpoch0042
     * @tc.desc      epoch date formats as 1970/01/01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDateOnlyEpoch0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDateOnlyEpoch0042 begin');
      console.info('testDateOnlyEpoch0042 begin');
      expect(formatDateOnly(0, true)).assertEqual('1970/01/01');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0043
     * @tc.name      testDateOnlyInvalid0043
     * @tc.desc      invalid timestamps return empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDateOnlyInvalid0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDateOnlyInvalid0043 begin');
      console.info('testDateOnlyInvalid0043 begin');
      expect(formatDateOnly(-5, true)).assertEqual('');
      expect(formatDateOnly(Number.NaN, true)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0044
     * @tc.name      testRelativeJustNow0044
     * @tc.desc      same timestamp shows just now
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeJustNow0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeJustNow0044 begin');
      console.info('testRelativeJustNow0044 begin');
      expect(formatRelative(SAMPLE_SEC, SAMPLE_SEC, true)).assertEqual('刚刚');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0045
     * @tc.name      testRelativeSeconds0045
     * @tc.desc      less than one minute shows just now
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeSeconds0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeSeconds0045 begin');
      console.info('testRelativeSeconds0045 begin');
      expect(formatRelative(SAMPLE_SEC, SAMPLE_SEC + 30, true)).assertEqual('刚刚');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0046
     * @tc.name      testRelativeMinute0046
     * @tc.desc      one minute shows one minute ago
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeMinute0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeMinute0046 begin');
      console.info('testRelativeMinute0046 begin');
      expect(formatRelative(SAMPLE_SEC, SAMPLE_SEC + 60, true)).assertEqual('1分钟前');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0047
     * @tc.name      testRelativeMinutes0047
     * @tc.desc      nearly an hour shows fifty nine minutes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeMinutes0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeMinutes0047 begin');
      console.info('testRelativeMinutes0047 begin');
      expect(formatRelative(SAMPLE_SEC, SAMPLE_SEC + 3599, true)).assertEqual('59分钟前');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0048
     * @tc.name      testRelativeHour0048
     * @tc.desc      one hour shows one hour ago
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeHour0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeHour0048 begin');
      console.info('testRelativeHour0048 begin');
      expect(formatRelative(SAMPLE_SEC, SAMPLE_SEC + 3600, true)).assertEqual('1小时前');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0049
     * @tc.name      testRelativeHours0049
     * @tc.desc      nearly a day shows twenty three hours
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeHours0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeHours0049 begin');
      console.info('testRelativeHours0049 begin');
      expect(formatRelative(SAMPLE_SEC, SAMPLE_SEC + 86399, true)).assertEqual('23小时前');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0050
     * @tc.name      testRelativeYesterday0050
     * @tc.desc      one day shows yesterday
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeYesterday0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeYesterday0050 begin');
      console.info('testRelativeYesterday0050 begin');
      expect(formatRelative(SAMPLE_SEC, SAMPLE_SEC + 86400, true)).assertEqual('昨天');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0051
     * @tc.name      testRelativeYesterdayUpper0051
     * @tc.desc      less than two days still shows yesterday
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeYesterdayUpper0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeYesterdayUpper0051 begin');
      console.info('testRelativeYesterdayUpper0051 begin');
      expect(formatRelative(SAMPLE_SEC, SAMPLE_SEC + 172799, true)).assertEqual('昨天');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0052
     * @tc.name      testRelativeDays0052
     * @tc.desc      two days shows two days ago
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeDays0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeDays0052 begin');
      console.info('testRelativeDays0052 begin');
      expect(formatRelative(SAMPLE_SEC, SAMPLE_SEC + 172800, true)).assertEqual('2天前');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0053
     * @tc.name      testRelativeDaysUpper0053
     * @tc.desc      six days still uses relative days
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeDaysUpper0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeDaysUpper0053 begin');
      console.info('testRelativeDaysUpper0053 begin');
      expect(formatRelative(SAMPLE_SEC, SAMPLE_SEC + 604799, true)).assertEqual('6天前');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0054
     * @tc.name      testRelativeWeekFallback0054
     * @tc.desc      a full week falls back to the absolute date
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeWeekFallback0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeWeekFallback0054 begin');
      console.info('testRelativeWeekFallback0054 begin');
      expect(formatRelative(0, 604800, true)).assertEqual('1970/01/01');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0055
     * @tc.name      testRelativeFuture0055
     * @tc.desc      a later timestamp is reported as future
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeFuture0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeFuture0055 begin');
      console.info('testRelativeFuture0055 begin');
      expect(formatRelative(SAMPLE_SEC + 10, SAMPLE_SEC, true)).assertEqual('未来');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0056
     * @tc.name      testRelativeInvalid0056
     * @tc.desc      invalid inputs return empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRelativeInvalid0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRelativeInvalid0056 begin');
      console.info('testRelativeInvalid0056 begin');
      expect(formatRelative(-1, SAMPLE_SEC, true)).assertEqual('');
      expect(formatRelative(SAMPLE_SEC, Number.NaN, true)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0057
     * @tc.name      testDurationZero0057
     * @tc.desc      zero seconds formats as zero minutes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationZero0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDurationZero0057 begin');
      console.info('testDurationZero0057 begin');
      expect(formatDuration(0)).assertEqual('0:00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0058
     * @tc.name      testDurationSeconds0058
     * @tc.desc      seconds are zero padded
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationSeconds0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDurationSeconds0058 begin');
      console.info('testDurationSeconds0058 begin');
      expect(formatDuration(5)).assertEqual('0:05');
      expect(formatDuration(59)).assertEqual('0:59');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0059
     * @tc.name      testDurationMinute0059
     * @tc.desc      one minute formats with two digit seconds
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationMinute0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDurationMinute0059 begin');
      console.info('testDurationMinute0059 begin');
      expect(formatDuration(60)).assertEqual('1:00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0060
     * @tc.name      testDurationMinutes0060
     * @tc.desc      maximum minute only form is fifty nine minutes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationMinutes0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDurationMinutes0060 begin');
      console.info('testDurationMinutes0060 begin');
      expect(formatDuration(3599)).assertEqual('59:59');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0061
     * @tc.name      testDurationHour0061
     * @tc.desc      one hour includes the hour section
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationHour0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDurationHour0061 begin');
      console.info('testDurationHour0061 begin');
      expect(formatDuration(3600)).assertEqual('1:00:00');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0062
     * @tc.name      testDurationMixed0062
     * @tc.desc      hours minutes and seconds are all present
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationMixed0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDurationMixed0062 begin');
      console.info('testDurationMixed0062 begin');
      expect(formatDuration(3661)).assertEqual('1:01:01');
      expect(formatDuration(7325)).assertEqual('2:02:05');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0063
     * @tc.name      testDurationInvalid0063
     * @tc.desc      negative and non finite durations use the placeholder
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationInvalid0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDurationInvalid0063 begin');
      console.info('testDurationInvalid0063 begin');
      expect(formatDuration(-1)).assertEqual('--:--');
      expect(formatDuration(Number.NaN)).assertEqual('--:--');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0064
     * @tc.name      testDurationFraction0064
     * @tc.desc      fractional seconds are floored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDurationFraction0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDurationFraction0064 begin');
      console.info('testDurationFraction0064 begin');
      expect(formatDuration(59.9)).assertEqual('0:59');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0065
     * @tc.name      testPercentZero0065
     * @tc.desc      zero value shows zero percent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentZero0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPercentZero0065 begin');
      console.info('testPercentZero0065 begin');
      expect(formatPercent(0, 100, 1)).assertEqual('0%');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0066
     * @tc.name      testPercentHalf0066
     * @tc.desc      half of the total shows fifty percent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentHalf0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPercentHalf0066 begin');
      console.info('testPercentHalf0066 begin');
      expect(formatPercent(50, 100, 1)).assertEqual('50%');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0067
     * @tc.name      testPercentRepeating0067
     * @tc.desc      repeating decimals are rounded to two fractional digits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentRepeating0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPercentRepeating0067 begin');
      console.info('testPercentRepeating0067 begin');
      expect(formatPercent(1, 3, 2)).assertEqual('33.33%');
      expect(formatPercent(2, 3, 0)).assertEqual('67%');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0068
     * @tc.name      testPercentFull0068
     * @tc.desc      full value shows one hundred percent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentFull0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPercentFull0068 begin');
      console.info('testPercentFull0068 begin');
      expect(formatPercent(100, 100, 1)).assertEqual('100%');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0069
     * @tc.name      testPercentOverflow0069
     * @tc.desc      values above total are not clamped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentOverflow0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPercentOverflow0069 begin');
      console.info('testPercentOverflow0069 begin');
      expect(formatPercent(150, 100, 1)).assertEqual('150%');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0070
     * @tc.name      testPercentInvalidTotal0070
     * @tc.desc      non positive totals return zero percent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentInvalidTotal0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPercentInvalidTotal0070 begin');
      console.info('testPercentInvalidTotal0070 begin');
      expect(formatPercent(1, 0, 1)).assertEqual('0%');
      expect(formatPercent(1, -10, 1)).assertEqual('0%');
      expect(formatPercent(Number.NaN, 10, 1)).assertEqual('0%');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0071
     * @tc.name      testPercentClampDecimals0071
     * @tc.desc      decimals above two are clamped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentClampDecimals0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPercentClampDecimals0071 begin');
      console.info('testPercentClampDecimals0071 begin');
      expect(formatPercent(1, 3, 9)).assertEqual('33.33%');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0072
     * @tc.name      testPercentNegativeValue0072
     * @tc.desc      negative values keep their sign
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPercentNegativeValue0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPercentNegativeValue0072 begin');
      console.info('testPercentNegativeValue0072 begin');
      expect(formatPercent(-25, 100, 0)).assertEqual('-25%');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0073
     * @tc.name      testTruncateEndEmpty0073
     * @tc.desc      short text is returned unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateEndEmpty0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateEndEmpty0073 begin');
      console.info('testTruncateEndEmpty0073 begin');
      expect(truncateEnd('abc', 3, '...')).assertEqual('abc');
      expect(truncateEnd('ab', 5, '...')).assertEqual('ab');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0074
     * @tc.name      testTruncateEndBasic0074
     * @tc.desc      long text keeps the head and marker
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateEndBasic0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateEndBasic0074 begin');
      console.info('testTruncateEndBasic0074 begin');
      expect(truncateEnd('abcdef', 4, '...')).assertEqual('a...');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0075
     * @tc.name      testTruncateEndTiny0075
     * @tc.desc      width smaller than the marker keeps raw characters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateEndTiny0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateEndTiny0075 begin');
      console.info('testTruncateEndTiny0075 begin');
      expect(truncateEnd('abcdef', 3, '...')).assertEqual('abc');
      expect(truncateEnd('abcdef', 2, '...')).assertEqual('ab');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0076
     * @tc.name      testTruncateEndZero0076
     * @tc.desc      zero width returns empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateEndZero0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateEndZero0076 begin');
      console.info('testTruncateEndZero0076 begin');
      expect(truncateEnd('abcdef', 0, '...')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0077
     * @tc.name      testTruncateEndNoMarker0077
     * @tc.desc      empty marker simply cuts the text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateEndNoMarker0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateEndNoMarker0077 begin');
      console.info('testTruncateEndNoMarker0077 begin');
      expect(truncateEnd('abcdef', 4, '')).assertEqual('abcd');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0078
     * @tc.name      testTruncateEndChinese0078
     * @tc.desc      chinese text is cut by code unit
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateEndChinese0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateEndChinese0078 begin');
      console.info('testTruncateEndChinese0078 begin');
      expect(truncateEnd('你好世界你好', 5, '…')).assertEqual('你好世界…');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0079
     * @tc.name      testTruncateMiddleBasic0079
     * @tc.desc      middle truncation keeps both ends
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateMiddleBasic0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateMiddleBasic0079 begin');
      console.info('testTruncateMiddleBasic0079 begin');
      expect(truncateMiddle('abcdefgh', 6, '...')).assertEqual('a...gh');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0080
     * @tc.name      testTruncateMiddleShort0080
     * @tc.desc      text shorter than the width is unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateMiddleShort0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateMiddleShort0080 begin');
      console.info('testTruncateMiddleShort0080 begin');
      expect(truncateMiddle('abc', 6, '...')).assertEqual('abc');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0081
     * @tc.name      testTruncateMiddleTiny0081
     * @tc.desc      width not larger than the marker keeps raw characters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateMiddleTiny0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateMiddleTiny0081 begin');
      console.info('testTruncateMiddleTiny0081 begin');
      expect(truncateMiddle('abcdefgh', 3, '...')).assertEqual('abc');
      expect(truncateMiddle('abcdefgh', 2, '...')).assertEqual('ab');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0082
     * @tc.name      testTruncateMiddleTwoDots0082
     * @tc.desc      a two character marker splits the remaining width evenly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateMiddleTwoDots0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateMiddleTwoDots0082 begin');
      console.info('testTruncateMiddleTwoDots0082 begin');
      expect(truncateMiddle('abcdefgh', 6, '..')).assertEqual('ab..gh');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0083
     * @tc.name      testTruncateMiddleChinese0083
     * @tc.desc      chinese text is truncated in the middle
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateMiddleChinese0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateMiddleChinese0083 begin');
      console.info('testTruncateMiddleChinese0083 begin');
      expect(truncateMiddle('一二三四五六', 5, '…')).assertEqual('一二…五六');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0084
     * @tc.name      testTruncateMiddleZero0084
     * @tc.desc      zero width returns empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateMiddleZero0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateMiddleZero0084 begin');
      console.info('testTruncateMiddleZero0084 begin');
      expect(truncateMiddle('abcdefgh', 0, '...')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0085
     * @tc.name      testSanitizeEmpty0085
     * @tc.desc      empty names fall back to unnamed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSanitizeEmpty0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSanitizeEmpty0085 begin');
      console.info('testSanitizeEmpty0085 begin');
      expect(sanitizeFileName('')).assertEqual('unnamed');
      expect(sanitizeFileName('..')).assertEqual('unnamed');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0086
     * @tc.name      testSanitizeSlash0086
     * @tc.desc      slashes are removed from file names
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSanitizeSlash0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSanitizeSlash0086 begin');
      console.info('testSanitizeSlash0086 begin');
      expect(sanitizeFileName('a/b')).assertEqual('ab');
      expect(sanitizeFileName('a\\b')).assertEqual('ab');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0087
     * @tc.name      testSanitizeIllegalChars0087
     * @tc.desc      windows reserved punctuation is removed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSanitizeIllegalChars0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSanitizeIllegalChars0087 begin');
      console.info('testSanitizeIllegalChars0087 begin');
      expect(sanitizeFileName('a:b*c?d"e<f>g|h')).assertEqual('abcdefgh');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0088
     * @tc.name      testSanitizeControl0088
     * @tc.desc      control characters are removed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSanitizeControl0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSanitizeControl0088 begin');
      console.info('testSanitizeControl0088 begin');
      expect(sanitizeFileName('a' + String.fromCharCode(1) + 'b')).assertEqual('ab');
      expect(sanitizeFileName('a' + String.fromCharCode(0x7F) + 'b')).assertEqual('ab');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0089
     * @tc.name      testSanitizeTrimSpace0089
     * @tc.desc      surrounding spaces are trimmed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSanitizeTrimSpace0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSanitizeTrimSpace0089 begin');
      console.info('testSanitizeTrimSpace0089 begin');
      expect(sanitizeFileName('  name  ')).assertEqual('name');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0090
     * @tc.name      testSanitizeTrimDots0090
     * @tc.desc      leading and trailing dots are trimmed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSanitizeTrimDots0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSanitizeTrimDots0090 begin');
      console.info('testSanitizeTrimDots0090 begin');
      expect(sanitizeFileName('...name...')).assertEqual('name');
      expect(sanitizeFileName('.hidden')).assertEqual('hidden');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0091
     * @tc.name      testSanitizeReserved0091
     * @tc.desc      reserved device names are prefixed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSanitizeReserved0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSanitizeReserved0091 begin');
      console.info('testSanitizeReserved0091 begin');
      expect(sanitizeFileName('CON')).assertEqual('_CON');
      expect(sanitizeFileName('nul')).assertEqual('_nul');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0092
     * @tc.name      testSanitizeLength0092
     * @tc.desc      names are limited to 255 code units
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSanitizeLength0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSanitizeLength0092 begin');
      console.info('testSanitizeLength0092 begin');
      let longName: string = '';
      for (let index = 0; index < 300; index++) {
        longName += 'a';
      }
      expect(sanitizeFileName(longName).length).assertEqual(255);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0093
     * @tc.name      testSanitizeChinese0093
     * @tc.desc      legal chinese names are unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSanitizeChinese0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSanitizeChinese0093 begin');
      console.info('testSanitizeChinese0093 begin');
      expect(sanitizeFileName('正常文件.txt')).assertEqual('正常文件.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0094
     * @tc.name      testEnsureExtensionBasic0094
     * @tc.desc      missing extension is appended with a dot
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEnsureExtensionBasic0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEnsureExtensionBasic0094 begin');
      console.info('testEnsureExtensionBasic0094 begin');
      expect(ensureExtension('a', 'txt')).assertEqual('a.txt');
      expect(ensureExtension('a', '.txt')).assertEqual('a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0095
     * @tc.name      testEnsureExtensionExisting0095
     * @tc.desc      existing extensions are not duplicated
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEnsureExtensionExisting0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEnsureExtensionExisting0095 begin');
      console.info('testEnsureExtensionExisting0095 begin');
      expect(ensureExtension('a.txt', 'txt')).assertEqual('a.txt');
      expect(ensureExtension('a.TXT', 'txt')).assertEqual('a.TXT');
      expect(ensureExtension('archive.tar.gz', 'gz')).assertEqual('archive.tar.gz');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0096
     * @tc.name      testEnsureExtensionEmpty0096
     * @tc.desc      empty extension leaves the name unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEnsureExtensionEmpty0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEnsureExtensionEmpty0096 begin');
      console.info('testEnsureExtensionEmpty0096 begin');
      expect(ensureExtension('a', '')).assertEqual('a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0097
     * @tc.name      testEnsureExtensionUpper0097
     * @tc.desc      uppercase extensions are appended verbatim
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEnsureExtensionUpper0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEnsureExtensionUpper0097 begin');
      console.info('testEnsureExtensionUpper0097 begin');
      expect(ensureExtension('report', '.PDF')).assertEqual('report.PDF');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0098
     * @tc.name      testUniqueNameZero0098
     * @tc.desc      index zero keeps the original name
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUniqueNameZero0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUniqueNameZero0098 begin');
      console.info('testUniqueNameZero0098 begin');
      expect(uniqueName('a.txt', 0)).assertEqual('a.txt');
      expect(uniqueName('a.txt', -1)).assertEqual('a.txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0099
     * @tc.name      testUniqueNameBasic0099
     * @tc.desc      suffix is inserted before the extension
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUniqueNameBasic0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUniqueNameBasic0099 begin');
      console.info('testUniqueNameBasic0099 begin');
      expect(uniqueName('a.txt', 1)).assertEqual('a(1).txt');
      expect(uniqueName('a.txt', 10)).assertEqual('a(10).txt');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0100
     * @tc.name      testUniqueNameNoExtension0100
     * @tc.desc      names without extensions get a trailing suffix
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUniqueNameNoExtension0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUniqueNameNoExtension0100 begin');
      console.info('testUniqueNameNoExtension0100 begin');
      expect(uniqueName('a', 2)).assertEqual('a(2)');
      expect(uniqueName('.gitignore', 1)).assertEqual('.gitignore(1)');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0101
     * @tc.name      testUniqueNameMultiDot0101
     * @tc.desc      only the last extension is separated
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUniqueNameMultiDot0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUniqueNameMultiDot0101 begin');
      console.info('testUniqueNameMultiDot0101 begin');
      expect(uniqueName('a.tar.gz', 3)).assertEqual('a.tar(3).gz');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0102
     * @tc.name      testUniqueNameChinese0102
     * @tc.desc      chinese names keep the suffix position
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUniqueNameChinese0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUniqueNameChinese0102 begin');
      console.info('testUniqueNameChinese0102 begin');
      expect(uniqueName('报告.docx', 5)).assertEqual('报告(5).docx');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0103
     * @tc.name      testMaskAccountEmpty0103
     * @tc.desc      empty account id stays empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskAccountEmpty0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaskAccountEmpty0103 begin');
      console.info('testMaskAccountEmpty0103 begin');
      expect(maskAccount('')).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0104
     * @tc.name      testMaskAccountShort0104
     * @tc.desc      very short ids are fully masked
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskAccountShort0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaskAccountShort0104 begin');
      console.info('testMaskAccountShort0104 begin');
      expect(maskAccount('a')).assertEqual('**');
      expect(maskAccount('ab')).assertEqual('**');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0105
     * @tc.name      testMaskAccountMedium0105
     * @tc.desc      medium ids keep the first and last character
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskAccountMedium0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaskAccountMedium0105 begin');
      console.info('testMaskAccountMedium0105 begin');
      expect(maskAccount('abc')).assertEqual('a**c');
      expect(maskAccount('abcd')).assertEqual('a**d');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0106
     * @tc.name      testMaskAccountLong0106
     * @tc.desc      long ids keep two characters on each side
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskAccountLong0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaskAccountLong0106 begin');
      console.info('testMaskAccountLong0106 begin');
      expect(maskAccount('abcde')).assertEqual('ab***de');
      expect(maskAccount('abcdefghij')).assertEqual('ab***ij');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0107
     * @tc.name      testMaskAccountChinese0107
     * @tc.desc      chinese account names are masked the same way
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMaskAccountChinese0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testMaskAccountChinese0107 begin');
      console.info('testMaskAccountChinese0107 begin');
      expect(maskAccount('张三丰')).assertEqual('张**丰');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0108
     * @tc.name      testExpiryPermanent0108
     * @tc.desc      zero expiry means permanent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpiryPermanent0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExpiryPermanent0108 begin');
      console.info('testExpiryPermanent0108 begin');
      expect(formatExpiry(0, true)).assertEqual('永久');
      expect(formatExpiry(-100, true)).assertEqual('永久');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0109
     * @tc.name      testExpiryInvalid0109
     * @tc.desc      invalid expiry falls back to permanent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpiryInvalid0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExpiryInvalid0109 begin');
      console.info('testExpiryInvalid0109 begin');
      expect(formatExpiry(Number.NaN, true)).assertEqual('永久');
      expect(formatExpiry(Number.POSITIVE_INFINITY, true)).assertEqual('永久');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_FORMAT_0110
     * @tc.name      testExpiryDate0110
     * @tc.desc      positive expiry formats as a date
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testExpiryDate0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testExpiryDate0110 begin');
      console.info('testExpiryDate0110 begin');
      expect(formatExpiry(SAMPLE_SEC, true)).assertEqual('2023/11/14');
      expect(formatExpiry(86400, true)).assertEqual('1970/01/02');
    })
  });
}
