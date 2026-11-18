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

/** Logic checks for TimeUtils.getLastYear (96 cases). */
export default function timeUtilsGetLastYearTest(): void {
  describe('TimeUtilsGetLastYearTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0001
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0001
     * @tc.desc      getLastYear(year=2024, month=1) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0001 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 1);
      logInfo(`getLastYear(year=2024, month=1): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0002
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0002
     * @tc.desc      getLastYear(year=2024, month=2) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0002 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 2);
      logInfo(`getLastYear(year=2024, month=2): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0003
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0003
     * @tc.desc      getLastYear(year=2023, month=1) returns 2022
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0003 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 1);
      logInfo(`getLastYear(year=2023, month=1): actual=${actual}`);
      expect(actual).assertEqual(2022);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0004
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0004
     * @tc.desc      getLastYear(year=1, month=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0004 begin`);
      const actual: number = TimeUtils.getLastYear(1, 1);
      logInfo(`getLastYear(year=1, month=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0005
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0005
     * @tc.desc      getLastYear(year=1, month=2) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0005 begin`);
      const actual: number = TimeUtils.getLastYear(1, 2);
      logInfo(`getLastYear(year=1, month=2): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0005 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0006
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0006
     * @tc.desc      getLastYear(year=0, month=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0006 begin`);
      const actual: number = TimeUtils.getLastYear(0, 1);
      logInfo(`getLastYear(year=0, month=1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0006 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0007
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0007
     * @tc.desc      getLastYear(year=2, month=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0007 begin`);
      const actual: number = TimeUtils.getLastYear(2, 2);
      logInfo(`getLastYear(year=2, month=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0007 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0008
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0008
     * @tc.desc      getLastYear(year=2000, month=1) returns 1999
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0008 begin`);
      const actual: number = TimeUtils.getLastYear(2000, 1);
      logInfo(`getLastYear(year=2000, month=1): actual=${actual}`);
      expect(actual).assertEqual(1999);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0008 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0009
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0009
     * @tc.desc      getLastYear(year=2000, month=2) returns 2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0009 begin`);
      const actual: number = TimeUtils.getLastYear(2000, 2);
      logInfo(`getLastYear(year=2000, month=2): actual=${actual}`);
      expect(actual).assertEqual(2000);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0009 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0010
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0010
     * @tc.desc      getLastYear(year=1900, month=1) returns 1899
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0010 begin`);
      const actual: number = TimeUtils.getLastYear(1900, 1);
      logInfo(`getLastYear(year=1900, month=1): actual=${actual}`);
      expect(actual).assertEqual(1899);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0010 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0011
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0011
     * @tc.desc      getLastYear(year=1900, month=2) returns 1900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0011 begin`);
      const actual: number = TimeUtils.getLastYear(1900, 2);
      logInfo(`getLastYear(year=1900, month=2): actual=${actual}`);
      expect(actual).assertEqual(1900);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0011 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0012
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0012
     * @tc.desc      getLastYear(year=2100, month=1) returns 2099
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0012 begin`);
      const actual: number = TimeUtils.getLastYear(2100, 1);
      logInfo(`getLastYear(year=2100, month=1): actual=${actual}`);
      expect(actual).assertEqual(2099);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0012 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0013
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0013
     * @tc.desc      getLastYear(year=2100, month=2) returns 2100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0013 begin`);
      const actual: number = TimeUtils.getLastYear(2100, 2);
      logInfo(`getLastYear(year=2100, month=2): actual=${actual}`);
      expect(actual).assertEqual(2100);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0013 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0014
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0014
     * @tc.desc      getLastYear(year=1970, month=1) returns 1969
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0014 begin`);
      const actual: number = TimeUtils.getLastYear(1970, 1);
      logInfo(`getLastYear(year=1970, month=1): actual=${actual}`);
      expect(actual).assertEqual(1969);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0014 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0015
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0015
     * @tc.desc      getLastYear(year=1970, month=2) returns 1970
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0015 begin`);
      const actual: number = TimeUtils.getLastYear(1970, 2);
      logInfo(`getLastYear(year=1970, month=2): actual=${actual}`);
      expect(actual).assertEqual(1970);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0015 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0016
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0016
     * @tc.desc      getLastYear(year=2025, month=2) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0016 begin`);
      const actual: number = TimeUtils.getLastYear(2025, 2);
      logInfo(`getLastYear(year=2025, month=2): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0016 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0017
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0017
     * @tc.desc      getLastYear(year=-1, month=1) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0017 begin`);
      const actual: number = TimeUtils.getLastYear(-1, 1);
      logInfo(`getLastYear(year=-1, month=1): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0017 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0018
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0018
     * @tc.desc      getLastYear(year=3, month=2) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0018 begin`);
      const actual: number = TimeUtils.getLastYear(3, 2);
      logInfo(`getLastYear(year=3, month=2): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0018 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0019
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0019
     * @tc.desc      getLastYear(year=10, month=1) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0019 begin`);
      const actual: number = TimeUtils.getLastYear(10, 1);
      logInfo(`getLastYear(year=10, month=1): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0019 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0020
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0020
     * @tc.desc      getLastYear(year=10, month=2) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0020 begin`);
      const actual: number = TimeUtils.getLastYear(10, 2);
      logInfo(`getLastYear(year=10, month=2): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0020 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0021
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0021
     * @tc.desc      getLastYear(year=100, month=1) returns 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0021 begin`);
      const actual: number = TimeUtils.getLastYear(100, 1);
      logInfo(`getLastYear(year=100, month=1): actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0021 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0022
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0022
     * @tc.desc      getLastYear(year=100, month=2) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0022 begin`);
      const actual: number = TimeUtils.getLastYear(100, 2);
      logInfo(`getLastYear(year=100, month=2): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0022 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0023
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0023
     * @tc.desc      getLastYear(year=105, month=1) returns 104
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0023 begin`);
      const actual: number = TimeUtils.getLastYear(105, 1);
      logInfo(`getLastYear(year=105, month=1): actual=${actual}`);
      expect(actual).assertEqual(104);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0023 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0024
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0024
     * @tc.desc      getLastYear(year=105, month=2) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0024 begin`);
      const actual: number = TimeUtils.getLastYear(105, 2);
      logInfo(`getLastYear(year=105, month=2): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0024 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0025
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0025
     * @tc.desc      getLastYear(year=210, month=1) returns 209
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0025 begin`);
      const actual: number = TimeUtils.getLastYear(210, 1);
      logInfo(`getLastYear(year=210, month=1): actual=${actual}`);
      expect(actual).assertEqual(209);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0025 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0026
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0026
     * @tc.desc      getLastYear(year=210, month=2) returns 210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0026 begin`);
      const actual: number = TimeUtils.getLastYear(210, 2);
      logInfo(`getLastYear(year=210, month=2): actual=${actual}`);
      expect(actual).assertEqual(210);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0026 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0027
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0027
     * @tc.desc      getLastYear(year=315, month=1) returns 314
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0027 begin`);
      const actual: number = TimeUtils.getLastYear(315, 1);
      logInfo(`getLastYear(year=315, month=1): actual=${actual}`);
      expect(actual).assertEqual(314);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0027 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0028
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0028
     * @tc.desc      getLastYear(year=315, month=2) returns 315
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0028 begin`);
      const actual: number = TimeUtils.getLastYear(315, 2);
      logInfo(`getLastYear(year=315, month=2): actual=${actual}`);
      expect(actual).assertEqual(315);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0028 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0029
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0029
     * @tc.desc      getLastYear(year=420, month=1) returns 419
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0029 begin`);
      const actual: number = TimeUtils.getLastYear(420, 1);
      logInfo(`getLastYear(year=420, month=1): actual=${actual}`);
      expect(actual).assertEqual(419);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0029 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0030
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0030
     * @tc.desc      getLastYear(year=420, month=2) returns 420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0030 begin`);
      const actual: number = TimeUtils.getLastYear(420, 2);
      logInfo(`getLastYear(year=420, month=2): actual=${actual}`);
      expect(actual).assertEqual(420);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0030 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0031
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0031
     * @tc.desc      getLastYear(year=525, month=1) returns 524
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0031 begin`);
      const actual: number = TimeUtils.getLastYear(525, 1);
      logInfo(`getLastYear(year=525, month=1): actual=${actual}`);
      expect(actual).assertEqual(524);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0031 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0032
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0032
     * @tc.desc      getLastYear(year=525, month=2) returns 525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0032 begin`);
      const actual: number = TimeUtils.getLastYear(525, 2);
      logInfo(`getLastYear(year=525, month=2): actual=${actual}`);
      expect(actual).assertEqual(525);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0032 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0033
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0033
     * @tc.desc      getLastYear(year=630, month=1) returns 629
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0033 begin`);
      const actual: number = TimeUtils.getLastYear(630, 1);
      logInfo(`getLastYear(year=630, month=1): actual=${actual}`);
      expect(actual).assertEqual(629);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0033 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0034
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0034
     * @tc.desc      getLastYear(year=630, month=2) returns 630
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0034 begin`);
      const actual: number = TimeUtils.getLastYear(630, 2);
      logInfo(`getLastYear(year=630, month=2): actual=${actual}`);
      expect(actual).assertEqual(630);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0034 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0035
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0035
     * @tc.desc      getLastYear(year=735, month=1) returns 734
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0035 begin`);
      const actual: number = TimeUtils.getLastYear(735, 1);
      logInfo(`getLastYear(year=735, month=1): actual=${actual}`);
      expect(actual).assertEqual(734);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0035 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0036
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0036
     * @tc.desc      getLastYear(year=735, month=2) returns 735
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0036 begin`);
      const actual: number = TimeUtils.getLastYear(735, 2);
      logInfo(`getLastYear(year=735, month=2): actual=${actual}`);
      expect(actual).assertEqual(735);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0036 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0037
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0037
     * @tc.desc      getLastYear(year=840, month=1) returns 839
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0037 begin`);
      const actual: number = TimeUtils.getLastYear(840, 1);
      logInfo(`getLastYear(year=840, month=1): actual=${actual}`);
      expect(actual).assertEqual(839);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0037 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0038
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0038
     * @tc.desc      getLastYear(year=840, month=2) returns 840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0038 begin`);
      const actual: number = TimeUtils.getLastYear(840, 2);
      logInfo(`getLastYear(year=840, month=2): actual=${actual}`);
      expect(actual).assertEqual(840);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0038 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0039
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0039
     * @tc.desc      getLastYear(year=945, month=1) returns 944
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0039 begin`);
      const actual: number = TimeUtils.getLastYear(945, 1);
      logInfo(`getLastYear(year=945, month=1): actual=${actual}`);
      expect(actual).assertEqual(944);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0039 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0040
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0040
     * @tc.desc      getLastYear(year=945, month=2) returns 945
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0040 begin`);
      const actual: number = TimeUtils.getLastYear(945, 2);
      logInfo(`getLastYear(year=945, month=2): actual=${actual}`);
      expect(actual).assertEqual(945);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0040 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0041
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0041
     * @tc.desc      getLastYear(year=1050, month=1) returns 1049
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0041 begin`);
      const actual: number = TimeUtils.getLastYear(1050, 1);
      logInfo(`getLastYear(year=1050, month=1): actual=${actual}`);
      expect(actual).assertEqual(1049);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0041 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0042
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0042
     * @tc.desc      getLastYear(year=1050, month=2) returns 1050
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0042 begin`);
      const actual: number = TimeUtils.getLastYear(1050, 2);
      logInfo(`getLastYear(year=1050, month=2): actual=${actual}`);
      expect(actual).assertEqual(1050);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0042 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0043
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0043
     * @tc.desc      getLastYear(year=1155, month=1) returns 1154
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0043 begin`);
      const actual: number = TimeUtils.getLastYear(1155, 1);
      logInfo(`getLastYear(year=1155, month=1): actual=${actual}`);
      expect(actual).assertEqual(1154);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0043 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0044
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0044
     * @tc.desc      getLastYear(year=1155, month=2) returns 1155
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0044 begin`);
      const actual: number = TimeUtils.getLastYear(1155, 2);
      logInfo(`getLastYear(year=1155, month=2): actual=${actual}`);
      expect(actual).assertEqual(1155);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0044 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0045
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0045
     * @tc.desc      getLastYear(year=1260, month=1) returns 1259
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0045 begin`);
      const actual: number = TimeUtils.getLastYear(1260, 1);
      logInfo(`getLastYear(year=1260, month=1): actual=${actual}`);
      expect(actual).assertEqual(1259);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0045 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0046
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0046
     * @tc.desc      getLastYear(year=1260, month=2) returns 1260
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0046 begin`);
      const actual: number = TimeUtils.getLastYear(1260, 2);
      logInfo(`getLastYear(year=1260, month=2): actual=${actual}`);
      expect(actual).assertEqual(1260);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0046 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0047
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0047
     * @tc.desc      getLastYear(year=1365, month=1) returns 1364
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0047 begin`);
      const actual: number = TimeUtils.getLastYear(1365, 1);
      logInfo(`getLastYear(year=1365, month=1): actual=${actual}`);
      expect(actual).assertEqual(1364);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0047 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0048
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0048
     * @tc.desc      getLastYear(year=1365, month=2) returns 1365
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0048 begin`);
      const actual: number = TimeUtils.getLastYear(1365, 2);
      logInfo(`getLastYear(year=1365, month=2): actual=${actual}`);
      expect(actual).assertEqual(1365);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0048 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0049
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0049
     * @tc.desc      getLastYear(year=2024, month=0) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0049 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 0);
      logInfo(`getLastYear(year=2024, month=0): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0049 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0050
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0050
     * @tc.desc      getLastYear(year=2024, month=6) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0050 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 6);
      logInfo(`getLastYear(year=2024, month=6): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0050 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0051
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0051
     * @tc.desc      getLastYear(year=2024, month=12) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0051 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 12);
      logInfo(`getLastYear(year=2024, month=12): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0051 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0052
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0052
     * @tc.desc      getLastYear(year=2024, month=13) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0052 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 13);
      logInfo(`getLastYear(year=2024, month=13): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0052 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0053
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0053
     * @tc.desc      getLastYear(year=2024, month=-1) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0053 begin`);
      const actual: number = TimeUtils.getLastYear(2024, -1);
      logInfo(`getLastYear(year=2024, month=-1): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0053 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0054
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0054
     * @tc.desc      getLastYear(year=2024, month=3) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0054 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 3);
      logInfo(`getLastYear(year=2024, month=3): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0054 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0055
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0055
     * @tc.desc      getLastYear(year=2024, month=10) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0055 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 10);
      logInfo(`getLastYear(year=2024, month=10): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0055 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0056
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0056
     * @tc.desc      getLastYear(year=2024, month=100) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0056 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 100);
      logInfo(`getLastYear(year=2024, month=100): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0056 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0057
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0057
     * @tc.desc      getLastYear(year=2024, month=5) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0057 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 5);
      logInfo(`getLastYear(year=2024, month=5): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0057 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0058
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0058
     * @tc.desc      getLastYear(year=2024, month=15) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0058 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 15);
      logInfo(`getLastYear(year=2024, month=15): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0058 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0059
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0059
     * @tc.desc      getLastYear(year=2024, month=20) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0059 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 20);
      logInfo(`getLastYear(year=2024, month=20): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0059 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0060
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0060
     * @tc.desc      getLastYear(year=2024, month=25) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0060 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 25);
      logInfo(`getLastYear(year=2024, month=25): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0060 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0061
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0061
     * @tc.desc      getLastYear(year=2024, month=30) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0061 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 30);
      logInfo(`getLastYear(year=2024, month=30): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0061 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0062
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0062
     * @tc.desc      getLastYear(year=2024, month=35) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0062 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 35);
      logInfo(`getLastYear(year=2024, month=35): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0062 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0063
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0063
     * @tc.desc      getLastYear(year=2024, month=40) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0063 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 40);
      logInfo(`getLastYear(year=2024, month=40): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0063 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0064
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0064
     * @tc.desc      getLastYear(year=2024, month=45) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0064 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 45);
      logInfo(`getLastYear(year=2024, month=45): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0064 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0065
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0065
     * @tc.desc      getLastYear(year=2024, month=50) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0065 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 50);
      logInfo(`getLastYear(year=2024, month=50): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0065 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0066
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0066
     * @tc.desc      getLastYear(year=2024, month=55) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0066 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 55);
      logInfo(`getLastYear(year=2024, month=55): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0066 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0067
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0067
     * @tc.desc      getLastYear(year=2024, month=60) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0067 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 60);
      logInfo(`getLastYear(year=2024, month=60): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0067 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0068
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0068
     * @tc.desc      getLastYear(year=2024, month=65) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0068 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 65);
      logInfo(`getLastYear(year=2024, month=65): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0068 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0069
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0069
     * @tc.desc      getLastYear(year=2024, month=70) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0069 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 70);
      logInfo(`getLastYear(year=2024, month=70): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0069 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0070
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0070
     * @tc.desc      getLastYear(year=2024, month=75) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0070 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 75);
      logInfo(`getLastYear(year=2024, month=75): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0070 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0071
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0071
     * @tc.desc      getLastYear(year=2024, month=80) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0071 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 80);
      logInfo(`getLastYear(year=2024, month=80): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0071 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0072
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0072
     * @tc.desc      getLastYear(year=2024, month=85) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0072 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 85);
      logInfo(`getLastYear(year=2024, month=85): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0072 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0073
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0073
     * @tc.desc      getLastYear(year=2024, month=90) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0073 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 90);
      logInfo(`getLastYear(year=2024, month=90): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0073 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0074
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0074
     * @tc.desc      getLastYear(year=2024, month=95) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0074 begin`);
      const actual: number = TimeUtils.getLastYear(2024, 95);
      logInfo(`getLastYear(year=2024, month=95): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0074 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0075
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0075
     * @tc.desc      getLastYear(year=2024, month=-5) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0075 begin`);
      const actual: number = TimeUtils.getLastYear(2024, -5);
      logInfo(`getLastYear(year=2024, month=-5): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0075 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0076
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0076
     * @tc.desc      getLastYear(year=2024, month=-87) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0076 begin`);
      const actual: number = TimeUtils.getLastYear(2024, -87);
      logInfo(`getLastYear(year=2024, month=-87): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0076 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0077
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0077
     * @tc.desc      getLastYear(year=2023, month=2) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0077 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 2);
      logInfo(`getLastYear(year=2023, month=2): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0077 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0078
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0078
     * @tc.desc      getLastYear(year=2023, month=0) returns 2022
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0078 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 0);
      logInfo(`getLastYear(year=2023, month=0): actual=${actual}`);
      expect(actual).assertEqual(2022);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0078 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0079
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0079
     * @tc.desc      getLastYear(year=2023, month=6) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0079 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 6);
      logInfo(`getLastYear(year=2023, month=6): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0079 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0080
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0080
     * @tc.desc      getLastYear(year=2023, month=12) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0080 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 12);
      logInfo(`getLastYear(year=2023, month=12): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0080 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0081
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0081
     * @tc.desc      getLastYear(year=2023, month=13) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0081 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 13);
      logInfo(`getLastYear(year=2023, month=13): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0081 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0082
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0082
     * @tc.desc      getLastYear(year=2023, month=-1) returns 2022
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0082 begin`);
      const actual: number = TimeUtils.getLastYear(2023, -1);
      logInfo(`getLastYear(year=2023, month=-1): actual=${actual}`);
      expect(actual).assertEqual(2022);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0082 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0083
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0083
     * @tc.desc      getLastYear(year=2023, month=3) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0083 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 3);
      logInfo(`getLastYear(year=2023, month=3): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0083 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0084
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0084
     * @tc.desc      getLastYear(year=2023, month=10) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0084 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 10);
      logInfo(`getLastYear(year=2023, month=10): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0084 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0085
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0085
     * @tc.desc      getLastYear(year=2023, month=100) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0085 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 100);
      logInfo(`getLastYear(year=2023, month=100): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0085 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0086
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0086
     * @tc.desc      getLastYear(year=2023, month=5) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0086 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 5);
      logInfo(`getLastYear(year=2023, month=5): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0086 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0087
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0087
     * @tc.desc      getLastYear(year=2023, month=15) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0087 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 15);
      logInfo(`getLastYear(year=2023, month=15): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0087 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0088
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0088
     * @tc.desc      getLastYear(year=2023, month=20) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0088 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 20);
      logInfo(`getLastYear(year=2023, month=20): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0088 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0089
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0089
     * @tc.desc      getLastYear(year=2023, month=25) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0089 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 25);
      logInfo(`getLastYear(year=2023, month=25): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0089 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0090
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0090
     * @tc.desc      getLastYear(year=2023, month=30) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0090 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 30);
      logInfo(`getLastYear(year=2023, month=30): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0090 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0091
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0091
     * @tc.desc      getLastYear(year=2023, month=35) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0091 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 35);
      logInfo(`getLastYear(year=2023, month=35): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0091 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0092
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0092
     * @tc.desc      getLastYear(year=2023, month=40) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0092 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 40);
      logInfo(`getLastYear(year=2023, month=40): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0092 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0093
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0093
     * @tc.desc      getLastYear(year=2023, month=45) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0093 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 45);
      logInfo(`getLastYear(year=2023, month=45): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0093 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0094
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0094
     * @tc.desc      getLastYear(year=2023, month=50) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0094 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 50);
      logInfo(`getLastYear(year=2023, month=50): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0094 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0095
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0095
     * @tc.desc      getLastYear(year=2023, month=55) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0095 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 55);
      logInfo(`getLastYear(year=2023, month=55): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0095 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_YEAR_0096
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastYear_0096
     * @tc.desc      getLastYear(year=2023, month=60) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetLastYear_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0096 begin`);
      const actual: number = TimeUtils.getLastYear(2023, 60);
      logInfo(`getLastYear(year=2023, month=60): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetLastYear_0096 end`);
    });
  });
}
