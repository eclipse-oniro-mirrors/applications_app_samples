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

/** Logic checks for TimeUtils.lunarMonthToChinese (96 cases). */
export default function timeUtilsLunarMonthToChineseTest(): void {
  describe('TimeUtilsLunarMonthToChineseTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0001
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0001
     * @tc.desc      lunarMonthToChinese(month=1) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0001 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(1);
      logInfo(`lunarMonthToChinese(month=1): actual=${actual}`);
      expect(actual).assertEqual('\u6b63\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0002
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0002
     * @tc.desc      lunarMonthToChinese(month=2) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0002 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(2);
      logInfo(`lunarMonthToChinese(month=2): actual=${actual}`);
      expect(actual).assertEqual('\u4e8c\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0003
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0003
     * @tc.desc      lunarMonthToChinese(month=0) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0003 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(0);
      logInfo(`lunarMonthToChinese(month=0): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0004
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0004
     * @tc.desc      lunarMonthToChinese(month=-1) returns "???"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0004 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-1);
      logInfo(`lunarMonthToChinese(month=-1): actual=${actual}`);
      expect(actual).assertEqual('\u95f0\u6b63\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0005
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0005
     * @tc.desc      lunarMonthToChinese(month=6) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0005 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(6);
      logInfo(`lunarMonthToChinese(month=6): actual=${actual}`);
      expect(actual).assertEqual('\u516d\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0005 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0006
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0006
     * @tc.desc      lunarMonthToChinese(month=12) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0006 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(12);
      logInfo(`lunarMonthToChinese(month=12): actual=${actual}`);
      expect(actual).assertEqual('\u814a\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0006 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0007
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0007
     * @tc.desc      lunarMonthToChinese(month=3) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0007 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(3);
      logInfo(`lunarMonthToChinese(month=3): actual=${actual}`);
      expect(actual).assertEqual('\u4e09\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0007 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0008
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0008
     * @tc.desc      lunarMonthToChinese(month=10) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0008 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(10);
      logInfo(`lunarMonthToChinese(month=10): actual=${actual}`);
      expect(actual).assertEqual('\u5341\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0008 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0009
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0009
     * @tc.desc      lunarMonthToChinese(month=5) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0009 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(5);
      logInfo(`lunarMonthToChinese(month=5): actual=${actual}`);
      expect(actual).assertEqual('\u4e94\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0009 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0010
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0010
     * @tc.desc      lunarMonthToChinese(month=-93) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0010 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-93);
      logInfo(`lunarMonthToChinese(month=-93): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0010 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0011
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0011
     * @tc.desc      lunarMonthToChinese(month=-10) returns "???"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0011 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-10);
      logInfo(`lunarMonthToChinese(month=-10): actual=${actual}`);
      expect(actual).assertEqual('\u95f0\u5341\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0011 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0012
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0012
     * @tc.desc      lunarMonthToChinese(month=-8) returns "???"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0012 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-8);
      logInfo(`lunarMonthToChinese(month=-8): actual=${actual}`);
      expect(actual).assertEqual('\u95f0\u516b\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0012 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0013
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0013
     * @tc.desc      lunarMonthToChinese(month=-3) returns "???"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0013 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-3);
      logInfo(`lunarMonthToChinese(month=-3): actual=${actual}`);
      expect(actual).assertEqual('\u95f0\u4e09\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0013 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0014
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0014
     * @tc.desc      lunarMonthToChinese(month=13) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0014 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(13);
      logInfo(`lunarMonthToChinese(month=13): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0014 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0015
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0015
     * @tc.desc      lunarMonthToChinese(month=100) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0015 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(100);
      logInfo(`lunarMonthToChinese(month=100): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0015 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0016
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0016
     * @tc.desc      lunarMonthToChinese(month=15) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0016 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(15);
      logInfo(`lunarMonthToChinese(month=15): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0016 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0017
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0017
     * @tc.desc      lunarMonthToChinese(month=20) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0017 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(20);
      logInfo(`lunarMonthToChinese(month=20): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0017 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0018
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0018
     * @tc.desc      lunarMonthToChinese(month=25) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0018 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(25);
      logInfo(`lunarMonthToChinese(month=25): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0018 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0019
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0019
     * @tc.desc      lunarMonthToChinese(month=30) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0019 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(30);
      logInfo(`lunarMonthToChinese(month=30): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0019 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0020
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0020
     * @tc.desc      lunarMonthToChinese(month=35) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0020 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(35);
      logInfo(`lunarMonthToChinese(month=35): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0020 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0021
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0021
     * @tc.desc      lunarMonthToChinese(month=40) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0021 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(40);
      logInfo(`lunarMonthToChinese(month=40): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0021 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0022
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0022
     * @tc.desc      lunarMonthToChinese(month=45) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0022 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(45);
      logInfo(`lunarMonthToChinese(month=45): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0022 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0023
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0023
     * @tc.desc      lunarMonthToChinese(month=50) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0023 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(50);
      logInfo(`lunarMonthToChinese(month=50): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0023 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0024
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0024
     * @tc.desc      lunarMonthToChinese(month=55) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0024 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(55);
      logInfo(`lunarMonthToChinese(month=55): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0024 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0025
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0025
     * @tc.desc      lunarMonthToChinese(month=60) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0025 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(60);
      logInfo(`lunarMonthToChinese(month=60): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0025 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0026
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0026
     * @tc.desc      lunarMonthToChinese(month=65) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0026 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(65);
      logInfo(`lunarMonthToChinese(month=65): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0026 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0027
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0027
     * @tc.desc      lunarMonthToChinese(month=70) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0027 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(70);
      logInfo(`lunarMonthToChinese(month=70): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0027 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0028
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0028
     * @tc.desc      lunarMonthToChinese(month=75) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0028 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(75);
      logInfo(`lunarMonthToChinese(month=75): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0028 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0029
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0029
     * @tc.desc      lunarMonthToChinese(month=80) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0029 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(80);
      logInfo(`lunarMonthToChinese(month=80): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0029 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0030
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0030
     * @tc.desc      lunarMonthToChinese(month=85) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0030 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(85);
      logInfo(`lunarMonthToChinese(month=85): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0030 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0031
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0031
     * @tc.desc      lunarMonthToChinese(month=90) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0031 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(90);
      logInfo(`lunarMonthToChinese(month=90): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0031 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0032
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0032
     * @tc.desc      lunarMonthToChinese(month=95) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0032 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(95);
      logInfo(`lunarMonthToChinese(month=95): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0032 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0033
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0033
     * @tc.desc      lunarMonthToChinese(month=105) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0033 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(105);
      logInfo(`lunarMonthToChinese(month=105): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0033 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0034
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0034
     * @tc.desc      lunarMonthToChinese(month=110) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0034 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(110);
      logInfo(`lunarMonthToChinese(month=110): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0034 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0035
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0035
     * @tc.desc      lunarMonthToChinese(month=115) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0035 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(115);
      logInfo(`lunarMonthToChinese(month=115): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0035 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0036
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0036
     * @tc.desc      lunarMonthToChinese(month=120) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0036 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(120);
      logInfo(`lunarMonthToChinese(month=120): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0036 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0037
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0037
     * @tc.desc      lunarMonthToChinese(month=125) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0037 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(125);
      logInfo(`lunarMonthToChinese(month=125): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0037 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0038
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0038
     * @tc.desc      lunarMonthToChinese(month=130) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0038 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(130);
      logInfo(`lunarMonthToChinese(month=130): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0038 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0039
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0039
     * @tc.desc      lunarMonthToChinese(month=135) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0039 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(135);
      logInfo(`lunarMonthToChinese(month=135): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0039 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0040
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0040
     * @tc.desc      lunarMonthToChinese(month=140) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0040 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(140);
      logInfo(`lunarMonthToChinese(month=140): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0040 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0041
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0041
     * @tc.desc      lunarMonthToChinese(month=145) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0041 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(145);
      logInfo(`lunarMonthToChinese(month=145): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0041 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0042
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0042
     * @tc.desc      lunarMonthToChinese(month=150) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0042 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(150);
      logInfo(`lunarMonthToChinese(month=150): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0042 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0043
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0043
     * @tc.desc      lunarMonthToChinese(month=155) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0043 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(155);
      logInfo(`lunarMonthToChinese(month=155): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0043 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0044
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0044
     * @tc.desc      lunarMonthToChinese(month=160) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0044 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(160);
      logInfo(`lunarMonthToChinese(month=160): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0044 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0045
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0045
     * @tc.desc      lunarMonthToChinese(month=165) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0045 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(165);
      logInfo(`lunarMonthToChinese(month=165): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0045 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0046
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0046
     * @tc.desc      lunarMonthToChinese(month=170) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0046 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(170);
      logInfo(`lunarMonthToChinese(month=170): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0046 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0047
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0047
     * @tc.desc      lunarMonthToChinese(month=175) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0047 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(175);
      logInfo(`lunarMonthToChinese(month=175): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0047 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0048
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0048
     * @tc.desc      lunarMonthToChinese(month=180) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0048 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(180);
      logInfo(`lunarMonthToChinese(month=180): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0048 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0049
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0049
     * @tc.desc      lunarMonthToChinese(month=185) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0049 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(185);
      logInfo(`lunarMonthToChinese(month=185): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0049 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0050
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0050
     * @tc.desc      lunarMonthToChinese(month=190) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0050 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(190);
      logInfo(`lunarMonthToChinese(month=190): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0050 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0051
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0051
     * @tc.desc      lunarMonthToChinese(month=195) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0051 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(195);
      logInfo(`lunarMonthToChinese(month=195): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0051 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0052
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0052
     * @tc.desc      lunarMonthToChinese(month=200) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0052 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(200);
      logInfo(`lunarMonthToChinese(month=200): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0052 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0053
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0053
     * @tc.desc      lunarMonthToChinese(month=38.08) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0053 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(38.08);
      logInfo(`lunarMonthToChinese(month=38.08): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0053 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0054
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0054
     * @tc.desc      lunarMonthToChinese(month=87.44) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0054 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(87.44);
      logInfo(`lunarMonthToChinese(month=87.44): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0054 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0055
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0055
     * @tc.desc      lunarMonthToChinese(month=124) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0055 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(124);
      logInfo(`lunarMonthToChinese(month=124): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0055 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0056
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0056
     * @tc.desc      lunarMonthToChinese(month=53) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0056 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(53);
      logInfo(`lunarMonthToChinese(month=53): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0056 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0057
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0057
     * @tc.desc      lunarMonthToChinese(month=108) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0057 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(108);
      logInfo(`lunarMonthToChinese(month=108): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0057 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0058
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0058
     * @tc.desc      lunarMonthToChinese(month=58.56) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0058 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(58.56);
      logInfo(`lunarMonthToChinese(month=58.56): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0058 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0059
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0059
     * @tc.desc      lunarMonthToChinese(month=-70) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0059 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-70);
      logInfo(`lunarMonthToChinese(month=-70): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0059 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0060
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0060
     * @tc.desc      lunarMonthToChinese(month=2.56) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0060 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(2.56);
      logInfo(`lunarMonthToChinese(month=2.56): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0060 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0061
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0061
     * @tc.desc      lunarMonthToChinese(month=0.92) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0061 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(0.92);
      logInfo(`lunarMonthToChinese(month=0.92): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0061 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0062
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0062
     * @tc.desc      lunarMonthToChinese(month=-30) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0062 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-30);
      logInfo(`lunarMonthToChinese(month=-30): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0062 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0063
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0063
     * @tc.desc      lunarMonthToChinese(month=-46) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0063 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-46);
      logInfo(`lunarMonthToChinese(month=-46): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0063 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0064
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0064
     * @tc.desc      lunarMonthToChinese(month=151) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0064 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(151);
      logInfo(`lunarMonthToChinese(month=151): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0064 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0065
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0065
     * @tc.desc      lunarMonthToChinese(month=68) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0065 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(68);
      logInfo(`lunarMonthToChinese(month=68): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0065 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0066
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0066
     * @tc.desc      lunarMonthToChinese(month=-16) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0066 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-16);
      logInfo(`lunarMonthToChinese(month=-16): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0066 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0067
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0067
     * @tc.desc      lunarMonthToChinese(month=45.01) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0067 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(45.01);
      logInfo(`lunarMonthToChinese(month=45.01): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0067 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0068
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0068
     * @tc.desc      lunarMonthToChinese(month=51) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0068 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(51);
      logInfo(`lunarMonthToChinese(month=51): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0068 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0069
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0069
     * @tc.desc      lunarMonthToChinese(month=2.52) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0069 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(2.52);
      logInfo(`lunarMonthToChinese(month=2.52): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0069 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0070
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0070
     * @tc.desc      lunarMonthToChinese(month=199) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0070 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(199);
      logInfo(`lunarMonthToChinese(month=199): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0070 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0071
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0071
     * @tc.desc      lunarMonthToChinese(month=27.97) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0071 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(27.97);
      logInfo(`lunarMonthToChinese(month=27.97): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0071 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0072
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0072
     * @tc.desc      lunarMonthToChinese(month=4.13) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0072 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(4.13);
      logInfo(`lunarMonthToChinese(month=4.13): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0072 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0073
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0073
     * @tc.desc      lunarMonthToChinese(month=60.65) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0073 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(60.65);
      logInfo(`lunarMonthToChinese(month=60.65): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0073 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0074
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0074
     * @tc.desc      lunarMonthToChinese(month=101) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0074 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(101);
      logInfo(`lunarMonthToChinese(month=101): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0074 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0075
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0075
     * @tc.desc      lunarMonthToChinese(month=48) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0075 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(48);
      logInfo(`lunarMonthToChinese(month=48): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0075 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0076
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0076
     * @tc.desc      lunarMonthToChinese(month=43.33) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0076 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(43.33);
      logInfo(`lunarMonthToChinese(month=43.33): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0076 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0077
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0077
     * @tc.desc      lunarMonthToChinese(month=87.26) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0077 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(87.26);
      logInfo(`lunarMonthToChinese(month=87.26): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0077 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0078
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0078
     * @tc.desc      lunarMonthToChinese(month=164) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0078 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(164);
      logInfo(`lunarMonthToChinese(month=164): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0078 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0079
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0079
     * @tc.desc      lunarMonthToChinese(month=-15) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0079 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-15);
      logInfo(`lunarMonthToChinese(month=-15): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0079 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0080
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0080
     * @tc.desc      lunarMonthToChinese(month=-89) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0080 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-89);
      logInfo(`lunarMonthToChinese(month=-89): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0080 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0081
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0081
     * @tc.desc      lunarMonthToChinese(month=71) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0081 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(71);
      logInfo(`lunarMonthToChinese(month=71): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0081 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0082
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0082
     * @tc.desc      lunarMonthToChinese(month=-48) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0082 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-48);
      logInfo(`lunarMonthToChinese(month=-48): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0082 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0083
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0083
     * @tc.desc      lunarMonthToChinese(month=34) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0083 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(34);
      logInfo(`lunarMonthToChinese(month=34): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0083 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0084
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0084
     * @tc.desc      lunarMonthToChinese(month=-59) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0084 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-59);
      logInfo(`lunarMonthToChinese(month=-59): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0084 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0085
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0085
     * @tc.desc      lunarMonthToChinese(month=25.95) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0085 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(25.95);
      logInfo(`lunarMonthToChinese(month=25.95): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0085 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0086
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0086
     * @tc.desc      lunarMonthToChinese(month=-61) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0086 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-61);
      logInfo(`lunarMonthToChinese(month=-61): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0086 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0087
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0087
     * @tc.desc      lunarMonthToChinese(month=191) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0087 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(191);
      logInfo(`lunarMonthToChinese(month=191): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0087 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0088
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0088
     * @tc.desc      lunarMonthToChinese(month=78) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0088 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(78);
      logInfo(`lunarMonthToChinese(month=78): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0088 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0089
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0089
     * @tc.desc      lunarMonthToChinese(month=-40) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0089 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-40);
      logInfo(`lunarMonthToChinese(month=-40): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0089 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0090
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0090
     * @tc.desc      lunarMonthToChinese(month=-39) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0090 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-39);
      logInfo(`lunarMonthToChinese(month=-39): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0090 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0091
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0091
     * @tc.desc      lunarMonthToChinese(month=81.46) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0091 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(81.46);
      logInfo(`lunarMonthToChinese(month=81.46): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0091 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0092
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0092
     * @tc.desc      lunarMonthToChinese(month=10.67) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0092 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(10.67);
      logInfo(`lunarMonthToChinese(month=10.67): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0092 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0093
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0093
     * @tc.desc      lunarMonthToChinese(month=-71) returns "?undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0093 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(-71);
      logInfo(`lunarMonthToChinese(month=-71): actual=${actual}`);
      expect(actual).assertEqual('\u95f0undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0093 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0094
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0094
     * @tc.desc      lunarMonthToChinese(month=76.91) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0094 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(76.91);
      logInfo(`lunarMonthToChinese(month=76.91): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0094 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0095
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0095
     * @tc.desc      lunarMonthToChinese(month=169) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0095 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(169);
      logInfo(`lunarMonthToChinese(month=169): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0095 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_MONTH_TO_CHINESE_0096
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0096
     * @tc.desc      lunarMonthToChinese(month=31) returns "undefined?"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarMonthToChinese_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0096 begin`);
      const actual: string = TimeUtils.lunarMonthToChinese(31);
      logInfo(`lunarMonthToChinese(month=31): actual=${actual}`);
      expect(actual).assertEqual('undefined\u6708');
      logInfo(`${BUNDLE}TimeUtilsLunarMonthToChinese_0096 end`);
    });
  });
}
