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

/** Logic checks for TimeUtils.lunarMonthToChinese (24 cases). */
export default function timeUtilsLunarMonthToChinese2Test(): void {
  describe('TimeUtilsLunarMonthToChinese2Test', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0097
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0097
     * @tc.desc      lunarMonthToChinese(month=95.45) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0097 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(95.45);
      logInfo(`lunarMonthToChinese(month=95.45): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0097 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0098
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0098
     * @tc.desc      lunarMonthToChinese(month=20.11) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0098 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(20.11);
      logInfo(`lunarMonthToChinese(month=20.11): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0098 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0099
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0099
     * @tc.desc      lunarMonthToChinese(month=35.5) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0099 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(35.5);
      logInfo(`lunarMonthToChinese(month=35.5): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0099 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0100
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0100
     * @tc.desc      lunarMonthToChinese(month=-37) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0100 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-37);
      logInfo(`lunarMonthToChinese(month=-37): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0100 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0101
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0101
     * @tc.desc      lunarMonthToChinese(month=29) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0101 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(29);
      logInfo(`lunarMonthToChinese(month=29): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0101 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0102
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0102
     * @tc.desc      lunarMonthToChinese(month=-44) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0102 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-44);
      logInfo(`lunarMonthToChinese(month=-44): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0102 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0103
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0103
     * @tc.desc      lunarMonthToChinese(month=21.05) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0103 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(21.05);
      logInfo(`lunarMonthToChinese(month=21.05): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0103 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0104
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0104
     * @tc.desc      lunarMonthToChinese(month=91) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0104 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(91);
      logInfo(`lunarMonthToChinese(month=91): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0104 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0105
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0105
     * @tc.desc      lunarMonthToChinese(month=186) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0105 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(186);
      logInfo(`lunarMonthToChinese(month=186): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0105 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0106
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0106
     * @tc.desc      lunarMonthToChinese(month=122) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0106 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(122);
      logInfo(`lunarMonthToChinese(month=122): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0106 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0107
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0107
     * @tc.desc      lunarMonthToChinese(month=2.49) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0107 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(2.49);
      logInfo(`lunarMonthToChinese(month=2.49): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0107 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0108
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0108
     * @tc.desc      lunarMonthToChinese(month=35.27) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0108 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(35.27);
      logInfo(`lunarMonthToChinese(month=35.27): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0108 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0109
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0109
     * @tc.desc      lunarMonthToChinese(month=92) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0109 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(92);
      logInfo(`lunarMonthToChinese(month=92): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0109 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0110
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0110
     * @tc.desc      lunarMonthToChinese(month=171) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0110 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(171);
      logInfo(`lunarMonthToChinese(month=171): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0110 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0111
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0111
     * @tc.desc      lunarMonthToChinese(month=52) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0111 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(52);
      logInfo(`lunarMonthToChinese(month=52): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0111 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0112
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0112
     * @tc.desc      lunarMonthToChinese(month=52.65) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0112 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(52.65);
      logInfo(`lunarMonthToChinese(month=52.65): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0112 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0113
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0113
     * @tc.desc      lunarMonthToChinese(month=179) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0113 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(179);
      logInfo(`lunarMonthToChinese(month=179): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0113 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0114
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0114
     * @tc.desc      lunarMonthToChinese(month=112) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0114 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(112);
      logInfo(`lunarMonthToChinese(month=112): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0114 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0115
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0115
     * @tc.desc      lunarMonthToChinese(month=89.56) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0115 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(89.56);
      logInfo(`lunarMonthToChinese(month=89.56): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0115 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0116
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0116
     * @tc.desc      lunarMonthToChinese(month=-87) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0116 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-87);
      logInfo(`lunarMonthToChinese(month=-87): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0116 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0117
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0117
     * @tc.desc      lunarMonthToChinese(month=121) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0117 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(121);
      logInfo(`lunarMonthToChinese(month=121): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0117 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0118
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0118
     * @tc.desc      lunarMonthToChinese(month=187) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0118 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(187);
      logInfo(`lunarMonthToChinese(month=187): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0118 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0119
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0119
     * @tc.desc      lunarMonthToChinese(month=-23) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0119 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-23);
      logInfo(`lunarMonthToChinese(month=-23): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0119 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0120
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0120
     * @tc.desc      lunarMonthToChinese(month=63) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0120 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(63);
      logInfo(`lunarMonthToChinese(month=63): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0120 end`);
    });
  });
}
