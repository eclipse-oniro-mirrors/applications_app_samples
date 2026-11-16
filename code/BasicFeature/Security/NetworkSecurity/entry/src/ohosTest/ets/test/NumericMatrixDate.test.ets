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
import { DateUtils } from 'library';

const DOMAIN: number = 0xF811;
// Milliseconds in one day reused by the numeric timestamp matrix expectations.
const DAY_MS: number = 86400000;

// Oracle helper: pads a calendar number below one hundred with one leading zero.
function padOracle(value: number): string {
  if (value < 10) {
    return '0' + value.toString();
  }
  return value.toString();
}

// Oracle helper: builds the expected local 'yyyy-MM-dd HH:mm:ss' text of a timestamp
// from the platform Date API itself, so expectations hold in every device timezone.
function localOracle(timestamp: number): string {
  const moment: Date = new Date(timestamp);
  return moment.getFullYear().toString() + '-' + padOracle(moment.getMonth() + 1) + '-'
    + padOracle(moment.getDate()) + ' ' + padOracle(moment.getHours()) + ':'
    + padOracle(moment.getMinutes()) + ':' + padOracle(moment.getSeconds());
}

// Oracle helper: builds the expected local date part 'yyyy-MM-dd' of a timestamp.
function datePartOracle(timestamp: number): string {
  const moment: Date = new Date(timestamp);
  return moment.getFullYear().toString() + '-' + padOracle(moment.getMonth() + 1) + '-'
    + padOracle(moment.getDate());
}

