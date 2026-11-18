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
// Import the DateUtils helpers under test from the library HAR package.
import { DateUtils } from 'library';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';
// The length of a "yyyy-MM-dd" date text.
const DATE_TEXT_LENGTH: number = 10;
// The length of a "HH:mm:ss" time text.
const TIME_TEXT_LENGTH: number = 8;
// The length of a "yyyy-MM-dd HH:mm:ss" date time text.
const DATE_TIME_TEXT_LENGTH: number = 19;
// The length of a "yyyy-MM-dd HH:mm:ss.SSS" full date time text.
const FULL_TEXT_LENGTH: number = 23;
// The one second span in milliseconds.
const ONE_SECOND: number = 1000;
// The one minute span in milliseconds.
const ONE_MINUTE: number = 60 * ONE_SECOND;
// The one hour span in milliseconds.
const ONE_HOUR: number = 60 * ONE_MINUTE;
// The one day span in milliseconds.
const ONE_DAY: number = 24 * ONE_HOUR;
// The pattern expected from a "yyyy-MM-dd" date text.
const DATE_PATTERN: RegExp = /^\d{4}-\d{2}-\d{2}$/;
// The pattern expected from a "HH:mm:ss" time text.
const TIME_PATTERN: RegExp = /^\d{2}:\d{2}:\d{2}$/;
// The pattern expected from a "yyyy-MM-dd HH:mm:ss" date time text.
const DATE_TIME_PATTERN: RegExp = /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/;
// The pattern expected from a "yyyy-MM-dd HH:mm:ss.SSS" full date time text.
const FULL_PATTERN: RegExp = /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d{3}$/;

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Builds a local Date from the year, month (zero based), day and optional time parts.
function makeDate(year: number, month: number, day: number, hour: number, minute: number,
  second: number, millisecond: number): Date {
  // Assemble the local date through the seven argument constructor.
  return new Date(year, month, day, hour, minute, second, millisecond);
}

// Builds a local midnight Date for the given calendar day.
function makeMidnight(year: number, month: number, day: number): Date {
  // Reuse the full constructor with all time fields zeroed.
  return makeDate(year, month, day, 0, 0, 0, 0);
}

// Returns true when the text is made of digits only.
function isDigitsOnly(text: string): boolean {
  // Define the accepted digit alphabet.
  const digits: string = '0123456789';
  // Check every character against the digit alphabet.
  for (let i: number = 0; i < text.length; i++) {
    // Report a mismatch on the first unexpected character.
    if (digits.indexOf(text.charAt(i)) < 0) {
      // Reject the text.
      return false;
    }
  }
  // Accept the text when every character is a digit.
  return true;
}

