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

/** Logic checks for TimeUtils.getPreviousMonthLastDays (81 cases). */
export default function timeUtilsGetPreviousMonthLastDays2Test(): void {
  describe('TimeUtilsGetPreviousMonthLastDays2Test', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0082
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0082
     * @tc.desc      getPreviousMonthLastDays(year=3, month=13, firstDayOfWeek=7) returns [25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0082 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 13, 7);
      logInfo(`getPreviousMonthLastDays(year=3, month=13...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`getPreviousMonthLastDays(year=3, month=13...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0082 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0083
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0083
     * @tc.desc      getPreviousMonthLastDays(year=-1, month=10, firstDayOfWeek=7) returns [24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0083 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(-1, 10, 7);
      logInfo(`getPreviousMonthLastDays(year=-1, month=1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`getPreviousMonthLastDays(year=-1, month=1...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0083 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0084
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0084
     * @tc.desc      getPreviousMonthLastDays(year=1970, month=2, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0084 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1970, 2, 0);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0084 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0085
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0085
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=-1, firstDayOfWeek=-1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0085 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, -1, -1);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0085 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0086
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0086
     * @tc.desc      getPreviousMonthLastDays(year=3, month=59.41, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0086 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 59.41, 0);
      logInfo(`getPreviousMonthLastDays(year=3, month=59...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0086 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0087
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0087
     * @tc.desc      getPreviousMonthLastDays(year=1970, month=-1, firstDayOfWeek=87.93) returns [29.069999999999993,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0087 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1970, -1, 87.93);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: JSON.stringify(a...${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('[-55.93000000000001,-54.93000000000001]');
      logInfo(`getPreviousMonthLastDays(year=1970, month...: JSON.stringify...${JSON.stringify(actual.slice(42, 44))}`);
      expect(JSON.stringify(actual.slice(42, 44))).assertEqual('[-13.930000000000007,-12.930000000000007]');
      logInfo(`getPreviousMonthLastDays(year=1970, month...: JSON.stringify...${JSON.stringify(actual.slice(85, 87))}`);
      expect(JSON.stringify(actual.slice(85, 87))).assertEqual('[29.069999999999993,30.069999999999993]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0087 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0088
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0088
     * @tc.desc      getPreviousMonthLastDays(year=2100, month=-1, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0088 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2100, -1, 0);
      logInfo(`getPreviousMonthLastDays(year=2100, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0088 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0089
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0089
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=2, firstDayOfWeek=10) returns [22,23,24,25,26,27,28,29...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0089 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 2, 10);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0089 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0090
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0090
     * @tc.desc      getPreviousMonthLastDays(year=3, month=6, firstDayOfWeek=2) returns [30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0090 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 6, 2);
      logInfo(`getPreviousMonthLastDays(year=3, month=6,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`getPreviousMonthLastDays(year=3, month=6,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0090 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0091
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0091
     * @tc.desc      getPreviousMonthLastDays(year=2, month=2, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0091 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2, 2, 0);
      logInfo(`getPreviousMonthLastDays(year=2, month=2,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0091 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0092
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0092
     * @tc.desc      getPreviousMonthLastDays(year=2, month=10, firstDayOfWeek=7) returns [24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0092 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2, 10, 7);
      logInfo(`getPreviousMonthLastDays(year=2, month=10...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`getPreviousMonthLastDays(year=2, month=10...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0092 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0093
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0093
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=0, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0093 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, 0, 0);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0093 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0094
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0094
     * @tc.desc      getPreviousMonthLastDays(year=1970, month=59.41, firstDayOfWeek=6) returns [26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0094 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1970, 59.41, 6);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0094 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0095
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0095
     * @tc.desc      getPreviousMonthLastDays(year=-1, month=2, firstDayOfWeek=15) returns [17,18,19,20,21,22,23,24,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0095 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(-1, 2, 15);
      logInfo(`getPreviousMonthLastDays(year=-1, month=2...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(15);
      logInfo(`getPreviousMonthLastDays(year=-1, month=2...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0095 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0096
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0096
     * @tc.desc      getPreviousMonthLastDays(year=3, month=0, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0096 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 0, 0);
      logInfo(`getPreviousMonthLastDays(year=3, month=0,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0096 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0097
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0097
     * @tc.desc      getPreviousMonthLastDays(year=2100, month=0, firstDayOfWeek=2) returns [29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0097 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2100, 0, 2);
      logInfo(`getPreviousMonthLastDays(year=2100, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`getPreviousMonthLastDays(year=2100, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0097 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0098
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0098
     * @tc.desc      getPreviousMonthLastDays(year=2100, month=2, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0098 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2100, 2, 0);
      logInfo(`getPreviousMonthLastDays(year=2100, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0098 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0099
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0099
     * @tc.desc      getPreviousMonthLastDays(year=2025, month=10, firstDayOfWeek=2) returns [29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0099 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2025, 10, 2);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0099 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0100
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0100
     * @tc.desc      getPreviousMonthLastDays(year=2023, month=13, firstDayOfWeek=1) returns [31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0100 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2023, 13, 1);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0100 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0101
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0101
     * @tc.desc      getPreviousMonthLastDays(year=0, month=12, firstDayOfWeek=100) returns [19,20,21,22,23,24,25,26,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0101 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(0, 12, 100);
      logInfo(`getPreviousMonthLastDays(year=0, month=12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`getPreviousMonthLastDays(year=0, month=12...: JSON.stringify(...${JSON.stringify(actual.slice(0, 13))}`);
      expect(JSON.stringify(actual.slice(0, 13))).assertEqual('[-69,-68,-67,-66,-65,-64,-63,-62,-61,-60,-59,-58,-57]');
      logInfo(`getPreviousMonthLastDays(year=0, month=12...: JSON.stringify...${JSON.stringify(actual.slice(39, 52))}`);
      expect(JSON.stringify(actual.slice(39, 52))).assertEqual('[-30,-29,-28,-27,-26,-25,-24,-23,-22,-21,-20,-19,-18]');
      logInfo(`getPreviousMonthLastDays(year=0, month=12...: JSON.stringif...${JSON.stringify(actual.slice(88, 100))}`);
      expect(JSON.stringify(actual.slice(88, 100))).assertEqual('[19,20,21,22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0101 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0102
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0102
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=6, firstDayOfWeek=10) returns [22,23,24,25,26,27,28,29...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0102 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 6, 10);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0102 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0103
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0103
     * @tc.desc      getPreviousMonthLastDays(year=2025, month=6, firstDayOfWeek=2) returns [30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0103 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2025, 6, 2);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0103 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0104
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0104
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=-1, firstDayOfWeek=87.93) returns [29.069999999999993,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0104 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, -1, 87.93);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify(a...${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('[-55.93000000000001,-54.93000000000001]');
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify...${JSON.stringify(actual.slice(42, 44))}`);
      expect(JSON.stringify(actual.slice(42, 44))).assertEqual('[-13.930000000000007,-12.930000000000007]');
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify...${JSON.stringify(actual.slice(85, 87))}`);
      expect(JSON.stringify(actual.slice(85, 87))).assertEqual('[29.069999999999993,30.069999999999993]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0104 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0105
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0105
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=13, firstDayOfWeek=6) returns [26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0105 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 13, 6);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0105 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0106
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0106
     * @tc.desc      getPreviousMonthLastDays(year=0, month=13, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0106 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(0, 13, 0);
      logInfo(`getPreviousMonthLastDays(year=0, month=13...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0106 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0107
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0107
     * @tc.desc      getPreviousMonthLastDays(year=1970, month=-1, firstDayOfWeek=10) returns [22,23,24,25,26,27,28,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0107 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1970, -1, 10);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0107 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0108
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0108
     * @tc.desc      getPreviousMonthLastDays(year=3, month=1, firstDayOfWeek=5) returns [27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0108 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 1, 5);
      logInfo(`getPreviousMonthLastDays(year=3, month=1,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=3, month=1,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0108 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0109
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0109
     * @tc.desc      getPreviousMonthLastDays(year=-1, month=2, firstDayOfWeek=1) returns [31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0109 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(-1, 2, 1);
      logInfo(`getPreviousMonthLastDays(year=-1, month=2...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=-1, month=2...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0109 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0110
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0110
     * @tc.desc      getPreviousMonthLastDays(year=2023, month=100, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0110 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2023, 100, 0);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0110 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0111
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0111
     * @tc.desc      getPreviousMonthLastDays(year=1, month=-1, firstDayOfWeek=2) returns [30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0111 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, -1, 2);
      logInfo(`getPreviousMonthLastDays(year=1, month=-1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`getPreviousMonthLastDays(year=1, month=-1...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0111 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0112
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0112
     * @tc.desc      getPreviousMonthLastDays(year=0, month=3, firstDayOfWeek=100) returns [17,18,19,20,21,22,23,24,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0112 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(0, 3, 100);
      logInfo(`getPreviousMonthLastDays(year=0, month=3,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`getPreviousMonthLastDays(year=0, month=3,...: JSON.stringify(...${JSON.stringify(actual.slice(0, 13))}`);
      expect(JSON.stringify(actual.slice(0, 13))).assertEqual('[-71,-70,-69,-68,-67,-66,-65,-64,-63,-62,-61,-60,-59]');
      logInfo(`getPreviousMonthLastDays(year=0, month=3,...: JSON.stringify...${JSON.stringify(actual.slice(39, 52))}`);
      expect(JSON.stringify(actual.slice(39, 52))).assertEqual('[-32,-31,-30,-29,-28,-27,-26,-25,-24,-23,-22,-21,-20]');
      logInfo(`getPreviousMonthLastDays(year=0, month=3,...: JSON.stringif...${JSON.stringify(actual.slice(88, 100))}`);
      expect(JSON.stringify(actual.slice(88, 100))).assertEqual('[17,18,19,20,21,22,23,24,25,26,27,28]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0112 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0113
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0113
     * @tc.desc      getPreviousMonthLastDays(year=3, month=6, firstDayOfWeek=87.93) returns [29.069999999999993,30.0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0113 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 6, 87.93);
      logInfo(`getPreviousMonthLastDays(year=3, month=6,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`getPreviousMonthLastDays(year=3, month=6,...: JSON.stringify(a...${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('[-55.93000000000001,-54.93000000000001]');
      logInfo(`getPreviousMonthLastDays(year=3, month=6,...: JSON.stringify...${JSON.stringify(actual.slice(42, 44))}`);
      expect(JSON.stringify(actual.slice(42, 44))).assertEqual('[-13.930000000000007,-12.930000000000007]');
      logInfo(`getPreviousMonthLastDays(year=3, month=6,...: JSON.stringify...${JSON.stringify(actual.slice(85, 87))}`);
      expect(JSON.stringify(actual.slice(85, 87))).assertEqual('[29.069999999999993,30.069999999999993]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0113 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0114
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0114
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=10, firstDayOfWeek=100) returns [19,20,21,22,23,24,25,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0114 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 10, 100);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(...${JSON.stringify(actual.slice(0, 13))}`);
      expect(JSON.stringify(actual.slice(0, 13))).assertEqual('[-69,-68,-67,-66,-65,-64,-63,-62,-61,-60,-59,-58,-57]');
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify...${JSON.stringify(actual.slice(39, 52))}`);
      expect(JSON.stringify(actual.slice(39, 52))).assertEqual('[-30,-29,-28,-27,-26,-25,-24,-23,-22,-21,-20,-19,-18]');
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringif...${JSON.stringify(actual.slice(88, 100))}`);
      expect(JSON.stringify(actual.slice(88, 100))).assertEqual('[19,20,21,22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0114 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0115
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0115
     * @tc.desc      getPreviousMonthLastDays(year=-1, month=10, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0115 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(-1, 10, 0);
      logInfo(`getPreviousMonthLastDays(year=-1, month=1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0115 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0116
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0116
     * @tc.desc      getPreviousMonthLastDays(year=2023, month=100, firstDayOfWeek=6) returns [26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0116 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2023, 100, 6);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0116 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0117
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0117
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=6, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0117 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 6, 0);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0117 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0118
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0118
     * @tc.desc      getPreviousMonthLastDays(year=2025, month=13, firstDayOfWeek=1) returns [31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0118 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2025, 13, 1);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0118 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0119
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0119
     * @tc.desc      getPreviousMonthLastDays(year=2023, month=5, firstDayOfWeek=-1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0119 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2023, 5, -1);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0119 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0120
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0120
     * @tc.desc      getPreviousMonthLastDays(year=0, month=1, firstDayOfWeek=10) returns [22,23,24,25,26,27,28,29,30...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0120 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(0, 1, 10);
      logInfo(`getPreviousMonthLastDays(year=0, month=1,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`getPreviousMonthLastDays(year=0, month=1,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0120 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0121
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0121
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=2, firstDayOfWeek=87.93) returns [29.069999999999993,3...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0121 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 2, 87.93);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(a...${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('[-55.93000000000001,-54.93000000000001]');
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify...${JSON.stringify(actual.slice(42, 44))}`);
      expect(JSON.stringify(actual.slice(42, 44))).assertEqual('[-13.930000000000007,-12.930000000000007]');
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify...${JSON.stringify(actual.slice(85, 87))}`);
      expect(JSON.stringify(actual.slice(85, 87))).assertEqual('[29.069999999999993,30.069999999999993]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0121 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0122
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0122
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=2, firstDayOfWeek=1) returns [31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0122 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 2, 1);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0122 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0123
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0123
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=6, firstDayOfWeek=100) returns [21,22,23,24,25,26,27,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0123 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 6, 100);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: JSON.stringify(...${JSON.stringify(actual.slice(0, 13))}`);
      expect(JSON.stringify(actual.slice(0, 13))).assertEqual('[-68,-67,-66,-65,-64,-63,-62,-61,-60,-59,-58,-57,-56]');
      logInfo(`getPreviousMonthLastDays(year=2000, month...: JSON.stringify...${JSON.stringify(actual.slice(39, 52))}`);
      expect(JSON.stringify(actual.slice(39, 52))).assertEqual('[-29,-28,-27,-26,-25,-24,-23,-22,-21,-20,-19,-18,-17]');
      logInfo(`getPreviousMonthLastDays(year=2000, month...: JSON.stringif...${JSON.stringify(actual.slice(89, 100))}`);
      expect(JSON.stringify(actual.slice(89, 100))).assertEqual('[21,22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0123 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0124
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0124
     * @tc.desc      getPreviousMonthLastDays(year=1970, month=6, firstDayOfWeek=5) returns [27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0124 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1970, 6, 5);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0124 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0125
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0125
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=10, firstDayOfWeek=5) returns [26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0125 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, 10, 5);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0125 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0126
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0126
     * @tc.desc      getPreviousMonthLastDays(year=2, month=59.41, firstDayOfWeek=1) returns [31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0126 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2, 59.41, 1);
      logInfo(`getPreviousMonthLastDays(year=2, month=59...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=2, month=59...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0126 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0127
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0127
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=6, firstDayOfWeek=-1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0127 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 6, -1);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0127 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0128
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0128
     * @tc.desc      getPreviousMonthLastDays(year=3, month=13, firstDayOfWeek=6) returns [26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0128 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 13, 6);
      logInfo(`getPreviousMonthLastDays(year=3, month=13...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`getPreviousMonthLastDays(year=3, month=13...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0128 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0129
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0129
     * @tc.desc      getPreviousMonthLastDays(year=2025, month=59.41, firstDayOfWeek=5) returns [27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0129 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2025, 59.41, 5);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0129 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0130
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0130
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=2, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0130 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 2, 0);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0130 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0131
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0131
     * @tc.desc      getPreviousMonthLastDays(year=1, month=-1, firstDayOfWeek=3) returns [29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0131 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, -1, 3);
      logInfo(`getPreviousMonthLastDays(year=1, month=-1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`getPreviousMonthLastDays(year=1, month=-1...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0131 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0132
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0132
     * @tc.desc      getPreviousMonthLastDays(year=3, month=6, firstDayOfWeek=7) returns [25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0132 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 6, 7);
      logInfo(`getPreviousMonthLastDays(year=3, month=6,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`getPreviousMonthLastDays(year=3, month=6,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0132 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0133
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0133
     * @tc.desc      getPreviousMonthLastDays(year=1970, month=6, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0133 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1970, 6, 0);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0133 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0134
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0134
     * @tc.desc      getPreviousMonthLastDays(year=0, month=12, firstDayOfWeek=6) returns [25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0134 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(0, 12, 6);
      logInfo(`getPreviousMonthLastDays(year=0, month=12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`getPreviousMonthLastDays(year=0, month=12...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0134 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0135
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0135
     * @tc.desc      getPreviousMonthLastDays(year=1970, month=6, firstDayOfWeek=-1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0135 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1970, 6, -1);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0135 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0136
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0136
     * @tc.desc      getPreviousMonthLastDays(year=3, month=3, firstDayOfWeek=-1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0136 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 3, -1);
      logInfo(`getPreviousMonthLastDays(year=3, month=3,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0136 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0137
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0137
     * @tc.desc      getPreviousMonthLastDays(year=1, month=10, firstDayOfWeek=10) returns [21,22,23,24,25,26,27,28,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0137 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 10, 10);
      logInfo(`getPreviousMonthLastDays(year=1, month=10...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`getPreviousMonthLastDays(year=1, month=10...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[21,22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0137 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0138
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0138
     * @tc.desc      getPreviousMonthLastDays(year=2, month=-1, firstDayOfWeek=1) returns [31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0138 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2, -1, 1);
      logInfo(`getPreviousMonthLastDays(year=2, month=-1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=2, month=-1...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0138 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0139
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0139
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=13, firstDayOfWeek=10) returns [22,23,24,25,26,27,28,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0139 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 13, 10);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0139 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0140
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0140
     * @tc.desc      getPreviousMonthLastDays(year=1970, month=2, firstDayOfWeek=2) returns [30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0140 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1970, 2, 2);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0140 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0141
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0141
     * @tc.desc      getPreviousMonthLastDays(year=2023, month=12, firstDayOfWeek=5) returns [26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0141 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2023, 12, 5);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0141 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0142
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0142
     * @tc.desc      getPreviousMonthLastDays(year=2023, month=0, firstDayOfWeek=7) returns [24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0142 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2023, 0, 7);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0142 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0143
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0143
     * @tc.desc      getPreviousMonthLastDays(year=2, month=1, firstDayOfWeek=1) returns [31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0143 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2, 1, 1);
      logInfo(`getPreviousMonthLastDays(year=2, month=1,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=2, month=1,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0143 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0144
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0144
     * @tc.desc      getPreviousMonthLastDays(year=2, month=3, firstDayOfWeek=2) returns [27,28]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0144 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2, 3, 2);
      logInfo(`getPreviousMonthLastDays(year=2, month=3,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`getPreviousMonthLastDays(year=2, month=3,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[27,28]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0144 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0145
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0145
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=100, firstDayOfWeek=-1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0145 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 100, -1);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0145 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0146
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0146
     * @tc.desc      getPreviousMonthLastDays(year=1, month=13, firstDayOfWeek=7) returns [25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0146 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 13, 7);
      logInfo(`getPreviousMonthLastDays(year=1, month=13...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`getPreviousMonthLastDays(year=1, month=13...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0146 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0147
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0147
     * @tc.desc      getPreviousMonthLastDays(year=3, month=2, firstDayOfWeek=10) returns [22,23,24,25,26,27,28,29,30...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0147 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 2, 10);
      logInfo(`getPreviousMonthLastDays(year=3, month=2,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`getPreviousMonthLastDays(year=3, month=2,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0147 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0148
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0148
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=59.41, firstDayOfWeek=-1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0148 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, 59.41, -1);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0148 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0149
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0149
     * @tc.desc      getPreviousMonthLastDays(year=0, month=13, firstDayOfWeek=10) returns [22,23,24,25,26,27,28,29,3...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0149 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(0, 13, 10);
      logInfo(`getPreviousMonthLastDays(year=0, month=13...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`getPreviousMonthLastDays(year=0, month=13...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0149 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0150
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0150
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=-1, firstDayOfWeek=5) returns [27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0150 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, -1, 5);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0150 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0151
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0151
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=13, firstDayOfWeek=3) returns [29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0151 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 13, 3);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0151 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0152
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0152
     * @tc.desc      getPreviousMonthLastDays(year=1970, month=100, firstDayOfWeek=1) returns [31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0152 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1970, 100, 1);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0152 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0153
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0153
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=100, firstDayOfWeek=3) returns [29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0153 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, 100, 3);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0153 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0154
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0154
     * @tc.desc      getPreviousMonthLastDays(year=3, month=12, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0154 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 12, 0);
      logInfo(`getPreviousMonthLastDays(year=3, month=12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0154 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0155
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0155
     * @tc.desc      getPreviousMonthLastDays(year=2025, month=12, firstDayOfWeek=15) returns [16,17,18,19,20,21,22,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0155 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2025, 12, 15);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(15);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0155 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0156
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0156
     * @tc.desc      getPreviousMonthLastDays(year=1, month=59.41, firstDayOfWeek=5) returns [27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0156 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 59.41, 5);
      logInfo(`getPreviousMonthLastDays(year=1, month=59...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=1, month=59...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0156 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0157
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0157
     * @tc.desc      getPreviousMonthLastDays(year=2, month=59.41, firstDayOfWeek=3) returns [29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0157 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2, 59.41, 3);
      logInfo(`getPreviousMonthLastDays(year=2, month=59...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`getPreviousMonthLastDays(year=2, month=59...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0157 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0158
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0158
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=-1, firstDayOfWeek=15) returns [17,18,19,20,21,22,23,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0158 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, -1, 15);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(15);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0158 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0159
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0159
     * @tc.desc      getPreviousMonthLastDays(year=3, month=1, firstDayOfWeek=-1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0159 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 1, -1);
      logInfo(`getPreviousMonthLastDays(year=3, month=1,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0159 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0160
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0160
     * @tc.desc      getPreviousMonthLastDays(year=0, month=12, firstDayOfWeek=3) returns [28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0160 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(0, 12, 3);
      logInfo(`getPreviousMonthLastDays(year=0, month=12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`getPreviousMonthLastDays(year=0, month=12...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0160 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0161
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0161
     * @tc.desc      getPreviousMonthLastDays(year=2100, month=2, firstDayOfWeek=2) returns [30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0161 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2100, 2, 2);
      logInfo(`getPreviousMonthLastDays(year=2100, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`getPreviousMonthLastDays(year=2100, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0161 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0162
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0162
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=3, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0162 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, 3, 0);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0162 end`);
      });
  });
}
