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

/** Logic checks for TimeUtils.getCurrentMonthDays (73 cases). */
export default function timeUtilsGetCurrentMonthDaysTest(): void {
  describe('TimeUtilsGetCurrentMonthDaysTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0001
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0001
     * @tc.desc      getCurrentMonthDays(year=2024, month=1) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0001 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 1);
      logInfo(`getCurrentMonthDays(year=2024, month=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=1): JSON.stringify(actua...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=1): JSON.stringify(actu...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0002
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0002
     * @tc.desc      getCurrentMonthDays(year=2024, month=2) returns [22,23,24,25,26,27,28,29]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0002 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 2);
      logInfo(`getCurrentMonthDays(year=2024, month=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(29);
      logInfo(`getCurrentMonthDays(year=2024, month=2): JSON.stringify(actua...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=2): JSON.stringify(actu...${JSON.stringify(actual.slice(21, 29))}`);
      expect(JSON.stringify(actual.slice(21, 29))).assertEqual('[22,23,24,25,26,27,28,29]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0003
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0003
     * @tc.desc      getCurrentMonthDays(year=2024, month=6) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0003 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 6);
      logInfo(`getCurrentMonthDays(year=2024, month=6): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2024, month=6): JSON.stringify(actua...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=6): JSON.stringify(actu...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0004
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0004
     * @tc.desc      getCurrentMonthDays(year=2023, month=2) returns [22,23,24,25,26,27,28]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0004 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 2);
      logInfo(`getCurrentMonthDays(year=2023, month=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(28);
      logInfo(`getCurrentMonthDays(year=2023, month=2): JSON.stringify(actua...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=2): JSON.stringify(actu...${JSON.stringify(actual.slice(21, 28))}`);
      expect(JSON.stringify(actual.slice(21, 28))).assertEqual('[22,23,24,25,26,27,28]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0005
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0005
     * @tc.desc      getCurrentMonthDays(year=2024, month=0) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0005 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 0);
      logInfo(`getCurrentMonthDays(year=2024, month=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=0): JSON.stringify(actua...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=0): JSON.stringify(actu...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0005 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0006
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0006
     * @tc.desc      getCurrentMonthDays(year=2024, month=12) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0006 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 12);
      logInfo(`getCurrentMonthDays(year=2024, month=12): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=12): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=12): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0006 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0007
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0007
     * @tc.desc      getCurrentMonthDays(year=2024, month=13) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0007 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 13);
      logInfo(`getCurrentMonthDays(year=2024, month=13): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=13): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=13): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0007 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0008
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0008
     * @tc.desc      getCurrentMonthDays(year=2024, month=-1) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0008 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, -1);
      logInfo(`getCurrentMonthDays(year=2024, month=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2024, month=-1): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=-1): JSON.stringify(act...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0008 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0009
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0009
     * @tc.desc      getCurrentMonthDays(year=2024, month=3) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0009 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 3);
      logInfo(`getCurrentMonthDays(year=2024, month=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=3): JSON.stringify(actua...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=3): JSON.stringify(actu...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0009 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0010
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0010
     * @tc.desc      getCurrentMonthDays(year=2024, month=10) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0010 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 10);
      logInfo(`getCurrentMonthDays(year=2024, month=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=10): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=10): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0010 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0011
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0011
     * @tc.desc      getCurrentMonthDays(year=2024, month=100) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0011 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 100);
      logInfo(`getCurrentMonthDays(year=2024, month=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2024, month=100): JSON.stringify(act...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=100): JSON.stringify(ac...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0011 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0012
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0012
     * @tc.desc      getCurrentMonthDays(year=2024, month=5) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0012 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 5);
      logInfo(`getCurrentMonthDays(year=2024, month=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=5): JSON.stringify(actua...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=5): JSON.stringify(actu...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0012 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0013
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0013
     * @tc.desc      getCurrentMonthDays(year=2024, month=15) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0013 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 15);
      logInfo(`getCurrentMonthDays(year=2024, month=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=15): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=15): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0013 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0014
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0014
     * @tc.desc      getCurrentMonthDays(year=2024, month=20) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0014 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 20);
      logInfo(`getCurrentMonthDays(year=2024, month=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=20): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=20): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0014 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0015
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0015
     * @tc.desc      getCurrentMonthDays(year=2024, month=25) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0015 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 25);
      logInfo(`getCurrentMonthDays(year=2024, month=25): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=25): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=25): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0015 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0016
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0016
     * @tc.desc      getCurrentMonthDays(year=2024, month=30) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0016 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 30);
      logInfo(`getCurrentMonthDays(year=2024, month=30): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2024, month=30): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=30): JSON.stringify(act...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0016 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0017
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0017
     * @tc.desc      getCurrentMonthDays(year=2024, month=35) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0017 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 35);
      logInfo(`getCurrentMonthDays(year=2024, month=35): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2024, month=35): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=35): JSON.stringify(act...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0017 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0018
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0018
     * @tc.desc      getCurrentMonthDays(year=2024, month=40) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0018 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 40);
      logInfo(`getCurrentMonthDays(year=2024, month=40): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2024, month=40): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=40): JSON.stringify(act...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0018 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0019
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0019
     * @tc.desc      getCurrentMonthDays(year=2024, month=45) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0019 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 45);
      logInfo(`getCurrentMonthDays(year=2024, month=45): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2024, month=45): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=45): JSON.stringify(act...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0019 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0020
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0020
     * @tc.desc      getCurrentMonthDays(year=2024, month=50) returns [22,23,24,25,26,27,28,29]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0020 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 50);
      logInfo(`getCurrentMonthDays(year=2024, month=50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(29);
      logInfo(`getCurrentMonthDays(year=2024, month=50): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=50): JSON.stringify(act...${JSON.stringify(actual.slice(21, 29))}`);
      expect(JSON.stringify(actual.slice(21, 29))).assertEqual('[22,23,24,25,26,27,28,29]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0020 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0021
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0021
     * @tc.desc      getCurrentMonthDays(year=2024, month=55) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0021 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 55);
      logInfo(`getCurrentMonthDays(year=2024, month=55): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=55): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=55): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0021 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0022
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0022
     * @tc.desc      getCurrentMonthDays(year=2024, month=60) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0022 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 60);
      logInfo(`getCurrentMonthDays(year=2024, month=60): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=60): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=60): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0022 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0023
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0023
     * @tc.desc      getCurrentMonthDays(year=2024, month=65) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0023 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 65);
      logInfo(`getCurrentMonthDays(year=2024, month=65): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=65): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=65): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0023 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0024
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0024
     * @tc.desc      getCurrentMonthDays(year=2024, month=70) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0024 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 70);
      logInfo(`getCurrentMonthDays(year=2024, month=70): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=70): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=70): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0024 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0025
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0025
     * @tc.desc      getCurrentMonthDays(year=2024, month=75) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0025 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 75);
      logInfo(`getCurrentMonthDays(year=2024, month=75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=75): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=75): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0025 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0026
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0026
     * @tc.desc      getCurrentMonthDays(year=2024, month=80) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0026 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 80);
      logInfo(`getCurrentMonthDays(year=2024, month=80): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=80): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=80): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0026 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0027
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0027
     * @tc.desc      getCurrentMonthDays(year=2024, month=85) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0027 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 85);
      logInfo(`getCurrentMonthDays(year=2024, month=85): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=85): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=85): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0027 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0028
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0028
     * @tc.desc      getCurrentMonthDays(year=2024, month=90) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0028 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 90);
      logInfo(`getCurrentMonthDays(year=2024, month=90): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2024, month=90): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=90): JSON.stringify(act...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0028 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0029
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0029
     * @tc.desc      getCurrentMonthDays(year=2024, month=95) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0029 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, 95);
      logInfo(`getCurrentMonthDays(year=2024, month=95): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2024, month=95): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=95): JSON.stringify(act...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0029 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0030
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0030
     * @tc.desc      getCurrentMonthDays(year=2024, month=-28) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0030 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, -28);
      logInfo(`getCurrentMonthDays(year=2024, month=-28): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=-28): JSON.stringify(act...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=-28): JSON.stringify(ac...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0030 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0031
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0031
     * @tc.desc      getCurrentMonthDays(year=2024, month=-84) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0031 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2024, -84);
      logInfo(`getCurrentMonthDays(year=2024, month=-84): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2024, month=-84): JSON.stringify(act...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2024, month=-84): JSON.stringify(ac...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0031 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0032
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0032
     * @tc.desc      getCurrentMonthDays(year=2023, month=1) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0032 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 1);
      logInfo(`getCurrentMonthDays(year=2023, month=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=1): JSON.stringify(actua...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=1): JSON.stringify(actu...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0032 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0033
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0033
     * @tc.desc      getCurrentMonthDays(year=2023, month=0) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0033 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 0);
      logInfo(`getCurrentMonthDays(year=2023, month=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=0): JSON.stringify(actua...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=0): JSON.stringify(actu...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0033 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0034
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0034
     * @tc.desc      getCurrentMonthDays(year=2023, month=6) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0034 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 6);
      logInfo(`getCurrentMonthDays(year=2023, month=6): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2023, month=6): JSON.stringify(actua...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=6): JSON.stringify(actu...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0034 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0035
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0035
     * @tc.desc      getCurrentMonthDays(year=2023, month=12) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0035 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 12);
      logInfo(`getCurrentMonthDays(year=2023, month=12): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=12): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=12): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0035 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0036
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0036
     * @tc.desc      getCurrentMonthDays(year=2023, month=13) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0036 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 13);
      logInfo(`getCurrentMonthDays(year=2023, month=13): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=13): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=13): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0036 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0037
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0037
     * @tc.desc      getCurrentMonthDays(year=2023, month=-1) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0037 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, -1);
      logInfo(`getCurrentMonthDays(year=2023, month=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2023, month=-1): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=-1): JSON.stringify(act...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0037 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0038
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0038
     * @tc.desc      getCurrentMonthDays(year=2023, month=3) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0038 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 3);
      logInfo(`getCurrentMonthDays(year=2023, month=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=3): JSON.stringify(actua...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=3): JSON.stringify(actu...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0038 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0039
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0039
     * @tc.desc      getCurrentMonthDays(year=2023, month=10) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0039 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 10);
      logInfo(`getCurrentMonthDays(year=2023, month=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=10): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=10): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0039 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0040
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0040
     * @tc.desc      getCurrentMonthDays(year=2023, month=100) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0040 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 100);
      logInfo(`getCurrentMonthDays(year=2023, month=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2023, month=100): JSON.stringify(act...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=100): JSON.stringify(ac...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0040 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0041
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0041
     * @tc.desc      getCurrentMonthDays(year=2023, month=5) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0041 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 5);
      logInfo(`getCurrentMonthDays(year=2023, month=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=5): JSON.stringify(actua...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=5): JSON.stringify(actu...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0041 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0042
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0042
     * @tc.desc      getCurrentMonthDays(year=2023, month=15) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0042 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 15);
      logInfo(`getCurrentMonthDays(year=2023, month=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=15): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=15): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0042 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0043
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0043
     * @tc.desc      getCurrentMonthDays(year=2023, month=20) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0043 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 20);
      logInfo(`getCurrentMonthDays(year=2023, month=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=20): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=20): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0043 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0044
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0044
     * @tc.desc      getCurrentMonthDays(year=2023, month=25) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0044 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 25);
      logInfo(`getCurrentMonthDays(year=2023, month=25): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=25): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=25): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0044 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0045
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0045
     * @tc.desc      getCurrentMonthDays(year=2023, month=30) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0045 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 30);
      logInfo(`getCurrentMonthDays(year=2023, month=30): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2023, month=30): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=30): JSON.stringify(act...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0045 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0046
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0046
     * @tc.desc      getCurrentMonthDays(year=2023, month=35) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0046 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 35);
      logInfo(`getCurrentMonthDays(year=2023, month=35): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2023, month=35): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=35): JSON.stringify(act...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0046 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0047
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0047
     * @tc.desc      getCurrentMonthDays(year=2023, month=40) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0047 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 40);
      logInfo(`getCurrentMonthDays(year=2023, month=40): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2023, month=40): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=40): JSON.stringify(act...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0047 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0048
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0048
     * @tc.desc      getCurrentMonthDays(year=2023, month=45) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0048 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 45);
      logInfo(`getCurrentMonthDays(year=2023, month=45): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2023, month=45): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=45): JSON.stringify(act...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0048 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0049
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0049
     * @tc.desc      getCurrentMonthDays(year=2023, month=50) returns [22,23,24,25,26,27,28]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0049 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 50);
      logInfo(`getCurrentMonthDays(year=2023, month=50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(28);
      logInfo(`getCurrentMonthDays(year=2023, month=50): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=50): JSON.stringify(act...${JSON.stringify(actual.slice(21, 28))}`);
      expect(JSON.stringify(actual.slice(21, 28))).assertEqual('[22,23,24,25,26,27,28]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0049 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0050
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0050
     * @tc.desc      getCurrentMonthDays(year=2023, month=55) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0050 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 55);
      logInfo(`getCurrentMonthDays(year=2023, month=55): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=55): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=55): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0050 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0051
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0051
     * @tc.desc      getCurrentMonthDays(year=2023, month=60) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0051 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 60);
      logInfo(`getCurrentMonthDays(year=2023, month=60): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=60): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=60): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0051 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0052
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0052
     * @tc.desc      getCurrentMonthDays(year=2023, month=65) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0052 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 65);
      logInfo(`getCurrentMonthDays(year=2023, month=65): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=65): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=65): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0052 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0053
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0053
     * @tc.desc      getCurrentMonthDays(year=2023, month=70) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0053 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 70);
      logInfo(`getCurrentMonthDays(year=2023, month=70): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=70): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=70): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0053 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0054
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0054
     * @tc.desc      getCurrentMonthDays(year=2023, month=75) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0054 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 75);
      logInfo(`getCurrentMonthDays(year=2023, month=75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=75): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=75): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0054 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0055
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0055
     * @tc.desc      getCurrentMonthDays(year=2023, month=80) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0055 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 80);
      logInfo(`getCurrentMonthDays(year=2023, month=80): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=80): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=80): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0055 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0056
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0056
     * @tc.desc      getCurrentMonthDays(year=2023, month=85) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0056 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 85);
      logInfo(`getCurrentMonthDays(year=2023, month=85): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=85): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=85): JSON.stringify(act...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0056 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0057
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0057
     * @tc.desc      getCurrentMonthDays(year=2023, month=90) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0057 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 90);
      logInfo(`getCurrentMonthDays(year=2023, month=90): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2023, month=90): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=90): JSON.stringify(act...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0057 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0058
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0058
     * @tc.desc      getCurrentMonthDays(year=2023, month=95) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0058 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, 95);
      logInfo(`getCurrentMonthDays(year=2023, month=95): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=2023, month=95): JSON.stringify(actu...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=95): JSON.stringify(act...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0058 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0059
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0059
     * @tc.desc      getCurrentMonthDays(year=2023, month=-28) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0059 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, -28);
      logInfo(`getCurrentMonthDays(year=2023, month=-28): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=-28): JSON.stringify(act...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=-28): JSON.stringify(ac...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0059 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0060
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0060
     * @tc.desc      getCurrentMonthDays(year=2023, month=-84) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0060 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(2023, -84);
      logInfo(`getCurrentMonthDays(year=2023, month=-84): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=2023, month=-84): JSON.stringify(act...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=2023, month=-84): JSON.stringify(ac...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0060 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0061
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0061
     * @tc.desc      getCurrentMonthDays(year=1, month=1) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0061 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 1);
      logInfo(`getCurrentMonthDays(year=1, month=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=1): JSON.stringify(actual.s...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=1): JSON.stringify(actual....${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0061 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0062
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0062
     * @tc.desc      getCurrentMonthDays(year=1, month=2) returns [22,23,24,25,26,27,28]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0062 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 2);
      logInfo(`getCurrentMonthDays(year=1, month=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(28);
      logInfo(`getCurrentMonthDays(year=1, month=2): JSON.stringify(actual.s...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=2): JSON.stringify(actual....${JSON.stringify(actual.slice(21, 28))}`);
      expect(JSON.stringify(actual.slice(21, 28))).assertEqual('[22,23,24,25,26,27,28]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0062 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0063
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0063
     * @tc.desc      getCurrentMonthDays(year=1, month=0) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0063 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 0);
      logInfo(`getCurrentMonthDays(year=1, month=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=0): JSON.stringify(actual.s...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=0): JSON.stringify(actual....${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0063 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0064
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0064
     * @tc.desc      getCurrentMonthDays(year=1, month=6) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0064 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 6);
      logInfo(`getCurrentMonthDays(year=1, month=6): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=1, month=6): JSON.stringify(actual.s...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=6): JSON.stringify(actual....${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0064 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0065
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0065
     * @tc.desc      getCurrentMonthDays(year=1, month=12) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0065 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 12);
      logInfo(`getCurrentMonthDays(year=1, month=12): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=12): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=12): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0065 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0066
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0066
     * @tc.desc      getCurrentMonthDays(year=1, month=13) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0066 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 13);
      logInfo(`getCurrentMonthDays(year=1, month=13): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=13): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=13): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0066 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0067
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0067
     * @tc.desc      getCurrentMonthDays(year=1, month=-1) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0067 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, -1);
      logInfo(`getCurrentMonthDays(year=1, month=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=1, month=-1): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=-1): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0067 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0068
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0068
     * @tc.desc      getCurrentMonthDays(year=1, month=3) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0068 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 3);
      logInfo(`getCurrentMonthDays(year=1, month=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=3): JSON.stringify(actual.s...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=3): JSON.stringify(actual....${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0068 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0069
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0069
     * @tc.desc      getCurrentMonthDays(year=1, month=10) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0069 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 10);
      logInfo(`getCurrentMonthDays(year=1, month=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=10): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=10): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0069 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0070
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0070
     * @tc.desc      getCurrentMonthDays(year=1, month=100) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0070 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 100);
      logInfo(`getCurrentMonthDays(year=1, month=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=1, month=100): JSON.stringify(actual...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=100): JSON.stringify(actua...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0070 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0071
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0071
     * @tc.desc      getCurrentMonthDays(year=1, month=5) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0071 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 5);
      logInfo(`getCurrentMonthDays(year=1, month=5): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=5): JSON.stringify(actual.s...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=5): JSON.stringify(actual....${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0071 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0072
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0072
     * @tc.desc      getCurrentMonthDays(year=1, month=15) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0072 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 15);
      logInfo(`getCurrentMonthDays(year=1, month=15): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=15): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=15): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0072 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0073
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0073
     * @tc.desc      getCurrentMonthDays(year=1, month=20) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0073 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 20);
      logInfo(`getCurrentMonthDays(year=1, month=20): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=20): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=20): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0073 end`);
    });
  });
}
