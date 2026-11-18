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

/** Logic checks for TimeUtils.getNextYear (92 cases). */
export default function timeUtilsGetNextYear2Test(): void {
  describe('TimeUtilsGetNextYear2Test', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0097
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0097
     * @tc.desc      getNextYear(year=2023, month=70) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0097 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 70);
      logInfo(`getNextYear(year=2023, month=70): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0097 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0098
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0098
     * @tc.desc      getNextYear(year=2023, month=75) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0098 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 75);
      logInfo(`getNextYear(year=2023, month=75): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0098 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0099
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0099
     * @tc.desc      getNextYear(year=2023, month=80) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0099 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 80);
      logInfo(`getNextYear(year=2023, month=80): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0099 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0100
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0100
     * @tc.desc      getNextYear(year=2023, month=85) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0100 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 85);
      logInfo(`getNextYear(year=2023, month=85): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0100 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0101
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0101
     * @tc.desc      getNextYear(year=2023, month=90) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0101 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 90);
      logInfo(`getNextYear(year=2023, month=90): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0101 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0102
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0102
     * @tc.desc      getNextYear(year=2023, month=102) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0102 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 102);
      logInfo(`getNextYear(year=2023, month=102): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0102 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0103
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0103
     * @tc.desc      getNextYear(year=1, month=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0103 begin`);
      const actual: number = TimeUtils.getNextYear(1, 2);
      logInfo(`getNextYear(year=1, month=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0103 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0104
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0104
     * @tc.desc      getNextYear(year=1, month=0) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0104 begin`);
      const actual: number = TimeUtils.getNextYear(1, 0);
      logInfo(`getNextYear(year=1, month=0): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0104 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0105
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0105
     * @tc.desc      getNextYear(year=1, month=11) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0105 begin`);
      const actual: number = TimeUtils.getNextYear(1, 11);
      logInfo(`getNextYear(year=1, month=11): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0105 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0106
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0106
     * @tc.desc      getNextYear(year=1, month=13) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0106 begin`);
      const actual: number = TimeUtils.getNextYear(1, 13);
      logInfo(`getNextYear(year=1, month=13): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0106 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0107
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0107
     * @tc.desc      getNextYear(year=1, month=24) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0107 begin`);
      const actual: number = TimeUtils.getNextYear(1, 24);
      logInfo(`getNextYear(year=1, month=24): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0107 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0108
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0108
     * @tc.desc      getNextYear(year=1, month=6) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0108 begin`);
      const actual: number = TimeUtils.getNextYear(1, 6);
      logInfo(`getNextYear(year=1, month=6): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0108 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0109
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0109
     * @tc.desc      getNextYear(year=1, month=-1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0109 begin`);
      const actual: number = TimeUtils.getNextYear(1, -1);
      logInfo(`getNextYear(year=1, month=-1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0109 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0110
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0110
     * @tc.desc      getNextYear(year=1, month=3) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0110 begin`);
      const actual: number = TimeUtils.getNextYear(1, 3);
      logInfo(`getNextYear(year=1, month=3): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0110 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0111
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0111
     * @tc.desc      getNextYear(year=1, month=10) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0111 begin`);
      const actual: number = TimeUtils.getNextYear(1, 10);
      logInfo(`getNextYear(year=1, month=10): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0111 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0112
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0112
     * @tc.desc      getNextYear(year=1, month=100) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0112 begin`);
      const actual: number = TimeUtils.getNextYear(1, 100);
      logInfo(`getNextYear(year=1, month=100): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0112 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0113
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0113
     * @tc.desc      getNextYear(year=1, month=5) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0113 begin`);
      const actual: number = TimeUtils.getNextYear(1, 5);
      logInfo(`getNextYear(year=1, month=5): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0113 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0114
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0114
     * @tc.desc      getNextYear(year=1, month=15) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0114 begin`);
      const actual: number = TimeUtils.getNextYear(1, 15);
      logInfo(`getNextYear(year=1, month=15): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0114 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0115
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0115
     * @tc.desc      getNextYear(year=1, month=20) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0115 begin`);
      const actual: number = TimeUtils.getNextYear(1, 20);
      logInfo(`getNextYear(year=1, month=20): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0115 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0116
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0116
     * @tc.desc      getNextYear(year=1, month=25) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0116 begin`);
      const actual: number = TimeUtils.getNextYear(1, 25);
      logInfo(`getNextYear(year=1, month=25): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0116 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0117
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0117
     * @tc.desc      getNextYear(year=1, month=30) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0117 begin`);
      const actual: number = TimeUtils.getNextYear(1, 30);
      logInfo(`getNextYear(year=1, month=30): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0117 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0118
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0118
     * @tc.desc      getNextYear(year=1, month=35) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0118 begin`);
      const actual: number = TimeUtils.getNextYear(1, 35);
      logInfo(`getNextYear(year=1, month=35): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0118 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0119
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0119
     * @tc.desc      getNextYear(year=1, month=40) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0119 begin`);
      const actual: number = TimeUtils.getNextYear(1, 40);
      logInfo(`getNextYear(year=1, month=40): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0119 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0120
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0120
     * @tc.desc      getNextYear(year=1, month=45) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0120 begin`);
      const actual: number = TimeUtils.getNextYear(1, 45);
      logInfo(`getNextYear(year=1, month=45): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0120 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0121
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0121
     * @tc.desc      getNextYear(year=1, month=50) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0121 begin`);
      const actual: number = TimeUtils.getNextYear(1, 50);
      logInfo(`getNextYear(year=1, month=50): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0121 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0122
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0122
     * @tc.desc      getNextYear(year=1, month=55) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0122 begin`);
      const actual: number = TimeUtils.getNextYear(1, 55);
      logInfo(`getNextYear(year=1, month=55): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0122 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0123
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0123
     * @tc.desc      getNextYear(year=1, month=60) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0123 begin`);
      const actual: number = TimeUtils.getNextYear(1, 60);
      logInfo(`getNextYear(year=1, month=60): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0123 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0124
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0124
     * @tc.desc      getNextYear(year=1, month=65) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0124 begin`);
      const actual: number = TimeUtils.getNextYear(1, 65);
      logInfo(`getNextYear(year=1, month=65): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0124 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0125
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0125
     * @tc.desc      getNextYear(year=1, month=70) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0125 begin`);
      const actual: number = TimeUtils.getNextYear(1, 70);
      logInfo(`getNextYear(year=1, month=70): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0125 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0126
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0126
     * @tc.desc      getNextYear(year=1, month=75) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0126 begin`);
      const actual: number = TimeUtils.getNextYear(1, 75);
      logInfo(`getNextYear(year=1, month=75): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0126 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0127
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0127
     * @tc.desc      getNextYear(year=1, month=80) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0127 begin`);
      const actual: number = TimeUtils.getNextYear(1, 80);
      logInfo(`getNextYear(year=1, month=80): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0127 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0128
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0128
     * @tc.desc      getNextYear(year=1, month=85) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0128 begin`);
      const actual: number = TimeUtils.getNextYear(1, 85);
      logInfo(`getNextYear(year=1, month=85): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0128 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0129
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0129
     * @tc.desc      getNextYear(year=1, month=90) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0129 begin`);
      const actual: number = TimeUtils.getNextYear(1, 90);
      logInfo(`getNextYear(year=1, month=90): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0129 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0130
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0130
     * @tc.desc      getNextYear(year=1, month=102) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0130 begin`);
      const actual: number = TimeUtils.getNextYear(1, 102);
      logInfo(`getNextYear(year=1, month=102): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0130 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0131
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0131
     * @tc.desc      getNextYear(year=0, month=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0131 begin`);
      const actual: number = TimeUtils.getNextYear(0, 2);
      logInfo(`getNextYear(year=0, month=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0131 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0132
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0132
     * @tc.desc      getNextYear(year=0, month=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0132 begin`);
      const actual: number = TimeUtils.getNextYear(0, 0);
      logInfo(`getNextYear(year=0, month=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0132 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0133
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0133
     * @tc.desc      getNextYear(year=0, month=12) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0133 begin`);
      const actual: number = TimeUtils.getNextYear(0, 12);
      logInfo(`getNextYear(year=0, month=12): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0133 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0134
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0134
     * @tc.desc      getNextYear(year=0, month=11) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0134 begin`);
      const actual: number = TimeUtils.getNextYear(0, 11);
      logInfo(`getNextYear(year=0, month=11): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0134 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0135
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0135
     * @tc.desc      getNextYear(year=0, month=13) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0135 begin`);
      const actual: number = TimeUtils.getNextYear(0, 13);
      logInfo(`getNextYear(year=0, month=13): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0135 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0136
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0136
     * @tc.desc      getNextYear(year=0, month=24) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0136 begin`);
      const actual: number = TimeUtils.getNextYear(0, 24);
      logInfo(`getNextYear(year=0, month=24): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0136 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0137
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0137
     * @tc.desc      getNextYear(year=0, month=6) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0137 begin`);
      const actual: number = TimeUtils.getNextYear(0, 6);
      logInfo(`getNextYear(year=0, month=6): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0137 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0138
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0138
     * @tc.desc      getNextYear(year=0, month=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0138 begin`);
      const actual: number = TimeUtils.getNextYear(0, -1);
      logInfo(`getNextYear(year=0, month=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0138 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0139
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0139
     * @tc.desc      getNextYear(year=0, month=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0139 begin`);
      const actual: number = TimeUtils.getNextYear(0, 3);
      logInfo(`getNextYear(year=0, month=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0139 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0140
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0140
     * @tc.desc      getNextYear(year=0, month=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0140 begin`);
      const actual: number = TimeUtils.getNextYear(0, 10);
      logInfo(`getNextYear(year=0, month=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0140 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0141
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0141
     * @tc.desc      getNextYear(year=0, month=100) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0141 begin`);
      const actual: number = TimeUtils.getNextYear(0, 100);
      logInfo(`getNextYear(year=0, month=100): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0141 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0142
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0142
     * @tc.desc      getNextYear(year=0, month=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0142 begin`);
      const actual: number = TimeUtils.getNextYear(0, 5);
      logInfo(`getNextYear(year=0, month=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0142 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0143
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0143
     * @tc.desc      getNextYear(year=0, month=15) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0143 begin`);
      const actual: number = TimeUtils.getNextYear(0, 15);
      logInfo(`getNextYear(year=0, month=15): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0143 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0144
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0144
     * @tc.desc      getNextYear(year=0, month=20) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0144 begin`);
      const actual: number = TimeUtils.getNextYear(0, 20);
      logInfo(`getNextYear(year=0, month=20): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0144 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0145
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0145
     * @tc.desc      getNextYear(year=0, month=25) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0145 begin`);
      const actual: number = TimeUtils.getNextYear(0, 25);
      logInfo(`getNextYear(year=0, month=25): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0145 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0146
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0146
     * @tc.desc      getNextYear(year=0, month=30) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0146 begin`);
      const actual: number = TimeUtils.getNextYear(0, 30);
      logInfo(`getNextYear(year=0, month=30): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0146 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0147
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0147
     * @tc.desc      getNextYear(year=0, month=35) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0147 begin`);
      const actual: number = TimeUtils.getNextYear(0, 35);
      logInfo(`getNextYear(year=0, month=35): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0147 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0148
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0148
     * @tc.desc      getNextYear(year=0, month=40) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0148 begin`);
      const actual: number = TimeUtils.getNextYear(0, 40);
      logInfo(`getNextYear(year=0, month=40): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0148 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0149
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0149
     * @tc.desc      getNextYear(year=0, month=45) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0149 begin`);
      const actual: number = TimeUtils.getNextYear(0, 45);
      logInfo(`getNextYear(year=0, month=45): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0149 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0150
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0150
     * @tc.desc      getNextYear(year=0, month=50) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0150 begin`);
      const actual: number = TimeUtils.getNextYear(0, 50);
      logInfo(`getNextYear(year=0, month=50): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0150 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0151
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0151
     * @tc.desc      getNextYear(year=0, month=55) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0151 begin`);
      const actual: number = TimeUtils.getNextYear(0, 55);
      logInfo(`getNextYear(year=0, month=55): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0151 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0152
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0152
     * @tc.desc      getNextYear(year=0, month=60) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0152 begin`);
      const actual: number = TimeUtils.getNextYear(0, 60);
      logInfo(`getNextYear(year=0, month=60): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0152 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0153
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0153
     * @tc.desc      getNextYear(year=0, month=65) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0153 begin`);
      const actual: number = TimeUtils.getNextYear(0, 65);
      logInfo(`getNextYear(year=0, month=65): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0153 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0154
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0154
     * @tc.desc      getNextYear(year=0, month=70) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0154 begin`);
      const actual: number = TimeUtils.getNextYear(0, 70);
      logInfo(`getNextYear(year=0, month=70): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0154 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0155
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0155
     * @tc.desc      getNextYear(year=0, month=75) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0155 begin`);
      const actual: number = TimeUtils.getNextYear(0, 75);
      logInfo(`getNextYear(year=0, month=75): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0155 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0156
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0156
     * @tc.desc      getNextYear(year=0, month=80) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0156 begin`);
      const actual: number = TimeUtils.getNextYear(0, 80);
      logInfo(`getNextYear(year=0, month=80): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0156 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0157
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0157
     * @tc.desc      getNextYear(year=0, month=85) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0157 begin`);
      const actual: number = TimeUtils.getNextYear(0, 85);
      logInfo(`getNextYear(year=0, month=85): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0157 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0158
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0158
     * @tc.desc      getNextYear(year=0, month=90) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0158 begin`);
      const actual: number = TimeUtils.getNextYear(0, 90);
      logInfo(`getNextYear(year=0, month=90): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0158 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0159
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0159
     * @tc.desc      getNextYear(year=0, month=102) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0159 begin`);
      const actual: number = TimeUtils.getNextYear(0, 102);
      logInfo(`getNextYear(year=0, month=102): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0159 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0160
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0160
     * @tc.desc      getNextYear(year=2, month=1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0160 begin`);
      const actual: number = TimeUtils.getNextYear(2, 1);
      logInfo(`getNextYear(year=2, month=1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0160 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0161
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0161
     * @tc.desc      getNextYear(year=2, month=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0161 begin`);
      const actual: number = TimeUtils.getNextYear(2, 2);
      logInfo(`getNextYear(year=2, month=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0161 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0162
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0162
     * @tc.desc      getNextYear(year=2, month=0) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0162 begin`);
      const actual: number = TimeUtils.getNextYear(2, 0);
      logInfo(`getNextYear(year=2, month=0): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0162 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0163
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0163
     * @tc.desc      getNextYear(year=2, month=11) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0163 begin`);
      const actual: number = TimeUtils.getNextYear(2, 11);
      logInfo(`getNextYear(year=2, month=11): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0163 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0164
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0164
     * @tc.desc      getNextYear(year=2, month=13) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0164 begin`);
      const actual: number = TimeUtils.getNextYear(2, 13);
      logInfo(`getNextYear(year=2, month=13): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0164 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0165
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0165
     * @tc.desc      getNextYear(year=2, month=24) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0165 begin`);
      const actual: number = TimeUtils.getNextYear(2, 24);
      logInfo(`getNextYear(year=2, month=24): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0165 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0166
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0166
     * @tc.desc      getNextYear(year=2, month=6) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0166 begin`);
      const actual: number = TimeUtils.getNextYear(2, 6);
      logInfo(`getNextYear(year=2, month=6): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0166 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0167
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0167
     * @tc.desc      getNextYear(year=2, month=-1) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0167 begin`);
      const actual: number = TimeUtils.getNextYear(2, -1);
      logInfo(`getNextYear(year=2, month=-1): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0167 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0168
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0168
     * @tc.desc      getNextYear(year=2, month=3) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0168 begin`);
      const actual: number = TimeUtils.getNextYear(2, 3);
      logInfo(`getNextYear(year=2, month=3): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0168 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0169
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0169
     * @tc.desc      getNextYear(year=2, month=10) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0169 begin`);
      const actual: number = TimeUtils.getNextYear(2, 10);
      logInfo(`getNextYear(year=2, month=10): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0169 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0170
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0170
     * @tc.desc      getNextYear(year=2, month=100) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0170 begin`);
      const actual: number = TimeUtils.getNextYear(2, 100);
      logInfo(`getNextYear(year=2, month=100): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0170 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0171
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0171
     * @tc.desc      getNextYear(year=2, month=5) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0171 begin`);
      const actual: number = TimeUtils.getNextYear(2, 5);
      logInfo(`getNextYear(year=2, month=5): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0171 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0172
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0172
     * @tc.desc      getNextYear(year=2, month=15) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0172 begin`);
      const actual: number = TimeUtils.getNextYear(2, 15);
      logInfo(`getNextYear(year=2, month=15): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0172 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0173
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0173
     * @tc.desc      getNextYear(year=2, month=20) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0173 begin`);
      const actual: number = TimeUtils.getNextYear(2, 20);
      logInfo(`getNextYear(year=2, month=20): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0173 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0174
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0174
     * @tc.desc      getNextYear(year=2, month=25) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0174 begin`);
      const actual: number = TimeUtils.getNextYear(2, 25);
      logInfo(`getNextYear(year=2, month=25): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0174 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0175
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0175
     * @tc.desc      getNextYear(year=2, month=30) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0175 begin`);
      const actual: number = TimeUtils.getNextYear(2, 30);
      logInfo(`getNextYear(year=2, month=30): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0175 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0176
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0176
     * @tc.desc      getNextYear(year=2, month=35) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0176 begin`);
      const actual: number = TimeUtils.getNextYear(2, 35);
      logInfo(`getNextYear(year=2, month=35): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0176 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0177
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0177
     * @tc.desc      getNextYear(year=2, month=40) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0177 begin`);
      const actual: number = TimeUtils.getNextYear(2, 40);
      logInfo(`getNextYear(year=2, month=40): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0177 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0178
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0178
     * @tc.desc      getNextYear(year=2, month=45) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0178 begin`);
      const actual: number = TimeUtils.getNextYear(2, 45);
      logInfo(`getNextYear(year=2, month=45): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0178 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0179
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0179
     * @tc.desc      getNextYear(year=2, month=50) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0179 begin`);
      const actual: number = TimeUtils.getNextYear(2, 50);
      logInfo(`getNextYear(year=2, month=50): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0179 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0180
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0180
     * @tc.desc      getNextYear(year=2, month=55) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0180 begin`);
      const actual: number = TimeUtils.getNextYear(2, 55);
      logInfo(`getNextYear(year=2, month=55): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0180 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0181
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0181
     * @tc.desc      getNextYear(year=2, month=60) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0181 begin`);
      const actual: number = TimeUtils.getNextYear(2, 60);
      logInfo(`getNextYear(year=2, month=60): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0181 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0182
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0182
     * @tc.desc      getNextYear(year=2, month=65) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0182 begin`);
      const actual: number = TimeUtils.getNextYear(2, 65);
      logInfo(`getNextYear(year=2, month=65): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0182 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0183
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0183
     * @tc.desc      getNextYear(year=2, month=70) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0183 begin`);
      const actual: number = TimeUtils.getNextYear(2, 70);
      logInfo(`getNextYear(year=2, month=70): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0183 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0184
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0184
     * @tc.desc      getNextYear(year=2, month=75) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0184 begin`);
      const actual: number = TimeUtils.getNextYear(2, 75);
      logInfo(`getNextYear(year=2, month=75): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0184 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0185
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0185
     * @tc.desc      getNextYear(year=2, month=80) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0185 begin`);
      const actual: number = TimeUtils.getNextYear(2, 80);
      logInfo(`getNextYear(year=2, month=80): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0185 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0186
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0186
     * @tc.desc      getNextYear(year=2, month=85) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0186 begin`);
      const actual: number = TimeUtils.getNextYear(2, 85);
      logInfo(`getNextYear(year=2, month=85): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0186 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0187
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0187
     * @tc.desc      getNextYear(year=2, month=90) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0187 begin`);
      const actual: number = TimeUtils.getNextYear(2, 90);
      logInfo(`getNextYear(year=2, month=90): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0187 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0188
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0188
     * @tc.desc      getNextYear(year=2, month=102) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0188 begin`);
      const actual: number = TimeUtils.getNextYear(2, 102);
      logInfo(`getNextYear(year=2, month=102): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0188 end`);
    });
  });
}
