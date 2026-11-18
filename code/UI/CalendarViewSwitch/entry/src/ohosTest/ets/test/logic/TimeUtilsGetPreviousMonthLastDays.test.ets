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
export default function timeUtilsGetPreviousMonthLastDaysTest(): void {
  describe('TimeUtilsGetPreviousMonthLastDaysTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0001
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0001
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=1, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0001 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 1, 0);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0001 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0002
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0002
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=1, firstDayOfWeek=1) returns [31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0002 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 1, 1);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0002 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0003
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0003
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=1, firstDayOfWeek=2) returns [30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0003 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 1, 2);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0003 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0004
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0004
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=1, firstDayOfWeek=3) returns [29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0004 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 1, 3);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0004 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0005
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0005
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=1, firstDayOfWeek=6) returns [26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0005 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 1, 6);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0005 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0006
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0006
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=1, firstDayOfWeek=7) returns [25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0006 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 1, 7);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0006 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0007
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0007
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=1, firstDayOfWeek=10) returns [22,23,24,25,26,27,28,29...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0007 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 1, 10);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0007 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0008
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0008
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=1, firstDayOfWeek=100) returns [21,22,23,24,25,26,27,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0008 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 1, 100);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(...${JSON.stringify(actual.slice(0, 13))}`);
      expect(JSON.stringify(actual.slice(0, 13))).assertEqual('[-68,-67,-66,-65,-64,-63,-62,-61,-60,-59,-58,-57,-56]');
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify...${JSON.stringify(actual.slice(39, 52))}`);
      expect(JSON.stringify(actual.slice(39, 52))).assertEqual('[-29,-28,-27,-26,-25,-24,-23,-22,-21,-20,-19,-18,-17]');
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringif...${JSON.stringify(actual.slice(89, 100))}`);
      expect(JSON.stringify(actual.slice(89, 100))).assertEqual('[21,22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0008 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0009
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0009
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=1, firstDayOfWeek=5) returns [27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0009 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 1, 5);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0009 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0010
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0010
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=1, firstDayOfWeek=15) returns [17,18,19,20,21,22,23,24...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0010 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 1, 15);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(15);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0010 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0011
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0011
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=1, firstDayOfWeek=87.93) returns [29.069999999999993,3...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0011 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 1, 87.93);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(a...${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('[-55.93000000000001,-54.93000000000001]');
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify...${JSON.stringify(actual.slice(42, 44))}`);
      expect(JSON.stringify(actual.slice(42, 44))).assertEqual('[-13.930000000000007,-12.930000000000007]');
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify...${JSON.stringify(actual.slice(85, 87))}`);
      expect(JSON.stringify(actual.slice(85, 87))).assertEqual('[29.069999999999993,30.069999999999993]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0011 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0012
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0012
     * @tc.desc      getPreviousMonthLastDays(year=-1, month=5, firstDayOfWeek=7) returns [24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0012 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(-1, 5, 7);
      logInfo(`getPreviousMonthLastDays(year=-1, month=5...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`getPreviousMonthLastDays(year=-1, month=5...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0012 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0013
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0013
     * @tc.desc      getPreviousMonthLastDays(year=-1, month=12, firstDayOfWeek=5) returns [26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0013 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(-1, 12, 5);
      logInfo(`getPreviousMonthLastDays(year=-1, month=1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=-1, month=1...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0013 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0014
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0014
     * @tc.desc      getPreviousMonthLastDays(year=1, month=0, firstDayOfWeek=2) returns [29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0014 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 0, 2);
      logInfo(`getPreviousMonthLastDays(year=1, month=0,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`getPreviousMonthLastDays(year=1, month=0,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0014 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0015
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0015
     * @tc.desc      getPreviousMonthLastDays(year=1970, month=5, firstDayOfWeek=6) returns [25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0015 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1970, 5, 6);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0015 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0016
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0016
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=12, firstDayOfWeek=100) returns [19,20,21,22,23,24,25,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0016 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, 12, 100);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify(...${JSON.stringify(actual.slice(0, 13))}`);
      expect(JSON.stringify(actual.slice(0, 13))).assertEqual('[-69,-68,-67,-66,-65,-64,-63,-62,-61,-60,-59,-58,-57]');
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify...${JSON.stringify(actual.slice(39, 52))}`);
      expect(JSON.stringify(actual.slice(39, 52))).assertEqual('[-30,-29,-28,-27,-26,-25,-24,-23,-22,-21,-20,-19,-18]');
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringif...${JSON.stringify(actual.slice(88, 100))}`);
      expect(JSON.stringify(actual.slice(88, 100))).assertEqual('[19,20,21,22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0016 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0017
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0017
     * @tc.desc      getPreviousMonthLastDays(year=2, month=3, firstDayOfWeek=100) returns [17,18,19,20,21,22,23,24,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0017 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2, 3, 100);
      logInfo(`getPreviousMonthLastDays(year=2, month=3,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`getPreviousMonthLastDays(year=2, month=3,...: JSON.stringify(...${JSON.stringify(actual.slice(0, 13))}`);
      expect(JSON.stringify(actual.slice(0, 13))).assertEqual('[-71,-70,-69,-68,-67,-66,-65,-64,-63,-62,-61,-60,-59]');
      logInfo(`getPreviousMonthLastDays(year=2, month=3,...: JSON.stringify...${JSON.stringify(actual.slice(39, 52))}`);
      expect(JSON.stringify(actual.slice(39, 52))).assertEqual('[-32,-31,-30,-29,-28,-27,-26,-25,-24,-23,-22,-21,-20]');
      logInfo(`getPreviousMonthLastDays(year=2, month=3,...: JSON.stringif...${JSON.stringify(actual.slice(88, 100))}`);
      expect(JSON.stringify(actual.slice(88, 100))).assertEqual('[17,18,19,20,21,22,23,24,25,26,27,28]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0017 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0018
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0018
     * @tc.desc      getPreviousMonthLastDays(year=1, month=12, firstDayOfWeek=10) returns [21,22,23,24,25,26,27,28,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0018 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 12, 10);
      logInfo(`getPreviousMonthLastDays(year=1, month=12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`getPreviousMonthLastDays(year=1, month=12...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[21,22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0018 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0019
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0019
     * @tc.desc      getPreviousMonthLastDays(year=1, month=3, firstDayOfWeek=1) returns [28]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0019 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 3, 1);
      logInfo(`getPreviousMonthLastDays(year=1, month=3,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=1, month=3,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[28]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0019 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0020
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0020
     * @tc.desc      getPreviousMonthLastDays(year=2023, month=10, firstDayOfWeek=87.93) returns [28.069999999999993,...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0020 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2023, 10, 87.93);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: JSON.stringify(a...${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('[-56.93000000000001,-55.93000000000001]');
      logInfo(`getPreviousMonthLastDays(year=2023, month...: JSON.stringify...${JSON.stringify(actual.slice(42, 44))}`);
      expect(JSON.stringify(actual.slice(42, 44))).assertEqual('[-14.930000000000007,-13.930000000000007]');
      logInfo(`getPreviousMonthLastDays(year=2023, month...: JSON.stringify...${JSON.stringify(actual.slice(85, 87))}`);
      expect(JSON.stringify(actual.slice(85, 87))).assertEqual('[28.069999999999993,29.069999999999993]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0020 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0021
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0021
     * @tc.desc      getPreviousMonthLastDays(year=1, month=0, firstDayOfWeek=3) returns [28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0021 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 0, 3);
      logInfo(`getPreviousMonthLastDays(year=1, month=0,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`getPreviousMonthLastDays(year=1, month=0,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0021 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0022
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0022
     * @tc.desc      getPreviousMonthLastDays(year=0, month=3, firstDayOfWeek=2) returns [27,28]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0022 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(0, 3, 2);
      logInfo(`getPreviousMonthLastDays(year=0, month=3,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`getPreviousMonthLastDays(year=0, month=3,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[27,28]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0022 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0023
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0023
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=10, firstDayOfWeek=1) returns [30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0023 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 10, 1);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0023 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0024
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0024
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=3, firstDayOfWeek=10) returns [20,21,22,23,24,25,26,27...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0024 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 3, 10);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[20,21,22,23,24,25,26,27,28,29]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0024 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0025
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0025
     * @tc.desc      getPreviousMonthLastDays(year=-1, month=3, firstDayOfWeek=15) returns [14,15,16,17,18,19,20,21,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0025 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(-1, 3, 15);
      logInfo(`getPreviousMonthLastDays(year=-1, month=3...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(15);
      logInfo(`getPreviousMonthLastDays(year=-1, month=3...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0025 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0026
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0026
     * @tc.desc      getPreviousMonthLastDays(year=2025, month=0, firstDayOfWeek=15) returns [16,17,18,19,20,21,22,23...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0026 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2025, 0, 15);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(15);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0026 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0027
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0027
     * @tc.desc      getPreviousMonthLastDays(year=3, month=3, firstDayOfWeek=5) returns [24,25,26,27,28]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0027 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 3, 5);
      logInfo(`getPreviousMonthLastDays(year=3, month=3,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=3, month=3,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[24,25,26,27,28]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0027 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0028
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0028
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=3, firstDayOfWeek=5) returns [25,26,27,28,29]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0028 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 3, 5);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[25,26,27,28,29]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0028 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0029
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0029
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=3, firstDayOfWeek=6) returns [23,24,25,26,27,28]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0029 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, 3, 6);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[23,24,25,26,27,28]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0029 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0030
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0030
     * @tc.desc      getPreviousMonthLastDays(year=0, month=3, firstDayOfWeek=87.93) returns [26.069999999999993,27.0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0030 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(0, 3, 87.93);
      logInfo(`getPreviousMonthLastDays(year=0, month=3,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`getPreviousMonthLastDays(year=0, month=3,...: JSON.stringify(a...${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('[-58.93000000000001,-57.93000000000001]');
      logInfo(`getPreviousMonthLastDays(year=0, month=3,...: JSON.stringify...${JSON.stringify(actual.slice(42, 44))}`);
      expect(JSON.stringify(actual.slice(42, 44))).assertEqual('[-16.930000000000007,-15.930000000000007]');
      logInfo(`getPreviousMonthLastDays(year=0, month=3,...: JSON.stringify...${JSON.stringify(actual.slice(85, 87))}`);
      expect(JSON.stringify(actual.slice(85, 87))).assertEqual('[26.069999999999993,27.069999999999993]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0030 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0031
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0031
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=3, firstDayOfWeek=100) returns [18,19,20,21,22,23,24,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0031 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 3, 100);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(...${JSON.stringify(actual.slice(0, 13))}`);
      expect(JSON.stringify(actual.slice(0, 13))).assertEqual('[-70,-69,-68,-67,-66,-65,-64,-63,-62,-61,-60,-59,-58]');
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify...${JSON.stringify(actual.slice(39, 52))}`);
      expect(JSON.stringify(actual.slice(39, 52))).assertEqual('[-31,-30,-29,-28,-27,-26,-25,-24,-23,-22,-21,-20,-19]');
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringif...${JSON.stringify(actual.slice(88, 100))}`);
      expect(JSON.stringify(actual.slice(88, 100))).assertEqual('[18,19,20,21,22,23,24,25,26,27,28,29]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0031 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0032
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0032
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=3, firstDayOfWeek=6) returns [24,25,26,27,28,29]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0032 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 3, 6);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[24,25,26,27,28,29]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0032 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0033
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0033
     * @tc.desc      getPreviousMonthLastDays(year=2023, month=3, firstDayOfWeek=7) returns [22,23,24,25,26,27,28]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0033 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2023, 3, 7);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[22,23,24,25,26,27,28]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0033 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0034
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0034
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=3, firstDayOfWeek=10) returns [19,20,21,22,23,24,25,26...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0034 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, 3, 10);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(10);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[19,20,21,22,23,24,25,26,27,28]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0034 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0035
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0035
     * @tc.desc      getPreviousMonthLastDays(year=2023, month=3, firstDayOfWeek=3) returns [26,27,28]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0035 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2023, 3, 3);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[26,27,28]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0035 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0036
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0036
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=3, firstDayOfWeek=15) returns [15,16,17,18,19,20,21,22...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0036 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 3, 15);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(15);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[15,16,17,18,19,20,21,22,23,24,25,26,27,28,29]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0036 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0037
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0037
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=3, firstDayOfWeek=2) returns [28,29]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0037 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 3, 2);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[28,29]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0037 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0038
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0038
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=3, firstDayOfWeek=7) returns [23,24,25,26,27,28,29]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0038 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 3, 7);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[23,24,25,26,27,28,29]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0038 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0039
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0039
     * @tc.desc      getPreviousMonthLastDays(year=2023, month=1, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0039 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2023, 1, 0);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0039 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0040
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0040
     * @tc.desc      getPreviousMonthLastDays(year=1, month=1, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0040 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 1, 0);
      logInfo(`getPreviousMonthLastDays(year=1, month=1,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0040 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0041
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0041
     * @tc.desc      getPreviousMonthLastDays(year=0, month=1, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0041 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(0, 1, 0);
      logInfo(`getPreviousMonthLastDays(year=0, month=1,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0041 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0042
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0042
     * @tc.desc      getPreviousMonthLastDays(year=2, month=1, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0042 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2, 1, 0);
      logInfo(`getPreviousMonthLastDays(year=2, month=1,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0042 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0043
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0043
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=1, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0043 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 1, 0);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0043 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0044
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0044
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=1, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0044 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, 1, 0);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0044 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0045
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0045
     * @tc.desc      getPreviousMonthLastDays(year=2100, month=1, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0045 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2100, 1, 0);
      logInfo(`getPreviousMonthLastDays(year=2100, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0045 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0046
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0046
     * @tc.desc      getPreviousMonthLastDays(year=1970, month=1, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0046 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1970, 1, 0);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0046 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0047
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0047
     * @tc.desc      getPreviousMonthLastDays(year=2025, month=1, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0047 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2025, 1, 0);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0047 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0048
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0048
     * @tc.desc      getPreviousMonthLastDays(year=-1, month=1, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0048 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(-1, 1, 0);
      logInfo(`getPreviousMonthLastDays(year=-1, month=1...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0048 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0049
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0049
     * @tc.desc      getPreviousMonthLastDays(year=3, month=1, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0049 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(3, 1, 0);
      logInfo(`getPreviousMonthLastDays(year=3, month=1,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0049 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0050
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0050
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=2, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0050 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 2, 0);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0050 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0051
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0051
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=0, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0051 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 0, 0);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0051 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0052
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0052
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=6, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0052 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 6, 0);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0052 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0053
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0053
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=12, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0053 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 12, 0);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0053 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0054
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0054
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=13, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0054 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 13, 0);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0054 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0055
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0055
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=-1, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0055 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, -1, 0);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0055 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0056
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0056
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=3, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0056 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 3, 0);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0056 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0057
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0057
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=10, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0057 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 10, 0);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0057 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0058
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0058
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=100, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0058 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 100, 0);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0058 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0059
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0059
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=5, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0059 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 5, 0);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0059 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0060
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0060
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=59.41, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0060 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 59.41, 0);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0060 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0061
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0061
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=1, firstDayOfWeek=-1) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0061 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 1, -1);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0061 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0062
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0062
     * @tc.desc      getPreviousMonthLastDays(year=2025, month=59.41, firstDayOfWeek=87.93) returns [29.0699999999999...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0062 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2025, 59.41, 87.93);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: JSON.stringify(a...${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('[-55.93000000000001,-54.93000000000001]');
      logInfo(`getPreviousMonthLastDays(year=2025, month...: JSON.stringify...${JSON.stringify(actual.slice(42, 44))}`);
      expect(JSON.stringify(actual.slice(42, 44))).assertEqual('[-13.930000000000007,-12.930000000000007]');
      logInfo(`getPreviousMonthLastDays(year=2025, month...: JSON.stringify...${JSON.stringify(actual.slice(85, 87))}`);
      expect(JSON.stringify(actual.slice(85, 87))).assertEqual('[29.069999999999993,30.069999999999993]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0062 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0063
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0063
     * @tc.desc      getPreviousMonthLastDays(year=2025, month=1, firstDayOfWeek=100) returns [21,22,23,24,25,26,27,2...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0063 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2025, 1, 100);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: JSON.stringify(...${JSON.stringify(actual.slice(0, 13))}`);
      expect(JSON.stringify(actual.slice(0, 13))).assertEqual('[-68,-67,-66,-65,-64,-63,-62,-61,-60,-59,-58,-57,-56]');
      logInfo(`getPreviousMonthLastDays(year=2025, month...: JSON.stringify...${JSON.stringify(actual.slice(39, 52))}`);
      expect(JSON.stringify(actual.slice(39, 52))).assertEqual('[-29,-28,-27,-26,-25,-24,-23,-22,-21,-20,-19,-18,-17]');
      logInfo(`getPreviousMonthLastDays(year=2025, month...: JSON.stringif...${JSON.stringify(actual.slice(89, 100))}`);
      expect(JSON.stringify(actual.slice(89, 100))).assertEqual('[21,22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0063 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0064
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0064
     * @tc.desc      getPreviousMonthLastDays(year=2023, month=2, firstDayOfWeek=6) returns [26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0064 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2023, 2, 6);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0064 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0065
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0065
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=0, firstDayOfWeek=7) returns [24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0065 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, 0, 7);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0065 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0066
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0066
     * @tc.desc      getPreviousMonthLastDays(year=2023, month=-1, firstDayOfWeek=3) returns [29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0066 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2023, -1, 3);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`getPreviousMonthLastDays(year=2023, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0066 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0067
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0067
     * @tc.desc      getPreviousMonthLastDays(year=2025, month=6, firstDayOfWeek=1) returns [31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0067 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2025, 6, 1);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=2025, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0067 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0068
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0068
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=100, firstDayOfWeek=7) returns [25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0068 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, 100, 7);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0068 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0069
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0069
     * @tc.desc      getPreviousMonthLastDays(year=1, month=0, firstDayOfWeek=7) returns [24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0069 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 0, 7);
      logInfo(`getPreviousMonthLastDays(year=1, month=0,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`getPreviousMonthLastDays(year=1, month=0,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0069 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0070
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0070
     * @tc.desc      getPreviousMonthLastDays(year=1, month=59.41, firstDayOfWeek=1) returns [31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0070 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 59.41, 1);
      logInfo(`getPreviousMonthLastDays(year=1, month=59...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=1, month=59...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0070 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0071
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0071
     * @tc.desc      getPreviousMonthLastDays(year=0, month=5, firstDayOfWeek=5) returns [26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0071 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(0, 5, 5);
      logInfo(`getPreviousMonthLastDays(year=0, month=5,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=0, month=5,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0071 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0072
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0072
     * @tc.desc      getPreviousMonthLastDays(year=0, month=1, firstDayOfWeek=6) returns [26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0072 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(0, 1, 6);
      logInfo(`getPreviousMonthLastDays(year=0, month=1,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`getPreviousMonthLastDays(year=0, month=1,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0072 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0073
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0073
     * @tc.desc      getPreviousMonthLastDays(year=2000, month=12, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0073 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2000, 12, 0);
      logInfo(`getPreviousMonthLastDays(year=2000, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0073 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0074
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0074
     * @tc.desc      getPreviousMonthLastDays(year=1, month=1, firstDayOfWeek=5) returns [27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0074 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 1, 5);
      logInfo(`getPreviousMonthLastDays(year=1, month=1,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`getPreviousMonthLastDays(year=1, month=1,...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0074 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0075
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0075
     * @tc.desc      getPreviousMonthLastDays(year=1900, month=6, firstDayOfWeek=87.93) returns [29.069999999999993,3...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0075 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1900, 6, 87.93);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify(a...${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('[-55.93000000000001,-54.93000000000001]');
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify...${JSON.stringify(actual.slice(42, 44))}`);
      expect(JSON.stringify(actual.slice(42, 44))).assertEqual('[-13.930000000000007,-12.930000000000007]');
      logInfo(`getPreviousMonthLastDays(year=1900, month...: JSON.stringify...${JSON.stringify(actual.slice(85, 87))}`);
      expect(JSON.stringify(actual.slice(85, 87))).assertEqual('[29.069999999999993,30.069999999999993]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0075 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0076
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0076
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=100, firstDayOfWeek=3) returns [29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0076 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 100, 3);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0076 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0077
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0077
     * @tc.desc      getPreviousMonthLastDays(year=1970, month=1, firstDayOfWeek=1) returns [31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0077 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1970, 1, 1);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(1);
      logInfo(`getPreviousMonthLastDays(year=1970, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0077 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0078
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0078
     * @tc.desc      getPreviousMonthLastDays(year=1, month=12, firstDayOfWeek=2) returns [29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0078 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 12, 2);
      logInfo(`getPreviousMonthLastDays(year=1, month=12...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(2);
      logInfo(`getPreviousMonthLastDays(year=1, month=12...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0078 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0079
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0079
     * @tc.desc      getPreviousMonthLastDays(year=1, month=3, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0079 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 3, 0);
      logInfo(`getPreviousMonthLastDays(year=1, month=3,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0079 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0080
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0080
     * @tc.desc      getPreviousMonthLastDays(year=2024, month=2, firstDayOfWeek=6) returns [26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0080 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(2024, 2, 6);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`getPreviousMonthLastDays(year=2024, month...: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0080 end`);
      });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_PREVIOUS_MONTH_LAST_DAYS_0081
     * @tc.name      CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0081
     * @tc.desc      getPreviousMonthLastDays(year=1, month=5, firstDayOfWeek=0) returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetPreviousMonthLastDays_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0081 begin`);
      const actual: number[] = TimeUtils.getPreviousMonthLastDays(1, 5, 0);
      logInfo(`getPreviousMonthLastDays(year=1, month=5,...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetPreviousMonthLastDays_0081 end`);
      });
  });
}
