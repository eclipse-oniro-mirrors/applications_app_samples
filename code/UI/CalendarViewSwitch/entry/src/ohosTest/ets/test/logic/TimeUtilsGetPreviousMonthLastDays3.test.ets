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

/** Logic checks for TimeUtils.getPreviousMonthLastDays (27 cases). */
export default function timeUtilsGetPreviousMonthLastDays3Test(): void {
  describe('TimeUtilsGetPreviousMonthLastDays3Test', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0163
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0163
     * @tc.desc      getPreviousMonthLastDays(year=1, month=0, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0163 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 0, 0);
      logInfo(`getPreviousMonthLastDays(year=1, month=0,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0163 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0164
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0164
     * @tc.desc      getPreviousMonthLastDays(year=2100, month=100, firstDayOfWeek=5) returns [27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0164 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2100, 100, 5);
      logInfo(`getPreviousMonthLastDays(year=2100, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=2100, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0164 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0165
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0165
     * @tc.desc      getPreviousMonthLastDays(year=0, month=6, firstDayOfWeek=10) returns [22,23,24,25,26,27,28,29,30...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0165 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(0, 6, 10);
      logInfo(`getPreviousMonthLastDays(year=0, month=6,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`getPreviousMonthLastDays(year=0, month=6,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0165 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0166
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0166
     * @tc.desc      getPreviousMonthLastDays(year=-1, month=-1, firstDayOfWeek=87.93) returns [29.069999999999993,30...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0166 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(-1, -1, 87.93);
      logInfo(`getPreviousMonthLastDays(year=-1, month=-...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`getPreviousMonthLastDays(year=-1, month=-...: JSON.stringify(a...${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('[-55.93000000000001,-54.93000000000001]');
      logInfo(`getPreviousMonthLastDays(year=-1, month=-...: JSON.stringify...${JSON.stringify(actual.slice(42, 44))}`);
      expect(JSON.stringify(actual.slice(42, 44))).assertEqual('[-13.930000000000007,-12.930000000000007]');
      logInfo(`getPreviousMonthLastDays(year=-1, month=-...: JSON.stringify...${JSON.stringify(actual.slice(85, 87))}`);
      expect(JSON.stringify(actual.slice(85, 87))).assertEqual('[29.069999999999993,30.069999999999993]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0166 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0167
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0167
     * @tc.desc      getPreviousMonthLastDays(year=3, month=100, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0167 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 100, 0);
      logInfo(`getPreviousMonthLastDays(year=3, month=10...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0167 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0168
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0168
     * @tc.desc      getPreviousMonthLastDays(year=3, month=12, firstDayOfWeek=10) returns [21,22,23,24,25,26,27,28,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0168 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 12, 10);
      logInfo(`getPreviousMonthLastDays(year=3, month=12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`getPreviousMonthLastDays(year=3, month=12...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[21,22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0168 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0169
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0169
     * @tc.desc      getPreviousMonthLastDays(year=-1, month=5, firstDayOfWeek=6) returns [25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0169 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(-1, 5, 6);
      logInfo(`getPreviousMonthLastDays(year=-1, month=5...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`getPreviousMonthLastDays(year=-1, month=5...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0169 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0170
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0170
     * @tc.desc      getPreviousMonthLastDays(year=2023, month=6, firstDayOfWeek=100) returns [21,22,23,24,25,26,27,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0170 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2023, 6, 100);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: JSON.stringify(...${JSON.stringify(actual.slice(0, 13))}`);
      expect(JSON.stringify(actual.slice(0, 13))).assertEqual('[-68,-67,-66,-65,-64,-63,-62,-61,-60,-59,-58,-57,-56]');
      logInfo(`getPreviousMonthLastDays(year=2023, month...: JSON.stringify...${JSON.stringify(actual.slice(39, 52))}`);
      expect(JSON.stringify(actual.slice(39, 52))).assertEqual('[-29,-28,-27,-26,-25,-24,-23,-22,-21,-20,-19,-18,-17]');
      logInfo(`getPreviousMonthLastDays(year=2023, month...: JSON.stringif...${JSON.stringify(actual.slice(89, 100))}`);
      expect(JSON.stringify(actual.slice(89, 100))).assertEqual('[21,22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0170 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0171
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0171
     * @tc.desc      getPreviousMonthLastDays(year=1970, month=12, firstDayOfWeek=3) returns [28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0171 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1970, 12, 3);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0171 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0172
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0172
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=12, firstDayOfWeek=-1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0172 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 12, -1);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0172 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0173
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0173
     * @tc.desc      getPreviousMonthLastDays(year=1, month=13, firstDayOfWeek=10) returns [22,23,24,25,26,27,28,29,3...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0173 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 13, 10);
      logInfo(`getPreviousMonthLastDays(year=1, month=13...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`getPreviousMonthLastDays(year=1, month=13...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0173 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0174
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0174
     * @tc.desc      getPreviousMonthLastDays(year=2100, month=100, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0174 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2100, 100, 0);
      logInfo(`getPreviousMonthLastDays(year=2100, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0174 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0175
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0175
     * @tc.desc      getPreviousMonthLastDays(year=3, month=-1, firstDayOfWeek=7) returns [25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0175 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, -1, 7);
      logInfo(`getPreviousMonthLastDays(year=3, month=-1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`getPreviousMonthLastDays(year=3, month=-1...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0175 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0176
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0176
     * @tc.desc      getPreviousMonthLastDays(year=2, month=1, firstDayOfWeek=87.93) returns [29.069999999999993,30.0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0176 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2, 1, 87.93);
      logInfo(`getPreviousMonthLastDays(year=2, month=1,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`getPreviousMonthLastDays(year=2, month=1,...: JSON.stringify(a...${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('[-55.93000000000001,-54.93000000000001]');
      logInfo(`getPreviousMonthLastDays(year=2, month=1,...: JSON.stringify...${JSON.stringify(actual.slice(42, 44))}`);
      expect(JSON.stringify(actual.slice(42, 44))).assertEqual('[-13.930000000000007,-12.930000000000007]');
      logInfo(`getPreviousMonthLastDays(year=2, month=1,...: JSON.stringify...${JSON.stringify(actual.slice(85, 87))}`);
      expect(JSON.stringify(actual.slice(85, 87))).assertEqual('[29.069999999999993,30.069999999999993]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0176 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0177
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0177
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=10, firstDayOfWeek=1) returns [30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0177 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 10, 1);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0177 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0178
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0178
     * @tc.desc      getPreviousMonthLastDays(year=3, month=59.41, firstDayOfWeek=87.93) returns [29.069999999999993,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0178 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 59.41, 87.93);
      logInfo(`getPreviousMonthLastDays(year=3, month=59...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`getPreviousMonthLastDays(year=3, month=59...: JSON.stringify(a...${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('[-55.93000000000001,-54.93000000000001]');
      logInfo(`getPreviousMonthLastDays(year=3, month=59...: JSON.stringify...${JSON.stringify(actual.slice(42, 44))}`);
      expect(JSON.stringify(actual.slice(42, 44))).assertEqual('[-13.930000000000007,-12.930000000000007]');
      logInfo(`getPreviousMonthLastDays(year=3, month=59...: JSON.stringify...${JSON.stringify(actual.slice(85, 87))}`);
      expect(JSON.stringify(actual.slice(85, 87))).assertEqual('[29.069999999999993,30.069999999999993]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0178 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0179
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0179
     * @tc.desc      getPreviousMonthLastDays(year=3, month=-1, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0179 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, -1, 0);
      logInfo(`getPreviousMonthLastDays(year=3, month=-1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0179 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0180
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0180
     * @tc.desc      getPreviousMonthLastDays(year=3, month=12, firstDayOfWeek=5) returns [26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0180 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 12, 5);
      logInfo(`getPreviousMonthLastDays(year=3, month=12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=3, month=12...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0180 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0181
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0181
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=1, firstDayOfWeek=-1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0181 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, 1, -1);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0181 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0182
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0182
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=-1, firstDayOfWeek=15) returns [17,18,19,20,21,22,23,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0182 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, -1, 15);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(15);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0182 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0183
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0183
     * @tc.desc      getPreviousMonthLastDays(year=2025, month=-1, firstDayOfWeek=6) returns [26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0183 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2025, -1, 6);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0183 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0184
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0184
     * @tc.desc      getPreviousMonthLastDays(year=-1, month=0, firstDayOfWeek=87.93) returns [28.069999999999993,29....
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0184 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(-1, 0, 87.93);
      logInfo(`getPreviousMonthLastDays(year=-1, month=0...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`getPreviousMonthLastDays(year=-1, month=0...: JSON.stringify(a...${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('[-56.93000000000001,-55.93000000000001]');
      logInfo(`getPreviousMonthLastDays(year=-1, month=0...: JSON.stringify...${JSON.stringify(actual.slice(42, 44))}`);
      expect(JSON.stringify(actual.slice(42, 44))).assertEqual('[-14.930000000000007,-13.930000000000007]');
      logInfo(`getPreviousMonthLastDays(year=-1, month=0...: JSON.stringify...${JSON.stringify(actual.slice(85, 87))}`);
      expect(JSON.stringify(actual.slice(85, 87))).assertEqual('[28.069999999999993,29.069999999999993]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0184 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0185
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0185
     * @tc.desc      getPreviousMonthLastDays(year=-1, month=3, firstDayOfWeek=1) returns [28]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0185 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(-1, 3, 1);
      logInfo(`getPreviousMonthLastDays(year=-1, month=3...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=-1, month=3...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[28]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0185 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0186
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0186
     * @tc.desc      getPreviousMonthLastDays(year=0, month=13, firstDayOfWeek=5) returns [27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0186 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(0, 13, 5);
      logInfo(`getPreviousMonthLastDays(year=0, month=13...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=0, month=13...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0186 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0187
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0187
     * @tc.desc      getPreviousMonthLastDays(year=2, month=6, firstDayOfWeek=3) returns [29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0187 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2, 6, 3);
      logInfo(`getPreviousMonthLastDays(year=2, month=6,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`getPreviousMonthLastDays(year=2, month=6,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0187 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0188
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0188
     * @tc.desc      getPreviousMonthLastDays(year=1970, month=10, firstDayOfWeek=3) returns [28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0188 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1970, 10, 3);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0188 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0189
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0189
     * @tc.desc      getPreviousMonthLastDays(year=1, month=59.41, firstDayOfWeek=87.93) returns [29.069999999999993,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0189 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 59.41, 87.93);
      logInfo(`getPreviousMonthLastDays(year=1, month=59...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`getPreviousMonthLastDays(year=1, month=59...: JSON.stringify(a...${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('[-55.93000000000001,-54.93000000000001]');
      logInfo(`getPreviousMonthLastDays(year=1, month=59...: JSON.stringify...${JSON.stringify(actual.slice(42, 44))}`);
      expect(JSON.stringify(actual.slice(42, 44))).assertEqual('[-13.930000000000007,-12.930000000000007]');
      logInfo(`getPreviousMonthLastDays(year=1, month=59...: JSON.stringify...${JSON.stringify(actual.slice(85, 87))}`);
      expect(JSON.stringify(actual.slice(85, 87))).assertEqual('[29.069999999999993,30.069999999999993]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0189 end`);
      });
  });
}
