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

const TEN: number = 10;

function parts(text: string): string[] {
  return text.split(':');
}

export default function dateTimeEdgeTest() {
  describe('dateTimeEdgeTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_0100
     * @tc.name testDateTimeEdge0001
     * @tc.desc Verify fill pads the lowest single-digit values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(0)).assertEqual('00');
      expect(util.fill(1)).assertEqual('01');
      expect(util.fill(2)).assertEqual('02');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_0200
     * @tc.name testDateTimeEdge0002
     * @tc.desc Verify fill pads every value from one to nine
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(3)).assertEqual('03');
      expect(util.fill(4)).assertEqual('04');
      expect(util.fill(5)).assertEqual('05');
      expect(util.fill(6)).assertEqual('06');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_0300
     * @tc.name testDateTimeEdge0003
     * @tc.desc Verify fill pads seven, eight and nine but not ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(7)).assertEqual('07');
      expect(util.fill(8)).assertEqual('08');
      expect(util.fill(9)).assertEqual('09');
      expect(util.fill(TEN)).assertEqual('10');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_0400
     * @tc.name testDateTimeEdge0004
     * @tc.desc Verify fill keeps two-digit values at the upper end of the range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(58)).assertEqual('58');
      expect(util.fill(59)).assertEqual('59');
      expect(util.fill(60)).assertEqual('60');
      expect(util.fill(99)).assertEqual('99');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_0500
     * @tc.name testDateTimeEdge0005
     * @tc.desc Verify fill keeps three and four digit values without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(100)).assertEqual('100');
      expect(util.fill(101)).assertEqual('101');
      expect(util.fill(999)).assertEqual('999');
      expect(util.fill(1000)).assertEqual('1000');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_0600
     * @tc.name testDateTimeEdge0006
     * @tc.desc Verify fill does not normalise negative values and only prefixes the zero marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(-1)).assertEqual('0-1');
      expect(util.fill(-9)).assertEqual('0-9');
      expect(util.fill(-10)).assertEqual('0-10');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_0700
     * @tc.name testDateTimeEdge0007
     * @tc.desc Verify fill treats fractional values as numeric and preserves their decimal part
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(0.5)).assertEqual('00.5');
      expect(util.fill(9.5)).assertEqual('9.5');
      expect(util.fill(10.5)).assertEqual('10.5');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_0800
     * @tc.name testDateTimeEdge0008
     * @tc.desc Verify fill output always contains the original digits as a suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const values: number[] = [0, 7, 10, 25, 99, 250];
      for (let i = 0; i < values.length; i++) {
        const text: string = util.fill(values[i]);
        expect(text.endsWith(`${values[i]}`)).assertTrue();
        expect(text.length).assertEqual(`${values[i]}`.length + (values[i] < TEN ? 1 : 0));
        expect(text.startsWith('0')).assertEqual(values[i] < TEN);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_0900
     * @tc.name testDateTimeEdge0009
     * @tc.desc Verify concatDate treats month and day as decimal digits without separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 2, 29)).assertEqual('2026229');
      expect(util.concatDate(2024, 2, 29)).assertEqual('2024229');
      expect(util.concatDate(2026, 3, 1)).assertEqual('202631');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_1000
     * @tc.name testDateTimeEdge0010
     * @tc.desc Verify concatDate accepts month and day values on both sides of their normal range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 13, 1)).assertEqual('2026131');
      expect(util.concatDate(2026, 0, 15)).assertEqual('2026015');
      expect(util.concatDate(2026, 1, 32)).assertEqual('2026132');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_1100
     * @tc.name testDateTimeEdge0011
     * @tc.desc Verify concatDate keeps zero and single-digit components unsigned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(0, 0, 0)).assertEqual('000');
      expect(util.concatDate(0, 1, 1)).assertEqual('011');
      expect(util.concatDate(1, 0, 0)).assertEqual('100');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_1200
     * @tc.name testDateTimeEdge0012
     * @tc.desc Verify concatDate concatenates negative components literally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(-1, 1, 1)).assertEqual('-111');
      expect(util.concatDate(2026, -1, 1)).assertEqual('2026-11');
      expect(util.concatDate(2026, 1, -1)).assertEqual('20261-1');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_1300
     * @tc.name testDateTimeEdge0013
     * @tc.desc Verify concatDate keeps the year segment unchanged for four-digit years
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const years: number[] = [1900, 2000, 2026, 9999];
      for (let i = 0; i < years.length; i++) {
        const text: string = util.concatDate(years[i], 6, 15);
        expect(text.startsWith(`${years[i]}`)).assertTrue();
        expect(text).assertEqual(`${years[i]}615`);
        expect(text.length).assertEqual(`${years[i]}`.length + 3);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_1400
     * @tc.name testDateTimeEdge0014
     * @tc.desc Verify concatDate output length follows the component widths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatDate(2026, 1, 1).length).assertEqual(6);
      expect(util.concatDate(2026, 10, 1).length).assertEqual(7);
      expect(util.concatDate(2026, 10, 10).length).assertEqual(8);
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_1500
     * @tc.name testDateTimeEdge0015
     * @tc.desc Verify concatTime pads each zero-valued field independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(0, 0, 1)).assertEqual('000001');
      expect(util.concatTime(0, 1, 0)).assertEqual('000100');
      expect(util.concatTime(1, 0, 0)).assertEqual('010000');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_1600
     * @tc.name testDateTimeEdge0016
     * @tc.desc Verify concatTime pads only the fields below ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(9, 59, 59)).assertEqual('095959');
      expect(util.concatTime(12, 0, 0)).assertEqual('120000');
      expect(util.concatTime(0, 59, 9)).assertEqual('005909');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_1700
     * @tc.name testDateTimeEdge0017
     * @tc.desc Verify concatTime keeps ordinary midday time compact and fixed width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(12, 34, 56)).assertEqual('123456');
      expect(util.concatTime(12, 34, 56).length).assertEqual(6);
      expect(/^\d{6}$/.test(util.concatTime(12, 34, 56))).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_1800
     * @tc.name testDateTimeEdge0018
     * @tc.desc Verify concatTime does not validate values above two digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(99, 99, 99)).assertEqual('999999');
      expect(util.concatTime(100, 1, 1)).assertEqual('1000101');
      expect(util.concatTime(100, 1, 1).length).assertEqual(7);
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_1900
     * @tc.name testDateTimeEdge0019
     * @tc.desc Verify concatTime accepts negative fields without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(-1, 0, 0)).assertEqual('0-10000');
      expect(util.concatTime(0, -1, 0)).assertEqual('000-100');
      expect(util.concatTime(0, 0, -1)).assertEqual('00000-1');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_2000
     * @tc.name testDateTimeEdge0020
     * @tc.desc Verify concatTime normalises fractional input through string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.concatTime(1.5, 2.5, 3.5)).assertEqual('01.502.503.5');
      expect(util.concatTime(1.5, 2.5, 3.5).length).assertEqual(12);
      expect(util.concatTime(9.9, 9.9, 9.9)).assertEqual('9.99.99.9');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_2100
     * @tc.name testDateTimeEdge0021
     * @tc.desc Verify getShownTimer keeps zero and sub-half-second values at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      expect(getShownTimer(1)).assertEqual('0:0');
      expect(getShownTimer(499)).assertEqual('0:0');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_2200
     * @tc.name testDateTimeEdge0022
     * @tc.desc Verify getShownTimer advances at the half-second rounding boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      expect(getShownTimer(501)).assertEqual('0:1');
      expect(getShownTimer(999)).assertEqual('0:1');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_2300
     * @tc.name testDateTimeEdge0023
     * @tc.desc Verify getShownTimer keeps one second until the next half-second boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      expect(getShownTimer(1001)).assertEqual('0:1');
      expect(getShownTimer(1499)).assertEqual('0:1');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_2400
     * @tc.name testDateTimeEdge0024
     * @tc.desc Verify getShownTimer increments at every following half-second boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(1500)).assertEqual('0:2');
      expect(getShownTimer(2500)).assertEqual('0:3');
      expect(getShownTimer(3500)).assertEqual('0:4');
      expect(getShownTimer(4500)).assertEqual('0:5');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_2500
     * @tc.name testDateTimeEdge0025
     * @tc.desc Verify getShownTimer rounds values just below and above the mid-point consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(2499)).assertEqual('0:2');
      expect(getShownTimer(2500)).assertEqual('0:3');
      expect(getShownTimer(2501)).assertEqual('0:3');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_2600
     * @tc.name testDateTimeEdge0026
     * @tc.desc Verify getShownTimer reaches fifty-five seconds without a minute carry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(54500)).assertEqual('0:55');
      expect(getShownTimer(54999)).assertEqual('0:55');
      expect(getShownTimer(55000)).assertEqual('0:55');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_2700
     * @tc.name testDateTimeEdge0027
     * @tc.desc Verify getShownTimer rolls the minute at fifty-nine and a half seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(55499)).assertEqual('0:55');
      expect(getShownTimer(55500)).assertEqual('0:56');
      expect(getShownTimer(59000)).assertEqual('0:59');
      expect(getShownTimer(59499)).assertEqual('0:59');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_2800
     * @tc.name testDateTimeEdge0028
     * @tc.desc Verify getShownTimer moves into the next minute just after the rounded threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(59501)).assertEqual('1:0');
      expect(getShownTimer(60999)).assertEqual('1:1');
      expect(getShownTimer(61999)).assertEqual('1:2');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_2900
     * @tc.name testDateTimeEdge0029
     * @tc.desc Verify getShownTimer handles the two-minute rounding boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(119999)).assertEqual('2:0');
      expect(getShownTimer(120499)).assertEqual('2:0');
      expect(getShownTimer(120500)).assertEqual('2:1');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_3000
     * @tc.name testDateTimeEdge0030
     * @tc.desc Verify getShownTimer keeps counting minutes past one hour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(3599999)).assertEqual('60:0');
      expect(getShownTimer(4200000)).assertEqual('70:0');
      expect(getShownTimer(7140000)).assertEqual('119:0');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_3100
     * @tc.name testDateTimeEdge0031
     * @tc.desc Verify getShownTimer keeps counting minutes past ten hours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(36000000)).assertEqual('600:0');
      expect(getShownTimer(86400000)).assertEqual('1440:0');
      expect(getShownTimer(987654321)).assertEqual('16460:54');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_3200
     * @tc.name testDateTimeEdge0032
     * @tc.desc Verify getShownTimer renders the largest minute field with an unpadded second
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = getShownTimer(987654321);
      const fields: string[] = parts(text);
      expect(fields.length).assertEqual(2);
      expect(Number(fields[0])).assertEqual(16460);
      expect(Number(fields[1])).assertEqual(54);
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_3300
     * @tc.name testDateTimeEdge0033
     * @tc.desc Verify getShownTimer maps negative values below one second to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(-1)).assertEqual('0:0');
      expect(getShownTimer(-499)).assertEqual('0:0');
      expect(getShownTimer(-500)).assertEqual('0:0');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_3400
     * @tc.name testDateTimeEdge0034
     * @tc.desc Verify getShownTimer exposes the unclamped second field for negative one to two seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(-501)).assertEqual('0:-1');
      expect(getShownTimer(-1500)).assertEqual('0:-1');
      expect(getShownTimer(-1999)).assertEqual('0:-2');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_3500
     * @tc.name testDateTimeEdge0035
     * @tc.desc Verify getShownTimer exposes the unclamped minute field for negative one-minute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(getShownTimer(-59999)).assertEqual('-1:0');
      expect(getShownTimer(-60000)).assertEqual('-1:0');
      expect(getShownTimer(-61000)).assertEqual('-1:-1');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_3600
     * @tc.name testDateTimeEdge0036
     * @tc.desc Verify getShownTimer output for negative durations still uses one colon separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = getShownTimer(-61000);
      const fields: string[] = parts(text);
      expect(fields.length).assertEqual(2);
      expect(fields[0]).assertEqual('-1');
      expect(fields[1]).assertEqual('-1');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_3700
     * @tc.name testDateTimeEdge0037
     * @tc.desc Verify dateTime maps the first few seconds to the zero minute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(0)).assertEqual('00:00');
      expect(dateTime(1)).assertEqual('00:01');
      expect(dateTime(2)).assertEqual('00:02');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_3800
     * @tc.name testDateTimeEdge0038
     * @tc.desc Verify dateTime zero-pads single-digit seconds at the low end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(8)).assertEqual('00:08');
      expect(dateTime(9)).assertEqual('00:09');
      expect(dateTime(TEN)).assertEqual('00:10');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_3900
     * @tc.name testDateTimeEdge0039
     * @tc.desc Verify dateTime carries the second at the first minute boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(58)).assertEqual('00:58');
      expect(dateTime(59)).assertEqual('00:59');
      expect(dateTime(60)).assertEqual('01:00');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_4000
     * @tc.name testDateTimeEdge0040
     * @tc.desc Verify dateTime keeps the one-minute part for the early seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(61)).assertEqual('01:01');
      expect(dateTime(62)).assertEqual('01:02');
      expect(dateTime(119)).assertEqual('01:59');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_4100
     * @tc.name testDateTimeEdge0041
     * @tc.desc Verify dateTime advances the minute at two minutes and stays fixed until the next carry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(120)).assertEqual('02:00');
      expect(dateTime(121)).assertEqual('02:01');
      expect(dateTime(599)).assertEqual('09:59');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_4200
     * @tc.name testDateTimeEdge0042
     * @tc.desc Verify dateTime switches to a two-digit minute at ten minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(600)).assertEqual('10:00');
      expect(dateTime(601)).assertEqual('10:01');
      expect(dateTime(659)).assertEqual('10:59');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_4300
     * @tc.name testDateTimeEdge0043
     * @tc.desc Verify dateTime continues the two-digit minute through nineteen minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(660)).assertEqual('11:00');
      expect(dateTime(1199)).assertEqual('19:59');
      expect(dateTime(1200)).assertEqual('20:00');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_4400
     * @tc.name testDateTimeEdge0044
     * @tc.desc Verify dateTime reaches the final minute of the hour without an hour field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(1800)).assertEqual('30:00');
      expect(dateTime(3598)).assertEqual('59:58');
      expect(dateTime(3599)).assertEqual('59:59');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_4500
     * @tc.name testDateTimeEdge0045
     * @tc.desc Verify dateTime wraps the minute to zero at each hour boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(3600)).assertEqual('00:00');
      expect(dateTime(3601)).assertEqual('00:01');
      expect(dateTime(3660)).assertEqual('01:00');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_4600
     * @tc.name testDateTimeEdge0046
     * @tc.desc Verify dateTime keeps wrapping correctly beyond the second hour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(3661)).assertEqual('01:01');
      expect(dateTime(7200)).assertEqual('00:00');
      expect(dateTime(86399)).assertEqual('59:59');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_4700
     * @tc.name testDateTimeEdge0047
     * @tc.desc Verify dateTime wraps at a full day and keeps wrapping for the next day
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(86400)).assertEqual('00:00');
      expect(dateTime(90061)).assertEqual('01:01');
      expect(dateTime(172799)).assertEqual('59:59');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_4800
     * @tc.name testDateTimeEdge0048
     * @tc.desc Verify dateTime preserves fractional seconds instead of rounding them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(59.9)).assertEqual('00:59.9');
      expect(dateTime(60.5)).assertEqual('01:00.5');
      expect(dateTime(0.5)).assertEqual('00:00.5');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_4900
     * @tc.name testDateTimeEdge0049
     * @tc.desc Verify dateTime output always matches the padded minute-second pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const samples: number[] = [1, 59, 61, 599, 601, 3599, 3601, 86399, 86401];
      for (let i = 0; i < samples.length; i++) {
        const text: string = dateTime(samples[i]);
        expect(/^\d{2}:\d{2}$/.test(text)).assertTrue();
        expect(text.length).assertEqual(5);
        expect(text.indexOf(':')).assertEqual(2);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_5000
     * @tc.name testDateTimeEdge0050
     * @tc.desc Verify dateTime and getShownTimer agree on the minute for a one-minute duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(65)).assertEqual('01:05');
      expect(getShownTimer(65000)).assertEqual('1:5');
      expect(parts(getShownTimer(65000))[0]).assertEqual('1');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_5100
     * @tc.name testDateTimeEdge0051
     * @tc.desc Verify dateTime and getShownTimer agree on a two-minute duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(125)).assertEqual('02:05');
      expect(getShownTimer(125000)).assertEqual('2:5');
      expect(parts(getShownTimer(125000)).length).assertEqual(2);
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_5200
     * @tc.name testDateTimeEdge0052
     * @tc.desc Verify both time formatters keep fifty-nine seconds at nine minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(599)).assertEqual('09:59');
      expect(getShownTimer(599000)).assertEqual('9:59');
      expect(parts(getShownTimer(599000))[1]).assertEqual('59');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_5300
     * @tc.name testDateTimeEdge0053
     * @tc.desc Verify both time formatters show ten minutes and zero seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(600)).assertEqual('10:00');
      expect(getShownTimer(600000)).assertEqual('10:0');
      expect(parts(getShownTimer(600000))[1]).assertEqual('0');
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_5400
     * @tc.name testDateTimeEdge0054
     * @tc.desc Verify both formatters show fifty-nine minutes fifty-nine seconds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(3599)).assertEqual('59:59');
      expect(getShownTimer(3599000)).assertEqual('59:59');
      expect(getShownTimer(3599000)).assertEqual(dateTime(3599));
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_5500
     * @tc.name testDateTimeEdge0055
     * @tc.desc Verify the formatters diverge after one hour because dateTime drops whole hours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(3661)).assertEqual('01:01');
      expect(getShownTimer(3661000)).assertEqual('61:1');
      expect(getShownTimer(3661000) === dateTime(3661)).assertFalse();
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_5600
     * @tc.name testDateTimeEdge0056
     * @tc.desc Verify dateTime wraps at one day while getShownTimer keeps accumulating minutes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(dateTime(86400)).assertEqual('00:00');
      expect(getShownTimer(86400000)).assertEqual('1440:0');
      expect(Number(parts(getShownTimer(86400000))[0])).assertEqual(1440);
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_5700
     * @tc.name testDateTimeEdge0057
     * @tc.desc Verify getTime keeps the six-digit clock contract at the hour and minute edges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const values: string[] = [util.concatTime(0, 0, 0), util.concatTime(23, 59, 59), util.concatTime(9, 0, 59)];
      for (let i = 0; i < values.length; i++) {
        expect(values[i].length).assertEqual(6);
        expect(/^\d{6}$/.test(values[i])).assertTrue();
        expect(values[i].indexOf(':')).assertEqual(-1);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_5800
     * @tc.name testDateTimeEdge0058
     * @tc.desc Verify getDate stays consistent with concatDate and the current year
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const now: Date = new Date();
      const text: string = util.getDate();
      expect(text).assertEqual(util.concatDate(now.getFullYear(), now.getMonth() + 1, now.getDate()));
      expect(text.startsWith(`${now.getFullYear()}`)).assertTrue();
      expect(/^\d{6,8}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_5900
     * @tc.name testDateTimeEdge0059
     * @tc.desc Verify getTime stays within the current clock second window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const before: Date = new Date();
      const text: string = util.getTime();
      const after: Date = new Date();
      const window: string[] = [
        util.concatTime(before.getHours(), before.getMinutes(), before.getSeconds()),
        util.concatTime(after.getHours(), after.getMinutes(), after.getSeconds())
      ];
      expect(text.length).assertEqual(6);
      expect(window.includes(text)).assertTrue();
      expect(/^\d{6}$/.test(text)).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_DATETIME_EDGE_6000
     * @tc.name testDateTimeEdge0060
     * @tc.desc Verify fill is deterministic for repeated calls with the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testDateTimeEdge0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(0)).assertEqual('00');
      expect(util.fill(9)).assertEqual('09');
      expect(util.fill(TEN)).assertEqual('10');
      expect(util.fill(TEN) === util.fill(9)).assertFalse();
    })
  })
}
