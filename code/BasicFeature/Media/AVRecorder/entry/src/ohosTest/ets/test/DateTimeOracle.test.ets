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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { paceTurn } from './TestPace';
import DateTimeUtil, { getShownTimer, dateTime } from '../../../main/ets/utils/DateTimeUtil';

const MAX_HOUR: number = 23;
const MAX_MINUTE: number = 59;
const MAX_SECOND: number = 59;
const SECONDS_PER_MINUTE: number = 60;
const SECONDS_PER_HOUR: number = 3600;
const MS_PER_SECOND: number = 1000;
const MINUTES_PER_HOUR: number = 60;

function pad2(value: number): string {
  return value < 10 ? `0${value}` : `${value}`;
}

function timerOracle(ms: number): string {
  const total: number = Math.round(ms / MS_PER_SECOND);
  const minutes: number = Math.floor(total / SECONDS_PER_MINUTE);
  const seconds: number = total % SECONDS_PER_MINUTE;
  return `${minutes}:${seconds}`;
}

function clockOracle(seconds: number): string {
  const minutes: number = Math.floor(seconds / SECONDS_PER_MINUTE) % MINUTES_PER_HOUR;
  return `${pad2(minutes)}:${pad2(seconds % SECONDS_PER_MINUTE)}`;
}

function colonParts(text: string): string[] {
  return text.split(':');
}

