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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TimeUtils } from '../../../../main/ets/bridge/CalendarSwitchBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CalendarViewSwitch]';
const BUNDLE: string = 'CalendarViewSwitch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for TimeUtils.getLastMonth (96 cases). */
export default function timeUtilsGetLastMonthTest(): void {
  describe('TimeUtilsGetLastMonthTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0001
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0001
     * @tc.desc      getLastMonth(year=2024, month=1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0001 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 1);
      logInfo(`getLastMonth(year=2024, month=1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0002
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0002
     * @tc.desc      getLastMonth(year=2024, month=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0002 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 2);
      logInfo(`getLastMonth(year=2024, month=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0003
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0003
     * @tc.desc      getLastMonth(year=2024, month=12) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0003 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 12);
      logInfo(`getLastMonth(year=2024, month=12): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0004
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0004
     * @tc.desc      getLastMonth(year=2024, month=11) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0004 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 11);
      logInfo(`getLastMonth(year=2024, month=11): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0005
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0005
     * @tc.desc      getLastMonth(year=2024, month=24) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0005 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 24);
      logInfo(`getLastMonth(year=2024, month=24): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0005 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0006
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0006
     * @tc.desc      getLastMonth(year=2024, month=6) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0006 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 6);
      logInfo(`getLastMonth(year=2024, month=6): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0006 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0007
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0007
     * @tc.desc      getLastMonth(year=2024, month=3) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0007 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 3);
      logInfo(`getLastMonth(year=2024, month=3): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0007 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0008
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0008
     * @tc.desc      getLastMonth(year=2024, month=10) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0008 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 10);
      logInfo(`getLastMonth(year=2024, month=10): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0008 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0009
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0009
     * @tc.desc      getLastMonth(year=2024, month=100) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0009 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 100);
      logInfo(`getLastMonth(year=2024, month=100): actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0009 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0010
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0010
     * @tc.desc      getLastMonth(year=2024, month=5) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0010 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 5);
      logInfo(`getLastMonth(year=2024, month=5): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0010 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0011
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0011
     * @tc.desc      getLastMonth(year=2024, month=15) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0011 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 15);
      logInfo(`getLastMonth(year=2024, month=15): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0011 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0012
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0012
     * @tc.desc      getLastMonth(year=2024, month=20) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0012 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 20);
      logInfo(`getLastMonth(year=2024, month=20): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0012 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0013
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0013
     * @tc.desc      getLastMonth(year=2024, month=25) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0013 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 25);
      logInfo(`getLastMonth(year=2024, month=25): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0013 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0014
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0014
     * @tc.desc      getLastMonth(year=2024, month=30) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0014 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 30);
      logInfo(`getLastMonth(year=2024, month=30): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0014 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0015
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0015
     * @tc.desc      getLastMonth(year=2024, month=35) returns 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0015 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 35);
      logInfo(`getLastMonth(year=2024, month=35): actual=${actual}`);
      expect(actual).assertEqual(34);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0015 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0016
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0016
     * @tc.desc      getLastMonth(year=2024, month=40) returns 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0016 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 40);
      logInfo(`getLastMonth(year=2024, month=40): actual=${actual}`);
      expect(actual).assertEqual(39);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0016 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0017
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0017
     * @tc.desc      getLastMonth(year=2024, month=45) returns 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0017 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 45);
      logInfo(`getLastMonth(year=2024, month=45): actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0017 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0018
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0018
     * @tc.desc      getLastMonth(year=2024, month=50) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0018 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 50);
      logInfo(`getLastMonth(year=2024, month=50): actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0018 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0019
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0019
     * @tc.desc      getLastMonth(year=2024, month=55) returns 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0019 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 55);
      logInfo(`getLastMonth(year=2024, month=55): actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0019 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0020
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0020
     * @tc.desc      getLastMonth(year=2024, month=60) returns 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0020 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 60);
      logInfo(`getLastMonth(year=2024, month=60): actual=${actual}`);
      expect(actual).assertEqual(59);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0020 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0021
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0021
     * @tc.desc      getLastMonth(year=2024, month=65) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0021 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 65);
      logInfo(`getLastMonth(year=2024, month=65): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0021 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0022
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0022
     * @tc.desc      getLastMonth(year=2024, month=70) returns 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0022 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 70);
      logInfo(`getLastMonth(year=2024, month=70): actual=${actual}`);
      expect(actual).assertEqual(69);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0022 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0023
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0023
     * @tc.desc      getLastMonth(year=2024, month=75) returns 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0023 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 75);
      logInfo(`getLastMonth(year=2024, month=75): actual=${actual}`);
      expect(actual).assertEqual(74);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0023 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0024
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0024
     * @tc.desc      getLastMonth(year=2024, month=80) returns 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0024 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 80);
      logInfo(`getLastMonth(year=2024, month=80): actual=${actual}`);
      expect(actual).assertEqual(79);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0024 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0025
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0025
     * @tc.desc      getLastMonth(year=2024, month=85) returns 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0025 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 85);
      logInfo(`getLastMonth(year=2024, month=85): actual=${actual}`);
      expect(actual).assertEqual(84);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0025 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0026
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0026
     * @tc.desc      getLastMonth(year=2024, month=90) returns 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0026 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 90);
      logInfo(`getLastMonth(year=2024, month=90): actual=${actual}`);
      expect(actual).assertEqual(89);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0026 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0027
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0027
     * @tc.desc      getLastMonth(year=2024, month=46) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0027 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 46);
      logInfo(`getLastMonth(year=2024, month=46): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0027 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0028
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0028
     * @tc.desc      getLastMonth(year=2024, month=0) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0028 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 0);
      logInfo(`getLastMonth(year=2024, month=0): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0028 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0029
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0029
     * @tc.desc      getLastMonth(year=2024, month=13) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0029 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, 13);
      logInfo(`getLastMonth(year=2024, month=13): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0029 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0030
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0030
     * @tc.desc      getLastMonth(year=2024, month=-1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0030 begin`);
      const actual: number = TimeUtils.getLastMonth(2024, -1);
      logInfo(`getLastMonth(year=2024, month=-1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0030 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0031
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0031
     * @tc.desc      getLastMonth(year=2023, month=1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0031 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 1);
      logInfo(`getLastMonth(year=2023, month=1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0031 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0032
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0032
     * @tc.desc      getLastMonth(year=2023, month=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0032 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 2);
      logInfo(`getLastMonth(year=2023, month=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0032 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0033
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0033
     * @tc.desc      getLastMonth(year=2023, month=0) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0033 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 0);
      logInfo(`getLastMonth(year=2023, month=0): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0033 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0034
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0034
     * @tc.desc      getLastMonth(year=2023, month=12) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0034 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 12);
      logInfo(`getLastMonth(year=2023, month=12): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0034 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0035
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0035
     * @tc.desc      getLastMonth(year=2023, month=11) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0035 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 11);
      logInfo(`getLastMonth(year=2023, month=11): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0035 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0036
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0036
     * @tc.desc      getLastMonth(year=2023, month=13) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0036 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 13);
      logInfo(`getLastMonth(year=2023, month=13): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0036 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0037
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0037
     * @tc.desc      getLastMonth(year=2023, month=24) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0037 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 24);
      logInfo(`getLastMonth(year=2023, month=24): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0037 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0038
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0038
     * @tc.desc      getLastMonth(year=2023, month=6) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0038 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 6);
      logInfo(`getLastMonth(year=2023, month=6): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0038 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0039
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0039
     * @tc.desc      getLastMonth(year=2023, month=-1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0039 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, -1);
      logInfo(`getLastMonth(year=2023, month=-1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0039 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0040
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0040
     * @tc.desc      getLastMonth(year=2023, month=3) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0040 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 3);
      logInfo(`getLastMonth(year=2023, month=3): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0040 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0041
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0041
     * @tc.desc      getLastMonth(year=2023, month=10) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0041 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 10);
      logInfo(`getLastMonth(year=2023, month=10): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0041 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0042
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0042
     * @tc.desc      getLastMonth(year=2023, month=100) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0042 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 100);
      logInfo(`getLastMonth(year=2023, month=100): actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0042 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0043
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0043
     * @tc.desc      getLastMonth(year=2023, month=5) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0043 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 5);
      logInfo(`getLastMonth(year=2023, month=5): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0043 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0044
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0044
     * @tc.desc      getLastMonth(year=2023, month=15) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0044 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 15);
      logInfo(`getLastMonth(year=2023, month=15): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0044 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0045
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0045
     * @tc.desc      getLastMonth(year=2023, month=20) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0045 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 20);
      logInfo(`getLastMonth(year=2023, month=20): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0045 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0046
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0046
     * @tc.desc      getLastMonth(year=2023, month=25) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0046 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 25);
      logInfo(`getLastMonth(year=2023, month=25): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0046 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0047
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0047
     * @tc.desc      getLastMonth(year=2023, month=30) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0047 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 30);
      logInfo(`getLastMonth(year=2023, month=30): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0047 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0048
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0048
     * @tc.desc      getLastMonth(year=2023, month=35) returns 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0048 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 35);
      logInfo(`getLastMonth(year=2023, month=35): actual=${actual}`);
      expect(actual).assertEqual(34);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0048 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0049
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0049
     * @tc.desc      getLastMonth(year=2023, month=40) returns 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0049 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 40);
      logInfo(`getLastMonth(year=2023, month=40): actual=${actual}`);
      expect(actual).assertEqual(39);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0049 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0050
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0050
     * @tc.desc      getLastMonth(year=2023, month=45) returns 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0050 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 45);
      logInfo(`getLastMonth(year=2023, month=45): actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0050 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0051
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0051
     * @tc.desc      getLastMonth(year=2023, month=50) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0051 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 50);
      logInfo(`getLastMonth(year=2023, month=50): actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0051 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0052
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0052
     * @tc.desc      getLastMonth(year=2023, month=55) returns 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0052 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 55);
      logInfo(`getLastMonth(year=2023, month=55): actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0052 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0053
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0053
     * @tc.desc      getLastMonth(year=2023, month=60) returns 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0053 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 60);
      logInfo(`getLastMonth(year=2023, month=60): actual=${actual}`);
      expect(actual).assertEqual(59);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0053 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0054
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0054
     * @tc.desc      getLastMonth(year=2023, month=65) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0054 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 65);
      logInfo(`getLastMonth(year=2023, month=65): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0054 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0055
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0055
     * @tc.desc      getLastMonth(year=2023, month=70) returns 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0055 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 70);
      logInfo(`getLastMonth(year=2023, month=70): actual=${actual}`);
      expect(actual).assertEqual(69);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0055 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0056
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0056
     * @tc.desc      getLastMonth(year=2023, month=75) returns 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0056 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 75);
      logInfo(`getLastMonth(year=2023, month=75): actual=${actual}`);
      expect(actual).assertEqual(74);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0056 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0057
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0057
     * @tc.desc      getLastMonth(year=2023, month=80) returns 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0057 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 80);
      logInfo(`getLastMonth(year=2023, month=80): actual=${actual}`);
      expect(actual).assertEqual(79);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0057 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0058
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0058
     * @tc.desc      getLastMonth(year=2023, month=85) returns 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0058 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 85);
      logInfo(`getLastMonth(year=2023, month=85): actual=${actual}`);
      expect(actual).assertEqual(84);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0058 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0059
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0059
     * @tc.desc      getLastMonth(year=2023, month=90) returns 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0059 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 90);
      logInfo(`getLastMonth(year=2023, month=90): actual=${actual}`);
      expect(actual).assertEqual(89);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0059 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0060
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0060
     * @tc.desc      getLastMonth(year=2023, month=46) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0060 begin`);
      const actual: number = TimeUtils.getLastMonth(2023, 46);
      logInfo(`getLastMonth(year=2023, month=46): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0060 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0061
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0061
     * @tc.desc      getLastMonth(year=1, month=1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0061 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 1);
      logInfo(`getLastMonth(year=1, month=1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0061 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0062
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0062
     * @tc.desc      getLastMonth(year=1, month=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0062 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 2);
      logInfo(`getLastMonth(year=1, month=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0062 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0063
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0063
     * @tc.desc      getLastMonth(year=1, month=0) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0063 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 0);
      logInfo(`getLastMonth(year=1, month=0): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0063 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0064
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0064
     * @tc.desc      getLastMonth(year=1, month=12) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0064 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 12);
      logInfo(`getLastMonth(year=1, month=12): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0064 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0065
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0065
     * @tc.desc      getLastMonth(year=1, month=11) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0065 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 11);
      logInfo(`getLastMonth(year=1, month=11): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0065 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0066
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0066
     * @tc.desc      getLastMonth(year=1, month=13) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0066 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 13);
      logInfo(`getLastMonth(year=1, month=13): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0066 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0067
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0067
     * @tc.desc      getLastMonth(year=1, month=24) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0067 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 24);
      logInfo(`getLastMonth(year=1, month=24): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0067 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0068
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0068
     * @tc.desc      getLastMonth(year=1, month=6) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0068 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 6);
      logInfo(`getLastMonth(year=1, month=6): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0068 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0069
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0069
     * @tc.desc      getLastMonth(year=1, month=-1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0069 begin`);
      const actual: number = TimeUtils.getLastMonth(1, -1);
      logInfo(`getLastMonth(year=1, month=-1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0069 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0070
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0070
     * @tc.desc      getLastMonth(year=1, month=3) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0070 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 3);
      logInfo(`getLastMonth(year=1, month=3): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0070 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0071
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0071
     * @tc.desc      getLastMonth(year=1, month=10) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0071 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 10);
      logInfo(`getLastMonth(year=1, month=10): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0071 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0072
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0072
     * @tc.desc      getLastMonth(year=1, month=100) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0072 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 100);
      logInfo(`getLastMonth(year=1, month=100): actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0072 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0073
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0073
     * @tc.desc      getLastMonth(year=1, month=5) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0073 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 5);
      logInfo(`getLastMonth(year=1, month=5): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0073 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0074
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0074
     * @tc.desc      getLastMonth(year=1, month=15) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0074 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 15);
      logInfo(`getLastMonth(year=1, month=15): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0074 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0075
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0075
     * @tc.desc      getLastMonth(year=1, month=20) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0075 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 20);
      logInfo(`getLastMonth(year=1, month=20): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0075 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0076
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0076
     * @tc.desc      getLastMonth(year=1, month=25) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0076 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 25);
      logInfo(`getLastMonth(year=1, month=25): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0076 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0077
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0077
     * @tc.desc      getLastMonth(year=1, month=30) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0077 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 30);
      logInfo(`getLastMonth(year=1, month=30): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0077 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0078
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0078
     * @tc.desc      getLastMonth(year=1, month=35) returns 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0078 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 35);
      logInfo(`getLastMonth(year=1, month=35): actual=${actual}`);
      expect(actual).assertEqual(34);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0078 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0079
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0079
     * @tc.desc      getLastMonth(year=1, month=40) returns 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0079 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 40);
      logInfo(`getLastMonth(year=1, month=40): actual=${actual}`);
      expect(actual).assertEqual(39);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0079 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0080
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0080
     * @tc.desc      getLastMonth(year=1, month=45) returns 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0080 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 45);
      logInfo(`getLastMonth(year=1, month=45): actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0080 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0081
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0081
     * @tc.desc      getLastMonth(year=1, month=50) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0081 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 50);
      logInfo(`getLastMonth(year=1, month=50): actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0081 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0082
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0082
     * @tc.desc      getLastMonth(year=1, month=55) returns 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0082 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 55);
      logInfo(`getLastMonth(year=1, month=55): actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0082 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0083
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0083
     * @tc.desc      getLastMonth(year=1, month=60) returns 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0083 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 60);
      logInfo(`getLastMonth(year=1, month=60): actual=${actual}`);
      expect(actual).assertEqual(59);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0083 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0084
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0084
     * @tc.desc      getLastMonth(year=1, month=65) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0084 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 65);
      logInfo(`getLastMonth(year=1, month=65): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0084 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0085
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0085
     * @tc.desc      getLastMonth(year=1, month=70) returns 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0085 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 70);
      logInfo(`getLastMonth(year=1, month=70): actual=${actual}`);
      expect(actual).assertEqual(69);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0085 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0086
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0086
     * @tc.desc      getLastMonth(year=1, month=75) returns 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0086 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 75);
      logInfo(`getLastMonth(year=1, month=75): actual=${actual}`);
      expect(actual).assertEqual(74);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0086 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0087
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0087
     * @tc.desc      getLastMonth(year=1, month=80) returns 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0087 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 80);
      logInfo(`getLastMonth(year=1, month=80): actual=${actual}`);
      expect(actual).assertEqual(79);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0087 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0088
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0088
     * @tc.desc      getLastMonth(year=1, month=85) returns 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0088 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 85);
      logInfo(`getLastMonth(year=1, month=85): actual=${actual}`);
      expect(actual).assertEqual(84);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0088 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0089
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0089
     * @tc.desc      getLastMonth(year=1, month=90) returns 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0089 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 90);
      logInfo(`getLastMonth(year=1, month=90): actual=${actual}`);
      expect(actual).assertEqual(89);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0089 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0090
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0090
     * @tc.desc      getLastMonth(year=1, month=46) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0090 begin`);
      const actual: number = TimeUtils.getLastMonth(1, 46);
      logInfo(`getLastMonth(year=1, month=46): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0090 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0091
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0091
     * @tc.desc      getLastMonth(year=0, month=1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0091 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 1);
      logInfo(`getLastMonth(year=0, month=1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0091 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0092
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0092
     * @tc.desc      getLastMonth(year=0, month=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0092 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 2);
      logInfo(`getLastMonth(year=0, month=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0092 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0093
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0093
     * @tc.desc      getLastMonth(year=0, month=0) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0093 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 0);
      logInfo(`getLastMonth(year=0, month=0): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0093 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0094
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0094
     * @tc.desc      getLastMonth(year=0, month=12) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0094 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 12);
      logInfo(`getLastMonth(year=0, month=12): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0094 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0095
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0095
     * @tc.desc      getLastMonth(year=0, month=11) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0095 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 11);
      logInfo(`getLastMonth(year=0, month=11): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0095 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0096
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0096
     * @tc.desc      getLastMonth(year=0, month=13) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0096 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 13);
      logInfo(`getLastMonth(year=0, month=13): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0096 end`);
    });
  });
}
