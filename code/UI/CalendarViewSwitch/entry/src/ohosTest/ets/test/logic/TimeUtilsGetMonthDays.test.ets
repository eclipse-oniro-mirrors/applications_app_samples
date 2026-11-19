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

/** Logic checks for TimeUtils.getMonthDays (96 cases). */
export default function timeUtilsGetMonthDaysTest(): void {
  describe('TimeUtilsGetMonthDaysTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0001
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0001
     * @tc.desc      getMonthDays(year=2024, month=1) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0001 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 1);
      logInfo(`getMonthDays(year=2024, month=1): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0002
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0002
     * @tc.desc      getMonthDays(year=2024, month=2) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0002 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 2);
      logInfo(`getMonthDays(year=2024, month=2): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0003
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0003
     * @tc.desc      getMonthDays(year=2024, month=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0003 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 0);
      logInfo(`getMonthDays(year=2024, month=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0004
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0004
     * @tc.desc      getMonthDays(year=2024, month=4) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0004 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 4);
      logInfo(`getMonthDays(year=2024, month=4): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0005
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0005
     * @tc.desc      getMonthDays(year=2023, month=2) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0005 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 2);
      logInfo(`getMonthDays(year=2023, month=2): actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0005 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0006
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0006
     * @tc.desc      getMonthDays(year=2024, month=3) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0006 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 3);
      logInfo(`getMonthDays(year=2024, month=3): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0006 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0007
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0007
     * @tc.desc      getMonthDays(year=2024, month=5) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0007 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 5);
      logInfo(`getMonthDays(year=2024, month=5): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0007 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0008
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0008
     * @tc.desc      getMonthDays(year=2024, month=6) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0008 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 6);
      logInfo(`getMonthDays(year=2024, month=6): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0008 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0009
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0009
     * @tc.desc      getMonthDays(year=2024, month=7) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0009 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 7);
      logInfo(`getMonthDays(year=2024, month=7): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0009 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0010
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0010
     * @tc.desc      getMonthDays(year=2024, month=8) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0010 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 8);
      logInfo(`getMonthDays(year=2024, month=8): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0010 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0011
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0011
     * @tc.desc      getMonthDays(year=2024, month=9) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0011 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 9);
      logInfo(`getMonthDays(year=2024, month=9): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0011 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0012
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0012
     * @tc.desc      getMonthDays(year=2024, month=10) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0012 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 10);
      logInfo(`getMonthDays(year=2024, month=10): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0012 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0013
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0013
     * @tc.desc      getMonthDays(year=2024, month=11) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0013 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 11);
      logInfo(`getMonthDays(year=2024, month=11): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0013 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0014
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0014
     * @tc.desc      getMonthDays(year=2024, month=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0014 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 20);
      logInfo(`getMonthDays(year=2024, month=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0014 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0015
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0015
     * @tc.desc      getMonthDays(year=2024, month=12) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0015 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 12);
      logInfo(`getMonthDays(year=2024, month=12): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0015 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0016
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0016
     * @tc.desc      getMonthDays(year=2024, month=13) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0016 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 13);
      logInfo(`getMonthDays(year=2024, month=13): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0016 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0017
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0017
     * @tc.desc      getMonthDays(year=2024, month=24) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0017 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 24);
      logInfo(`getMonthDays(year=2024, month=24): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0017 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0018
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0018
     * @tc.desc      getMonthDays(year=2024, month=31) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0018 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 31);
      logInfo(`getMonthDays(year=2024, month=31): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0018 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0019
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0019
     * @tc.desc      getMonthDays(year=2024, month=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0019 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 30);
      logInfo(`getMonthDays(year=2024, month=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0019 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0020
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0020
     * @tc.desc      getMonthDays(year=2024, month=32) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0020 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 32);
      logInfo(`getMonthDays(year=2024, month=32): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0020 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0021
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0021
     * @tc.desc      getMonthDays(year=2024, month=62) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0021 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 62);
      logInfo(`getMonthDays(year=2024, month=62): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0021 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0022
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0022
     * @tc.desc      getMonthDays(year=2024, month=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0022 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 15);
      logInfo(`getMonthDays(year=2024, month=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0022 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0023
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0023
     * @tc.desc      getMonthDays(year=2024, month=22) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0023 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 22);
      logInfo(`getMonthDays(year=2024, month=22): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0023 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0024
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0024
     * @tc.desc      getMonthDays(year=2024, month=29) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0024 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 29);
      logInfo(`getMonthDays(year=2024, month=29): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0024 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0025
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0025
     * @tc.desc      getMonthDays(year=2024, month=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0025 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 60);
      logInfo(`getMonthDays(year=2024, month=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0025 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0026
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0026
     * @tc.desc      getMonthDays(year=2024, month=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0026 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, -1);
      logInfo(`getMonthDays(year=2024, month=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0026 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0027
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0027
     * @tc.desc      getMonthDays(year=2024, month=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0027 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 100);
      logInfo(`getMonthDays(year=2024, month=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0027 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0028
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0028
     * @tc.desc      getMonthDays(year=2024, month=99) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0028 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 99);
      logInfo(`getMonthDays(year=2024, month=99): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0028 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0029
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0029
     * @tc.desc      getMonthDays(year=2024, month=101) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0029 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 101);
      logInfo(`getMonthDays(year=2024, month=101): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0029 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0030
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0030
     * @tc.desc      getMonthDays(year=2024, month=200) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0030 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 200);
      logInfo(`getMonthDays(year=2024, month=200): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0030 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0031
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0031
     * @tc.desc      getMonthDays(year=2024, month=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0031 begin`);
      const actual: number = TimeUtils.getMonthDays(2024, 50);
      logInfo(`getMonthDays(year=2024, month=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0031 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0032
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0032
     * @tc.desc      getMonthDays(year=2023, month=1) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0032 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 1);
      logInfo(`getMonthDays(year=2023, month=1): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0032 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0033
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0033
     * @tc.desc      getMonthDays(year=2023, month=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0033 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 0);
      logInfo(`getMonthDays(year=2023, month=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0033 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0034
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0034
     * @tc.desc      getMonthDays(year=2023, month=3) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0034 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 3);
      logInfo(`getMonthDays(year=2023, month=3): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0034 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0035
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0035
     * @tc.desc      getMonthDays(year=2023, month=4) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0035 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 4);
      logInfo(`getMonthDays(year=2023, month=4): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0035 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0036
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0036
     * @tc.desc      getMonthDays(year=2023, month=5) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0036 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 5);
      logInfo(`getMonthDays(year=2023, month=5): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0036 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0037
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0037
     * @tc.desc      getMonthDays(year=2023, month=6) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0037 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 6);
      logInfo(`getMonthDays(year=2023, month=6): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0037 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0038
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0038
     * @tc.desc      getMonthDays(year=2023, month=7) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0038 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 7);
      logInfo(`getMonthDays(year=2023, month=7): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0038 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0039
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0039
     * @tc.desc      getMonthDays(year=2023, month=8) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0039 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 8);
      logInfo(`getMonthDays(year=2023, month=8): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0039 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0040
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0040
     * @tc.desc      getMonthDays(year=2023, month=9) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0040 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 9);
      logInfo(`getMonthDays(year=2023, month=9): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0040 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0041
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0041
     * @tc.desc      getMonthDays(year=2023, month=10) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0041 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 10);
      logInfo(`getMonthDays(year=2023, month=10): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0041 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0042
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0042
     * @tc.desc      getMonthDays(year=2023, month=11) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0042 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 11);
      logInfo(`getMonthDays(year=2023, month=11): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0042 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0043
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0043
     * @tc.desc      getMonthDays(year=2023, month=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0043 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 20);
      logInfo(`getMonthDays(year=2023, month=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0043 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0044
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0044
     * @tc.desc      getMonthDays(year=2023, month=12) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0044 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 12);
      logInfo(`getMonthDays(year=2023, month=12): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0044 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0045
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0045
     * @tc.desc      getMonthDays(year=2023, month=13) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0045 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 13);
      logInfo(`getMonthDays(year=2023, month=13): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0045 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0046
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0046
     * @tc.desc      getMonthDays(year=2023, month=24) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0046 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 24);
      logInfo(`getMonthDays(year=2023, month=24): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0046 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0047
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0047
     * @tc.desc      getMonthDays(year=2023, month=31) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0047 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 31);
      logInfo(`getMonthDays(year=2023, month=31): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0047 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0048
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0048
     * @tc.desc      getMonthDays(year=2023, month=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0048 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 30);
      logInfo(`getMonthDays(year=2023, month=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0048 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0049
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0049
     * @tc.desc      getMonthDays(year=2023, month=32) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0049 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 32);
      logInfo(`getMonthDays(year=2023, month=32): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0049 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0050
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0050
     * @tc.desc      getMonthDays(year=2023, month=62) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0050 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 62);
      logInfo(`getMonthDays(year=2023, month=62): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0050 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0051
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0051
     * @tc.desc      getMonthDays(year=2023, month=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0051 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 15);
      logInfo(`getMonthDays(year=2023, month=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0051 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0052
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0052
     * @tc.desc      getMonthDays(year=2023, month=22) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0052 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 22);
      logInfo(`getMonthDays(year=2023, month=22): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0052 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0053
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0053
     * @tc.desc      getMonthDays(year=2023, month=29) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0053 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 29);
      logInfo(`getMonthDays(year=2023, month=29): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0053 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0054
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0054
     * @tc.desc      getMonthDays(year=2023, month=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0054 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 60);
      logInfo(`getMonthDays(year=2023, month=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0054 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0055
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0055
     * @tc.desc      getMonthDays(year=2023, month=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0055 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, -1);
      logInfo(`getMonthDays(year=2023, month=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0055 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0056
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0056
     * @tc.desc      getMonthDays(year=2023, month=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0056 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 100);
      logInfo(`getMonthDays(year=2023, month=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0056 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0057
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0057
     * @tc.desc      getMonthDays(year=2023, month=99) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0057 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 99);
      logInfo(`getMonthDays(year=2023, month=99): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0057 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0058
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0058
     * @tc.desc      getMonthDays(year=2023, month=101) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0058 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 101);
      logInfo(`getMonthDays(year=2023, month=101): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0058 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0059
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0059
     * @tc.desc      getMonthDays(year=2023, month=200) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0059 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 200);
      logInfo(`getMonthDays(year=2023, month=200): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0059 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0060
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0060
     * @tc.desc      getMonthDays(year=2023, month=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0060 begin`);
      const actual: number = TimeUtils.getMonthDays(2023, 50);
      logInfo(`getMonthDays(year=2023, month=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0060 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0061
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0061
     * @tc.desc      getMonthDays(year=1, month=1) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0061 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 1);
      logInfo(`getMonthDays(year=1, month=1): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0061 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0062
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0062
     * @tc.desc      getMonthDays(year=1, month=2) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0062 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 2);
      logInfo(`getMonthDays(year=1, month=2): actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0062 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0063
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0063
     * @tc.desc      getMonthDays(year=1, month=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0063 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 0);
      logInfo(`getMonthDays(year=1, month=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0063 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0064
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0064
     * @tc.desc      getMonthDays(year=1, month=3) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0064 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 3);
      logInfo(`getMonthDays(year=1, month=3): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0064 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0065
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0065
     * @tc.desc      getMonthDays(year=1, month=4) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0065 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 4);
      logInfo(`getMonthDays(year=1, month=4): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0065 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0066
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0066
     * @tc.desc      getMonthDays(year=1, month=5) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0066 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 5);
      logInfo(`getMonthDays(year=1, month=5): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0066 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0067
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0067
     * @tc.desc      getMonthDays(year=1, month=6) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0067 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 6);
      logInfo(`getMonthDays(year=1, month=6): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0067 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0068
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0068
     * @tc.desc      getMonthDays(year=1, month=7) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0068 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 7);
      logInfo(`getMonthDays(year=1, month=7): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0068 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0069
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0069
     * @tc.desc      getMonthDays(year=1, month=8) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0069 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 8);
      logInfo(`getMonthDays(year=1, month=8): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0069 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0070
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0070
     * @tc.desc      getMonthDays(year=1, month=9) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0070 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 9);
      logInfo(`getMonthDays(year=1, month=9): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0070 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0071
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0071
     * @tc.desc      getMonthDays(year=1, month=10) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0071 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 10);
      logInfo(`getMonthDays(year=1, month=10): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0071 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0072
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0072
     * @tc.desc      getMonthDays(year=1, month=11) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0072 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 11);
      logInfo(`getMonthDays(year=1, month=11): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0072 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0073
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0073
     * @tc.desc      getMonthDays(year=1, month=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0073 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 20);
      logInfo(`getMonthDays(year=1, month=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0073 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0074
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0074
     * @tc.desc      getMonthDays(year=1, month=12) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0074 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 12);
      logInfo(`getMonthDays(year=1, month=12): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0074 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0075
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0075
     * @tc.desc      getMonthDays(year=1, month=13) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0075 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 13);
      logInfo(`getMonthDays(year=1, month=13): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0075 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0076
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0076
     * @tc.desc      getMonthDays(year=1, month=24) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0076 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 24);
      logInfo(`getMonthDays(year=1, month=24): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0076 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0077
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0077
     * @tc.desc      getMonthDays(year=1, month=31) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0077 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 31);
      logInfo(`getMonthDays(year=1, month=31): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0077 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0078
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0078
     * @tc.desc      getMonthDays(year=1, month=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0078 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 30);
      logInfo(`getMonthDays(year=1, month=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0078 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0079
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0079
     * @tc.desc      getMonthDays(year=1, month=32) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0079 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 32);
      logInfo(`getMonthDays(year=1, month=32): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0079 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0080
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0080
     * @tc.desc      getMonthDays(year=1, month=62) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0080 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 62);
      logInfo(`getMonthDays(year=1, month=62): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0080 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0081
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0081
     * @tc.desc      getMonthDays(year=1, month=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0081 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 15);
      logInfo(`getMonthDays(year=1, month=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0081 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0082
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0082
     * @tc.desc      getMonthDays(year=1, month=22) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0082 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 22);
      logInfo(`getMonthDays(year=1, month=22): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0082 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0083
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0083
     * @tc.desc      getMonthDays(year=1, month=29) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0083 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 29);
      logInfo(`getMonthDays(year=1, month=29): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0083 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0084
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0084
     * @tc.desc      getMonthDays(year=1, month=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0084 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 60);
      logInfo(`getMonthDays(year=1, month=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0084 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0085
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0085
     * @tc.desc      getMonthDays(year=1, month=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0085 begin`);
      const actual: number = TimeUtils.getMonthDays(1, -1);
      logInfo(`getMonthDays(year=1, month=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0085 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0086
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0086
     * @tc.desc      getMonthDays(year=1, month=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0086 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 100);
      logInfo(`getMonthDays(year=1, month=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0086 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0087
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0087
     * @tc.desc      getMonthDays(year=1, month=99) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0087 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 99);
      logInfo(`getMonthDays(year=1, month=99): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0087 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0088
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0088
     * @tc.desc      getMonthDays(year=1, month=101) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0088 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 101);
      logInfo(`getMonthDays(year=1, month=101): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0088 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0089
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0089
     * @tc.desc      getMonthDays(year=1, month=200) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0089 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 200);
      logInfo(`getMonthDays(year=1, month=200): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0089 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0090
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0090
     * @tc.desc      getMonthDays(year=1, month=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0090 begin`);
      const actual: number = TimeUtils.getMonthDays(1, 50);
      logInfo(`getMonthDays(year=1, month=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0090 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0091
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0091
     * @tc.desc      getMonthDays(year=0, month=1) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0091 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 1);
      logInfo(`getMonthDays(year=0, month=1): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0091 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0092
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0092
     * @tc.desc      getMonthDays(year=0, month=2) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0092 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 2);
      logInfo(`getMonthDays(year=0, month=2): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0092 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0093
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0093
     * @tc.desc      getMonthDays(year=0, month=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0093 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 0);
      logInfo(`getMonthDays(year=0, month=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0093 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0094
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0094
     * @tc.desc      getMonthDays(year=0, month=3) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0094 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 3);
      logInfo(`getMonthDays(year=0, month=3): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0094 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0095
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0095
     * @tc.desc      getMonthDays(year=0, month=4) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0095 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 4);
      logInfo(`getMonthDays(year=0, month=4): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0095 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0096
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0096
     * @tc.desc      getMonthDays(year=0, month=5) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0096 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 5);
      logInfo(`getMonthDays(year=0, month=5): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0096 end`);
    });
  });
}
