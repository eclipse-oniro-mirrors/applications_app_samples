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
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_TIMECMB]';

interface DateCase {
  year: number;
  month: number;
  day: number;
  hour: number;
  minute: number;
  second: number;
  dateTime: string;
  time: string;
}

const DATE_CASES: DateCase[] = [
  { year: 2026, month: 1, day: 15, hour: 9, minute: 5, second: 3, dateTime: '2026-01-15 09:05:03', time: '09:05:03' },
  { year: 2024, month: 2, day: 29, hour: 0, minute: 0, second: 0, dateTime: '2024-02-29 00:00:00', time: '00:00:00' },
  { year: 2023, month: 2, day: 28, hour: 23, minute: 59, second: 59, dateTime: '2023-02-28 23:59:59', time: '23:59:59' },
  { year: 2000, month: 1, day: 1, hour: 12, minute: 0, second: 0, dateTime: '2000-01-01 12:00:00', time: '12:00:00' },
  { year: 1999, month: 12, day: 31, hour: 23, minute: 59, second: 59, dateTime: '1999-12-31 23:59:59', time: '23:59:59' },
  { year: 1970, month: 1, day: 2, hour: 8, minute: 0, second: 0, dateTime: '1970-01-02 08:00:00', time: '08:00:00' },
  { year: 2038, month: 1, day: 19, hour: 3, minute: 14, second: 7, dateTime: '2038-01-19 03:14:07', time: '03:14:07' },
  { year: 2026, month: 3, day: 1, hour: 1, minute: 2, second: 3, dateTime: '2026-03-01 01:02:03', time: '01:02:03' },
  { year: 2026, month: 10, day: 10, hour: 10, minute: 10, second: 10, dateTime: '2026-10-10 10:10:10', time: '10:10:10' },
  { year: 2025, month: 6, day: 15, hour: 7, minute: 8, second: 9, dateTime: '2025-06-15 07:08:09', time: '07:08:09' },
  { year: 2025, month: 7, day: 4, hour: 18, minute: 30, second: 45, dateTime: '2025-07-04 18:30:45', time: '18:30:45' },
  { year: 2025, month: 11, day: 11, hour: 11, minute: 11, second: 11, dateTime: '2025-11-11 11:11:11', time: '11:11:11' },
];

interface DurationCase {
  input: number;
  expected: string;
}

const DURATION_CASES: DurationCase[] = [
  { input: 0, expected: '00:00:00' },
  { input: -1, expected: '00:00:00' },
  { input: 1, expected: '00:00:00' },
  { input: 999, expected: '00:00:00' },
  { input: 1000, expected: '00:00:01' },
  { input: 1500, expected: '00:00:01' },
  { input: 59999, expected: '00:00:59' },
  { input: 60000, expected: '00:01:00' },
  { input: 61000, expected: '00:01:01' },
  { input: 3599999, expected: '00:59:59' },
  { input: 3600000, expected: '01:00:00' },
  { input: 3661000, expected: '01:01:01' },
  { input: 86399999, expected: '23:59:59' },
  { input: 86400000, expected: '24:00:00' },
  { input: 90061000, expected: '25:01:01' },
  { input: 360000000, expected: '100:00:00' },
];

interface PadCase {
  input: number;
  expected: string;
}

const PAD_CASES: PadCase[] = [
  { input: 0, expected: '00' },
  { input: 1, expected: '01' },
  { input: 5, expected: '05' },
  { input: 9, expected: '09' },
  { input: 10, expected: '10' },
  { input: 11, expected: '11' },
  { input: 59, expected: '59' },
  { input: 99, expected: '99' },
  { input: 100, expected: '100' },
  { input: 120, expected: '120' },
];

