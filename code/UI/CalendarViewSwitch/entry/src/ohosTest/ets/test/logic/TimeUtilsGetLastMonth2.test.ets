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

/** Logic checks for TimeUtils.getLastMonth (92 cases). */
export default function timeUtilsGetLastMonth2Test(): void {
  describe('TimeUtilsGetLastMonth2Test', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0097
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0097
     * @tc.desc      getLastMonth(year=0, month=24) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0097 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 24);
      logInfo(`getLastMonth(year=0, month=24): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0097 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0098
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0098
     * @tc.desc      getLastMonth(year=0, month=6) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0098 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 6);
      logInfo(`getLastMonth(year=0, month=6): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0098 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0099
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0099
     * @tc.desc      getLastMonth(year=0, month=-1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0099 begin`);
      const actual: number = TimeUtils.getLastMonth(0, -1);
      logInfo(`getLastMonth(year=0, month=-1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0099 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0100
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0100
     * @tc.desc      getLastMonth(year=0, month=3) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0100 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 3);
      logInfo(`getLastMonth(year=0, month=3): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0100 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0101
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0101
     * @tc.desc      getLastMonth(year=0, month=10) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0101 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 10);
      logInfo(`getLastMonth(year=0, month=10): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0101 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0102
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0102
     * @tc.desc      getLastMonth(year=0, month=100) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0102 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 100);
      logInfo(`getLastMonth(year=0, month=100): actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0102 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0103
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0103
     * @tc.desc      getLastMonth(year=0, month=5) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0103 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 5);
      logInfo(`getLastMonth(year=0, month=5): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0103 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0104
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0104
     * @tc.desc      getLastMonth(year=0, month=15) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0104 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 15);
      logInfo(`getLastMonth(year=0, month=15): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0104 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0105
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0105
     * @tc.desc      getLastMonth(year=0, month=20) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0105 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 20);
      logInfo(`getLastMonth(year=0, month=20): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0105 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0106
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0106
     * @tc.desc      getLastMonth(year=0, month=25) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0106 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 25);
      logInfo(`getLastMonth(year=0, month=25): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0106 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0107
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0107
     * @tc.desc      getLastMonth(year=0, month=30) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0107 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 30);
      logInfo(`getLastMonth(year=0, month=30): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0107 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0108
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0108
     * @tc.desc      getLastMonth(year=0, month=35) returns 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0108 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 35);
      logInfo(`getLastMonth(year=0, month=35): actual=${actual}`);
      expect(actual).assertEqual(34);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0108 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0109
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0109
     * @tc.desc      getLastMonth(year=0, month=40) returns 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0109 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 40);
      logInfo(`getLastMonth(year=0, month=40): actual=${actual}`);
      expect(actual).assertEqual(39);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0109 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0110
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0110
     * @tc.desc      getLastMonth(year=0, month=45) returns 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0110 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 45);
      logInfo(`getLastMonth(year=0, month=45): actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0110 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0111
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0111
     * @tc.desc      getLastMonth(year=0, month=50) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0111 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 50);
      logInfo(`getLastMonth(year=0, month=50): actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0111 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0112
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0112
     * @tc.desc      getLastMonth(year=0, month=55) returns 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0112 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 55);
      logInfo(`getLastMonth(year=0, month=55): actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0112 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0113
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0113
     * @tc.desc      getLastMonth(year=0, month=60) returns 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0113 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 60);
      logInfo(`getLastMonth(year=0, month=60): actual=${actual}`);
      expect(actual).assertEqual(59);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0113 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0114
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0114
     * @tc.desc      getLastMonth(year=0, month=65) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0114 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 65);
      logInfo(`getLastMonth(year=0, month=65): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0114 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0115
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0115
     * @tc.desc      getLastMonth(year=0, month=70) returns 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0115 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 70);
      logInfo(`getLastMonth(year=0, month=70): actual=${actual}`);
      expect(actual).assertEqual(69);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0115 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0116
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0116
     * @tc.desc      getLastMonth(year=0, month=75) returns 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0116 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 75);
      logInfo(`getLastMonth(year=0, month=75): actual=${actual}`);
      expect(actual).assertEqual(74);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0116 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0117
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0117
     * @tc.desc      getLastMonth(year=0, month=80) returns 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0117 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 80);
      logInfo(`getLastMonth(year=0, month=80): actual=${actual}`);
      expect(actual).assertEqual(79);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0117 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0118
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0118
     * @tc.desc      getLastMonth(year=0, month=85) returns 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0118 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 85);
      logInfo(`getLastMonth(year=0, month=85): actual=${actual}`);
      expect(actual).assertEqual(84);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0118 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0119
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0119
     * @tc.desc      getLastMonth(year=0, month=90) returns 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0119 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 90);
      logInfo(`getLastMonth(year=0, month=90): actual=${actual}`);
      expect(actual).assertEqual(89);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0119 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0120
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0120
     * @tc.desc      getLastMonth(year=0, month=46) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0120 begin`);
      const actual: number = TimeUtils.getLastMonth(0, 46);
      logInfo(`getLastMonth(year=0, month=46): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0120 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0121
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0121
     * @tc.desc      getLastMonth(year=2, month=1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0121 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 1);
      logInfo(`getLastMonth(year=2, month=1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0121 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0122
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0122
     * @tc.desc      getLastMonth(year=2, month=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0122 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 2);
      logInfo(`getLastMonth(year=2, month=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0122 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0123
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0123
     * @tc.desc      getLastMonth(year=2, month=0) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0123 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 0);
      logInfo(`getLastMonth(year=2, month=0): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0123 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0124
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0124
     * @tc.desc      getLastMonth(year=2, month=12) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0124 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 12);
      logInfo(`getLastMonth(year=2, month=12): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0124 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0125
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0125
     * @tc.desc      getLastMonth(year=2, month=11) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0125 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 11);
      logInfo(`getLastMonth(year=2, month=11): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0125 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0126
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0126
     * @tc.desc      getLastMonth(year=2, month=13) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0126 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 13);
      logInfo(`getLastMonth(year=2, month=13): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0126 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0127
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0127
     * @tc.desc      getLastMonth(year=2, month=24) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0127 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 24);
      logInfo(`getLastMonth(year=2, month=24): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0127 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0128
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0128
     * @tc.desc      getLastMonth(year=2, month=6) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0128 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 6);
      logInfo(`getLastMonth(year=2, month=6): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0128 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0129
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0129
     * @tc.desc      getLastMonth(year=2, month=-1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0129 begin`);
      const actual: number = TimeUtils.getLastMonth(2, -1);
      logInfo(`getLastMonth(year=2, month=-1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0129 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0130
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0130
     * @tc.desc      getLastMonth(year=2, month=3) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0130 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 3);
      logInfo(`getLastMonth(year=2, month=3): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0130 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0131
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0131
     * @tc.desc      getLastMonth(year=2, month=10) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0131 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 10);
      logInfo(`getLastMonth(year=2, month=10): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0131 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0132
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0132
     * @tc.desc      getLastMonth(year=2, month=100) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0132 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 100);
      logInfo(`getLastMonth(year=2, month=100): actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0132 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0133
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0133
     * @tc.desc      getLastMonth(year=2, month=5) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0133 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 5);
      logInfo(`getLastMonth(year=2, month=5): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0133 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0134
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0134
     * @tc.desc      getLastMonth(year=2, month=15) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0134 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 15);
      logInfo(`getLastMonth(year=2, month=15): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0134 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0135
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0135
     * @tc.desc      getLastMonth(year=2, month=20) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0135 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 20);
      logInfo(`getLastMonth(year=2, month=20): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0135 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0136
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0136
     * @tc.desc      getLastMonth(year=2, month=25) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0136 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 25);
      logInfo(`getLastMonth(year=2, month=25): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0136 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0137
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0137
     * @tc.desc      getLastMonth(year=2, month=30) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0137 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 30);
      logInfo(`getLastMonth(year=2, month=30): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0137 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0138
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0138
     * @tc.desc      getLastMonth(year=2, month=35) returns 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0138 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 35);
      logInfo(`getLastMonth(year=2, month=35): actual=${actual}`);
      expect(actual).assertEqual(34);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0138 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0139
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0139
     * @tc.desc      getLastMonth(year=2, month=40) returns 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0139 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 40);
      logInfo(`getLastMonth(year=2, month=40): actual=${actual}`);
      expect(actual).assertEqual(39);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0139 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0140
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0140
     * @tc.desc      getLastMonth(year=2, month=45) returns 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0140 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 45);
      logInfo(`getLastMonth(year=2, month=45): actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0140 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0141
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0141
     * @tc.desc      getLastMonth(year=2, month=50) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0141 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 50);
      logInfo(`getLastMonth(year=2, month=50): actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0141 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0142
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0142
     * @tc.desc      getLastMonth(year=2, month=55) returns 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0142 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 55);
      logInfo(`getLastMonth(year=2, month=55): actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0142 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0143
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0143
     * @tc.desc      getLastMonth(year=2, month=60) returns 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0143 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 60);
      logInfo(`getLastMonth(year=2, month=60): actual=${actual}`);
      expect(actual).assertEqual(59);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0143 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0144
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0144
     * @tc.desc      getLastMonth(year=2, month=65) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0144 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 65);
      logInfo(`getLastMonth(year=2, month=65): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0144 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0145
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0145
     * @tc.desc      getLastMonth(year=2, month=70) returns 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0145 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 70);
      logInfo(`getLastMonth(year=2, month=70): actual=${actual}`);
      expect(actual).assertEqual(69);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0145 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0146
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0146
     * @tc.desc      getLastMonth(year=2, month=75) returns 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0146 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 75);
      logInfo(`getLastMonth(year=2, month=75): actual=${actual}`);
      expect(actual).assertEqual(74);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0146 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0147
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0147
     * @tc.desc      getLastMonth(year=2, month=80) returns 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0147 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 80);
      logInfo(`getLastMonth(year=2, month=80): actual=${actual}`);
      expect(actual).assertEqual(79);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0147 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0148
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0148
     * @tc.desc      getLastMonth(year=2, month=85) returns 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0148 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 85);
      logInfo(`getLastMonth(year=2, month=85): actual=${actual}`);
      expect(actual).assertEqual(84);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0148 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0149
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0149
     * @tc.desc      getLastMonth(year=2, month=90) returns 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0149 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 90);
      logInfo(`getLastMonth(year=2, month=90): actual=${actual}`);
      expect(actual).assertEqual(89);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0149 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0150
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0150
     * @tc.desc      getLastMonth(year=2, month=46) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0150 begin`);
      const actual: number = TimeUtils.getLastMonth(2, 46);
      logInfo(`getLastMonth(year=2, month=46): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0150 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0151
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0151
     * @tc.desc      getLastMonth(year=12, month=1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0151 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 1);
      logInfo(`getLastMonth(year=12, month=1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0151 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0152
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0152
     * @tc.desc      getLastMonth(year=12, month=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0152 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 2);
      logInfo(`getLastMonth(year=12, month=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0152 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0153
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0153
     * @tc.desc      getLastMonth(year=12, month=0) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0153 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 0);
      logInfo(`getLastMonth(year=12, month=0): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0153 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0154
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0154
     * @tc.desc      getLastMonth(year=12, month=12) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0154 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 12);
      logInfo(`getLastMonth(year=12, month=12): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0154 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0155
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0155
     * @tc.desc      getLastMonth(year=12, month=11) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0155 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 11);
      logInfo(`getLastMonth(year=12, month=11): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0155 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0156
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0156
     * @tc.desc      getLastMonth(year=12, month=13) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0156 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 13);
      logInfo(`getLastMonth(year=12, month=13): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0156 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0157
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0157
     * @tc.desc      getLastMonth(year=12, month=24) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0157 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 24);
      logInfo(`getLastMonth(year=12, month=24): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0157 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0158
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0158
     * @tc.desc      getLastMonth(year=12, month=6) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0158 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 6);
      logInfo(`getLastMonth(year=12, month=6): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0158 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0159
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0159
     * @tc.desc      getLastMonth(year=12, month=-1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0159 begin`);
      const actual: number = TimeUtils.getLastMonth(12, -1);
      logInfo(`getLastMonth(year=12, month=-1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0159 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0160
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0160
     * @tc.desc      getLastMonth(year=12, month=3) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0160 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 3);
      logInfo(`getLastMonth(year=12, month=3): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0160 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0161
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0161
     * @tc.desc      getLastMonth(year=12, month=10) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0161 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 10);
      logInfo(`getLastMonth(year=12, month=10): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0161 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0162
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0162
     * @tc.desc      getLastMonth(year=12, month=100) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0162 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 100);
      logInfo(`getLastMonth(year=12, month=100): actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0162 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0163
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0163
     * @tc.desc      getLastMonth(year=12, month=5) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0163 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 5);
      logInfo(`getLastMonth(year=12, month=5): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0163 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0164
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0164
     * @tc.desc      getLastMonth(year=12, month=15) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0164 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 15);
      logInfo(`getLastMonth(year=12, month=15): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0164 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0165
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0165
     * @tc.desc      getLastMonth(year=12, month=20) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0165 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 20);
      logInfo(`getLastMonth(year=12, month=20): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0165 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0166
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0166
     * @tc.desc      getLastMonth(year=12, month=25) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0166 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 25);
      logInfo(`getLastMonth(year=12, month=25): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0166 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0167
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0167
     * @tc.desc      getLastMonth(year=12, month=30) returns 29
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0167 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 30);
      logInfo(`getLastMonth(year=12, month=30): actual=${actual}`);
      expect(actual).assertEqual(29);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0167 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0168
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0168
     * @tc.desc      getLastMonth(year=12, month=35) returns 34
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0168 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 35);
      logInfo(`getLastMonth(year=12, month=35): actual=${actual}`);
      expect(actual).assertEqual(34);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0168 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0169
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0169
     * @tc.desc      getLastMonth(year=12, month=40) returns 39
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0169 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 40);
      logInfo(`getLastMonth(year=12, month=40): actual=${actual}`);
      expect(actual).assertEqual(39);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0169 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0170
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0170
     * @tc.desc      getLastMonth(year=12, month=45) returns 44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0170 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 45);
      logInfo(`getLastMonth(year=12, month=45): actual=${actual}`);
      expect(actual).assertEqual(44);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0170 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0171
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0171
     * @tc.desc      getLastMonth(year=12, month=50) returns 49
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0171 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 50);
      logInfo(`getLastMonth(year=12, month=50): actual=${actual}`);
      expect(actual).assertEqual(49);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0171 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0172
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0172
     * @tc.desc      getLastMonth(year=12, month=55) returns 54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0172 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 55);
      logInfo(`getLastMonth(year=12, month=55): actual=${actual}`);
      expect(actual).assertEqual(54);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0172 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0173
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0173
     * @tc.desc      getLastMonth(year=12, month=60) returns 59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0173 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 60);
      logInfo(`getLastMonth(year=12, month=60): actual=${actual}`);
      expect(actual).assertEqual(59);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0173 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0174
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0174
     * @tc.desc      getLastMonth(year=12, month=65) returns 64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0174 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 65);
      logInfo(`getLastMonth(year=12, month=65): actual=${actual}`);
      expect(actual).assertEqual(64);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0174 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0175
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0175
     * @tc.desc      getLastMonth(year=12, month=70) returns 69
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0175 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 70);
      logInfo(`getLastMonth(year=12, month=70): actual=${actual}`);
      expect(actual).assertEqual(69);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0175 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0176
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0176
     * @tc.desc      getLastMonth(year=12, month=75) returns 74
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0176 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 75);
      logInfo(`getLastMonth(year=12, month=75): actual=${actual}`);
      expect(actual).assertEqual(74);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0176 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0177
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0177
     * @tc.desc      getLastMonth(year=12, month=80) returns 79
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0177 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 80);
      logInfo(`getLastMonth(year=12, month=80): actual=${actual}`);
      expect(actual).assertEqual(79);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0177 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0178
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0178
     * @tc.desc      getLastMonth(year=12, month=85) returns 84
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0178 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 85);
      logInfo(`getLastMonth(year=12, month=85): actual=${actual}`);
      expect(actual).assertEqual(84);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0178 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0179
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0179
     * @tc.desc      getLastMonth(year=12, month=90) returns 89
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0179 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 90);
      logInfo(`getLastMonth(year=12, month=90): actual=${actual}`);
      expect(actual).assertEqual(89);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0179 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0180
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0180
     * @tc.desc      getLastMonth(year=12, month=46) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0180 begin`);
      const actual: number = TimeUtils.getLastMonth(12, 46);
      logInfo(`getLastMonth(year=12, month=46): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0180 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0181
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0181
     * @tc.desc      getLastMonth(year=11, month=1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0181 begin`);
      const actual: number = TimeUtils.getLastMonth(11, 1);
      logInfo(`getLastMonth(year=11, month=1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0181 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0182
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0182
     * @tc.desc      getLastMonth(year=11, month=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0182 begin`);
      const actual: number = TimeUtils.getLastMonth(11, 2);
      logInfo(`getLastMonth(year=11, month=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0182 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0183
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0183
     * @tc.desc      getLastMonth(year=11, month=0) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0183 begin`);
      const actual: number = TimeUtils.getLastMonth(11, 0);
      logInfo(`getLastMonth(year=11, month=0): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0183 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0184
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0184
     * @tc.desc      getLastMonth(year=11, month=12) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0184 begin`);
      const actual: number = TimeUtils.getLastMonth(11, 12);
      logInfo(`getLastMonth(year=11, month=12): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0184 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0185
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0185
     * @tc.desc      getLastMonth(year=11, month=11) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0185 begin`);
      const actual: number = TimeUtils.getLastMonth(11, 11);
      logInfo(`getLastMonth(year=11, month=11): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0185 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0186
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0186
     * @tc.desc      getLastMonth(year=11, month=13) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0186 begin`);
      const actual: number = TimeUtils.getLastMonth(11, 13);
      logInfo(`getLastMonth(year=11, month=13): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0186 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0187
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0187
     * @tc.desc      getLastMonth(year=11, month=24) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0187 begin`);
      const actual: number = TimeUtils.getLastMonth(11, 24);
      logInfo(`getLastMonth(year=11, month=24): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0187 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_MONTH_0188
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastMonth_0188
     * @tc.desc      getLastMonth(year=11, month=6) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastMonth_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0188 begin`);
      const actual: number = TimeUtils.getLastMonth(11, 6);
      logInfo(`getLastMonth(year=11, month=6): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TimeUtilsGetLastMonth_0188 end`);
    });
  });
}
