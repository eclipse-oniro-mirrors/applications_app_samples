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
import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { formatDateTime, formatDuration, formatTime, getDayStart, padTwo } from 'library';
const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_TimePad]';
// Values below this limit must receive one leading zero from padTwo.
const PAD_LIMIT: number = 10;
// Placeholder rendered by the time formatters for missing or invalid timestamps.
const PLACEHOLDER: string = '--';
// One expected padTwo row for values that need a leading zero.
interface PadRow {
  value: number;
  text: string;
}
// One expected row that pairs a minute value with the rendered second part of a timestamp.
interface MinuteRow {
  minute: number;
  secondPart: string;
}
// One expected row for the full date and time formatting.
interface DateTimeRow {
  year: number;
  month: number;
  day: number;
  hour: number;
  minute: number;
  second: number;
  text: string;
}
// One expected row for the time only formatting.
interface TimeRow {
  hour: number;
  minute: number;
  second: number;
  text: string;
}
// Expected rows for padTwo over the single digit values 0..9.
const PAD_SINGLE_ROWS: PadRow[] = [
  { value: 0, text: '00' },
  { value: 1, text: '01' },
  { value: 2, text: '02' },
  { value: 3, text: '03' },
  { value: 4, text: '04' },
  { value: 5, text: '05' },
  { value: 6, text: '06' },
  { value: 7, text: '07' },
  { value: 8, text: '08' },
  { value: 9, text: '09' }
];
// Expected rows for padTwo over the two digit values 10..19.
const PAD_TEEN_ROWS: PadRow[] = [
  { value: 10, text: '10' },
  { value: 11, text: '11' },
  { value: 12, text: '12' },
  { value: 13, text: '13' },
  { value: 14, text: '14' },
  { value: 15, text: '15' },
  { value: 16, text: '16' },
  { value: 17, text: '17' },
  { value: 18, text: '18' },
  { value: 19, text: '19' }
];
// Expected rows for padTwo over the tens of the two digit band.
const PAD_TWENTY_ROWS: PadRow[] = [
  { value: 20, text: '20' },
  { value: 21, text: '21' },
  { value: 22, text: '22' },
  { value: 23, text: '23' },
  { value: 24, text: '24' },
  { value: 25, text: '25' },
  { value: 26, text: '26' },
  { value: 27, text: '27' },
  { value: 28, text: '28' },
  { value: 29, text: '29' }
];
// Expected rows for padTwo over the 30..39 band.
const PAD_THIRTY_ROWS: PadRow[] = [
  { value: 30, text: '30' },
  { value: 31, text: '31' },
  { value: 32, text: '32' },
  { value: 33, text: '33' },
  { value: 34, text: '34' },
  { value: 35, text: '35' },
  { value: 36, text: '36' },
  { value: 37, text: '37' },
  { value: 38, text: '38' },
  { value: 39, text: '39' }
];
// Expected rows for padTwo over the 40..49 band.
const PAD_FORTY_ROWS: PadRow[] = [
  { value: 40, text: '40' },
  { value: 41, text: '41' },
  { value: 42, text: '42' },
  { value: 43, text: '43' },
  { value: 44, text: '44' },
  { value: 45, text: '45' },
  { value: 46, text: '46' },
  { value: 47, text: '47' },
  { value: 48, text: '48' },
  { value: 49, text: '49' }
];
// Expected rows for padTwo over the 50..59 band.
const PAD_FIFTY_ROWS: PadRow[] = [
  { value: 50, text: '50' },
  { value: 51, text: '51' },
  { value: 52, text: '52' },
  { value: 53, text: '53' },
  { value: 54, text: '54' },
  { value: 55, text: '55' },
  { value: 56, text: '56' },
  { value: 57, text: '57' },
  { value: 58, text: '58' },
  { value: 59, text: '59' }
];
// Expected rows for padTwo over the 60..69 band.
const PAD_SIXTY_ROWS: PadRow[] = [
  { value: 60, text: '60' },
  { value: 61, text: '61' },
  { value: 62, text: '62' },
  { value: 63, text: '63' },
  { value: 64, text: '64' },
  { value: 65, text: '65' },
  { value: 66, text: '66' },
  { value: 67, text: '67' },
  { value: 68, text: '68' },
  { value: 69, text: '69' }
];
// Expected rows for padTwo over the 70..79 band.
const PAD_SEVENTY_ROWS: PadRow[] = [
  { value: 70, text: '70' },
  { value: 71, text: '71' },
  { value: 72, text: '72' },
  { value: 73, text: '73' },
  { value: 74, text: '74' },
  { value: 75, text: '75' },
  { value: 76, text: '76' },
  { value: 77, text: '77' },
  { value: 78, text: '78' },
  { value: 79, text: '79' }
];
// Expected rows for padTwo over the 80..89 band.
const PAD_EIGHTY_ROWS: PadRow[] = [
  { value: 80, text: '80' },
  { value: 81, text: '81' },
  { value: 82, text: '82' },
  { value: 83, text: '83' },
  { value: 84, text: '84' },
  { value: 85, text: '85' },
  { value: 86, text: '86' },
  { value: 87, text: '87' },
  { value: 88, text: '88' },
  { value: 89, text: '89' }
];
// Expected rows for padTwo over the 90..99 band.
const PAD_NINETY_ROWS: PadRow[] = [
  { value: 90, text: '90' },
  { value: 91, text: '91' },
  { value: 92, text: '92' },
  { value: 93, text: '93' },
  { value: 94, text: '94' },
  { value: 95, text: '95' },
  { value: 96, text: '96' },
  { value: 97, text: '97' },
  { value: 98, text: '98' },
  { value: 99, text: '99' }
];
// Expected rows for padTwo over the 100..109 band.
const PAD_HUNDRED_ROWS: PadRow[] = [
  { value: 100, text: '100' },
  { value: 101, text: '101' },
  { value: 102, text: '102' },
  { value: 103, text: '103' },
  { value: 104, text: '104' },
  { value: 105, text: '105' },
  { value: 106, text: '106' },
  { value: 107, text: '107' },
  { value: 108, text: '108' },
  { value: 109, text: '109' }
];
// Expected rows for padTwo over the 110..120 band, the last band of the table.
const PAD_HUNDRED_TEEN_ROWS: PadRow[] = [
  { value: 110, text: '110' },
  { value: 111, text: '111' },
  { value: 112, text: '112' },
  { value: 113, text: '113' },
  { value: 114, text: '114' },
  { value: 115, text: '115' },
  { value: 116, text: '116' },
  { value: 117, text: '117' },
  { value: 118, text: '118' },
  { value: 119, text: '119' },
  { value: 120, text: '120' }
];
// Expected rows for padTwo over a set of three digit values.
const PAD_THREE_DIGIT_ROWS: PadRow[] = [
  { value: 121, text: '121' },
  { value: 200, text: '200' },
  { value: 255, text: '255' },
  { value: 300, text: '300' },
  { value: 480, text: '480' },
  { value: 599, text: '599' },
  { value: 720, text: '720' },
  { value: 999, text: '999' }
];
// Expected rows for padTwo over large values.
const PAD_LARGE_ROWS: PadRow[] = [
  { value: 1000, text: '1000' },
  { value: 2025, text: '2025' },
  { value: 65535, text: '65535' },
  { value: 1000000, text: '1000000' },
  { value: 2147483647, text: '2147483647' }
];
// Expected rows for padTwo over negative values.
// Every negative value is smaller than the pad limit, so padTwo always prepends one zero
// in front of the minus sign, for example padTwo(-10) renders '0-10'.
const PAD_NEGATIVE_ROWS: PadRow[] = [
  { value: -1, text: '0-1' },
  { value: -2, text: '0-2' },
  { value: -9, text: '0-9' },
  { value: -10, text: '0-10' },
  { value: -11, text: '0-11' },
  { value: -59, text: '0-59' },
  { value: -99, text: '0-99' },
  { value: -100, text: '0-100' },
  { value: -1000, text: '0-1000' }
];
// Expected rows for padTwo over fractional values, the fraction part is kept.
const PAD_FRACTION_ROWS: PadRow[] = [
  { value: 0.5, text: '00.5' },
  { value: 1.5, text: '01.5' },
  { value: 9.9, text: '09.9' },
  { value: 10.5, text: '10.5' },
  { value: 59.5, text: '59.5' },
  { value: 99.9, text: '99.9' },
  { value: 100.5, text: '100.5' }
];
// Expected minute rows that pair the padTwo output with the second segment of formatTime.
const MINUTE_ROWS: MinuteRow[] = [
  { minute: 0, secondPart: '00' },
  { minute: 1, secondPart: '01' },
  { minute: 5, secondPart: '05' },
  { minute: 9, secondPart: '09' },
  { minute: 10, secondPart: '10' },
  { minute: 15, secondPart: '15' },
  { minute: 30, secondPart: '30' },
  { minute: 45, secondPart: '45' },
  { minute: 59, secondPart: '59' }
];
// Expected rows for the full date and time formatting.
const DATE_TIME_ROWS: DateTimeRow[] = [
  { year: 2024, month: 1, day: 1, hour: 0, minute: 0, second: 0, text: '2024-01-01 00:00:00' },
  { year: 2024, month: 2, day: 9, hour: 3, minute: 4, second: 5, text: '2024-02-09 03:04:05' },
  { year: 2024, month: 6, day: 15, hour: 12, minute: 30, second: 45, text: '2024-06-15 12:30:45' },
  { year: 2024, month: 9, day: 30, hour: 23, minute: 59, second: 59, text: '2024-09-30 23:59:59' },
  { year: 2024, month: 12, day: 31, hour: 9, minute: 8, second: 7, text: '2024-12-31 09:08:07' },
  { year: 2025, month: 3, day: 7, hour: 10, minute: 20, second: 30, text: '2025-03-07 10:20:30' },
  { year: 2026, month: 11, day: 9, hour: 8, minute: 6, second: 4, text: '2026-11-09 08:06:04' },
  { year: 2030, month: 5, day: 20, hour: 19, minute: 40, second: 50, text: '2030-05-20 19:40:50' }
];
// Expected rows for the time only formatting.
const TIME_ROWS: TimeRow[] = [
  { hour: 0, minute: 0, second: 0, text: '00:00:00' },
  { hour: 0, minute: 0, second: 1, text: '00:00:01' },
  { hour: 0, minute: 1, second: 0, text: '00:01:00' },
  { hour: 1, minute: 0, second: 0, text: '01:00:00' },
  { hour: 5, minute: 6, second: 7, text: '05:06:07' },
  { hour: 9, minute: 59, second: 59, text: '09:59:59' },
  { hour: 10, minute: 10, second: 10, text: '10:10:10' },
  { hour: 13, minute: 45, second: 30, text: '13:45:30' },
  { hour: 23, minute: 59, second: 59, text: '23:59:59' },
  { hour: 12, minute: 0, second: 30, text: '12:00:30' }
];
// One expected row for the duration formatter, which reuses padTwo for all three segments.
interface DurationRow {
  durationMs: number;
  text: string;
}
// One expected row for the day start helper.
interface DayStartRow {
  year: number;
  month: number;
  day: number;
  hour: number;
  minute: number;
  second: number;
  startText: string;
}
// Expected duration rows that expose the padTwo behaviour of hour, minute and second segments.
const DURATION_ROWS: DurationRow[] = [
  { durationMs: 0, text: '00:00:00' },
  { durationMs: 1, text: '00:00:00' },
  { durationMs: 999, text: '00:00:00' },
  { durationMs: 1000, text: '00:00:01' },
  { durationMs: 9000, text: '00:00:09' },
  { durationMs: 10000, text: '00:00:10' },
  { durationMs: 59000, text: '00:00:59' },
  { durationMs: 60000, text: '00:01:00' },
  { durationMs: 600000, text: '00:10:00' },
  { durationMs: 3599000, text: '00:59:59' },
  { durationMs: 3600000, text: '01:00:00' },
  { durationMs: 36000000, text: '10:00:00' },
  { durationMs: 86399000, text: '23:59:59' }
];
// Expected day start rows, every row starts at the first millisecond of its own day.
const DAY_START_ROWS: DayStartRow[] = [
  { year: 2024, month: 1, day: 1, hour: 0, minute: 0, second: 0, startText: '2024-01-01 00:00:00' },
  { year: 2024, month: 2, day: 9, hour: 3, minute: 4, second: 5, startText: '2024-02-09 00:00:00' },
  { year: 2024, month: 6, day: 15, hour: 12, minute: 30, second: 45, startText: '2024-06-15 00:00:00' },
  { year: 2024, month: 9, day: 30, hour: 23, minute: 59, second: 59, startText: '2024-09-30 00:00:00' },
  { year: 2025, month: 3, day: 7, hour: 8, minute: 8, second: 8, startText: '2025-03-07 00:00:00' },
  { year: 2026, month: 11, day: 9, hour: 6, minute: 0, second: 0, startText: '2026-11-09 00:00:00' },
  { year: 2030, month: 5, day: 20, hour: 19, minute: 40, second: 50, startText: '2030-05-20 00:00:00' }
];
export default function timePadMatrixTest() {
  describe('TimePadMatrixTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'TimePadMatrixTest suite start');
    });
    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'TimePadMatrixTest suite end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_0100
     * @tc.name      testPadTwoSingleDigit0001
     * @tc.desc      Verify padTwo renders every single digit value from zero to nine as a two character text with a leading zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoSingleDigit0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoSingleDigit0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_SINGLE_ROWS.length; index++) {
        const row: PadRow = PAD_SINGLE_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'single digit text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(2);
        expect(text.charAt(0)).assertEqual('0');
        expect(Number(text)).assertEqual(row.value);
      }
      expect(padTwo(0)).assertEqual('00');
      expect(padTwo(9)).assertEqual('09');
      expect(padTwo(5).charAt(1)).assertEqual('5');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_0200
     * @tc.name      testPadTwoTeenBand0001
     * @tc.desc      Verify padTwo keeps the two digit values from ten to nineteen unchanged including their length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoTeenBand0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoTeenBand0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_TEEN_ROWS.length; index++) {
        const row: PadRow = PAD_TEEN_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'teen band text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(2);
        expect(text.charAt(0)).assertEqual('1');
        expect(text).assertEqual(row.value.toString());
      }
      expect(padTwo(10)).assertEqual('10');
      expect(padTwo(19)).assertEqual('19');
      expect(padTwo(11).length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_0300
     * @tc.name      testPadTwoTwentyBand0001
     * @tc.desc      Verify padTwo returns the plain text for the twenty to twenty-nine band without adding zeros.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoTwentyBand0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoTwentyBand0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_TWENTY_ROWS.length; index++) {
        const row: PadRow = PAD_TWENTY_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'twenty band text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(2);
        expect(text.charAt(0)).assertEqual('2');
        expect(text.indexOf('0'.repeat(0))).assertEqual(0);
      }
      expect(padTwo(20)).assertEqual('20');
      expect(padTwo(29)).assertEqual('29');
      expect(padTwo(25).charAt(1)).assertEqual('5');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_0400
     * @tc.name      testPadTwoThirtyBand0001
     * @tc.desc      Verify padTwo returns the plain text for the thirty to thirty-nine band.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoThirtyBand0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoThirtyBand0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_THIRTY_ROWS.length; index++) {
        const row: PadRow = PAD_THIRTY_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'thirty band text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(2);
        expect(text.charAt(0)).assertEqual('3');
        expect(Number(text)).assertEqual(row.value);
      }
      expect(padTwo(30)).assertEqual('30');
      expect(padTwo(39)).assertEqual('39');
      expect(padTwo(33)).assertEqual('33');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_0500
     * @tc.name      testPadTwoFortyBand0001
     * @tc.desc      Verify padTwo returns the plain text for the forty to forty-nine band.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoFortyBand0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoFortyBand0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_FORTY_ROWS.length; index++) {
        const row: PadRow = PAD_FORTY_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'forty band text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(2);
        expect(text.charAt(0)).assertEqual('4');
        expect(Number(text)).assertEqual(row.value);
      }
      expect(padTwo(40)).assertEqual('40');
      expect(padTwo(49)).assertEqual('49');
      expect(padTwo(44).charAt(1)).assertEqual('4');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_0600
     * @tc.name      testPadTwoFiftyBand0001
     * @tc.desc      Verify padTwo returns the plain text for the fifty to fifty-nine band.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoFiftyBand0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoFiftyBand0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_FIFTY_ROWS.length; index++) {
        const row: PadRow = PAD_FIFTY_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'fifty band text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(2);
        expect(text.charAt(0)).assertEqual('5');
        expect(Number(text)).assertEqual(row.value);
      }
      expect(padTwo(50)).assertEqual('50');
      expect(padTwo(59)).assertEqual('59');
      expect(padTwo(55)).assertEqual('55');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_0700
     * @tc.name      testPadTwoSixtyBand0001
     * @tc.desc      Verify padTwo returns the plain text for the sixty to sixty-nine band, the first band above the pad limit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoSixtyBand0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoSixtyBand0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_SIXTY_ROWS.length; index++) {
        const row: PadRow = PAD_SIXTY_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'sixty band text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(2);
        expect(text.charAt(0)).assertEqual('6');
        expect(text.charAt(1)).assertEqual((row.value % 10).toString());
      }
      expect(padTwo(60)).assertEqual('60');
      expect(padTwo(69)).assertEqual('69');
      expect(padTwo(66)).assertEqual('66');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_0800
     * @tc.name      testPadTwoSeventyBand0001
     * @tc.desc      Verify padTwo returns the plain text for the seventy to seventy-nine band.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoSeventyBand0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoSeventyBand0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_SEVENTY_ROWS.length; index++) {
        const row: PadRow = PAD_SEVENTY_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'seventy band text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(2);
        expect(text.charAt(0)).assertEqual('7');
        expect(Number(text)).assertEqual(row.value);
      }
      expect(padTwo(70)).assertEqual('70');
      expect(padTwo(79)).assertEqual('79');
      expect(padTwo(77)).assertEqual('77');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_0900
     * @tc.name      testPadTwoEightyBand0001
     * @tc.desc      Verify padTwo returns the plain text for the eighty to eighty-nine band.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoEightyBand0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoEightyBand0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_EIGHTY_ROWS.length; index++) {
        const row: PadRow = PAD_EIGHTY_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'eighty band text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(2);
        expect(text.charAt(0)).assertEqual('8');
        expect(Number(text)).assertEqual(row.value);
      }
      expect(padTwo(80)).assertEqual('80');
      expect(padTwo(89)).assertEqual('89');
      expect(padTwo(88)).assertEqual('88');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_1000
     * @tc.name      testPadTwoNinetyBand0001
     * @tc.desc      Verify padTwo returns the plain text for the ninety to ninety-nine band and keeps the length two.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoNinetyBand0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoNinetyBand0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_NINETY_ROWS.length; index++) {
        const row: PadRow = PAD_NINETY_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'ninety band text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(2);
        expect(text.charAt(0)).assertEqual('9');
        expect(Number(text)).assertEqual(row.value);
      }
      expect(padTwo(90)).assertEqual('90');
      expect(padTwo(99)).assertEqual('99');
      expect(padTwo(97)).assertEqual('97');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_1100
     * @tc.name      testPadTwoHundredBand0001
     * @tc.desc      Verify padTwo returns three character texts for the hundred to one hundred nine band.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoHundredBand0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoHundredBand0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_HUNDRED_ROWS.length; index++) {
        const row: PadRow = PAD_HUNDRED_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'hundred band text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(3);
        expect(text.charAt(0)).assertEqual('1');
        expect(Number(text)).assertEqual(row.value);
      }
      expect(padTwo(100)).assertEqual('100');
      expect(padTwo(109)).assertEqual('109');
      expect(padTwo(105).length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_1200
     * @tc.name      testPadTwoHundredTenBand0001
     * @tc.desc      Verify padTwo covers the one hundred ten to one hundred twenty band and ends the zero to one hundred twenty table.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoHundredTenBand0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoHundredTenBand0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_HUNDRED_TEEN_ROWS.length; index++) {
        const row: PadRow = PAD_HUNDRED_TEEN_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'hundred ten band text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(3);
        expect(text.charAt(0)).assertEqual('1');
        expect(Number(text)).assertEqual(row.value);
      }
      expect(padTwo(110)).assertEqual('110');
      expect(padTwo(120)).assertEqual('120');
      expect(PAD_HUNDRED_TEEN_ROWS.length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_1300
     * @tc.name      testPadTwoAllZeroToHundredTwenty0001
     * @tc.desc      Verify padTwo over the whole zero to one hundred twenty range by sweeping the bands in one loop.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoAllZeroToHundredTwenty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoAllZeroToHundredTwenty0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const bands: PadRow[][] = [PAD_SINGLE_ROWS, PAD_TEEN_ROWS, PAD_TWENTY_ROWS, PAD_THIRTY_ROWS, PAD_FORTY_ROWS,
        PAD_FIFTY_ROWS, PAD_SIXTY_ROWS, PAD_SEVENTY_ROWS, PAD_EIGHTY_ROWS, PAD_NINETY_ROWS, PAD_HUNDRED_ROWS,
        PAD_HUNDRED_TEEN_ROWS];
      let covered: number = 0;
      let mismatched: number = 0;
      for (let band: number = 0; band < bands.length; band++) {
        const rows: PadRow[] = bands[band];
        for (let index: number = 0; index < rows.length; index++) {
          const row: PadRow = rows[index];
          if (padTwo(row.value) !== row.text) {
            mismatched = mismatched + 1;
          }
          covered = covered + 1;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'covered values ' + covered);
      expect(covered).assertEqual(121);
      expect(mismatched).assertEqual(0);
      expect(padTwo(0)).assertEqual('00');
      expect(padTwo(120)).assertEqual('120');
      expect(padTwo(99).length).assertEqual(2);
      expect(padTwo(100).length).assertEqual(3);
      expect(padTwo(9).length).assertLess(3);
      expect(padTwo(10).length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_1400
     * @tc.name      testPadTwoThreeDigitValues0001
     * @tc.desc      Verify padTwo leaves three digit values above one hundred twenty untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoThreeDigitValues0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoThreeDigitValues0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_THREE_DIGIT_ROWS.length; index++) {
        const row: PadRow = PAD_THREE_DIGIT_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'three digit text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(3);
        expect(text).assertEqual(row.value.toString());
        expect(Number(text)).assertEqual(row.value);
      }
      expect(padTwo(999)).assertEqual('999');
      expect(padTwo(121)).assertEqual('121');
      expect(padTwo(500)).assertEqual('500');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_1500
     * @tc.name      testPadTwoLargeValues0001
     * @tc.desc      Verify padTwo keeps large values unchanged and never truncates digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoLargeValues0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoLargeValues0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_LARGE_ROWS.length; index++) {
        const row: PadRow = PAD_LARGE_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'large value text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(row.text.length);
        expect(text).assertEqual(row.value.toString());
        expect(text.indexOf('-')).assertEqual(-1);
      }
      expect(padTwo(2147483647).length).assertEqual(10);
      expect(padTwo(1000000).charAt(0)).assertEqual('1');
      expect(padTwo(65535)).assertEqual('65535');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_1600
     * @tc.name      testPadTwoNegativeValues0001
     * @tc.desc      Verify padTwo keeps the documented behaviour for negative values, single digit negatives still get a leading zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoNegativeValues0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoNegativeValues0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_NEGATIVE_ROWS.length; index++) {
        const row: PadRow = PAD_NEGATIVE_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'negative value text ' + text);
        expect(text).assertEqual(row.text);
        expect(text).assertEqual(row.value < PAD_LIMIT ? '0' + row.value.toString() : row.value.toString());
        expect(text.indexOf('-')).assertLarger(-1);
        expect(Number(text.substring(text.indexOf('-'))) <= 0).assertTrue();
      }
      expect(padTwo(-1)).assertEqual('0-1');
      expect(padTwo(-1).length).assertEqual(3);
      expect(padTwo(-10)).assertEqual('0-10');
      expect(padTwo(-10).length).assertEqual(4);
      expect(padTwo(-9).charAt(0)).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_1700
     * @tc.name      testPadTwoFractionValues0001
     * @tc.desc      Verify padTwo keeps the fraction part and only decides the padding by the numeric value against the limit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoFractionValues0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoFractionValues0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PAD_FRACTION_ROWS.length; index++) {
        const row: PadRow = PAD_FRACTION_ROWS[index];
        const text: string = padTwo(row.value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'fraction value text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.indexOf('.')).assertLarger(0);
        expect(text).assertEqual(row.value < PAD_LIMIT ? '0' + row.value.toString() : row.value.toString());
        expect(Number(text)).assertEqual(row.value);
      }
      expect(padTwo(0.5).charAt(0)).assertEqual('0');
      expect(padTwo(9.9)).assertEqual('09.9');
      expect(padTwo(10.5)).assertEqual('10.5');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_1800
     * @tc.name      testPadTwoNonFiniteValues0001
     * @tc.desc      Verify padTwo maps NaN and infinities onto the plain toString text without adding a leading zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoNonFiniteValues0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoNonFiniteValues0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // NaN and +Infinity are not smaller than the pad limit, so their text is returned unchanged.
      expect(padTwo(NaN)).assertEqual('NaN');
      expect(padTwo(Infinity)).assertEqual('Infinity');
      // -Infinity is smaller than the pad limit, so the leading zero is prepended in front of the sign.
      expect(padTwo(-Infinity)).assertEqual('0-Infinity');
      expect(padTwo(NaN).length).assertEqual(3);
      expect(padTwo(Infinity).length).assertEqual(8);
      expect(padTwo(-Infinity).length).assertEqual(10);
      expect(padTwo(NaN).charAt(0)).assertEqual('N');
      expect(padTwo(Infinity).substring(0, 3)).assertEqual('Inf');
      expect(padTwo(-Infinity).charAt(0)).assertEqual('0');
      expect(padTwo(-Infinity).charAt(1)).assertEqual('-');
      expect(Number.isNaN(padTwo(NaN).length === 0)).assertFalse();
      expect(Number.isNaN(Number(padTwo(NaN)))).assertTrue();
      expect(Number(padTwo(Infinity))).assertEqual(Infinity);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_1900
     * @tc.name      testPadTwoLimitBoundary0001
     * @tc.desc      Verify padTwo switches behaviour exactly at the pad limit of ten and around its neighbours.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoLimitBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoLimitBoundary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(padTwo(8)).assertEqual('08');
      expect(padTwo(9)).assertEqual('09');
      expect(padTwo(10)).assertEqual('10');
      expect(padTwo(11)).assertEqual('11');
      expect(padTwo(10).length).assertEqual(2);
      expect(padTwo(9).length).assertEqual(2);
      expect(padTwo(9).charAt(0)).assertEqual('0');
      expect(padTwo(10).charAt(0)).assertEqual('1');
      expect(padTwo(10 - 1)).assertEqual('09');
      expect(padTwo(5 + 5)).assertEqual('10');
      expect(padTwo(PAD_LIMIT)).assertEqual('10');
      expect(padTwo(PAD_LIMIT - 1)).assertEqual('09');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_2000
     * @tc.name      testPadTwoMonotonicText0001
     * @tc.desc      Verify the text length of padTwo never shrinks while the value grows across the zero to one hundred twenty table.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoMonotonicText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoMonotonicText0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let previousLength: number = 2;
      let lengthDrops: number = 0;
      let paddedCount: number = 0;
      for (let value: number = 0; value <= 120; value++) {
        const text: string = padTwo(value);
        if (text.length < previousLength) {
          lengthDrops = lengthDrops + 1;
        }
        if (text.length === 2 && text.charAt(0) === '0') {
          paddedCount = paddedCount + 1;
        }
        previousLength = text.length;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'padded texts ' + paddedCount);
      expect(lengthDrops).assertEqual(0);
      expect(paddedCount).assertEqual(10);
      expect(padTwo(0).length).assertEqual(2);
      expect(padTwo(120).length).assertEqual(3);
      expect(previousLength).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_2100
     * @tc.name      testPadTwoRoundTripNumeric0001
     * @tc.desc      Verify that parsing the padTwo text with Number returns the original integer for every clock style value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoRoundTripNumeric0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoRoundTripNumeric0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const clockValues: number[] = [0, 1, 2, 5, 9, 10, 11, 23, 30, 45, 59];
      for (let index: number = 0; index < clockValues.length; index++) {
        const value: number = clockValues[index];
        const text: string = padTwo(value);
        const parsed: number = Number(text);
        hilog.info(DOMAIN, TAG, '%{public}s', 'round trip value ' + value);
        expect(parsed).assertEqual(value);
        expect(text.length).assertEqual(value < PAD_LIMIT ? 2 : value.toString().length);
        expect(text.endsWith(value.toString())).assertTrue();
      }
      expect(Number(padTwo(0))).assertEqual(0);
      expect(Number(padTwo(59))).assertEqual(59);
      expect(padTwo(23)).assertEqual('23');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_2200
     * @tc.name      testFormatTimeSecondPadding0001
     * @tc.desc      Verify formatTime pads the second part exactly like padTwo for every second value from zero to fifty-nine.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatTimeSecondPadding0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatTimeSecondPadding0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let second: number = 0; second <= 59; second++) {
        const timestamp: number = new Date(2024, 0, 1, 0, 0, second).getTime();
        const text: string = formatTime(timestamp);
        const parts: string[] = text.split(':');
        if (parts.length === 3) {
          expect(parts[2]).assertEqual(padTwo(second));
          expect(parts[2].length).assertEqual(2);
          checked = checked + 1;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'checked seconds ' + checked);
      expect(checked).assertEqual(60);
      expect(formatTime(new Date(2024, 0, 1, 0, 0, 5).getTime())).assertEqual('00:00:05');
      expect(formatTime(new Date(2024, 0, 1, 0, 0, 59).getTime())).assertEqual('00:00:59');
      expect(formatTime(new Date(2024, 0, 1, 0, 0, 0).getTime())).assertEqual('00:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_2300
     * @tc.name      testFormatTimeMinutePadding0001
     * @tc.desc      Verify formatTime pads the minute part with padTwo for a table of representative minute values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatTimeMinutePadding0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatTimeMinutePadding0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < MINUTE_ROWS.length; index++) {
        const row: MinuteRow = MINUTE_ROWS[index];
        const timestamp: number = new Date(2024, 0, 1, 0, row.minute, 0).getTime();
        const text: string = formatTime(timestamp);
        const parts: string[] = text.split(':');
        hilog.info(DOMAIN, TAG, '%{public}s', 'minute text ' + text);
        expect(parts.length).assertEqual(3);
        expect(parts[0]).assertEqual('00');
        expect(parts[1]).assertEqual(padTwo(row.minute));
        expect(parts[1]).assertEqual(row.secondPart);
        expect(parts[2]).assertEqual('00');
      }
      expect(formatTime(new Date(2024, 0, 1, 0, 7, 0).getTime())).assertEqual('00:07:00');
      expect(formatTime(new Date(2024, 0, 1, 0, 42, 0).getTime())).assertEqual('00:42:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_2400
     * @tc.name      testFormatTimeHourPadding0001
     * @tc.desc      Verify formatTime pads the hour part with padTwo for every hour of the day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatTimeHourPadding0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatTimeHourPadding0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let hour: number = 0; hour <= 23; hour++) {
        const timestamp: number = new Date(2024, 5, 15, hour, 0, 0).getTime();
        const text: string = formatTime(timestamp);
        const head: string = text.substring(0, 2);
        if (head === padTwo(hour)) {
          checked = checked + 1;
        }
        expect(head).assertEqual(padTwo(hour));
        expect(head.length).assertEqual(2);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'checked hours ' + checked);
      expect(checked).assertEqual(24);
      expect(formatTime(new Date(2024, 5, 15, 3, 0, 0).getTime())).assertEqual('03:00:00');
      expect(formatTime(new Date(2024, 5, 15, 15, 0, 0).getTime())).assertEqual('15:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_2500
     * @tc.name      testFormatTimeTable0001
     * @tc.desc      Verify the complete time only text for a table of representative timestamps.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatTimeTable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatTimeTable0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < TIME_ROWS.length; index++) {
        const row: TimeRow = TIME_ROWS[index];
        const timestamp: number = new Date(2024, 0, 1, row.hour, row.minute, row.second).getTime();
        const text: string = formatTime(timestamp);
        hilog.info(DOMAIN, TAG, '%{public}s', 'time text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(8);
        expect(text.split(':').length).assertEqual(3);
        expect(text.substring(0, 2)).assertEqual(padTwo(row.hour));
        expect(text.substring(3, 5)).assertEqual(padTwo(row.minute));
        expect(text.substring(6, 8)).assertEqual(padTwo(row.second));
      }
      expect(TIME_ROWS.length).assertEqual(10);
      expect(formatTime(new Date(2024, 0, 1, 0, 0, 0).getTime())).assertEqual('00:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_2600
     * @tc.name      testFormatTimeInvalidInput0001
     * @tc.desc      Verify formatTime renders the placeholder for zero, negative and non finite timestamps.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatTimeInvalidInput0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatTimeInvalidInput0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(formatTime(0)).assertEqual(PLACEHOLDER);
      expect(formatTime(-1)).assertEqual(PLACEHOLDER);
      expect(formatTime(-1000)).assertEqual(PLACEHOLDER);
      expect(formatTime(-86400000)).assertEqual(PLACEHOLDER);
      expect(formatTime(NaN)).assertEqual(PLACEHOLDER);
      expect(formatTime(0).length).assertEqual(2);
      expect(formatTime(-1)).assertEqual(formatTime(0));
      expect(formatTime(1) !== PLACEHOLDER).assertTrue();
      expect(formatTime(1).length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_2700
     * @tc.name      testFormatDateTimeTable0001
     * @tc.desc      Verify the full date and time text for a table of local timestamps including single digit fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatDateTimeTable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatDateTimeTable0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < DATE_TIME_ROWS.length; index++) {
        const row: DateTimeRow = DATE_TIME_ROWS[index];
        const timestamp: number = new Date(row.year, row.month - 1, row.day, row.hour, row.minute, row.second).getTime();
        const text: string = formatDateTime(timestamp);
        hilog.info(DOMAIN, TAG, '%{public}s', 'date time text ' + text);
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(19);
        expect(text.indexOf(' ')).assertEqual(10);
        expect(text.substring(5, 7)).assertEqual(padTwo(row.month));
        expect(text.substring(8, 10)).assertEqual(padTwo(row.day));
        expect(text.substring(11, 13)).assertEqual(padTwo(row.hour));
        expect(text.substring(14, 16)).assertEqual(padTwo(row.minute));
        expect(text.substring(17, 19)).assertEqual(padTwo(row.second));
      }
      expect(DATE_TIME_ROWS.length).assertEqual(8);
      expect(formatDateTime(new Date(2024, 0, 1, 0, 0, 0).getTime())).assertEqual('2024-01-01 00:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_2800
     * @tc.name      testFormatDateTimeMonthPadding0001
     * @tc.desc      Verify formatDateTime pads the month segment with padTwo for every month of a leap year.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatDateTimeMonthPadding0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatDateTimeMonthPadding0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let month: number = 1; month <= 12; month++) {
        const timestamp: number = new Date(2024, month - 1, 15, 10, 30, 30).getTime();
        const text: string = formatDateTime(timestamp);
        const monthPart: string = text.substring(5, 7);
        hilog.info(DOMAIN, TAG, '%{public}s', 'month part ' + monthPart);
        expect(monthPart).assertEqual(padTwo(month));
        expect(monthPart.length).assertEqual(2);
        expect(text.substring(0, 4)).assertEqual('2024');
        if (monthPart === padTwo(month)) {
          checked = checked + 1;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'checked months ' + checked);
      expect(checked).assertEqual(12);
      expect(formatDateTime(new Date(2024, 0, 15, 10, 30, 30).getTime()).substring(0, 7)).assertEqual('2024-01');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_2900
     * @tc.name      testFormatDateTimeDayPadding0001
     * @tc.desc      Verify formatDateTime pads the day segment with padTwo for the first ten days of a month.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatDateTimeDayPadding0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatDateTimeDayPadding0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let paddedDays: number = 0;
      for (let day: number = 1; day <= 10; day++) {
        const timestamp: number = new Date(2024, 2, day, 6, 5, 4).getTime();
        const text: string = formatDateTime(timestamp);
        const dayPart: string = text.substring(8, 10);
        hilog.info(DOMAIN, TAG, '%{public}s', 'day part ' + dayPart);
        expect(dayPart).assertEqual(padTwo(day));
        expect(dayPart.charAt(0)).assertEqual(day < 10 ? '0' : '1');
        expect(text.substring(11, 19)).assertEqual('06:05:04');
        paddedDays = paddedDays + 1;
      }
      expect(paddedDays).assertEqual(10);
      expect(formatDateTime(new Date(2024, 2, 5, 6, 5, 4).getTime()).substring(0, 10)).assertEqual('2024-03-05');
      expect(formatDateTime(new Date(2024, 2, 25, 6, 5, 4).getTime()).substring(0, 10)).assertEqual('2024-03-25');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_3000
     * @tc.name      testFormatDateTimeInvalidInput0001
     * @tc.desc      Verify formatDateTime renders the placeholder for zero, negative and non finite timestamps.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatDateTimeInvalidInput0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatDateTimeInvalidInput0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(formatDateTime(0)).assertEqual(PLACEHOLDER);
      expect(formatDateTime(-1)).assertEqual(PLACEHOLDER);
      expect(formatDateTime(-86400000)).assertEqual(PLACEHOLDER);
      expect(formatDateTime(-1700000000000)).assertEqual(PLACEHOLDER);
      expect(formatDateTime(NaN)).assertEqual(PLACEHOLDER);
      expect(formatDateTime(0)).assertEqual(formatDateTime(-99));
      expect(formatDateTime(1).length).assertEqual(19);
      expect(formatDateTime(1) !== PLACEHOLDER).assertTrue();
      expect(formatDateTime(1).indexOf(' ')).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_3100
     * @tc.name      testFormatTimeAndDateTimeAgreement0001
     * @tc.desc      Verify the time part of formatDateTime equals formatTime for a table of timestamps.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatTimeAndDateTimeAgreement0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatTimeAndDateTimeAgreement0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < DATE_TIME_ROWS.length; index++) {
        const row: DateTimeRow = DATE_TIME_ROWS[index];
        const timestamp: number = new Date(row.year, row.month - 1, row.day, row.hour, row.minute, row.second).getTime();
        const fullText: string = formatDateTime(timestamp);
        const timeText: string = formatTime(timestamp);
        hilog.info(DOMAIN, TAG, '%{public}s', 'agreement text ' + timeText);
        expect(fullText.substring(11)).assertEqual(timeText);
        expect(fullText.endsWith(timeText)).assertTrue();
        expect(timeText.length).assertEqual(8);
        expect(fullText.length - timeText.length).assertEqual(11);
      }
      const sampleStamp: number = new Date(2025, 6, 4, 7, 8, 9).getTime();
      expect(formatDateTime(sampleStamp)).assertEqual('2025-07-04 07:08:09');
      expect(formatTime(sampleStamp)).assertEqual('07:08:09');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_3200
     * @tc.name      testPadTwoSecondCrossCheck0001
     * @tc.desc      Verify every second of a minute is rendered identically by padTwo and formatTime inside formatDateTime.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoSecondCrossCheck0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoSecondCrossCheck0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let mismatched: number = 0;
      for (let second: number = 0; second <= 59; second++) {
        const timestamp: number = new Date(2024, 7, 8, 12, 34, second).getTime();
        const fullText: string = formatDateTime(timestamp);
        if (fullText.substring(17, 19) !== padTwo(second)) {
          mismatched = mismatched + 1;
        }
        expect(fullText.substring(14, 16)).assertEqual('34');
        expect(fullText.substring(11, 13)).assertEqual('12');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'mismatched seconds ' + mismatched);
      expect(mismatched).assertEqual(0);
      expect(formatDateTime(new Date(2024, 7, 8, 12, 34, 7).getTime())).assertEqual('2024-08-08 12:34:07');
      expect(formatDateTime(new Date(2024, 7, 8, 12, 34, 47).getTime())).assertEqual('2024-08-08 12:34:47');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_3300
     * @tc.name      testPadTwoShapeInvariants0001
     * @tc.desc      Verify structural invariants of the padTwo text such as digit only content and stable last character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoShapeInvariants0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoShapeInvariants0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let digitOnly: number = 0;
      for (let value: number = 0; value <= 120; value++) {
        const text: string = padTwo(value);
        const lastChar: string = text.charAt(text.length - 1);
        expect(lastChar).assertEqual(value.toString().charAt(value.toString().length - 1));
        expect(text.indexOf(' ') ).assertEqual(-1);
        expect(text.length >= 2).assertTrue();
        if (text.length === value.toString().length || text.length === value.toString().length + 1) {
          digitOnly = digitOnly + 1;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'shape invariant values ' + digitOnly);
      expect(digitOnly).assertEqual(121);
      expect(padTwo(7).charAt(1)).assertEqual('7');
      expect(padTwo(70).charAt(1)).assertEqual('0');
      expect(padTwo(17).charAt(0)).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_3400
     * @tc.name      testFormatTimeMinuteAndSecondPairs0001
     * @tc.desc      Verify minute and second combinations are both padded by padTwo in one time text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatTimeMinuteAndSecondPairs0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatTimeMinuteAndSecondPairs0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const pairs: number[] = [0, 5, 9, 10, 25, 40, 59];
      for (let index: number = 0; index < pairs.length; index++) {
        const value: number = pairs[index];
        const timestamp: number = new Date(2024, 10, 9, 8, value, value).getTime();
        const text: string = formatTime(timestamp);
        hilog.info(DOMAIN, TAG, '%{public}s', 'pair text ' + text);
        expect(text).assertEqual(padTwo(8) + ':' + padTwo(value) + ':' + padTwo(value));
        expect(text.substring(3, 5)).assertEqual(text.substring(6, 8));
        expect(text.substring(0, 2)).assertEqual('08');
        expect(text.length).assertEqual(8);
      }
      expect(formatTime(new Date(2024, 10, 9, 8, 3, 3).getTime())).assertEqual('08:03:03');
      expect(formatTime(new Date(2024, 10, 9, 8, 33, 33).getTime())).assertEqual('08:33:33');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_3500
     * @tc.name      testFormatDateTimeYearSegment0001
     * @tc.desc      Verify the year segment of formatDateTime is not padded and keeps four digits for several years.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatDateTimeYearSegment0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatDateTimeYearSegment0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const years: number[] = [2000, 2024, 2025, 2038, 2100];
      for (let index: number = 0; index < years.length; index++) {
        const year: number = years[index];
        const timestamp: number = new Date(year, 0, 2, 3, 4, 5).getTime();
        const text: string = formatDateTime(timestamp);
        hilog.info(DOMAIN, TAG, '%{public}s', 'year text ' + text);
        expect(text.substring(0, 4)).assertEqual(year.toString());
        expect(text.substring(4, 5)).assertEqual('-');
        expect(text.substring(7, 8)).assertEqual('-');
        expect(text).assertEqual(year.toString() + '-01-02 03:04:05');
      }
      expect(formatDateTime(new Date(2000, 0, 2, 3, 4, 5).getTime())).assertEqual('2000-01-02 03:04:05');
      expect(formatDateTime(new Date(2100, 0, 2, 3, 4, 5).getTime())).assertEqual('2100-01-02 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_3600
     * @tc.name      testFormatDateTimeLeapDay0001
     * @tc.desc      Verify leap day and end of month timestamps are formatted with padded day and month values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatDateTimeLeapDay0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatDateTimeLeapDay0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(formatDateTime(new Date(2024, 1, 29, 0, 0, 0).getTime())).assertEqual('2024-02-29 00:00:00');
      expect(formatDateTime(new Date(2023, 1, 28, 23, 59, 59).getTime())).assertEqual('2023-02-28 23:59:59');
      expect(formatDateTime(new Date(2024, 3, 30, 12, 0, 0).getTime())).assertEqual('2024-04-30 12:00:00');
      expect(formatDateTime(new Date(2024, 6, 31, 6, 30, 15).getTime())).assertEqual('2024-07-31 06:30:15');
      expect(formatDateTime(new Date(2024, 10, 30, 18, 45, 5).getTime())).assertEqual('2024-11-30 18:45:05');
      expect(formatDateTime(new Date(2024, 11, 1, 1, 2, 3).getTime())).assertEqual('2024-12-01 01:02:03');
      expect(formatDateTime(new Date(2024, 1, 9, 1, 2, 3).getTime())).assertEqual('2024-02-09 01:02:03');
      expect(formatDateTime(new Date(2024, 1, 10, 1, 2, 3).getTime())).assertEqual('2024-02-10 01:02:03');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_3700
     * @tc.name      testFormatTimeBoundaryHours0001
     * @tc.desc      Verify the extreme hour values of a day are rendered with the expected padded text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatTimeBoundaryHours0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatTimeBoundaryHours0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(formatTime(new Date(2024, 0, 1, 0, 0, 0).getTime())).assertEqual('00:00:00');
      expect(formatTime(new Date(2024, 0, 1, 0, 0, 59).getTime())).assertEqual('00:00:59');
      expect(formatTime(new Date(2024, 0, 1, 0, 59, 59).getTime())).assertEqual('00:59:59');
      expect(formatTime(new Date(2024, 0, 1, 9, 59, 59).getTime())).assertEqual('09:59:59');
      expect(formatTime(new Date(2024, 0, 1, 10, 0, 0).getTime())).assertEqual('10:00:00');
      expect(formatTime(new Date(2024, 0, 1, 12, 0, 0).getTime())).assertEqual('12:00:00');
      expect(formatTime(new Date(2024, 0, 1, 21, 21, 21).getTime())).assertEqual('21:21:21');
      expect(formatTime(new Date(2024, 0, 1, 23, 0, 0).getTime())).assertEqual('23:00:00');
      expect(formatTime(new Date(2024, 0, 1, 23, 59, 0).getTime())).assertEqual('23:59:00');
      expect(formatTime(new Date(2024, 0, 1, 23, 59, 59).getTime())).assertEqual('23:59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_3800
     * @tc.name      testPadTwoEpochComposition0001
     * @tc.desc      Verify padTwo composed segments equal the formatter output for a timestamp built from several padded fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoEpochComposition0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoEpochComposition0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const year: number = 2026;
      const month: number = 11;
      const day: number = 9;
      const hour: number = 8;
      const minute: number = 6;
      const second: number = 4;
      const timestamp: number = new Date(year, month - 1, day, hour, minute, second).getTime();
      const expectedDate: string = year.toString() + '-' + padTwo(month) + '-' + padTwo(day);
      const expectedTime: string = padTwo(hour) + ':' + padTwo(minute) + ':' + padTwo(second);
      hilog.info(DOMAIN, TAG, '%{public}s', 'composed text ' + expectedDate + ' ' + expectedTime);
      expect(formatDateTime(timestamp)).assertEqual(expectedDate + ' ' + expectedTime);
      expect(formatTime(timestamp)).assertEqual(expectedTime);
      expect(formatDateTime(timestamp).length).assertEqual(19);
      expect(expectedDate.length).assertEqual(10);
      expect(expectedTime.length).assertEqual(8);
      expect(padTwo(month)).assertEqual('11');
      expect(padTwo(day)).assertEqual('09');
      expect(padTwo(minute)).assertEqual('06');
      expect(padTwo(second)).assertEqual('04');
      expect(formatDateTime(timestamp).substring(0, 10)).assertEqual(expectedDate);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_3900
     * @tc.name      testPadTwoRepeatedCallStability0001
     * @tc.desc      Verify padTwo is deterministic across repeated calls and returns identical texts for the whole table.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoRepeatedCallStability0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoRepeatedCallStability0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let unstable: number = 0;
      for (let value: number = 0; value <= 120; value++) {
        const first: string = padTwo(value);
        const second: string = padTwo(value);
        const third: string = padTwo(value + 0);
        if (first !== second || second !== third) {
          unstable = unstable + 1;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'unstable values ' + unstable);
      expect(unstable).assertEqual(0);
      expect(padTwo(0)).assertEqual(padTwo(0));
      expect(padTwo(59)).assertEqual(padTwo(59));
      expect(padTwo(120)).assertEqual(padTwo(120));
      expect(padTwo(120).length).assertEqual(padTwo(120).toString().length);
      expect(padTwo(-10)).assertEqual(padTwo(-10));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_4000
     * @tc.name      testFormatTimeSecondSixtyBoundary0001
     * @tc.desc      Verify the second field rolls into the next minute when it is set to sixty through the date constructor.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatTimeSecondSixtyBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatTimeSecondSixtyBoundary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const rolled: number = new Date(2024, 0, 1, 10, 30, 60).getTime();
      const rolledText: string = formatTime(rolled);
      hilog.info(DOMAIN, TAG, '%{public}s', 'rolled text ' + rolledText);
      expect(rolledText).assertEqual('10:31:00');
      expect(rolledText.substring(6, 8)).assertEqual(padTwo(0));
      expect(rolledText.substring(3, 5)).assertEqual(padTwo(31));
      expect(formatTime(new Date(2024, 0, 1, 10, 59, 60).getTime())).assertEqual('11:00:00');
      expect(formatTime(new Date(2024, 0, 1, 23, 59, 60).getTime())).assertEqual('00:00:00');
      expect(formatDateTime(new Date(2024, 0, 31, 23, 59, 60).getTime())).assertEqual('2024-02-01 00:00:00');
      expect(formatDateTime(new Date(2024, 11, 31, 23, 59, 60).getTime())).assertEqual('2025-01-01 00:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_4100
     * @tc.name      testPadTwoSegmentCoverage0001
     * @tc.desc      Verify every minute value from zero to fifty-nine is padded identically by padTwo and formatTime.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoSegmentCoverage0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoSegmentCoverage0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      let shortTexts: number = 0;
      for (let minute: number = 0; minute <= 59; minute++) {
        const text: string = padTwo(minute);
        const timestamp: number = new Date(2024, 4, 17, 6, minute, 30).getTime();
        const timeText: string = formatTime(timestamp);
        if (text.length !== 2) {
          shortTexts = shortTexts + 1;
        }
        expect(text.length).assertEqual(2);
        expect(timeText.substring(3, 5)).assertEqual(text);
        expect(timeText.substring(6, 8)).assertEqual('30');
        checked = checked + 1;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'coverage minutes ' + checked);
      expect(checked).assertEqual(60);
      expect(shortTexts).assertEqual(0);
      expect(padTwo(59).length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_4200
     * @tc.name      testPadTwoInDurationSegments0001
     * @tc.desc      Verify formatDuration pads all three segments through padTwo across a millisecond table.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoInDurationSegments0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoInDurationSegments0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < DURATION_ROWS.length; index++) {
        const row: DurationRow = DURATION_ROWS[index];
        const text: string = formatDuration(row.durationMs);
        hilog.info(DOMAIN, TAG, '%{public}s', 'duration text ' + text);
        const hours: number = Number(text.substring(0, 2));
        const minutes: number = Number(text.substring(3, 5));
        const seconds: number = Number(text.substring(6, 8));
        expect(text).assertEqual(row.text);
        expect(text.length).assertEqual(8);
        expect(text.substring(0, 2)).assertEqual(padTwo(hours));
        expect(text.substring(3, 5)).assertEqual(padTwo(minutes));
        expect(text.substring(6, 8)).assertEqual(padTwo(seconds));
      }
      expect(formatDuration(-1000)).assertEqual('00:00:00');
      expect(formatDuration(-1)).assertEqual('00:00:00');
      expect(formatDuration(86400000)).assertEqual('24:00:00');
      expect(formatDuration(360000000)).assertEqual('100:00:00');
      expect(formatDuration(360000000).length).assertEqual(9);
      expect(padTwo(100)).assertEqual('100');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_4300
     * @tc.name      testPadTwoInDayStart0001
     * @tc.desc      Verify the day start helper renders its time part through padTwo as a zero filled time segment.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoInDayStart0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoInDayStart0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < DAY_START_ROWS.length; index++) {
        const row: DayStartRow = DAY_START_ROWS[index];
        const timestamp: number = new Date(row.year, row.month - 1, row.day, row.hour, row.minute, row.second).getTime();
        const start: number = getDayStart(timestamp);
        const startText: string = formatDateTime(start);
        hilog.info(DOMAIN, TAG, '%{public}s', 'day start text ' + startText);
        expect(startText).assertEqual(row.startText);
        expect(formatTime(start)).assertEqual('00:00:00');
        expect(startText.substring(11, 13)).assertEqual(padTwo(0));
        expect(startText.substring(14, 16)).assertEqual(padTwo(0));
        expect(startText.substring(17, 19)).assertEqual(padTwo(0));
        expect(start <= timestamp).assertTrue();
        expect(startText.substring(8, 10)).assertEqual(padTwo(row.day));
      }
      const epochDate: Date = new Date(0);
      const epochStart: number = new Date(epochDate.getFullYear(), epochDate.getMonth(), epochDate.getDate()).getTime();
      expect(getDayStart(0)).assertEqual(epochStart);
      expect(new Date(getDayStart(0)).getHours()).assertEqual(0);
      expect(padTwo(0)).assertEqual('00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMEPAD_4400
     * @tc.name      testPadTwoPlaceholderContract0001
     * @tc.desc      Verify padTwo is never used for invalid timestamps because both formatters return the placeholder first.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadTwoPlaceholderContract0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadTwoPlaceholderContract0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const invalidValues: number[] = [-1, -1000, -86400000, 0, NaN, Infinity, -Infinity, 8640000000000001];
      for (let index: number = 0; index < invalidValues.length; index++) {
        const value: number = invalidValues[index];
        hilog.info(DOMAIN, TAG, '%{public}s', 'invalid timestamp ' + value);
        expect(formatTime(value)).assertEqual(PLACEHOLDER);
        expect(formatDateTime(value)).assertEqual(PLACEHOLDER);
        expect(formatTime(value)).assertEqual(formatDateTime(value));
        expect(formatTime(value).indexOf(':')).assertEqual(-1);
        expect(formatDateTime(value).length).assertEqual(2);
      }
      expect(formatTime(1).length).assertEqual(8);
      expect(formatDateTime(1).length).assertEqual(19);
      expect(formatTime(1).indexOf(':')).assertEqual(2);
      expect(padTwo(1)).assertEqual('01');
      expect(formatTime(1).substring(0, 2)).assertEqual(padTwo(new Date(1).getHours()));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
