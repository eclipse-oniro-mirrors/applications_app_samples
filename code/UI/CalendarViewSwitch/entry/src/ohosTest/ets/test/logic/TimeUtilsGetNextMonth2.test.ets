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

/** Logic checks for TimeUtils.getNextMonth (92 cases). */
export default function timeUtilsGetNextMonth2Test(): void {
  describe('TimeUtilsGetNextMonth2Test', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0097
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0097
     * @tc.desc      getNextMonth(year=0, month=24) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0097 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 24);
      logInfo(`getNextMonth(year=0, month=24): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0097 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0098
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0098
     * @tc.desc      getNextMonth(year=0, month=6) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0098 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 6);
      logInfo(`getNextMonth(year=0, month=6): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0098 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0099
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0099
     * @tc.desc      getNextMonth(year=0, month=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0099 begin`);
      const actual: number = TimeUtils.getNextMonth(0, -1);
      logInfo(`getNextMonth(year=0, month=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0099 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0100
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0100
     * @tc.desc      getNextMonth(year=0, month=3) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0100 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 3);
      logInfo(`getNextMonth(year=0, month=3): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0100 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0101
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0101
     * @tc.desc      getNextMonth(year=0, month=10) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0101 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 10);
      logInfo(`getNextMonth(year=0, month=10): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0101 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0102
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0102
     * @tc.desc      getNextMonth(year=0, month=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0102 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 100);
      logInfo(`getNextMonth(year=0, month=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0102 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0103
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0103
     * @tc.desc      getNextMonth(year=0, month=5) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0103 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 5);
      logInfo(`getNextMonth(year=0, month=5): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0103 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0104
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0104
     * @tc.desc      getNextMonth(year=0, month=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0104 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 15);
      logInfo(`getNextMonth(year=0, month=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0104 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0105
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0105
     * @tc.desc      getNextMonth(year=0, month=20) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0105 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 20);
      logInfo(`getNextMonth(year=0, month=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0105 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0106
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0106
     * @tc.desc      getNextMonth(year=0, month=25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0106 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 25);
      logInfo(`getNextMonth(year=0, month=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0106 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0107
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0107
     * @tc.desc      getNextMonth(year=0, month=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0107 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 30);
      logInfo(`getNextMonth(year=0, month=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0107 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0108
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0108
     * @tc.desc      getNextMonth(year=0, month=35) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0108 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 35);
      logInfo(`getNextMonth(year=0, month=35): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0108 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0109
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0109
     * @tc.desc      getNextMonth(year=0, month=40) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0109 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 40);
      logInfo(`getNextMonth(year=0, month=40): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0109 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0110
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0110
     * @tc.desc      getNextMonth(year=0, month=45) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0110 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 45);
      logInfo(`getNextMonth(year=0, month=45): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0110 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0111
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0111
     * @tc.desc      getNextMonth(year=0, month=50) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0111 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 50);
      logInfo(`getNextMonth(year=0, month=50): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0111 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0112
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0112
     * @tc.desc      getNextMonth(year=0, month=55) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0112 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 55);
      logInfo(`getNextMonth(year=0, month=55): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0112 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0113
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0113
     * @tc.desc      getNextMonth(year=0, month=60) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0113 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 60);
      logInfo(`getNextMonth(year=0, month=60): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0113 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0114
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0114
     * @tc.desc      getNextMonth(year=0, month=65) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0114 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 65);
      logInfo(`getNextMonth(year=0, month=65): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0114 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0115
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0115
     * @tc.desc      getNextMonth(year=0, month=70) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0115 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 70);
      logInfo(`getNextMonth(year=0, month=70): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0115 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0116
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0116
     * @tc.desc      getNextMonth(year=0, month=75) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0116 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 75);
      logInfo(`getNextMonth(year=0, month=75): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0116 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0117
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0117
     * @tc.desc      getNextMonth(year=0, month=80) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0117 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 80);
      logInfo(`getNextMonth(year=0, month=80): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0117 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0118
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0118
     * @tc.desc      getNextMonth(year=0, month=85) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0118 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 85);
      logInfo(`getNextMonth(year=0, month=85): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0118 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0119
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0119
     * @tc.desc      getNextMonth(year=0, month=90) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0119 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 90);
      logInfo(`getNextMonth(year=0, month=90): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0119 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0120
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0120
     * @tc.desc      getNextMonth(year=0, month=64) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0120 begin`);
      const actual: number = TimeUtils.getNextMonth(0, 64);
      logInfo(`getNextMonth(year=0, month=64): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0120 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0121
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0121
     * @tc.desc      getNextMonth(year=2, month=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0121 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 1);
      logInfo(`getNextMonth(year=2, month=1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0121 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0122
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0122
     * @tc.desc      getNextMonth(year=2, month=2) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0122 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 2);
      logInfo(`getNextMonth(year=2, month=2): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0122 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0123
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0123
     * @tc.desc      getNextMonth(year=2, month=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0123 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 0);
      logInfo(`getNextMonth(year=2, month=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0123 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0124
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0124
     * @tc.desc      getNextMonth(year=2, month=12) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0124 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 12);
      logInfo(`getNextMonth(year=2, month=12): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0124 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0125
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0125
     * @tc.desc      getNextMonth(year=2, month=11) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0125 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 11);
      logInfo(`getNextMonth(year=2, month=11): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0125 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0126
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0126
     * @tc.desc      getNextMonth(year=2, month=13) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0126 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 13);
      logInfo(`getNextMonth(year=2, month=13): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0126 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0127
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0127
     * @tc.desc      getNextMonth(year=2, month=24) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0127 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 24);
      logInfo(`getNextMonth(year=2, month=24): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0127 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0128
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0128
     * @tc.desc      getNextMonth(year=2, month=6) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0128 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 6);
      logInfo(`getNextMonth(year=2, month=6): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0128 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0129
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0129
     * @tc.desc      getNextMonth(year=2, month=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0129 begin`);
      const actual: number = TimeUtils.getNextMonth(2, -1);
      logInfo(`getNextMonth(year=2, month=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0129 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0130
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0130
     * @tc.desc      getNextMonth(year=2, month=3) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0130 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 3);
      logInfo(`getNextMonth(year=2, month=3): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0130 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0131
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0131
     * @tc.desc      getNextMonth(year=2, month=10) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0131 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 10);
      logInfo(`getNextMonth(year=2, month=10): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0131 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0132
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0132
     * @tc.desc      getNextMonth(year=2, month=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0132 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 100);
      logInfo(`getNextMonth(year=2, month=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0132 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0133
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0133
     * @tc.desc      getNextMonth(year=2, month=5) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0133 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 5);
      logInfo(`getNextMonth(year=2, month=5): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0133 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0134
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0134
     * @tc.desc      getNextMonth(year=2, month=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0134 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 15);
      logInfo(`getNextMonth(year=2, month=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0134 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0135
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0135
     * @tc.desc      getNextMonth(year=2, month=20) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0135 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 20);
      logInfo(`getNextMonth(year=2, month=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0135 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0136
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0136
     * @tc.desc      getNextMonth(year=2, month=25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0136 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 25);
      logInfo(`getNextMonth(year=2, month=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0136 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0137
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0137
     * @tc.desc      getNextMonth(year=2, month=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0137 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 30);
      logInfo(`getNextMonth(year=2, month=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0137 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0138
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0138
     * @tc.desc      getNextMonth(year=2, month=35) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0138 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 35);
      logInfo(`getNextMonth(year=2, month=35): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0138 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0139
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0139
     * @tc.desc      getNextMonth(year=2, month=40) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0139 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 40);
      logInfo(`getNextMonth(year=2, month=40): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0139 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0140
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0140
     * @tc.desc      getNextMonth(year=2, month=45) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0140 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 45);
      logInfo(`getNextMonth(year=2, month=45): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0140 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0141
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0141
     * @tc.desc      getNextMonth(year=2, month=50) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0141 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 50);
      logInfo(`getNextMonth(year=2, month=50): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0141 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0142
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0142
     * @tc.desc      getNextMonth(year=2, month=55) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0142 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 55);
      logInfo(`getNextMonth(year=2, month=55): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0142 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0143
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0143
     * @tc.desc      getNextMonth(year=2, month=60) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0143 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 60);
      logInfo(`getNextMonth(year=2, month=60): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0143 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0144
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0144
     * @tc.desc      getNextMonth(year=2, month=65) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0144 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 65);
      logInfo(`getNextMonth(year=2, month=65): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0144 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0145
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0145
     * @tc.desc      getNextMonth(year=2, month=70) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0145 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 70);
      logInfo(`getNextMonth(year=2, month=70): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0145 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0146
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0146
     * @tc.desc      getNextMonth(year=2, month=75) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0146 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 75);
      logInfo(`getNextMonth(year=2, month=75): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0146 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0147
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0147
     * @tc.desc      getNextMonth(year=2, month=80) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0147 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 80);
      logInfo(`getNextMonth(year=2, month=80): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0147 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0148
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0148
     * @tc.desc      getNextMonth(year=2, month=85) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0148 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 85);
      logInfo(`getNextMonth(year=2, month=85): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0148 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0149
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0149
     * @tc.desc      getNextMonth(year=2, month=90) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0149 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 90);
      logInfo(`getNextMonth(year=2, month=90): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0149 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0150
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0150
     * @tc.desc      getNextMonth(year=2, month=64) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0150 begin`);
      const actual: number = TimeUtils.getNextMonth(2, 64);
      logInfo(`getNextMonth(year=2, month=64): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0150 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0151
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0151
     * @tc.desc      getNextMonth(year=12, month=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0151 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 1);
      logInfo(`getNextMonth(year=12, month=1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0151 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0152
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0152
     * @tc.desc      getNextMonth(year=12, month=2) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0152 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 2);
      logInfo(`getNextMonth(year=12, month=2): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0152 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0153
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0153
     * @tc.desc      getNextMonth(year=12, month=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0153 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 0);
      logInfo(`getNextMonth(year=12, month=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0153 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0154
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0154
     * @tc.desc      getNextMonth(year=12, month=12) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0154 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 12);
      logInfo(`getNextMonth(year=12, month=12): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0154 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0155
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0155
     * @tc.desc      getNextMonth(year=12, month=11) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0155 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 11);
      logInfo(`getNextMonth(year=12, month=11): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0155 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0156
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0156
     * @tc.desc      getNextMonth(year=12, month=13) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0156 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 13);
      logInfo(`getNextMonth(year=12, month=13): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0156 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0157
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0157
     * @tc.desc      getNextMonth(year=12, month=24) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0157 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 24);
      logInfo(`getNextMonth(year=12, month=24): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0157 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0158
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0158
     * @tc.desc      getNextMonth(year=12, month=6) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0158 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 6);
      logInfo(`getNextMonth(year=12, month=6): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0158 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0159
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0159
     * @tc.desc      getNextMonth(year=12, month=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0159 begin`);
      const actual: number = TimeUtils.getNextMonth(12, -1);
      logInfo(`getNextMonth(year=12, month=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0159 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0160
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0160
     * @tc.desc      getNextMonth(year=12, month=3) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0160 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 3);
      logInfo(`getNextMonth(year=12, month=3): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0160 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0161
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0161
     * @tc.desc      getNextMonth(year=12, month=10) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0161 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 10);
      logInfo(`getNextMonth(year=12, month=10): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0161 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0162
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0162
     * @tc.desc      getNextMonth(year=12, month=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0162 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 100);
      logInfo(`getNextMonth(year=12, month=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0162 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0163
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0163
     * @tc.desc      getNextMonth(year=12, month=5) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0163 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 5);
      logInfo(`getNextMonth(year=12, month=5): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0163 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0164
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0164
     * @tc.desc      getNextMonth(year=12, month=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0164 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 15);
      logInfo(`getNextMonth(year=12, month=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0164 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0165
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0165
     * @tc.desc      getNextMonth(year=12, month=20) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0165 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 20);
      logInfo(`getNextMonth(year=12, month=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0165 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0166
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0166
     * @tc.desc      getNextMonth(year=12, month=25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0166 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 25);
      logInfo(`getNextMonth(year=12, month=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0166 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0167
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0167
     * @tc.desc      getNextMonth(year=12, month=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0167 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 30);
      logInfo(`getNextMonth(year=12, month=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0167 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0168
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0168
     * @tc.desc      getNextMonth(year=12, month=35) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0168 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 35);
      logInfo(`getNextMonth(year=12, month=35): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0168 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0169
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0169
     * @tc.desc      getNextMonth(year=12, month=40) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0169 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 40);
      logInfo(`getNextMonth(year=12, month=40): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0169 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0170
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0170
     * @tc.desc      getNextMonth(year=12, month=45) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0170 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 45);
      logInfo(`getNextMonth(year=12, month=45): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0170 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0171
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0171
     * @tc.desc      getNextMonth(year=12, month=50) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0171 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 50);
      logInfo(`getNextMonth(year=12, month=50): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0171 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0172
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0172
     * @tc.desc      getNextMonth(year=12, month=55) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0172 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 55);
      logInfo(`getNextMonth(year=12, month=55): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0172 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0173
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0173
     * @tc.desc      getNextMonth(year=12, month=60) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0173 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 60);
      logInfo(`getNextMonth(year=12, month=60): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0173 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0174
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0174
     * @tc.desc      getNextMonth(year=12, month=65) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0174 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 65);
      logInfo(`getNextMonth(year=12, month=65): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0174 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0175
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0175
     * @tc.desc      getNextMonth(year=12, month=70) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0175 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 70);
      logInfo(`getNextMonth(year=12, month=70): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0175 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0176
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0176
     * @tc.desc      getNextMonth(year=12, month=75) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0176 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 75);
      logInfo(`getNextMonth(year=12, month=75): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0176 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0177
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0177
     * @tc.desc      getNextMonth(year=12, month=80) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0177 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 80);
      logInfo(`getNextMonth(year=12, month=80): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0177 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0178
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0178
     * @tc.desc      getNextMonth(year=12, month=85) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0178 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 85);
      logInfo(`getNextMonth(year=12, month=85): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0178 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0179
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0179
     * @tc.desc      getNextMonth(year=12, month=90) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0179 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 90);
      logInfo(`getNextMonth(year=12, month=90): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0179 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0180
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0180
     * @tc.desc      getNextMonth(year=12, month=64) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0180 begin`);
      const actual: number = TimeUtils.getNextMonth(12, 64);
      logInfo(`getNextMonth(year=12, month=64): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0180 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0181
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0181
     * @tc.desc      getNextMonth(year=11, month=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0181 begin`);
      const actual: number = TimeUtils.getNextMonth(11, 1);
      logInfo(`getNextMonth(year=11, month=1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0181 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0182
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0182
     * @tc.desc      getNextMonth(year=11, month=2) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0182 begin`);
      const actual: number = TimeUtils.getNextMonth(11, 2);
      logInfo(`getNextMonth(year=11, month=2): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0182 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0183
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0183
     * @tc.desc      getNextMonth(year=11, month=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0183 begin`);
      const actual: number = TimeUtils.getNextMonth(11, 0);
      logInfo(`getNextMonth(year=11, month=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0183 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0184
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0184
     * @tc.desc      getNextMonth(year=11, month=12) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0184 begin`);
      const actual: number = TimeUtils.getNextMonth(11, 12);
      logInfo(`getNextMonth(year=11, month=12): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0184 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0185
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0185
     * @tc.desc      getNextMonth(year=11, month=11) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0185 begin`);
      const actual: number = TimeUtils.getNextMonth(11, 11);
      logInfo(`getNextMonth(year=11, month=11): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0185 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0186
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0186
     * @tc.desc      getNextMonth(year=11, month=13) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0186 begin`);
      const actual: number = TimeUtils.getNextMonth(11, 13);
      logInfo(`getNextMonth(year=11, month=13): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0186 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0187
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0187
     * @tc.desc      getNextMonth(year=11, month=24) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0187 begin`);
      const actual: number = TimeUtils.getNextMonth(11, 24);
      logInfo(`getNextMonth(year=11, month=24): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0187 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_MONTH_0188
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextMonth_0188
     * @tc.desc      getNextMonth(year=11, month=6) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextMonth_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0188 begin`);
      const actual: number = TimeUtils.getNextMonth(11, 6);
      logInfo(`getNextMonth(year=11, month=6): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}TimeUtilsGetNextMonth_0188 end`);
    });
  });
}
