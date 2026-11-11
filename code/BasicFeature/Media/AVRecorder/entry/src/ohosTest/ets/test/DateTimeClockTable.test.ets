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
import { dateTime } from '../../../main/ets/utils/DateTimeUtil';
import { paceTurn } from './TestPace';

export default function dateTimeClockTableTest() {
  describe('dateTimeClockTableTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_0100
     * @tc.name testClockTable0001
     * @tc.desc Verify dateTime renders 0 s as minute 0 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(0);
      expect(text).assertEqual('00:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_0200
     * @tc.name testClockTable0002
     * @tc.desc Verify dateTime renders 60 s as minute 1 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(60);
      expect(text).assertEqual('01:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_0300
     * @tc.name testClockTable0003
     * @tc.desc Verify dateTime renders 120 s as minute 2 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(120);
      expect(text).assertEqual('02:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_0400
     * @tc.name testClockTable0004
     * @tc.desc Verify dateTime renders 180 s as minute 3 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(180);
      expect(text).assertEqual('03:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_0500
     * @tc.name testClockTable0005
     * @tc.desc Verify dateTime renders 240 s as minute 4 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(240);
      expect(text).assertEqual('04:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_0600
     * @tc.name testClockTable0006
     * @tc.desc Verify dateTime renders 300 s as minute 5 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(300);
      expect(text).assertEqual('05:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_0700
     * @tc.name testClockTable0007
     * @tc.desc Verify dateTime renders 360 s as minute 6 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(360);
      expect(text).assertEqual('06:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_0800
     * @tc.name testClockTable0008
     * @tc.desc Verify dateTime renders 420 s as minute 7 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(420);
      expect(text).assertEqual('07:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_0900
     * @tc.name testClockTable0009
     * @tc.desc Verify dateTime renders 480 s as minute 8 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(480);
      expect(text).assertEqual('08:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_1000
     * @tc.name testClockTable0010
     * @tc.desc Verify dateTime renders 540 s as minute 9 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(540);
      expect(text).assertEqual('09:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_1100
     * @tc.name testClockTable0011
     * @tc.desc Verify dateTime renders 600 s as minute 10 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(600);
      expect(text).assertEqual('10:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_1200
     * @tc.name testClockTable0012
     * @tc.desc Verify dateTime renders 660 s as minute 11 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(660);
      expect(text).assertEqual('11:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_1300
     * @tc.name testClockTable0013
     * @tc.desc Verify dateTime renders 720 s as minute 12 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(720);
      expect(text).assertEqual('12:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_1400
     * @tc.name testClockTable0014
     * @tc.desc Verify dateTime renders 780 s as minute 13 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(780);
      expect(text).assertEqual('13:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_1500
     * @tc.name testClockTable0015
     * @tc.desc Verify dateTime renders 840 s as minute 14 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(840);
      expect(text).assertEqual('14:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_1600
     * @tc.name testClockTable0016
     * @tc.desc Verify dateTime renders 900 s as minute 15 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(900);
      expect(text).assertEqual('15:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_1700
     * @tc.name testClockTable0017
     * @tc.desc Verify dateTime renders 960 s as minute 16 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(960);
      expect(text).assertEqual('16:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_1800
     * @tc.name testClockTable0018
     * @tc.desc Verify dateTime renders 1020 s as minute 17 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1020);
      expect(text).assertEqual('17:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_1900
     * @tc.name testClockTable0019
     * @tc.desc Verify dateTime renders 1080 s as minute 18 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1080);
      expect(text).assertEqual('18:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_2000
     * @tc.name testClockTable0020
     * @tc.desc Verify dateTime renders 1140 s as minute 19 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1140);
      expect(text).assertEqual('19:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_2100
     * @tc.name testClockTable0021
     * @tc.desc Verify dateTime renders 1200 s as minute 20 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1200);
      expect(text).assertEqual('20:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_2200
     * @tc.name testClockTable0022
     * @tc.desc Verify dateTime renders 1260 s as minute 21 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1260);
      expect(text).assertEqual('21:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_2300
     * @tc.name testClockTable0023
     * @tc.desc Verify dateTime renders 1320 s as minute 22 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1320);
      expect(text).assertEqual('22:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_2400
     * @tc.name testClockTable0024
     * @tc.desc Verify dateTime renders 1380 s as minute 23 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1380);
      expect(text).assertEqual('23:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_2500
     * @tc.name testClockTable0025
     * @tc.desc Verify dateTime renders 1440 s as minute 24 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1440);
      expect(text).assertEqual('24:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_2600
     * @tc.name testClockTable0026
     * @tc.desc Verify dateTime renders 1500 s as minute 25 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1500);
      expect(text).assertEqual('25:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_2700
     * @tc.name testClockTable0027
     * @tc.desc Verify dateTime renders 1560 s as minute 26 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1560);
      expect(text).assertEqual('26:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_2800
     * @tc.name testClockTable0028
     * @tc.desc Verify dateTime renders 1620 s as minute 27 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1620);
      expect(text).assertEqual('27:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_2900
     * @tc.name testClockTable0029
     * @tc.desc Verify dateTime renders 1680 s as minute 28 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1680);
      expect(text).assertEqual('28:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_3000
     * @tc.name testClockTable0030
     * @tc.desc Verify dateTime renders 1740 s as minute 29 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1740);
      expect(text).assertEqual('29:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_3100
     * @tc.name testClockTable0031
     * @tc.desc Verify dateTime renders 1800 s as minute 30 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1800);
      expect(text).assertEqual('30:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_3200
     * @tc.name testClockTable0032
     * @tc.desc Verify dateTime renders 1860 s as minute 31 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1860);
      expect(text).assertEqual('31:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_3300
     * @tc.name testClockTable0033
     * @tc.desc Verify dateTime renders 1920 s as minute 32 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1920);
      expect(text).assertEqual('32:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_3400
     * @tc.name testClockTable0034
     * @tc.desc Verify dateTime renders 1980 s as minute 33 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(1980);
      expect(text).assertEqual('33:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_3500
     * @tc.name testClockTable0035
     * @tc.desc Verify dateTime renders 2040 s as minute 34 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2040);
      expect(text).assertEqual('34:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_3600
     * @tc.name testClockTable0036
     * @tc.desc Verify dateTime renders 2100 s as minute 35 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2100);
      expect(text).assertEqual('35:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_3700
     * @tc.name testClockTable0037
     * @tc.desc Verify dateTime renders 2160 s as minute 36 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2160);
      expect(text).assertEqual('36:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_3800
     * @tc.name testClockTable0038
     * @tc.desc Verify dateTime renders 2220 s as minute 37 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2220);
      expect(text).assertEqual('37:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_3900
     * @tc.name testClockTable0039
     * @tc.desc Verify dateTime renders 2280 s as minute 38 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2280);
      expect(text).assertEqual('38:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_4000
     * @tc.name testClockTable0040
     * @tc.desc Verify dateTime renders 2340 s as minute 39 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2340);
      expect(text).assertEqual('39:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_4100
     * @tc.name testClockTable0041
     * @tc.desc Verify dateTime renders 2400 s as minute 40 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2400);
      expect(text).assertEqual('40:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_4200
     * @tc.name testClockTable0042
     * @tc.desc Verify dateTime renders 2460 s as minute 41 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2460);
      expect(text).assertEqual('41:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_4300
     * @tc.name testClockTable0043
     * @tc.desc Verify dateTime renders 2520 s as minute 42 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2520);
      expect(text).assertEqual('42:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_4400
     * @tc.name testClockTable0044
     * @tc.desc Verify dateTime renders 2580 s as minute 43 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2580);
      expect(text).assertEqual('43:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_4500
     * @tc.name testClockTable0045
     * @tc.desc Verify dateTime renders 2640 s as minute 44 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2640);
      expect(text).assertEqual('44:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_4600
     * @tc.name testClockTable0046
     * @tc.desc Verify dateTime renders 2700 s as minute 45 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2700);
      expect(text).assertEqual('45:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_4700
     * @tc.name testClockTable0047
     * @tc.desc Verify dateTime renders 2760 s as minute 46 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2760);
      expect(text).assertEqual('46:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_4800
     * @tc.name testClockTable0048
     * @tc.desc Verify dateTime renders 2820 s as minute 47 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2820);
      expect(text).assertEqual('47:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_4900
     * @tc.name testClockTable0049
     * @tc.desc Verify dateTime renders 2880 s as minute 48 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2880);
      expect(text).assertEqual('48:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_5000
     * @tc.name testClockTable0050
     * @tc.desc Verify dateTime renders 2940 s as minute 49 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(2940);
      expect(text).assertEqual('49:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_5100
     * @tc.name testClockTable0051
     * @tc.desc Verify dateTime renders 3000 s as minute 50 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(3000);
      expect(text).assertEqual('50:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_5200
     * @tc.name testClockTable0052
     * @tc.desc Verify dateTime renders 3060 s as minute 51 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(3060);
      expect(text).assertEqual('51:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_5300
     * @tc.name testClockTable0053
     * @tc.desc Verify dateTime renders 3120 s as minute 52 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(3120);
      expect(text).assertEqual('52:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_5400
     * @tc.name testClockTable0054
     * @tc.desc Verify dateTime renders 3180 s as minute 53 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(3180);
      expect(text).assertEqual('53:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_5500
     * @tc.name testClockTable0055
     * @tc.desc Verify dateTime renders 3240 s as minute 54 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(3240);
      expect(text).assertEqual('54:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_5600
     * @tc.name testClockTable0056
     * @tc.desc Verify dateTime renders 3300 s as minute 55 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(3300);
      expect(text).assertEqual('55:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_5700
     * @tc.name testClockTable0057
     * @tc.desc Verify dateTime renders 3360 s as minute 56 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(3360);
      expect(text).assertEqual('56:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_5800
     * @tc.name testClockTable0058
     * @tc.desc Verify dateTime renders 3420 s as minute 57 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(3420);
      expect(text).assertEqual('57:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_5900
     * @tc.name testClockTable0059
     * @tc.desc Verify dateTime renders 3480 s as minute 58 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(3480);
      expect(text).assertEqual('58:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_6000
     * @tc.name testClockTable0060
     * @tc.desc Verify dateTime renders 3540 s as minute 59 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(3540);
      expect(text).assertEqual('59:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_6100
     * @tc.name testClockTable0061
     * @tc.desc Verify dateTime renders 421 s as minute 7 and second 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(421);
      expect(text).assertEqual('07:01');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_6200
     * @tc.name testClockTable0062
     * @tc.desc Verify dateTime renders 422 s as minute 7 and second 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(422);
      expect(text).assertEqual('07:02');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_6300
     * @tc.name testClockTable0063
     * @tc.desc Verify dateTime renders 423 s as minute 7 and second 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(423);
      expect(text).assertEqual('07:03');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_6400
     * @tc.name testClockTable0064
     * @tc.desc Verify dateTime renders 424 s as minute 7 and second 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(424);
      expect(text).assertEqual('07:04');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_6500
     * @tc.name testClockTable0065
     * @tc.desc Verify dateTime renders 425 s as minute 7 and second 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(425);
      expect(text).assertEqual('07:05');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_6600
     * @tc.name testClockTable0066
     * @tc.desc Verify dateTime renders 426 s as minute 7 and second 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(426);
      expect(text).assertEqual('07:06');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_6700
     * @tc.name testClockTable0067
     * @tc.desc Verify dateTime renders 427 s as minute 7 and second 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(427);
      expect(text).assertEqual('07:07');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_6800
     * @tc.name testClockTable0068
     * @tc.desc Verify dateTime renders 428 s as minute 7 and second 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(428);
      expect(text).assertEqual('07:08');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_6900
     * @tc.name testClockTable0069
     * @tc.desc Verify dateTime renders 429 s as minute 7 and second 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(429);
      expect(text).assertEqual('07:09');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_7000
     * @tc.name testClockTable0070
     * @tc.desc Verify dateTime renders 430 s as minute 7 and second 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(430);
      expect(text).assertEqual('07:10');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_7100
     * @tc.name testClockTable0071
     * @tc.desc Verify dateTime renders 431 s as minute 7 and second 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(431);
      expect(text).assertEqual('07:11');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_7200
     * @tc.name testClockTable0072
     * @tc.desc Verify dateTime renders 432 s as minute 7 and second 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(432);
      expect(text).assertEqual('07:12');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_7300
     * @tc.name testClockTable0073
     * @tc.desc Verify dateTime renders 433 s as minute 7 and second 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(433);
      expect(text).assertEqual('07:13');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_7400
     * @tc.name testClockTable0074
     * @tc.desc Verify dateTime renders 434 s as minute 7 and second 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(434);
      expect(text).assertEqual('07:14');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_7500
     * @tc.name testClockTable0075
     * @tc.desc Verify dateTime renders 435 s as minute 7 and second 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(435);
      expect(text).assertEqual('07:15');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_7600
     * @tc.name testClockTable0076
     * @tc.desc Verify dateTime renders 436 s as minute 7 and second 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(436);
      expect(text).assertEqual('07:16');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_7700
     * @tc.name testClockTable0077
     * @tc.desc Verify dateTime renders 437 s as minute 7 and second 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(437);
      expect(text).assertEqual('07:17');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_7800
     * @tc.name testClockTable0078
     * @tc.desc Verify dateTime renders 438 s as minute 7 and second 18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(438);
      expect(text).assertEqual('07:18');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_7900
     * @tc.name testClockTable0079
     * @tc.desc Verify dateTime renders 439 s as minute 7 and second 19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(439);
      expect(text).assertEqual('07:19');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_8000
     * @tc.name testClockTable0080
     * @tc.desc Verify dateTime renders 440 s as minute 7 and second 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(440);
      expect(text).assertEqual('07:20');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_8100
     * @tc.name testClockTable0081
     * @tc.desc Verify dateTime renders 441 s as minute 7 and second 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(441);
      expect(text).assertEqual('07:21');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_8200
     * @tc.name testClockTable0082
     * @tc.desc Verify dateTime renders 442 s as minute 7 and second 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(442);
      expect(text).assertEqual('07:22');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_8300
     * @tc.name testClockTable0083
     * @tc.desc Verify dateTime renders 443 s as minute 7 and second 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(443);
      expect(text).assertEqual('07:23');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_8400
     * @tc.name testClockTable0084
     * @tc.desc Verify dateTime renders 444 s as minute 7 and second 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(444);
      expect(text).assertEqual('07:24');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_8500
     * @tc.name testClockTable0085
     * @tc.desc Verify dateTime renders 445 s as minute 7 and second 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(445);
      expect(text).assertEqual('07:25');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_8600
     * @tc.name testClockTable0086
     * @tc.desc Verify dateTime renders 446 s as minute 7 and second 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(446);
      expect(text).assertEqual('07:26');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_8700
     * @tc.name testClockTable0087
     * @tc.desc Verify dateTime renders 447 s as minute 7 and second 27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(447);
      expect(text).assertEqual('07:27');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_8800
     * @tc.name testClockTable0088
     * @tc.desc Verify dateTime renders 448 s as minute 7 and second 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(448);
      expect(text).assertEqual('07:28');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_8900
     * @tc.name testClockTable0089
     * @tc.desc Verify dateTime renders 449 s as minute 7 and second 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(449);
      expect(text).assertEqual('07:29');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_9000
     * @tc.name testClockTable0090
     * @tc.desc Verify dateTime renders 450 s as minute 7 and second 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(450);
      expect(text).assertEqual('07:30');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_9100
     * @tc.name testClockTable0091
     * @tc.desc Verify dateTime renders 451 s as minute 7 and second 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(451);
      expect(text).assertEqual('07:31');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_9200
     * @tc.name testClockTable0092
     * @tc.desc Verify dateTime renders 452 s as minute 7 and second 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(452);
      expect(text).assertEqual('07:32');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_9300
     * @tc.name testClockTable0093
     * @tc.desc Verify dateTime renders 453 s as minute 7 and second 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(453);
      expect(text).assertEqual('07:33');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_9400
     * @tc.name testClockTable0094
     * @tc.desc Verify dateTime renders 454 s as minute 7 and second 34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(454);
      expect(text).assertEqual('07:34');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_9500
     * @tc.name testClockTable0095
     * @tc.desc Verify dateTime renders 455 s as minute 7 and second 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(455);
      expect(text).assertEqual('07:35');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_9600
     * @tc.name testClockTable0096
     * @tc.desc Verify dateTime renders 456 s as minute 7 and second 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(456);
      expect(text).assertEqual('07:36');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_9700
     * @tc.name testClockTable0097
     * @tc.desc Verify dateTime renders 457 s as minute 7 and second 37
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(457);
      expect(text).assertEqual('07:37');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_9800
     * @tc.name testClockTable0098
     * @tc.desc Verify dateTime renders 458 s as minute 7 and second 38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(458);
      expect(text).assertEqual('07:38');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_9900
     * @tc.name testClockTable0099
     * @tc.desc Verify dateTime renders 459 s as minute 7 and second 39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(459);
      expect(text).assertEqual('07:39');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_10000
     * @tc.name testClockTable0100
     * @tc.desc Verify dateTime renders 460 s as minute 7 and second 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(460);
      expect(text).assertEqual('07:40');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_10100
     * @tc.name testClockTable0101
     * @tc.desc Verify dateTime renders 461 s as minute 7 and second 41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(461);
      expect(text).assertEqual('07:41');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_10200
     * @tc.name testClockTable0102
     * @tc.desc Verify dateTime renders 462 s as minute 7 and second 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(462);
      expect(text).assertEqual('07:42');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_10300
     * @tc.name testClockTable0103
     * @tc.desc Verify dateTime renders 463 s as minute 7 and second 43
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(463);
      expect(text).assertEqual('07:43');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_10400
     * @tc.name testClockTable0104
     * @tc.desc Verify dateTime renders 464 s as minute 7 and second 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(464);
      expect(text).assertEqual('07:44');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_10500
     * @tc.name testClockTable0105
     * @tc.desc Verify dateTime renders 465 s as minute 7 and second 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(465);
      expect(text).assertEqual('07:45');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_10600
     * @tc.name testClockTable0106
     * @tc.desc Verify dateTime renders 466 s as minute 7 and second 46
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(466);
      expect(text).assertEqual('07:46');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_10700
     * @tc.name testClockTable0107
     * @tc.desc Verify dateTime renders 467 s as minute 7 and second 47
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(467);
      expect(text).assertEqual('07:47');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_10800
     * @tc.name testClockTable0108
     * @tc.desc Verify dateTime renders 468 s as minute 7 and second 48
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(468);
      expect(text).assertEqual('07:48');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_10900
     * @tc.name testClockTable0109
     * @tc.desc Verify dateTime renders 469 s as minute 7 and second 49
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(469);
      expect(text).assertEqual('07:49');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_11000
     * @tc.name testClockTable0110
     * @tc.desc Verify dateTime renders 470 s as minute 7 and second 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(470);
      expect(text).assertEqual('07:50');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_11100
     * @tc.name testClockTable0111
     * @tc.desc Verify dateTime renders 471 s as minute 7 and second 51
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(471);
      expect(text).assertEqual('07:51');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_11200
     * @tc.name testClockTable0112
     * @tc.desc Verify dateTime renders 472 s as minute 7 and second 52
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(472);
      expect(text).assertEqual('07:52');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_11300
     * @tc.name testClockTable0113
     * @tc.desc Verify dateTime renders 473 s as minute 7 and second 53
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(473);
      expect(text).assertEqual('07:53');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_11400
     * @tc.name testClockTable0114
     * @tc.desc Verify dateTime renders 474 s as minute 7 and second 54
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(474);
      expect(text).assertEqual('07:54');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_11500
     * @tc.name testClockTable0115
     * @tc.desc Verify dateTime renders 475 s as minute 7 and second 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(475);
      expect(text).assertEqual('07:55');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_11600
     * @tc.name testClockTable0116
     * @tc.desc Verify dateTime renders 476 s as minute 7 and second 56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(476);
      expect(text).assertEqual('07:56');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_11700
     * @tc.name testClockTable0117
     * @tc.desc Verify dateTime renders 477 s as minute 7 and second 57
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(477);
      expect(text).assertEqual('07:57');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_11800
     * @tc.name testClockTable0118
     * @tc.desc Verify dateTime renders 478 s as minute 7 and second 58
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(478);
      expect(text).assertEqual('07:58');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_11900
     * @tc.name testClockTable0119
     * @tc.desc Verify dateTime renders 479 s as minute 7 and second 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(479);
      expect(text).assertEqual('07:59');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_12000
     * @tc.name testClockTable0120
     * @tc.desc Verify dateTime wraps 3599 s into minute 59 and second 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(3599);
      expect(text).assertEqual('59:59');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_12100
     * @tc.name testClockTable0121
     * @tc.desc Verify dateTime wraps 3600 s into minute 0 and second 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(3600);
      expect(text).assertEqual('00:00');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_12200
     * @tc.name testClockTable0122
     * @tc.desc Verify dateTime wraps 3601 s into minute 0 and second 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(3601);
      expect(text).assertEqual('00:01');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })

    /**
     * @tc.number SUB_AVRECORDER_DT_CLOCK_12300
     * @tc.name testClockTable0123
     * @tc.desc Verify dateTime wraps 86399 s into minute 59 and second 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testClockTable0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text: string = dateTime(86399);
      expect(text).assertEqual('59:59');
      expect(text.length).assertEqual(5);
      expect(text.charAt(2)).assertEqual(':');
    })
  })
}
