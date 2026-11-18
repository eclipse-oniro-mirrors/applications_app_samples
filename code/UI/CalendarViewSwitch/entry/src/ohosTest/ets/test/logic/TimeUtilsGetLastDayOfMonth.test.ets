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

/** Logic checks for TimeUtils.getLastDayOfMonth (96 cases). */
export default function timeUtilsGetLastDayOfMonthTest(): void {
  describe('TimeUtilsGetLastDayOfMonthTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0001
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0001
     * @tc.desc      getLastDayOfMonth(year=2024, month=1) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0001 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 1);
      logInfo(`getLastDayOfMonth(year=2024, month=1): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0002
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0002
     * @tc.desc      getLastDayOfMonth(year=2024, month=2) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0002 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 2);
      logInfo(`getLastDayOfMonth(year=2024, month=2): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0003
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0003
     * @tc.desc      getLastDayOfMonth(year=2024, month=-1) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0003 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, -1);
      logInfo(`getLastDayOfMonth(year=2024, month=-1): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0004
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0004
     * @tc.desc      getLastDayOfMonth(year=2023, month=2) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0004 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 2);
      logInfo(`getLastDayOfMonth(year=2023, month=2): actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0005
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0005
     * @tc.desc      getLastDayOfMonth(year=2024, month=0) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0005 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 0);
      logInfo(`getLastDayOfMonth(year=2024, month=0): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0005 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0006
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0006
     * @tc.desc      getLastDayOfMonth(year=2024, month=6) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0006 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 6);
      logInfo(`getLastDayOfMonth(year=2024, month=6): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0006 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0007
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0007
     * @tc.desc      getLastDayOfMonth(year=2024, month=12) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0007 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 12);
      logInfo(`getLastDayOfMonth(year=2024, month=12): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0007 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0008
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0008
     * @tc.desc      getLastDayOfMonth(year=2024, month=13) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0008 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 13);
      logInfo(`getLastDayOfMonth(year=2024, month=13): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0008 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0009
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0009
     * @tc.desc      getLastDayOfMonth(year=2024, month=3) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0009 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 3);
      logInfo(`getLastDayOfMonth(year=2024, month=3): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0009 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0010
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0010
     * @tc.desc      getLastDayOfMonth(year=2024, month=10) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0010 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 10);
      logInfo(`getLastDayOfMonth(year=2024, month=10): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0010 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0011
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0011
     * @tc.desc      getLastDayOfMonth(year=2024, month=100) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0011 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 100);
      logInfo(`getLastDayOfMonth(year=2024, month=100): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0011 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0012
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0012
     * @tc.desc      getLastDayOfMonth(year=2024, month=5) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0012 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 5);
      logInfo(`getLastDayOfMonth(year=2024, month=5): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0012 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0013
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0013
     * @tc.desc      getLastDayOfMonth(year=2024, month=15) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0013 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 15);
      logInfo(`getLastDayOfMonth(year=2024, month=15): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0013 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0014
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0014
     * @tc.desc      getLastDayOfMonth(year=2024, month=20) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0014 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 20);
      logInfo(`getLastDayOfMonth(year=2024, month=20): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0014 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0015
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0015
     * @tc.desc      getLastDayOfMonth(year=2024, month=25) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0015 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 25);
      logInfo(`getLastDayOfMonth(year=2024, month=25): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0015 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0016
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0016
     * @tc.desc      getLastDayOfMonth(year=2024, month=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0016 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 30);
      logInfo(`getLastDayOfMonth(year=2024, month=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0016 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0017
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0017
     * @tc.desc      getLastDayOfMonth(year=2024, month=35) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0017 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 35);
      logInfo(`getLastDayOfMonth(year=2024, month=35): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0017 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0018
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0018
     * @tc.desc      getLastDayOfMonth(year=2024, month=40) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0018 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 40);
      logInfo(`getLastDayOfMonth(year=2024, month=40): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0018 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0019
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0019
     * @tc.desc      getLastDayOfMonth(year=2024, month=45) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0019 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 45);
      logInfo(`getLastDayOfMonth(year=2024, month=45): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0019 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0020
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0020
     * @tc.desc      getLastDayOfMonth(year=2024, month=50) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0020 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 50);
      logInfo(`getLastDayOfMonth(year=2024, month=50): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0020 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0021
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0021
     * @tc.desc      getLastDayOfMonth(year=2024, month=55) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0021 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 55);
      logInfo(`getLastDayOfMonth(year=2024, month=55): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0021 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0022
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0022
     * @tc.desc      getLastDayOfMonth(year=2024, month=60) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0022 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 60);
      logInfo(`getLastDayOfMonth(year=2024, month=60): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0022 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0023
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0023
     * @tc.desc      getLastDayOfMonth(year=2024, month=65) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0023 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 65);
      logInfo(`getLastDayOfMonth(year=2024, month=65): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0023 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0024
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0024
     * @tc.desc      getLastDayOfMonth(year=2024, month=70) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0024 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 70);
      logInfo(`getLastDayOfMonth(year=2024, month=70): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0024 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0025
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0025
     * @tc.desc      getLastDayOfMonth(year=2024, month=75) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0025 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 75);
      logInfo(`getLastDayOfMonth(year=2024, month=75): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0025 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0026
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0026
     * @tc.desc      getLastDayOfMonth(year=2024, month=80) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0026 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 80);
      logInfo(`getLastDayOfMonth(year=2024, month=80): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0026 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0027
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0027
     * @tc.desc      getLastDayOfMonth(year=2024, month=85) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0027 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 85);
      logInfo(`getLastDayOfMonth(year=2024, month=85): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0027 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0028
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0028
     * @tc.desc      getLastDayOfMonth(year=2024, month=90) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0028 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 90);
      logInfo(`getLastDayOfMonth(year=2024, month=90): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0028 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0029
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0029
     * @tc.desc      getLastDayOfMonth(year=2024, month=95) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0029 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 95);
      logInfo(`getLastDayOfMonth(year=2024, month=95): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0029 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0030
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0030
     * @tc.desc      getLastDayOfMonth(year=2024, month=-61) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0030 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, -61);
      logInfo(`getLastDayOfMonth(year=2024, month=-61): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0030 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0031
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0031
     * @tc.desc      getLastDayOfMonth(year=2024, month=114) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0031 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2024, 114);
      logInfo(`getLastDayOfMonth(year=2024, month=114): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0031 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0032
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0032
     * @tc.desc      getLastDayOfMonth(year=2023, month=1) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0032 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 1);
      logInfo(`getLastDayOfMonth(year=2023, month=1): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0032 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0033
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0033
     * @tc.desc      getLastDayOfMonth(year=2023, month=0) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0033 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 0);
      logInfo(`getLastDayOfMonth(year=2023, month=0): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0033 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0034
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0034
     * @tc.desc      getLastDayOfMonth(year=2023, month=-1) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0034 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, -1);
      logInfo(`getLastDayOfMonth(year=2023, month=-1): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0034 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0035
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0035
     * @tc.desc      getLastDayOfMonth(year=2023, month=6) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0035 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 6);
      logInfo(`getLastDayOfMonth(year=2023, month=6): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0035 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0036
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0036
     * @tc.desc      getLastDayOfMonth(year=2023, month=12) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0036 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 12);
      logInfo(`getLastDayOfMonth(year=2023, month=12): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0036 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0037
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0037
     * @tc.desc      getLastDayOfMonth(year=2023, month=13) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0037 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 13);
      logInfo(`getLastDayOfMonth(year=2023, month=13): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0037 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0038
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0038
     * @tc.desc      getLastDayOfMonth(year=2023, month=3) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0038 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 3);
      logInfo(`getLastDayOfMonth(year=2023, month=3): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0038 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0039
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0039
     * @tc.desc      getLastDayOfMonth(year=2023, month=10) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0039 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 10);
      logInfo(`getLastDayOfMonth(year=2023, month=10): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0039 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0040
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0040
     * @tc.desc      getLastDayOfMonth(year=2023, month=100) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0040 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 100);
      logInfo(`getLastDayOfMonth(year=2023, month=100): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0040 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0041
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0041
     * @tc.desc      getLastDayOfMonth(year=2023, month=5) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0041 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 5);
      logInfo(`getLastDayOfMonth(year=2023, month=5): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0041 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0042
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0042
     * @tc.desc      getLastDayOfMonth(year=2023, month=15) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0042 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 15);
      logInfo(`getLastDayOfMonth(year=2023, month=15): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0042 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0043
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0043
     * @tc.desc      getLastDayOfMonth(year=2023, month=20) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0043 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 20);
      logInfo(`getLastDayOfMonth(year=2023, month=20): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0043 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0044
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0044
     * @tc.desc      getLastDayOfMonth(year=2023, month=25) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0044 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 25);
      logInfo(`getLastDayOfMonth(year=2023, month=25): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0044 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0045
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0045
     * @tc.desc      getLastDayOfMonth(year=2023, month=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0045 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 30);
      logInfo(`getLastDayOfMonth(year=2023, month=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0045 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0046
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0046
     * @tc.desc      getLastDayOfMonth(year=2023, month=35) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0046 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 35);
      logInfo(`getLastDayOfMonth(year=2023, month=35): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0046 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0047
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0047
     * @tc.desc      getLastDayOfMonth(year=2023, month=40) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0047 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 40);
      logInfo(`getLastDayOfMonth(year=2023, month=40): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0047 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0048
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0048
     * @tc.desc      getLastDayOfMonth(year=2023, month=45) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0048 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 45);
      logInfo(`getLastDayOfMonth(year=2023, month=45): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0048 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0049
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0049
     * @tc.desc      getLastDayOfMonth(year=2023, month=50) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0049 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 50);
      logInfo(`getLastDayOfMonth(year=2023, month=50): actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0049 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0050
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0050
     * @tc.desc      getLastDayOfMonth(year=2023, month=55) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0050 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 55);
      logInfo(`getLastDayOfMonth(year=2023, month=55): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0050 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0051
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0051
     * @tc.desc      getLastDayOfMonth(year=2023, month=60) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0051 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 60);
      logInfo(`getLastDayOfMonth(year=2023, month=60): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0051 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0052
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0052
     * @tc.desc      getLastDayOfMonth(year=2023, month=65) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0052 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 65);
      logInfo(`getLastDayOfMonth(year=2023, month=65): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0052 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0053
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0053
     * @tc.desc      getLastDayOfMonth(year=2023, month=70) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0053 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 70);
      logInfo(`getLastDayOfMonth(year=2023, month=70): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0053 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0054
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0054
     * @tc.desc      getLastDayOfMonth(year=2023, month=75) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0054 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 75);
      logInfo(`getLastDayOfMonth(year=2023, month=75): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0054 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0055
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0055
     * @tc.desc      getLastDayOfMonth(year=2023, month=80) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0055 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 80);
      logInfo(`getLastDayOfMonth(year=2023, month=80): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0055 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0056
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0056
     * @tc.desc      getLastDayOfMonth(year=2023, month=85) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0056 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 85);
      logInfo(`getLastDayOfMonth(year=2023, month=85): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0056 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0057
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0057
     * @tc.desc      getLastDayOfMonth(year=2023, month=90) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0057 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 90);
      logInfo(`getLastDayOfMonth(year=2023, month=90): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0057 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0058
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0058
     * @tc.desc      getLastDayOfMonth(year=2023, month=95) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0058 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 95);
      logInfo(`getLastDayOfMonth(year=2023, month=95): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0058 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0059
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0059
     * @tc.desc      getLastDayOfMonth(year=2023, month=-61) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0059 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, -61);
      logInfo(`getLastDayOfMonth(year=2023, month=-61): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0059 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0060
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0060
     * @tc.desc      getLastDayOfMonth(year=2023, month=114) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0060 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(2023, 114);
      logInfo(`getLastDayOfMonth(year=2023, month=114): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0060 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0061
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0061
     * @tc.desc      getLastDayOfMonth(year=0, month=1) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0061 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 1);
      logInfo(`getLastDayOfMonth(year=0, month=1): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0061 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0062
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0062
     * @tc.desc      getLastDayOfMonth(year=0, month=2) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0062 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 2);
      logInfo(`getLastDayOfMonth(year=0, month=2): actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0062 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0063
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0063
     * @tc.desc      getLastDayOfMonth(year=0, month=0) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0063 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 0);
      logInfo(`getLastDayOfMonth(year=0, month=0): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0063 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0064
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0064
     * @tc.desc      getLastDayOfMonth(year=0, month=-1) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0064 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, -1);
      logInfo(`getLastDayOfMonth(year=0, month=-1): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0064 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0065
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0065
     * @tc.desc      getLastDayOfMonth(year=0, month=6) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0065 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 6);
      logInfo(`getLastDayOfMonth(year=0, month=6): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0065 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0066
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0066
     * @tc.desc      getLastDayOfMonth(year=0, month=12) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0066 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 12);
      logInfo(`getLastDayOfMonth(year=0, month=12): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0066 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0067
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0067
     * @tc.desc      getLastDayOfMonth(year=0, month=13) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0067 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 13);
      logInfo(`getLastDayOfMonth(year=0, month=13): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0067 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0068
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0068
     * @tc.desc      getLastDayOfMonth(year=0, month=3) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0068 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 3);
      logInfo(`getLastDayOfMonth(year=0, month=3): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0068 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0069
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0069
     * @tc.desc      getLastDayOfMonth(year=0, month=10) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0069 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 10);
      logInfo(`getLastDayOfMonth(year=0, month=10): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0069 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0070
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0070
     * @tc.desc      getLastDayOfMonth(year=0, month=100) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0070 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 100);
      logInfo(`getLastDayOfMonth(year=0, month=100): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0070 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0071
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0071
     * @tc.desc      getLastDayOfMonth(year=0, month=5) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0071 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 5);
      logInfo(`getLastDayOfMonth(year=0, month=5): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0071 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0072
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0072
     * @tc.desc      getLastDayOfMonth(year=0, month=15) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0072 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 15);
      logInfo(`getLastDayOfMonth(year=0, month=15): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0072 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0073
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0073
     * @tc.desc      getLastDayOfMonth(year=0, month=20) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0073 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 20);
      logInfo(`getLastDayOfMonth(year=0, month=20): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0073 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0074
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0074
     * @tc.desc      getLastDayOfMonth(year=0, month=25) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0074 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 25);
      logInfo(`getLastDayOfMonth(year=0, month=25): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0074 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0075
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0075
     * @tc.desc      getLastDayOfMonth(year=0, month=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0075 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 30);
      logInfo(`getLastDayOfMonth(year=0, month=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0075 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0076
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0076
     * @tc.desc      getLastDayOfMonth(year=0, month=35) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0076 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 35);
      logInfo(`getLastDayOfMonth(year=0, month=35): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0076 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0077
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0077
     * @tc.desc      getLastDayOfMonth(year=0, month=40) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0077 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 40);
      logInfo(`getLastDayOfMonth(year=0, month=40): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0077 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0078
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0078
     * @tc.desc      getLastDayOfMonth(year=0, month=45) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0078 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 45);
      logInfo(`getLastDayOfMonth(year=0, month=45): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0078 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0079
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0079
     * @tc.desc      getLastDayOfMonth(year=0, month=50) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0079 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 50);
      logInfo(`getLastDayOfMonth(year=0, month=50): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0079 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0080
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0080
     * @tc.desc      getLastDayOfMonth(year=0, month=55) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0080 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 55);
      logInfo(`getLastDayOfMonth(year=0, month=55): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0080 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0081
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0081
     * @tc.desc      getLastDayOfMonth(year=0, month=60) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0081 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 60);
      logInfo(`getLastDayOfMonth(year=0, month=60): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0081 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0082
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0082
     * @tc.desc      getLastDayOfMonth(year=0, month=65) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0082 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 65);
      logInfo(`getLastDayOfMonth(year=0, month=65): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0082 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0083
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0083
     * @tc.desc      getLastDayOfMonth(year=0, month=70) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0083 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 70);
      logInfo(`getLastDayOfMonth(year=0, month=70): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0083 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0084
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0084
     * @tc.desc      getLastDayOfMonth(year=0, month=75) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0084 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 75);
      logInfo(`getLastDayOfMonth(year=0, month=75): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0084 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0085
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0085
     * @tc.desc      getLastDayOfMonth(year=0, month=80) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0085 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 80);
      logInfo(`getLastDayOfMonth(year=0, month=80): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0085 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0086
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0086
     * @tc.desc      getLastDayOfMonth(year=0, month=85) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0086 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 85);
      logInfo(`getLastDayOfMonth(year=0, month=85): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0086 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0087
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0087
     * @tc.desc      getLastDayOfMonth(year=0, month=90) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0087 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 90);
      logInfo(`getLastDayOfMonth(year=0, month=90): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0087 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0088
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0088
     * @tc.desc      getLastDayOfMonth(year=0, month=95) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0088 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 95);
      logInfo(`getLastDayOfMonth(year=0, month=95): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0088 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0089
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0089
     * @tc.desc      getLastDayOfMonth(year=0, month=-61) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0089 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, -61);
      logInfo(`getLastDayOfMonth(year=0, month=-61): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0089 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0090
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0090
     * @tc.desc      getLastDayOfMonth(year=0, month=114) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0090 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(0, 114);
      logInfo(`getLastDayOfMonth(year=0, month=114): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0090 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0091
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0091
     * @tc.desc      getLastDayOfMonth(year=-1, month=1) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0091 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(-1, 1);
      logInfo(`getLastDayOfMonth(year=-1, month=1): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0091 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0092
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0092
     * @tc.desc      getLastDayOfMonth(year=-1, month=2) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0092 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(-1, 2);
      logInfo(`getLastDayOfMonth(year=-1, month=2): actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0092 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0093
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0093
     * @tc.desc      getLastDayOfMonth(year=-1, month=0) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0093 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(-1, 0);
      logInfo(`getLastDayOfMonth(year=-1, month=0): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0093 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0094
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0094
     * @tc.desc      getLastDayOfMonth(year=-1, month=-1) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0094 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(-1, -1);
      logInfo(`getLastDayOfMonth(year=-1, month=-1): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0094 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0095
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0095
     * @tc.desc      getLastDayOfMonth(year=-1, month=6) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0095 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(-1, 6);
      logInfo(`getLastDayOfMonth(year=-1, month=6): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0095 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0096
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0096
     * @tc.desc      getLastDayOfMonth(year=-1, month=12) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0096 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(-1, 12);
      logInfo(`getLastDayOfMonth(year=-1, month=12): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0096 end`);
    });
  });
}
