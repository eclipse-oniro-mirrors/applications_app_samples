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

/** Logic checks for TimeUtils.getWeekDay (96 cases). */
export default function timeUtilsGetWeekDayTest(): void {
  describe('TimeUtilsGetWeekDayTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0001
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0001
     * @tc.desc      getWeekDay(year=2024, month=1, day=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0001 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 1, 1);
      logInfo(`getWeekDay(year=2024, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0002
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0002
     * @tc.desc      getWeekDay(year=2023, month=1, day=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0002 begin`);
      const actual: number = TimeUtils.getWeekDay(2023, 1, 1);
      logInfo(`getWeekDay(year=2023, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0003
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0003
     * @tc.desc      getWeekDay(year=1, month=1, day=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0003 begin`);
      const actual: number = TimeUtils.getWeekDay(1, 1, 1);
      logInfo(`getWeekDay(year=1, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0004
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0004
     * @tc.desc      getWeekDay(year=2, month=1, day=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0004 begin`);
      const actual: number = TimeUtils.getWeekDay(2, 1, 1);
      logInfo(`getWeekDay(year=2, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0005
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0005
     * @tc.desc      getWeekDay(year=2000, month=1, day=1) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0005 begin`);
      const actual: number = TimeUtils.getWeekDay(2000, 1, 1);
      logInfo(`getWeekDay(year=2000, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0005 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0006
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0006
     * @tc.desc      getWeekDay(year=2100, month=1, day=1) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0006 begin`);
      const actual: number = TimeUtils.getWeekDay(2100, 1, 1);
      logInfo(`getWeekDay(year=2100, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0006 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0007
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0007
     * @tc.desc      getWeekDay(year=1970, month=1, day=1) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0007 begin`);
      const actual: number = TimeUtils.getWeekDay(1970, 1, 1);
      logInfo(`getWeekDay(year=1970, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0007 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0008
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0008
     * @tc.desc      getWeekDay(year=0, month=1, day=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0008 begin`);
      const actual: number = TimeUtils.getWeekDay(0, 1, 1);
      logInfo(`getWeekDay(year=0, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0008 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0009
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0009
     * @tc.desc      getWeekDay(year=1900, month=1, day=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0009 begin`);
      const actual: number = TimeUtils.getWeekDay(1900, 1, 1);
      logInfo(`getWeekDay(year=1900, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0009 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0010
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0010
     * @tc.desc      getWeekDay(year=2025, month=1, day=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0010 begin`);
      const actual: number = TimeUtils.getWeekDay(2025, 1, 1);
      logInfo(`getWeekDay(year=2025, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0010 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0011
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0011
     * @tc.desc      getWeekDay(year=-1, month=1, day=1) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0011 begin`);
      const actual: number = TimeUtils.getWeekDay(-1, 1, 1);
      logInfo(`getWeekDay(year=-1, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0011 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0012
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0012
     * @tc.desc      getWeekDay(year=3, month=1, day=1) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0012 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 1, 1);
      logInfo(`getWeekDay(year=3, month=1, day=1): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0012 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0013
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0013
     * @tc.desc      getWeekDay(year=2024, month=2, day=1) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0013 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 2, 1);
      logInfo(`getWeekDay(year=2024, month=2, day=1): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0013 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0014
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0014
     * @tc.desc      getWeekDay(year=2024, month=0, day=1) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0014 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 0, 1);
      logInfo(`getWeekDay(year=2024, month=0, day=1): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0014 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0015
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0015
     * @tc.desc      getWeekDay(year=2024, month=6, day=1) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0015 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 6, 1);
      logInfo(`getWeekDay(year=2024, month=6, day=1): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0015 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0016
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0016
     * @tc.desc      getWeekDay(year=2024, month=12, day=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0016 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 12, 1);
      logInfo(`getWeekDay(year=2024, month=12, day=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0016 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0017
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0017
     * @tc.desc      getWeekDay(year=2024, month=13, day=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0017 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 13, 1);
      logInfo(`getWeekDay(year=2024, month=13, day=1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0017 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0018
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0018
     * @tc.desc      getWeekDay(year=2024, month=-1, day=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0018 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, -1, 1);
      logInfo(`getWeekDay(year=2024, month=-1, day=1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0018 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0019
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0019
     * @tc.desc      getWeekDay(year=2024, month=3, day=1) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0019 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 3, 1);
      logInfo(`getWeekDay(year=2024, month=3, day=1): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0019 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0020
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0020
     * @tc.desc      getWeekDay(year=2024, month=10, day=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0020 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 10, 1);
      logInfo(`getWeekDay(year=2024, month=10, day=1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0020 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0021
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0021
     * @tc.desc      getWeekDay(year=2024, month=100, day=1) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0021 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 100, 1);
      logInfo(`getWeekDay(year=2024, month=100, day=1): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0021 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0022
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0022
     * @tc.desc      getWeekDay(year=2024, month=5, day=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0022 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 5, 1);
      logInfo(`getWeekDay(year=2024, month=5, day=1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0022 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0023
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0023
     * @tc.desc      getWeekDay(year=2024, month=163, day=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0023 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 163, 1);
      logInfo(`getWeekDay(year=2024, month=163, day=1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0023 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0024
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0024
     * @tc.desc      getWeekDay(year=2024, month=1, day=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0024 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 1, 15);
      logInfo(`getWeekDay(year=2024, month=1, day=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0024 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0025
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0025
     * @tc.desc      getWeekDay(year=2024, month=1, day=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0025 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 1, 0);
      logInfo(`getWeekDay(year=2024, month=1, day=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0025 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0026
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0026
     * @tc.desc      getWeekDay(year=2024, month=1, day=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0026 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 1, 2);
      logInfo(`getWeekDay(year=2024, month=1, day=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0026 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0027
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0027
     * @tc.desc      getWeekDay(year=2024, month=1, day=28) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0027 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 1, 28);
      logInfo(`getWeekDay(year=2024, month=1, day=28): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0027 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0028
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0028
     * @tc.desc      getWeekDay(year=2024, month=1, day=29) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0028 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 1, 29);
      logInfo(`getWeekDay(year=2024, month=1, day=29): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0028 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0029
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0029
     * @tc.desc      getWeekDay(year=2024, month=1, day=30) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0029 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 1, 30);
      logInfo(`getWeekDay(year=2024, month=1, day=30): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0029 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0030
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0030
     * @tc.desc      getWeekDay(year=2024, month=1, day=31) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0030 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 1, 31);
      logInfo(`getWeekDay(year=2024, month=1, day=31): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0030 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0031
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0031
     * @tc.desc      getWeekDay(year=2024, month=1, day=-1) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0031 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 1, -1);
      logInfo(`getWeekDay(year=2024, month=1, day=-1): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0031 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0032
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0032
     * @tc.desc      getWeekDay(year=2024, month=1, day=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0032 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 1, 3);
      logInfo(`getWeekDay(year=2024, month=1, day=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0032 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0033
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0033
     * @tc.desc      getWeekDay(year=2024, month=1, day=10) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0033 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 1, 10);
      logInfo(`getWeekDay(year=2024, month=1, day=10): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0033 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0034
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0034
     * @tc.desc      getWeekDay(year=2024, month=1, day=100) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0034 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 1, 100);
      logInfo(`getWeekDay(year=2024, month=1, day=100): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0034 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0035
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0035
     * @tc.desc      getWeekDay(year=1900, month=5, day=15) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0035 begin`);
      const actual: number = TimeUtils.getWeekDay(1900, 5, 15);
      logInfo(`getWeekDay(year=1900, month=5, day=15): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0035 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0036
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0036
     * @tc.desc      getWeekDay(year=-1, month=5, day=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0036 begin`);
      const actual: number = TimeUtils.getWeekDay(-1, 5, 2);
      logInfo(`getWeekDay(year=-1, month=5, day=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0036 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0037
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0037
     * @tc.desc      getWeekDay(year=-1, month=12, day=31) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0037 begin`);
      const actual: number = TimeUtils.getWeekDay(-1, 12, 31);
      logInfo(`getWeekDay(year=-1, month=12, day=31): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0037 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0038
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0038
     * @tc.desc      getWeekDay(year=1970, month=3, day=10) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0038 begin`);
      const actual: number = TimeUtils.getWeekDay(1970, 3, 10);
      logInfo(`getWeekDay(year=1970, month=3, day=10): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0038 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0039
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0039
     * @tc.desc      getWeekDay(year=3, month=0, day=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0039 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 0, 3);
      logInfo(`getWeekDay(year=3, month=0, day=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0039 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0040
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0040
     * @tc.desc      getWeekDay(year=0, month=2, day=29) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0040 begin`);
      const actual: number = TimeUtils.getWeekDay(0, 2, 29);
      logInfo(`getWeekDay(year=0, month=2, day=29): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0040 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0041
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0041
     * @tc.desc      getWeekDay(year=1900, month=0, day=29) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0041 begin`);
      const actual: number = TimeUtils.getWeekDay(1900, 0, 29);
      logInfo(`getWeekDay(year=1900, month=0, day=29): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0041 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0042
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0042
     * @tc.desc      getWeekDay(year=3, month=2, day=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0042 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 2, 100);
      logInfo(`getWeekDay(year=3, month=2, day=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0042 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0043
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0043
     * @tc.desc      getWeekDay(year=0, month=10, day=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0043 begin`);
      const actual: number = TimeUtils.getWeekDay(0, 10, 1);
      logInfo(`getWeekDay(year=0, month=10, day=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0043 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0044
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0044
     * @tc.desc      getWeekDay(year=2100, month=12, day=31) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0044 begin`);
      const actual: number = TimeUtils.getWeekDay(2100, 12, 31);
      logInfo(`getWeekDay(year=2100, month=12, day=31): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0044 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0045
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0045
     * @tc.desc      getWeekDay(year=2025, month=100, day=15) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0045 begin`);
      const actual: number = TimeUtils.getWeekDay(2025, 100, 15);
      logInfo(`getWeekDay(year=2025, month=100, day=15): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0045 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0046
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0046
     * @tc.desc      getWeekDay(year=3, month=163, day=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0046 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 163, 3);
      logInfo(`getWeekDay(year=3, month=163, day=3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0046 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0047
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0047
     * @tc.desc      getWeekDay(year=2, month=1, day=29) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0047 begin`);
      const actual: number = TimeUtils.getWeekDay(2, 1, 29);
      logInfo(`getWeekDay(year=2, month=1, day=29): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0047 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0048
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0048
     * @tc.desc      getWeekDay(year=3, month=3, day=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0048 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 3, 30);
      logInfo(`getWeekDay(year=3, month=3, day=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0048 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0049
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0049
     * @tc.desc      getWeekDay(year=2, month=100, day=30) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0049 begin`);
      const actual: number = TimeUtils.getWeekDay(2, 100, 30);
      logInfo(`getWeekDay(year=2, month=100, day=30): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0049 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0050
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0050
     * @tc.desc      getWeekDay(year=1900, month=12, day=0) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0050 begin`);
      const actual: number = TimeUtils.getWeekDay(1900, 12, 0);
      logInfo(`getWeekDay(year=1900, month=12, day=0): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0050 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0051
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0051
     * @tc.desc      getWeekDay(year=2023, month=13, day=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0051 begin`);
      const actual: number = TimeUtils.getWeekDay(2023, 13, 0);
      logInfo(`getWeekDay(year=2023, month=13, day=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0051 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0052
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0052
     * @tc.desc      getWeekDay(year=2000, month=100, day=10) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0052 begin`);
      const actual: number = TimeUtils.getWeekDay(2000, 100, 10);
      logInfo(`getWeekDay(year=2000, month=100, day=10): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0052 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0053
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0053
     * @tc.desc      getWeekDay(year=3, month=5, day=100) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0053 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 5, 100);
      logInfo(`getWeekDay(year=3, month=5, day=100): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0053 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0054
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0054
     * @tc.desc      getWeekDay(year=2, month=5, day=3) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0054 begin`);
      const actual: number = TimeUtils.getWeekDay(2, 5, 3);
      logInfo(`getWeekDay(year=2, month=5, day=3): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0054 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0055
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0055
     * @tc.desc      getWeekDay(year=0, month=5, day=30) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0055 begin`);
      const actual: number = TimeUtils.getWeekDay(0, 5, 30);
      logInfo(`getWeekDay(year=0, month=5, day=30): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0055 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0056
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0056
     * @tc.desc      getWeekDay(year=1970, month=5, day=28) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0056 begin`);
      const actual: number = TimeUtils.getWeekDay(1970, 5, 28);
      logInfo(`getWeekDay(year=1970, month=5, day=28): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0056 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0057
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0057
     * @tc.desc      getWeekDay(year=2000, month=3, day=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0057 begin`);
      const actual: number = TimeUtils.getWeekDay(2000, 3, 1);
      logInfo(`getWeekDay(year=2000, month=3, day=1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0057 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0058
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0058
     * @tc.desc      getWeekDay(year=3, month=0, day=-1) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0058 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 0, -1);
      logInfo(`getWeekDay(year=3, month=0, day=-1): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0058 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0059
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0059
     * @tc.desc      getWeekDay(year=0, month=3, day=2) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0059 begin`);
      const actual: number = TimeUtils.getWeekDay(0, 3, 2);
      logInfo(`getWeekDay(year=0, month=3, day=2): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0059 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0060
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0060
     * @tc.desc      getWeekDay(year=2, month=10, day=10) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0060 begin`);
      const actual: number = TimeUtils.getWeekDay(2, 10, 10);
      logInfo(`getWeekDay(year=2, month=10, day=10): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0060 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0061
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0061
     * @tc.desc      getWeekDay(year=2024, month=3, day=0) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0061 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 3, 0);
      logInfo(`getWeekDay(year=2024, month=3, day=0): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0061 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0062
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0062
     * @tc.desc      getWeekDay(year=2023, month=6, day=30) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0062 begin`);
      const actual: number = TimeUtils.getWeekDay(2023, 6, 30);
      logInfo(`getWeekDay(year=2023, month=6, day=30): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0062 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0063
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0063
     * @tc.desc      getWeekDay(year=2, month=10, day=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0063 begin`);
      const actual: number = TimeUtils.getWeekDay(2, 10, -1);
      logInfo(`getWeekDay(year=2, month=10, day=-1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0063 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0064
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0064
     * @tc.desc      getWeekDay(year=1970, month=10, day=1) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0064 begin`);
      const actual: number = TimeUtils.getWeekDay(1970, 10, 1);
      logInfo(`getWeekDay(year=1970, month=10, day=1): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0064 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0065
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0065
     * @tc.desc      getWeekDay(year=2023, month=6, day=-1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0065 begin`);
      const actual: number = TimeUtils.getWeekDay(2023, 6, -1);
      logInfo(`getWeekDay(year=2023, month=6, day=-1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0065 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0066
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0066
     * @tc.desc      getWeekDay(year=2023, month=3, day=31) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0066 begin`);
      const actual: number = TimeUtils.getWeekDay(2023, 3, 31);
      logInfo(`getWeekDay(year=2023, month=3, day=31): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0066 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0067
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0067
     * @tc.desc      getWeekDay(year=1900, month=3, day=28) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0067 begin`);
      const actual: number = TimeUtils.getWeekDay(1900, 3, 28);
      logInfo(`getWeekDay(year=1900, month=3, day=28): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0067 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0068
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0068
     * @tc.desc      getWeekDay(year=2025, month=6, day=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0068 begin`);
      const actual: number = TimeUtils.getWeekDay(2025, 6, 100);
      logInfo(`getWeekDay(year=2025, month=6, day=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0068 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0069
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0069
     * @tc.desc      getWeekDay(year=2, month=-1, day=-1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0069 begin`);
      const actual: number = TimeUtils.getWeekDay(2, -1, -1);
      logInfo(`getWeekDay(year=2, month=-1, day=-1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0069 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0070
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0070
     * @tc.desc      getWeekDay(year=1, month=0, day=28) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0070 begin`);
      const actual: number = TimeUtils.getWeekDay(1, 0, 28);
      logInfo(`getWeekDay(year=1, month=0, day=28): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0070 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0071
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0071
     * @tc.desc      getWeekDay(year=3, month=100, day=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0071 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 100, 30);
      logInfo(`getWeekDay(year=3, month=100, day=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0071 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0072
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0072
     * @tc.desc      getWeekDay(year=3, month=6, day=-1) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0072 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 6, -1);
      logInfo(`getWeekDay(year=3, month=6, day=-1): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0072 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0073
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0073
     * @tc.desc      getWeekDay(year=3, month=13, day=0) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0073 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 13, 0);
      logInfo(`getWeekDay(year=3, month=13, day=0): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0073 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0074
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0074
     * @tc.desc      getWeekDay(year=3, month=1, day=31) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0074 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 1, 31);
      logInfo(`getWeekDay(year=3, month=1, day=31): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0074 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0075
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0075
     * @tc.desc      getWeekDay(year=0, month=10, day=100) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0075 begin`);
      const actual: number = TimeUtils.getWeekDay(0, 10, 100);
      logInfo(`getWeekDay(year=0, month=10, day=100): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0075 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0076
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0076
     * @tc.desc      getWeekDay(year=3, month=100, day=31) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0076 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 100, 31);
      logInfo(`getWeekDay(year=3, month=100, day=31): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0076 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0077
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0077
     * @tc.desc      getWeekDay(year=-1, month=-1, day=28) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0077 begin`);
      const actual: number = TimeUtils.getWeekDay(-1, -1, 28);
      logInfo(`getWeekDay(year=-1, month=-1, day=28): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0077 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0078
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0078
     * @tc.desc      getWeekDay(year=2025, month=5, day=31) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0078 begin`);
      const actual: number = TimeUtils.getWeekDay(2025, 5, 31);
      logInfo(`getWeekDay(year=2025, month=5, day=31): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0078 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0079
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0079
     * @tc.desc      getWeekDay(year=2100, month=10, day=1) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0079 begin`);
      const actual: number = TimeUtils.getWeekDay(2100, 10, 1);
      logInfo(`getWeekDay(year=2100, month=10, day=1): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0079 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0080
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0080
     * @tc.desc      getWeekDay(year=2, month=1, day=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0080 begin`);
      const actual: number = TimeUtils.getWeekDay(2, 1, 0);
      logInfo(`getWeekDay(year=2, month=1, day=0): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0080 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0081
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0081
     * @tc.desc      getWeekDay(year=-1, month=3, day=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0081 begin`);
      const actual: number = TimeUtils.getWeekDay(-1, 3, 2);
      logInfo(`getWeekDay(year=-1, month=3, day=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0081 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0082
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0082
     * @tc.desc      getWeekDay(year=2025, month=1, day=15) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0082 begin`);
      const actual: number = TimeUtils.getWeekDay(2025, 1, 15);
      logInfo(`getWeekDay(year=2025, month=1, day=15): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0082 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0083
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0083
     * @tc.desc      getWeekDay(year=2000, month=6, day=0) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0083 begin`);
      const actual: number = TimeUtils.getWeekDay(2000, 6, 0);
      logInfo(`getWeekDay(year=2000, month=6, day=0): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0083 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0084
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0084
     * @tc.desc      getWeekDay(year=0, month=10, day=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0084 begin`);
      const actual: number = TimeUtils.getWeekDay(0, 10, 0);
      logInfo(`getWeekDay(year=0, month=10, day=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0084 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0085
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0085
     * @tc.desc      getWeekDay(year=0, month=12, day=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0085 begin`);
      const actual: number = TimeUtils.getWeekDay(0, 12, 3);
      logInfo(`getWeekDay(year=0, month=12, day=3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0085 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0086
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0086
     * @tc.desc      getWeekDay(year=1900, month=-1, day=100) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0086 begin`);
      const actual: number = TimeUtils.getWeekDay(1900, -1, 100);
      logInfo(`getWeekDay(year=1900, month=-1, day=100): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0086 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0087
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0087
     * @tc.desc      getWeekDay(year=-1, month=5, day=29) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0087 begin`);
      const actual: number = TimeUtils.getWeekDay(-1, 5, 29);
      logInfo(`getWeekDay(year=-1, month=5, day=29): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0087 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0088
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0088
     * @tc.desc      getWeekDay(year=2000, month=2, day=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0088 begin`);
      const actual: number = TimeUtils.getWeekDay(2000, 2, 1);
      logInfo(`getWeekDay(year=2000, month=2, day=1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0088 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0089
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0089
     * @tc.desc      getWeekDay(year=1, month=6, day=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0089 begin`);
      const actual: number = TimeUtils.getWeekDay(1, 6, 100);
      logInfo(`getWeekDay(year=1, month=6, day=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0089 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0090
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0090
     * @tc.desc      getWeekDay(year=2025, month=100, day=31) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0090 begin`);
      const actual: number = TimeUtils.getWeekDay(2025, 100, 31);
      logInfo(`getWeekDay(year=2025, month=100, day=31): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0090 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0091
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0091
     * @tc.desc      getWeekDay(year=1970, month=1, day=15) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0091 begin`);
      const actual: number = TimeUtils.getWeekDay(1970, 1, 15);
      logInfo(`getWeekDay(year=1970, month=1, day=15): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0091 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0092
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0092
     * @tc.desc      getWeekDay(year=2024, month=0, day=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0092 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 0, 3);
      logInfo(`getWeekDay(year=2024, month=0, day=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0092 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0093
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0093
     * @tc.desc      getWeekDay(year=1970, month=13, day=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0093 begin`);
      const actual: number = TimeUtils.getWeekDay(1970, 13, 3);
      logInfo(`getWeekDay(year=1970, month=13, day=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0093 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0094
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0094
     * @tc.desc      getWeekDay(year=1970, month=100, day=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0094 begin`);
      const actual: number = TimeUtils.getWeekDay(1970, 100, 10);
      logInfo(`getWeekDay(year=1970, month=100, day=10): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0094 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0095
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0095
     * @tc.desc      getWeekDay(year=2024, month=2, day=28) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0095 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 2, 28);
      logInfo(`getWeekDay(year=2024, month=2, day=28): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0095 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0096
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0096
     * @tc.desc      getWeekDay(year=2025, month=100, day=28) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0096 begin`);
      const actual: number = TimeUtils.getWeekDay(2025, 100, 28);
      logInfo(`getWeekDay(year=2025, month=100, day=28): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0096 end`);
    });
  });
}
