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

const SIX_DIGIT: number = 6;
const TEN: number = 10;
const SAMPLE_DURATIONS: number[] = [0, 500, 1000, 59999, 60000, 61000, 3599000, 3600000, 123456789];

function clockParts(value: string): string[] {
  return value.split(':');
}

export default function dateTimeUtilMatrixTest() {
  describe('dateTimeUtilMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_0100
     * @tc.name testDateTimeUtil0001
     * @tc.desc Verify fill prefixes a zero for every single-digit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(0)).assertEqual('00');
      expect(util.fill(1)).assertEqual('01');
      expect(util.fill(9)).assertEqual('09');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_0200
     * @tc.name testDateTimeUtil0002
     * @tc.desc Verify fill leaves values of ten and above unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(TEN)).assertEqual('10');
      expect(util.fill(59)).assertEqual('59');
      expect(util.fill(100)).assertEqual('100');
      expect(util.fill(1234)).assertEqual('1234');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_0300
     * @tc.name testDateTimeUtil0003
     * @tc.desc Verify concatDate joins year, month and day without adding separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 1, 2)).assertEqual('202612');
      expect(util.concatDate(2026, 11, 4)).assertEqual('2026114');
      expect(util.concatDate(2026, 12, 31)).assertEqual('20261231');
      expect(util.concatDate(1999, 11, 9)).assertEqual('1999119');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_0400
     * @tc.name testDateTimeUtil0004
     * @tc.desc Verify concatDate always equals the plain concatenation of its three arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const years: number[] = [2000, 2026];
      const months: number[] = [1, 10, 12];
      const days: number[] = [1, 9, 30];
      for (let i = 0; i < years.length; i++) {
        for (let j = 0; j < months.length; j++) {
          for (let k = 0; k < days.length; k++) {
            const text: string = util.concatDate(years[i], months[j], days[k]);
            expect(text).assertEqual(`${years[i]}${months[j]}${days[k]}`);
            expect(text.endsWith(`${months[j]}${days[k]}`)).assertTrue();
            expect(/^\d+$/.test(text)).assertTrue();
          }
        }
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_0500
     * @tc.name testDateTimeUtil0005
     * @tc.desc Verify concatTime zero-pads single-digit hour, minute and second values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(0, 0, 0)).assertEqual('000000');
      expect(util.concatTime(1, 2, 3)).assertEqual('010203');
      expect(util.concatTime(9, 9, 9)).assertEqual('090909');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_0600
     * @tc.name testDateTimeUtil0006
     * @tc.desc Verify concatTime keeps two-digit values as-is and mixes padded and plain parts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(TEN, TEN, TEN)).assertEqual('101010');
      expect(util.concatTime(23, 59, 59)).assertEqual('235959');
      expect(util.concatTime(9, TEN, 59)).assertEqual('091059');
      expect(util.concatTime(23, 0, 1)).assertEqual('230001');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_0700
     * @tc.name testDateTimeUtil0007
     * @tc.desc Verify concatTime returns exactly six digits for every in-range time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hours: number[] = [0, 9, 23];
      const minutes: number[] = [0, 10, 59];
      const seconds: number[] = [0, 9, 59];
      for (let i = 0; i < hours.length; i++) {
        for (let j = 0; j < minutes.length; j++) {
          for (let k = 0; k < seconds.length; k++) {
            const text: string = util.concatTime(hours[i], minutes[j], seconds[k]);
            expect(text.length).assertEqual(SIX_DIGIT);
            expect(/^\d{6}$/.test(text)).assertTrue();
            expect(text.startsWith(`${hours[i] < TEN ? '0' : ''}${hours[i]}`)).assertTrue();
          }
        }
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_0800
     * @tc.name testDateTimeUtil0008
     * @tc.desc Verify getTime returns the padded hour-minute-second of the current clock
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const before: Date = new Date();
      const actual: string = util.getTime();
      const after: Date = new Date();
      const candidates: string[] = [
        util.concatTime(before.getHours(), before.getMinutes(), before.getSeconds()),
        util.concatTime(after.getHours(), after.getMinutes(), after.getSeconds())
      ];
      expect(actual.length).assertEqual(SIX_DIGIT);
      expect(/^\d{6}$/.test(actual)).assertTrue();
      expect(candidates.includes(actual)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_0900
     * @tc.name testDateTimeUtil0009
     * @tc.desc Verify getDate concatenates the current year, month and day without separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const now: Date = new Date();
      const actual: string = util.getDate();
      expect(actual.startsWith(`${now.getFullYear()}`)).assertTrue();
      expect(/^\d{6,8}$/.test(actual)).assertTrue();
      expect(actual).assertEqual(util.concatDate(now.getFullYear(), now.getMonth() + 1, now.getDate()));
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_1000
     * @tc.name testDateTimeUtil0010
     * @tc.desc Verify getShownTimer rounds milliseconds to the nearest whole second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(getShownTimer(499)).assertEqual('0:0');
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(getShownTimer(999)).assertEqual('0:1');
      expect(getShownTimer(1000)).assertEqual('0:1');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_1100
     * @tc.name testDateTimeUtil0011
     * @tc.desc Verify getShownTimer rolls over to the next minute once rounding reaches sixty seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      expect(getShownTimer(60000)).assertEqual('1:0');
      expect(getShownTimer(61000)).assertEqual('1:1');
      expect(getShownTimer(119000)).assertEqual('1:59');
      expect(getShownTimer(120000)).assertEqual('2:0');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_1200
     * @tc.name testDateTimeUtil0012
     * @tc.desc Verify getShownTimer keeps minute and second parts without zero padding for long durations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(3599000)).assertEqual('59:59');
      expect(getShownTimer(3600000)).assertEqual('60:0');
      expect(getShownTimer(123456789)).assertEqual('2057:37');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_1300
     * @tc.name testDateTimeUtil0013
     * @tc.desc Verify getShownTimer always renders exactly one colon and non-negative parts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      for (let i = 0; i < SAMPLE_DURATIONS.length; i++) {
        const text: string = getShownTimer(SAMPLE_DURATIONS[i]);
        const parts: string[] = clockParts(text);
        expect(parts.length).assertEqual(2);
        expect(/^\d+$/.test(parts[0])).assertTrue();
        expect(/^\d+$/.test(parts[1])).assertTrue();
        expect(Number(parts[1]) < 60).assertTrue();
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_1400
     * @tc.name testDateTimeUtil0014
     * @tc.desc Verify dateTime zero-pads both fields and carries the second into the minute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(0)).assertEqual('00:00');
      expect(dateTime(9)).assertEqual('00:09');
      expect(dateTime(59)).assertEqual('00:59');
      expect(dateTime(60)).assertEqual('01:00');
      expect(dateTime(61)).assertEqual('01:01');
      expect(dateTime(65)).assertEqual('01:05');
      expect(dateTime(600)).assertEqual('10:00');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_1500
     * @tc.name testDateTimeUtil0015
     * @tc.desc Verify dateTime drops whole hours and continues from zero at each hour boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(3599)).assertEqual('59:59');
      expect(dateTime(3600)).assertEqual('00:00');
      expect(dateTime(3661)).assertEqual('01:01');
      expect(dateTime(7200)).assertEqual('00:00');
      expect(dateTime(86399)).assertEqual('59:59');
      expect(dateTime(86400)).assertEqual('00:00');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_1600
     * @tc.name testDateTimeUtil0016
     * @tc.desc Verify dateTime always returns two digits per field within the valid second range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const samples: number[] = [0, 1, 9, 59, 60, 61, 599, 3599, 3600, 86399];
      for (let i = 0; i < samples.length; i++) {
        const text: string = dateTime(samples[i]);
        expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
        const parts: string[] = clockParts(text);
        expect(Number(parts[0]) < 60).assertTrue();
        expect(Number(parts[1]) < 60).assertTrue();
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_MATRIX_1700
     * @tc.name testDateTimeUtil0017
     * @tc.desc Verify getShownTimer rounds a half second up and still keeps the second field below sixty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeUtil0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(1499)).assertEqual('0:1');
      expect(getShownTimer(1500)).assertEqual('0:2');
      expect(getShownTimer(2499)).assertEqual('0:2');
      expect(getShownTimer(2500)).assertEqual('0:3');
      expect(getShownTimer(59500)).assertEqual('1:0');
    })
  })
}