// Registers the numeric matrix test suite for the date and timestamp helpers.
export default function numericMatrixDateTest() {
  describe('NumericMatrixDateSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_0100
     * @tc.name      testNumDate0001
     * @tc.desc      Verify now returns the current epoch time inside the surrounding clock bounds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Capture the clock window around the call under test.
      const before: number = Date.now();
      const current: number = DateUtils.now();
      const after: number = Date.now();
      // The reported timestamp cannot predate the window entry.
      expect(current >= before).assertTrue();
      // The reported timestamp cannot exceed the window exit.
      expect(current <= after).assertTrue();
      // A follow-up call keeps moving forward instead of returning a stale value.
      expect(DateUtils.now() >= current).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_0200
     * @tc.name      testNumDate0002
     * @tc.desc      Verify now returns a positive number type far beyond the year 2020 timestamp matrix point.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The current wall clock is captured once for the numeric matrix checks.
      const current: number = DateUtils.now();
      // The reported value is a plain number.
      expect(typeof current).assertEqual('number');
      // The value stays strictly positive on any working device clock.
      expect(current > 0).assertTrue();
      // The value sits far beyond the year 2020 epoch matrix point.
      expect(current > 1577836800000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_0300
     * @tc.name      testNumDate0003
     * @tc.desc      Verify toUtc renders the epoch zero timestamp as the exact ISO-8601 UTC string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The epoch zero is the smallest non-negative timestamp matrix point.
      const result: string = DateUtils.toUtc(0);
      // The ISO-8601 render matches the epoch instant exactly.
      expect(result).assertEqual('1970-01-01T00:00:00.000Z');
      // The render always ends with the UTC marker Z.
      expect(result.substring(result.length - 1, result.length)).assertEqual('Z');
      // The fixed ISO render keeps the twenty four character width.
      expect(result.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_0400
     * @tc.name      testNumDate0004
     * @tc.desc      Verify toUtc renders the one second matrix timestamp as the exact ISO-8601 UTC string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One thousand milliseconds is the one second matrix point.
      const result: string = DateUtils.toUtc(1000);
      // The ISO-8601 render matches the one second instant exactly.
      expect(result).assertEqual('1970-01-01T00:00:01.000Z');
      // The date part stays on the epoch day.
      expect(result.substring(0, 10)).assertEqual('1970-01-01');
      // The time part carries the one second offset.
      expect(result.substring(11, 19)).assertEqual('00:00:01');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_0500
     * @tc.name      testNumDate0005
     * @tc.desc      Verify toUtc renders the fifty nine second four hundred ninety nine ms matrix timestamp exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Fifty nine seconds and four hundred ninety nine ms is the minute boundary minus one.
      const result: string = DateUtils.toUtc(59499);
      // The ISO-8601 render matches the sub minute instant exactly.
      expect(result).assertEqual('1970-01-01T00:00:59.499Z');
      // The seconds field carries the fifty nine value.
      expect(result.substring(17, 19)).assertEqual('59');
      // The millisecond field carries the four hundred ninety nine value.
      expect(result.substring(20, 23)).assertEqual('499');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_0600
     * @tc.name      testNumDate0006
     * @tc.desc      Verify toUtc renders the last millisecond before the first minute boundary of the epoch day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Fifty nine thousand nine hundred ninety nine ms is one below the first minute.
      const result: string = DateUtils.toUtc(59999);
      // The render keeps the last millisecond of the zero minute.
      expect(result).assertEqual('1970-01-01T00:00:59.999Z');
      // The render still sits on the epoch day.
      expect(result.substring(0, 10)).assertEqual('1970-01-01');
      // Advancing one millisecond crosses into the first minute.
      expect(DateUtils.toUtc(60000)).assertEqual('1970-01-01T00:01:00.000Z');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_0700
     * @tc.name      testNumDate0007
     * @tc.desc      Verify toUtc renders the first minute boundary timestamp as an exact minute start string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Sixty thousand ms is the first full minute boundary.
      const result: string = DateUtils.toUtc(60000);
      // The render matches the exact minute start.
      expect(result).assertEqual('1970-01-01T00:01:00.000Z');
      // The minute field carries the one value.
      expect(result.substring(14, 16)).assertEqual('01');
      // The render stays on the epoch day.
      expect(result.substring(0, 10)).assertEqual('1970-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_0800
     * @tc.name      testNumDate0008
     * @tc.desc      Verify toUtc renders the last millisecond of the epoch day as the exact day end string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One millisecond below a full day is the last epoch day millisecond.
      const result: string = DateUtils.toUtc(86399999);
      // The render matches the exact day end instant.
      expect(result).assertEqual('1970-01-01T23:59:59.999Z');
      // The hour field carries the twenty three value.
      expect(result.substring(11, 13)).assertEqual('23');
      // Advancing one millisecond crosses into the next day.
      expect(DateUtils.toUtc(86400000)).assertEqual('1970-01-02T00:00:00.000Z');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_0900
     * @tc.name      testNumDate0009
     * @tc.desc      Verify toUtc renders the second epoch day boundary as an exact midnight string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One full day in milliseconds is the second day boundary.
      const result: string = DateUtils.toUtc(DAY_MS);
      // The render matches the exact second day midnight.
      expect(result).assertEqual('1970-01-02T00:00:00.000Z');
      // The day field carries the two value.
      expect(result.substring(8, 10)).assertEqual('02');
      // The time part resets to the midnight reading.
      expect(result.substring(11, 19)).assertEqual('00:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_1000
     * @tc.name      testNumDate0010
     * @tc.desc      Verify toUtc renders the negative one millisecond timestamp inside the year 1969.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Negative one is the smallest pre epoch matrix point.
      const result: string = DateUtils.toUtc(-1);
      // The render falls into the year 1969 at the day end.
      expect(result).assertEqual('1969-12-31T23:59:59.999Z');
      // The render still ends with the UTC marker.
      expect(result.substring(23, 24)).assertEqual('Z');
      // The year field carries the 1969 value.
      expect(result.substring(0, 4)).assertEqual('1969');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_1100
     * @tc.name      testNumDate0011
     * @tc.desc      Verify toUtc renders the negative full day timestamp as the exact pre epoch midnight string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One negative full day is the pre epoch midnight boundary.
      const result: string = DateUtils.toUtc(-DAY_MS);
      // The render matches the exact pre epoch midnight.
      expect(result).assertEqual('1969-12-31T00:00:00.000Z');
      // The date part stays on the last pre epoch day.
      expect(result.substring(0, 10)).assertEqual('1969-12-31');
      // The time part carries the midnight reading.
      expect(result.substring(11, 19)).assertEqual('00:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_1200
     * @tc.name      testNumDate0012
     * @tc.desc      Verify toUtc renders the signed thirty two bit maximum timestamp as the exact 2038 overflow instant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The signed 32 bit Unix seconds boundary is converted to epoch milliseconds.
      const result: string = DateUtils.toUtc(2147483647 * 1000);
      // The render matches the exact 2038 overflow instant.
      expect(result).assertEqual('2038-01-19T03:14:07.000Z');
      // The year field carries the 2038 value.
      expect(result.substring(0, 4)).assertEqual('2038');
      // Advancing one second crosses the signed 32 bit overflow point.
      expect(DateUtils.toUtc(2147483648 * 1000)).assertEqual('2038-01-19T03:14:08.000Z');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_1300
     * @tc.name      testNumDate0013
     * @tc.desc      Verify toUtc renders the leap day 2024-02-29 UTC matrix point as the exact midnight string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The UTC stamp of the 2024 leap day is a fixed numeric matrix point.
      const leapDay: number = Date.UTC(2024, 1, 29);
      const result: string = DateUtils.toUtc(leapDay);
      // The render matches the exact leap day midnight.
      expect(result).assertEqual('2024-02-29T00:00:00.000Z');
      // The date part spells the leap day.
      expect(result.substring(0, 10)).assertEqual('2024-02-29');
      // One day earlier stays on the twenty eighth of February.
      expect(DateUtils.toUtc(leapDay - DAY_MS).substring(0, 10)).assertEqual('2024-02-28');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_1400
     * @tc.name      testNumDate0014
     * @tc.desc      Verify toUtc renders the ascending digit timestamp 1234567890123 as the well known 2009 instant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The ascending digit value is a widely published timestamp matrix point.
      const result: string = DateUtils.toUtc(1234567890123);
      // The render matches the well known 2009 instant exactly.
      expect(result).assertEqual('2009-02-13T23:31:30.123Z');
      // The millisecond field carries the one hundred twenty three value.
      expect(result.substring(20, 23)).assertEqual('123');
      // The year field carries the 2009 value.
      expect(result.substring(0, 4)).assertEqual('2009');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_1500
     * @tc.name      testNumDate0015
     * @tc.desc      Verify toUtc renders the two trillion millisecond matrix point as the exact 2033 instant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two trillion milliseconds is a far future matrix point beyond 2038.
      const result: string = DateUtils.toUtc(2000000000000);
      // The render matches the exact far future instant.
      expect(result).assertEqual('2033-05-18T03:33:20.000Z');
      // The render keeps the full twenty four character width.
      expect(result.length).assertEqual(24);
      // The render ends with the UTC marker.
      expect(result.substring(23, 24)).assertEqual('Z');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_1600
     * @tc.name      testNumDate0016
     * @tc.desc      Verify every toUtc result keeps the twenty four character width and the trailing Z marker.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumDate0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumDate0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Five matrix points cover negative, zero, small, large and far future values.
      const first: string = DateUtils.toUtc(-DAY_MS);
      const second: string = DateUtils.toUtc(0);
      const third: string = DateUtils.toUtc(59499);
      const fourth: string = DateUtils.toUtc(2147483647);
      const fifth: string = DateUtils.toUtc(2000000000000);
      // Every render keeps the fixed twenty four character width.
      expect(first.length).assertEqual(24);
      expect(second.length).assertEqual(24);
      expect(third.length).assertEqual(24);
      expect(fourth.length).assertEqual(24);
      expect(fifth.length).assertEqual(24);
      // Every render ends with the UTC marker.
      expect(first.substring(23, 24)).assertEqual('Z');
      expect(fifth.substring(23, 24)).assertEqual('Z');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_1700
     * @tc.name      testNumDate0017
     * @tc.desc      Verify toUtc matches the platform Date.UTC reading for the year 2024 new year matrix point.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The platform Date.UTC call builds the 2024 new year stamp.
      const newYear: number = Date.UTC(2024, 0, 1);
      const result: string = DateUtils.toUtc(newYear);
      // The render matches the exact new year midnight.
      expect(result).assertEqual('2024-01-01T00:00:00.000Z');
      // The platform ISO string of the same stamp agrees with the helper.
      expect(new Date(newYear).toISOString()).assertEqual(result);
      // The helper render is stable across repeated calls.
      expect(DateUtils.toUtc(newYear)).assertEqual(result);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_1800
     * @tc.name      testNumDate0018
     * @tc.desc      Verify format renders the full token pattern of a locally built 2024-02-29 13:45:59 instant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The leap day afternoon is built through the local platform constructor.
      const stamp: number = new Date(2024, 1, 29, 13, 45, 59).getTime();
      const result: string = DateUtils.format(stamp, 'yyyy-MM-dd HH:mm:ss');
      // The render spells the complete leap day afternoon.
      expect(result).assertEqual('2024-02-29 13:45:59');
      // The render matches the platform reading of the same instant.
      expect(result).assertEqual(localOracle(stamp));
      // The date part alone spells the leap day.
      expect(DateUtils.format(stamp, 'yyyy-MM-dd')).assertEqual('2024-02-29');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_1900
     * @tc.name      testNumDate0019
     * @tc.desc      Verify format renders the compact leap day pattern yyyyMMdd as the matrix text 20240229.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The leap day noon is built through the local platform constructor.
      const stamp: number = new Date(2024, 1, 29, 12, 0, 0).getTime();
      const result: string = DateUtils.format(stamp, 'yyyyMMdd');
      // The compact render spells the leap day matrix text.
      expect(result).assertEqual('20240229');
      // The render keeps exactly eight characters.
      expect(result.length).assertEqual(8);
      // Repeating the render reproduces the same compact text.
      expect(DateUtils.format(stamp, 'yyyyMMdd')).assertEqual('20240229');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_2000
     * @tc.name      testNumDate0020
     * @tc.desc      Verify format substitutes the year token alone for the locally built leap day instant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The leap day instant is built through the local platform constructor.
      const stamp: number = new Date(2024, 1, 29, 9, 30, 0).getTime();
      // The year token alone renders the four digit year.
      expect(DateUtils.format(stamp, 'yyyy')).assertEqual('2024');
      // The render keeps exactly four characters.
      expect(DateUtils.format(stamp, 'yyyy').length).assertEqual(4);
      // The platform year reading agrees with the token render.
      expect(DateUtils.format(stamp, 'yyyy')).assertEqual(new Date(stamp).getFullYear().toString());
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_2100
     * @tc.name      testNumDate0021
     * @tc.desc      Verify format substitutes the month token alone with the zero padded February value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The leap day instant is built through the local platform constructor.
      const stamp: number = new Date(2024, 1, 29, 9, 30, 0).getTime();
      // The month token alone renders the zero padded month.
      expect(DateUtils.format(stamp, 'MM')).assertEqual('02');
      // The render keeps exactly two characters.
      expect(DateUtils.format(stamp, 'MM').length).assertEqual(2);
      // The platform month reading agrees with the token render.
      expect(DateUtils.format(stamp, 'MM')).assertEqual(padOracle(new Date(stamp).getMonth() + 1));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_2200
     * @tc.name      testNumDate0022
     * @tc.desc      Verify format substitutes the day token alone with the twenty ninth leap day value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The leap day instant is built through the local platform constructor.
      const stamp: number = new Date(2024, 1, 29, 9, 30, 0).getTime();
      // The day token alone renders the two digit day.
      expect(DateUtils.format(stamp, 'dd')).assertEqual('29');
      // The render keeps exactly two characters.
      expect(DateUtils.format(stamp, 'dd').length).assertEqual(2);
      // The platform day reading agrees with the token render.
      expect(DateUtils.format(stamp, 'dd')).assertEqual(padOracle(new Date(stamp).getDate()));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_2300
     * @tc.name      testNumDate0023
     * @tc.desc      Verify format substitutes the hour token alone with the thirteen value of the afternoon instant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The leap day afternoon is built through the local platform constructor.
      const stamp: number = new Date(2024, 1, 29, 13, 45, 59).getTime();
      // The hour token alone renders the zero padded hour.
      expect(DateUtils.format(stamp, 'HH')).assertEqual('13');
      // The render keeps exactly two characters.
      expect(DateUtils.format(stamp, 'HH').length).assertEqual(2);
      // The platform hour reading agrees with the token render.
      expect(DateUtils.format(stamp, 'HH')).assertEqual(padOracle(new Date(stamp).getHours()));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_2400
     * @tc.name      testNumDate0024
     * @tc.desc      Verify format substitutes the minute token alone with the forty five value of the afternoon instant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The leap day afternoon is built through the local platform constructor.
      const stamp: number = new Date(2024, 1, 29, 13, 45, 59).getTime();
      // The minute token alone renders the zero padded minute.
      expect(DateUtils.format(stamp, 'mm')).assertEqual('45');
      // The render keeps exactly two characters.
      expect(DateUtils.format(stamp, 'mm').length).assertEqual(2);
      // The platform minute reading agrees with the token render.
      expect(DateUtils.format(stamp, 'mm')).assertEqual(padOracle(new Date(stamp).getMinutes()));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_2500
     * @tc.name      testNumDate0025
     * @tc.desc      Verify format substitutes the second token alone with the fifty nine value of the afternoon instant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The leap day afternoon is built through the local platform constructor.
      const stamp: number = new Date(2024, 1, 29, 13, 45, 59).getTime();
      // The second token alone renders the zero padded second.
      expect(DateUtils.format(stamp, 'ss')).assertEqual('59');
      // The render keeps exactly two characters.
      expect(DateUtils.format(stamp, 'ss').length).assertEqual(2);
      // The platform second reading agrees with the token render.
      expect(DateUtils.format(stamp, 'ss')).assertEqual(padOracle(new Date(stamp).getSeconds()));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_2600
     * @tc.name      testNumDate0026
     * @tc.desc      Verify format renders the midnight boundary of a locally built instant with all zero clock parts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The leap day midnight is built through the local platform constructor.
      const stamp: number = new Date(2024, 1, 29, 0, 0, 0).getTime();
      const result: string = DateUtils.format(stamp, 'HH:mm:ss');
      // The clock render spells the all zero midnight reading.
      expect(result).assertEqual('00:00:00');
      // The date part still spells the leap day.
      expect(DateUtils.format(stamp, 'yyyy-MM-dd')).assertEqual('2024-02-29');
      // The full render matches the platform reading of the same instant.
      expect(DateUtils.format(stamp, 'yyyy-MM-dd HH:mm:ss')).assertEqual(localOracle(stamp));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_2700
     * @tc.name      testNumDate0027
     * @tc.desc      Verify format renders the last second boundary of a locally built day with the full clock parts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The leap day last second is built through the local platform constructor.
      const stamp: number = new Date(2024, 1, 29, 23, 59, 59).getTime();
      const result: string = DateUtils.format(stamp, 'HH:mm:ss');
      // The clock render spells the day end reading.
      expect(result).assertEqual('23:59:59');
      // The date part still spells the leap day.
      expect(DateUtils.format(stamp, 'yyyy-MM-dd')).assertEqual('2024-02-29');
      // The full render matches the platform reading of the same instant.
      expect(DateUtils.format(stamp, 'yyyy-MM-dd HH:mm:ss')).assertEqual(localOracle(stamp));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_2800
     * @tc.name      testNumDate0028
     * @tc.desc      Verify format returns a token free pattern unchanged for any timestamp matrix point.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The epoch zero is used as the anchor timestamp.
      // A pattern without tokens stays completely unchanged.
      expect(DateUtils.format(0, 'static text')).assertEqual('static text');
      // Lowercase letters and punctuation stay verbatim too.
      expect(DateUtils.format(0, 'qq-ww,ee')).assertEqual('qq-ww,ee');
      // Uppercase words outside the token set stay verbatim as well.
      expect(DateUtils.format(0, 'YEAR/MONTH')).assertEqual('YEAR/MONTH');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_2900
     * @tc.name      testNumDate0029
     * @tc.desc      Verify format substitutes only the first occurrence of a repeated token in one pattern.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The local epoch readings anchor the repeated token expectations.
      const epoch: Date = new Date(0);
      const epochYear: string = epoch.getFullYear().toString();
      // The first year token is substituted, the second stays verbatim.
      expect(DateUtils.format(0, 'yyyy-yyyy')).assertEqual(epochYear + '-yyyy');
      // The first day token is substituted, the second stays verbatim.
      expect(DateUtils.format(0, 'dd/dd')).assertEqual(padOracle(epoch.getDate()) + '/dd');
      // The first minute token is substituted, the second stays verbatim.
      expect(DateUtils.format(0, 'mm/mm')).assertEqual(padOracle(epoch.getMinutes()) + '/mm');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_3000
     * @tc.name      testNumDate0030
     * @tc.desc      Verify format renders the 2038 overflow day as the compact matrix text 20380119.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 2038 overflow day is built through the local platform constructor.
      const stamp: number = new Date(2038, 0, 19, 8, 14, 7).getTime();
      const result: string = DateUtils.format(stamp, 'yyyyMMdd');
      // The compact render spells the 2038 overflow day.
      expect(result).assertEqual('20380119');
      // The render keeps exactly eight characters.
      expect(result.length).assertEqual(8);
      // The full render matches the platform reading of the same instant.
      expect(DateUtils.format(stamp, 'yyyy-MM-dd HH:mm:ss')).assertEqual(localOracle(stamp));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_3100
     * @tc.name      testNumDate0031
     * @tc.desc      Verify format renders the year 2000 century boundary day with slash separators.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The century boundary day is built through the local platform constructor.
      const stamp: number = new Date(2000, 0, 1, 6, 30, 15).getTime();
      const result: string = DateUtils.format(stamp, 'yyyy/MM/dd');
      // The slash render spells the century boundary day.
      expect(result).assertEqual('2000/01/01');
      // The clock part spells the morning reading.
      expect(DateUtils.format(stamp, 'HH:mm')).assertEqual('06:30');
      // The full render matches the platform reading of the same instant.
      expect(DateUtils.format(stamp, 'yyyy-MM-dd HH:mm:ss')).assertEqual(localOracle(stamp));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_3200
     * @tc.name      testNumDate0032
     * @tc.desc      Verify format of the 59499 ms matrix point matches the platform local reading of the same instant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The sub minute matrix point renders against the platform reading.
      const result: string = DateUtils.format(59499, 'yyyy-MM-dd HH:mm:ss');
      // The render matches the platform reading of the same instant.
      expect(result).assertEqual(localOracle(59499));
      // The seconds field of the platform reading carries the fifty nine value.
      expect(localOracle(59499).substring(17, 19)).assertEqual('59');
      // The date part matches the platform date reading of the same instant.
      expect(DateUtils.format(59499, 'yyyy-MM-dd')).assertEqual(datePartOracle(59499));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_3300
     * @tc.name      testNumDate0033
     * @tc.desc      Verify addDays with zero days returns the original timestamp unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A fixed anchor stamp keeps the arithmetic assertions exact.
      const anchor: number = 1709164800000;
      // Zero days must return the anchor unchanged.
      expect(DateUtils.addDays(anchor, 0)).assertEqual(anchor);
      // Repeating the zero day shift stays exact.
      expect(DateUtils.addDays(anchor, 0)).assertEqual(DateUtils.addDays(anchor, 0));
      // The epoch zero also stays unchanged for zero days.
      expect(DateUtils.addDays(0, 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_3400
     * @tc.name      testNumDate0034
     * @tc.desc      Verify addDays with one day adds exactly one day in milliseconds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A fixed anchor stamp keeps the arithmetic assertions exact.
      const anchor: number = 1709164800000;
      // One day adds exactly one day in milliseconds.
      expect(DateUtils.addDays(anchor, 1)).assertEqual(anchor + DAY_MS);
      // The shift is exact even at the epoch zero.
      expect(DateUtils.addDays(0, 1)).assertEqual(DAY_MS);
      // The shifted value moves forward in time.
      expect(DateUtils.addDays(anchor, 1) > anchor).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_3500
     * @tc.name      testNumDate0035
     * @tc.desc      Verify addDays with a negative day subtracts exactly one day in milliseconds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A fixed anchor stamp keeps the arithmetic assertions exact.
      const anchor: number = 1709164800000;
      // Negative one day subtracts exactly one day in milliseconds.
      expect(DateUtils.addDays(anchor, -1)).assertEqual(anchor - DAY_MS);
      // The shifted value moves backward in time.
      expect(DateUtils.addDays(anchor, -1) < anchor).assertTrue();
      // The epoch zero shifts to the negative pre epoch day.
      expect(DateUtils.addDays(0, -1)).assertEqual(-DAY_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_3600
     * @tc.name      testNumDate0036
     * @tc.desc      Verify addDays with one week adds exactly seven days in milliseconds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A fixed anchor stamp keeps the arithmetic assertions exact.
      const anchor: number = 1709164800000;
      // Seven days add exactly seven day units.
      expect(DateUtils.addDays(anchor, 7)).assertEqual(anchor + 7 * DAY_MS);
      // The one day shift composed seven times agrees with the week shift.
      expect(DateUtils.addDays(DateUtils.addDays(anchor, 1), 6)).assertEqual(DateUtils.addDays(anchor, 7));
      // The week shift moves the value forward.
      expect(DateUtils.addDays(anchor, 7) > anchor).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_3700
     * @tc.name      testNumDate0037
     * @tc.desc      Verify addDays symmetric shifts cancel each other around a fixed anchor stamp.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A fixed anchor stamp keeps the arithmetic assertions exact.
      const anchor: number = 1709164800000;
      // Shifting forward and backward by one day returns the anchor.
      expect(DateUtils.addDays(DateUtils.addDays(anchor, 1), -1)).assertEqual(anchor);
      // Shifting backward and forward by five days also returns the anchor.
      expect(DateUtils.addDays(DateUtils.addDays(anchor, -5), 5)).assertEqual(anchor);
      // The shifted stamp equals the anchor plus the exact day unit.
      expect(DateUtils.addDays(anchor, 5)).assertEqual(anchor + 5 * DAY_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_3800
     * @tc.name      testNumDate0038
     * @tc.desc      Verify addDays crosses the signed 32 bit overflow point with exact millisecond arithmetic.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The signed 32 bit Unix seconds boundary is converted to epoch milliseconds.
      const overflow: number = 2147483647 * 1000;
      // One day past the overflow point keeps the exact arithmetic.
      expect(DateUtils.addDays(overflow, 1)).assertEqual(2147570047000);
      // The crossed value renders beyond the 2038 boundary instant.
      expect(DateUtils.toUtc(DateUtils.addDays(overflow, 1)).substring(0, 4)).assertEqual('2038');
      // One day before the overflow point stays inside the boundary.
      expect(DateUtils.addDays(overflow, -1)).assertEqual(overflow - DAY_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_3900
     * @tc.name      testNumDate0039
     * @tc.desc      Verify addDays shifts a locally built January thirty first across the month boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0039';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The January thirty first noon is built through the local platform constructor.
      const stamp: number = new Date(2024, 0, 31, 12, 0, 0).getTime();
      // One day lands exactly on the first of February.
      expect(datePartOracle(DateUtils.addDays(stamp, 1))).assertEqual('2024-02-01');
      // Two days land on the second of February.
      expect(datePartOracle(DateUtils.addDays(stamp, 2))).assertEqual('2024-02-02');
      // The clock parts survive the month boundary shift.
      expect(DateUtils.format(DateUtils.addDays(stamp, 1), 'HH:mm:ss')).assertEqual('12:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_4000
     * @tc.name      testNumDate0040
     * @tc.desc      Verify addDays reaches the leap day from February twenty eighth and skips it in a common year.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0040';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The leap year February twenty eighth is built locally.
      const leapStamp: number = new Date(2024, 1, 28, 12, 0, 0).getTime();
      // One day in the leap year lands on February twenty ninth.
      expect(datePartOracle(DateUtils.addDays(leapStamp, 1))).assertEqual('2024-02-29');
      // Two days in the leap year land on the first of March.
      expect(datePartOracle(DateUtils.addDays(leapStamp, 2))).assertEqual('2024-03-01');
      // One day in the common year 2023 skips straight to March first.
      const commonStamp: number = new Date(2023, 1, 28, 12, 0, 0).getTime();
      expect(datePartOracle(DateUtils.addDays(commonStamp, 1))).assertEqual('2023-03-01');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_4100
     * @tc.name      testNumDate0041
     * @tc.desc      Verify addDays with three hundred sixty five days moves exactly one common year of milliseconds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0041';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A fixed anchor stamp keeps the arithmetic assertions exact.
      const anchor: number = 1704067200000;
      // Three hundred sixty five days add the exact year of milliseconds.
      expect(DateUtils.addDays(anchor, 365)).assertEqual(anchor + 365 * DAY_MS);
      // The same shift expressed as one large unit agrees exactly.
      expect(DateUtils.addDays(anchor, 365)).assertEqual(anchor + 31536000000);
      // Negative three hundred sixty five days subtracts the same unit.
      expect(DateUtils.addDays(anchor, -365)).assertEqual(anchor - 31536000000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_4200
     * @tc.name      testNumDate0042
     * @tc.desc      Verify addDays with ten thousand days applies the exact large millisecond shift.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumDate0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumDate0042';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A fixed anchor stamp keeps the arithmetic assertions exact.
      const anchor: number = 1000000000000;
      // Ten thousand days add the exact large unit.
      expect(DateUtils.addDays(anchor, 10000)).assertEqual(anchor + 864000000000);
      // The shifted value stays well beyond the anchor.
      expect(DateUtils.addDays(anchor, 10000) > anchor).assertTrue();
      // The reverse shift cancels the forward shift exactly.
      expect(DateUtils.addDays(DateUtils.addDays(anchor, 10000), -10000)).assertEqual(anchor);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_4300
     * @tc.name      testNumDate0043
     * @tc.desc      Verify addMonths with zero months returns the original timestamp unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0043';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A fixed anchor stamp keeps the arithmetic assertions exact.
      const anchor: number = 1709164800000;
      // Zero months must return the anchor unchanged.
      expect(DateUtils.addMonths(anchor, 0)).assertEqual(anchor);
      // Repeating the zero month shift stays exact.
      expect(DateUtils.addMonths(anchor, 0)).assertEqual(DateUtils.addMonths(anchor, 0));
      // The epoch zero also stays unchanged for zero months.
      expect(DateUtils.addMonths(0, 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_4400
     * @tc.name      testNumDate0044
     * @tc.desc      Verify addMonths shifts a locally built mid January instant to mid February of the same year.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0044';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The mid January noon is built through the local platform constructor.
      const stamp: number = new Date(2024, 0, 15, 12, 0, 0).getTime();
      // One month keeps the day of month on February fifteenth.
      expect(datePartOracle(DateUtils.addMonths(stamp, 1))).assertEqual('2024-02-15');
      // Two months land on March fifteenth.
      expect(datePartOracle(DateUtils.addMonths(stamp, 2))).assertEqual('2024-03-15');
      // The clock parts survive the month shift.
      expect(DateUtils.format(DateUtils.addMonths(stamp, 1), 'HH:mm:ss')).assertEqual('12:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_4500
     * @tc.name      testNumDate0045
     * @tc.desc      Verify addMonths with twelve months moves a locally built instant one year ahead.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0045';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The mid January noon is built through the local platform constructor.
      const stamp: number = new Date(2024, 0, 15, 12, 0, 0).getTime();
      // Twelve months land on the same day one year later.
      expect(datePartOracle(DateUtils.addMonths(stamp, 12))).assertEqual('2025-01-15');
      // Twenty four months land two years later.
      expect(datePartOracle(DateUtils.addMonths(stamp, 24))).assertEqual('2026-01-15');
      // The clock parts survive the year crossing.
      expect(DateUtils.format(DateUtils.addMonths(stamp, 12), 'HH:mm:ss')).assertEqual('12:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_4600
     * @tc.name      testNumDate0046
     * @tc.desc      Verify addMonths with a negative month moves a locally built instant back across the year boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0046';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The mid January noon is built through the local platform constructor.
      const stamp: number = new Date(2024, 0, 15, 12, 0, 0).getTime();
      // One negative month lands on December fifteenth of 2023.
      expect(datePartOracle(DateUtils.addMonths(stamp, -1))).assertEqual('2023-12-15');
      // Two negative months land on November fifteenth of 2023.
      expect(datePartOracle(DateUtils.addMonths(stamp, -2))).assertEqual('2023-11-15');
      // The clock parts survive the backward shift.
      expect(DateUtils.format(DateUtils.addMonths(stamp, -1), 'HH:mm:ss')).assertEqual('12:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_4700
     * @tc.name      testNumDate0047
     * @tc.desc      Verify addMonths normalizes the January thirty first overflow into March second in the leap year 2024.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0047';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The January thirty first noon is built through the local platform constructor.
      const stamp: number = new Date(2024, 0, 31, 12, 0, 0).getTime();
      // The leap year February holds twenty nine days, so day thirty one spills into March.
      expect(datePartOracle(DateUtils.addMonths(stamp, 1))).assertEqual('2024-03-02');
      // The spilled result stays in the March month of 2024.
      const shifted: number = DateUtils.addMonths(stamp, 1);
      expect(new Date(shifted).getMonth()).assertEqual(2);
      // The clock parts survive the overflow normalization.
      expect(DateUtils.format(shifted, 'HH:mm:ss')).assertEqual('12:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_4800
     * @tc.name      testNumDate0048
     * @tc.desc      Verify addMonths normalizes the January thirty first overflow into March third in the common year 2023.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0048';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The January thirty first noon is built through the local platform constructor.
      const stamp: number = new Date(2023, 0, 31, 12, 0, 0).getTime();
      // The common year February holds twenty eight days, so day thirty one spills further.
      expect(datePartOracle(DateUtils.addMonths(stamp, 1))).assertEqual('2023-03-03');
      // The spilled result stays in the March month of 2023.
      const shifted: number = DateUtils.addMonths(stamp, 1);
      expect(new Date(shifted).getMonth()).assertEqual(2);
      // The leap year result differs from the common year result.
      expect(datePartOracle(DateUtils.addMonths(new Date(2024, 0, 31, 12, 0, 0).getTime(), 1)))
        .not().assertEqual(datePartOracle(shifted));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_4900
     * @tc.name      testNumDate0049
     * @tc.desc      Verify addMonths of twelve months from the 2024 leap day normalizes into March first of 2025.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0049';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 2024 leap day noon is built through the local platform constructor.
      const stamp: number = new Date(2024, 1, 29, 12, 0, 0).getTime();
      // The common year 2025 has no February twenty ninth, so the day spills into March.
      expect(datePartOracle(DateUtils.addMonths(stamp, 12))).assertEqual('2025-03-01');
      // The spilled result stays in the March month of 2025.
      const shifted: number = DateUtils.addMonths(stamp, 12);
      expect(new Date(shifted).getMonth()).assertEqual(2);
      expect(new Date(shifted).getFullYear()).assertEqual(2025);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_5000
     * @tc.name      testNumDate0050
     * @tc.desc      Verify addMonths of one negative month from May thirty first normalizes into May first.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0050';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The May thirty first noon is built through the local platform constructor.
      const stamp: number = new Date(2024, 4, 31, 12, 0, 0).getTime();
      // April holds thirty days, so day thirty one spills back into May.
      expect(datePartOracle(DateUtils.addMonths(stamp, -1))).assertEqual('2024-05-01');
      // The spilled result stays in the May month of 2024.
      const shifted: number = DateUtils.addMonths(stamp, -1);
      expect(new Date(shifted).getMonth()).assertEqual(4);
      // Two negative months land on March thirty first instead.
      expect(datePartOracle(DateUtils.addMonths(stamp, -2))).assertEqual('2024-03-31');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_5100
     * @tc.name      testNumDate0051
     * @tc.desc      Verify addMonths with one thousand two hundred months moves a locally built instant one century ahead.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumDate0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumDate0051';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The mid January noon is built through the local platform constructor.
      const stamp: number = new Date(2024, 0, 15, 12, 0, 0).getTime();
      // One thousand two hundred months equal exactly one hundred years.
      const shifted: number = DateUtils.addMonths(stamp, 1200);
      // The shifted year reads 2124.
      expect(new Date(shifted).getFullYear()).assertEqual(2124);
      // The day of month survives the century shift.
      expect(new Date(shifted).getDate()).assertEqual(15);
      // The reverse shift returns to the original year.
      expect(new Date(DateUtils.addMonths(shifted, -1200)).getFullYear()).assertEqual(2024);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_5200
     * @tc.name      testNumDate0052
     * @tc.desc      Verify addMonths preserves every clock part of a locally built afternoon instant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0052';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The afternoon instant carries non zero clock parts.
      const stamp: number = new Date(2024, 0, 15, 13, 45, 59).getTime();
      // The month shift preserves the full clock reading.
      expect(DateUtils.format(DateUtils.addMonths(stamp, 1), 'HH:mm:ss')).assertEqual('13:45:59');
      // The backward month shift preserves the same clock reading.
      expect(DateUtils.format(DateUtils.addMonths(stamp, -1), 'HH:mm:ss')).assertEqual('13:45:59');
      // The date part after one month stays on the fifteenth.
      expect(datePartOracle(DateUtils.addMonths(stamp, 1))).assertEqual('2024-02-15');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_5300
     * @tc.name      testNumDate0053
     * @tc.desc      Verify diffDays of one timestamp against itself returns zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0053';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A fixed anchor stamp keeps the calendar assertions exact.
      const anchor: number = 1709164800000;
      // The identical instants have zero calendar day difference.
      expect(DateUtils.diffDays(anchor, anchor)).assertEqual(0);
      // The epoch zero against itself also returns zero.
      expect(DateUtils.diffDays(0, 0)).assertEqual(0);
      // The difference never becomes negative for identical instants.
      expect(DateUtils.diffDays(anchor, anchor) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_5400
     * @tc.name      testNumDate0054
     * @tc.desc      Verify diffDays of two instants inside one local calendar day returns zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0054';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The leap day midnight and day end live in the same calendar day.
      const start: number = new Date(2024, 1, 29, 0, 0, 0).getTime();
      const end: number = new Date(2024, 1, 29, 23, 59, 59).getTime();
      // Both instants sit in the same calendar day.
      expect(DateUtils.diffDays(start, end)).assertEqual(0);
      // The symmetric call returns the same zero difference.
      expect(DateUtils.diffDays(end, start)).assertEqual(0);
      // The helper agrees with the same day predicate on this pair.
      expect(DateUtils.isSameDay(start, end)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_5500
     * @tc.name      testNumDate0055
     * @tc.desc      Verify diffDays of two consecutive local days returns one in both argument orders.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0055';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two consecutive noons are built through the local platform constructor.
      const first: number = new Date(2024, 0, 1, 12, 0, 0).getTime();
      const second: number = new Date(2024, 0, 2, 12, 0, 0).getTime();
      // One calendar day separates the two noons.
      expect(DateUtils.diffDays(first, second)).assertEqual(1);
      // The symmetric call returns the same non negative difference.
      expect(DateUtils.diffDays(second, first)).assertEqual(1);
      // The difference stays non negative in both orders.
      expect(DateUtils.diffDays(first, second) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_5600
     * @tc.name      testNumDate0056
     * @tc.desc      Verify diffDays counts fourteen calendar days between the first and fifteenth of January 2024.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0056';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two January noons span fourteen calendar days.
      const first: number = new Date(2024, 0, 1, 12, 0, 0).getTime();
      const second: number = new Date(2024, 0, 15, 12, 0, 0).getTime();
      // Fourteen calendar days separate the two noons.
      expect(DateUtils.diffDays(first, second)).assertEqual(14);
      // The symmetric call returns the same difference.
      expect(DateUtils.diffDays(second, first)).assertEqual(14);
      // The day arithmetic agrees with the millisecond day unit.
      expect(DateUtils.diffDays(first, second)).assertEqual((second - first) / DAY_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_5700
     * @tc.name      testNumDate0057
     * @tc.desc      Verify diffDays counts one calendar day across the January February month boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0057';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The month boundary pair spans January thirty first to February first.
      const first: number = new Date(2024, 0, 31, 12, 0, 0).getTime();
      const second: number = new Date(2024, 1, 1, 12, 0, 0).getTime();
      // One calendar day separates the two noons.
      expect(DateUtils.diffDays(first, second)).assertEqual(1);
      // The symmetric call returns the same difference.
      expect(DateUtils.diffDays(second, first)).assertEqual(1);
      // The millisecond difference equals one day unit exactly.
      expect(second - first).assertEqual(DAY_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_5800
     * @tc.name      testNumDate0058
     * @tc.desc      Verify diffDays counts three hundred sixty five calendar days across the common year 2023.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0058';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The new year pair spans 2023 to 2024 across a common year.
      const first: number = new Date(2023, 0, 1, 12, 0, 0).getTime();
      const second: number = new Date(2024, 0, 1, 12, 0, 0).getTime();
      // Three hundred sixty five calendar days separate the noons.
      expect(DateUtils.diffDays(first, second)).assertEqual(365);
      // The symmetric call returns the same difference.
      expect(DateUtils.diffDays(second, first)).assertEqual(365);
      // The difference equals the common year millisecond total.
      expect(DateUtils.diffDays(first, second)).assertEqual(31536000000 / DAY_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_5900
     * @tc.name      testNumDate0059
     * @tc.desc      Verify diffDays counts three hundred sixty six calendar days across the leap year 2024.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0059';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The new year pair spans 2024 to 2025 across a leap year.
      const first: number = new Date(2024, 0, 1, 12, 0, 0).getTime();
      const second: number = new Date(2025, 0, 1, 12, 0, 0).getTime();
      // Three hundred sixty six calendar days separate the noons.
      expect(DateUtils.diffDays(first, second)).assertEqual(366);
      // The symmetric call returns the same difference.
      expect(DateUtils.diffDays(second, first)).assertEqual(366);
      // The leap year span exceeds the common year span by one day.
      expect(DateUtils.diffDays(first, second))
        .assertEqual(DateUtils.diffDays(new Date(2023, 0, 1, 12, 0, 0).getTime(), first) + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_6000
     * @tc.name      testNumDate0060
     * @tc.desc      Verify diffDays counts two calendar days from February twenty eighth across the 2024 leap day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0060';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The leap boundary pair spans February twenty eighth to March first 2024.
      const first: number = new Date(2024, 1, 28, 12, 0, 0).getTime();
      const second: number = new Date(2024, 2, 1, 12, 0, 0).getTime();
      // Two calendar days separate the noons because the leap day is included.
      expect(DateUtils.diffDays(first, second)).assertEqual(2);
      // The symmetric call returns the same difference.
      expect(DateUtils.diffDays(second, first)).assertEqual(2);
      // The common year pair without the leap day spans one day only.
      expect(DateUtils.diffDays(new Date(2023, 1, 28, 12, 0, 0).getTime(), new Date(2023, 2, 1, 12, 0, 0).getTime()))
        .assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_6100
     * @tc.name      testNumDate0061
     * @tc.desc      Verify diffDays counts one calendar day between the two epoch days of 1970.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0061';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The epoch pair uses the numeric matrix points zero and one day.
      const first: number = 0;
      const second: number = DAY_MS;
      // One calendar day separates the two epoch days.
      expect(DateUtils.diffDays(first, second)).assertEqual(1);
      // The symmetric call returns the same difference.
      expect(DateUtils.diffDays(second, first)).assertEqual(1);
      // The pre epoch day also differs by one day from the epoch.
      expect(DateUtils.diffDays(-DAY_MS, 0)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_6200
     * @tc.name      testNumDate0062
     * @tc.desc      Verify diffDays counts one calendar day across the 2038 overflow day boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0062';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 2038 overflow pair spans January nineteenth to twentieth.
      const first: number = Date.UTC(2038, 0, 19);
      const second: number = Date.UTC(2038, 0, 20);
      // One calendar day separates the two UTC days.
      expect(DateUtils.diffDays(first, second)).assertEqual(1);
      // The symmetric call returns the same difference.
      expect(DateUtils.diffDays(second, first)).assertEqual(1);
      // The millisecond difference equals one day unit exactly.
      expect(second - first).assertEqual(DAY_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_6300
     * @tc.name      testNumDate0063
     * @tc.desc      Verify isSameDay of one timestamp against itself returns true.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0063';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A fixed anchor stamp keeps the predicate assertions exact.
      const anchor: number = 1709164800000;
      // The identical instants share one calendar day.
      expect(DateUtils.isSameDay(anchor, anchor)).assertTrue();
      // The epoch zero against itself also returns true.
      expect(DateUtils.isSameDay(0, 0)).assertTrue();
      // The symmetric call keeps the same positive result.
      expect(DateUtils.isSameDay(anchor, anchor)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_6400
     * @tc.name      testNumDate0064
     * @tc.desc      Verify isSameDay matches the midnight and day end instants of one local calendar day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0064';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The leap day boundary instants live in the same calendar day.
      const start: number = new Date(2024, 1, 29, 0, 0, 0).getTime();
      const end: number = new Date(2024, 1, 29, 23, 59, 59).getTime();
      // Both instants sit in the same calendar day.
      expect(DateUtils.isSameDay(start, end)).assertTrue();
      // The symmetric call keeps the same result.
      expect(DateUtils.isSameDay(end, start)).assertTrue();
      // The calendar difference stays zero for this pair.
      expect(DateUtils.diffDays(start, end)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_6500
     * @tc.name      testNumDate0065
     * @tc.desc      Verify isSameDay separates the instants on both sides of the 2024 leap day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0065';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The three leap boundary days are built locally.
      const before: number = new Date(2024, 1, 28, 12, 0, 0).getTime();
      const leap: number = new Date(2024, 1, 29, 12, 0, 0).getTime();
      const after: number = new Date(2024, 2, 1, 12, 0, 0).getTime();
      // The day before the leap day differs from the leap day.
      expect(DateUtils.isSameDay(before, leap)).assertFalse();
      // The leap day differs from the day after it.
      expect(DateUtils.isSameDay(leap, after)).assertFalse();
      // Each symmetric call keeps the same negative result.
      expect(DateUtils.isSameDay(leap, before)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_6600
     * @tc.name      testNumDate0066
     * @tc.desc      Verify isSameDay separates the year boundary instants of 2023 and 2024.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0066';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The year boundary instants are one second apart across midnight.
      const lastMoment: number = new Date(2023, 11, 31, 23, 59, 59).getTime();
      const firstMoment: number = new Date(2024, 0, 1, 0, 0, 0).getTime();
      // The two instants sit in different calendar days.
      expect(DateUtils.isSameDay(lastMoment, firstMoment)).assertFalse();
      // The calendar difference counts exactly one day.
      expect(DateUtils.diffDays(lastMoment, firstMoment)).assertEqual(1);
      // The symmetric call keeps the same negative result.
      expect(DateUtils.isSameDay(firstMoment, lastMoment)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_6700
     * @tc.name      testNumDate0067
     * @tc.desc      Verify isSameDay separates two days of the same month and year.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0067';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two January days differ only in the day of month part.
      const first: number = new Date(2024, 0, 30, 12, 0, 0).getTime();
      const second: number = new Date(2024, 0, 31, 12, 0, 0).getTime();
      // The two instants sit in different calendar days.
      expect(DateUtils.isSameDay(first, second)).assertFalse();
      // The calendar difference counts exactly one day.
      expect(DateUtils.diffDays(first, second)).assertEqual(1);
      // The symmetric call keeps the same negative result.
      expect(DateUtils.isSameDay(second, first)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_6800
     * @tc.name      testNumDate0068
     * @tc.desc      Verify isSameDay separates the same month and day of two different years.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0068';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two January fifteenth noons differ only in the year part.
      const first: number = new Date(2023, 0, 15, 12, 0, 0).getTime();
      const second: number = new Date(2024, 0, 15, 12, 0, 0).getTime();
      // The two instants sit in different calendar days.
      expect(DateUtils.isSameDay(first, second)).assertFalse();
      // The calendar difference counts three hundred sixty five days.
      expect(DateUtils.diffDays(first, second)).assertEqual(365);
      // The symmetric call keeps the same negative result.
      expect(DateUtils.isSameDay(second, first)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_6900
     * @tc.name      testNumDate0069
     * @tc.desc      Verify isSameDay matches the different clock instants inside the 2024 leap day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumDate0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumDate0069';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two leap day instants differ only in the clock parts.
      const morning: number = new Date(2024, 1, 29, 8, 0, 0).getTime();
      const evening: number = new Date(2024, 1, 29, 20, 30, 45).getTime();
      // Both instants sit in the same calendar day.
      expect(DateUtils.isSameDay(morning, evening)).assertTrue();
      // The symmetric call keeps the same positive result.
      expect(DateUtils.isSameDay(evening, morning)).assertTrue();
      // The calendar difference stays zero for this pair.
      expect(DateUtils.diffDays(morning, evening)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_7000
     * @tc.name      testNumDate0070
     * @tc.desc      Verify isSameDay and diffDays agree on same day pairs and consecutive day pairs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumDate0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumDate0070';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A same day pair and a consecutive day pair anchor the consistency checks.
      const sameStart: number = new Date(2024, 5, 10, 6, 0, 0).getTime();
      const sameEnd: number = new Date(2024, 5, 10, 22, 0, 0).getTime();
      const nextDay: number = new Date(2024, 5, 11, 6, 0, 0).getTime();
      // The same day pair reports true and zero.
      expect(DateUtils.isSameDay(sameStart, sameEnd)).assertTrue();
      expect(DateUtils.diffDays(sameStart, sameEnd)).assertEqual(0);
      // The consecutive pair reports false and one.
      expect(DateUtils.isSameDay(sameStart, nextDay)).assertFalse();
      expect(DateUtils.diffDays(sameStart, nextDay)).assertEqual(1);
      // Every diffDays result stays non negative.
      expect(DateUtils.diffDays(nextDay, sameStart) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_7100
     * @tc.name      testNumDate0071
     * @tc.desc      Verify the combined matrix of now, toUtc and format keeps consistent structures on the current instant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumDate0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumDate0071';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The current instant feeds every helper in this combined sanity case.
      const current: number = DateUtils.now();
      const utc: string = DateUtils.toUtc(current);
      const local: string = DateUtils.format(current, 'yyyy-MM-dd HH:mm:ss');
      // The ISO render keeps the fixed twenty four character width.
      expect(utc.length).assertEqual(24);
      // The ISO render ends with the UTC marker.
      expect(utc.substring(23, 24)).assertEqual('Z');
      // The local render matches the platform reading of the same instant.
      expect(local).assertEqual(localOracle(current));
      // The current instant sits beyond the year 2023 matrix point.
      expect(current > 1672531200000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_DATE_7200
     * @tc.name      testNumDate0072
     * @tc.desc      Verify format and addDays treat the century year 2100 February as a common year boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumDate0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumDate0072';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The century year 2100 is divisible by one hundred but not by four hundred.
      const stamp: number = new Date(2100, 1, 28, 12, 0, 0).getTime();
      // One day lands on March first because February holds twenty eight days.
      expect(datePartOracle(DateUtils.addDays(stamp, 1))).assertEqual('2100-03-01');
      // The compact render spells the century February end.
      expect(DateUtils.format(stamp, 'yyyyMMdd')).assertEqual('21000228');
      // The full render matches the platform reading of the same instant.
      expect(DateUtils.format(stamp, 'yyyy-MM-dd HH:mm:ss')).assertEqual(localOracle(stamp));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
