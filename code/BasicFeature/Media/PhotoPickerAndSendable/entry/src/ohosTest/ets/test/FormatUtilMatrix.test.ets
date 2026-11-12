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

/**
 * Matrix suite of the pure formatting helpers in photopicker/data/FormatUtil.
 * Every case drives one static method with hand computed inputs so the expected
 * strings and numbers below mirror the real ladder, padding and rounding rules.
 */

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { FormatUtil } from '../../../main/ets/photopicker/data/FormatUtil';

/**
 * Registers every formatting matrix case of the sample.
 */
export default function formatUtilMatrixTest() {
  // Group every case under one suite name reported by hypium.
  describe('FormatUtilMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_FORMAT_0100
     * @tc.name      testFormatUtil0001
     * @tc.desc      Verify bytes renders sub-kilobyte sizes as plain byte counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatUtil0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      // Zero bytes renders without any decimal part.
      expect(FormatUtil.bytes(0)).assertEqual('0 B');
      // A mid-range size below one kilobyte keeps the plain byte unit.
      expect(FormatUtil.bytes(820)).assertEqual('820 B');
      // One byte below the kilobyte threshold still belongs to the byte branch.
      expect(FormatUtil.bytes(1023)).assertEqual('1023 B');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FORMAT_0200
     * @tc.name      testFormatUtil0002
     * @tc.desc      Verify bytes keeps one decimal inside the kilobyte range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatUtil0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      // Exactly one kilobyte reads as 1.0 KB under the one decimal convention.
      expect(FormatUtil.bytes(1024)).assertEqual('1.0 KB');
      // 12600 bytes divide to 12.3046875 KB and round to one decimal as 12.3.
      expect(FormatUtil.bytes(12600)).assertEqual('12.3 KB');
      // One byte below two kilobytes rounds 1.9990234375 up to 2.0 KB.
      expect(FormatUtil.bytes(2047)).assertEqual('2.0 KB');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FORMAT_0300
     * @tc.name      testFormatUtil0003
     * @tc.desc      Verify bytes switches ladders at the kilobyte and megabyte edge.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFormatUtil0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      // One byte below one megabyte still uses the kilobyte ladder and rounds up.
      expect(FormatUtil.bytes(1048575)).assertEqual('1024.0 KB');
      // Exactly one megabyte switches to the megabyte ladder with two decimals.
      expect(FormatUtil.bytes(1048576)).assertEqual('1.00 MB');
      // One byte above one megabyte stays inside the megabyte ladder.
      expect(FormatUtil.bytes(1048577)).assertEqual('1.00 MB');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FORMAT_0400
     * @tc.name      testFormatUtil0004
     * @tc.desc      Verify bytes keeps two decimals inside the megabyte range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatUtil0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      // 1.5 megabytes shows the trailing zero of the two decimal format.
      expect(FormatUtil.bytes(1572864)).assertEqual('1.50 MB');
      // Exactly three megabytes renders without rounding drift.
      expect(FormatUtil.bytes(3145728)).assertEqual('3.00 MB');
      // Exactly five megabytes proves the divider uses the megabyte constant.
      expect(FormatUtil.bytes(5242880)).assertEqual('5.00 MB');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FORMAT_0500
     * @tc.name      testFormatUtil0005
     * @tc.desc      Verify bytes switches ladders at the megabyte and gigabyte edge.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFormatUtil0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      // One byte below one gigabyte stays in the megabyte ladder and rounds to 1024.00.
      expect(FormatUtil.bytes(1073741823)).assertEqual('1024.00 MB');
      // Exactly one gigabyte switches to the gigabyte ladder.
      expect(FormatUtil.bytes(1073741824)).assertEqual('1.00 GB');
      // Two gigabytes confirms the gigabyte divider scales beyond the first unit.
      expect(FormatUtil.bytes(2147483648)).assertEqual('2.00 GB');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FORMAT_0600
     * @tc.name      testFormatUtil0006
     * @tc.desc      Verify bytes renders negative sizes inside the plain byte branch.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatUtil0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      // A small negative value passes through the byte branch unchanged.
      expect(FormatUtil.bytes(-1)).assertEqual('-1 B');
      // A negative kilobyte value never reaches the kilobyte ladder.
      expect(FormatUtil.bytes(-1024)).assertEqual('-1024 B');
      // A negative megabyte value documents that no negative guard exists.
      expect(FormatUtil.bytes(-1048576)).assertEqual('-1048576 B');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FORMAT_0700
     * @tc.name      testFormatUtil0007
     * @tc.desc      Verify time zero pads narrow month, day, hour and minute fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFormatUtil0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      // January 5th at 07:08 keeps every narrow field two characters wide.
      const winterMorning: number = new Date(2026, 0, 5, 7, 8).getTime();
      expect(FormatUtil.time(winterMorning)).assertEqual('2026-01-05 07:08');
      // February 9th at 09:05 pads the one based month, the day and both clock fields.
      const februaryMorning: number = new Date(2026, 1, 9, 9, 5).getTime();
      expect(FormatUtil.time(februaryMorning)).assertEqual('2026-02-09 09:05');
      // Midnight of April 1st keeps the zero hour and minute visible as 00.
      const springMidnight: number = new Date(2026, 3, 1, 0, 0).getTime();
      expect(FormatUtil.time(springMidnight)).assertEqual('2026-04-01 00:00');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FORMAT_0800
     * @tc.name      testFormatUtil0008
     * @tc.desc      Verify time renders wide fields unchanged and drops seconds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatUtil0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      // The last minute of the year uses wide fields without extra padding.
      const yearEnd: number = new Date(2026, 11, 31, 23, 59).getTime();
      expect(FormatUtil.time(yearEnd)).assertEqual('2026-12-31 23:59');
      // An afternoon minute in June keeps the 24h clock format.
      const juneAfternoon: number = new Date(2026, 5, 15, 13, 45).getTime();
      expect(FormatUtil.time(juneAfternoon)).assertEqual('2026-06-15 13:45');
      // Seconds are dropped because the picker only shows minute precision.
      const withSeconds: number = new Date(2026, 7, 20, 10, 30, 59).getTime();
      expect(FormatUtil.time(withSeconds)).assertEqual('2026-08-20 10:30');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FORMAT_0900
     * @tc.name      testFormatUtil0009
     * @tc.desc      Verify percent returns zero when the total is zero or negative.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFormatUtil0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      // A zero total guards the division instead of producing NaN.
      expect(FormatUtil.percent(0, 0)).assertEqual(0);
      // A negative total guards the division instead of flipping the ratio sign.
      expect(FormatUtil.percent(50, -100)).assertEqual(0);
      // A zero part over a negative total is also short-circuited to zero.
      expect(FormatUtil.percent(0, -5)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FORMAT_1000
     * @tc.name      testFormatUtil0010
     * @tc.desc      Verify percent maps the part over a positive total onto the progress scale.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testFormatUtil0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      // An empty part over a full total reports zero progress.
      expect(FormatUtil.percent(0, 100)).assertEqual(0);
      // A half full total reports the exact midpoint.
      expect(FormatUtil.percent(50, 100)).assertEqual(50);
      // A fully processed total reports the full hundred.
      expect(FormatUtil.percent(100, 100)).assertEqual(100);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FORMAT_1100
     * @tc.name      testFormatUtil0011
     * @tc.desc      Verify percent rounds fractional ratios to whole integers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatUtil0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      // One third of the total rounds 33.33 down to 33.
      expect(FormatUtil.percent(1, 3)).assertEqual(33);
      // Two thirds of the total rounds 66.67 up to 67.
      expect(FormatUtil.percent(2, 3)).assertEqual(67);
      // 12.5 percent rounds half up to 13 per the Math.round rule.
      expect(FormatUtil.percent(1, 8)).assertEqual(13);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_FORMAT_1200
     * @tc.name      testFormatUtil0012
     * @tc.desc      Verify percent returns out of range values without clamping.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatUtil0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      // A part larger than the total passes 150 through unclamped.
      expect(FormatUtil.percent(150, 100)).assertEqual(150);
      // A part far above the total keeps its full magnitude.
      expect(FormatUtil.percent(250, 100)).assertEqual(250);
      // A negative part passes through as a negative percentage.
      expect(FormatUtil.percent(-10, 100)).assertEqual(-10);
    });
  });
}
