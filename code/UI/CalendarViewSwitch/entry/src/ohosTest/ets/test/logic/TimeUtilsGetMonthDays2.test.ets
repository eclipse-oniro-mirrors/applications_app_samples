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

/** Logic checks for TimeUtils.getMonthDays (29 cases). */
export default function timeUtilsGetMonthDays2Test(): void {
  describe('TimeUtilsGetMonthDays2Test', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0097
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0097
     * @tc.desc      getMonthDays(year=0, month=6) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0097 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 6);
      logInfo(`getMonthDays(year=0, month=6): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0097 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0098
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0098
     * @tc.desc      getMonthDays(year=0, month=7) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0098 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 7);
      logInfo(`getMonthDays(year=0, month=7): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0098 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0099
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0099
     * @tc.desc      getMonthDays(year=0, month=8) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0099 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 8);
      logInfo(`getMonthDays(year=0, month=8): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0099 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0100
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0100
     * @tc.desc      getMonthDays(year=0, month=9) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0100 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 9);
      logInfo(`getMonthDays(year=0, month=9): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0100 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0101
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0101
     * @tc.desc      getMonthDays(year=0, month=10) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0101 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 10);
      logInfo(`getMonthDays(year=0, month=10): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0101 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0102
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0102
     * @tc.desc      getMonthDays(year=0, month=11) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0102 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 11);
      logInfo(`getMonthDays(year=0, month=11): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0102 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0103
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0103
     * @tc.desc      getMonthDays(year=0, month=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0103 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 20);
      logInfo(`getMonthDays(year=0, month=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0103 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0104
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0104
     * @tc.desc      getMonthDays(year=0, month=12) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0104 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 12);
      logInfo(`getMonthDays(year=0, month=12): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0104 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0105
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0105
     * @tc.desc      getMonthDays(year=0, month=13) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0105 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 13);
      logInfo(`getMonthDays(year=0, month=13): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0105 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0106
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0106
     * @tc.desc      getMonthDays(year=0, month=24) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0106 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 24);
      logInfo(`getMonthDays(year=0, month=24): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0106 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0107
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0107
     * @tc.desc      getMonthDays(year=0, month=31) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0107 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 31);
      logInfo(`getMonthDays(year=0, month=31): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0107 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0108
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0108
     * @tc.desc      getMonthDays(year=0, month=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0108 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 30);
      logInfo(`getMonthDays(year=0, month=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0108 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0109
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0109
     * @tc.desc      getMonthDays(year=0, month=32) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0109 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 32);
      logInfo(`getMonthDays(year=0, month=32): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0109 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0110
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0110
     * @tc.desc      getMonthDays(year=0, month=62) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0110 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 62);
      logInfo(`getMonthDays(year=0, month=62): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0110 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0111
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0111
     * @tc.desc      getMonthDays(year=0, month=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0111 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 15);
      logInfo(`getMonthDays(year=0, month=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0111 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0112
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0112
     * @tc.desc      getMonthDays(year=0, month=22) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0112 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 22);
      logInfo(`getMonthDays(year=0, month=22): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0112 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0113
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0113
     * @tc.desc      getMonthDays(year=0, month=29) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0113 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 29);
      logInfo(`getMonthDays(year=0, month=29): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0113 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0114
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0114
     * @tc.desc      getMonthDays(year=0, month=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0114 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 60);
      logInfo(`getMonthDays(year=0, month=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0114 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0115
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0115
     * @tc.desc      getMonthDays(year=0, month=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0115 begin`);
      const actual: number = TimeUtils.getMonthDays(0, -1);
      logInfo(`getMonthDays(year=0, month=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0115 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0116
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0116
     * @tc.desc      getMonthDays(year=0, month=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0116 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 100);
      logInfo(`getMonthDays(year=0, month=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0116 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0117
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0117
     * @tc.desc      getMonthDays(year=0, month=99) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0117 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 99);
      logInfo(`getMonthDays(year=0, month=99): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0117 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0118
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0118
     * @tc.desc      getMonthDays(year=0, month=101) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0118 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 101);
      logInfo(`getMonthDays(year=0, month=101): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0118 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0119
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0119
     * @tc.desc      getMonthDays(year=0, month=200) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0119 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 200);
      logInfo(`getMonthDays(year=0, month=200): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0119 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0120
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0120
     * @tc.desc      getMonthDays(year=0, month=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0120 begin`);
      const actual: number = TimeUtils.getMonthDays(0, 50);
      logInfo(`getMonthDays(year=0, month=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0120 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0121
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0121
     * @tc.desc      getMonthDays(year=2, month=1) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0121 begin`);
      const actual: number = TimeUtils.getMonthDays(2, 1);
      logInfo(`getMonthDays(year=2, month=1): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0121 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0122
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0122
     * @tc.desc      getMonthDays(year=2, month=2) returns 28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0122 begin`);
      const actual: number = TimeUtils.getMonthDays(2, 2);
      logInfo(`getMonthDays(year=2, month=2): actual=${actual}`);
      expect(actual).assertEqual(28);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0122 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0123
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0123
     * @tc.desc      getMonthDays(year=2, month=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0123 begin`);
      const actual: number = TimeUtils.getMonthDays(2, 0);
      logInfo(`getMonthDays(year=2, month=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0123 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0124
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0124
     * @tc.desc      getMonthDays(year=2, month=3) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0124 begin`);
      const actual: number = TimeUtils.getMonthDays(2, 3);
      logInfo(`getMonthDays(year=2, month=3): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0124 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_MONTH_DAYS_0125
     * @tc.name      CalendarViewSwitch_TimeUtilsGetMonthDays_0125
     * @tc.desc      getMonthDays(year=2, month=4) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetMonthDays_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0125 begin`);
      const actual: number = TimeUtils.getMonthDays(2, 4);
      logInfo(`getMonthDays(year=2, month=4): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetMonthDays_0125 end`);
    });
  });
}
