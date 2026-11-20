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

/** Logic checks for TimeUtils.getLastDayOfMonth (4 cases). */
export default function timeUtilsGetLastDayOfMonth2Test(): void {
  describe('TimeUtilsGetLastDayOfMonth2Test', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0097
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0097
     * @tc.desc      getLastDayOfMonth(year=-1, month=13) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0097 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(-1, 13);
      logInfo(`getLastDayOfMonth(year=-1, month=13): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0097 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0098
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0098
     * @tc.desc      getLastDayOfMonth(year=-1, month=3) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0098 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(-1, 3);
      logInfo(`getLastDayOfMonth(year=-1, month=3): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0098 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0099
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0099
     * @tc.desc      getLastDayOfMonth(year=-1, month=10) returns 31
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0099 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(-1, 10);
      logInfo(`getLastDayOfMonth(year=-1, month=10): actual=${actual}`);
      expect(actual).assertEqual(31);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0099 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_GET_LAST_DAY_OF_MONTH_0100
     * @tc.name      CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0100
     * @tc.desc      getLastDayOfMonth(year=-1, month=100) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsGetLastDayOfMonth_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0100 begin`);
      const actual: number = TimeUtils.getLastDayOfMonth(-1, 100);
      logInfo(`getLastDayOfMonth(year=-1, month=100): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}TimeUtilsGetLastDayOfMonth_0100 end`);
    });
  });
}
