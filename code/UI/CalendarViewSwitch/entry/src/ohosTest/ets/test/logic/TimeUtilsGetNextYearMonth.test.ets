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

/** Logic checks for TimeUtils.getNextYearMonth (96 cases). */
export default function timeUtilsGetNextYearMonthTest(): void {
  describe('TimeUtilsGetNextYearMonthTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0001
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0001
     * @tc.desc      getNextYearMonth(year=2024, month=1) returns "2024-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0001 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2024, 1);
      logInfo(`getNextYearMonth(year=2024, month=1): actual=${actual}`);
      expect(actual).assertEqual('2024-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0002
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0002
     * @tc.desc      getNextYearMonth(year=2024, month=2) returns "2024-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0002 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2024, 2);
      logInfo(`getNextYearMonth(year=2024, month=2): actual=${actual}`);
      expect(actual).assertEqual('2024-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0003
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0003
     * @tc.desc      getNextYearMonth(year=2024, month=0) returns "2024-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0003 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2024, 0);
      logInfo(`getNextYearMonth(year=2024, month=0): actual=${actual}`);
      expect(actual).assertEqual('2024-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0004
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0004
     * @tc.desc      getNextYearMonth(year=2024, month=12) returns "2025-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0004 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2024, 12);
      logInfo(`getNextYearMonth(year=2024, month=12): actual=${actual}`);
      expect(actual).assertEqual('2025-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0005
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0005
     * @tc.desc      getNextYearMonth(year=2024, month=11) returns "2024-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0005 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2024, 11);
      logInfo(`getNextYearMonth(year=2024, month=11): actual=${actual}`);
      expect(actual).assertEqual('2024-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0005 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0006
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0006
     * @tc.desc      getNextYearMonth(year=2024, month=6) returns "2024-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0006 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2024, 6);
      logInfo(`getNextYearMonth(year=2024, month=6): actual=${actual}`);
      expect(actual).assertEqual('2024-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0006 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0007
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0007
     * @tc.desc      getNextYearMonth(year=2024, month=-1) returns "2024-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0007 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2024, -1);
      logInfo(`getNextYearMonth(year=2024, month=-1): actual=${actual}`);
      expect(actual).assertEqual('2024-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0007 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0008
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0008
     * @tc.desc      getNextYearMonth(year=2024, month=3) returns "2024-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0008 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2024, 3);
      logInfo(`getNextYearMonth(year=2024, month=3): actual=${actual}`);
      expect(actual).assertEqual('2024-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0008 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0009
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0009
     * @tc.desc      getNextYearMonth(year=2024, month=10) returns "2024-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0009 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2024, 10);
      logInfo(`getNextYearMonth(year=2024, month=10): actual=${actual}`);
      expect(actual).assertEqual('2024-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0009 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0010
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0010
     * @tc.desc      getNextYearMonth(year=2024, month=5) returns "2024-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0010 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2024, 5);
      logInfo(`getNextYearMonth(year=2024, month=5): actual=${actual}`);
      expect(actual).assertEqual('2024-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0010 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0011
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0011
     * @tc.desc      getNextYearMonth(year=2023, month=1) returns "2023-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0011 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2023, 1);
      logInfo(`getNextYearMonth(year=2023, month=1): actual=${actual}`);
      expect(actual).assertEqual('2023-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0011 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0012
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0012
     * @tc.desc      getNextYearMonth(year=2023, month=2) returns "2023-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0012 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2023, 2);
      logInfo(`getNextYearMonth(year=2023, month=2): actual=${actual}`);
      expect(actual).assertEqual('2023-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0012 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0013
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0013
     * @tc.desc      getNextYearMonth(year=2023, month=0) returns "2023-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0013 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2023, 0);
      logInfo(`getNextYearMonth(year=2023, month=0): actual=${actual}`);
      expect(actual).assertEqual('2023-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0013 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0014
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0014
     * @tc.desc      getNextYearMonth(year=2023, month=11) returns "2023-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0014 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2023, 11);
      logInfo(`getNextYearMonth(year=2023, month=11): actual=${actual}`);
      expect(actual).assertEqual('2023-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0014 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0015
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0015
     * @tc.desc      getNextYearMonth(year=2023, month=6) returns "2023-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0015 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2023, 6);
      logInfo(`getNextYearMonth(year=2023, month=6): actual=${actual}`);
      expect(actual).assertEqual('2023-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0015 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0016
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0016
     * @tc.desc      getNextYearMonth(year=2023, month=-1) returns "2023-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0016 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2023, -1);
      logInfo(`getNextYearMonth(year=2023, month=-1): actual=${actual}`);
      expect(actual).assertEqual('2023-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0016 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0017
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0017
     * @tc.desc      getNextYearMonth(year=2023, month=3) returns "2023-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0017 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2023, 3);
      logInfo(`getNextYearMonth(year=2023, month=3): actual=${actual}`);
      expect(actual).assertEqual('2023-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0017 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0018
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0018
     * @tc.desc      getNextYearMonth(year=2023, month=10) returns "2023-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0018 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2023, 10);
      logInfo(`getNextYearMonth(year=2023, month=10): actual=${actual}`);
      expect(actual).assertEqual('2023-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0018 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0019
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0019
     * @tc.desc      getNextYearMonth(year=2023, month=5) returns "2023-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0019 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2023, 5);
      logInfo(`getNextYearMonth(year=2023, month=5): actual=${actual}`);
      expect(actual).assertEqual('2023-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0019 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0020
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0020
     * @tc.desc      getNextYearMonth(year=1, month=1) returns "1-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0020 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1, 1);
      logInfo(`getNextYearMonth(year=1, month=1): actual=${actual}`);
      expect(actual).assertEqual('1-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0020 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0021
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0021
     * @tc.desc      getNextYearMonth(year=1, month=2) returns "1-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0021 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1, 2);
      logInfo(`getNextYearMonth(year=1, month=2): actual=${actual}`);
      expect(actual).assertEqual('1-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0021 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0022
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0022
     * @tc.desc      getNextYearMonth(year=1, month=0) returns "1-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0022 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1, 0);
      logInfo(`getNextYearMonth(year=1, month=0): actual=${actual}`);
      expect(actual).assertEqual('1-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0022 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0023
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0023
     * @tc.desc      getNextYearMonth(year=1, month=12) returns "2-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0023 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1, 12);
      logInfo(`getNextYearMonth(year=1, month=12): actual=${actual}`);
      expect(actual).assertEqual('2-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0023 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0024
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0024
     * @tc.desc      getNextYearMonth(year=1, month=11) returns "1-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0024 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1, 11);
      logInfo(`getNextYearMonth(year=1, month=11): actual=${actual}`);
      expect(actual).assertEqual('1-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0024 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0025
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0025
     * @tc.desc      getNextYearMonth(year=1, month=6) returns "1-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0025 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1, 6);
      logInfo(`getNextYearMonth(year=1, month=6): actual=${actual}`);
      expect(actual).assertEqual('1-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0025 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0026
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0026
     * @tc.desc      getNextYearMonth(year=1, month=-1) returns "1-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0026 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1, -1);
      logInfo(`getNextYearMonth(year=1, month=-1): actual=${actual}`);
      expect(actual).assertEqual('1-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0026 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0027
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0027
     * @tc.desc      getNextYearMonth(year=1, month=3) returns "1-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0027 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1, 3);
      logInfo(`getNextYearMonth(year=1, month=3): actual=${actual}`);
      expect(actual).assertEqual('1-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0027 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0028
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0028
     * @tc.desc      getNextYearMonth(year=1, month=10) returns "1-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0028 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1, 10);
      logInfo(`getNextYearMonth(year=1, month=10): actual=${actual}`);
      expect(actual).assertEqual('1-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0028 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0029
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0029
     * @tc.desc      getNextYearMonth(year=1, month=5) returns "1-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0029 begin`);
      const actual: string = TimeUtils.getNextYearMonth(1, 5);
      logInfo(`getNextYearMonth(year=1, month=5): actual=${actual}`);
      expect(actual).assertEqual('1-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0029 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0030
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0030
     * @tc.desc      getNextYearMonth(year=0, month=1) returns "0-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0030 begin`);
      const actual: string = TimeUtils.getNextYearMonth(0, 1);
      logInfo(`getNextYearMonth(year=0, month=1): actual=${actual}`);
      expect(actual).assertEqual('0-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0030 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0031
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0031
     * @tc.desc      getNextYearMonth(year=0, month=2) returns "0-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0031 begin`);
      const actual: string = TimeUtils.getNextYearMonth(0, 2);
      logInfo(`getNextYearMonth(year=0, month=2): actual=${actual}`);
      expect(actual).assertEqual('0-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0031 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0032
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0032
     * @tc.desc      getNextYearMonth(year=0, month=0) returns "0-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0032 begin`);
      const actual: string = TimeUtils.getNextYearMonth(0, 0);
      logInfo(`getNextYearMonth(year=0, month=0): actual=${actual}`);
      expect(actual).assertEqual('0-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0032 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0033
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0033
     * @tc.desc      getNextYearMonth(year=0, month=11) returns "0-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0033 begin`);
      const actual: string = TimeUtils.getNextYearMonth(0, 11);
      logInfo(`getNextYearMonth(year=0, month=11): actual=${actual}`);
      expect(actual).assertEqual('0-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0033 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0034
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0034
     * @tc.desc      getNextYearMonth(year=0, month=6) returns "0-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0034 begin`);
      const actual: string = TimeUtils.getNextYearMonth(0, 6);
      logInfo(`getNextYearMonth(year=0, month=6): actual=${actual}`);
      expect(actual).assertEqual('0-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0034 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0035
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0035
     * @tc.desc      getNextYearMonth(year=0, month=-1) returns "0-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0035 begin`);
      const actual: string = TimeUtils.getNextYearMonth(0, -1);
      logInfo(`getNextYearMonth(year=0, month=-1): actual=${actual}`);
      expect(actual).assertEqual('0-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0035 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0036
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0036
     * @tc.desc      getNextYearMonth(year=0, month=3) returns "0-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0036 begin`);
      const actual: string = TimeUtils.getNextYearMonth(0, 3);
      logInfo(`getNextYearMonth(year=0, month=3): actual=${actual}`);
      expect(actual).assertEqual('0-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0036 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0037
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0037
     * @tc.desc      getNextYearMonth(year=0, month=10) returns "0-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0037 begin`);
      const actual: string = TimeUtils.getNextYearMonth(0, 10);
      logInfo(`getNextYearMonth(year=0, month=10): actual=${actual}`);
      expect(actual).assertEqual('0-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0037 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0038
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0038
     * @tc.desc      getNextYearMonth(year=0, month=5) returns "0-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0038 begin`);
      const actual: string = TimeUtils.getNextYearMonth(0, 5);
      logInfo(`getNextYearMonth(year=0, month=5): actual=${actual}`);
      expect(actual).assertEqual('0-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0038 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0039
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0039
     * @tc.desc      getNextYearMonth(year=2, month=1) returns "2-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0039 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2, 1);
      logInfo(`getNextYearMonth(year=2, month=1): actual=${actual}`);
      expect(actual).assertEqual('2-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0039 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0040
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0040
     * @tc.desc      getNextYearMonth(year=2, month=2) returns "2-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0040 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2, 2);
      logInfo(`getNextYearMonth(year=2, month=2): actual=${actual}`);
      expect(actual).assertEqual('2-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0040 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0041
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0041
     * @tc.desc      getNextYearMonth(year=2, month=12) returns "3-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0041 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2, 12);
      logInfo(`getNextYearMonth(year=2, month=12): actual=${actual}`);
      expect(actual).assertEqual('3-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0041 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0042
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0042
     * @tc.desc      getNextYearMonth(year=2, month=11) returns "2-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0042 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2, 11);
      logInfo(`getNextYearMonth(year=2, month=11): actual=${actual}`);
      expect(actual).assertEqual('2-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0042 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0043
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0043
     * @tc.desc      getNextYearMonth(year=2, month=6) returns "2-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0043 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2, 6);
      logInfo(`getNextYearMonth(year=2, month=6): actual=${actual}`);
      expect(actual).assertEqual('2-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0043 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0044
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0044
     * @tc.desc      getNextYearMonth(year=2, month=-1) returns "2-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0044 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2, -1);
      logInfo(`getNextYearMonth(year=2, month=-1): actual=${actual}`);
      expect(actual).assertEqual('2-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0044 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0045
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0045
     * @tc.desc      getNextYearMonth(year=2, month=3) returns "2-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0045 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2, 3);
      logInfo(`getNextYearMonth(year=2, month=3): actual=${actual}`);
      expect(actual).assertEqual('2-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0045 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0046
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0046
     * @tc.desc      getNextYearMonth(year=2, month=10) returns "2-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0046 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2, 10);
      logInfo(`getNextYearMonth(year=2, month=10): actual=${actual}`);
      expect(actual).assertEqual('2-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0046 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0047
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0047
     * @tc.desc      getNextYearMonth(year=2, month=5) returns "2-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0047 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2, 5);
      logInfo(`getNextYearMonth(year=2, month=5): actual=${actual}`);
      expect(actual).assertEqual('2-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0047 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0048
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0048
     * @tc.desc      getNextYearMonth(year=12, month=1) returns "12-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0048 begin`);
      const actual: string = TimeUtils.getNextYearMonth(12, 1);
      logInfo(`getNextYearMonth(year=12, month=1): actual=${actual}`);
      expect(actual).assertEqual('12-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0048 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0049
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0049
     * @tc.desc      getNextYearMonth(year=12, month=2) returns "12-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0049 begin`);
      const actual: string = TimeUtils.getNextYearMonth(12, 2);
      logInfo(`getNextYearMonth(year=12, month=2): actual=${actual}`);
      expect(actual).assertEqual('12-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0049 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0050
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0050
     * @tc.desc      getNextYearMonth(year=12, month=0) returns "12-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0050 begin`);
      const actual: string = TimeUtils.getNextYearMonth(12, 0);
      logInfo(`getNextYearMonth(year=12, month=0): actual=${actual}`);
      expect(actual).assertEqual('12-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0050 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0051
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0051
     * @tc.desc      getNextYearMonth(year=12, month=12) returns "13-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0051 begin`);
      const actual: string = TimeUtils.getNextYearMonth(12, 12);
      logInfo(`getNextYearMonth(year=12, month=12): actual=${actual}`);
      expect(actual).assertEqual('13-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0051 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0052
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0052
     * @tc.desc      getNextYearMonth(year=12, month=11) returns "12-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0052 begin`);
      const actual: string = TimeUtils.getNextYearMonth(12, 11);
      logInfo(`getNextYearMonth(year=12, month=11): actual=${actual}`);
      expect(actual).assertEqual('12-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0052 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0053
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0053
     * @tc.desc      getNextYearMonth(year=12, month=6) returns "12-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0053 begin`);
      const actual: string = TimeUtils.getNextYearMonth(12, 6);
      logInfo(`getNextYearMonth(year=12, month=6): actual=${actual}`);
      expect(actual).assertEqual('12-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0053 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0054
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0054
     * @tc.desc      getNextYearMonth(year=12, month=-1) returns "12-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0054 begin`);
      const actual: string = TimeUtils.getNextYearMonth(12, -1);
      logInfo(`getNextYearMonth(year=12, month=-1): actual=${actual}`);
      expect(actual).assertEqual('12-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0054 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0055
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0055
     * @tc.desc      getNextYearMonth(year=12, month=3) returns "12-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0055 begin`);
      const actual: string = TimeUtils.getNextYearMonth(12, 3);
      logInfo(`getNextYearMonth(year=12, month=3): actual=${actual}`);
      expect(actual).assertEqual('12-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0055 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0056
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0056
     * @tc.desc      getNextYearMonth(year=12, month=10) returns "12-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0056 begin`);
      const actual: string = TimeUtils.getNextYearMonth(12, 10);
      logInfo(`getNextYearMonth(year=12, month=10): actual=${actual}`);
      expect(actual).assertEqual('12-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0056 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0057
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0057
     * @tc.desc      getNextYearMonth(year=12, month=5) returns "12-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0057 begin`);
      const actual: string = TimeUtils.getNextYearMonth(12, 5);
      logInfo(`getNextYearMonth(year=12, month=5): actual=${actual}`);
      expect(actual).assertEqual('12-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0057 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0058
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0058
     * @tc.desc      getNextYearMonth(year=11, month=1) returns "11-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0058 begin`);
      const actual: string = TimeUtils.getNextYearMonth(11, 1);
      logInfo(`getNextYearMonth(year=11, month=1): actual=${actual}`);
      expect(actual).assertEqual('11-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0058 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0059
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0059
     * @tc.desc      getNextYearMonth(year=11, month=2) returns "11-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0059 begin`);
      const actual: string = TimeUtils.getNextYearMonth(11, 2);
      logInfo(`getNextYearMonth(year=11, month=2): actual=${actual}`);
      expect(actual).assertEqual('11-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0059 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0060
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0060
     * @tc.desc      getNextYearMonth(year=11, month=0) returns "11-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0060 begin`);
      const actual: string = TimeUtils.getNextYearMonth(11, 0);
      logInfo(`getNextYearMonth(year=11, month=0): actual=${actual}`);
      expect(actual).assertEqual('11-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0060 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0061
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0061
     * @tc.desc      getNextYearMonth(year=11, month=11) returns "11-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0061 begin`);
      const actual: string = TimeUtils.getNextYearMonth(11, 11);
      logInfo(`getNextYearMonth(year=11, month=11): actual=${actual}`);
      expect(actual).assertEqual('11-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0061 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0062
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0062
     * @tc.desc      getNextYearMonth(year=11, month=6) returns "11-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0062 begin`);
      const actual: string = TimeUtils.getNextYearMonth(11, 6);
      logInfo(`getNextYearMonth(year=11, month=6): actual=${actual}`);
      expect(actual).assertEqual('11-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0062 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0063
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0063
     * @tc.desc      getNextYearMonth(year=11, month=-1) returns "11-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0063 begin`);
      const actual: string = TimeUtils.getNextYearMonth(11, -1);
      logInfo(`getNextYearMonth(year=11, month=-1): actual=${actual}`);
      expect(actual).assertEqual('11-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0063 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0064
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0064
     * @tc.desc      getNextYearMonth(year=11, month=3) returns "11-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0064 begin`);
      const actual: string = TimeUtils.getNextYearMonth(11, 3);
      logInfo(`getNextYearMonth(year=11, month=3): actual=${actual}`);
      expect(actual).assertEqual('11-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0064 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0065
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0065
     * @tc.desc      getNextYearMonth(year=11, month=10) returns "11-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0065 begin`);
      const actual: string = TimeUtils.getNextYearMonth(11, 10);
      logInfo(`getNextYearMonth(year=11, month=10): actual=${actual}`);
      expect(actual).assertEqual('11-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0065 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0066
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0066
     * @tc.desc      getNextYearMonth(year=11, month=5) returns "11-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0066 begin`);
      const actual: string = TimeUtils.getNextYearMonth(11, 5);
      logInfo(`getNextYearMonth(year=11, month=5): actual=${actual}`);
      expect(actual).assertEqual('11-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0066 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0067
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0067
     * @tc.desc      getNextYearMonth(year=13, month=1) returns "13-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0067 begin`);
      const actual: string = TimeUtils.getNextYearMonth(13, 1);
      logInfo(`getNextYearMonth(year=13, month=1): actual=${actual}`);
      expect(actual).assertEqual('13-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0067 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0068
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0068
     * @tc.desc      getNextYearMonth(year=13, month=2) returns "13-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0068 begin`);
      const actual: string = TimeUtils.getNextYearMonth(13, 2);
      logInfo(`getNextYearMonth(year=13, month=2): actual=${actual}`);
      expect(actual).assertEqual('13-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0068 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0069
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0069
     * @tc.desc      getNextYearMonth(year=13, month=12) returns "14-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0069 begin`);
      const actual: string = TimeUtils.getNextYearMonth(13, 12);
      logInfo(`getNextYearMonth(year=13, month=12): actual=${actual}`);
      expect(actual).assertEqual('14-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0069 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0070
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0070
     * @tc.desc      getNextYearMonth(year=13, month=11) returns "13-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0070 begin`);
      const actual: string = TimeUtils.getNextYearMonth(13, 11);
      logInfo(`getNextYearMonth(year=13, month=11): actual=${actual}`);
      expect(actual).assertEqual('13-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0070 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0071
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0071
     * @tc.desc      getNextYearMonth(year=13, month=6) returns "13-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0071 begin`);
      const actual: string = TimeUtils.getNextYearMonth(13, 6);
      logInfo(`getNextYearMonth(year=13, month=6): actual=${actual}`);
      expect(actual).assertEqual('13-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0071 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0072
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0072
     * @tc.desc      getNextYearMonth(year=13, month=-1) returns "13-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0072 begin`);
      const actual: string = TimeUtils.getNextYearMonth(13, -1);
      logInfo(`getNextYearMonth(year=13, month=-1): actual=${actual}`);
      expect(actual).assertEqual('13-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0072 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0073
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0073
     * @tc.desc      getNextYearMonth(year=13, month=3) returns "13-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0073 begin`);
      const actual: string = TimeUtils.getNextYearMonth(13, 3);
      logInfo(`getNextYearMonth(year=13, month=3): actual=${actual}`);
      expect(actual).assertEqual('13-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0073 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0074
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0074
     * @tc.desc      getNextYearMonth(year=13, month=10) returns "13-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0074 begin`);
      const actual: string = TimeUtils.getNextYearMonth(13, 10);
      logInfo(`getNextYearMonth(year=13, month=10): actual=${actual}`);
      expect(actual).assertEqual('13-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0074 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0075
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0075
     * @tc.desc      getNextYearMonth(year=13, month=5) returns "13-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0075 begin`);
      const actual: string = TimeUtils.getNextYearMonth(13, 5);
      logInfo(`getNextYearMonth(year=13, month=5): actual=${actual}`);
      expect(actual).assertEqual('13-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0075 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0076
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0076
     * @tc.desc      getNextYearMonth(year=24, month=1) returns "24-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0076 begin`);
      const actual: string = TimeUtils.getNextYearMonth(24, 1);
      logInfo(`getNextYearMonth(year=24, month=1): actual=${actual}`);
      expect(actual).assertEqual('24-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0076 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0077
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0077
     * @tc.desc      getNextYearMonth(year=24, month=2) returns "24-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0077 begin`);
      const actual: string = TimeUtils.getNextYearMonth(24, 2);
      logInfo(`getNextYearMonth(year=24, month=2): actual=${actual}`);
      expect(actual).assertEqual('24-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0077 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0078
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0078
     * @tc.desc      getNextYearMonth(year=24, month=0) returns "24-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0078 begin`);
      const actual: string = TimeUtils.getNextYearMonth(24, 0);
      logInfo(`getNextYearMonth(year=24, month=0): actual=${actual}`);
      expect(actual).assertEqual('24-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0078 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0079
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0079
     * @tc.desc      getNextYearMonth(year=24, month=12) returns "25-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0079 begin`);
      const actual: string = TimeUtils.getNextYearMonth(24, 12);
      logInfo(`getNextYearMonth(year=24, month=12): actual=${actual}`);
      expect(actual).assertEqual('25-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0079 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0080
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0080
     * @tc.desc      getNextYearMonth(year=24, month=11) returns "24-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0080 begin`);
      const actual: string = TimeUtils.getNextYearMonth(24, 11);
      logInfo(`getNextYearMonth(year=24, month=11): actual=${actual}`);
      expect(actual).assertEqual('24-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0080 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0081
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0081
     * @tc.desc      getNextYearMonth(year=24, month=6) returns "24-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0081 begin`);
      const actual: string = TimeUtils.getNextYearMonth(24, 6);
      logInfo(`getNextYearMonth(year=24, month=6): actual=${actual}`);
      expect(actual).assertEqual('24-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0081 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0082
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0082
     * @tc.desc      getNextYearMonth(year=24, month=-1) returns "24-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0082 begin`);
      const actual: string = TimeUtils.getNextYearMonth(24, -1);
      logInfo(`getNextYearMonth(year=24, month=-1): actual=${actual}`);
      expect(actual).assertEqual('24-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0082 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0083
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0083
     * @tc.desc      getNextYearMonth(year=24, month=3) returns "24-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0083 begin`);
      const actual: string = TimeUtils.getNextYearMonth(24, 3);
      logInfo(`getNextYearMonth(year=24, month=3): actual=${actual}`);
      expect(actual).assertEqual('24-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0083 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0084
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0084
     * @tc.desc      getNextYearMonth(year=24, month=10) returns "24-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0084 begin`);
      const actual: string = TimeUtils.getNextYearMonth(24, 10);
      logInfo(`getNextYearMonth(year=24, month=10): actual=${actual}`);
      expect(actual).assertEqual('24-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0084 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0085
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0085
     * @tc.desc      getNextYearMonth(year=24, month=5) returns "24-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0085 begin`);
      const actual: string = TimeUtils.getNextYearMonth(24, 5);
      logInfo(`getNextYearMonth(year=24, month=5): actual=${actual}`);
      expect(actual).assertEqual('24-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0085 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0086
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0086
     * @tc.desc      getNextYearMonth(year=6, month=1) returns "6-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0086 begin`);
      const actual: string = TimeUtils.getNextYearMonth(6, 1);
      logInfo(`getNextYearMonth(year=6, month=1): actual=${actual}`);
      expect(actual).assertEqual('6-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0086 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0087
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0087
     * @tc.desc      getNextYearMonth(year=6, month=2) returns "6-3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0087 begin`);
      const actual: string = TimeUtils.getNextYearMonth(6, 2);
      logInfo(`getNextYearMonth(year=6, month=2): actual=${actual}`);
      expect(actual).assertEqual('6-3');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0087 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0088
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0088
     * @tc.desc      getNextYearMonth(year=6, month=0) returns "6-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0088 begin`);
      const actual: string = TimeUtils.getNextYearMonth(6, 0);
      logInfo(`getNextYearMonth(year=6, month=0): actual=${actual}`);
      expect(actual).assertEqual('6-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0088 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0089
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0089
     * @tc.desc      getNextYearMonth(year=6, month=12) returns "7-1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0089 begin`);
      const actual: string = TimeUtils.getNextYearMonth(6, 12);
      logInfo(`getNextYearMonth(year=6, month=12): actual=${actual}`);
      expect(actual).assertEqual('7-1');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0089 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0090
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0090
     * @tc.desc      getNextYearMonth(year=6, month=11) returns "6-12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0090 begin`);
      const actual: string = TimeUtils.getNextYearMonth(6, 11);
      logInfo(`getNextYearMonth(year=6, month=11): actual=${actual}`);
      expect(actual).assertEqual('6-12');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0090 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0091
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0091
     * @tc.desc      getNextYearMonth(year=6, month=6) returns "6-7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0091 begin`);
      const actual: string = TimeUtils.getNextYearMonth(6, 6);
      logInfo(`getNextYearMonth(year=6, month=6): actual=${actual}`);
      expect(actual).assertEqual('6-7');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0091 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0092
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0092
     * @tc.desc      getNextYearMonth(year=6, month=-1) returns "6-0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0092 begin`);
      const actual: string = TimeUtils.getNextYearMonth(6, -1);
      logInfo(`getNextYearMonth(year=6, month=-1): actual=${actual}`);
      expect(actual).assertEqual('6-0');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0092 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0093
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0093
     * @tc.desc      getNextYearMonth(year=6, month=3) returns "6-4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0093 begin`);
      const actual: string = TimeUtils.getNextYearMonth(6, 3);
      logInfo(`getNextYearMonth(year=6, month=3): actual=${actual}`);
      expect(actual).assertEqual('6-4');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0093 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0094
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0094
     * @tc.desc      getNextYearMonth(year=6, month=10) returns "6-11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0094 begin`);
      const actual: string = TimeUtils.getNextYearMonth(6, 10);
      logInfo(`getNextYearMonth(year=6, month=10): actual=${actual}`);
      expect(actual).assertEqual('6-11');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0094 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0095
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0095
     * @tc.desc      getNextYearMonth(year=6, month=5) returns "6-6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0095 begin`);
      const actual: string = TimeUtils.getNextYearMonth(6, 5);
      logInfo(`getNextYearMonth(year=6, month=5): actual=${actual}`);
      expect(actual).assertEqual('6-6');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0095 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_MONTH_0096
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYearMonth_0096
     * @tc.desc      getNextYearMonth(year=2000, month=1) returns "2000-2"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYearMonth_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0096 begin`);
      const actual: string = TimeUtils.getNextYearMonth(2000, 1);
      logInfo(`getNextYearMonth(year=2000, month=1): actual=${actual}`);
      expect(actual).assertEqual('2000-2');
      logInfo(`${BUNDLE}TimeUtilsGetNextYearMonth_0096 end`);
    });
  });
}