export default function dateTimeOracleTest() {
  describe('dateTimeOracleTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_0100
     * @tc.name testDateTimeOracle0001
     * @tc.desc Verify fill agrees with a two-digit pad on both sides of the single-digit boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const values: number[] = [0, 1, 2, 3, 8, 9, 10, 11, 19, 20, 58, 59, 69, 88, 89, 98, 99];
      for (let i = 0; i < values.length; i++) {
        const text: string = util.fill(values[i]);
        expect(text).assertEqual(pad2(values[i]));
        expect(text.length).assertEqual(2);
        expect(/^\d{2}$/.test(text)).assertTrue();
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_0200
     * @tc.name testDateTimeOracle0002
     * @tc.desc Verify fill leaves every value above ninety-nine with its natural width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      for (let value = 100; value <= 1000; value += 37) {
        const text: string = util.fill(value);
        expect(text).assertEqual(`${value}`);
        expect(text.length).assertEqual(`${value}`.length);
        expect(text.startsWith('0')).assertFalse();
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_0300
     * @tc.name testDateTimeOracle0003
     * @tc.desc Verify concatTime equals the padded concatenation of three clock fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hours: number[] = [0, 7, 12, MAX_HOUR];
      const minutes: number[] = [0, 9, 10, 59];
      const seconds: number[] = [0, 9, 10, 59];
      for (let h = 0; h < hours.length; h++) {
        for (let i = 0; i < minutes.length; i++) {
          for (let j = 0; j < seconds.length; j++) {
            const text: string = util.concatTime(hours[h], minutes[i], seconds[j]);
            expect(text).assertEqual(`${pad2(hours[h])}${pad2(minutes[i])}${pad2(seconds[j])}`);
            expect(text.length).assertEqual(6);
            expect(/^\d{6}$/.test(text)).assertTrue();
          }
        }
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_0400
     * @tc.name testDateTimeOracle0004
     * @tc.desc Verify concatTime pads every minute of the hour inside a fixed hour slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      for (let minute = 0; minute <= MAX_MINUTE; minute++) {
        const text: string = util.concatTime(7, minute, 9);
        expect(text).assertEqual(`07${pad2(minute)}09`);
        expect(text.substring(0, 2)).assertEqual('07');
        expect(text.endsWith('09')).assertTrue();
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_0500
     * @tc.name testDateTimeOracle0005
     * @tc.desc Verify concatDate always equals the unpadded concatenation of year, month and day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const years: number[] = [2000, 2026];
      const months: number[] = [1, 2, 9, 10, 11, 12];
      const days: number[] = [1, 9, 10, 31];
      for (let i = 0; i < years.length; i++) {
        for (let m = 0; m < months.length; m++) {
          for (let j = 0; j < days.length; j++) {
            const text: string = util.concatDate(years[i], months[m], days[j]);
            expect(text).assertEqual(`${years[i]}${months[m]}${days[j]}`);
            expect(text.startsWith(`${years[i]}`)).assertTrue();
            expect(text.endsWith(`${days[j]}`)).assertTrue();
          }
        }
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_0600
     * @tc.name testDateTimeOracle0006
     * @tc.desc Verify dateTime matches an independent clock formatter across the first hour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const secondsInMinute: number[] = [0, 9, 10, 59];
      for (let minute = 0; minute <= MAX_MINUTE; minute += 7) {
        for (let i = 0; i < secondsInMinute.length; i++) {
          const seconds: number = minute * SECONDS_PER_MINUTE + secondsInMinute[i];
          const text: string = dateTime(seconds);
          expect(text).assertEqual(clockOracle(seconds));
          expect(text.length).assertEqual(5);
          expect(colonParts(text).length).assertEqual(2);
        }
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_0700
     * @tc.name testDateTimeOracle0007
     * @tc.desc Verify dateTime matches the clock oracle across later hours of the day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      for (let hour = 1; hour <= 23; hour++) {
        const seconds: number = hour * SECONDS_PER_HOUR + 59 * SECONDS_PER_MINUTE + 59;
        const text: string = dateTime(seconds);
        expect(text).assertEqual(clockOracle(seconds));
        expect(text.indexOf(':')).assertEqual(2);
        expect(Number(colonParts(text)[1]) < SECONDS_PER_MINUTE).assertTrue();
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_0800
     * @tc.name testDateTimeOracle0008
     * @tc.desc Verify dateTime wraps to zero minutes at every whole hour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      for (let hour = 0; hour <= 24; hour++) {
        const text: string = dateTime(hour * SECONDS_PER_HOUR);
        expect(text).assertEqual('00:00');
        expect(text).assertEqual(clockOracle(hour * SECONDS_PER_HOUR));
        expect(text.endsWith(':00')).assertTrue();
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_0900
     * @tc.name testDateTimeOracle0009
     * @tc.desc Verify the minute advances exactly when the second counter crosses sixty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const samples: number[] = [59, 60, 119, 120, 3599, 3600, 86399, 86400];
      const expected: string[] = ['00:59', '01:00', '01:59', '02:00', '59:59', '00:00', '59:59', '00:00'];
      for (let i = 0; i < samples.length; i++) {
        expect(dateTime(samples[i])).assertEqual(expected[i]);
        expect(dateTime(samples[i])).assertEqual(clockOracle(samples[i]));
        expect(dateTime(samples[i]).length).assertEqual(5);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_1000
     * @tc.name testDateTimeOracle0010
     * @tc.desc Verify dateTime is stable when the same value is formatted repeatedly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const samples: number[] = [0, 61, 600, 3599, 3600, 43200, 86399];
      for (let i = 0; i < samples.length; i++) {
        const first: string = dateTime(samples[i]);
        const second: string = dateTime(samples[i]);
        expect(first).assertEqual(second);
        expect(first).assertEqual(clockOracle(samples[i]));
        expect(first.length).assertEqual(5);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_1100
     * @tc.name testDateTimeOracle0011
     * @tc.desc Verify getShownTimer matches the rounding oracle over the first five seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      for (let ms = 0; ms <= 5000; ms += 125) {
        const text: string = getShownTimer(ms);
        expect(text).assertEqual(timerOracle(ms));
        expect(text.indexOf('.')).assertEqual(-1);
        expect(text.split(':').length).assertEqual(2);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_1200
     * @tc.name testDateTimeOracle0012
     * @tc.desc Verify getShownTimer matches the rounding oracle across two minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      for (let ms = 0; ms <= 120000; ms += 1750) {
        const text: string = getShownTimer(ms);
        expect(text).assertEqual(timerOracle(ms));
        expect(Number(text.split(':')[1]) < SECONDS_PER_MINUTE).assertTrue();
        expect(/^\d+:\d+$/.test(text)).assertTrue();
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_1300
     * @tc.name testDateTimeOracle0013
     * @tc.desc Verify a half-second remainder always rounds up to the next whole second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      for (let second = 0; second <= 20; second++) {
        const ms: number = second * MS_PER_SECOND + 500;
        const minutes: number = Math.floor((second + 1) / SECONDS_PER_MINUTE);
        expect(getShownTimer(ms)).assertEqual(`${minutes}:${(second + 1) % SECONDS_PER_MINUTE}`);
        expect(getShownTimer(ms)).assertEqual(timerOracle(ms));
        expect(getShownTimer(ms).split(':')[1]).assertEqual(`${(second + 1) % SECONDS_PER_MINUTE}`);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_1400
     * @tc.name testDateTimeOracle0014
     * @tc.desc Verify a remainder just below half a second still counts as the current second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      for (let second = 0; second <= 20; second++) {
        const ms: number = second * MS_PER_SECOND + 499;
        const minutes: number = Math.floor(second / SECONDS_PER_MINUTE);
        expect(getShownTimer(ms)).assertEqual(timerOracle(ms));
        expect(getShownTimer(ms).split(':')[1]).assertEqual(`${second % SECONDS_PER_MINUTE}`);
        expect(getShownTimer(ms)).assertEqual(`${minutes}:${second % SECONDS_PER_MINUTE}`);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_1500
     * @tc.name testDateTimeOracle0015
     * @tc.desc Verify getShownTimer carries into the next minute around the one-minute boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(59000)).assertEqual('0:59');
      expect(getShownTimer(59500)).assertEqual('1:0');
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(getShownTimer(60500)).assertEqual('1:1');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_1600
     * @tc.name testDateTimeOracle0016
     * @tc.desc Verify getShownTimer matches the oracle for whole-hour durations up to one day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      for (let hours = 1; hours <= 24; hours++) {
        const ms: number = hours * SECONDS_PER_HOUR * MS_PER_SECOND;
        const text: string = getShownTimer(ms);
        expect(text).assertEqual(timerOracle(ms));
        expect(colonParts(text)[1]).assertEqual('0');
        expect(Number(colonParts(text)[0])).assertEqual(hours * MINUTES_PER_HOUR);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_1700
     * @tc.name testDateTimeOracle0017
     * @tc.desc Verify getShownTimer never reports a negative minute or a second of sixty or more
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      for (let ms = 0; ms <= 10000; ms += 250) {
        const parts: string[] = colonParts(getShownTimer(ms));
        expect(Number(parts[0]) >= 0).assertTrue();
        expect(Number(parts[1]) < SECONDS_PER_MINUTE).assertTrue();
        expect(parts.length).assertEqual(2);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_1800
     * @tc.name testDateTimeOracle0018
     * @tc.desc Verify every dateTime value in a day has one colon and five characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      for (let seconds = 0; seconds <= 86399; seconds += 997) {
        const text: string = dateTime(seconds);
        expect(text.length).assertEqual(5);
        expect(text.indexOf(':')).assertEqual(2);
        expect(text.lastIndexOf(':')).assertEqual(2);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_1900
     * @tc.name testDateTimeOracle0019
     * @tc.desc Verify getDate equals concatDate for the year, month and day observed around the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const before: Date = new Date();
      const actual: string = util.getDate();
      const after: Date = new Date();
      const candidates: string[] = [
        util.concatDate(before.getFullYear(), before.getMonth() + 1, before.getDate()),
        util.concatDate(after.getFullYear(), after.getMonth() + 1, after.getDate())
      ];
      expect(candidates.includes(actual)).assertTrue();
      expect(actual.startsWith(`${before.getFullYear()}`)).assertTrue();
      expect(/^\d{6,8}$/.test(actual)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_2000
     * @tc.name testDateTimeOracle0020
     * @tc.desc Verify getTime equals a concatTime sample taken around the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const before: Date = new Date();
      const actual: string = util.getTime();
      const after: Date = new Date();
      const beforeText: string =
        util.concatTime(before.getHours(), before.getMinutes(), before.getSeconds());
      const afterText: string =
        util.concatTime(after.getHours(), after.getMinutes(), after.getSeconds());
      expect(actual === beforeText || actual === afterText).assertTrue();
      expect(actual.length).assertEqual(6);
      expect(/^\d{6}$/.test(actual)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_2100
     * @tc.name testDateTimeOracle0021
     * @tc.desc Verify concatTime output contains only digits over a sampled clock grid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hours: number[] = [0, 1, 9, 10, 22, 23];
      const minutes: number[] = [0, 1, 9, 10, 58, 59];
      for (let i = 0; i < hours.length; i++) {
        for (let j = 0; j < minutes.length; j++) {
          const text: string = util.concatTime(hours[i], minutes[j], MAX_SECOND);
          expect(/^\d{6}$/.test(text)).assertTrue();
          expect(text.length).assertEqual(6);
          expect(text).assertEqual(`${pad2(hours[i])}${pad2(minutes[j])}59`);
        }
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_2200
     * @tc.name testDateTimeOracle0022
     * @tc.desc Verify concatDate output contains only digits over a sampled date grid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const months: number[] = [1, 2, 10, 11, 12];
      const days: number[] = [1, 2, 9, 10, 11, 29, 30, 31];
      for (let i = 0; i < months.length; i++) {
        for (let j = 0; j < days.length; j++) {
          const text: string = util.concatDate(2026, months[i], days[j]);
          expect(/^\d+$/.test(text)).assertTrue();
          expect(text).assertEqual(`2026${months[i]}${days[j]}`);
          expect(text.length).assertEqual(4 + `${months[i]}`.length + `${days[j]}`.length);
        }
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_2300
     * @tc.name testDateTimeOracle0023
     * @tc.desc Verify fill output contains only digits for every sampled non-negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      for (let value = 0; value <= 1234; value += 7) {
        const text: string = util.fill(value);
        expect(/^\d+$/.test(text)).assertTrue();
        expect(text.endsWith(`${value}`)).assertTrue();
        expect(text).assertEqual(pad2(value));
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_ORACLE_2400
     * @tc.name testDateTimeOracle0024
     * @tc.desc Verify advancing by one minute shifts the minute field by one with a wrap at the hour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeOracle0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      for (let seconds = 0; seconds <= 3500; seconds += 60) {
        const current: string[] = colonParts(dateTime(seconds));
        const next: string[] = colonParts(dateTime(seconds + SECONDS_PER_MINUTE));
        expect(Number(next[0])).assertEqual((Number(current[0]) + 1) % MINUTES_PER_HOUR);
        expect(next[1]).assertEqual(current[1]);
        expect(dateTime(seconds + SECONDS_PER_MINUTE)).assertEqual(clockOracle(seconds + SECONDS_PER_MINUTE));
      }
    })
  })
}
