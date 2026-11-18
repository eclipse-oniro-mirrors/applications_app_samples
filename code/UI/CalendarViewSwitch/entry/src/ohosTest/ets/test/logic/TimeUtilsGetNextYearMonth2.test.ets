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

/** Logic checks for TimeUtils.getNextYearMonth (93 cases). */
export default function timeUtilsGetNextYearMonth2Test(): void {
  describe('TimeUtilsGetNextYearMonth2Test', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0097
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0097
     * @tc.desc      getNextYearMonth(year=2000, month=2) returns "2000-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0097 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2000, 2);
      logInfo(`getNextYearMonth(year=2000, month=2): actual=${actual}`);
      expect(actual).assertEqual('2000-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0097 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0098
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0098
     * @tc.desc      getNextYearMonth(year=2000, month=0) returns "2000-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0098 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2000, 0);
      logInfo(`getNextYearMonth(year=2000, month=0): actual=${actual}`);
      expect(actual).assertEqual('2000-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0098 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0099
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0099
     * @tc.desc      getNextYearMonth(year=2000, month=12) returns "2001-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0099 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2000, 12);
      logInfo(`getNextYearMonth(year=2000, month=12): actual=${actual}`);
      expect(actual).assertEqual('2001-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0099 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0100
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0100
     * @tc.desc      getNextYearMonth(year=2000, month=11) returns "2000-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0100 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2000, 11);
      logInfo(`getNextYearMonth(year=2000, month=11): actual=${actual}`);
      expect(actual).assertEqual('2000-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0100 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0101
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0101
     * @tc.desc      getNextYearMonth(year=2000, month=6) returns "2000-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0101 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2000, 6);
      logInfo(`getNextYearMonth(year=2000, month=6): actual=${actual}`);
      expect(actual).assertEqual('2000-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0101 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0102
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0102
     * @tc.desc      getNextYearMonth(year=2000, month=-1) returns "2000-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0102 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2000, -1);
      logInfo(`getNextYearMonth(year=2000, month=-1): actual=${actual}`);
      expect(actual).assertEqual('2000-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0102 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0103
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0103
     * @tc.desc      getNextYearMonth(year=2000, month=3) returns "2000-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0103 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2000, 3);
      logInfo(`getNextYearMonth(year=2000, month=3): actual=${actual}`);
      expect(actual).assertEqual('2000-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0103 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0104
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0104
     * @tc.desc      getNextYearMonth(year=2000, month=10) returns "2000-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0104 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2000, 10);
      logInfo(`getNextYearMonth(year=2000, month=10): actual=${actual}`);
      expect(actual).assertEqual('2000-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0104 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0105
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0105
     * @tc.desc      getNextYearMonth(year=2000, month=5) returns "2000-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0105 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2000, 5);
      logInfo(`getNextYearMonth(year=2000, month=5): actual=${actual}`);
      expect(actual).assertEqual('2000-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0105 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0106
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0106
     * @tc.desc      getNextYearMonth(year=1900, month=1) returns "1900-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0106 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1900, 1);
      logInfo(`getNextYearMonth(year=1900, month=1): actual=${actual}`);
      expect(actual).assertEqual('1900-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0106 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0107
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0107
     * @tc.desc      getNextYearMonth(year=1900, month=2) returns "1900-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0107 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1900, 2);
      logInfo(`getNextYearMonth(year=1900, month=2): actual=${actual}`);
      expect(actual).assertEqual('1900-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0107 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0108
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0108
     * @tc.desc      getNextYearMonth(year=1900, month=0) returns "1900-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0108 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1900, 0);
      logInfo(`getNextYearMonth(year=1900, month=0): actual=${actual}`);
      expect(actual).assertEqual('1900-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0108 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0109
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0109
     * @tc.desc      getNextYearMonth(year=1900, month=12) returns "1901-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0109 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1900, 12);
      logInfo(`getNextYearMonth(year=1900, month=12): actual=${actual}`);
      expect(actual).assertEqual('1901-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0109 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0110
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0110
     * @tc.desc      getNextYearMonth(year=1900, month=11) returns "1900-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0110 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1900, 11);
      logInfo(`getNextYearMonth(year=1900, month=11): actual=${actual}`);
      expect(actual).assertEqual('1900-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0110 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0111
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0111
     * @tc.desc      getNextYearMonth(year=1900, month=6) returns "1900-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0111 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1900, 6);
      logInfo(`getNextYearMonth(year=1900, month=6): actual=${actual}`);
      expect(actual).assertEqual('1900-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0111 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0112
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0112
     * @tc.desc      getNextYearMonth(year=1900, month=-1) returns "1900-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0112 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1900, -1);
      logInfo(`getNextYearMonth(year=1900, month=-1): actual=${actual}`);
      expect(actual).assertEqual('1900-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0112 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0113
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0113
     * @tc.desc      getNextYearMonth(year=1900, month=3) returns "1900-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0113 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1900, 3);
      logInfo(`getNextYearMonth(year=1900, month=3): actual=${actual}`);
      expect(actual).assertEqual('1900-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0113 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0114
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0114
     * @tc.desc      getNextYearMonth(year=1900, month=10) returns "1900-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0114 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1900, 10);
      logInfo(`getNextYearMonth(year=1900, month=10): actual=${actual}`);
      expect(actual).assertEqual('1900-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0114 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0115
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0115
     * @tc.desc      getNextYearMonth(year=1900, month=5) returns "1900-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0115 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1900, 5);
      logInfo(`getNextYearMonth(year=1900, month=5): actual=${actual}`);
      expect(actual).assertEqual('1900-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0115 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0116
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0116
     * @tc.desc      getNextYearMonth(year=2100, month=1) returns "2100-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0116 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2100, 1);
      logInfo(`getNextYearMonth(year=2100, month=1): actual=${actual}`);
      expect(actual).assertEqual('2100-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0116 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0117
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0117
     * @tc.desc      getNextYearMonth(year=2100, month=2) returns "2100-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0117 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2100, 2);
      logInfo(`getNextYearMonth(year=2100, month=2): actual=${actual}`);
      expect(actual).assertEqual('2100-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0117 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0118
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0118
     * @tc.desc      getNextYearMonth(year=2100, month=0) returns "2100-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0118 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2100, 0);
      logInfo(`getNextYearMonth(year=2100, month=0): actual=${actual}`);
      expect(actual).assertEqual('2100-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0118 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0119
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0119
     * @tc.desc      getNextYearMonth(year=2100, month=12) returns "2101-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0119 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2100, 12);
      logInfo(`getNextYearMonth(year=2100, month=12): actual=${actual}`);
      expect(actual).assertEqual('2101-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0119 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0120
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0120
     * @tc.desc      getNextYearMonth(year=2100, month=11) returns "2100-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0120 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2100, 11);
      logInfo(`getNextYearMonth(year=2100, month=11): actual=${actual}`);
      expect(actual).assertEqual('2100-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0120 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0121
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0121
     * @tc.desc      getNextYearMonth(year=2100, month=6) returns "2100-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0121 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2100, 6);
      logInfo(`getNextYearMonth(year=2100, month=6): actual=${actual}`);
      expect(actual).assertEqual('2100-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0121 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0122
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0122
     * @tc.desc      getNextYearMonth(year=2100, month=-1) returns "2100-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0122 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2100, -1);
      logInfo(`getNextYearMonth(year=2100, month=-1): actual=${actual}`);
      expect(actual).assertEqual('2100-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0122 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0123
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0123
     * @tc.desc      getNextYearMonth(year=2100, month=3) returns "2100-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0123 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2100, 3);
      logInfo(`getNextYearMonth(year=2100, month=3): actual=${actual}`);
      expect(actual).assertEqual('2100-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0123 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0124
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0124
     * @tc.desc      getNextYearMonth(year=2100, month=10) returns "2100-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0124 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2100, 10);
      logInfo(`getNextYearMonth(year=2100, month=10): actual=${actual}`);
      expect(actual).assertEqual('2100-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0124 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0125
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0125
     * @tc.desc      getNextYearMonth(year=2100, month=5) returns "2100-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0125 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2100, 5);
      logInfo(`getNextYearMonth(year=2100, month=5): actual=${actual}`);
      expect(actual).assertEqual('2100-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0125 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0126
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0126
     * @tc.desc      getNextYearMonth(year=1970, month=1) returns "1970-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0126 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1970, 1);
      logInfo(`getNextYearMonth(year=1970, month=1): actual=${actual}`);
      expect(actual).assertEqual('1970-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0126 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0127
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0127
     * @tc.desc      getNextYearMonth(year=1970, month=2) returns "1970-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0127 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1970, 2);
      logInfo(`getNextYearMonth(year=1970, month=2): actual=${actual}`);
      expect(actual).assertEqual('1970-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0127 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0128
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0128
     * @tc.desc      getNextYearMonth(year=1970, month=0) returns "1970-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0128 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1970, 0);
      logInfo(`getNextYearMonth(year=1970, month=0): actual=${actual}`);
      expect(actual).assertEqual('1970-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0128 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0129
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0129
     * @tc.desc      getNextYearMonth(year=1970, month=12) returns "1971-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0129 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1970, 12);
      logInfo(`getNextYearMonth(year=1970, month=12): actual=${actual}`);
      expect(actual).assertEqual('1971-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0129 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0130
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0130
     * @tc.desc      getNextYearMonth(year=1970, month=11) returns "1970-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0130 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1970, 11);
      logInfo(`getNextYearMonth(year=1970, month=11): actual=${actual}`);
      expect(actual).assertEqual('1970-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0130 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0131
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0131
     * @tc.desc      getNextYearMonth(year=1970, month=6) returns "1970-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0131 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1970, 6);
      logInfo(`getNextYearMonth(year=1970, month=6): actual=${actual}`);
      expect(actual).assertEqual('1970-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0131 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0132
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0132
     * @tc.desc      getNextYearMonth(year=1970, month=-1) returns "1970-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0132 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1970, -1);
      logInfo(`getNextYearMonth(year=1970, month=-1): actual=${actual}`);
      expect(actual).assertEqual('1970-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0132 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0133
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0133
     * @tc.desc      getNextYearMonth(year=1970, month=3) returns "1970-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0133 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1970, 3);
      logInfo(`getNextYearMonth(year=1970, month=3): actual=${actual}`);
      expect(actual).assertEqual('1970-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0133 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0134
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0134
     * @tc.desc      getNextYearMonth(year=1970, month=10) returns "1970-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0134 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1970, 10);
      logInfo(`getNextYearMonth(year=1970, month=10): actual=${actual}`);
      expect(actual).assertEqual('1970-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0134 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0135
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0135
     * @tc.desc      getNextYearMonth(year=1970, month=5) returns "1970-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0135 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1970, 5);
      logInfo(`getNextYearMonth(year=1970, month=5): actual=${actual}`);
      expect(actual).assertEqual('1970-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0135 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0136
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0136
     * @tc.desc      getNextYearMonth(year=2025, month=1) returns "2025-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0136 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2025, 1);
      logInfo(`getNextYearMonth(year=2025, month=1): actual=${actual}`);
      expect(actual).assertEqual('2025-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0136 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0137
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0137
     * @tc.desc      getNextYearMonth(year=2025, month=2) returns "2025-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0137 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2025, 2);
      logInfo(`getNextYearMonth(year=2025, month=2): actual=${actual}`);
      expect(actual).assertEqual('2025-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0137 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0138
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0138
     * @tc.desc      getNextYearMonth(year=2025, month=12) returns "2026-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0138 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2025, 12);
      logInfo(`getNextYearMonth(year=2025, month=12): actual=${actual}`);
      expect(actual).assertEqual('2026-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0138 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0139
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0139
     * @tc.desc      getNextYearMonth(year=2025, month=11) returns "2025-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0139 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2025, 11);
      logInfo(`getNextYearMonth(year=2025, month=11): actual=${actual}`);
      expect(actual).assertEqual('2025-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0139 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0140
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0140
     * @tc.desc      getNextYearMonth(year=2025, month=6) returns "2025-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0140 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2025, 6);
      logInfo(`getNextYearMonth(year=2025, month=6): actual=${actual}`);
      expect(actual).assertEqual('2025-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0140 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0141
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0141
     * @tc.desc      getNextYearMonth(year=2025, month=-1) returns "2025-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0141 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2025, -1);
      logInfo(`getNextYearMonth(year=2025, month=-1): actual=${actual}`);
      expect(actual).assertEqual('2025-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0141 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0142
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0142
     * @tc.desc      getNextYearMonth(year=2025, month=3) returns "2025-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0142 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2025, 3);
      logInfo(`getNextYearMonth(year=2025, month=3): actual=${actual}`);
      expect(actual).assertEqual('2025-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0142 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0143
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0143
     * @tc.desc      getNextYearMonth(year=2025, month=10) returns "2025-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0143 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2025, 10);
      logInfo(`getNextYearMonth(year=2025, month=10): actual=${actual}`);
      expect(actual).assertEqual('2025-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0143 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0144
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0144
     * @tc.desc      getNextYearMonth(year=2025, month=5) returns "2025-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0144 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2025, 5);
      logInfo(`getNextYearMonth(year=2025, month=5): actual=${actual}`);
      expect(actual).assertEqual('2025-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0144 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0145
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0145
     * @tc.desc      getNextYearMonth(year=-1, month=1) returns "-1-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0145 begin`);
      const actual: string = TimeUtils.getNextYearMonth(-1, 1);
      logInfo(`getNextYearMonth(year=-1, month=1): actual=${actual}`);
      expect(actual).assertEqual('-1-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0145 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0146
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0146
     * @tc.desc      getNextYearMonth(year=-1, month=2) returns "-1-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0146 begin`);
      const actual: string = TimeUtils.getNextYearMonth(-1, 2);
      logInfo(`getNextYearMonth(year=-1, month=2): actual=${actual}`);
      expect(actual).assertEqual('-1-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0146 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0147
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0147
     * @tc.desc      getNextYearMonth(year=-1, month=0) returns "-1-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0147 begin`);
      const actual: string = TimeUtils.getNextYearMonth(-1, 0);
      logInfo(`getNextYearMonth(year=-1, month=0): actual=${actual}`);
      expect(actual).assertEqual('-1-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0147 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0148
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0148
     * @tc.desc      getNextYearMonth(year=-1, month=11) returns "-1-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0148 begin`);
      const actual: string = TimeUtils.getNextYearMonth(-1, 11);
      logInfo(`getNextYearMonth(year=-1, month=11): actual=${actual}`);
      expect(actual).assertEqual('-1-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0148 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0149
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0149
     * @tc.desc      getNextYearMonth(year=-1, month=6) returns "-1-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0149 begin`);
      const actual: string = TimeUtils.getNextYearMonth(-1, 6);
      logInfo(`getNextYearMonth(year=-1, month=6): actual=${actual}`);
      expect(actual).assertEqual('-1-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0149 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0150
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0150
     * @tc.desc      getNextYearMonth(year=-1, month=-1) returns "-1-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0150 begin`);
      const actual: string = TimeUtils.getNextYearMonth(-1, -1);
      logInfo(`getNextYearMonth(year=-1, month=-1): actual=${actual}`);
      expect(actual).assertEqual('-1-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0150 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0151
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0151
     * @tc.desc      getNextYearMonth(year=-1, month=3) returns "-1-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0151 begin`);
      const actual: string = TimeUtils.getNextYearMonth(-1, 3);
      logInfo(`getNextYearMonth(year=-1, month=3): actual=${actual}`);
      expect(actual).assertEqual('-1-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0151 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0152
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0152
     * @tc.desc      getNextYearMonth(year=-1, month=10) returns "-1-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0152 begin`);
      const actual: string = TimeUtils.getNextYearMonth(-1, 10);
      logInfo(`getNextYearMonth(year=-1, month=10): actual=${actual}`);
      expect(actual).assertEqual('-1-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0152 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0153
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0153
     * @tc.desc      getNextYearMonth(year=-1, month=5) returns "-1-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0153 begin`);
      const actual: string = TimeUtils.getNextYearMonth(-1, 5);
      logInfo(`getNextYearMonth(year=-1, month=5): actual=${actual}`);
      expect(actual).assertEqual('-1-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0153 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0154
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0154
     * @tc.desc      getNextYearMonth(year=3, month=1) returns "3-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0154 begin`);
      const actual: string = TimeUtils.getNextYearMonth(3, 1);
      logInfo(`getNextYearMonth(year=3, month=1): actual=${actual}`);
      expect(actual).assertEqual('3-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0154 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0155
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0155
     * @tc.desc      getNextYearMonth(year=3, month=2) returns "3-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0155 begin`);
      const actual: string = TimeUtils.getNextYearMonth(3, 2);
      logInfo(`getNextYearMonth(year=3, month=2): actual=${actual}`);
      expect(actual).assertEqual('3-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0155 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0156
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0156
     * @tc.desc      getNextYearMonth(year=3, month=12) returns "4-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0156 begin`);
      const actual: string = TimeUtils.getNextYearMonth(3, 12);
      logInfo(`getNextYearMonth(year=3, month=12): actual=${actual}`);
      expect(actual).assertEqual('4-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0156 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0157
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0157
     * @tc.desc      getNextYearMonth(year=3, month=11) returns "3-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0157 begin`);
      const actual: string = TimeUtils.getNextYearMonth(3, 11);
      logInfo(`getNextYearMonth(year=3, month=11): actual=${actual}`);
      expect(actual).assertEqual('3-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0157 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0158
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0158
     * @tc.desc      getNextYearMonth(year=3, month=6) returns "3-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0158 begin`);
      const actual: string = TimeUtils.getNextYearMonth(3, 6);
      logInfo(`getNextYearMonth(year=3, month=6): actual=${actual}`);
      expect(actual).assertEqual('3-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0158 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0159
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0159
     * @tc.desc      getNextYearMonth(year=3, month=-1) returns "3-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0159 begin`);
      const actual: string = TimeUtils.getNextYearMonth(3, -1);
      logInfo(`getNextYearMonth(year=3, month=-1): actual=${actual}`);
      expect(actual).assertEqual('3-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0159 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0160
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0160
     * @tc.desc      getNextYearMonth(year=3, month=3) returns "3-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0160 begin`);
      const actual: string = TimeUtils.getNextYearMonth(3, 3);
      logInfo(`getNextYearMonth(year=3, month=3): actual=${actual}`);
      expect(actual).assertEqual('3-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0160 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0161
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0161
     * @tc.desc      getNextYearMonth(year=3, month=10) returns "3-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0161 begin`);
      const actual: string = TimeUtils.getNextYearMonth(3, 10);
      logInfo(`getNextYearMonth(year=3, month=10): actual=${actual}`);
      expect(actual).assertEqual('3-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0161 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0162
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0162
     * @tc.desc      getNextYearMonth(year=3, month=5) returns "3-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0162 begin`);
      const actual: string = TimeUtils.getNextYearMonth(3, 5);
      logInfo(`getNextYearMonth(year=3, month=5): actual=${actual}`);
      expect(actual).assertEqual('3-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0162 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0163
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0163
     * @tc.desc      getNextYearMonth(year=10, month=1) returns "10-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0163 begin`);
      const actual: string = TimeUtils.getNextYearMonth(10, 1);
      logInfo(`getNextYearMonth(year=10, month=1): actual=${actual}`);
      expect(actual).assertEqual('10-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0163 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0164
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0164
     * @tc.desc      getNextYearMonth(year=10, month=2) returns "10-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0164 begin`);
      const actual: string = TimeUtils.getNextYearMonth(10, 2);
      logInfo(`getNextYearMonth(year=10, month=2): actual=${actual}`);
      expect(actual).assertEqual('10-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0164 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0165
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0165
     * @tc.desc      getNextYearMonth(year=10, month=0) returns "10-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0165 begin`);
      const actual: string = TimeUtils.getNextYearMonth(10, 0);
      logInfo(`getNextYearMonth(year=10, month=0): actual=${actual}`);
      expect(actual).assertEqual('10-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0165 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0166
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0166
     * @tc.desc      getNextYearMonth(year=10, month=11) returns "10-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0166 begin`);
      const actual: string = TimeUtils.getNextYearMonth(10, 11);
      logInfo(`getNextYearMonth(year=10, month=11): actual=${actual}`);
      expect(actual).assertEqual('10-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0166 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0167
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0167
     * @tc.desc      getNextYearMonth(year=10, month=6) returns "10-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0167 begin`);
      const actual: string = TimeUtils.getNextYearMonth(10, 6);
      logInfo(`getNextYearMonth(year=10, month=6): actual=${actual}`);
      expect(actual).assertEqual('10-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0167 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0168
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0168
     * @tc.desc      getNextYearMonth(year=10, month=-1) returns "10-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0168 begin`);
      const actual: string = TimeUtils.getNextYearMonth(10, -1);
      logInfo(`getNextYearMonth(year=10, month=-1): actual=${actual}`);
      expect(actual).assertEqual('10-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0168 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0169
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0169
     * @tc.desc      getNextYearMonth(year=10, month=3) returns "10-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0169 begin`);
      const actual: string = TimeUtils.getNextYearMonth(10, 3);
      logInfo(`getNextYearMonth(year=10, month=3): actual=${actual}`);
      expect(actual).assertEqual('10-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0169 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0170
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0170
     * @tc.desc      getNextYearMonth(year=10, month=10) returns "10-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0170 begin`);
      const actual: string = TimeUtils.getNextYearMonth(10, 10);
      logInfo(`getNextYearMonth(year=10, month=10): actual=${actual}`);
      expect(actual).assertEqual('10-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0170 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0171
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0171
     * @tc.desc      getNextYearMonth(year=10, month=5) returns "10-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0171 begin`);
      const actual: string = TimeUtils.getNextYearMonth(10, 5);
      logInfo(`getNextYearMonth(year=10, month=5): actual=${actual}`);
      expect(actual).assertEqual('10-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0171 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0172
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0172
     * @tc.desc      getNextYearMonth(year=100, month=1) returns "100-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0172 begin`);
      const actual: string = TimeUtils.getNextYearMonth(100, 1);
      logInfo(`getNextYearMonth(year=100, month=1): actual=${actual}`);
      expect(actual).assertEqual('100-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0172 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0173
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0173
     * @tc.desc      getNextYearMonth(year=100, month=2) returns "100-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0173 begin`);
      const actual: string = TimeUtils.getNextYearMonth(100, 2);
      logInfo(`getNextYearMonth(year=100, month=2): actual=${actual}`);
      expect(actual).assertEqual('100-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0173 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0174
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0174
     * @tc.desc      getNextYearMonth(year=100, month=0) returns "100-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0174 begin`);
      const actual: string = TimeUtils.getNextYearMonth(100, 0);
      logInfo(`getNextYearMonth(year=100, month=0): actual=${actual}`);
      expect(actual).assertEqual('100-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0174 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0175
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0175
     * @tc.desc      getNextYearMonth(year=100, month=12) returns "101-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0175 begin`);
      const actual: string = TimeUtils.getNextYearMonth(100, 12);
      logInfo(`getNextYearMonth(year=100, month=12): actual=${actual}`);
      expect(actual).assertEqual('101-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0175 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0176
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0176
     * @tc.desc      getNextYearMonth(year=100, month=11) returns "100-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0176 begin`);
      const actual: string = TimeUtils.getNextYearMonth(100, 11);
      logInfo(`getNextYearMonth(year=100, month=11): actual=${actual}`);
      expect(actual).assertEqual('100-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0176 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0177
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0177
     * @tc.desc      getNextYearMonth(year=100, month=6) returns "100-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0177 begin`);
      const actual: string = TimeUtils.getNextYearMonth(100, 6);
      logInfo(`getNextYearMonth(year=100, month=6): actual=${actual}`);
      expect(actual).assertEqual('100-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0177 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0178
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0178
     * @tc.desc      getNextYearMonth(year=100, month=-1) returns "100-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0178 begin`);
      const actual: string = TimeUtils.getNextYearMonth(100, -1);
      logInfo(`getNextYearMonth(year=100, month=-1): actual=${actual}`);
      expect(actual).assertEqual('100-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0178 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0179
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0179
     * @tc.desc      getNextYearMonth(year=100, month=3) returns "100-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0179 begin`);
      const actual: string = TimeUtils.getNextYearMonth(100, 3);
      logInfo(`getNextYearMonth(year=100, month=3): actual=${actual}`);
      expect(actual).assertEqual('100-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0179 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0180
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0180
     * @tc.desc      getNextYearMonth(year=100, month=10) returns "100-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0180 begin`);
      const actual: string = TimeUtils.getNextYearMonth(100, 10);
      logInfo(`getNextYearMonth(year=100, month=10): actual=${actual}`);
      expect(actual).assertEqual('100-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0180 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0181
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0181
     * @tc.desc      getNextYearMonth(year=100, month=5) returns "100-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0181 begin`);
      const actual: string = TimeUtils.getNextYearMonth(100, 5);
      logInfo(`getNextYearMonth(year=100, month=5): actual=${actual}`);
      expect(actual).assertEqual('100-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0181 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0182
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0182
     * @tc.desc      getNextYearMonth(year=105, month=1) returns "105-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0182 begin`);
      const actual: string = TimeUtils.getNextYearMonth(105, 1);
      logInfo(`getNextYearMonth(year=105, month=1): actual=${actual}`);
      expect(actual).assertEqual('105-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0182 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0183
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0183
     * @tc.desc      getNextYearMonth(year=105, month=2) returns "105-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0183 begin`);
      const actual: string = TimeUtils.getNextYearMonth(105, 2);
      logInfo(`getNextYearMonth(year=105, month=2): actual=${actual}`);
      expect(actual).assertEqual('105-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0183 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0184
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0184
     * @tc.desc      getNextYearMonth(year=105, month=0) returns "105-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0184 begin`);
      const actual: string = TimeUtils.getNextYearMonth(105, 0);
      logInfo(`getNextYearMonth(year=105, month=0): actual=${actual}`);
      expect(actual).assertEqual('105-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0184 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0185
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0185
     * @tc.desc      getNextYearMonth(year=105, month=12) returns "106-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0185 begin`);
      const actual: string = TimeUtils.getNextYearMonth(105, 12);
      logInfo(`getNextYearMonth(year=105, month=12): actual=${actual}`);
      expect(actual).assertEqual('106-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0185 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0186
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0186
     * @tc.desc      getNextYearMonth(year=105, month=11) returns "105-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0186 begin`);
      const actual: string = TimeUtils.getNextYearMonth(105, 11);
      logInfo(`getNextYearMonth(year=105, month=11): actual=${actual}`);
      expect(actual).assertEqual('105-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0186 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0187
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0187
     * @tc.desc      getNextYearMonth(year=105, month=6) returns "105-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0187 begin`);
      const actual: string = TimeUtils.getNextYearMonth(105, 6);
      logInfo(`getNextYearMonth(year=105, month=6): actual=${actual}`);
      expect(actual).assertEqual('105-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0187 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0188
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0188
     * @tc.desc      getNextYearMonth(year=105, month=-1) returns "105-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0188 begin`);
      const actual: string = TimeUtils.getNextYearMonth(105, -1);
      logInfo(`getNextYearMonth(year=105, month=-1): actual=${actual}`);
      expect(actual).assertEqual('105-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0188 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0189
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0189
     * @tc.desc      getNextYearMonth(year=105, month=3) returns "105-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0189 begin`);
      const actual: string = TimeUtils.getNextYearMonth(105, 3);
      logInfo(`getNextYearMonth(year=105, month=3): actual=${actual}`);
      expect(actual).assertEqual('105-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0189 end`);
    });
  });
}
