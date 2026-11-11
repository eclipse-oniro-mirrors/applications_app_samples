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
import { formatBytes, joinNumbers, elapsedMilliseconds } from 'library';

const DOMAIN: number = 0xF811;
// Binary kilobyte divisor reused by the numeric matrix oracle expectations.
const KILO_UNIT: number = 1024;
// Binary megabyte divisor reused by the numeric matrix oracle expectations.
const MEGA_UNIT: number = 1024 * 1024;
// Binary gigabyte divisor reused by the numeric matrix oracle expectations.
const GIGA_UNIT: number = 1024 * 1024 * 1024;
// Upper bound in milliseconds accepted for timer cases that must finish quickly.
const QUICK_CEILING_MS: number = 5000;
// Epoch timestamp of the year 2020 used as the lower numeric matrix bound.
const YEAR_2020_MS: number = 1577836800000;

// Waits for the given duration so timer based logic cases can observe real elapsed time.
function sleepMs(durationMs: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, durationMs);
  });
}

// Registers the numeric matrix test suite for the byte formatting and elapsed time helpers.
export default function numericMatrixFormatTest() {
  describe('NumericMatrixFormatSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_0100
     * @tc.name      testNumFormat0001
     * @tc.desc      Verify formatBytes renders the zero byte matrix point as plain bytes without scaling.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The zero matrix point stays in plain bytes without any unit scaling.
      const rendered: string = formatBytes(0);
      expect(rendered).assertEqual('0 B');
      // The plain byte render keeps the minimal three character width.
      expect(rendered.length).assertEqual(3);
      // A repeated call stays deterministic for the same input.
      expect(formatBytes(0)).assertEqual(rendered);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_0200
     * @tc.name      testNumFormat0002
     * @tc.desc      Verify formatBytes renders the one byte matrix point with the plain bytes suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The smallest positive byte count stays in plain bytes.
      const rendered: string = formatBytes(1);
      expect(rendered).assertEqual('1 B');
      // The render still ends with the plain bytes suffix.
      expect(rendered.substring(1, 3)).assertEqual(' B');
      // The plain byte render keeps the minimal three character width.
      expect(rendered.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_0300
     * @tc.name      testNumFormat0003
     * @tc.desc      Verify formatBytes renders the five hundred twelve byte matrix point without scaling.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The half kilobyte matrix point is still below the scaling threshold.
      const rendered: string = formatBytes(512);
      expect(rendered).assertEqual('512 B');
      // The numeric part keeps the exact three digit byte count.
      expect(rendered.substring(0, 3)).assertEqual('512');
      // The whole render stays five characters wide including the suffix.
      expect(rendered.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_0400
     * @tc.name      testNumFormat0004
     * @tc.desc      Verify formatBytes renders one thousand bytes as plain bytes below the kilobyte threshold.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The one thousand byte matrix point sits just below the 1024 threshold.
      const rendered: string = formatBytes(1000);
      expect(rendered).assertEqual('1000 B');
      // The render still ends with the plain bytes suffix.
      expect(rendered.substring(4, 6)).assertEqual(' B');
      // The four digit byte count keeps the whole render six characters wide.
      expect(rendered.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_0500
     * @tc.name      testNumFormat0005
     * @tc.desc      Verify formatBytes renders one thousand twenty three bytes just below the kilobyte boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 1023 matrix point is the last value below the kilobyte threshold.
      const rendered: string = formatBytes(1023);
      expect(rendered).assertEqual('1023 B');
      // The render still ends with the plain bytes suffix.
      expect(rendered.substring(4, 6)).assertEqual(' B');
      // The whole render keeps the six character width.
      expect(rendered.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_0600
     * @tc.name      testNumFormat0006
     * @tc.desc      Verify formatBytes scales the exact kilobyte matrix point into the two digit KB format.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The exact 1024 matrix point crosses into the kilobyte branch.
      const rendered: string = formatBytes(1024);
      expect(rendered).assertEqual('1.00 KB');
      // The scaled render always ends with the kilobyte suffix.
      expect(rendered.substring(4, 7)).assertEqual(' KB');
      // The whole render keeps the seven character width.
      expect(rendered.length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_0700
     * @tc.name      testNumFormat0007
     * @tc.desc      Verify formatBytes rounds one byte above the kilobyte boundary down to the same KB text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 1025 matrix point scales to a fraction that rounds to 1.00.
      const rendered: string = formatBytes(1025);
      expect(rendered).assertEqual('1.00 KB');
      // The two fraction digits stay fixed after rounding.
      expect(rendered.substring(0, 4)).assertEqual('1.00');
      // The kilobyte suffix stays attached after the digits.
      expect(rendered.substring(4, 7)).assertEqual(' KB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_0800
     * @tc.name      testNumFormat0008
     * @tc.desc      Verify formatBytes renders one and a half kilobytes with the exact fraction digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 1536 matrix point is exactly one and a half kilobytes.
      const rendered: string = formatBytes(1536);
      expect(rendered).assertEqual('1.50 KB');
      // The fraction part carries the half value with two digits.
      expect(rendered.substring(2, 4)).assertEqual('50');
      // A repeated call stays deterministic for the same input.
      expect(formatBytes(1536)).assertEqual(rendered);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_0900
     * @tc.name      testNumFormat0009
     * @tc.desc      Verify formatBytes renders the two kilobyte matrix point as an exact whole KB value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 2048 matrix point is exactly two kilobytes.
      const rendered: string = formatBytes(2048);
      expect(rendered).assertEqual('2.00 KB');
      // The integer part carries the scaled value.
      expect(rendered.substring(0, 1)).assertEqual('2');
      // The render keeps the kilobyte suffix at the end.
      expect(rendered.substring(4, 7)).assertEqual(' KB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_1000
     * @tc.name      testNumFormat0010
     * @tc.desc      Verify formatBytes rounds nine thousand nine hundred ninety nine bytes down to 9.76 KB.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 9999 matrix point scales to 9.7646484375 which rounds to 9.76.
      const rendered: string = formatBytes(9999);
      expect(rendered).assertEqual('9.76 KB');
      // The rounded value kept two fraction digits.
      expect(rendered.substring(2, 5)).assertEqual('76 ');
      // The oracle of the same division reproduces the rendered text.
      expect((9999 / KILO_UNIT).toFixed(2) + ' KB').assertEqual(rendered);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_1100
     * @tc.name      testNumFormat0011
     * @tc.desc      Verify formatBytes rounds one byte below the megabyte boundary up to 1024.00 KB.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 1048575 matrix point stays in the KB branch and rounds to 1024.00.
      const rendered: string = formatBytes(1048575);
      expect(rendered).assertEqual('1024.00 KB');
      // The rounded integer part reached four digits.
      expect(rendered.substring(0, 4)).assertEqual('1024');
      // The suffix stays the kilobyte unit because the input stayed below 1 MB.
      expect(rendered.substring(8, 10)).assertEqual('KB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_1200
     * @tc.name      testNumFormat0012
     * @tc.desc      Verify formatBytes scales the exact megabyte matrix point into the two digit MB format.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The exact 1048576 matrix point crosses into the megabyte branch.
      const rendered: string = formatBytes(1048576);
      expect(rendered).assertEqual('1.00 MB');
      // The scaled render always ends with the megabyte suffix.
      expect(rendered.substring(4, 7)).assertEqual(' MB');
      // The whole render keeps the seven character width.
      expect(rendered.length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_1300
     * @tc.name      testNumFormat0013
     * @tc.desc      Verify formatBytes renders one and a half megabytes with the exact fraction digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 1572864 matrix point is exactly one and a half megabytes.
      const rendered: string = formatBytes(1572864);
      expect(rendered).assertEqual('1.50 MB');
      // The fraction part carries the half value with two digits.
      expect(rendered.substring(2, 4)).assertEqual('50');
      // The render keeps the megabyte suffix at the end.
      expect(rendered.substring(4, 7)).assertEqual(' MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_1400
     * @tc.name      testNumFormat0014
     * @tc.desc      Verify formatBytes renders the two and a half and five megabyte matrix points exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 2621440 matrix point is exactly two and a half megabytes.
      const halfRender: string = formatBytes(2621440);
      expect(halfRender).assertEqual('2.50 MB');
      // The 5242880 matrix point is exactly five megabytes.
      const wholeRender: string = formatBytes(5242880);
      expect(wholeRender).assertEqual('5.00 MB');
      // Both renders share the same seven character megabyte shape.
      expect(wholeRender.length).assertEqual(halfRender.length);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_1500
     * @tc.name      testNumFormat0015
     * @tc.desc      Verify formatBytes rounds one byte below the gigabyte boundary up to 1024.00 MB.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 1073741823 matrix point stays in the MB branch and rounds to 1024.00.
      const rendered: string = formatBytes(1073741823);
      expect(rendered).assertEqual('1024.00 MB');
      // The rounded integer part reached four digits.
      expect(rendered.substring(0, 4)).assertEqual('1024');
      // The suffix stays the megabyte unit because the input stayed below 1 GB.
      expect(rendered.substring(8, 10)).assertEqual('MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_1600
     * @tc.name      testNumFormat0016
     * @tc.desc      Verify formatBytes scales the exact gigabyte matrix point into the two digit GB format.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The exact 1073741824 matrix point crosses into the gigabyte branch.
      const rendered: string = formatBytes(1073741824);
      expect(rendered).assertEqual('1.00 GB');
      // The scaled render always ends with the gigabyte suffix.
      expect(rendered.substring(4, 7)).assertEqual(' GB');
      // The whole render keeps the seven character width.
      expect(rendered.length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_1700
     * @tc.name      testNumFormat0017
     * @tc.desc      Verify formatBytes renders the one and a half and three gigabyte matrix points exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 1610612736 matrix point is exactly one and a half gigabytes.
      const halfRender: string = formatBytes(1610612736);
      expect(halfRender).assertEqual('1.50 GB');
      // The 3221225472 matrix point is exactly three gigabytes.
      const wholeRender: string = formatBytes(3221225472);
      expect(wholeRender).assertEqual('3.00 GB');
      // The gigabyte renders keep the fixed two fraction digits.
      expect(halfRender.substring(2, 4)).assertEqual('50');
      expect(wholeRender.substring(2, 4)).assertEqual('00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_1800
     * @tc.name      testNumFormat0018
     * @tc.desc      Verify formatBytes renders the signed thirty two bit maximum as exactly two gigabytes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 2147483648 matrix point is exactly two gigabytes.
      const rendered: string = formatBytes(2147483648);
      expect(rendered).assertEqual('2.00 GB');
      // The integer part carries the scaled value.
      expect(rendered.substring(0, 1)).assertEqual('2');
      // The oracle of the same division reproduces the rendered text.
      expect((2147483648 / GIGA_UNIT).toFixed(2) + ' GB').assertEqual(rendered);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_1900
     * @tc.name      testNumFormat0019
     * @tc.desc      Verify formatBytes returns the dash placeholder for the negative one matrix point.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The negative one matrix point falls back to the placeholder.
      const rendered: string = formatBytes(-1);
      expect(rendered).assertEqual('-');
      // The placeholder keeps the single character width.
      expect(rendered.length).assertEqual(1);
      // A repeated call stays deterministic for the same negative input.
      expect(formatBytes(-1)).assertEqual(rendered);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_2000
     * @tc.name      testNumFormat0020
     * @tc.desc      Verify formatBytes returns the dash placeholder for large negative byte matrix points.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The negative kilobyte matrix point still yields the placeholder.
      const kiloRender: string = formatBytes(-1024);
      expect(kiloRender).assertEqual('-');
      // The negative megabyte matrix point also yields the placeholder.
      const megaRender: string = formatBytes(-1048576);
      expect(megaRender).assertEqual('-');
      // All negative matrix points share the identical placeholder text.
      expect(kiloRender).assertEqual(megaRender);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_2100
     * @tc.name      testNumFormat0021
     * @tc.desc      Verify formatBytes renders the one terabyte matrix point as exactly 1024.00 GB.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 1099511627776 matrix point is exactly one terabyte in the GB branch.
      const rendered: string = formatBytes(1099511627776);
      expect(rendered).assertEqual('1024.00 GB');
      // The scaled integer part reached four digits.
      expect(rendered.substring(0, 4)).assertEqual('1024');
      // The suffix stays the gigabyte unit for the terabyte scale input.
      expect(rendered.substring(8, 10)).assertEqual('GB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_2200
     * @tc.name      testNumFormat0022
     * @tc.desc      Verify formatBytes renders the two terabyte matrix point as exactly 2048.00 GB.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 2199023255552 matrix point is exactly two terabytes in the GB branch.
      const rendered: string = formatBytes(2199023255552);
      expect(rendered).assertEqual('2048.00 GB');
      // The scaled integer part keeps the doubled terabyte value.
      expect(rendered.substring(0, 4)).assertEqual('2048');
      // The oracle of the same division reproduces the rendered text.
      expect((2199023255552 / GIGA_UNIT).toFixed(2) + ' GB').assertEqual(rendered);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_2300
     * @tc.name      testNumFormat0023
     * @tc.desc      Verify formatBytes keeps fractional byte inputs verbatim in the plain bytes branch.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The fractional 999.9 matrix point renders verbatim in plain bytes.
      const fractionalRender: string = formatBytes(999.9);
      expect(fractionalRender).assertEqual('999.9 B');
      // The fractional 0.5 matrix point also renders verbatim in plain bytes.
      const tinyRender: string = formatBytes(0.5);
      expect(tinyRender).assertEqual('0.5 B');
      // Both fractional renders keep the plain bytes suffix.
      expect(fractionalRender.substring(fractionalRender.length - 2, fractionalRender.length)).assertEqual(' B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_2400
     * @tc.name      testNumFormat0024
     * @tc.desc      Verify formatBytes renders a ten megabyte sized value with the rounded 10.24 MB text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 10737418 matrix point scales to 10.2399 which rounds to 10.24.
      const rendered: string = formatBytes(10737418);
      expect(rendered).assertEqual('10.24 MB');
      // The integer part reached two digits after scaling.
      expect(rendered.substring(0, 2)).assertEqual('10');
      // The oracle of the same division reproduces the rendered text.
      expect((10737418 / MEGA_UNIT).toFixed(2) + ' MB').assertEqual(rendered);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_2500
     * @tc.name      testNumFormat0025
     * @tc.desc      Verify formatBytes renders the six hundred fifty megabyte matrix point exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 681574400 matrix point is exactly six hundred fifty megabytes.
      const rendered: string = formatBytes(681574400);
      expect(rendered).assertEqual('650.00 MB');
      // The integer part carries the full megabyte value.
      expect(rendered.substring(0, 3)).assertEqual('650');
      // The render keeps the megabyte suffix at the end.
      expect(rendered.substring(7, 9)).assertEqual('MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_2600
     * @tc.name      testNumFormat0026
     * @tc.desc      Verify formatBytes picks the correct unit suffix for each scaling ladder matrix point.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The byte branch keeps the B suffix for the small matrix point.
      const byteRender: string = formatBytes(512);
      expect(byteRender.substring(byteRender.length - 1, byteRender.length)).assertEqual('B');
      // The kilobyte branch keeps the KB suffix for the scaled matrix point.
      const kiloRender: string = formatBytes(2048);
      expect(kiloRender.substring(kiloRender.length - 2, kiloRender.length)).assertEqual('KB');
      // The megabyte branch keeps the MB suffix for the scaled matrix point.
      const megaRender: string = formatBytes(1048576);
      expect(megaRender.substring(megaRender.length - 2, megaRender.length)).assertEqual('MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_2700
     * @tc.name      testNumFormat0027
     * @tc.desc      Verify formatBytes is deterministic for repeated calls and shares the placeholder text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Repeated calls for the same positive input stay identical.
      expect(formatBytes(1024)).assertEqual(formatBytes(1024));
      // Repeated calls for different negative inputs share the placeholder.
      expect(formatBytes(-5)).assertEqual(formatBytes(-9));
      // The positive branch never leaks into the placeholder text.
      expect(formatBytes(1024) !== formatBytes(-5)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_2800
     * @tc.name      testNumFormat0028
     * @tc.desc      Verify joinNumbers returns the dash placeholder for the empty array matrix point.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty array has no joinable numbers and yields the placeholder.
      const rendered: string = joinNumbers([]);
      expect(rendered).assertEqual('-');
      // The placeholder keeps the single character width.
      expect(rendered.length).assertEqual(1);
      // A repeated empty call stays deterministic.
      expect(joinNumbers([])).assertEqual(rendered);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_2900
     * @tc.name      testNumFormat0029
     * @tc.desc      Verify joinNumbers renders a single element array without any separator text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The single element matrix point renders just the number itself.
      const rendered: string = joinNumbers([5]);
      expect(rendered).assertEqual('5');
      // No separator appears anywhere in a single element render.
      expect(rendered.indexOf(', ')).assertEqual(-1);
      // The render keeps the minimal one character width.
      expect(rendered.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_3000
     * @tc.name      testNumFormat0030
     * @tc.desc      Verify joinNumbers joins three positive elements with the comma and space separator.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three sequential elements join with the exact separator format.
      const rendered: string = joinNumbers([1, 2, 3]);
      expect(rendered).assertEqual('1, 2, 3');
      // The render keeps the seven character width for the three elements.
      expect(rendered.length).assertEqual(7);
      // The joined text never introduces leading or trailing separators.
      expect(rendered.substring(0, 1)).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_3100
     * @tc.name      testNumFormat0031
     * @tc.desc      Verify joinNumbers renders the standard web port pair with one separator.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 80 and 443 port matrix points join with one separator.
      const rendered: string = joinNumbers([80, 443]);
      expect(rendered).assertEqual('80, 443');
      // The separator starts right after the two digit first port.
      expect(rendered.indexOf(', ')).assertEqual(2);
      // The render keeps the seven character width.
      expect(rendered.length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_3200
     * @tc.name      testNumFormat0032
     * @tc.desc      Verify joinNumbers keeps minus prefixes on consecutive negative elements.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three negative elements keep their minus prefixes after joining.
      const rendered: string = joinNumbers([-1, -2, -3]);
      expect(rendered).assertEqual('-1, -2, -3');
      // The render keeps the ten character width including the prefixes.
      expect(rendered.length).assertEqual(10);
      // The first character is the minus prefix of the first element.
      expect(rendered.substring(0, 1)).assertEqual('-');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_3300
     * @tc.name      testNumFormat0033
     * @tc.desc      Verify joinNumbers renders repeated zero elements without collapsing them.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three zero elements all render even though they look identical.
      const rendered: string = joinNumbers([0, 0, 0]);
      expect(rendered).assertEqual('0, 0, 0');
      // The render keeps the seven character width.
      expect(rendered.length).assertEqual(7);
      // The zero array never collapses into the empty placeholder.
      expect(rendered !== '-').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_3400
     * @tc.name      testNumFormat0034
     * @tc.desc      Verify joinNumbers renders decimal elements with their exact fraction digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The one and a half and two and a quarter elements render their fractions.
      const rendered: string = joinNumbers([1.5, 2.25]);
      expect(rendered).assertEqual('1.5, 2.25');
      // The render keeps the nine character width.
      expect(rendered.length).assertEqual(9);
      // The decimal points stay inside their own element text.
      expect(rendered.indexOf(', ')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_3500
     * @tc.name      testNumFormat0035
     * @tc.desc      Verify joinNumbers renders short decimal elements without losing trailing digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 0.1 and 0.2 elements render their exact single fraction digits.
      const rendered: string = joinNumbers([0.1, 0.2]);
      expect(rendered).assertEqual('0.1, 0.2');
      // The render keeps the eight character width.
      expect(rendered.length).assertEqual(8);
      // The separator sits after the three character first element.
      expect(rendered.indexOf(', ')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_3600
     * @tc.name      testNumFormat0036
     * @tc.desc      Verify joinNumbers renders the four digit byte size matrix points in order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The byte size matrix points join in ascending order.
      const rendered: string = joinNumbers([1024, 2048, 4096]);
      expect(rendered).assertEqual('1024, 2048, 4096');
      // The render keeps the sixteen character width.
      expect(rendered.length).assertEqual(16);
      // The first separator starts after the four digit first element.
      expect(rendered.indexOf(', ')).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_3700
     * @tc.name      testNumFormat0037
     * @tc.desc      Verify joinNumbers renders a single seven digit element without separator text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The one million matrix point renders all seven digits verbatim.
      const rendered: string = joinNumbers([1000000]);
      expect(rendered).assertEqual('1000000');
      // The render keeps the seven digit width.
      expect(rendered.length).assertEqual(7);
      // A single element never introduces separator text.
      expect(rendered.indexOf(', ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_3800
     * @tc.name      testNumFormat0038
     * @tc.desc      Verify joinNumbers renders the signed thirty two bit extremes with both signs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The maximum and minimum signed thirty two bit extremes render verbatim.
      const rendered: string = joinNumbers([2147483647, -2147483648]);
      expect(rendered).assertEqual('2147483647, -2147483648');
      // The render keeps the twenty three character width including signs.
      expect(rendered.length).assertEqual(23);
      // The separator starts after the ten digit maximum value.
      expect(rendered.indexOf(', ')).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_3900
     * @tc.name      testNumFormat0039
     * @tc.desc      Verify joinNumbers renders the one to ten sequence with the exact twenty nine width.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0039';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The one to ten sequence joins with nine separators.
      const rendered: string = joinNumbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      expect(rendered).assertEqual('1, 2, 3, 4, 5, 6, 7, 8, 9, 10');
      // Nine single digit elements, one two digit element and nine separators total twenty nine.
      expect(rendered.length).assertEqual(29);
      // The last element carries both digits of the number ten.
      expect(rendered.substring(rendered.length - 2, rendered.length)).assertEqual('10');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_4000
     * @tc.name      testNumFormat0040
     * @tc.desc      Verify joinNumbers renders a single negative element with its minus prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0040';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The single negative seven matrix point keeps its minus prefix.
      const rendered: string = joinNumbers([-7]);
      expect(rendered).assertEqual('-7');
      // The render keeps the two character width including the prefix.
      expect(rendered.length).assertEqual(2);
      // A single element still never introduces separator text.
      expect(rendered.indexOf(', ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_4100
     * @tc.name      testNumFormat0041
     * @tc.desc      Verify joinNumbers alternates minus prefixes correctly across a mixed sign array.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0041';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The alternating sign array keeps every prefix and separator in place.
      const rendered: string = joinNumbers([1, -2, 3, -4]);
      expect(rendered).assertEqual('1, -2, 3, -4');
      // The render keeps the twelve character width.
      expect(rendered.length).assertEqual(12);
      // The last element carries its own minus prefix.
      expect(rendered.substring(rendered.length - 2, rendered.length)).assertEqual('-4');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_4200
     * @tc.name      testNumFormat0042
     * @tc.desc      Verify joinNumbers renders the single zero element as text instead of the placeholder.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0042';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The single zero matrix point renders the digit zero, not the placeholder.
      const rendered: string = joinNumbers([0]);
      expect(rendered).assertEqual('0');
      // The zero render differs from the empty array placeholder.
      expect(rendered !== '-').assertTrue();
      // The render keeps the minimal one character width.
      expect(rendered.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_4300
     * @tc.name      testNumFormat0043
     * @tc.desc      Verify joinNumbers renders the one to twelve sequence with the exact thirty seven width.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0043';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The one to twelve sequence joins with eleven separators.
      const rendered: string = joinNumbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);
      expect(rendered).assertEqual('1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12');
      // Nine one digit elements, three two digit elements and eleven separators total thirty seven.
      expect(rendered.length).assertEqual(37);
      // The final element carries both digits of the number twelve.
      expect(rendered.substring(rendered.length - 2, rendered.length)).assertEqual('12');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_4400
     * @tc.name      testNumFormat0044
     * @tc.desc      Verify joinNumbers inserts each separator right after the previous element text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0044';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The three element render contains two separators at exact offsets.
      const rendered: string = joinNumbers([1, 2, 3]);
      // The first separator starts after the single digit first element.
      expect(rendered.indexOf(', ')).assertEqual(1);
      // The second separator starts after the single digit second element.
      expect(rendered.indexOf(', ', 2)).assertEqual(4);
      // No third separator exists after the final element.
      expect(rendered.indexOf(', ', 5)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_4500
     * @tc.name      testNumFormat0045
     * @tc.desc      Verify joinNumbers is deterministic for repeated calls and separates empty from zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0045';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Repeated calls for the same array stay identical.
      expect(joinNumbers([7, 8])).assertEqual(joinNumbers([7, 8]));
      // The empty array placeholder differs from the single zero render.
      expect(joinNumbers([]) !== joinNumbers([0])).assertTrue();
      // The repeated render of the empty array stays the placeholder.
      expect(joinNumbers([])).assertEqual('-');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_4600
     * @tc.name      testNumFormat0046
     * @tc.desc      Verify joinNumbers renders an unsorted five element array in the given order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0046';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The unsorted digits render in the original array order without sorting.
      const rendered: string = joinNumbers([3, 1, 4, 1, 5]);
      expect(rendered).assertEqual('3, 1, 4, 1, 5');
      // The render keeps the thirteen character width.
      expect(rendered.length).assertEqual(13);
      // The first separator starts after the single digit first element.
      expect(rendered.indexOf(', ')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_4700
     * @tc.name      testNumFormat0047
     * @tc.desc      Verify elapsedMilliseconds returns a non-negative numeric duration for a fresh start point.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0047';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A start point captured immediately before the call measures the call window.
      const startedAt: number = Date.now();
      const measured: number = elapsedMilliseconds(startedAt);
      // The measured duration is never negative for a fresh start point.
      expect(measured >= 0).assertTrue();
      // The measured duration is a plain numeric value.
      expect(typeof measured).assertEqual('number');
      // A follow up measurement for the same start point also stays non-negative.
      expect(elapsedMilliseconds(startedAt) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_4800
     * @tc.name      testNumFormat0048
     * @tc.desc      Verify elapsedMilliseconds measures at least ten milliseconds across a real sleep.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumFormat0048';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The start point is captured before the ten millisecond sleep.
      const startedAt: number = Date.now();
      await sleepMs(10);
      const measured: number = elapsedMilliseconds(startedAt);
      // The sleep duration fully elapsed before the measurement.
      expect(measured >= 10).assertTrue();
      // The measurement stays inside the five second medium case ceiling.
      expect(measured < QUICK_CEILING_MS).assertTrue();
      // The measured duration is a plain numeric value.
      expect(typeof measured).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_4900
     * @tc.name      testNumFormat0049
     * @tc.desc      Verify elapsedMilliseconds measures at least fifty milliseconds across a real sleep.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumFormat0049';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The start point is captured before the fifty millisecond sleep.
      const startedAt: number = Date.now();
      await sleepMs(50);
      const measured: number = elapsedMilliseconds(startedAt);
      // The sleep duration fully elapsed before the measurement.
      expect(measured >= 50).assertTrue();
      // The measurement stays inside the five second medium case ceiling.
      expect(measured < QUICK_CEILING_MS).assertTrue();
      // The raw clock window agrees the fifty milliseconds elapsed.
      expect(Date.now() - startedAt >= 50).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_5000
     * @tc.name      testNumFormat0050
     * @tc.desc      Verify elapsedMilliseconds measures at least one hundred milliseconds across a real sleep.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumFormat0050';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The start point is captured before the one hundred millisecond sleep.
      const startedAt: number = Date.now();
      await sleepMs(100);
      const measured: number = elapsedMilliseconds(startedAt);
      // The sleep duration fully elapsed before the measurement.
      expect(measured >= 100).assertTrue();
      // The measurement stays inside the five second medium case ceiling.
      expect(measured < QUICK_CEILING_MS).assertTrue();
      // A second measurement of the same start point grows even further.
      expect(elapsedMilliseconds(startedAt) >= measured).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_5100
     * @tc.name      testNumFormat0051
     * @tc.desc      Verify elapsedMilliseconds measures at least one millisecond across a real sleep.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumFormat0051';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The start point is captured before the one millisecond sleep.
      const startedAt: number = Date.now();
      await sleepMs(1);
      const measured: number = elapsedMilliseconds(startedAt);
      // Even the smallest sleep matrix point fully elapsed.
      expect(measured >= 1).assertTrue();
      // The measurement stays inside the five second medium case ceiling.
      expect(measured < QUICK_CEILING_MS).assertTrue();
      // The measured duration is a plain numeric value.
      expect(typeof measured).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_5200
     * @tc.name      testNumFormat0052
     * @tc.desc      Verify elapsedMilliseconds measures at least one second for a past start point.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0052';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A start point one second in the past yields at least one second.
      const pastStart: number = Date.now() - 1000;
      const measured: number = elapsedMilliseconds(pastStart);
      expect(measured >= 1000).assertTrue();
      // The past start measurement is a plain numeric value.
      expect(typeof measured).assertEqual('number');
      // The measurement corridor stays bounded for the shifted matrix point.
      expect(measured < QUICK_CEILING_MS * 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_5300
     * @tc.name      testNumFormat0053
     * @tc.desc      Verify elapsedMilliseconds measures at least five seconds for an older past start point.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0053';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A start point five seconds in the past yields at least five seconds.
      const pastStart: number = Date.now() - 5000;
      const measured: number = elapsedMilliseconds(pastStart);
      expect(measured >= 5000).assertTrue();
      // The shifted measurement is a plain numeric value.
      expect(typeof measured).assertEqual('number');
      // The shifted corridor stays above the fresh measurement scale.
      expect(measured > 1000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_5400
     * @tc.name      testNumFormat0054
     * @tc.desc      Verify elapsedMilliseconds measures the full device uptime for the epoch zero start point.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0054';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The epoch zero matrix point measures the whole device uptime.
      const measured: number = elapsedMilliseconds(0);
      // The uptime sits far beyond the year 2020 epoch bound.
      expect(measured > YEAR_2020_MS).assertTrue();
      // The uptime measurement is a plain numeric value.
      expect(typeof measured).assertEqual('number');
      // The uptime measurement is strictly positive on any working device clock.
      expect(measured > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_5500
     * @tc.name      testNumFormat0055
     * @tc.desc      Verify elapsedMilliseconds returns a negative raw difference for a future start point.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0055';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A start point three hundred milliseconds in the future goes below zero.
      const futureStart: number = Date.now() + 300;
      const measured: number = elapsedMilliseconds(futureStart);
      expect(measured < 0).assertTrue();
      // The negative difference stays within a sane corridor far above minus one minute.
      expect(measured > -60000).assertTrue();
      // The negative matrix result is a plain numeric value.
      expect(typeof measured).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_5600
     * @tc.name      testNumFormat0056
     * @tc.desc      Verify elapsedMilliseconds strictly grows for one start point across a real sleep.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumFormat0056';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The first measurement runs right after the start point is captured.
      const startedAt: number = Date.now();
      const firstMeasured: number = elapsedMilliseconds(startedAt);
      // A real ten millisecond sleep advances the clock before the second measurement.
      await sleepMs(10);
      const secondMeasured: number = elapsedMilliseconds(startedAt);
      // The second measurement strictly exceeds the first one.
      expect(secondMeasured > firstMeasured).assertTrue();
      // The second measurement covers the full sleep duration.
      expect(secondMeasured >= 10).assertTrue();
      // The first measurement already stayed non-negative.
      expect(firstMeasured >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_5700
     * @tc.name      testNumFormat0057
     * @tc.desc      Verify elapsedMilliseconds keeps the five millisecond gap between two shifted start points.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumFormat0057';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The first start point is captured before the five millisecond sleep.
      const firstStart: number = Date.now();
      await sleepMs(5);
      const secondStart: number = Date.now();
      const firstElapsed: number = elapsedMilliseconds(firstStart);
      const secondElapsed: number = elapsedMilliseconds(secondStart);
      // The earlier start measures at least the captured gap plus the fresh window.
      expect(firstElapsed >= secondElapsed + 5).assertTrue();
      // The later start measurement stays non-negative.
      expect(secondElapsed >= 0).assertTrue();
      // Both measurements are plain numeric values.
      expect(typeof firstElapsed).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_5800
     * @tc.name      testNumFormat0058
     * @tc.desc      Verify elapsedMilliseconds for one start point never shrinks across two rapid calls.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0058';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One start point is measured twice in immediate succession.
      const startedAt: number = Date.now();
      const firstMeasured: number = elapsedMilliseconds(startedAt);
      const secondMeasured: number = elapsedMilliseconds(startedAt);
      // The second measurement never goes below the first one.
      expect(secondMeasured >= firstMeasured).assertTrue();
      // The gap between two rapid measurements stays tiny.
      expect(secondMeasured - firstMeasured < 1000).assertTrue();
      // Both measurements are plain numeric values.
      expect(typeof firstMeasured).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_5900
     * @tc.name      testNumFormat0059
     * @tc.desc      Verify the epoch zero uptime measurement exceeds the fresh start measurement.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0059';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The epoch zero start measures the whole device uptime.
      const uptime: number = elapsedMilliseconds(0);
      // The fresh start measures only the immediate call window.
      const fresh: number = elapsedMilliseconds(Date.now());
      // The uptime measurement strictly exceeds the fresh window.
      expect(uptime > fresh).assertTrue();
      // Both measurements are plain numeric values.
      expect(typeof uptime).assertEqual('number');
      // The fresh window already stayed non-negative.
      expect(fresh >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_6000
     * @tc.name      testNumFormat0060
     * @tc.desc      Verify elapsedMilliseconds for a fresh start stays inside the single day corridor.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0060';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The fresh start measurement stays inside the single day corridor.
      const measured: number = elapsedMilliseconds(Date.now());
      // The lower bound of the corridor is zero.
      expect(measured >= 0).assertTrue();
      // The upper bound of the corridor is one day in milliseconds.
      expect(measured < 86400000).assertTrue();
      // The measured duration is a plain numeric value.
      expect(typeof measured).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_6100
     * @tc.name      testNumFormat0061
     * @tc.desc      Verify formatBytes and joinNumbers share the identical dash placeholder contract.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0061';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Both helpers fall back to the same placeholder for their empty inputs.
      const bytePlaceholder: string = formatBytes(-1);
      const joinPlaceholder: string = joinNumbers([]);
      expect(bytePlaceholder).assertEqual('-');
      expect(joinPlaceholder).assertEqual('-');
      // The shared placeholder text is identical across the two helpers.
      expect(bytePlaceholder).assertEqual(joinPlaceholder);
      // Valid inputs never collide with the shared placeholder.
      expect(formatBytes(0) !== joinPlaceholder).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_6200
     * @tc.name      testNumFormat0062
     * @tc.desc      Verify formatBytes renders the whole unit ladder matrix points in one kilobyte steps.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0062';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The one byte matrix point stays in the plain bytes branch.
      expect(formatBytes(1)).assertEqual('1 B');
      // The one kilobyte matrix point scales into the KB branch.
      expect(formatBytes(KILO_UNIT)).assertEqual('1.00 KB');
      // The one megabyte matrix point scales into the MB branch.
      expect(formatBytes(MEGA_UNIT)).assertEqual('1.00 MB');
      // The one gigabyte matrix point scales into the GB branch.
      expect(formatBytes(GIGA_UNIT)).assertEqual('1.00 GB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_6300
     * @tc.name      testNumFormat0063
     * @tc.desc      Verify formatBytes renders distinct texts for the one byte boundary pairs of each unit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0063';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The kilobyte boundary pair renders a bytes text and a KB text.
      expect(formatBytes(KILO_UNIT - 1) !== formatBytes(KILO_UNIT)).assertTrue();
      // The megabyte boundary pair renders a KB text and an MB text.
      expect(formatBytes(MEGA_UNIT - 1) !== formatBytes(MEGA_UNIT)).assertTrue();
      // The gigabyte boundary pair renders an MB text and a GB text.
      expect(formatBytes(GIGA_UNIT - 1) !== formatBytes(GIGA_UNIT)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_6400
     * @tc.name      testNumFormat0064
     * @tc.desc      Verify formatBytes matches the pure division oracle for the KB MB and GB matrix points.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0064';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The kilobyte oracle reproduces the exact KB render.
      const kiloOracle: string = (2048 / KILO_UNIT).toFixed(2) + ' KB';
      expect(formatBytes(2048)).assertEqual(kiloOracle);
      // The megabyte oracle reproduces the exact MB render.
      const megaOracle: string = (3145728 / MEGA_UNIT).toFixed(2) + ' MB';
      expect(formatBytes(3145728)).assertEqual(megaOracle);
      // The gigabyte oracle reproduces the exact GB render.
      const gigaOracle: string = (3221225472 / GIGA_UNIT).toFixed(2) + ' GB';
      expect(formatBytes(3221225472)).assertEqual(gigaOracle);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_6500
     * @tc.name      testNumFormat0065
     * @tc.desc      Verify joinNumbers matches a loop built concat oracle for a five element array.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0065';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The five element array is replayed through the same concat algorithm.
      const source: number[] = [3, 1, 4, 1, 5];
      let oracle: string = '-';
      for (let index: number = 0; index < source.length; index++) {
        oracle = index === 0 ? source[index].toString() : oracle + ', ' + source[index].toString();
      }
      // The helper output matches the oracle exactly.
      expect(joinNumbers(source)).assertEqual(oracle);
      // The oracle itself produced the expected five element text.
      expect(oracle).assertEqual('3, 1, 4, 1, 5');
      // The render keeps the thirteen character width.
      expect(oracle.length).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_6600
     * @tc.name      testNumFormat0066
     * @tc.desc      Verify elapsedMilliseconds keeps the plus and minus ten millisecond matrix corridors.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0066';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The fresh start measurement stays inside the one minute corridor.
      const freshElapsed: number = elapsedMilliseconds(Date.now());
      expect(freshElapsed < 60000).assertTrue();
      // The ten millisecond past start measures at least the shifted gap.
      const tenBackStart: number = Date.now() - 10;
      expect(elapsedMilliseconds(tenBackStart) >= 10).assertTrue();
      // The ten millisecond future start stays negative but above minus ten.
      const tenAheadStart: number = Date.now() + 10;
      const aheadElapsed: number = elapsedMilliseconds(tenAheadStart);
      expect(aheadElapsed < 0).assertTrue();
      // The future corridor never drops below the shifted gap bound.
      expect(aheadElapsed >= -10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_6700
     * @tc.name      testNumFormat0067
     * @tc.desc      Verify formatBytes renders the three kilobyte matrix point as an exact whole KB value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0067';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 3072 matrix point is exactly three kilobytes.
      const rendered: string = formatBytes(3072);
      expect(rendered).assertEqual('3.00 KB');
      // The integer part carries the scaled value.
      expect(rendered.substring(0, 1)).assertEqual('3');
      // The oracle of the same division reproduces the rendered text.
      expect((3072 / KILO_UNIT).toFixed(2) + ' KB').assertEqual(rendered);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_6800
     * @tc.name      testNumFormat0068
     * @tc.desc      Verify joinNumbers renders the two digit power of two sequence with three separators.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0068';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The power of two sequence joins with three separators.
      const rendered: string = joinNumbers([16, 32, 64, 128]);
      expect(rendered).assertEqual('16, 32, 64, 128');
      // The render keeps the fifteen character width.
      expect(rendered.length).assertEqual(15);
      // The first separator starts after the two digit first element.
      expect(rendered.indexOf(', ')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_6900
     * @tc.name      testNumFormat0069
     * @tc.desc      Verify elapsedMilliseconds never shrinks across three rapid measurements of one start point.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0069';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One start point is measured three times in immediate succession.
      const startedAt: number = Date.now();
      const first: number = elapsedMilliseconds(startedAt);
      const second: number = elapsedMilliseconds(startedAt);
      const third: number = elapsedMilliseconds(startedAt);
      // The second measurement never drops below the first one.
      expect(second >= first).assertTrue();
      // The third measurement never drops below the second one.
      expect(third >= second).assertTrue();
      // The first measurement already stayed non-negative.
      expect(first >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_7000
     * @tc.name      testNumFormat0070
     * @tc.desc      Verify joinNumbers renders the three digit multiples sequence with two separators.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0070';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The three digit multiples join with two separators.
      const rendered: string = joinNumbers([100, 200, 300]);
      expect(rendered).assertEqual('100, 200, 300');
      // The render keeps the thirteen character width.
      expect(rendered.length).assertEqual(13);
      // The first separator starts after the three digit first element.
      expect(rendered.indexOf(', ')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_7100
     * @tc.name      testNumFormat0071
     * @tc.desc      Verify elapsedMilliseconds measures at least thirty milliseconds across a real sleep.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumFormat0071';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The start point is captured before the thirty millisecond sleep.
      const startedAt: number = Date.now();
      await sleepMs(30);
      const measured: number = elapsedMilliseconds(startedAt);
      // The sleep duration fully elapsed before the measurement.
      expect(measured >= 30).assertTrue();
      // The measurement stays inside the five second medium case ceiling.
      expect(measured < QUICK_CEILING_MS).assertTrue();
      // The measured duration is a plain numeric value.
      expect(typeof measured).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_7200
     * @tc.name      testNumFormat0072
     * @tc.desc      Verify formatBytes renders the eight kilobyte matrix point through the division oracle.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumFormat0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumFormat0072';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 8192 matrix point is exactly eight kilobytes.
      const rendered: string = formatBytes(8192);
      expect(rendered).assertEqual('8.00 KB');
      // The integer part carries the scaled value.
      expect(rendered.substring(0, 1)).assertEqual('8');
      // The oracle of the same division reproduces the rendered text.
      expect((8192 / KILO_UNIT).toFixed(2) + ' KB').assertEqual(rendered);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_FORMAT_7300
     * @tc.name      testNumFormat0073
     * @tc.desc      Verify joinNumbers renders the mixed three and four digit quota sequence in order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumFormat0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumFormat0073';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The quota sequence joins with three separators.
      const rendered: string = joinNumbers([250, 500, 750, 1000]);
      expect(rendered).assertEqual('250, 500, 750, 1000');
      // The render keeps the nineteen character width.
      expect(rendered.length).assertEqual(19);
      // The final element carries all four digits of the number one thousand.
      expect(rendered.substring(rendered.length - 4, rendered.length)).assertEqual('1000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
