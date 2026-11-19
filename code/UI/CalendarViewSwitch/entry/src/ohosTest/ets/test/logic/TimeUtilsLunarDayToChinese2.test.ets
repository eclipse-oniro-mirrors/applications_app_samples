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

/** Logic checks for TimeUtils.lunarDayToChinese (24 cases). */
export default function timeUtilsLunarDayToChinese2Test(): void {
  describe('TimeUtilsLunarDayToChinese2Test', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0097
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0097
     * @tc.desc      lunarDayToChinese(day=-53) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0097 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(-53);
      logInfo(`lunarDayToChinese(day=-53): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0097 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0098
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0098
     * @tc.desc      lunarDayToChinese(day=55.42) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0098 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(55.42);
      logInfo(`lunarDayToChinese(day=55.42): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0098 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0099
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0099
     * @tc.desc      lunarDayToChinese(day=-99) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0099 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(-99);
      logInfo(`lunarDayToChinese(day=-99): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0099 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0100
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0100
     * @tc.desc      lunarDayToChinese(day=93) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0100 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(93);
      logInfo(`lunarDayToChinese(day=93): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0100 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0101
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0101
     * @tc.desc      lunarDayToChinese(day=-52) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0101 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(-52);
      logInfo(`lunarDayToChinese(day=-52): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0101 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0102
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0102
     * @tc.desc      lunarDayToChinese(day=67.67) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0102 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(67.67);
      logInfo(`lunarDayToChinese(day=67.67): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0102 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0103
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0103
     * @tc.desc      lunarDayToChinese(day=181) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0103 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(181);
      logInfo(`lunarDayToChinese(day=181): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0103 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0104
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0104
     * @tc.desc      lunarDayToChinese(day=99) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0104 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(99);
      logInfo(`lunarDayToChinese(day=99): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0104 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0105
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0105
     * @tc.desc      lunarDayToChinese(day=189) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0105 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(189);
      logInfo(`lunarDayToChinese(day=189): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0105 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0106
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0106
     * @tc.desc      lunarDayToChinese(day=70.77) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0106 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(70.77);
      logInfo(`lunarDayToChinese(day=70.77): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0106 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0107
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0107
     * @tc.desc      lunarDayToChinese(day=22.77) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0107 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(22.77);
      logInfo(`lunarDayToChinese(day=22.77): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0107 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0108
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0108
     * @tc.desc      lunarDayToChinese(day=22.75) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0108 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(22.75);
      logInfo(`lunarDayToChinese(day=22.75): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0108 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0109
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0109
     * @tc.desc      lunarDayToChinese(day=132) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0109 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(132);
      logInfo(`lunarDayToChinese(day=132): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0109 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0110
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0110
     * @tc.desc      lunarDayToChinese(day=99.83) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0110 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(99.83);
      logInfo(`lunarDayToChinese(day=99.83): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0110 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0111
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0111
     * @tc.desc      lunarDayToChinese(day=-7) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0111 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(-7);
      logInfo(`lunarDayToChinese(day=-7): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0111 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0112
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0112
     * @tc.desc      lunarDayToChinese(day=-10) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0112 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(-10);
      logInfo(`lunarDayToChinese(day=-10): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0112 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0113
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0113
     * @tc.desc      lunarDayToChinese(day=143) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0113 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(143);
      logInfo(`lunarDayToChinese(day=143): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0113 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0114
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0114
     * @tc.desc      lunarDayToChinese(day=107) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0114 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(107);
      logInfo(`lunarDayToChinese(day=107): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0114 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0115
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0115
     * @tc.desc      lunarDayToChinese(day=197) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0115 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(197);
      logInfo(`lunarDayToChinese(day=197): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0115 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0116
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0116
     * @tc.desc      lunarDayToChinese(day=34.18) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0116 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(34.18);
      logInfo(`lunarDayToChinese(day=34.18): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0116 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0117
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0117
     * @tc.desc      lunarDayToChinese(day=99.88) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0117 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(99.88);
      logInfo(`lunarDayToChinese(day=99.88): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0117 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0118
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0118
     * @tc.desc      lunarDayToChinese(day=49.34) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0118 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(49.34);
      logInfo(`lunarDayToChinese(day=49.34): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0118 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0119
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0119
     * @tc.desc      lunarDayToChinese(day=58.89) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0119 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(58.89);
      logInfo(`lunarDayToChinese(day=58.89): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0119 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0120
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0120
     * @tc.desc      lunarDayToChinese(day=-50) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0120 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(-50);
      logInfo(`lunarDayToChinese(day=-50): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0120 end`);
    });
  });
}
