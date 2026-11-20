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

/** Logic checks for TimeUtils.getWeekDay (79 cases). */
export default function timeUtilsGetWeekDay2Test(): void {
  describe('TimeUtilsGetWeekDay2Test', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0097
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0097
     * @tc.desc      getWeekDay(year=2025, month=0, day=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0097 begin`);
      const actual: number = TimeUtils.getWeekDay(2025, 0, 30);
      logInfo(`getWeekDay(year=2025, month=0, day=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0097 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0098
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0098
     * @tc.desc      getWeekDay(year=2100, month=3, day=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0098 begin`);
      const actual: number = TimeUtils.getWeekDay(2100, 3, 1);
      logInfo(`getWeekDay(year=2100, month=3, day=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0098 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0099
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0099
     * @tc.desc      getWeekDay(year=2100, month=3, day=29) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0099 begin`);
      const actual: number = TimeUtils.getWeekDay(2100, 3, 29);
      logInfo(`getWeekDay(year=2100, month=3, day=29): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0099 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0100
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0100
     * @tc.desc      getWeekDay(year=2024, month=10, day=30) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0100 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 10, 30);
      logInfo(`getWeekDay(year=2024, month=10, day=30): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0100 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0101
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0101
     * @tc.desc      getWeekDay(year=3, month=10, day=1) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0101 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 10, 1);
      logInfo(`getWeekDay(year=3, month=10, day=1): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0101 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0102
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0102
     * @tc.desc      getWeekDay(year=0, month=6, day=30) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0102 begin`);
      const actual: number = TimeUtils.getWeekDay(0, 6, 30);
      logInfo(`getWeekDay(year=0, month=6, day=30): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0102 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0103
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0103
     * @tc.desc      getWeekDay(year=2023, month=13, day=-1) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0103 begin`);
      const actual: number = TimeUtils.getWeekDay(2023, 13, -1);
      logInfo(`getWeekDay(year=2023, month=13, day=-1): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0103 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0104
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0104
     * @tc.desc      getWeekDay(year=1900, month=-1, day=28) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0104 begin`);
      const actual: number = TimeUtils.getWeekDay(1900, -1, 28);
      logInfo(`getWeekDay(year=1900, month=-1, day=28): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0104 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0105
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0105
     * @tc.desc      getWeekDay(year=0, month=6, day=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0105 begin`);
      const actual: number = TimeUtils.getWeekDay(0, 6, 3);
      logInfo(`getWeekDay(year=0, month=6, day=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0105 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0106
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0106
     * @tc.desc      getWeekDay(year=1970, month=0, day=29) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0106 begin`);
      const actual: number = TimeUtils.getWeekDay(1970, 0, 29);
      logInfo(`getWeekDay(year=1970, month=0, day=29): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0106 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0107
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0107
     * @tc.desc      getWeekDay(year=2100, month=2, day=29) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0107 begin`);
      const actual: number = TimeUtils.getWeekDay(2100, 2, 29);
      logInfo(`getWeekDay(year=2100, month=2, day=29): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0107 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0108
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0108
     * @tc.desc      getWeekDay(year=3, month=100, day=0) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0108 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 100, 0);
      logInfo(`getWeekDay(year=3, month=100, day=0): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0108 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0109
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0109
     * @tc.desc      getWeekDay(year=2000, month=5, day=31) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0109 begin`);
      const actual: number = TimeUtils.getWeekDay(2000, 5, 31);
      logInfo(`getWeekDay(year=2000, month=5, day=31): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0109 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0110
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0110
     * @tc.desc      getWeekDay(year=1, month=163, day=1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0110 begin`);
      const actual: number = TimeUtils.getWeekDay(1, 163, 1);
      logInfo(`getWeekDay(year=1, month=163, day=1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0110 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0111
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0111
     * @tc.desc      getWeekDay(year=2024, month=2, day=15) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0111 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 2, 15);
      logInfo(`getWeekDay(year=2024, month=2, day=15): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0111 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0112
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0112
     * @tc.desc      getWeekDay(year=2023, month=12, day=100) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0112 begin`);
      const actual: number = TimeUtils.getWeekDay(2023, 12, 100);
      logInfo(`getWeekDay(year=2023, month=12, day=100): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0112 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0113
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0113
     * @tc.desc      getWeekDay(year=2, month=12, day=29) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0113 begin`);
      const actual: number = TimeUtils.getWeekDay(2, 12, 29);
      logInfo(`getWeekDay(year=2, month=12, day=29): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0113 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0114
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0114
     * @tc.desc      getWeekDay(year=-1, month=6, day=2) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0114 begin`);
      const actual: number = TimeUtils.getWeekDay(-1, 6, 2);
      logInfo(`getWeekDay(year=-1, month=6, day=2): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0114 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0115
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0115
     * @tc.desc      getWeekDay(year=1970, month=100, day=-1) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0115 begin`);
      const actual: number = TimeUtils.getWeekDay(1970, 100, -1);
      logInfo(`getWeekDay(year=1970, month=100, day=-1): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0115 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0116
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0116
     * @tc.desc      getWeekDay(year=1900, month=0, day=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0116 begin`);
      const actual: number = TimeUtils.getWeekDay(1900, 0, 3);
      logInfo(`getWeekDay(year=1900, month=0, day=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0116 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0117
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0117
     * @tc.desc      getWeekDay(year=1970, month=1, day=29) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0117 begin`);
      const actual: number = TimeUtils.getWeekDay(1970, 1, 29);
      logInfo(`getWeekDay(year=1970, month=1, day=29): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0117 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0118
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0118
     * @tc.desc      getWeekDay(year=1900, month=0, day=2) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0118 begin`);
      const actual: number = TimeUtils.getWeekDay(1900, 0, 2);
      logInfo(`getWeekDay(year=1900, month=0, day=2): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0118 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0119
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0119
     * @tc.desc      getWeekDay(year=2000, month=5, day=28) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0119 begin`);
      const actual: number = TimeUtils.getWeekDay(2000, 5, 28);
      logInfo(`getWeekDay(year=2000, month=5, day=28): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0119 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0120
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0120
     * @tc.desc      getWeekDay(year=2, month=1, day=31) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0120 begin`);
      const actual: number = TimeUtils.getWeekDay(2, 1, 31);
      logInfo(`getWeekDay(year=2, month=1, day=31): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0120 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0121
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0121
     * @tc.desc      getWeekDay(year=3, month=13, day=1) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0121 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 13, 1);
      logInfo(`getWeekDay(year=3, month=13, day=1): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0121 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0122
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0122
     * @tc.desc      getWeekDay(year=2025, month=13, day=100) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0122 begin`);
      const actual: number = TimeUtils.getWeekDay(2025, 13, 100);
      logInfo(`getWeekDay(year=2025, month=13, day=100): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0122 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0123
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0123
     * @tc.desc      getWeekDay(year=1970, month=1, day=0) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0123 begin`);
      const actual: number = TimeUtils.getWeekDay(1970, 1, 0);
      logInfo(`getWeekDay(year=1970, month=1, day=0): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0123 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0124
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0124
     * @tc.desc      getWeekDay(year=-1, month=12, day=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0124 begin`);
      const actual: number = TimeUtils.getWeekDay(-1, 12, 0);
      logInfo(`getWeekDay(year=-1, month=12, day=0): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0124 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0125
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0125
     * @tc.desc      getWeekDay(year=2000, month=163, day=-1) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0125 begin`);
      const actual: number = TimeUtils.getWeekDay(2000, 163, -1);
      logInfo(`getWeekDay(year=2000, month=163, day=-1): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0125 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0126
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0126
     * @tc.desc      getWeekDay(year=2100, month=100, day=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0126 begin`);
      const actual: number = TimeUtils.getWeekDay(2100, 100, 30);
      logInfo(`getWeekDay(year=2100, month=100, day=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0126 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0127
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0127
     * @tc.desc      getWeekDay(year=1900, month=13, day=15) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0127 begin`);
      const actual: number = TimeUtils.getWeekDay(1900, 13, 15);
      logInfo(`getWeekDay(year=1900, month=13, day=15): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0127 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0128
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0128
     * @tc.desc      getWeekDay(year=-1, month=13, day=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0128 begin`);
      const actual: number = TimeUtils.getWeekDay(-1, 13, 100);
      logInfo(`getWeekDay(year=-1, month=13, day=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0128 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0129
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0129
     * @tc.desc      getWeekDay(year=1, month=1, day=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0129 begin`);
      const actual: number = TimeUtils.getWeekDay(1, 1, 0);
      logInfo(`getWeekDay(year=1, month=1, day=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0129 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0130
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0130
     * @tc.desc      getWeekDay(year=2025, month=5, day=29) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0130 begin`);
      const actual: number = TimeUtils.getWeekDay(2025, 5, 29);
      logInfo(`getWeekDay(year=2025, month=5, day=29): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0130 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0131
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0131
     * @tc.desc      getWeekDay(year=2024, month=0, day=31) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0131 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 0, 31);
      logInfo(`getWeekDay(year=2024, month=0, day=31): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0131 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0132
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0132
     * @tc.desc      getWeekDay(year=2023, month=163, day=10) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0132 begin`);
      const actual: number = TimeUtils.getWeekDay(2023, 163, 10);
      logInfo(`getWeekDay(year=2023, month=163, day=10): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0132 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0133
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0133
     * @tc.desc      getWeekDay(year=1, month=12, day=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0133 begin`);
      const actual: number = TimeUtils.getWeekDay(1, 12, 100);
      logInfo(`getWeekDay(year=1, month=12, day=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0133 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0134
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0134
     * @tc.desc      getWeekDay(year=2100, month=6, day=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0134 begin`);
      const actual: number = TimeUtils.getWeekDay(2100, 6, 0);
      logInfo(`getWeekDay(year=2100, month=6, day=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0134 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0135
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0135
     * @tc.desc      getWeekDay(year=2, month=5, day=15) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0135 begin`);
      const actual: number = TimeUtils.getWeekDay(2, 5, 15);
      logInfo(`getWeekDay(year=2, month=5, day=15): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0135 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0136
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0136
     * @tc.desc      getWeekDay(year=3, month=100, day=15) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0136 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 100, 15);
      logInfo(`getWeekDay(year=3, month=100, day=15): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0136 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0137
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0137
     * @tc.desc      getWeekDay(year=2024, month=163, day=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0137 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 163, -1);
      logInfo(`getWeekDay(year=2024, month=163, day=-1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0137 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0138
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0138
     * @tc.desc      getWeekDay(year=2100, month=3, day=10) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0138 begin`);
      const actual: number = TimeUtils.getWeekDay(2100, 3, 10);
      logInfo(`getWeekDay(year=2100, month=3, day=10): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0138 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0139
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0139
     * @tc.desc      getWeekDay(year=2, month=2, day=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0139 begin`);
      const actual: number = TimeUtils.getWeekDay(2, 2, 10);
      logInfo(`getWeekDay(year=2, month=2, day=10): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0139 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0140
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0140
     * @tc.desc      getWeekDay(year=2024, month=2, day=-1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0140 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 2, -1);
      logInfo(`getWeekDay(year=2024, month=2, day=-1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0140 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0141
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0141
     * @tc.desc      getWeekDay(year=2100, month=2, day=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0141 begin`);
      const actual: number = TimeUtils.getWeekDay(2100, 2, 0);
      logInfo(`getWeekDay(year=2100, month=2, day=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0141 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0142
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0142
     * @tc.desc      getWeekDay(year=2023, month=0, day=10) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0142 begin`);
      const actual: number = TimeUtils.getWeekDay(2023, 0, 10);
      logInfo(`getWeekDay(year=2023, month=0, day=10): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0142 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0143
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0143
     * @tc.desc      getWeekDay(year=-1, month=10, day=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0143 begin`);
      const actual: number = TimeUtils.getWeekDay(-1, 10, 3);
      logInfo(`getWeekDay(year=-1, month=10, day=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0143 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0144
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0144
     * @tc.desc      getWeekDay(year=2025, month=3, day=-1) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0144 begin`);
      const actual: number = TimeUtils.getWeekDay(2025, 3, -1);
      logInfo(`getWeekDay(year=2025, month=3, day=-1): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0144 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0145
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0145
     * @tc.desc      getWeekDay(year=3, month=100, day=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0145 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 100, 2);
      logInfo(`getWeekDay(year=3, month=100, day=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0145 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0146
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0146
     * @tc.desc      getWeekDay(year=2, month=2, day=29) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0146 begin`);
      const actual: number = TimeUtils.getWeekDay(2, 2, 29);
      logInfo(`getWeekDay(year=2, month=2, day=29): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0146 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0147
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0147
     * @tc.desc      getWeekDay(year=3, month=10, day=2) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0147 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 10, 2);
      logInfo(`getWeekDay(year=3, month=10, day=2): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0147 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0148
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0148
     * @tc.desc      getWeekDay(year=-1, month=10, day=29) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0148 begin`);
      const actual: number = TimeUtils.getWeekDay(-1, 10, 29);
      logInfo(`getWeekDay(year=-1, month=10, day=29): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0148 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0149
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0149
     * @tc.desc      getWeekDay(year=2100, month=3, day=31) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0149 begin`);
      const actual: number = TimeUtils.getWeekDay(2100, 3, 31);
      logInfo(`getWeekDay(year=2100, month=3, day=31): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0149 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0150
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0150
     * @tc.desc      getWeekDay(year=2024, month=5, day=28) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0150 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 5, 28);
      logInfo(`getWeekDay(year=2024, month=5, day=28): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0150 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0151
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0151
     * @tc.desc      getWeekDay(year=2024, month=163, day=100) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0151 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 163, 100);
      logInfo(`getWeekDay(year=2024, month=163, day=100): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0151 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0152
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0152
     * @tc.desc      getWeekDay(year=2, month=3, day=0) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0152 begin`);
      const actual: number = TimeUtils.getWeekDay(2, 3, 0);
      logInfo(`getWeekDay(year=2, month=3, day=0): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0152 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0153
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0153
     * @tc.desc      getWeekDay(year=2025, month=10, day=31) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0153 begin`);
      const actual: number = TimeUtils.getWeekDay(2025, 10, 31);
      logInfo(`getWeekDay(year=2025, month=10, day=31): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0153 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0154
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0154
     * @tc.desc      getWeekDay(year=2023, month=2, day=15) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0154 begin`);
      const actual: number = TimeUtils.getWeekDay(2023, 2, 15);
      logInfo(`getWeekDay(year=2023, month=2, day=15): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0154 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0155
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0155
     * @tc.desc      getWeekDay(year=2025, month=12, day=28) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0155 begin`);
      const actual: number = TimeUtils.getWeekDay(2025, 12, 28);
      logInfo(`getWeekDay(year=2025, month=12, day=28): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0155 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0156
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0156
     * @tc.desc      getWeekDay(year=2023, month=100, day=3) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0156 begin`);
      const actual: number = TimeUtils.getWeekDay(2023, 100, 3);
      logInfo(`getWeekDay(year=2023, month=100, day=3): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0156 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0157
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0157
     * @tc.desc      getWeekDay(year=2024, month=5, day=10) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0157 begin`);
      const actual: number = TimeUtils.getWeekDay(2024, 5, 10);
      logInfo(`getWeekDay(year=2024, month=5, day=10): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0157 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0158
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0158
     * @tc.desc      getWeekDay(year=3, month=5, day=-1) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0158 begin`);
      const actual: number = TimeUtils.getWeekDay(3, 5, -1);
      logInfo(`getWeekDay(year=3, month=5, day=-1): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0158 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0159
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0159
     * @tc.desc      getWeekDay(year=-1, month=6, day=10) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0159 begin`);
      const actual: number = TimeUtils.getWeekDay(-1, 6, 10);
      logInfo(`getWeekDay(year=-1, month=6, day=10): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0159 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0160
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0160
     * @tc.desc      getWeekDay(year=2, month=163, day=100) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0160 begin`);
      const actual: number = TimeUtils.getWeekDay(2, 163, 100);
      logInfo(`getWeekDay(year=2, month=163, day=100): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0160 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0161
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0161
     * @tc.desc      getWeekDay(year=2000, month=-1, day=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0161 begin`);
      const actual: number = TimeUtils.getWeekDay(2000, -1, 1);
      logInfo(`getWeekDay(year=2000, month=-1, day=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0161 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0162
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0162
     * @tc.desc      getWeekDay(year=2023, month=5, day=31) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0162 begin`);
      const actual: number = TimeUtils.getWeekDay(2023, 5, 31);
      logInfo(`getWeekDay(year=2023, month=5, day=31): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0162 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0163
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0163
     * @tc.desc      getWeekDay(year=2025, month=12, day=100) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0163 begin`);
      const actual: number = TimeUtils.getWeekDay(2025, 12, 100);
      logInfo(`getWeekDay(year=2025, month=12, day=100): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0163 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0164
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0164
     * @tc.desc      getWeekDay(year=0, month=12, day=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0164 begin`);
      const actual: number = TimeUtils.getWeekDay(0, 12, 10);
      logInfo(`getWeekDay(year=0, month=12, day=10): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0164 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0165
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0165
     * @tc.desc      getWeekDay(year=1970, month=0, day=100) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0165 begin`);
      const actual: number = TimeUtils.getWeekDay(1970, 0, 100);
      logInfo(`getWeekDay(year=1970, month=0, day=100): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0165 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0166
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0166
     * @tc.desc      getWeekDay(year=1900, month=-1, day=15) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0166 begin`);
      const actual: number = TimeUtils.getWeekDay(1900, -1, 15);
      logInfo(`getWeekDay(year=1900, month=-1, day=15): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0166 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0167
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0167
     * @tc.desc      getWeekDay(year=2023, month=163, day=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0167 begin`);
      const actual: number = TimeUtils.getWeekDay(2023, 163, 0);
      logInfo(`getWeekDay(year=2023, month=163, day=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0167 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0168
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0168
     * @tc.desc      getWeekDay(year=2025, month=3, day=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0168 begin`);
      const actual: number = TimeUtils.getWeekDay(2025, 3, 30);
      logInfo(`getWeekDay(year=2025, month=3, day=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0168 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0169
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0169
     * @tc.desc      getWeekDay(year=2023, month=12, day=31) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0169 begin`);
      const actual: number = TimeUtils.getWeekDay(2023, 12, 31);
      logInfo(`getWeekDay(year=2023, month=12, day=31): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0169 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0170
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0170
     * @tc.desc      getWeekDay(year=2000, month=2, day=10) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0170 begin`);
      const actual: number = TimeUtils.getWeekDay(2000, 2, 10);
      logInfo(`getWeekDay(year=2000, month=2, day=10): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0170 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0171
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0171
     * @tc.desc      getWeekDay(year=1, month=-1, day=29) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0171 begin`);
      const actual: number = TimeUtils.getWeekDay(1, -1, 29);
      logInfo(`getWeekDay(year=1, month=-1, day=29): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0171 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0172
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0172
     * @tc.desc      getWeekDay(year=0, month=3, day=1) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0172 begin`);
      const actual: number = TimeUtils.getWeekDay(0, 3, 1);
      logInfo(`getWeekDay(year=0, month=3, day=1): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0172 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0173
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0173
     * @tc.desc      getWeekDay(year=2, month=163, day=28) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0173 begin`);
      const actual: number = TimeUtils.getWeekDay(2, 163, 28);
      logInfo(`getWeekDay(year=2, month=163, day=28): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0173 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0174
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0174
     * @tc.desc      getWeekDay(year=2023, month=100, day=28) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0174 begin`);
      const actual: number = TimeUtils.getWeekDay(2023, 100, 28);
      logInfo(`getWeekDay(year=2023, month=100, day=28): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0174 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_WEEK_DAY_0175
     * @tc.name      CalendarViewSwitch_TimeUtilsGetWeekDay_0175
     * @tc.desc      getWeekDay(year=2000, month=10, day=10) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetWeekDay_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0175 begin`);
      const actual: number = TimeUtils.getWeekDay(2000, 10, 10);
      logInfo(`getWeekDay(year=2000, month=10, day=10): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetWeekDay_0175 end`);
    });
  });
}