export default function timeCombinationMatrixTest() {
  describe('TimeCombinationMatrixTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'TimeCombinationMatrixTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'TimeCombinationMatrixTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMECMB_0100
     * @tc.name      testDateTimeCombination0001
     * @tc.desc      Verify formatDateTime and formatTime agree on the same local timestamp.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateTimeCombination0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateTimeCombination0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < DATE_CASES.length; i++) {
        const row: DateCase = DATE_CASES[i];
        const timestamp: number = new Date(row.year, row.month - 1, row.day, row.hour, row.minute, row.second).getTime();
        expect(formatDateTime(timestamp)).assertEqual(row.dateTime);
        expect(formatTime(timestamp)).assertEqual(row.time);
        expect(formatDateTime(timestamp).length).assertEqual(19);
        expect(formatTime(timestamp).length).assertEqual(8);
        checked = checked + 1;
      }
      expect(checked).assertEqual(DATE_CASES.length);
      expect(DATE_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'date rows checked: ' + checked);
      expect(formatDateTime(0)).assertEqual('--');
      expect(formatDateTime(-1)).assertEqual('--');
      expect(formatTime(0)).assertEqual('--');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMECMB_0200
     * @tc.name      testDurationCombination0002
     * @tc.desc      Verify formatDuration converts millisecond durations into padded hour minute second text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDurationCombination0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDurationCombination0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < DURATION_CASES.length; i++) {
        const row: DurationCase = DURATION_CASES[i];
        expect(formatDuration(row.input)).assertEqual(row.expected);
        expect(formatDuration(row.input).length).assertEqual(row.expected.length);
        checked = checked + 1;
      }
      expect(checked).assertEqual(DURATION_CASES.length);
      expect(DURATION_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'duration rows checked: ' + checked);
      expect(formatDuration(0)).assertEqual('00:00:00');
      expect(formatDuration(-500)).assertEqual('00:00:00');
      expect(formatDuration(1000)).assertEqual('00:00:01');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMECMB_0300
     * @tc.name      testPadCombination0003
     * @tc.desc      Verify padTwo keeps two character widths over the supported numeric range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadCombination0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadCombination0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < PAD_CASES.length; i++) {
        const row: PadCase = PAD_CASES[i];
        expect(padTwo(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(PAD_CASES.length);
      expect(PAD_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'pad rows checked: ' + checked);
      let widthOk: number = 0;
      for (let i = 0; i <= 100; i++) {
        expect(padTwo(i).length >= 2).assertTrue();
        widthOk = widthOk + 1;
      }
      expect(widthOk).assertEqual(101);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMECMB_0400
     * @tc.name      testDateTimeParts0004
     * @tc.desc      Verify formatDateTime splits the date and time parts at the documented separator.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateTimeParts0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateTimeParts0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const timestamp: number = new Date(2026, 0, 15, 9, 5, 3).getTime();
      const text: string = formatDateTime(timestamp);
      expect(text.substring(0, 10)).assertEqual('2026-01-15');
      expect(text.substring(10, 11)).assertEqual(' ');
      expect(text.substring(11)).assertEqual('09:05:03');
      expect(text.indexOf(' ')).assertEqual(10);
      expect(text.length).assertEqual(19);
      expect(text.split(' ').length).assertEqual(2);
      expect(text.charAt(4)).assertEqual('-');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMECMB_0500
     * @tc.name      testDayStartCombination0005
     * @tc.desc      Verify getDayStart normalizes every timestamp of one local day to the same instant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDayStartCombination0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDayStartCombination0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const morning: number = new Date(2026, 0, 15, 9, 30, 0).getTime();
      const evening: number = new Date(2026, 0, 15, 22, 15, 0).getTime();
      const morningStart: number = getDayStart(morning);
      const eveningStart: number = getDayStart(evening);
      expect(morningStart).assertEqual(eveningStart);
      expect(morningStart <= morning).assertTrue();
      expect(eveningStart <= evening).assertTrue();
      expect(formatTime(morningStart)).assertEqual('00:00:00');
      expect(formatDateTime(morningStart).substring(0, 10)).assertEqual('2026-01-15');
      expect(getDayStart(morningStart)).assertEqual(morningStart);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMECMB_0600
     * @tc.name      testDayStartWeek0006
     * @tc.desc      Verify getDayStart advances by one day for seven consecutive local days.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDayStartWeek0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDayStartWeek0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = new Date(2026, 4, 1, 12, 0, 0).getTime();
      let previous: number = getDayStart(base);
      for (let i = 1; i < 7; i++) {
        const current: number = getDayStart(base + i * 86400000);
        expect(current > previous).assertTrue();
        previous = current;
      }
      expect(formatDateTime(getDayStart(base)).substring(11)).assertEqual('00:00:00');
      expect(getDayStart(base) <= base).assertTrue();
      expect(getDayStart(base + 86400000) > getDayStart(base)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMECMB_0700
     * @tc.name      testDurationBoundaries0007
     * @tc.desc      Verify formatDuration boundaries around seconds, minutes and hours.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDurationBoundaries0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDurationBoundaries0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(formatDuration(999)).assertEqual('00:00:00');
      expect(formatDuration(1000)).assertEqual('00:00:01');
      expect(formatDuration(59999)).assertEqual('00:00:59');
      expect(formatDuration(60000)).assertEqual('00:01:00');
      expect(formatDuration(3599999)).assertEqual('00:59:59');
      expect(formatDuration(3600000)).assertEqual('01:00:00');
      expect(formatDuration(86399999)).assertEqual('23:59:59');
      expect(formatDuration(86400000)).assertEqual('24:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_TIMECMB_0800
     * @tc.name      testTimeRoundTrip0008
     * @tc.desc      Verify formatTime output parses back into the same hour, minute and second parts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTimeRoundTrip0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTimeRoundTrip0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const timestamp: number = new Date(2026, 8, 9, 14, 25, 36).getTime();
      const text: string = formatTime(timestamp);
      const parts: string[] = text.split(':');
      expect(parts.length).assertEqual(3);
      expect(Number(parts[0])).assertEqual(14);
      expect(Number(parts[1])).assertEqual(25);
      expect(Number(parts[2])).assertEqual(36);
      expect(text).assertEqual('14:25:36');
      expect(padTwo(14) + ':' + padTwo(25) + ':' + padTwo(36)).assertEqual(text);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
