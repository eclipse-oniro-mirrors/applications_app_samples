/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DateUtils } from 'library';

const SAMPLE: Date = new Date(2024, 0, 5, 8, 9, 10, 0);

/**
 * Test suite for DateUtils.
 * @since 26.0.0
 */
export default function dateUtilsTest(): void {
  describe('DateUtilsTest', () => {
    // ==================== timestamp format (4 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_0100
     * @tc.name: testDateUtils0001
     * @tc.desc: Format a timestamp with the default date and time pattern.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0001', 'begin');
      const text: string = DateUtils.formatTimestamp(SAMPLE.getTime());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0001',
        '#1 ' + "text" + ' = ' + JSON.stringify(text));
      expect(text).assertEqual('2024-01-05 08:09:10');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0001',
        '#2 ' + "text.length" + ' = ' + JSON.stringify(text.length));
      expect(text.length).assertEqual(19);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0001',
        '#3 assert ' + "expect(text.charAt(4)).assertEqual('-')");
      expect(text.charAt(4)).assertEqual('-');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0001',
        '#4 assert ' + "expect(text.charAt(10)).assertEqual(' ')");
      expect(text.charAt(10)).assertEqual(' ');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0001', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_0200
     * @tc.name: testDateUtils0002
     * @tc.desc: Format a timestamp with a caller supplied pattern.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0002', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0002', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0002',
        '#1 assert ' + "expect(DateUtils.formatTimestamp(SAMPLE.getTime(), 'yyyy/MM/dd')).assertEqual('2024/01/05')");
      expect(DateUtils.formatTimestamp(SAMPLE.getTime(), 'yyyy/MM/dd')).assertEqual('2024/01/05');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0002',
        '#2 assert ' + "expect(DateUtils.formatTimestamp(SAMPLE.getTime(), 'HH:mm')).assertEqual('08:09')");
      expect(DateUtils.formatTimestamp(SAMPLE.getTime(), 'HH:mm')).assertEqual('08:09');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0002',
        '#3 assert ' + "expect(DateUtils.formatTimestamp(SAMPLE.getTime(), 'dd-MM-yyyy')).assertEqual('05-01-2024')");
      expect(DateUtils.formatTimestamp(SAMPLE.getTime(), 'dd-MM-yyyy')).assertEqual('05-01-2024');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0002', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_0300
     * @tc.name: testDateUtils0003
     * @tc.desc: Pad single digit month, day, hour and minute fields.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0003', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0003', 'begin');
      const early: Date = new Date(2024, 1, 3, 1, 2, 3, 0);
      const text: string = DateUtils.formatTimestamp(early.getTime());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0003',
        '#1 ' + "text" + ' = ' + JSON.stringify(text));
      expect(text).assertEqual('2024-02-03 01:02:03');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0003',
        '#2 assert ' + "expect(text.indexOf('-02-03') > 0).assertTrue()");
      expect(text.indexOf('-02-03') > 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0003',
        '#3 assert ' + "expect(DateUtils.formatTimestamp(early.getTime(), 'yyyy')).assertEqual('2024')");
      expect(DateUtils.formatTimestamp(early.getTime(), 'yyyy')).assertEqual('2024');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0003', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_0400
     * @tc.name: testDateUtils0004
     * @tc.desc: Format the epoch timestamp and a negative timestamp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0004', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0004', 'begin');
      const epoch: string = DateUtils.formatTimestamp(0, 'HH:mm:ss');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0004',
        '#1 ' + "epoch.length" + ' = ' + JSON.stringify(epoch.length));
      expect(epoch.length).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0004',
        '#2 assert ' + "expect(epoch.charAt(2)).assertEqual(':')");
      expect(epoch.charAt(2)).assertEqual(':');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0004',
        '#3 assert ' + "expect(epoch.charAt(5)).assertEqual(':')");
      expect(epoch.charAt(5)).assertEqual(':');
      const before: string = DateUtils.formatTimestamp(-1000, 'ss');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0004',
        '#4 ' + "before.length" + ' = ' + JSON.stringify(before.length));
      expect(before.length).assertEqual(2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0004', 'end');
    });

    // ==================== current time and difference value (3 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_0500
     * @tc.name: testDateUtils0005
     * @tc.desc: Return the current time close to the system clock.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0005', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0005', 'begin');
      const before: number = Date.now();
      const value: number = DateUtils.now();
      const after: number = Date.now();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0005',
        '#1 ' + "value >= before" + ' = ' + JSON.stringify(value >= before));
      expect(value >= before).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0005',
        '#2 ' + "value <= after + 1" + ' = ' + JSON.stringify(value <= after + 1));
      expect(value <= after + 1).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0005',
        '#3 assert ' + "expect(DateUtils.now() >= value).assertTrue()");
      expect(DateUtils.now() >= value).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0005',
        '#4 assert ' + "expect(Number.isInteger(value)).assertTrue()");
      expect(Number.isInteger(value)).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0005', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_0600
     * @tc.name: testDateUtils0006
     * @tc.desc: Measure the absolute distance between two timestamps.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0006', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0006', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0006',
        '#1 assert ' + "expect(DateUtils.diff(1000, 3500)).assertEqual(2500)");
      expect(DateUtils.diff(1000, 3500)).assertEqual(2500);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0006',
        '#2 assert ' + "expect(DateUtils.diff(3500, 1000)).assertEqual(2500)");
      expect(DateUtils.diff(3500, 1000)).assertEqual(2500);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0006',
        '#3 assert ' + "expect(DateUtils.diff(7, 7)).assertEqual(0)");
      expect(DateUtils.diff(7, 7)).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0006', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_0700
     * @tc.name: testDateUtils0007
     * @tc.desc: Keep diff monotonic for large timestamp distances.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0007', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0007', 'begin');
      const day: number = 86400000;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0007',
        '#1 assert ' + "expect(DateUtils.diff(0, day)).assertEqual(day)");
      expect(DateUtils.diff(0, day)).assertEqual(day);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0007',
        '#2 assert ' + "expect(DateUtils.diff(day, day * 7)).assertEqual(day * 6)");
      expect(DateUtils.diff(day, day * 7)).assertEqual(day * 6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0007',
        '#3 assert ' + "expect(DateUtils.diff(-day, day) > day).assertTrue()");
      expect(DateUtils.diff(-day, day) > day).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0007', 'end');
    });

    // ==================== time length format (4 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_0800
     * @tc.name: testDateUtils0008
     * @tc.desc: Format durations below one minute as whole seconds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0008', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0008', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0008',
        '#1 assert ' + "expect(DateUtils.formatDuration(0)).assertEqual('0s')");
      expect(DateUtils.formatDuration(0)).assertEqual('0s');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0008',
        '#2 assert ' + "expect(DateUtils.formatDuration(999)).assertEqual('0s')");
      expect(DateUtils.formatDuration(999)).assertEqual('0s');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0008',
        '#3 assert ' + "expect(DateUtils.formatDuration(1000)).assertEqual('1s')");
      expect(DateUtils.formatDuration(1000)).assertEqual('1s');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0008',
        '#4 assert ' + "expect(DateUtils.formatDuration(59999)).assertEqual('59s')");
      expect(DateUtils.formatDuration(59999)).assertEqual('59s');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0008', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_0900
     * @tc.name: testDateUtils0009
     * @tc.desc: Format durations of minutes with the remaining seconds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0009', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0009', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0009',
        '#1 assert ' + "expect(DateUtils.formatDuration(60000)).assertEqual('1m 0s')");
      expect(DateUtils.formatDuration(60000)).assertEqual('1m 0s');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0009',
        '#2 assert ' + "expect(DateUtils.formatDuration(90000)).assertEqual('1m 30s')");
      expect(DateUtils.formatDuration(90000)).assertEqual('1m 30s');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0009',
        '#3 assert ' + "expect(DateUtils.formatDuration(3599999)).assertEqual('59m 59s')");
      expect(DateUtils.formatDuration(3599999)).assertEqual('59m 59s');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0009', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_1000
     * @tc.name: testDateUtils0010
     * @tc.desc: Format durations of hours and days with the reduced fields.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0010', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0010', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0010',
        '#1 assert ' + "expect(DateUtils.formatDuration(3600000)).assertEqual('1h 0m 0s')");
      expect(DateUtils.formatDuration(3600000)).assertEqual('1h 0m 0s');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0010',
        '#2 assert ' + "expect(DateUtils.formatDuration(3661000)).assertEqual('1h 1m 1s')");
      expect(DateUtils.formatDuration(3661000)).assertEqual('1h 1m 1s');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0010',
        '#3 assert ' + "expect(DateUtils.formatDuration(86400000)).assertEqual('1d 0h 0m')");
      expect(DateUtils.formatDuration(86400000)).assertEqual('1d 0h 0m');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0010',
        '#4 assert ' + "expect(DateUtils.formatDuration(90061000)).assertEqual('1d 1h 1m')");
      expect(DateUtils.formatDuration(90061000)).assertEqual('1d 1h 1m');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0010', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_1100
     * @tc.name: testDateUtils0011
     * @tc.desc: Clamp a negative duration to the zero second text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0011', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0011', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0011',
        '#1 assert ' + "expect(DateUtils.formatDuration(-1)).assertEqual('0s')");
      expect(DateUtils.formatDuration(-1)).assertEqual('0s');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0011',
        '#2 assert ' + "expect(DateUtils.formatDuration(-100000)).assertEqual('0s')");
      expect(DateUtils.formatDuration(-100000)).assertEqual('0s');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0011',
        '#3 assert ' + "expect(DateUtils.formatDuration(-1)).assertEqual(DateUtils.formatDuration(0))");
      expect(DateUtils.formatDuration(-1)).assertEqual(DateUtils.formatDuration(0));
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0011', 'end');
    });

    // ==================== month copy and star period name name (3 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_1200
     * @tc.name: testDateUtils0012
     * @tc.desc: Resolve month names for the first and last valid index.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0012', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0012', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0012',
        '#1 assert ' + "expect(DateUtils.getMonthName(0)).assertEqual('January')");
      expect(DateUtils.getMonthName(0)).assertEqual('January');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0012',
        '#2 assert ' + "expect(DateUtils.getMonthName(11)).assertEqual('December')");
      expect(DateUtils.getMonthName(11)).assertEqual('December');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0012',
        '#3 assert ' + "expect(DateUtils.getMonthName(1)).assertEqual('February')");
      expect(DateUtils.getMonthName(1)).assertEqual('February');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0012',
        '#4 assert ' + "expect(DateUtils.getMonthName(6)).assertEqual('July')");
      expect(DateUtils.getMonthName(6)).assertEqual('July');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0012', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_1300
     * @tc.name: testDateUtils0013
     * @tc.desc: Return Unknown for month indexes outside the range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0013', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0013', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0013',
        '#1 assert ' + "expect(DateUtils.getMonthName(-1)).assertEqual('Unknown')");
      expect(DateUtils.getMonthName(-1)).assertEqual('Unknown');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0013',
        '#2 assert ' + "expect(DateUtils.getMonthName(12)).assertEqual('Unknown')");
      expect(DateUtils.getMonthName(12)).assertEqual('Unknown');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0013',
        '#3 assert ' + "expect(DateUtils.getMonthName(100)).assertEqual('Unknown')");
      expect(DateUtils.getMonthName(100)).assertEqual('Unknown');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0013',
        '#4 assert ' + "expect(DateUtils.getMonthName(11).length > 0).assertTrue()");
      expect(DateUtils.getMonthName(11).length > 0).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0013', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_1400
     * @tc.name: testDateUtils0014
     * @tc.desc: Resolve day names by index and reject out of range indexes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0014', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0014', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0014',
        '#1 assert ' + "expect(DateUtils.getDayName(0)).assertEqual('Sunday')");
      expect(DateUtils.getDayName(0)).assertEqual('Sunday');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0014',
        '#2 assert ' + "expect(DateUtils.getDayName(6)).assertEqual('Saturday')");
      expect(DateUtils.getDayName(6)).assertEqual('Saturday');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0014',
        '#3 assert ' + "expect(DateUtils.getDayName(1)).assertEqual('Monday')");
      expect(DateUtils.getDayName(1)).assertEqual('Monday');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0014',
        '#4 assert ' + "expect(DateUtils.getDayName(7)).assertEqual('Unknown')");
      expect(DateUtils.getDayName(7)).assertEqual('Unknown');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0014',
        '#5 assert ' + "expect(DateUtils.getDayName(-1)).assertEqual('Unknown')");
      expect(DateUtils.getDayName(-1)).assertEqual('Unknown');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0014', 'end');
    });

    // ==================== today and yesterday (3 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_1500
     * @tc.name: testDateUtils0015
     * @tc.desc: Recognize the current moment as today and not as yesterday.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0015', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0015', 'begin');
      const noon: Date = new Date();
      noon.setHours(12, 0, 0, 0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0015',
        '#1 assert ' + "expect(DateUtils.isToday(noon.getTime())).assertTrue()");
      expect(DateUtils.isToday(noon.getTime())).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0015',
        '#2 assert ' + "expect(DateUtils.isYesterday(noon.getTime())).assertFalse()");
      expect(DateUtils.isYesterday(noon.getTime())).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0015',
        '#3 assert ' + "expect(DateUtils.isToday(DateUtils.now())).assertTrue()");
      expect(DateUtils.isToday(DateUtils.now())).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0015', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_1600
     * @tc.name: testDateUtils0016
     * @tc.desc: Recognize the previous calendar day as yesterday.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0016', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0016', 'begin');
      const yesterday: Date = new Date();
      yesterday.setDate(yesterday.getDate() - 1);
      yesterday.setHours(12, 0, 0, 0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0016',
        '#1 assert ' + "expect(DateUtils.isYesterday(yesterday.getTime())).assertTrue()");
      expect(DateUtils.isYesterday(yesterday.getTime())).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0016',
        '#2 assert ' + "expect(DateUtils.isToday(yesterday.getTime())).assertFalse()");
      expect(DateUtils.isToday(yesterday.getTime())).assertFalse();
      const twoDaysBack: Date = new Date();
      twoDaysBack.setDate(twoDaysBack.getDate() - 2);
      twoDaysBack.setHours(12, 0, 0, 0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0016',
        '#3 assert ' + "expect(DateUtils.isYesterday(twoDaysBack.getTime())).assertFalse()");
      expect(DateUtils.isYesterday(twoDaysBack.getTime())).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0016', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_1700
     * @tc.name: testDateUtils0017
     * @tc.desc: Reject future timestamps and the epoch day for today checks.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0017', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0017', 'begin');
      const future: number = DateUtils.now() + 86400000;
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0017',
        '#1 assert ' + "expect(DateUtils.isToday(future)).assertFalse()");
      expect(DateUtils.isToday(future)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0017',
        '#2 assert ' + "expect(DateUtils.isToday(0)).assertFalse()");
      expect(DateUtils.isToday(0)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0017',
        '#3 assert ' + "expect(DateUtils.isYesterday(0)).assertFalse()");
      expect(DateUtils.isYesterday(0)).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0017', 'end');
    });

    // ==================== relative time (3 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_1800
     * @tc.name: testDateUtils0018
     * @tc.desc: Describe a recent timestamp as just now.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0018', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0018', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0018',
        '#1 assert ' + "expect(DateUtils.getRelativeTime(DateUtils.now())).assertEqual('just now')");
      expect(DateUtils.getRelativeTime(DateUtils.now())).assertEqual('just now');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0018',
        '#2 assert ' + "expect(DateUtils.getRelativeTime(DateUtils.now() - 30000)).assertEqual('just now')");
      expect(DateUtils.getRelativeTime(DateUtils.now() - 30000)).assertEqual('just now');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0018',
        '#3 assert ' + "expect(DateUtils.getRelativeTime(DateUtils.now()).indexOf('now') > 0).assertTrue()");
      expect(DateUtils.getRelativeTime(DateUtils.now()).indexOf('now') > 0).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0018', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_1900
     * @tc.name: testDateUtils0019
     * @tc.desc: Describe minute and hour offsets with the rounded unit count.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0019', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0019', 'begin');
      const now: number = DateUtils.now();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0019',
        '#1 assert ' + "expect(DateUtils.getRelativeTime(now - 5 * 60000)).assertEqual('5 minutes ago')");
      expect(DateUtils.getRelativeTime(now - 5 * 60000)).assertEqual('5 minutes ago');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0019',
        '#2 assert ' + "expect(DateUtils.getRelativeTime(now - 61 * 60000)).assertEqual('1 hours ago')");
      expect(DateUtils.getRelativeTime(now - 61 * 60000)).assertEqual('1 hours ago');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0019',
        '#3 assert ' + "expect(DateUtils.getRelativeTime(now - 2 * 3600000)).assertEqual('2 hours ago')");
      expect(DateUtils.getRelativeTime(now - 2 * 3600000)).assertEqual('2 hours ago');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0019', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_2000
     * @tc.name: testDateUtils0020
     * @tc.desc: Describe day offsets and fall back to a date for old timestamps.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0020', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0020', 'begin');
      const now: number = DateUtils.now();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0020',
        '#1 assert ' + "expect(DateUtils.getRelativeTime(now - 3 * 86400000)).assertEqual('3 days ago')");
      expect(DateUtils.getRelativeTime(now - 3 * 86400000)).assertEqual('3 days ago');
      const oldText: string = DateUtils.getRelativeTime(now - 40 * 86400000);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0020',
        '#2 ' + "oldText.length" + ' = ' + JSON.stringify(oldText.length));
      expect(oldText.length).assertEqual(10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0020',
        '#3 assert ' + "expect(oldText.charAt(4)).assertEqual('-')");
      expect(oldText.charAt(4)).assertEqual('-');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0020',
        '#4 assert ' + "expect(oldText.indexOf('ago') < 0).assertTrue()");
      expect(oldText.indexOf('ago') < 0).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0020', 'end');
    });

    // ==================== leap year and month day number (3 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_2100
     * @tc.name: testDateUtils0021
     * @tc.desc: Detect leap years by the four hundred year rule.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0021', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0021', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0021',
        '#1 assert ' + "expect(DateUtils.isLeapYear(2024)).assertTrue()");
      expect(DateUtils.isLeapYear(2024)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0021',
        '#2 assert ' + "expect(DateUtils.isLeapYear(2000)).assertTrue()");
      expect(DateUtils.isLeapYear(2000)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0021',
        '#3 assert ' + "expect(DateUtils.isLeapYear(1900)).assertFalse()");
      expect(DateUtils.isLeapYear(1900)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0021',
        '#4 assert ' + "expect(DateUtils.isLeapYear(2023)).assertFalse()");
      expect(DateUtils.isLeapYear(2023)).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0021', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_2200
     * @tc.name: testDateUtils0022
     * @tc.desc: Return the days of February for leap and common years.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0022', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0022', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0022',
        '#1 assert ' + "expect(DateUtils.getDaysInMonth(2024, 1)).assertEqual(29)");
      expect(DateUtils.getDaysInMonth(2024, 1)).assertEqual(29);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0022',
        '#2 assert ' + "expect(DateUtils.getDaysInMonth(2023, 1)).assertEqual(28)");
      expect(DateUtils.getDaysInMonth(2023, 1)).assertEqual(28);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0022',
        '#3 assert ' + "expect(DateUtils.getDaysInMonth(2000, 1)).assertEqual(29)");
      expect(DateUtils.getDaysInMonth(2000, 1)).assertEqual(29);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0022',
        '#4 assert ' + "expect(DateUtils.getDaysInMonth(1900, 1)).assertEqual(28)");
      expect(DateUtils.getDaysInMonth(1900, 1)).assertEqual(28);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0022', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_2300
     * @tc.name: testDateUtils0023
     * @tc.desc: Return the calendar length of each other month.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0023', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0023', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0023',
        '#1 assert ' + "expect(DateUtils.getDaysInMonth(2024, 0)).assertEqual(31)");
      expect(DateUtils.getDaysInMonth(2024, 0)).assertEqual(31);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0023',
        '#2 assert ' + "expect(DateUtils.getDaysInMonth(2024, 3)).assertEqual(30)");
      expect(DateUtils.getDaysInMonth(2024, 3)).assertEqual(30);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0023',
        '#3 assert ' + "expect(DateUtils.getDaysInMonth(2024, 11)).assertEqual(31)");
      expect(DateUtils.getDaysInMonth(2024, 11)).assertEqual(31);
      const sum: number = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        .reduce((acc: number, month: number): number => acc + DateUtils.getDaysInMonth(2023, month), 0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0023',
        '#4 ' + "sum" + ' = ' + JSON.stringify(sum));
      expect(sum).assertEqual(365);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0023', 'end');
    });

    // ==================== day period add subtract (5 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_2400
     * @tc.name: testDateUtils0024
     * @tc.desc: Add days without mutating the source date.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0024', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0024', 'begin');
      const shifted: Date = DateUtils.addDays(SAMPLE, 3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0024',
        '#1 assert ' + "expect(shifted.getDate()).assertEqual(8)");
      expect(shifted.getDate()).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0024',
        '#2 assert ' + "expect(shifted.getMonth()).assertEqual(0)");
      expect(shifted.getMonth()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0024',
        '#3 assert ' + "expect(SAMPLE.getDate()).assertEqual(5)");
      expect(SAMPLE.getDate()).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0024',
        '#4 assert ' + "expect(shifted.getTime() - SAMPLE.getTime()).assertEqual(3 * 86400000)");
      expect(shifted.getTime() - SAMPLE.getTime()).assertEqual(3 * 86400000);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0024', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_2500
     * @tc.name: testDateUtils0025
     * @tc.desc: Roll the month and year boundary when adding days.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0025', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0025', 'begin');
      const endOfMonth: Date = new Date(2024, 0, 31, 12, 0, 0, 0);
      const next: Date = DateUtils.addDays(endOfMonth, 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0025',
        '#1 assert ' + "expect(next.getMonth()).assertEqual(1)");
      expect(next.getMonth()).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0025',
        '#2 assert ' + "expect(next.getDate()).assertEqual(1)");
      expect(next.getDate()).assertEqual(1);
      const endOfYear: Date = DateUtils.addDays(new Date(2024, 11, 31, 12, 0, 0, 0), 1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0025',
        '#3 assert ' + "expect(endOfYear.getFullYear()).assertEqual(2025)");
      expect(endOfYear.getFullYear()).assertEqual(2025);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0025',
        '#4 assert ' + "expect(endOfYear.getMonth()).assertEqual(0)");
      expect(endOfYear.getMonth()).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0025', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_2600
     * @tc.name: testDateUtils0026
     * @tc.desc: Subtract days and hours to move a date backwards.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0026', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0026', 'begin');
      const back: Date = DateUtils.addDays(SAMPLE, -2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0026',
        '#1 assert ' + "expect(back.getDate()).assertEqual(3)");
      expect(back.getDate()).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0026',
        '#2 assert ' + "expect(back.getMonth()).assertEqual(0)");
      expect(back.getMonth()).assertEqual(0);
      const hoursBack: Date = DateUtils.addHours(SAMPLE, -9);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0026',
        '#3 assert ' + "expect(hoursBack.getDate()).assertEqual(4)");
      expect(hoursBack.getDate()).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0026',
        '#4 assert ' + "expect(hoursBack.getHours()).assertEqual(23)");
      expect(hoursBack.getHours()).assertEqual(23);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0026', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_2700
     * @tc.name: testDateUtils0027
     * @tc.desc: Add hours across the day boundary keeping minutes untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0027', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0027', 'begin');
      const shifted: Date = DateUtils.addHours(SAMPLE, 20);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0027',
        '#1 assert ' + "expect(shifted.getDate()).assertEqual(6)");
      expect(shifted.getDate()).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0027',
        '#2 assert ' + "expect(shifted.getHours()).assertEqual(4)");
      expect(shifted.getHours()).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0027',
        '#3 assert ' + "expect(shifted.getMinutes()).assertEqual(9)");
      expect(shifted.getMinutes()).assertEqual(9);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0027',
        '#4 assert ' + "expect(SAMPLE.getHours()).assertEqual(8)");
      expect(SAMPLE.getHours()).assertEqual(8);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0027', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_2800
     * @tc.name: testDateUtils0028
     * @tc.desc: Add minutes across the hour boundary and a zero shift.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0028', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0028', 'begin');
      const shifted: Date = DateUtils.addMinutes(SAMPLE, 55);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0028',
        '#1 assert ' + "expect(shifted.getHours()).assertEqual(9)");
      expect(shifted.getHours()).assertEqual(9);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0028',
        '#2 assert ' + "expect(shifted.getMinutes()).assertEqual(4)");
      expect(shifted.getMinutes()).assertEqual(4);
      const identity: Date = DateUtils.addMinutes(SAMPLE, 0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0028',
        '#3 assert ' + "expect(identity.getTime()).assertEqual(SAMPLE.getTime())");
      expect(identity.getTime()).assertEqual(SAMPLE.getTime());
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0028',
        '#4 ' + "identity !== SAMPLE" + ' = ' + JSON.stringify(identity !== SAMPLE));
      expect(identity !== SAMPLE).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0028', 'end');
    });

    // ==================== day start and end (2 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_2900
     * @tc.name: testDateUtils0029
     * @tc.desc: Cut the day start at midnight and the day end at the last millisecond.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0029', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0029', 'begin');
      const start: number = DateUtils.getStartOfDay(SAMPLE);
      const end: number = DateUtils.getEndOfDay(SAMPLE);
      const startOfDay: Date = new Date(start);
      const endOfDay: Date = new Date(end);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0029',
        '#1 assert ' + "expect(startOfDay.getHours()).assertEqual(0)");
      expect(startOfDay.getHours()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0029',
        '#2 assert ' + "expect(startOfDay.getMinutes()).assertEqual(0)");
      expect(startOfDay.getMinutes()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0029',
        '#3 assert ' + "expect(startOfDay.getSeconds()).assertEqual(0)");
      expect(startOfDay.getSeconds()).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0029',
        '#4 assert ' + "expect(endOfDay.getHours()).assertEqual(23)");
      expect(endOfDay.getHours()).assertEqual(23);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0029',
        '#5 assert ' + "expect(endOfDay.getMinutes()).assertEqual(59)");
      expect(endOfDay.getMinutes()).assertEqual(59);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0029',
        '#6 assert ' + "expect(endOfDay.getMilliseconds()).assertEqual(999)");
      expect(endOfDay.getMilliseconds()).assertEqual(999);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0029', 'end');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_3000
     * @tc.name: testDateUtils0030
     * @tc.desc: Keep the day span length and leave the source date unchanged.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0030', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0030', 'begin');
      const snapshot: number = SAMPLE.getTime();
      const start: number = DateUtils.getStartOfDay(SAMPLE);
      const end: number = DateUtils.getEndOfDay(SAMPLE);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0030',
        '#1 ' + "end - start" + ' = ' + JSON.stringify(end - start));
      expect(end - start).assertEqual(86399999);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0030',
        '#2 assert ' + "expect(SAMPLE.getTime()).assertEqual(snapshot)");
      expect(SAMPLE.getTime()).assertEqual(snapshot);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0030',
        '#3 ' + "end > start" + ' = ' + JSON.stringify(end > start));
      expect(end > start).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testDateUtils0030',
        '#4 assert ' + "expect(DateUtils.getStartOfDay(new Date(start))).assertEqual(start)");
      expect(DateUtils.getStartOfDay(new Date(start))).assertEqual(start);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testDateUtils0030', 'end');
    });
  });
}
