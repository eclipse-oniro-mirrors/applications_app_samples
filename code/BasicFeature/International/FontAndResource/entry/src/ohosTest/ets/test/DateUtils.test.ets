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

// Import the date helpers under test from the library HAR package.
import { DateUtils } from 'library';
// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

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

// Registers every on-device logic test case of the date helpers.
export default function dateUtilsTest() {
  // Group the cases under the "DateUtilsSuite" describe block.
  describe('DateUtilsSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'DateUtilsSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATE_0100
     * @tc.name      testDateConst0001
     * @tc.desc      Verify the millisecond constants hold their exact values and stay consistent with each other.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateConst0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDateConst0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Expect one second to equal one thousand milliseconds.
      expect(DateUtils.MS_PER_SECOND).assertEqual(1000);
      // Expect one minute to equal sixty thousand milliseconds.
      expect(DateUtils.MS_PER_MINUTE).assertEqual(60000);
      // Expect one hour to equal three million six hundred thousand milliseconds.
      expect(DateUtils.MS_PER_HOUR).assertEqual(3600000);
      // Expect one day to equal eighty six million four hundred thousand milliseconds.
      expect(DateUtils.MS_PER_DAY).assertEqual(86400000);
      // Log the constant values.
      logCase(TAG, 'constants: ' + DateUtils.MS_PER_SECOND + ', ' + DateUtils.MS_PER_MINUTE +
        ', ' + DateUtils.MS_PER_HOUR + ', ' + DateUtils.MS_PER_DAY);

      // Cross check: one day equals twenty four hours exactly.
      expect(DateUtils.MS_PER_DAY === DateUtils.MS_PER_HOUR * 24).assertTrue();
      // Cross check: one hour equals sixty minutes exactly.
      expect(DateUtils.MS_PER_HOUR === DateUtils.MS_PER_MINUTE * 60).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATE_0200
     * @tc.name      testDateFormat0001
     * @tc.desc      Verify formatDate renders the yyyy-MM-dd form with zero padded single digit months and days.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateFormat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDateFormat0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // The matrix date is the sixth of November 2026 built from fixed local fields.
      const matrixDate: Date = new Date(2026, 10, 6);
      // Format the matrix date through the helper.
      const matrixText: string = DateUtils.formatDate(matrixDate);
      // Log the matrix date text.
      logCase(TAG, 'formatDate(2026-11-06): ' + matrixText);
      // Expect the matrix date to render with the padded month and day.
      expect(matrixText).assertEqual('2026-11-06');

      // The first of January exercises the smallest month and day numbers.
      const newYearDate: Date = new Date(2026, 0, 1);
      // Log the new year date text.
      logCase(TAG, 'formatDate(2026-01-01): ' + DateUtils.formatDate(newYearDate));
      // Expect the single digit month and day to both pad to two digits.
      expect(DateUtils.formatDate(newYearDate)).assertEqual('2026-01-01');

      // A single digit month with a two digit day still pads the month only.
      const marchDate: Date = new Date(2026, 2, 15);
      // Log the march date text.
      logCase(TAG, 'formatDate(2026-03-15): ' + DateUtils.formatDate(marchDate));
      // Expect the march date to render with the padded month.
      expect(DateUtils.formatDate(marchDate)).assertEqual('2026-03-15');

      // The last day of the year exercises the largest month and day numbers.
      const yearEndDate: Date = new Date(2026, 11, 31);
      // Log the year end date text.
      logCase(TAG, 'formatDate(2026-12-31): ' + DateUtils.formatDate(yearEndDate));
      // Expect the year end date to render without any extra padding.
      expect(DateUtils.formatDate(yearEndDate)).assertEqual('2026-12-31');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATE_0300
     * @tc.name      testDateTime0001
     * @tc.desc      Verify formatTime renders the padded 24 hour HH:mm:ss form and formatDateTime joins date and time with one space.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDateTime0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // The matrix time uses single digit hour, minute and second fields.
      const matrixDate: Date = new Date(2026, 10, 6, 7, 5, 3);
      // Format the matrix time through the helper.
      const matrixTimeText: string = DateUtils.formatTime(matrixDate);
      // Log the matrix time text.
      logCase(TAG, 'formatTime(07:05:03): ' + matrixTimeText);
      // Expect every single digit field to pad to two digits.
      expect(matrixTimeText).assertEqual('07:05:03');

      // The last second of the day renders in 24 hour form.
      const lateNightDate: Date = new Date(2026, 10, 6, 23, 59, 59);
      // Log the late night time text.
      logCase(TAG, 'formatTime(23:59:59): ' + DateUtils.formatTime(lateNightDate));
      // Expect the late night time to render without any twelve hour wrapping.
      expect(DateUtils.formatTime(lateNightDate)).assertEqual('23:59:59');

      // Noon renders with zero padded minutes and seconds.
      const noonDate: Date = new Date(2026, 10, 6, 12, 0, 0);
      // Log the noon time text.
      logCase(TAG, 'formatTime(12:00:00): ' + DateUtils.formatTime(noonDate));
      // Expect noon to render with the padded zero fields.
      expect(DateUtils.formatTime(noonDate)).assertEqual('12:00:00');

      // The full date time text joins the date and time portions with one space.
      const fullText: string = DateUtils.formatDateTime(matrixDate);
      // Log the full date time text.
      logCase(TAG, 'formatDateTime: ' + fullText);
      // Expect the joined text to equal the matrix date and time with one space.
      expect(fullText).assertEqual('2026-11-06 07:05:03');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATE_0400
     * @tc.name      testDateEpoch0001
     * @tc.desc      Verify fromEpochMs round trips a fixed local Date through getTime without timezone drift and matches formatDateTime.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateEpoch0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDateEpoch0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Build a fixed local date time so no UTC offset can shift the fields.
      const sample: Date = new Date(2026, 10, 6, 7, 5, 3);
      // Convert the local sample into epoch milliseconds and back into text.
      const sampleText: string = DateUtils.fromEpochMs(sample.getTime());
      // Log the round trip text of the first sample.
      logCase(TAG, 'fromEpochMs(sample): ' + sampleText);
      // Expect the round trip to restore the exact local fields.
      expect(sampleText).assertEqual('2026-11-06 07:05:03');

      // Build a second fixed local date time in January with padded fields.
      const winter: Date = new Date(2027, 0, 15, 23, 1, 2);
      // Convert the winter sample into epoch milliseconds and back into text.
      const winterText: string = DateUtils.fromEpochMs(winter.getTime());
      // Log the round trip text of the winter sample.
      logCase(TAG, 'fromEpochMs(winter): ' + winterText);
      // Expect the winter round trip to restore the exact local fields.
      expect(winterText).assertEqual('2027-01-15 23:01:02');

      // Build a third probe date for the consistency check.
      const probe: Date = new Date(2024, 5, 30, 12, 0, 0);
      // The epoch text of any local date must match its direct formatDateTime text.
      // Log the consistency check inputs.
      logCase(TAG, 'probe time: ' + probe.getTime());
      // Expect the epoch path to agree with the direct formatting path.
      expect(DateUtils.fromEpochMs(probe.getTime())).assertEqual(DateUtils.formatDateTime(probe));
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATE_0500
     * @tc.name      testDateDuration0001
     * @tc.desc      Verify durationText renders seconds only under a minute, minutes plus seconds under an hour and hours plus minutes plus seconds above.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateDuration0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDateDuration0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // The matrix span of forty five seconds shows seconds only.
      const shortText: string = DateUtils.durationText(45000);
      // Log the short span text.
      logCase(TAG, 'durationText(45000): ' + shortText);
      // Expect the short span to render as 45s.
      expect(shortText).assertEqual('45s');

      // The matrix span of sixty one seconds shows minutes and seconds.
      const minuteText: string = DateUtils.durationText(61000);
      // Log the minute span text.
      logCase(TAG, 'durationText(61000): ' + minuteText);
      // Expect the minute span to render as 1m 1s.
      expect(minuteText).assertEqual('1m 1s');

      // The matrix span of one hour one minute one second shows all three parts.
      const hourText: string = DateUtils.durationText(3661000);
      // Log the hour span text.
      logCase(TAG, 'durationText(3661000): ' + hourText);
      // Expect the hour span to render as 1h 1m 1s.
      expect(hourText).assertEqual('1h 1m 1s');

      // A zero span still shows the seconds unit.
      const zeroText: string = DateUtils.durationText(0);
      // Log the zero span text.
      logCase(TAG, 'durationText(0): ' + zeroText);
      // Expect the zero span to render as 0s.
      expect(zeroText).assertEqual('0s');

      // A span one millisecond under a minute still stays in the seconds only form.
      const edgeText: string = DateUtils.durationText(59999);
      // Log the edge span text.
      logCase(TAG, 'durationText(59999): ' + edgeText);
      // Expect the edge span to render as 59s.
      expect(edgeText).assertEqual('59s');

      // A two hour two minute five second span keeps every non zero part.
      const multiText: string = DateUtils.durationText(7325000);
      // Log the multi part span text.
      logCase(TAG, 'durationText(7325000): ' + multiText);
      // Expect the multi part span to render as 2h 2m 5s.
      expect(multiText).assertEqual('2h 2m 5s');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATE_0600
     * @tc.name      testDateDiff0001
     * @tc.desc      Verify diffMs returns the absolute span for forward order, reversed order, identical instants and a half day gap.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateDiff0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDateDiff0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Build two local instants exactly one hour apart.
      const earlier: Date = new Date(2026, 10, 6, 8, 0, 0);
      const later: Date = new Date(2026, 10, 6, 9, 0, 0);
      // Forward order returns the positive hour span.
      const forwardDiff: number = DateUtils.diffMs(earlier, later);
      // Log the forward order difference.
      logCase(TAG, 'diffMs(earlier, later): ' + forwardDiff);
      // Expect the forward order span to equal one hour in milliseconds.
      expect(forwardDiff).assertEqual(3600000);

      // Reversed order still returns the same absolute span.
      const reversedDiff: number = DateUtils.diffMs(later, earlier);
      // Log the reversed order difference.
      logCase(TAG, 'diffMs(later, earlier): ' + reversedDiff);
      // Expect the reversed order span to stay positive and equal one hour.
      expect(reversedDiff).assertEqual(3600000);

      // Identical instants return a zero difference.
      const sameDiff: number = DateUtils.diffMs(earlier, earlier);
      // Log the identical instant difference.
      logCase(TAG, 'diffMs(earlier, earlier): ' + sameDiff);
      // Expect the identical instant span to be zero.
      expect(sameDiff).assertEqual(0);

      // Build a half day gap from midnight to noon thirty.
      const midnight: Date = new Date(2026, 10, 6, 0, 0, 0);
      const noonHalf: Date = new Date(2026, 10, 6, 12, 30, 0);
      // Log the half day difference.
      logCase(TAG, 'diffMs(midnight, noonHalf): ' + DateUtils.diffMs(midnight, noonHalf));
      // Expect the half day gap to equal forty five million milliseconds.
      expect(DateUtils.diffMs(midnight, noonHalf)).assertEqual(45000000);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATE_0700
     * @tc.name      testDateSameDay0001
     * @tc.desc      Verify isSameDay returns true for instants sharing a calendar day and false across day, month and year boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateSameDay0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDateSameDay0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Morning and evening of the same calendar day compare as the same day.
      const sameDayResult: boolean = DateUtils.isSameDay(
        new Date(2026, 10, 6, 8, 0, 0), new Date(2026, 10, 6, 22, 59, 59));
      // Log the same day check result.
      logCase(TAG, 'same day different times: ' + sameDayResult);
      // Expect the same calendar day instants to compare as the same day.
      expect(sameDayResult).assertTrue();

      // Identical instants compare as the same day.
      const identicalResult: boolean = DateUtils.isSameDay(
        new Date(2026, 10, 6, 12, 0, 0), new Date(2026, 10, 6, 12, 0, 0));
      // Log the identical instant check result.
      logCase(TAG, 'identical instants: ' + identicalResult);
      // Expect the identical instants to compare as the same day.
      expect(identicalResult).assertTrue();

      // The last second of a day and the first second of the next day differ.
      const midnightCrossResult: boolean = DateUtils.isSameDay(
        new Date(2026, 10, 6, 23, 59, 59), new Date(2026, 10, 7, 0, 0, 0));
      // Log the midnight crossing check result.
      logCase(TAG, 'across midnight: ' + midnightCrossResult);
      // Expect the midnight crossing instants to differ.
      expect(midnightCrossResult).assertFalse();

      // Days in different months differ even with the same day number.
      const monthCrossResult: boolean = DateUtils.isSameDay(
        new Date(2026, 10, 6), new Date(2026, 11, 6));
      // Log the month crossing check result.
      logCase(TAG, 'across months: ' + monthCrossResult);
      // Expect the month crossing dates to differ.
      expect(monthCrossResult).assertFalse();

      // Days in different years differ even with the same month and day.
      const yearCrossResult: boolean = DateUtils.isSameDay(
        new Date(2025, 10, 6), new Date(2026, 10, 6));
      // Log the year crossing check result.
      logCase(TAG, 'across years: ' + yearCrossResult);
      // Expect the year crossing dates to differ.
      expect(yearCrossResult).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATE_0800
     * @tc.name      testDateAddDays0001
     * @tc.desc      Verify addDays crosses the month boundary, supports negative day counts, keeps zero days stable and never mutates the source date.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateAddDays0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDateAddDays0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Build a fixed local date at the end of November.
      const base: Date = new Date(2026, 10, 30);
      // Add one day across the month boundary into December.
      const shifted: Date = DateUtils.addDays(base, 1);
      // Log the shifted date text.
      logCase(TAG, 'addDays(base, 1): ' + DateUtils.formatDate(shifted));
      // Expect the shifted date to render as December first.
      expect(DateUtils.formatDate(shifted)).assertEqual('2026-12-01');
      // Expect the shifted instant to match the December first local midnight exactly.
      expect(shifted.getTime()).assertEqual(new Date(2026, 11, 1).getTime());

      // Add a negative day count from December first back into November.
      const backward: Date = DateUtils.addDays(new Date(2026, 11, 1), -1);
      // Log the backward date text.
      logCase(TAG, 'addDays(2026-12-01, -1): ' + DateUtils.formatDate(backward));
      // Expect the backward date to render as November thirtieth.
      expect(DateUtils.formatDate(backward)).assertEqual('2026-11-30');

      // Adding zero days returns the very same instant.
      const zeroShiftTime: number = DateUtils.addDays(base, 0).getTime();
      // Log the zero day result.
      logCase(TAG, 'addDays(base, 0) time: ' + zeroShiftTime);
      // Expect the zero day shift to preserve the source instant.
      expect(zeroShiftTime).assertEqual(base.getTime());

      // The original date object must not be mutated by addDays.
      const baseTime: number = base.getTime();
      // Log the source instant after the shifts.
      logCase(TAG, 'base time after shifts: ' + baseTime);
      // Expect the source instant to still equal the untouched November thirtieth midnight.
      expect(baseTime).assertEqual(new Date(2026, 10, 30).getTime());
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATE_0900
     * @tc.name      testDateWeekday0001
     * @tc.desc      Verify weekdayIndex maps Monday to zero, Friday to four, Saturday to five and Sunday to six with Monday first indexing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateWeekday0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDateWeekday0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // The matrix date 2026-11-06 is a Friday and maps into slot four.
      const fridayIndex: number = DateUtils.weekdayIndex(new Date(2026, 10, 6));
      // Log the Friday index.
      logCase(TAG, 'weekdayIndex(2026-11-06): ' + fridayIndex);
      // Expect the Friday to map into slot four.
      expect(fridayIndex).assertEqual(4);

      // The matrix date 2026-11-08 is a Sunday and maps into the last slot.
      const sundayIndex: number = DateUtils.weekdayIndex(new Date(2026, 10, 8));
      // Log the Sunday index.
      logCase(TAG, 'weekdayIndex(2026-11-08): ' + sundayIndex);
      // Expect the Sunday to map into slot six.
      expect(sundayIndex).assertEqual(6);

      // 2026-11-02 is a Monday and maps into the first slot.
      const mondayIndex: number = DateUtils.weekdayIndex(new Date(2026, 10, 2));
      // Log the Monday index.
      logCase(TAG, 'weekdayIndex(2026-11-02): ' + mondayIndex);
      // Expect the Monday to map into slot zero.
      expect(mondayIndex).assertEqual(0);

      // 2026-11-07 is a Saturday and maps into the slot before Sunday.
      const saturdayIndex: number = DateUtils.weekdayIndex(new Date(2026, 10, 7));
      // Log the Saturday index.
      logCase(TAG, 'weekdayIndex(2026-11-07): ' + saturdayIndex);
      // Expect the Saturday to map into slot five.
      expect(saturdayIndex).assertEqual(5);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}

// Also expose the suite function as a named export so either registration style works.
export { dateUtilsTest };
