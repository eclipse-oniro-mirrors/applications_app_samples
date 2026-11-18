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

/** Logic checks for TimeUtils.getNextYear (96 cases). */
export default function timeUtilsGetNextYearTest(): void {
  describe('TimeUtilsGetNextYearTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0001
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0001
     * @tc.desc      getNextYear(year=2024, month=1) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0001 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 1);
      logInfo(`getNextYear(year=2024, month=1): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0002
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0002
     * @tc.desc      getNextYear(year=2024, month=12) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0002 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 12);
      logInfo(`getNextYear(year=2024, month=12): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0003
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0003
     * @tc.desc      getNextYear(year=2023, month=1) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0003 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 1);
      logInfo(`getNextYear(year=2023, month=1): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0004
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0004
     * @tc.desc      getNextYear(year=1, month=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0004 begin`);
      const actual: number = TimeUtils.getNextYear(1, 1);
      logInfo(`getNextYear(year=1, month=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0005
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0005
     * @tc.desc      getNextYear(year=1, month=12) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0005 begin`);
      const actual: number = TimeUtils.getNextYear(1, 12);
      logInfo(`getNextYear(year=1, month=12): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0005 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0006
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0006
     * @tc.desc      getNextYear(year=0, month=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0006 begin`);
      const actual: number = TimeUtils.getNextYear(0, 1);
      logInfo(`getNextYear(year=0, month=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0006 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0007
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0007
     * @tc.desc      getNextYear(year=2, month=12) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0007 begin`);
      const actual: number = TimeUtils.getNextYear(2, 12);
      logInfo(`getNextYear(year=2, month=12): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0007 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0008
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0008
     * @tc.desc      getNextYear(year=12, month=1) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0008 begin`);
      const actual: number = TimeUtils.getNextYear(12, 1);
      logInfo(`getNextYear(year=12, month=1): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0008 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0009
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0009
     * @tc.desc      getNextYear(year=12, month=12) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0009 begin`);
      const actual: number = TimeUtils.getNextYear(12, 12);
      logInfo(`getNextYear(year=12, month=12): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0009 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0010
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0010
     * @tc.desc      getNextYear(year=11, month=1) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0010 begin`);
      const actual: number = TimeUtils.getNextYear(11, 1);
      logInfo(`getNextYear(year=11, month=1): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0010 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0011
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0011
     * @tc.desc      getNextYear(year=13, month=12) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0011 begin`);
      const actual: number = TimeUtils.getNextYear(13, 12);
      logInfo(`getNextYear(year=13, month=12): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0011 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0012
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0012
     * @tc.desc      getNextYear(year=24, month=1) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0012 begin`);
      const actual: number = TimeUtils.getNextYear(24, 1);
      logInfo(`getNextYear(year=24, month=1): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0012 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0013
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0013
     * @tc.desc      getNextYear(year=24, month=12) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0013 begin`);
      const actual: number = TimeUtils.getNextYear(24, 12);
      logInfo(`getNextYear(year=24, month=12): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0013 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0014
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0014
     * @tc.desc      getNextYear(year=6, month=1) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0014 begin`);
      const actual: number = TimeUtils.getNextYear(6, 1);
      logInfo(`getNextYear(year=6, month=1): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0014 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0015
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0015
     * @tc.desc      getNextYear(year=6, month=12) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0015 begin`);
      const actual: number = TimeUtils.getNextYear(6, 12);
      logInfo(`getNextYear(year=6, month=12): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0015 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0016
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0016
     * @tc.desc      getNextYear(year=2000, month=1) returns 2000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0016 begin`);
      const actual: number = TimeUtils.getNextYear(2000, 1);
      logInfo(`getNextYear(year=2000, month=1): actual=${actual}`);
      expect(actual).assertEqual(2000);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0016 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0017
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0017
     * @tc.desc      getNextYear(year=2000, month=12) returns 2001
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0017 begin`);
      const actual: number = TimeUtils.getNextYear(2000, 12);
      logInfo(`getNextYear(year=2000, month=12): actual=${actual}`);
      expect(actual).assertEqual(2001);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0017 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0018
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0018
     * @tc.desc      getNextYear(year=1900, month=1) returns 1900
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0018 begin`);
      const actual: number = TimeUtils.getNextYear(1900, 1);
      logInfo(`getNextYear(year=1900, month=1): actual=${actual}`);
      expect(actual).assertEqual(1900);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0018 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0019
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0019
     * @tc.desc      getNextYear(year=1900, month=12) returns 1901
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0019 begin`);
      const actual: number = TimeUtils.getNextYear(1900, 12);
      logInfo(`getNextYear(year=1900, month=12): actual=${actual}`);
      expect(actual).assertEqual(1901);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0019 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0020
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0020
     * @tc.desc      getNextYear(year=2100, month=1) returns 2100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0020 begin`);
      const actual: number = TimeUtils.getNextYear(2100, 1);
      logInfo(`getNextYear(year=2100, month=1): actual=${actual}`);
      expect(actual).assertEqual(2100);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0020 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0021
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0021
     * @tc.desc      getNextYear(year=2100, month=12) returns 2101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0021 begin`);
      const actual: number = TimeUtils.getNextYear(2100, 12);
      logInfo(`getNextYear(year=2100, month=12): actual=${actual}`);
      expect(actual).assertEqual(2101);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0021 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0022
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0022
     * @tc.desc      getNextYear(year=1970, month=1) returns 1970
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0022 begin`);
      const actual: number = TimeUtils.getNextYear(1970, 1);
      logInfo(`getNextYear(year=1970, month=1): actual=${actual}`);
      expect(actual).assertEqual(1970);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0022 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0023
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0023
     * @tc.desc      getNextYear(year=1970, month=12) returns 1971
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0023 begin`);
      const actual: number = TimeUtils.getNextYear(1970, 12);
      logInfo(`getNextYear(year=1970, month=12): actual=${actual}`);
      expect(actual).assertEqual(1971);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0023 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0024
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0024
     * @tc.desc      getNextYear(year=2025, month=12) returns 2026
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0024 begin`);
      const actual: number = TimeUtils.getNextYear(2025, 12);
      logInfo(`getNextYear(year=2025, month=12): actual=${actual}`);
      expect(actual).assertEqual(2026);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0024 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0025
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0025
     * @tc.desc      getNextYear(year=-1, month=1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0025 begin`);
      const actual: number = TimeUtils.getNextYear(-1, 1);
      logInfo(`getNextYear(year=-1, month=1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0025 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0026
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0026
     * @tc.desc      getNextYear(year=3, month=12) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0026 begin`);
      const actual: number = TimeUtils.getNextYear(3, 12);
      logInfo(`getNextYear(year=3, month=12): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0026 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0027
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0027
     * @tc.desc      getNextYear(year=10, month=1) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0027 begin`);
      const actual: number = TimeUtils.getNextYear(10, 1);
      logInfo(`getNextYear(year=10, month=1): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0027 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0028
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0028
     * @tc.desc      getNextYear(year=100, month=1) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0028 begin`);
      const actual: number = TimeUtils.getNextYear(100, 1);
      logInfo(`getNextYear(year=100, month=1): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0028 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0029
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0029
     * @tc.desc      getNextYear(year=100, month=12) returns 101
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0029 begin`);
      const actual: number = TimeUtils.getNextYear(100, 12);
      logInfo(`getNextYear(year=100, month=12): actual=${actual}`);
      expect(actual).assertEqual(101);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0029 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0030
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0030
     * @tc.desc      getNextYear(year=105, month=1) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0030 begin`);
      const actual: number = TimeUtils.getNextYear(105, 1);
      logInfo(`getNextYear(year=105, month=1): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0030 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0031
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0031
     * @tc.desc      getNextYear(year=105, month=12) returns 106
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0031 begin`);
      const actual: number = TimeUtils.getNextYear(105, 12);
      logInfo(`getNextYear(year=105, month=12): actual=${actual}`);
      expect(actual).assertEqual(106);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0031 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0032
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0032
     * @tc.desc      getNextYear(year=210, month=1) returns 210
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0032 begin`);
      const actual: number = TimeUtils.getNextYear(210, 1);
      logInfo(`getNextYear(year=210, month=1): actual=${actual}`);
      expect(actual).assertEqual(210);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0032 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0033
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0033
     * @tc.desc      getNextYear(year=210, month=12) returns 211
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0033 begin`);
      const actual: number = TimeUtils.getNextYear(210, 12);
      logInfo(`getNextYear(year=210, month=12): actual=${actual}`);
      expect(actual).assertEqual(211);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0033 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0034
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0034
     * @tc.desc      getNextYear(year=315, month=1) returns 315
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0034 begin`);
      const actual: number = TimeUtils.getNextYear(315, 1);
      logInfo(`getNextYear(year=315, month=1): actual=${actual}`);
      expect(actual).assertEqual(315);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0034 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0035
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0035
     * @tc.desc      getNextYear(year=315, month=12) returns 316
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0035 begin`);
      const actual: number = TimeUtils.getNextYear(315, 12);
      logInfo(`getNextYear(year=315, month=12): actual=${actual}`);
      expect(actual).assertEqual(316);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0035 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0036
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0036
     * @tc.desc      getNextYear(year=420, month=1) returns 420
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0036 begin`);
      const actual: number = TimeUtils.getNextYear(420, 1);
      logInfo(`getNextYear(year=420, month=1): actual=${actual}`);
      expect(actual).assertEqual(420);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0036 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0037
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0037
     * @tc.desc      getNextYear(year=420, month=12) returns 421
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0037 begin`);
      const actual: number = TimeUtils.getNextYear(420, 12);
      logInfo(`getNextYear(year=420, month=12): actual=${actual}`);
      expect(actual).assertEqual(421);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0037 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0038
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0038
     * @tc.desc      getNextYear(year=525, month=1) returns 525
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0038 begin`);
      const actual: number = TimeUtils.getNextYear(525, 1);
      logInfo(`getNextYear(year=525, month=1): actual=${actual}`);
      expect(actual).assertEqual(525);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0038 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0039
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0039
     * @tc.desc      getNextYear(year=525, month=12) returns 526
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0039 begin`);
      const actual: number = TimeUtils.getNextYear(525, 12);
      logInfo(`getNextYear(year=525, month=12): actual=${actual}`);
      expect(actual).assertEqual(526);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0039 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0040
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0040
     * @tc.desc      getNextYear(year=630, month=1) returns 630
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0040 begin`);
      const actual: number = TimeUtils.getNextYear(630, 1);
      logInfo(`getNextYear(year=630, month=1): actual=${actual}`);
      expect(actual).assertEqual(630);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0040 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0041
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0041
     * @tc.desc      getNextYear(year=630, month=12) returns 631
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0041 begin`);
      const actual: number = TimeUtils.getNextYear(630, 12);
      logInfo(`getNextYear(year=630, month=12): actual=${actual}`);
      expect(actual).assertEqual(631);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0041 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0042
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0042
     * @tc.desc      getNextYear(year=735, month=1) returns 735
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0042 begin`);
      const actual: number = TimeUtils.getNextYear(735, 1);
      logInfo(`getNextYear(year=735, month=1): actual=${actual}`);
      expect(actual).assertEqual(735);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0042 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0043
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0043
     * @tc.desc      getNextYear(year=735, month=12) returns 736
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0043 begin`);
      const actual: number = TimeUtils.getNextYear(735, 12);
      logInfo(`getNextYear(year=735, month=12): actual=${actual}`);
      expect(actual).assertEqual(736);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0043 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0044
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0044
     * @tc.desc      getNextYear(year=840, month=1) returns 840
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0044 begin`);
      const actual: number = TimeUtils.getNextYear(840, 1);
      logInfo(`getNextYear(year=840, month=1): actual=${actual}`);
      expect(actual).assertEqual(840);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0044 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0045
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0045
     * @tc.desc      getNextYear(year=840, month=12) returns 841
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0045 begin`);
      const actual: number = TimeUtils.getNextYear(840, 12);
      logInfo(`getNextYear(year=840, month=12): actual=${actual}`);
      expect(actual).assertEqual(841);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0045 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0046
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0046
     * @tc.desc      getNextYear(year=2024, month=2) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0046 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 2);
      logInfo(`getNextYear(year=2024, month=2): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0046 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0047
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0047
     * @tc.desc      getNextYear(year=2024, month=0) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0047 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 0);
      logInfo(`getNextYear(year=2024, month=0): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0047 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0048
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0048
     * @tc.desc      getNextYear(year=2024, month=11) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0048 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 11);
      logInfo(`getNextYear(year=2024, month=11): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0048 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0049
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0049
     * @tc.desc      getNextYear(year=2024, month=13) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0049 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 13);
      logInfo(`getNextYear(year=2024, month=13): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0049 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0050
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0050
     * @tc.desc      getNextYear(year=2024, month=24) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0050 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 24);
      logInfo(`getNextYear(year=2024, month=24): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0050 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0051
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0051
     * @tc.desc      getNextYear(year=2024, month=6) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0051 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 6);
      logInfo(`getNextYear(year=2024, month=6): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0051 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0052
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0052
     * @tc.desc      getNextYear(year=2024, month=-1) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0052 begin`);
      const actual: number = TimeUtils.getNextYear(2024, -1);
      logInfo(`getNextYear(year=2024, month=-1): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0052 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0053
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0053
     * @tc.desc      getNextYear(year=2024, month=3) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0053 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 3);
      logInfo(`getNextYear(year=2024, month=3): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0053 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0054
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0054
     * @tc.desc      getNextYear(year=2024, month=10) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0054 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 10);
      logInfo(`getNextYear(year=2024, month=10): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0054 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0055
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0055
     * @tc.desc      getNextYear(year=2024, month=100) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0055 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 100);
      logInfo(`getNextYear(year=2024, month=100): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0055 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0056
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0056
     * @tc.desc      getNextYear(year=2024, month=5) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0056 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 5);
      logInfo(`getNextYear(year=2024, month=5): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0056 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0057
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0057
     * @tc.desc      getNextYear(year=2024, month=15) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0057 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 15);
      logInfo(`getNextYear(year=2024, month=15): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0057 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0058
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0058
     * @tc.desc      getNextYear(year=2024, month=20) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0058 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 20);
      logInfo(`getNextYear(year=2024, month=20): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0058 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0059
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0059
     * @tc.desc      getNextYear(year=2024, month=25) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0059 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 25);
      logInfo(`getNextYear(year=2024, month=25): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0059 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0060
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0060
     * @tc.desc      getNextYear(year=2024, month=30) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0060 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 30);
      logInfo(`getNextYear(year=2024, month=30): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0060 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0061
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0061
     * @tc.desc      getNextYear(year=2024, month=35) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0061 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 35);
      logInfo(`getNextYear(year=2024, month=35): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0061 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0062
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0062
     * @tc.desc      getNextYear(year=2024, month=40) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0062 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 40);
      logInfo(`getNextYear(year=2024, month=40): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0062 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0063
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0063
     * @tc.desc      getNextYear(year=2024, month=45) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0063 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 45);
      logInfo(`getNextYear(year=2024, month=45): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0063 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0064
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0064
     * @tc.desc      getNextYear(year=2024, month=50) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0064 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 50);
      logInfo(`getNextYear(year=2024, month=50): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0064 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0065
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0065
     * @tc.desc      getNextYear(year=2024, month=55) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0065 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 55);
      logInfo(`getNextYear(year=2024, month=55): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0065 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0066
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0066
     * @tc.desc      getNextYear(year=2024, month=60) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0066 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 60);
      logInfo(`getNextYear(year=2024, month=60): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0066 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0067
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0067
     * @tc.desc      getNextYear(year=2024, month=65) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0067 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 65);
      logInfo(`getNextYear(year=2024, month=65): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0067 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0068
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0068
     * @tc.desc      getNextYear(year=2024, month=70) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0068 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 70);
      logInfo(`getNextYear(year=2024, month=70): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0068 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0069
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0069
     * @tc.desc      getNextYear(year=2024, month=75) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0069 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 75);
      logInfo(`getNextYear(year=2024, month=75): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0069 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0070
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0070
     * @tc.desc      getNextYear(year=2024, month=80) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0070 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 80);
      logInfo(`getNextYear(year=2024, month=80): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0070 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0071
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0071
     * @tc.desc      getNextYear(year=2024, month=85) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0071 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 85);
      logInfo(`getNextYear(year=2024, month=85): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0071 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0072
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0072
     * @tc.desc      getNextYear(year=2024, month=90) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0072 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 90);
      logInfo(`getNextYear(year=2024, month=90): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0072 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0073
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0073
     * @tc.desc      getNextYear(year=2024, month=102) returns 2025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0073 begin`);
      const actual: number = TimeUtils.getNextYear(2024, 102);
      logInfo(`getNextYear(year=2024, month=102): actual=${actual}`);
      expect(actual).assertEqual(2025);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0073 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0074
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0074
     * @tc.desc      getNextYear(year=2023, month=2) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0074 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 2);
      logInfo(`getNextYear(year=2023, month=2): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0074 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0075
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0075
     * @tc.desc      getNextYear(year=2023, month=0) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0075 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 0);
      logInfo(`getNextYear(year=2023, month=0): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0075 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0076
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0076
     * @tc.desc      getNextYear(year=2023, month=12) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0076 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 12);
      logInfo(`getNextYear(year=2023, month=12): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0076 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0077
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0077
     * @tc.desc      getNextYear(year=2023, month=11) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0077 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 11);
      logInfo(`getNextYear(year=2023, month=11): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0077 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0078
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0078
     * @tc.desc      getNextYear(year=2023, month=13) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0078 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 13);
      logInfo(`getNextYear(year=2023, month=13): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0078 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0079
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0079
     * @tc.desc      getNextYear(year=2023, month=24) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0079 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 24);
      logInfo(`getNextYear(year=2023, month=24): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0079 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0080
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0080
     * @tc.desc      getNextYear(year=2023, month=6) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0080 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 6);
      logInfo(`getNextYear(year=2023, month=6): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0080 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0081
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0081
     * @tc.desc      getNextYear(year=2023, month=-1) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0081 begin`);
      const actual: number = TimeUtils.getNextYear(2023, -1);
      logInfo(`getNextYear(year=2023, month=-1): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0081 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0082
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0082
     * @tc.desc      getNextYear(year=2023, month=3) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0082 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 3);
      logInfo(`getNextYear(year=2023, month=3): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0082 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0083
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0083
     * @tc.desc      getNextYear(year=2023, month=10) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0083 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 10);
      logInfo(`getNextYear(year=2023, month=10): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0083 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0084
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0084
     * @tc.desc      getNextYear(year=2023, month=100) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0084 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 100);
      logInfo(`getNextYear(year=2023, month=100): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0084 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0085
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0085
     * @tc.desc      getNextYear(year=2023, month=5) returns 2023
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0085 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 5);
      logInfo(`getNextYear(year=2023, month=5): actual=${actual}`);
      expect(actual).assertEqual(2023);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0085 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0086
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0086
     * @tc.desc      getNextYear(year=2023, month=15) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0086 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 15);
      logInfo(`getNextYear(year=2023, month=15): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0086 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0087
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0087
     * @tc.desc      getNextYear(year=2023, month=20) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0087 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 20);
      logInfo(`getNextYear(year=2023, month=20): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0087 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0088
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0088
     * @tc.desc      getNextYear(year=2023, month=25) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0088 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 25);
      logInfo(`getNextYear(year=2023, month=25): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0088 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0089
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0089
     * @tc.desc      getNextYear(year=2023, month=30) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0089 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 30);
      logInfo(`getNextYear(year=2023, month=30): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0089 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0090
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0090
     * @tc.desc      getNextYear(year=2023, month=35) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0090 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 35);
      logInfo(`getNextYear(year=2023, month=35): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0090 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0091
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0091
     * @tc.desc      getNextYear(year=2023, month=40) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0091 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 40);
      logInfo(`getNextYear(year=2023, month=40): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0091 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0092
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0092
     * @tc.desc      getNextYear(year=2023, month=45) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0092 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 45);
      logInfo(`getNextYear(year=2023, month=45): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0092 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0093
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0093
     * @tc.desc      getNextYear(year=2023, month=50) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0093 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 50);
      logInfo(`getNextYear(year=2023, month=50): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0093 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0094
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0094
     * @tc.desc      getNextYear(year=2023, month=55) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0094 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 55);
      logInfo(`getNextYear(year=2023, month=55): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0094 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0095
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0095
     * @tc.desc      getNextYear(year=2023, month=60) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0095 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 60);
      logInfo(`getNextYear(year=2023, month=60): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0095 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_NEXT_YEAR_0096
     * @tc.name      CalendarViewSwitch_TimeUtilsGetNextYear_0096
     * @tc.desc      getNextYear(year=2023, month=65) returns 2024
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsGetNextYear_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0096 begin`);
      const actual: number = TimeUtils.getNextYear(2023, 65);
      logInfo(`getNextYear(year=2023, month=65): actual=${actual}`);
      expect(actual).assertEqual(2024);
      logInfo(`${BUNDLE}TimeUtilsGetNextYear_0096 end`);
    });
  });
}