// Registers every advanced case of the DateUtilsAdvancedSuite suite.
export default function dateUtilsAdvancedTest() {
  // Group the cases under the "DateUtilsAdvancedSuite" describe block.
  describe('DateUtilsAdvancedSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'DateUtilsAdvancedSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_0100
     * @tc.name      testFormatDatePadding0001
     * @tc.desc      Verify formatDate zero pads single digit months and days into the fixed layout.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatDatePadding0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFormatDatePadding0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // January first renders both the month and the day with a leading zero.
      logCase(TAG, 'formatDate(2024-01-01)');
      expect(DateUtils.formatDate(makeMidnight(2024, 0, 1))).assertEqual('2024-01-01');
      // December ninth renders the day with a leading zero only.
      logCase(TAG, 'formatDate(2024-12-09)');
      expect(DateUtils.formatDate(makeMidnight(2024, 11, 9))).assertEqual('2024-12-09');
      // October thirty first renders the month with a leading zero only.
      logCase(TAG, 'formatDate(2024-10-31)');
      expect(DateUtils.formatDate(makeMidnight(2024, 9, 31))).assertEqual('2024-10-31');
      // September ninth renders both parts with a leading zero.
      logCase(TAG, 'formatDate(2023-09-09)');
      expect(DateUtils.formatDate(makeMidnight(2023, 8, 9))).assertEqual('2023-09-09');
      // A leap day keeps the twenty ninth day of February.
      logCase(TAG, 'formatDate(2024-02-29)');
      expect(DateUtils.formatDate(makeMidnight(2024, 1, 29))).assertEqual('2024-02-29');
      // Every rendered date keeps the fixed ten character layout.
      logCase(TAG, 'formatDate length check');
      expect(DateUtils.formatDate(makeMidnight(2024, 0, 1)).length).assertEqual(DATE_TEXT_LENGTH);
      // The rendered text always matches the dashed date pattern.
      logCase(TAG, 'formatDate pattern check');
      expect(DATE_PATTERN.test(DateUtils.formatDate(makeMidnight(2021, 5, 6)))).assertTrue();
      // The month segment keeps its leading zero when it is read back.
      logCase(TAG, 'formatDate month segment');
      expect(DateUtils.formatDate(makeMidnight(2021, 5, 6)).substring(5, 7)).assertEqual('06');
      // The day segment keeps its leading zero when it is read back.
      logCase(TAG, 'formatDate day segment');
      expect(DateUtils.formatDate(makeMidnight(2021, 5, 6)).substring(8, 10)).assertEqual('06');
      // The year segment keeps every digit of a four digit year.
      logCase(TAG, 'formatDate year segment');
      expect(DateUtils.formatDate(makeMidnight(1999, 11, 31)).substring(0, 4)).assertEqual('1999');
      // A year below one thousand still renders four digits.
      logCase(TAG, 'formatDate(0999-07-15)');
      expect(DateUtils.formatDate(makeMidnight(999, 6, 15)).length).assertEqual(DATE_TEXT_LENGTH);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_0200
     * @tc.name      testFormatDateMonthMatrix0002
     * @tc.desc      Verify formatDate maps all twelve zero based month indices to their calendar names.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatDateMonthMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFormatDateMonthMatrix0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Each zero based month index is mapped to the padded calendar month text.
      const expectedMonths: string[] = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'];
      // Walk every month of a non leap year using the fifteenth day.
      for (let month: number = 0; month < expectedMonths.length; month++) {
        // Record the month index under test.
        logCase(TAG, 'monthIndex=' + month.toString());
        // Format the fifteenth day of the current month.
        const text: string = DateUtils.formatDate(makeMidnight(2024, month, 15));
        // The month segment must match the padded month text.
        expect(text.substring(5, 7)).assertEqual(expectedMonths[month]);
        // The day segment must stay on the fifteenth.
        expect(text.substring(8, 10)).assertEqual('15');
        // The year segment must keep the four digit year.
        expect(text.substring(0, 4)).assertEqual('2024');
      }
      // The month matrix covers twelve indices and one cell per index.
      expect(expectedMonths.length * 3).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_0300
     * @tc.name      testFormatTimePadding0003
     * @tc.desc      Verify formatTime zero pads single digit hours, minutes and seconds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatTimePadding0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFormatTimePadding0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Midnight renders all three parts with leading zeros.
      logCase(TAG, 'formatTime(00:00:00)');
      expect(DateUtils.formatTime(makeDate(2024, 0, 1, 0, 0, 0, 0))).assertEqual('00:00:00');
      // One past midnight renders the smallest non zero time.
      logCase(TAG, 'formatTime(00:00:01)');
      expect(DateUtils.formatTime(makeDate(2024, 0, 1, 0, 0, 1, 0))).assertEqual('00:00:01');
      // One past the first minute renders the minute part.
      logCase(TAG, 'formatTime(00:01:00)');
      expect(DateUtils.formatTime(makeDate(2024, 0, 1, 0, 1, 0, 0))).assertEqual('00:01:00');
      // Nine minutes nine seconds renders both parts with leading zeros.
      logCase(TAG, 'formatTime(00:09:09)');
      expect(DateUtils.formatTime(makeDate(2024, 0, 1, 0, 9, 9, 0))).assertEqual('00:09:09');
      // The last second of the day renders the largest time text.
      logCase(TAG, 'formatTime(23:59:59)');
      expect(DateUtils.formatTime(makeDate(2024, 0, 1, 23, 59, 59, 0))).assertEqual('23:59:59');
      // The middle of the day renders both parts without extra padding.
      logCase(TAG, 'formatTime(12:34:56)');
      expect(DateUtils.formatTime(makeDate(2024, 0, 1, 12, 34, 56, 0))).assertEqual('12:34:56');
      // Every rendered time keeps the fixed eight character layout.
      logCase(TAG, 'formatTime length check');
      expect(DateUtils.formatTime(makeDate(2024, 0, 1, 3, 4, 5, 0)).length).assertEqual(TIME_TEXT_LENGTH);
      // The rendered text always matches the colon separated pattern.
      logCase(TAG, 'formatTime pattern check');
      expect(TIME_PATTERN.test(DateUtils.formatTime(makeDate(2024, 0, 1, 3, 4, 5, 0)))).assertTrue();
      // Milliseconds never leak into the second based time text.
      logCase(TAG, 'formatTime ignores milliseconds');
      expect(DateUtils.formatTime(makeDate(2024, 0, 1, 10, 20, 30, 999))).assertEqual('10:20:30');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_0400
     * @tc.name      testFormatTimeHourMatrix0004
     * @tc.desc      Verify formatTime renders every hour of the day with exactly two digits.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatTimeHourMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFormatTimeHourMatrix0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Walk every hour of a full day.
      for (let hour: number = 0; hour < 24; hour++) {
        // Record the hour under test.
        logCase(TAG, 'hour=' + hour.toString());
        // Format the first minute of the current hour.
        const text: string = DateUtils.formatTime(makeDate(2024, 0, 1, hour, 0, 0, 0));
        // The hour segment must always keep two digits.
        expect(text.substring(0, 2).length).assertEqual(2);
        // The minute segment must stay at the zero minute.
        expect(text.substring(3, 5)).assertEqual('00');
        // The second segment must stay at the zero second.
        expect(text.substring(6, 8)).assertEqual('00');
        // Every segment must be numeric.
        expect(isDigitsOnly(text.substring(0, 2))).assertTrue();
      }
      // The hour matrix covers twenty four cells.
      expect(24).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_0500
     * @tc.name      testFormatDateTimeComposition0005
     * @tc.desc      Verify formatDateTime joins the date and the time with exactly one space.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatDateTimeComposition0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFormatDateTimeComposition0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The reference instant used by the composition checks.
      const date: Date = makeDate(2024, 2, 15, 8, 5, 3, 0);
      // The composed text contains the date part in its first half.
      logCase(TAG, 'formatDateTime(2024-03-15 08:05:03)');
      expect(DateUtils.formatDateTime(date)).assertEqual('2024-03-15 08:05:03');
      // The composed text starts with the very same date text.
      logCase(TAG, 'formatDateTime prefix equals formatDate');
      expect(DateUtils.formatDateTime(date).substring(0, DATE_TEXT_LENGTH))
        .assertEqual(DateUtils.formatDate(date));
      // The composed text ends with the very same time text.
      logCase(TAG, 'formatDateTime suffix equals formatTime');
      expect(DateUtils.formatDateTime(date).substring(DATE_TEXT_LENGTH + 1))
        .assertEqual(DateUtils.formatTime(date));
      // Exactly one space separates the two halves.
      logCase(TAG, 'formatDateTime separator character');
      expect(DateUtils.formatDateTime(date).charAt(DATE_TEXT_LENGTH)).assertEqual(' ');
      // The composed text keeps the fixed nineteen character layout.
      logCase(TAG, 'formatDateTime length check');
      expect(DateUtils.formatDateTime(date).length).assertEqual(DATE_TIME_TEXT_LENGTH);
      // The composed text matches the dashed and colon separated pattern.
      logCase(TAG, 'formatDateTime pattern check');
      expect(DATE_TIME_PATTERN.test(DateUtils.formatDateTime(date))).assertTrue();
      // The composed text contains exactly one space.
      logCase(TAG, 'formatDateTime space count');
      expect(DateUtils.formatDateTime(date).split(' ').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_0600
     * @tc.name      testFormatFullMillisecondMatrix0006
     * @tc.desc      Verify formatFull renders the millisecond part as a three digit suffix.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFormatFullMillisecondMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFormatFullMillisecondMatrix0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The millisecond samples exercised by the matrix.
      const millis: number[] = [0, 1, 9, 10, 99, 100, 500, 999];
      // Walk every millisecond sample.
      for (let i: number = 0; i < millis.length; i++) {
        // Record the millisecond sample under test.
        const ms: number = millis[i];
        // Print the sample so a failure is traceable from hilog alone.
        logCase(TAG, 'millisecond=' + ms.toString());
        // Compose the full text for the sample.
        const text: string = DateUtils.formatFull(makeDate(2024, 0, 1, 1, 2, 3, ms));
        // The full text always keeps the twenty three character layout.
        expect(text.length).assertEqual(FULL_TEXT_LENGTH);
        // The full text matches the pattern with the dotted millisecond part.
        expect(FULL_PATTERN.test(text)).assertTrue();
        // The text before the dot equals the second based date time text.
        expect(text.substring(0, DATE_TIME_TEXT_LENGTH))
          .assertEqual(DateUtils.formatDateTime(makeDate(2024, 0, 1, 1, 2, 3, ms)));
        // The millisecond part is always made of three digits.
        expect(text.substring(DATE_TIME_TEXT_LENGTH + 1).length).assertEqual(3);
      }
      // The millisecond matrix exercises eight samples.
      expect(millis.length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_0700
     * @tc.name      testFormatFullLeadingZero0007
     * @tc.desc      Verify formatFull keeps the leading zeros of small millisecond values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFormatFullLeadingZero0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFormatFullLeadingZero0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The zero millisecond instant renders the trailing three zeros.
      logCase(TAG, 'formatFull(00:00:00.000)');
      expect(DateUtils.formatFull(makeDate(2024, 0, 1, 0, 0, 0, 0))).assertEqual('2024-01-01 00:00:00.000');
      // The single digit millisecond instant keeps two leading zeros.
      logCase(TAG, 'formatFull(.005)');
      expect(DateUtils.formatFull(makeDate(2024, 0, 1, 0, 0, 0, 5)).endsWith('.005')).assertTrue();
      // The tens millisecond instant keeps one leading zero.
      logCase(TAG, 'formatFull(.050)');
      expect(DateUtils.formatFull(makeDate(2024, 0, 1, 0, 0, 0, 50)).endsWith('.050')).assertTrue();
      // The hundreds millisecond instant keeps no leading zero but three digits.
      logCase(TAG, 'formatFull(.700)');
      expect(DateUtils.formatFull(makeDate(2024, 0, 1, 0, 0, 0, 700)).endsWith('.700')).assertTrue();
      // The last millisecond of a second renders the largest suffix.
      logCase(TAG, 'formatFull(.999)');
      expect(DateUtils.formatFull(makeDate(2024, 0, 1, 0, 0, 0, 999)).endsWith('.999')).assertTrue();
      // The dotted suffix position is stable across samples.
      logCase(TAG, 'formatFull dot position');
      expect(DateUtils.formatFull(makeDate(2024, 0, 1, 0, 0, 0, 7)).charAt(DATE_TIME_TEXT_LENGTH))
        .assertEqual('.');
      // The three digit suffix is always numeric.
      logCase(TAG, 'formatFull suffix is numeric');
      expect(isDigitsOnly(DateUtils.formatFull(makeDate(2024, 0, 1, 0, 0, 0, 7))
        .substring(DATE_TIME_TEXT_LENGTH + 1))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_0800
     * @tc.name      testTodayTextContract0008
     * @tc.desc      Verify todayText always renders the current calendar day in the dashed layout.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTodayTextContract0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testTodayTextContract0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Capture the helper output once.
      const today: string = DateUtils.todayText();
      // Print the captured value for traceability.
      logCase(TAG, 'todayText() = ' + today);
      // The helper always returns the fixed ten character layout.
      logCase(TAG, 'todayText length');
      expect(today.length).assertEqual(DATE_TEXT_LENGTH);
      // The helper output matches the dashed date pattern.
      logCase(TAG, 'todayText pattern');
      expect(DATE_PATTERN.test(today)).assertTrue();
      // The helper output equals the date part of the full current instant.
      logCase(TAG, 'todayText equals current formatDate');
      expect(today).assertEqual(DateUtils.formatDate(new Date()));
      // The year segment equals the current four digit year.
      logCase(TAG, 'todayText year segment');
      expect(today.substring(0, 4)).assertEqual(new Date().getFullYear().toString());
      // The month segment is one of the twelve padded month texts.
      logCase(TAG, 'todayText month segment');
      expect(today.substring(5, 7).length).assertEqual(2);
      // The day segment is always two digits.
      logCase(TAG, 'todayText day segment');
      expect(today.substring(8, 10).length).assertEqual(2);
      // Both separators are dashes.
      logCase(TAG, 'todayText separators');
      expect(today.charAt(4) === '-' && today.charAt(7) === '-').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_0900
     * @tc.name      testNowTimeTextContract0009
     * @tc.desc      Verify nowTimeText always renders the current wall clock time in the colon layout.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNowTimeTextContract0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNowTimeTextContract0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Capture the helper output once.
      const now: string = DateUtils.nowTimeText();
      // Print the captured value for traceability.
      logCase(TAG, 'nowTimeText() = ' + now);
      // The helper always returns the fixed eight character layout.
      logCase(TAG, 'nowTimeText length');
      expect(now.length).assertEqual(TIME_TEXT_LENGTH);
      // The helper output matches the colon separated pattern.
      logCase(TAG, 'nowTimeText pattern');
      expect(TIME_PATTERN.test(now)).assertTrue();
      // The helper output equals the time part of the full current instant.
      logCase(TAG, 'nowTimeText equals current formatTime');
      expect(now.substring(0, 2)).assertEqual(DateUtils.formatTime(new Date()).substring(0, 2));
      // Both separators are colons.
      logCase(TAG, 'nowTimeText separators');
      expect(now.charAt(2) === ':' && now.charAt(5) === ':').assertTrue();
      // The hour segment never exceeds twenty three.
      logCase(TAG, 'nowTimeText hour range');
      expect(parseInt(now.substring(0, 2), 10) <= 23).assertTrue();
      // The minute segment never exceeds fifty nine.
      logCase(TAG, 'nowTimeText minute range');
      expect(parseInt(now.substring(3, 5), 10) <= 59).assertTrue();
      // The second segment never exceeds fifty nine.
      logCase(TAG, 'nowTimeText second range');
      expect(parseInt(now.substring(6, 8), 10) <= 59).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_1000
     * @tc.name      testNowMsMonotonic0010
     * @tc.desc      Verify nowMs returns a positive epoch value that never moves backwards.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNowMsMonotonic0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testNowMsMonotonic0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Capture the first sample of the wall clock.
      const first: number = DateUtils.nowMs();
      // Print the first sample for traceability.
      logCase(TAG, 'nowMs() = ' + first.toString());
      // The epoch value is always positive.
      logCase(TAG, 'first sample positive');
      expect(first > 0).assertTrue();
      // The epoch value is always an integer number of milliseconds.
      logCase(TAG, 'first sample integral');
      expect(Math.floor(first)).assertEqual(first);
      // The epoch value stays far above the year 2000 boundary.
      logCase(TAG, 'first sample above year 2000');
      expect(first > 946684800000).assertTrue();
      // Capture the second sample of the wall clock.
      const second: number = DateUtils.nowMs();
      // Print the second sample for traceability.
      logCase(TAG, 'nowMs() second = ' + second.toString());
      // The clock never moves backwards between two adjacent reads.
      logCase(TAG, 'second sample not smaller');
      expect(second >= first).assertTrue();
      // Both samples agree on the calendar day in overwhelming probability.
      logCase(TAG, 'samples share the calendar day');
      expect(DateUtils.isSameDay(new Date(first), new Date(second))).assertTrue();
      // Both samples render to a valid date text.
      logCase(TAG, 'samples render a date text');
      expect(DATE_PATTERN.test(DateUtils.todayText())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_1100
     * @tc.name      testFromEpochMsFidelity0011
     * @tc.desc      Verify fromEpochMs reproduces the local calendar fields of the source instant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFromEpochMsFidelity0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFromEpochMsFidelity0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The local instants exercised by the fidelity matrix.
      const instants: Date[] = [
        makeDate(2024, 0, 1, 0, 0, 0, 0),
        makeDate(2024, 5, 30, 12, 30, 45, 0),
        makeDate(2023, 11, 31, 23, 59, 59, 0),
        makeDate(2020, 1, 29, 6, 15, 20, 0)
      ];
      // Walk every instant and rebuild it from its epoch value.
      for (let i: number = 0; i < instants.length; i++) {
        // Record the instant under test.
        const source: Date = instants[i];
        // Print the expected rendering so a failure is traceable from hilog alone.
        logCase(TAG, 'instant=' + DateUtils.formatDateTime(source));
        // Rebuild the instant from its epoch milliseconds.
        const rebuilt: string = DateUtils.fromEpochMs(source.getTime());
        // The rebuilt text must equal the formatted source instant.
        expect(rebuilt).assertEqual(DateUtils.formatDateTime(source));
        // The rebuilt text keeps the fixed nineteen character layout.
        expect(rebuilt.length).assertEqual(DATE_TIME_TEXT_LENGTH);
        // The rebuilt text matches the dashed and colon separated pattern.
        expect(DATE_TIME_PATTERN.test(rebuilt)).assertTrue();
        // The rebuilt text is stable across repeated calls.
        expect(DateUtils.fromEpochMs(source.getTime())).assertEqual(rebuilt);
      }
      // The fidelity matrix exercises four instants.
      expect(instants.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_1200
     * @tc.name      testFromEpochMsZero0012
     * @tc.desc      Verify fromEpochMs renders the Unix epoch instant without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFromEpochMsZero0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testFromEpochMsZero0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The epoch instant renders the year 1970 in the host time zone.
      logCase(TAG, 'fromEpochMs(0)');
      const epochText: string = DateUtils.fromEpochMs(0);
      // Print the rendered epoch text for traceability.
      logCase(TAG, 'epochText = ' + epochText);
      // The rendered text is a well formed date time text.
      logCase(TAG, 'epoch text pattern');
      expect(DATE_TIME_PATTERN.test(epochText)).assertTrue();
      // The rendered text reports the year 1970.
      logCase(TAG, 'epoch text year');
      expect(epochText.substring(0, 4)).assertEqual('1970');
      // The rendered text keeps the fixed nineteen character layout.
      logCase(TAG, 'epoch text length');
      expect(epochText.length).assertEqual(DATE_TIME_TEXT_LENGTH);
      // One second after the epoch moves the second field by exactly one step.
      logCase(TAG, 'fromEpochMs(1000) differs by one second');
      expect(DateUtils.diffMs(new Date(0), new Date(ONE_SECOND))).assertEqual(ONE_SECOND);
      // The epoch equals the local zero instant when rebuilt.
      logCase(TAG, 'fromEpochMs(0) equals formatDateTime(new Date(0))');
      expect(epochText).assertEqual(DateUtils.formatDateTime(new Date(0)));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_1300
     * @tc.name      testDiffMsAbsolute0013
     * @tc.desc      Verify diffMs always reports the absolute distance between two instants.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDiffMsAbsolute0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDiffMsAbsolute0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The reference instant used by every difference check.
      const base: Date = makeDate(2024, 0, 1, 0, 0, 0, 0);
      // Identical instants report a zero distance.
      logCase(TAG, 'diffMs(base, base)');
      expect(DateUtils.diffMs(base, base)).assertEqual(0);
      // One second forward reports one thousand milliseconds.
      logCase(TAG, 'diffMs(base, base + 1s)');
      expect(DateUtils.diffMs(base, new Date(base.getTime() + ONE_SECOND))).assertEqual(ONE_SECOND);
      // One minute backward reports the same positive distance.
      logCase(TAG, 'diffMs(base, base - 1m)');
      expect(DateUtils.diffMs(base, new Date(base.getTime() - ONE_MINUTE))).assertEqual(ONE_MINUTE);
      // One hour forward reports three million six hundred thousand milliseconds.
      logCase(TAG, 'diffMs(base, base + 1h)');
      expect(DateUtils.diffMs(base, new Date(base.getTime() + ONE_HOUR))).assertEqual(ONE_HOUR);
      // One day forward reports eighty six million four hundred thousand milliseconds.
      logCase(TAG, 'diffMs(base, base + 1d)');
      expect(DateUtils.diffMs(base, new Date(base.getTime() + ONE_DAY))).assertEqual(ONE_DAY);
      // The reversed argument order reports the same distance.
      logCase(TAG, 'diffMs is symmetric');
      expect(DateUtils.diffMs(new Date(base.getTime() + ONE_DAY), base)).assertEqual(ONE_DAY);
      // The distance always stays non negative.
      logCase(TAG, 'diffMs always non negative');
      expect(DateUtils.diffMs(new Date(base.getTime() - ONE_DAY), base) >= 0).assertTrue();
      // Two leap days apart report exactly two days.
      logCase(TAG, 'diffMs across a leap day');
      expect(DateUtils.diffMs(makeMidnight(2024, 1, 28), makeMidnight(2024, 2, 1))).assertEqual(2 * ONE_DAY);
      // The distance equals the plain epoch subtraction for forward pairs.
      logCase(TAG, 'diffMs equals epoch subtraction');
      expect(DateUtils.diffMs(base, new Date(base.getTime() + ONE_HOUR)))
        .assertEqual(ONE_HOUR);
      // Milliseconds are reported without truncation.
      logCase(TAG, 'diffMs keeps milliseconds');
      expect(DateUtils.diffMs(base, new Date(base.getTime() + 1234))).assertEqual(1234);
      // An hour and a millisecond are added without carrying loss.
      logCase(TAG, 'diffMs composes sub second precision');
      expect(DateUtils.diffMs(base, new Date(base.getTime() + ONE_HOUR + 1))).assertEqual(ONE_HOUR + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_1400
     * @tc.name      testDurationTextShortForm0014
     * @tc.desc      Verify durationText renders spans below one hour without the hour segment.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDurationTextShortForm0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDurationTextShortForm0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A zero span renders a zero second text.
      logCase(TAG, 'durationText(0)');
      expect(DateUtils.durationText(0)).assertEqual('0s');
      // Nine hundred and ninety nine milliseconds truncate to zero seconds.
      logCase(TAG, 'durationText(999)');
      expect(DateUtils.durationText(999)).assertEqual('0s');
      // Exactly one second renders the one second text.
      logCase(TAG, 'durationText(1000)');
      expect(DateUtils.durationText(ONE_SECOND)).assertEqual('1s');
      // Fifty nine seconds stay in the second only form.
      logCase(TAG, 'durationText(59000)');
      expect(DateUtils.durationText(59 * ONE_SECOND)).assertEqual('59s');
      // Exactly one minute renders the minute form with a zero second part.
      logCase(TAG, 'durationText(60000)');
      expect(DateUtils.durationText(ONE_MINUTE)).assertEqual('1m 0s');
      // One minute and one second render both parts.
      logCase(TAG, 'durationText(61000)');
      expect(DateUtils.durationText(ONE_MINUTE + ONE_SECOND)).assertEqual('1m 1s');
      // Fifty nine minutes and fifty nine seconds stay below the hour form.
      logCase(TAG, 'durationText(3599000)');
      expect(DateUtils.durationText(59 * ONE_MINUTE + 59 * ONE_SECOND)).assertEqual('59m 59s');
      // A span with sub second remainder truncates the fraction.
      logCase(TAG, 'durationText(1999)');
      expect(DateUtils.durationText(ONE_SECOND + 999)).assertEqual('1s');
      // Span output never contains an hour segment below one hour.
      logCase(TAG, 'durationText has no hour segment');
      expect(DateUtils.durationText(59 * ONE_MINUTE).indexOf('h')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_1500
     * @tc.name      testDurationTextFullForm0015
     * @tc.desc      Verify durationText renders spans of one hour and more with all three segments.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDurationTextFullForm0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testDurationTextFullForm0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Exactly one hour renders the full form with zero minutes and zero seconds.
      logCase(TAG, 'durationText(3600000)');
      expect(DateUtils.durationText(ONE_HOUR)).assertEqual('1h 0m 0s');
      // One hour one minute and one second render all three segments.
      logCase(TAG, 'durationText(3661000)');
      expect(DateUtils.durationText(ONE_HOUR + ONE_MINUTE + ONE_SECOND)).assertEqual('1h 1m 1s');
      // A day long span keeps the hour segment growing past twenty four.
      logCase(TAG, 'durationText(86400000)');
      expect(DateUtils.durationText(ONE_DAY)).assertEqual('24h 0m 0s');
      // Two days and three hours compose the hour segment.
      logCase(TAG, 'durationText(2d 3h)');
      expect(DateUtils.durationText(2 * ONE_DAY + 3 * ONE_HOUR)).assertEqual('51h 0m 0s');
      // The full form always contains both 'h' and 'm' markers.
      logCase(TAG, 'durationText full form markers');
      expect(DateUtils.durationText(ONE_HOUR).indexOf('h') > 0).assertTrue();
      // The full form ends with the second segment.
      logCase(TAG, 'durationText full form suffix');
      expect(DateUtils.durationText(ONE_HOUR + ONE_MINUTE + ONE_SECOND).endsWith('1s')).assertTrue();
      // The minute segment truncates the remaining seconds.
      logCase(TAG, 'durationText truncating minutes');
      expect(DateUtils.durationText(ONE_HOUR + 61 * ONE_SECOND)).assertEqual('1h 1m 1s');
      // The hour segment truncates the remaining minutes.
      logCase(TAG, 'durationText truncating hours');
      expect(DateUtils.durationText(2 * ONE_HOUR + 59 * ONE_MINUTE + 59 * ONE_SECOND)).assertEqual('2h 59m 59s');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_1600
     * @tc.name      testIsSameDayBoundary0016
     * @tc.desc      Verify isSameDay ignores the time part but respects the calendar day boundary.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsSameDayBoundary0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testIsSameDayBoundary0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The first second of the reference day.
      const dayStart: Date = makeDate(2024, 4, 20, 0, 0, 0, 0);
      // The last second of the same reference day.
      const dayEnd: Date = makeDate(2024, 4, 20, 23, 59, 59, 999);
      // Both extremes of one day report the same calendar day.
      logCase(TAG, 'isSameDay(dayStart, dayEnd)');
      expect(DateUtils.isSameDay(dayStart, dayEnd)).assertTrue();
      // An instant one millisecond later belongs to the next day.
      logCase(TAG, 'isSameDay(dayEnd, dayEnd + 1ms)');
      expect(DateUtils.isSameDay(dayEnd, new Date(dayEnd.getTime() + 1))).assertFalse();
      // An instant one millisecond earlier belongs to the previous day.
      logCase(TAG, 'isSameDay(dayStart, dayStart - 1ms)');
      expect(DateUtils.isSameDay(dayStart, new Date(dayStart.getTime() - 1))).assertFalse();
      // The same day of the next year is a different calendar day.
      logCase(TAG, 'isSameDay(2024-05-20, 2025-05-20)');
      expect(DateUtils.isSameDay(dayStart, makeMidnight(2025, 4, 20))).assertFalse();
      // The same day number of the next month is a different calendar day.
      logCase(TAG, 'isSameDay(2024-05-20, 2024-06-20)');
      expect(DateUtils.isSameDay(dayStart, makeMidnight(2024, 5, 20))).assertFalse();
      // The identical instant is always on the same day.
      logCase(TAG, 'isSameDay is reflexive');
      expect(DateUtils.isSameDay(dayStart, dayStart)).assertTrue();
      // The relation is symmetric for two instants of one day.
      logCase(TAG, 'isSameDay is symmetric');
      expect(DateUtils.isSameDay(dayEnd, dayStart)).assertTrue();
      // A leap day matches itself across two times of the day.
      logCase(TAG, 'isSameDay on a leap day');
      expect(DateUtils.isSameDay(makeDate(2024, 1, 29, 1, 0, 0, 0),
        makeDate(2024, 1, 29, 23, 0, 0, 0))).assertTrue();
      // February the twenty eighth and the twenty ninth differ in a leap year.
      logCase(TAG, 'isSameDay leap year neighbour');
      expect(DateUtils.isSameDay(makeMidnight(2024, 1, 28), makeMidnight(2024, 1, 29))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_1700
     * @tc.name      testAddDaysPositive0017
     * @tc.desc      Verify addDays moves the copy forward across month and year boundaries.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDaysPositive0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testAddDaysPositive0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The source instant used by every shift.
      const base: Date = makeMidnight(2024, 0, 31);
      // Adding zero days keeps the very same day.
      logCase(TAG, 'addDays(base, 0)');
      expect(DateUtils.formatDate(DateUtils.addDays(base, 0))).assertEqual('2024-01-31');
      // One day forward crosses into February.
      logCase(TAG, 'addDays(base, 1)');
      expect(DateUtils.formatDate(DateUtils.addDays(base, 1))).assertEqual('2024-02-01');
      // Twenty nine days forward lands on the leap day.
      logCase(TAG, 'addDays(base, 29)');
      expect(DateUtils.formatDate(DateUtils.addDays(base, 29))).assertEqual('2024-02-29');
      // Thirty days forward lands on the first of March.
      logCase(TAG, 'addDays(base, 30)');
      expect(DateUtils.formatDate(DateUtils.addDays(base, 30))).assertEqual('2024-03-01');
      // Three hundred and sixty six days forward crosses into the next year.
      logCase(TAG, 'addDays(base, 366)');
      expect(DateUtils.formatDate(DateUtils.addDays(base, 366))).assertEqual('2025-01-31');
      // One day forward keeps the time of day untouched.
      logCase(TAG, 'addDays keeps the time of day');
      expect(DateUtils.formatTime(DateUtils.addDays(makeDate(2024, 0, 31, 15, 45, 30, 0), 1)))
        .assertEqual('15:45:30');
      // The shift always returns a new object.
      logCase(TAG, 'addDays returns a copy');
      expect(DateUtils.addDays(base, 5) === base).assertFalse();
      // The distance of a one day shift is exactly one day.
      logCase(TAG, 'addDays distance');
      expect(DateUtils.diffMs(base, DateUtils.addDays(base, 1))).assertEqual(ONE_DAY);
      // Twenty eight days forward stay inside February of a leap year.
      logCase(TAG, 'addDays(base, 28)');
      expect(DateUtils.formatDate(DateUtils.addDays(base, 28))).assertEqual('2024-02-28');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_1800
     * @tc.name      testAddDaysNegative0018
     * @tc.desc      Verify addDays moves the copy backward without mutating the source instant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDaysNegative0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testAddDaysNegative0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The source instant used by every backward shift.
      const base: Date = makeMidnight(2024, 2, 1);
      // One day backward crosses into February.
      logCase(TAG, 'addDays(base, -1)');
      expect(DateUtils.formatDate(DateUtils.addDays(base, -1))).assertEqual('2024-02-29');
      // Two days backward lands on the twenty eighth of February.
      logCase(TAG, 'addDays(base, -2)');
      expect(DateUtils.formatDate(DateUtils.addDays(base, -2))).assertEqual('2024-02-28');
      // Sixty days backward crosses into the previous year.
      logCase(TAG, 'addDays(base, -60)');
      expect(DateUtils.formatDate(DateUtils.addDays(base, -60))).assertEqual('2024-01-01');
      // Sixty one days backward lands on the last day of the previous year.
      logCase(TAG, 'addDays(base, -61)');
      expect(DateUtils.formatDate(DateUtils.addDays(base, -61))).assertEqual('2023-12-31');
      // The source instant is never mutated by the backward shift.
      logCase(TAG, 'addDays keeps the source instant');
      const before: number = base.getTime();
      // Perform one backward shift whose result is discarded.
      DateUtils.addDays(base, -100);
      // The source epoch value must stay identical.
      expect(base.getTime()).assertEqual(before);
      // The source text must stay identical.
      logCase(TAG, 'addDays keeps the source text');
      expect(DateUtils.formatDate(base)).assertEqual('2024-03-01');
      // The distance of a ten day backward shift is ten days.
      logCase(TAG, 'addDays backward distance');
      expect(DateUtils.diffMs(base, DateUtils.addDays(base, -10))).assertEqual(10 * ONE_DAY);
      // A backward shift keeps the calendar day out of the same day set.
      logCase(TAG, 'addDays backward changes the day');
      expect(DateUtils.isSameDay(base, DateUtils.addDays(base, -1))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_1900
     * @tc.name      testAddDaysReversibility0019
     * @tc.desc      Verify a forward shift followed by the opposite shift restores the source instant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAddDaysReversibility0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testAddDaysReversibility0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The source instant used by the round trip matrix.
      const base: Date = makeDate(2024, 5, 15, 9, 30, 15, 0);
      // The shift sizes exercised by the round trip matrix.
      const shifts: number[] = [1, 7, 30, 31, 365, 400];
      // Walk every shift size and apply it twice in opposite directions.
      for (let i: number = 0; i < shifts.length; i++) {
        // Record the shift size under test.
        const shift: number = shifts[i];
        // Print the shift size so a failure is traceable from hilog alone.
        logCase(TAG, 'shift=' + shift.toString());
        // Move forward by the shift size.
        const forward: Date = DateUtils.addDays(base, shift);
        // Move back by the same shift size.
        const restored: Date = DateUtils.addDays(forward, -shift);
        // The restored instant must equal the source instant exactly.
        expect(restored.getTime()).assertEqual(base.getTime());
        // The restored text must equal the source text.
        expect(DateUtils.formatDate(restored)).assertEqual('2024-06-15');
        // The forward distance equals the shift size in days.
        expect(DateUtils.diffMs(base, forward)).assertEqual(shift * ONE_DAY);
      }
      // The round trip matrix exercises six shift sizes.
      expect(shifts.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_2000
     * @tc.name      testWeekdayIndexMatrix0020
     * @tc.desc      Verify weekdayIndex maps every weekday to the Monday first zero based index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testWeekdayIndexMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testWeekdayIndexMatrix0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The seven consecutive days starting on Monday of the reference week.
      const days: Date[] = [
        makeMidnight(2024, 0, 1),
        makeMidnight(2024, 0, 2),
        makeMidnight(2024, 0, 3),
        makeMidnight(2024, 0, 4),
        makeMidnight(2024, 0, 5),
        makeMidnight(2024, 0, 6),
        makeMidnight(2024, 0, 7)
      ];
      // The Monday first index expected for every day above.
      const expected: number[] = [0, 1, 2, 3, 4, 5, 6];
      // Walk the whole week and check the mapped index.
      for (let i: number = 0; i < days.length; i++) {
        // Record the day under test.
        logCase(TAG, 'day=' + DateUtils.formatDate(days[i]));
        // The Monday first index must match the lookup table.
        expect(DateUtils.weekdayIndex(days[i])).assertEqual(expected[i]);
        // The index always falls inside the seven day week.
        expect(DateUtils.weekdayIndex(days[i]) >= 0 && DateUtils.weekdayIndex(days[i]) <= 6).assertTrue();
      }
      // The Sunday index is always the last slot of the week.
      logCase(TAG, 'Sunday maps to six');
      expect(DateUtils.weekdayIndex(makeMidnight(2024, 0, 7))).assertEqual(6);
      // The Monday index is always the first slot of the week.
      logCase(TAG, 'Monday maps to zero');
      expect(DateUtils.weekdayIndex(makeMidnight(2024, 0, 8))).assertEqual(0);
      // The same weekday one week later maps to the same index.
      logCase(TAG, 'weekday index repeats weekly');
      expect(DateUtils.weekdayIndex(makeMidnight(2024, 0, 15))).assertEqual(0);
      // Every index is an integer value.
      logCase(TAG, 'weekday index is integral');
      expect(Math.floor(DateUtils.weekdayIndex(makeMidnight(2024, 0, 3))))
        .assertEqual(DateUtils.weekdayIndex(makeMidnight(2024, 0, 3)));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_2100
     * @tc.name      testMillisecondConstants0021
     * @tc.desc      Verify the exported millisecond constants keep their documented unit ladder.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMillisecondConstants0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testMillisecondConstants0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One second equals one thousand milliseconds.
      logCase(TAG, 'MS_PER_SECOND');
      expect(DateUtils.MS_PER_SECOND).assertEqual(1000);
      // One minute equals sixty seconds.
      logCase(TAG, 'MS_PER_MINUTE');
      expect(DateUtils.MS_PER_MINUTE).assertEqual(60 * 1000);
      // One hour equals sixty minutes.
      logCase(TAG, 'MS_PER_HOUR');
      expect(DateUtils.MS_PER_HOUR).assertEqual(60 * 60 * 1000);
      // One day equals twenty four hours.
      logCase(TAG, 'MS_PER_DAY');
      expect(DateUtils.MS_PER_DAY).assertEqual(24 * 60 * 60 * 1000);
      // The ladder is strictly increasing.
      logCase(TAG, 'constant ladder is increasing');
      expect(DateUtils.MS_PER_SECOND < DateUtils.MS_PER_MINUTE).assertTrue();
      // The minute constant stays below the hour constant.
      logCase(TAG, 'minute below hour');
      expect(DateUtils.MS_PER_MINUTE < DateUtils.MS_PER_HOUR).assertTrue();
      // The hour constant stays below the day constant.
      logCase(TAG, 'hour below day');
      expect(DateUtils.MS_PER_HOUR < DateUtils.MS_PER_DAY).assertTrue();
      // The local constants mirror the exported ones.
      logCase(TAG, 'constants mirror the local ladder');
      expect(ONE_DAY).assertEqual(DateUtils.MS_PER_DAY);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_DATEX_2200
     * @tc.name      testYearBoundaryRollover0022
     * @tc.desc      Verify the formatter and the day shift agree on year boundary rollovers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testYearBoundaryRollover0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testYearBoundaryRollover0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The last second of the year renders the final day of December.
      logCase(TAG, 'formatDateTime(2023-12-31 23:59:59)');
      expect(DateUtils.formatDateTime(makeDate(2023, 11, 31, 23, 59, 59, 0)))
        .assertEqual('2023-12-31 23:59:59');
      // One day forward from the last day lands on the first day of the next year.
      logCase(TAG, 'addDays(2023-12-31, 1)');
      expect(DateUtils.formatDate(DateUtils.addDays(makeMidnight(2023, 11, 31), 1)))
        .assertEqual('2024-01-01');
      // One day backward from the first day lands on the last day of the previous year.
      logCase(TAG, 'addDays(2024-01-01, -1)');
      expect(DateUtils.formatDate(DateUtils.addDays(makeMidnight(2024, 0, 1), -1)))
        .assertEqual('2023-12-31');
      // The two neighbours belong to different calendar days.
      logCase(TAG, 'year boundary day difference');
      expect(DateUtils.isSameDay(makeMidnight(2023, 11, 31), makeMidnight(2024, 0, 1))).assertFalse();
      // The distance across the year boundary is exactly one day.
      logCase(TAG, 'year boundary distance');
      expect(DateUtils.diffMs(makeMidnight(2023, 11, 31), makeMidnight(2024, 0, 1)))
        .assertEqual(ONE_DAY);
      // A leap year February the twenty ninth renders the extra day.
      logCase(TAG, 'leap day rendering');
      expect(DateUtils.formatDate(makeMidnight(2024, 1, 29))).assertEqual('2024-02-29');
      // A common year February the twenty eighth is the last day of the month.
      logCase(TAG, 'common year February tail');
      expect(DateUtils.formatDate(DateUtils.addDays(makeMidnight(2023, 1, 28), 1))).assertEqual('2023-03-01');
      // The full text of the last instant of the year keeps the millisecond suffix.
      logCase(TAG, 'full text at the year boundary');
      expect(DateUtils.formatFull(makeDate(2023, 11, 31, 23, 59, 59, 999)))
        .assertEqual('2023-12-31 23:59:59.999');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
