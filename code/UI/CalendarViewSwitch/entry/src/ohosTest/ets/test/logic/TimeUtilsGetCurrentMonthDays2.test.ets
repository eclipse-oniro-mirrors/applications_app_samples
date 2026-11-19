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

/** Logic checks for TimeUtils.getCurrentMonthDays (27 cases). */
export default function timeUtilsGetCurrentMonthDays2Test(): void {
  describe('TimeUtilsGetCurrentMonthDays2Test', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0074
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0074
     * @tc.desc      getCurrentMonthDays(year=1, month=25) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0074 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 25);
      logInfo(`getCurrentMonthDays(year=1, month=25): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=25): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=25): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0074 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0075
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0075
     * @tc.desc      getCurrentMonthDays(year=1, month=30) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0075 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 30);
      logInfo(`getCurrentMonthDays(year=1, month=30): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=1, month=30): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=30): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0075 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0076
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0076
     * @tc.desc      getCurrentMonthDays(year=1, month=35) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0076 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 35);
      logInfo(`getCurrentMonthDays(year=1, month=35): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=1, month=35): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=35): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0076 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0077
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0077
     * @tc.desc      getCurrentMonthDays(year=1, month=40) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0077 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 40);
      logInfo(`getCurrentMonthDays(year=1, month=40): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=1, month=40): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=40): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0077 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0078
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0078
     * @tc.desc      getCurrentMonthDays(year=1, month=45) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0078 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 45);
      logInfo(`getCurrentMonthDays(year=1, month=45): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=1, month=45): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=45): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0078 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0079
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0079
     * @tc.desc      getCurrentMonthDays(year=1, month=50) returns [22,23,24,25,26,27,28]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0079 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 50);
      logInfo(`getCurrentMonthDays(year=1, month=50): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(28);
      logInfo(`getCurrentMonthDays(year=1, month=50): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=50): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 28))}`);
      expect(JSON.stringify(actual.slice(21, 28))).assertEqual('[22,23,24,25,26,27,28]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0079 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0080
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0080
     * @tc.desc      getCurrentMonthDays(year=1, month=55) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0080 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 55);
      logInfo(`getCurrentMonthDays(year=1, month=55): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=55): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=55): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0080 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0081
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0081
     * @tc.desc      getCurrentMonthDays(year=1, month=60) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0081 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 60);
      logInfo(`getCurrentMonthDays(year=1, month=60): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=60): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=60): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0081 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0082
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0082
     * @tc.desc      getCurrentMonthDays(year=1, month=65) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0082 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 65);
      logInfo(`getCurrentMonthDays(year=1, month=65): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=65): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=65): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0082 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0083
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0083
     * @tc.desc      getCurrentMonthDays(year=1, month=70) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0083 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 70);
      logInfo(`getCurrentMonthDays(year=1, month=70): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=70): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=70): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0083 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0084
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0084
     * @tc.desc      getCurrentMonthDays(year=1, month=75) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0084 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 75);
      logInfo(`getCurrentMonthDays(year=1, month=75): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=75): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=75): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0084 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0085
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0085
     * @tc.desc      getCurrentMonthDays(year=1, month=80) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0085 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 80);
      logInfo(`getCurrentMonthDays(year=1, month=80): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=80): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=80): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0085 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0086
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0086
     * @tc.desc      getCurrentMonthDays(year=1, month=85) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0086 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 85);
      logInfo(`getCurrentMonthDays(year=1, month=85): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=85): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=85): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0086 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0087
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0087
     * @tc.desc      getCurrentMonthDays(year=1, month=90) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0087 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 90);
      logInfo(`getCurrentMonthDays(year=1, month=90): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=1, month=90): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=90): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0087 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0088
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0088
     * @tc.desc      getCurrentMonthDays(year=1, month=95) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0088 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, 95);
      logInfo(`getCurrentMonthDays(year=1, month=95): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=1, month=95): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=95): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0088 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0089
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0089
     * @tc.desc      getCurrentMonthDays(year=1, month=-28) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0089 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, -28);
      logInfo(`getCurrentMonthDays(year=1, month=-28): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=-28): JSON.stringify(actual...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=-28): JSON.stringify(actua...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0089 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0090
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0090
     * @tc.desc      getCurrentMonthDays(year=1, month=-84) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0090 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(1, -84);
      logInfo(`getCurrentMonthDays(year=1, month=-84): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=1, month=-84): JSON.stringify(actual...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=1, month=-84): JSON.stringify(actua...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0090 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0091
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0091
     * @tc.desc      getCurrentMonthDays(year=0, month=1) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0091 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(0, 1);
      logInfo(`getCurrentMonthDays(year=0, month=1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=0, month=1): JSON.stringify(actual.s...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=0, month=1): JSON.stringify(actual....${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0091 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0092
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0092
     * @tc.desc      getCurrentMonthDays(year=0, month=2) returns [22,23,24,25,26,27,28]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0092 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(0, 2);
      logInfo(`getCurrentMonthDays(year=0, month=2): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(28);
      logInfo(`getCurrentMonthDays(year=0, month=2): JSON.stringify(actual.s...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=0, month=2): JSON.stringify(actual....${JSON.stringify(actual.slice(21, 28))}`);
      expect(JSON.stringify(actual.slice(21, 28))).assertEqual('[22,23,24,25,26,27,28]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0092 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0093
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0093
     * @tc.desc      getCurrentMonthDays(year=0, month=0) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0093 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(0, 0);
      logInfo(`getCurrentMonthDays(year=0, month=0): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=0, month=0): JSON.stringify(actual.s...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=0, month=0): JSON.stringify(actual....${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0093 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0094
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0094
     * @tc.desc      getCurrentMonthDays(year=0, month=6) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0094 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(0, 6);
      logInfo(`getCurrentMonthDays(year=0, month=6): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=0, month=6): JSON.stringify(actual.s...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=0, month=6): JSON.stringify(actual....${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0094 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0095
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0095
     * @tc.desc      getCurrentMonthDays(year=0, month=12) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0095 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(0, 12);
      logInfo(`getCurrentMonthDays(year=0, month=12): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=0, month=12): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=0, month=12): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0095 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0096
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0096
     * @tc.desc      getCurrentMonthDays(year=0, month=13) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0096 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(0, 13);
      logInfo(`getCurrentMonthDays(year=0, month=13): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=0, month=13): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=0, month=13): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0096 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0097
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0097
     * @tc.desc      getCurrentMonthDays(year=0, month=-1) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0097 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(0, -1);
      logInfo(`getCurrentMonthDays(year=0, month=-1): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=0, month=-1): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=0, month=-1): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0097 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0098
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0098
     * @tc.desc      getCurrentMonthDays(year=0, month=3) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0098 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(0, 3);
      logInfo(`getCurrentMonthDays(year=0, month=3): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=0, month=3): JSON.stringify(actual.s...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=0, month=3): JSON.stringify(actual....${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0098 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0099
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0099
     * @tc.desc      getCurrentMonthDays(year=0, month=10) returns [22,23,24,25,26,27,28,29,30,31]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0099 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(0, 10);
      logInfo(`getCurrentMonthDays(year=0, month=10): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(31);
      logInfo(`getCurrentMonthDays(year=0, month=10): JSON.stringify(actual....${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=0, month=10): JSON.stringify(actual...${JSON.stringify(actual.slice(21, 31))}`);
      expect(JSON.stringify(actual.slice(21, 31))).assertEqual('[22,23,24,25,26,27,28,29,30,31]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0099 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_CURRENT_MONTH_DAYS_0100
     * @tc.name      CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0100
     * @tc.desc      getCurrentMonthDays(year=0, month=100) returns [22,23,24,25,26,27,28,29,30]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetCurrentMonthDays_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0100 begin`);
      const actual: number[] = TimeUtils.getCurrentMonthDays(0, 100);
      logInfo(`getCurrentMonthDays(year=0, month=100): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`getCurrentMonthDays(year=0, month=100): JSON.stringify(actual...${JSON.stringify(actual.slice(0, 21))}`);
      expect(JSON.stringify(actual.slice(0, 21)))
        .assertEqual('[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]');
      logInfo(`getCurrentMonthDays(year=0, month=100): JSON.stringify(actua...${JSON.stringify(actual.slice(21, 30))}`);
      expect(JSON.stringify(actual.slice(21, 30))).assertEqual('[22,23,24,25,26,27,28,29,30]');
      logInfo(`${BUNDLE}TimeUtilsGetCurrentMonthDays_0100 end`);
    });
  });
}
