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

// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
// Import the NumberUtils helpers under test from the library HAR package.
import { NumberUtils } from 'library';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Registers every matrix case of the NumericFormatSweepSuite suite.
export default function numericFormatSweepTest() {
  // Group the cases under the "NumericFormatSweepSuite" describe block.
  describe('NumericFormatSweepSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumericFormatSweepSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_FMT_0100
     * @tc.name      testFormatSweepBytes0001
     * @tc.desc      Verify fileSizeText prints raw byte counts below the kilo boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatSweepBytes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatSweepBytes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fileSizeText(0) formats the byte count.
      logCase(TAG, "fileSizeText(0)");
      expect(NumberUtils.fileSizeText(0)).assertEqual("0 B");
      // Vector 2: fileSizeText(1) formats the byte count.
      logCase(TAG, "fileSizeText(1)");
      expect(NumberUtils.fileSizeText(1)).assertEqual("1 B");
      // Vector 3: fileSizeText(2) formats the byte count.
      logCase(TAG, "fileSizeText(2)");
      expect(NumberUtils.fileSizeText(2)).assertEqual("2 B");
      // Vector 4: fileSizeText(3) formats the byte count.
      logCase(TAG, "fileSizeText(3)");
      expect(NumberUtils.fileSizeText(3)).assertEqual("3 B");
      // Vector 5: fileSizeText(10) formats the byte count.
      logCase(TAG, "fileSizeText(10)");
      expect(NumberUtils.fileSizeText(10)).assertEqual("10 B");
      // Vector 6: fileSizeText(42) formats the byte count.
      logCase(TAG, "fileSizeText(42)");
      expect(NumberUtils.fileSizeText(42)).assertEqual("42 B");
      // Vector 7: fileSizeText(100) formats the byte count.
      logCase(TAG, "fileSizeText(100)");
      expect(NumberUtils.fileSizeText(100)).assertEqual("100 B");
      // Vector 8: fileSizeText(255) formats the byte count.
      logCase(TAG, "fileSizeText(255)");
      expect(NumberUtils.fileSizeText(255)).assertEqual("255 B");
      // Vector 9: fileSizeText(256) formats the byte count.
      logCase(TAG, "fileSizeText(256)");
      expect(NumberUtils.fileSizeText(256)).assertEqual("256 B");
      // Vector 10: fileSizeText(500) formats the byte count.
      logCase(TAG, "fileSizeText(500)");
      expect(NumberUtils.fileSizeText(500)).assertEqual("500 B");
      // Vector 11: fileSizeText(512) formats the byte count.
      logCase(TAG, "fileSizeText(512)");
      expect(NumberUtils.fileSizeText(512)).assertEqual("512 B");
      // Vector 12: fileSizeText(777) formats the byte count.
      logCase(TAG, "fileSizeText(777)");
      expect(NumberUtils.fileSizeText(777)).assertEqual("777 B");
      // Vector 13: fileSizeText(900) formats the byte count.
      logCase(TAG, "fileSizeText(900)");
      expect(NumberUtils.fileSizeText(900)).assertEqual("900 B");
      // Vector 14: fileSizeText(1000) formats the byte count.
      logCase(TAG, "fileSizeText(1000)");
      expect(NumberUtils.fileSizeText(1000)).assertEqual("1000 B");
      // Vector 15: fileSizeText(1023) formats the byte count.
      logCase(TAG, "fileSizeText(1023)");
      expect(NumberUtils.fileSizeText(1023)).assertEqual("1023 B");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_FMT_0200
     * @tc.name      testFormatSweepKilobytes0001
     * @tc.desc      Verify fileSizeText converts kilobyte values with two decimals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatSweepKilobytes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatSweepKilobytes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fileSizeText(1024) formats the byte count.
      logCase(TAG, "fileSizeText(1024)");
      expect(NumberUtils.fileSizeText(1024)).assertEqual("1 KB");
      // Vector 2: fileSizeText(1280) formats the byte count.
      logCase(TAG, "fileSizeText(1280)");
      expect(NumberUtils.fileSizeText(1280)).assertEqual("1.25 KB");
      // Vector 3: fileSizeText(1536) formats the byte count.
      logCase(TAG, "fileSizeText(1536)");
      expect(NumberUtils.fileSizeText(1536)).assertEqual("1.5 KB");
      // Vector 4: fileSizeText(2048) formats the byte count.
      logCase(TAG, "fileSizeText(2048)");
      expect(NumberUtils.fileSizeText(2048)).assertEqual("2 KB");
      // Vector 5: fileSizeText(2560) formats the byte count.
      logCase(TAG, "fileSizeText(2560)");
      expect(NumberUtils.fileSizeText(2560)).assertEqual("2.5 KB");
      // Vector 6: fileSizeText(4096) formats the byte count.
      logCase(TAG, "fileSizeText(4096)");
      expect(NumberUtils.fileSizeText(4096)).assertEqual("4 KB");
      // Vector 7: fileSizeText(5120) formats the byte count.
      logCase(TAG, "fileSizeText(5120)");
      expect(NumberUtils.fileSizeText(5120)).assertEqual("5 KB");
      // Vector 8: fileSizeText(8192) formats the byte count.
      logCase(TAG, "fileSizeText(8192)");
      expect(NumberUtils.fileSizeText(8192)).assertEqual("8 KB");
      // Vector 9: fileSizeText(10240) formats the byte count.
      logCase(TAG, "fileSizeText(10240)");
      expect(NumberUtils.fileSizeText(10240)).assertEqual("10 KB");
      // Vector 10: fileSizeText(102400) formats the byte count.
      logCase(TAG, "fileSizeText(102400)");
      expect(NumberUtils.fileSizeText(102400)).assertEqual("100 KB");
      // Vector 11: fileSizeText(524288) formats the byte count.
      logCase(TAG, "fileSizeText(524288)");
      expect(NumberUtils.fileSizeText(524288)).assertEqual("512 KB");
      // Vector 12: fileSizeText(1048575) formats the byte count.
      logCase(TAG, "fileSizeText(1048575)");
      expect(NumberUtils.fileSizeText(1048575)).assertEqual("1024 KB");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_FMT_0300
     * @tc.name      testFormatSweepMegabytes0001
     * @tc.desc      Verify fileSizeText converts megabyte values with two decimals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatSweepMegabytes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatSweepMegabytes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fileSizeText(1048576) formats the byte count.
      logCase(TAG, "fileSizeText(1048576)");
      expect(NumberUtils.fileSizeText(1048576)).assertEqual("1 MB");
      // Vector 2: fileSizeText(1572864) formats the byte count.
      logCase(TAG, "fileSizeText(1572864)");
      expect(NumberUtils.fileSizeText(1572864)).assertEqual("1.5 MB");
      // Vector 3: fileSizeText(2097152) formats the byte count.
      logCase(TAG, "fileSizeText(2097152)");
      expect(NumberUtils.fileSizeText(2097152)).assertEqual("2 MB");
      // Vector 4: fileSizeText(5242880) formats the byte count.
      logCase(TAG, "fileSizeText(5242880)");
      expect(NumberUtils.fileSizeText(5242880)).assertEqual("5 MB");
      // Vector 5: fileSizeText(10485760) formats the byte count.
      logCase(TAG, "fileSizeText(10485760)");
      expect(NumberUtils.fileSizeText(10485760)).assertEqual("10 MB");
      // Vector 6: fileSizeText(104857600) formats the byte count.
      logCase(TAG, "fileSizeText(104857600)");
      expect(NumberUtils.fileSizeText(104857600)).assertEqual("100 MB");
      // Vector 7: fileSizeText(536870912) formats the byte count.
      logCase(TAG, "fileSizeText(536870912)");
      expect(NumberUtils.fileSizeText(536870912)).assertEqual("512 MB");
      // Vector 8: fileSizeText(1073741823) formats the byte count.
      logCase(TAG, "fileSizeText(1073741823)");
      expect(NumberUtils.fileSizeText(1073741823)).assertEqual("1024 MB");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_FMT_0400
     * @tc.name      testFormatSweepGigabytes0001
     * @tc.desc      Verify fileSizeText converts gigabyte values with two decimals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatSweepGigabytes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatSweepGigabytes0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fileSizeText(1073741824) formats the byte count.
      logCase(TAG, "fileSizeText(1073741824)");
      expect(NumberUtils.fileSizeText(1073741824)).assertEqual("1 GB");
      // Vector 2: fileSizeText(1610612736) formats the byte count.
      logCase(TAG, "fileSizeText(1610612736)");
      expect(NumberUtils.fileSizeText(1610612736)).assertEqual("1.5 GB");
      // Vector 3: fileSizeText(2147483648) formats the byte count.
      logCase(TAG, "fileSizeText(2147483648)");
      expect(NumberUtils.fileSizeText(2147483648)).assertEqual("2 GB");
      // Vector 4: fileSizeText(5368709120) formats the byte count.
      logCase(TAG, "fileSizeText(5368709120)");
      expect(NumberUtils.fileSizeText(5368709120)).assertEqual("5 GB");
      // Vector 5: fileSizeText(10737418240) formats the byte count.
      logCase(TAG, "fileSizeText(10737418240)");
      expect(NumberUtils.fileSizeText(10737418240)).assertEqual("10 GB");
      // Vector 6: fileSizeText(107374182400) formats the byte count.
      logCase(TAG, "fileSizeText(107374182400)");
      expect(NumberUtils.fileSizeText(107374182400)).assertEqual("100 GB");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_FMT_0500
     * @tc.name      testFormatSweepNegativeSize0001
     * @tc.desc      Verify fileSizeText reports negative byte counts with the dash placeholder.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatSweepNegativeSize0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatSweepNegativeSize0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fileSizeText(-1) reports unknown sizes with a dash.
      logCase(TAG, "fileSizeText(-1)");
      expect(NumberUtils.fileSizeText(-1)).assertEqual("-");
      // Vector 2: fileSizeText(-2) reports unknown sizes with a dash.
      logCase(TAG, "fileSizeText(-2)");
      expect(NumberUtils.fileSizeText(-2)).assertEqual("-");
      // Vector 3: fileSizeText(-1024) reports unknown sizes with a dash.
      logCase(TAG, "fileSizeText(-1024)");
      expect(NumberUtils.fileSizeText(-1024)).assertEqual("-");
      // Vector 4: fileSizeText(-1048576) reports unknown sizes with a dash.
      logCase(TAG, "fileSizeText(-1048576)");
      expect(NumberUtils.fileSizeText(-1048576)).assertEqual("-");
      // Vector 5: fileSizeText(-1073741824) reports unknown sizes with a dash.
      logCase(TAG, "fileSizeText(-1073741824)");
      expect(NumberUtils.fileSizeText(-1073741824)).assertEqual("-");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_FMT_0600
     * @tc.name      testFormatSweepDuration0001
     * @tc.desc      Verify durationMsText keeps one decimal place across representative spans.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatSweepDuration0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatSweepDuration0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: durationMsText(0) formats the millisecond span.
      logCase(TAG, "durationMsText(0)");
      expect(NumberUtils.durationMsText(0)).assertEqual("0 ms");
      // Vector 2: durationMsText(1) formats the millisecond span.
      logCase(TAG, "durationMsText(1)");
      expect(NumberUtils.durationMsText(1)).assertEqual("1 ms");
      // Vector 3: durationMsText(9) formats the millisecond span.
      logCase(TAG, "durationMsText(9)");
      expect(NumberUtils.durationMsText(9)).assertEqual("9 ms");
      // Vector 4: durationMsText(10) formats the millisecond span.
      logCase(TAG, "durationMsText(10)");
      expect(NumberUtils.durationMsText(10)).assertEqual("10 ms");
      // Vector 5: durationMsText(99) formats the millisecond span.
      logCase(TAG, "durationMsText(99)");
      expect(NumberUtils.durationMsText(99)).assertEqual("99 ms");
      // Vector 6: durationMsText(100) formats the millisecond span.
      logCase(TAG, "durationMsText(100)");
      expect(NumberUtils.durationMsText(100)).assertEqual("100 ms");
      // Vector 7: durationMsText(999) formats the millisecond span.
      logCase(TAG, "durationMsText(999)");
      expect(NumberUtils.durationMsText(999)).assertEqual("999 ms");
      // Vector 8: durationMsText(1000) formats the millisecond span.
      logCase(TAG, "durationMsText(1000)");
      expect(NumberUtils.durationMsText(1000)).assertEqual("1000 ms");
      // Vector 9: durationMsText(1500) formats the millisecond span.
      logCase(TAG, "durationMsText(1500)");
      expect(NumberUtils.durationMsText(1500)).assertEqual("1500 ms");
      // Vector 10: durationMsText(60000) formats the millisecond span.
      logCase(TAG, "durationMsText(60000)");
      expect(NumberUtils.durationMsText(60000)).assertEqual("60000 ms");
      // Vector 11: durationMsText(61000) formats the millisecond span.
      logCase(TAG, "durationMsText(61000)");
      expect(NumberUtils.durationMsText(61000)).assertEqual("61000 ms");
      // Vector 12: durationMsText(3599999) formats the millisecond span.
      logCase(TAG, "durationMsText(3599999)");
      expect(NumberUtils.durationMsText(3599999)).assertEqual("3599999 ms");
      // Vector 13: durationMsText(3600000) formats the millisecond span.
      logCase(TAG, "durationMsText(3600000)");
      expect(NumberUtils.durationMsText(3600000)).assertEqual("3600000 ms");
      // Vector 14: durationMsText(3661000) formats the millisecond span.
      logCase(TAG, "durationMsText(3661000)");
      expect(NumberUtils.durationMsText(3661000)).assertEqual("3661000 ms");
      // Vector 15: durationMsText(86400000) formats the millisecond span.
      logCase(TAG, "durationMsText(86400000)");
      expect(NumberUtils.durationMsText(86400000)).assertEqual("86400000 ms");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_FMT_0700
     * @tc.name      testFormatSweepThousand0001
     * @tc.desc      Verify thousandSeparators groups digits for positive, zero and negative values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatSweepThousand0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatSweepThousand0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: thousandSeparators(0) inserts the grouping commas.
      logCase(TAG, "thousandSeparators(0)");
      expect(NumberUtils.thousandSeparators(0)).assertEqual("0");
      // Vector 2: thousandSeparators(1) inserts the grouping commas.
      logCase(TAG, "thousandSeparators(1)");
      expect(NumberUtils.thousandSeparators(1)).assertEqual("1");
      // Vector 3: thousandSeparators(12) inserts the grouping commas.
      logCase(TAG, "thousandSeparators(12)");
      expect(NumberUtils.thousandSeparators(12)).assertEqual("12");
      // Vector 4: thousandSeparators(123) inserts the grouping commas.
      logCase(TAG, "thousandSeparators(123)");
      expect(NumberUtils.thousandSeparators(123)).assertEqual("123");
      // Vector 5: thousandSeparators(1234) inserts the grouping commas.
      logCase(TAG, "thousandSeparators(1234)");
      expect(NumberUtils.thousandSeparators(1234)).assertEqual("1,234");
      // Vector 6: thousandSeparators(12345) inserts the grouping commas.
      logCase(TAG, "thousandSeparators(12345)");
      expect(NumberUtils.thousandSeparators(12345)).assertEqual("12,345");
      // Vector 7: thousandSeparators(123456) inserts the grouping commas.
      logCase(TAG, "thousandSeparators(123456)");
      expect(NumberUtils.thousandSeparators(123456)).assertEqual("123,456");
      // Vector 8: thousandSeparators(1234567) inserts the grouping commas.
      logCase(TAG, "thousandSeparators(1234567)");
      expect(NumberUtils.thousandSeparators(1234567)).assertEqual("1,234,567");
      // Vector 9: thousandSeparators(12345678) inserts the grouping commas.
      logCase(TAG, "thousandSeparators(12345678)");
      expect(NumberUtils.thousandSeparators(12345678)).assertEqual("12,345,678");
      // Vector 10: thousandSeparators(123456789) inserts the grouping commas.
      logCase(TAG, "thousandSeparators(123456789)");
      expect(NumberUtils.thousandSeparators(123456789)).assertEqual("123,456,789");
      // Vector 11: thousandSeparators(1000000000) inserts the grouping commas.
      logCase(TAG, "thousandSeparators(1000000000)");
      expect(NumberUtils.thousandSeparators(1000000000)).assertEqual("1,000,000,000");
      // Vector 12: thousandSeparators(-1) inserts the grouping commas.
      logCase(TAG, "thousandSeparators(-1)");
      expect(NumberUtils.thousandSeparators(-1)).assertEqual("-1");
      // Vector 13: thousandSeparators(-12) inserts the grouping commas.
      logCase(TAG, "thousandSeparators(-12)");
      expect(NumberUtils.thousandSeparators(-12)).assertEqual("-12");
      // Vector 14: thousandSeparators(-1234) inserts the grouping commas.
      logCase(TAG, "thousandSeparators(-1234)");
      expect(NumberUtils.thousandSeparators(-1234)).assertEqual("-1,234");
      // Vector 15: thousandSeparators(-1234567) inserts the grouping commas.
      logCase(TAG, "thousandSeparators(-1234567)");
      expect(NumberUtils.thousandSeparators(-1234567)).assertEqual("-1,234,567");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_FMT_0800
     * @tc.name      testFormatSweepPercent0001
     * @tc.desc      Verify percentText formats ratios with two decimal places.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatSweepPercent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatSweepPercent0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: percentText(0, 2) formats the ratio.
      logCase(TAG, "percentText(0, 2)");
      expect(NumberUtils.percentText(0, 2)).assertEqual("0%");
      // Vector 2: percentText(0.01, 2) formats the ratio.
      logCase(TAG, "percentText(0.01, 2)");
      expect(NumberUtils.percentText(0.01, 2)).assertEqual("1%");
      // Vector 3: percentText(0.1, 2) formats the ratio.
      logCase(TAG, "percentText(0.1, 2)");
      expect(NumberUtils.percentText(0.1, 2)).assertEqual("10%");
      // Vector 4: percentText(0.125, 2) formats the ratio.
      logCase(TAG, "percentText(0.125, 2)");
      expect(NumberUtils.percentText(0.125, 2)).assertEqual("12.5%");
      // Vector 5: percentText(0.25, 2) formats the ratio.
      logCase(TAG, "percentText(0.25, 2)");
      expect(NumberUtils.percentText(0.25, 2)).assertEqual("25%");
      // Vector 6: percentText(0.3333, 2) formats the ratio.
      logCase(TAG, "percentText(0.3333, 2)");
      expect(NumberUtils.percentText(0.3333, 2)).assertEqual("33.33%");
      // Vector 7: percentText(0.5, 2) formats the ratio.
      logCase(TAG, "percentText(0.5, 2)");
      expect(NumberUtils.percentText(0.5, 2)).assertEqual("50%");
      // Vector 8: percentText(0.75, 2) formats the ratio.
      logCase(TAG, "percentText(0.75, 2)");
      expect(NumberUtils.percentText(0.75, 2)).assertEqual("75%");
      // Vector 9: percentText(0.999, 2) formats the ratio.
      logCase(TAG, "percentText(0.999, 2)");
      expect(NumberUtils.percentText(0.999, 2)).assertEqual("99.9%");
      // Vector 10: percentText(1, 2) formats the ratio.
      logCase(TAG, "percentText(1, 2)");
      expect(NumberUtils.percentText(1, 2)).assertEqual("100%");
      // Vector 11: percentText(1.2345, 2) formats the ratio.
      logCase(TAG, "percentText(1.2345, 2)");
      expect(NumberUtils.percentText(1.2345, 2)).assertEqual("123.45%");
      // Vector 12: percentText(2.5, 2) formats the ratio.
      logCase(TAG, "percentText(2.5, 2)");
      expect(NumberUtils.percentText(2.5, 2)).assertEqual("250%");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
