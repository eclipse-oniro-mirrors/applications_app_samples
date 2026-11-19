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

/** Logic checks for TimeUtils.lunarDayToChinese (96 cases). */
export default function timeUtilsLunarDayToChineseTest(): void {
  describe('TimeUtilsLunarDayToChineseTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0001
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0001
     * @tc.desc      lunarDayToChinese(day=1) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0001 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(1);
      logInfo(`lunarDayToChinese(day=1): actual=${actual}`);
      expect(actual).assertEqual('\u521d\u4e00');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0002
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0002
     * @tc.desc      lunarDayToChinese(day=15) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0002 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(15);
      logInfo(`lunarDayToChinese(day=15): actual=${actual}`);
      expect(actual).assertEqual('\u5341\u4e94');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0003
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0003
     * @tc.desc      lunarDayToChinese(day=0) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0003 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(0);
      logInfo(`lunarDayToChinese(day=0): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0004
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0004
     * @tc.desc      lunarDayToChinese(day=2) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0004 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(2);
      logInfo(`lunarDayToChinese(day=2): actual=${actual}`);
      expect(actual).assertEqual('\u521d\u4e8c');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0005
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0005
     * @tc.desc      lunarDayToChinese(day=28) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0005 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(28);
      logInfo(`lunarDayToChinese(day=28): actual=${actual}`);
      expect(actual).assertEqual('\u5eff\u516b');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0005 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0006
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0006
     * @tc.desc      lunarDayToChinese(day=29) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0006 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(29);
      logInfo(`lunarDayToChinese(day=29): actual=${actual}`);
      expect(actual).assertEqual('\u5eff\u4e5d');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0006 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0007
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0007
     * @tc.desc      lunarDayToChinese(day=30) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0007 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(30);
      logInfo(`lunarDayToChinese(day=30): actual=${actual}`);
      expect(actual).assertEqual('\u4e09\u5341');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0007 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0008
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0008
     * @tc.desc      lunarDayToChinese(day=3) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0008 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(3);
      logInfo(`lunarDayToChinese(day=3): actual=${actual}`);
      expect(actual).assertEqual('\u521d\u4e09');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0008 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0009
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0009
     * @tc.desc      lunarDayToChinese(day=10) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0009 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(10);
      logInfo(`lunarDayToChinese(day=10): actual=${actual}`);
      expect(actual).assertEqual('\u521d\u5341');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0009 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0010
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0010
     * @tc.desc      lunarDayToChinese(day=5) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0010 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(5);
      logInfo(`lunarDayToChinese(day=5): actual=${actual}`);
      expect(actual).assertEqual('\u521d\u4e94');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0010 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0011
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0011
     * @tc.desc      lunarDayToChinese(day=20) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0011 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(20);
      logInfo(`lunarDayToChinese(day=20): actual=${actual}`);
      expect(actual).assertEqual('\u4e8c\u5341');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0011 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0012
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0012
     * @tc.desc      lunarDayToChinese(day=25) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0012 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(25);
      logInfo(`lunarDayToChinese(day=25): actual=${actual}`);
      expect(actual).assertEqual('\u5eff\u4e94');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0012 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0013
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0013
     * @tc.desc      lunarDayToChinese(day=22) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0013 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(22);
      logInfo(`lunarDayToChinese(day=22): actual=${actual}`);
      expect(actual).assertEqual('\u5eff\u4e8c');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0013 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0014
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0014
     * @tc.desc      lunarDayToChinese(day=16) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0014 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(16);
      logInfo(`lunarDayToChinese(day=16): actual=${actual}`);
      expect(actual).assertEqual('\u5341\u516d');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0014 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0015
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0015
     * @tc.desc      lunarDayToChinese(day=8) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0015 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(8);
      logInfo(`lunarDayToChinese(day=8): actual=${actual}`);
      expect(actual).assertEqual('\u521d\u516b');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0015 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0016
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0016
     * @tc.desc      lunarDayToChinese(day=19) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0016 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(19);
      logInfo(`lunarDayToChinese(day=19): actual=${actual}`);
      expect(actual).assertEqual('\u5341\u4e5d');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0016 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0017
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0017
     * @tc.desc      lunarDayToChinese(day=26) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0017 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(26);
      logInfo(`lunarDayToChinese(day=26): actual=${actual}`);
      expect(actual).assertEqual('\u5eff\u516d');
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0017 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0018
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0018
     * @tc.desc      lunarDayToChinese(day=31) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0018 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(31);
      logInfo(`lunarDayToChinese(day=31): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0018 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0019
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0019
     * @tc.desc      lunarDayToChinese(day=-1) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0019 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(-1);
      logInfo(`lunarDayToChinese(day=-1): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0019 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0020
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0020
     * @tc.desc      lunarDayToChinese(day=100) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0020 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(100);
      logInfo(`lunarDayToChinese(day=100): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0020 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0021
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0021
     * @tc.desc      lunarDayToChinese(day=35) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0021 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(35);
      logInfo(`lunarDayToChinese(day=35): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0021 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0022
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0022
     * @tc.desc      lunarDayToChinese(day=40) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0022 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(40);
      logInfo(`lunarDayToChinese(day=40): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0022 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0023
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0023
     * @tc.desc      lunarDayToChinese(day=45) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0023 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(45);
      logInfo(`lunarDayToChinese(day=45): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0023 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0024
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0024
     * @tc.desc      lunarDayToChinese(day=50) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0024 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(50);
      logInfo(`lunarDayToChinese(day=50): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0024 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0025
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0025
     * @tc.desc      lunarDayToChinese(day=55) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0025 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(55);
      logInfo(`lunarDayToChinese(day=55): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0025 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0026
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0026
     * @tc.desc      lunarDayToChinese(day=60) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0026 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(60);
      logInfo(`lunarDayToChinese(day=60): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0026 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0027
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0027
     * @tc.desc      lunarDayToChinese(day=65) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0027 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(65);
      logInfo(`lunarDayToChinese(day=65): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0027 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0028
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0028
     * @tc.desc      lunarDayToChinese(day=70) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0028 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(70);
      logInfo(`lunarDayToChinese(day=70): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0028 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0029
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0029
     * @tc.desc      lunarDayToChinese(day=75) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0029 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(75);
      logInfo(`lunarDayToChinese(day=75): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0029 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0030
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0030
     * @tc.desc      lunarDayToChinese(day=80) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0030 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(80);
      logInfo(`lunarDayToChinese(day=80): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0030 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0031
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0031
     * @tc.desc      lunarDayToChinese(day=85) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0031 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(85);
      logInfo(`lunarDayToChinese(day=85): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0031 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0032
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0032
     * @tc.desc      lunarDayToChinese(day=90) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0032 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(90);
      logInfo(`lunarDayToChinese(day=90): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0032 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0033
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0033
     * @tc.desc      lunarDayToChinese(day=95) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0033 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(95);
      logInfo(`lunarDayToChinese(day=95): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0033 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0034
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0034
     * @tc.desc      lunarDayToChinese(day=105) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0034 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(105);
      logInfo(`lunarDayToChinese(day=105): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0034 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0035
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0035
     * @tc.desc      lunarDayToChinese(day=110) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0035 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(110);
      logInfo(`lunarDayToChinese(day=110): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0035 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0036
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0036
     * @tc.desc      lunarDayToChinese(day=115) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0036 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(115);
      logInfo(`lunarDayToChinese(day=115): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0036 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0037
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0037
     * @tc.desc      lunarDayToChinese(day=120) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0037 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(120);
      logInfo(`lunarDayToChinese(day=120): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0037 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0038
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0038
     * @tc.desc      lunarDayToChinese(day=125) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0038 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(125);
      logInfo(`lunarDayToChinese(day=125): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0038 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0039
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0039
     * @tc.desc      lunarDayToChinese(day=130) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0039 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(130);
      logInfo(`lunarDayToChinese(day=130): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0039 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0040
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0040
     * @tc.desc      lunarDayToChinese(day=135) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0040 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(135);
      logInfo(`lunarDayToChinese(day=135): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0040 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0041
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0041
     * @tc.desc      lunarDayToChinese(day=140) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0041 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(140);
      logInfo(`lunarDayToChinese(day=140): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0041 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0042
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0042
     * @tc.desc      lunarDayToChinese(day=145) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0042 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(145);
      logInfo(`lunarDayToChinese(day=145): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0042 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0043
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0043
     * @tc.desc      lunarDayToChinese(day=150) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0043 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(150);
      logInfo(`lunarDayToChinese(day=150): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0043 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0044
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0044
     * @tc.desc      lunarDayToChinese(day=155) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0044 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(155);
      logInfo(`lunarDayToChinese(day=155): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0044 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0045
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0045
     * @tc.desc      lunarDayToChinese(day=160) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0045 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(160);
      logInfo(`lunarDayToChinese(day=160): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0045 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0046
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0046
     * @tc.desc      lunarDayToChinese(day=165) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0046 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(165);
      logInfo(`lunarDayToChinese(day=165): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0046 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0047
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0047
     * @tc.desc      lunarDayToChinese(day=170) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0047 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(170);
      logInfo(`lunarDayToChinese(day=170): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0047 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0048
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0048
     * @tc.desc      lunarDayToChinese(day=175) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0048 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(175);
      logInfo(`lunarDayToChinese(day=175): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0048 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0049
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0049
     * @tc.desc      lunarDayToChinese(day=180) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0049 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(180);
      logInfo(`lunarDayToChinese(day=180): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0049 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0050
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0050
     * @tc.desc      lunarDayToChinese(day=185) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0050 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(185);
      logInfo(`lunarDayToChinese(day=185): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0050 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0051
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0051
     * @tc.desc      lunarDayToChinese(day=190) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0051 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(190);
      logInfo(`lunarDayToChinese(day=190): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0051 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0052
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0052
     * @tc.desc      lunarDayToChinese(day=195) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0052 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(195);
      logInfo(`lunarDayToChinese(day=195): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0052 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0053
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0053
     * @tc.desc      lunarDayToChinese(day=200) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0053 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(200);
      logInfo(`lunarDayToChinese(day=200): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0053 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0054
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0054
     * @tc.desc      lunarDayToChinese(day=102) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0054 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(102);
      logInfo(`lunarDayToChinese(day=102): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0054 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0055
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0055
     * @tc.desc      lunarDayToChinese(day=72.58) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0055 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(72.58);
      logInfo(`lunarDayToChinese(day=72.58): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0055 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0056
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0056
     * @tc.desc      lunarDayToChinese(day=67.32) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0056 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(67.32);
      logInfo(`lunarDayToChinese(day=67.32): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0056 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0057
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0057
     * @tc.desc      lunarDayToChinese(day=97) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0057 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(97);
      logInfo(`lunarDayToChinese(day=97): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0057 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0058
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0058
     * @tc.desc      lunarDayToChinese(day=49) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0058 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(49);
      logInfo(`lunarDayToChinese(day=49): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0058 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0059
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0059
     * @tc.desc      lunarDayToChinese(day=67) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0059 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(67);
      logInfo(`lunarDayToChinese(day=67): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0059 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0060
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0060
     * @tc.desc      lunarDayToChinese(day=187) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0060 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(187);
      logInfo(`lunarDayToChinese(day=187): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0060 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0061
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0061
     * @tc.desc      lunarDayToChinese(day=-6) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0061 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(-6);
      logInfo(`lunarDayToChinese(day=-6): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0061 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0062
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0062
     * @tc.desc      lunarDayToChinese(day=116) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0062 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(116);
      logInfo(`lunarDayToChinese(day=116): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0062 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0063
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0063
     * @tc.desc      lunarDayToChinese(day=33.22) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0063 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(33.22);
      logInfo(`lunarDayToChinese(day=33.22): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0063 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0064
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0064
     * @tc.desc      lunarDayToChinese(day=108) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0064 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(108);
      logInfo(`lunarDayToChinese(day=108): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0064 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0065
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0065
     * @tc.desc      lunarDayToChinese(day=49.37) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0065 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(49.37);
      logInfo(`lunarDayToChinese(day=49.37): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0065 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0066
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0066
     * @tc.desc      lunarDayToChinese(day=92) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0066 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(92);
      logInfo(`lunarDayToChinese(day=92): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0066 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0067
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0067
     * @tc.desc      lunarDayToChinese(day=38) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0067 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(38);
      logInfo(`lunarDayToChinese(day=38): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0067 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0068
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0068
     * @tc.desc      lunarDayToChinese(day=173) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0068 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(173);
      logInfo(`lunarDayToChinese(day=173): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0068 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0069
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0069
     * @tc.desc      lunarDayToChinese(day=83) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0069 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(83);
      logInfo(`lunarDayToChinese(day=83): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0069 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0070
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0070
     * @tc.desc      lunarDayToChinese(day=12.75) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0070 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(12.75);
      logInfo(`lunarDayToChinese(day=12.75): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0070 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0071
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0071
     * @tc.desc      lunarDayToChinese(day=80.37) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0071 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(80.37);
      logInfo(`lunarDayToChinese(day=80.37): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0071 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0072
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0072
     * @tc.desc      lunarDayToChinese(day=131) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0072 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(131);
      logInfo(`lunarDayToChinese(day=131): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0072 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0073
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0073
     * @tc.desc      lunarDayToChinese(day=25.68) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0073 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(25.68);
      logInfo(`lunarDayToChinese(day=25.68): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0073 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0074
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0074
     * @tc.desc      lunarDayToChinese(day=92.22) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0074 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(92.22);
      logInfo(`lunarDayToChinese(day=92.22): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0074 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0075
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0075
     * @tc.desc      lunarDayToChinese(day=154) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0075 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(154);
      logInfo(`lunarDayToChinese(day=154): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0075 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0076
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0076
     * @tc.desc      lunarDayToChinese(day=58.15) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0076 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(58.15);
      logInfo(`lunarDayToChinese(day=58.15): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0076 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0077
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0077
     * @tc.desc      lunarDayToChinese(day=-16) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0077 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(-16);
      logInfo(`lunarDayToChinese(day=-16): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0077 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0078
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0078
     * @tc.desc      lunarDayToChinese(day=-77) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0078 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(-77);
      logInfo(`lunarDayToChinese(day=-77): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0078 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0079
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0079
     * @tc.desc      lunarDayToChinese(day=-27) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0079 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(-27);
      logInfo(`lunarDayToChinese(day=-27): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0079 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0080
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0080
     * @tc.desc      lunarDayToChinese(day=73) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0080 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(73);
      logInfo(`lunarDayToChinese(day=73): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0080 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0081
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0081
     * @tc.desc      lunarDayToChinese(day=96) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0081 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(96);
      logInfo(`lunarDayToChinese(day=96): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0081 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0082
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0082
     * @tc.desc      lunarDayToChinese(day=124) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0082 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(124);
      logInfo(`lunarDayToChinese(day=124): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0082 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0083
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0083
     * @tc.desc      lunarDayToChinese(day=133) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0083 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(133);
      logInfo(`lunarDayToChinese(day=133): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0083 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0084
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0084
     * @tc.desc      lunarDayToChinese(day=163) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0084 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(163);
      logInfo(`lunarDayToChinese(day=163): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0084 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0085
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0085
     * @tc.desc      lunarDayToChinese(day=-3) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0085 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(-3);
      logInfo(`lunarDayToChinese(day=-3): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0085 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0086
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0086
     * @tc.desc      lunarDayToChinese(day=63.26) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0086 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(63.26);
      logInfo(`lunarDayToChinese(day=63.26): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0086 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0087
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0087
     * @tc.desc      lunarDayToChinese(day=-2) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0087 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(-2);
      logInfo(`lunarDayToChinese(day=-2): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0087 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0088
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0088
     * @tc.desc      lunarDayToChinese(day=15.58) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0088 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(15.58);
      logInfo(`lunarDayToChinese(day=15.58): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0088 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0089
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0089
     * @tc.desc      lunarDayToChinese(day=193) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0089 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(193);
      logInfo(`lunarDayToChinese(day=193): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0089 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0090
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0090
     * @tc.desc      lunarDayToChinese(day=11.41) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0090 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(11.41);
      logInfo(`lunarDayToChinese(day=11.41): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0090 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0091
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0091
     * @tc.desc      lunarDayToChinese(day=68.09) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0091 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(68.09);
      logInfo(`lunarDayToChinese(day=68.09): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0091 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0092
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0092
     * @tc.desc      lunarDayToChinese(day=5.27) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0092 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(5.27);
      logInfo(`lunarDayToChinese(day=5.27): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0092 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0093
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0093
     * @tc.desc      lunarDayToChinese(day=54.16) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0093 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(54.16);
      logInfo(`lunarDayToChinese(day=54.16): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0093 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0094
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0094
     * @tc.desc      lunarDayToChinese(day=72) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0094 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(72);
      logInfo(`lunarDayToChinese(day=72): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0094 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0095
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0095
     * @tc.desc      lunarDayToChinese(day=44) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0095 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(44);
      logInfo(`lunarDayToChinese(day=44): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0095 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_TIME_UTILS_LUNAR_DAY_TO_CHINESE_0096
     * @tc.name      CalendarViewSwitch_TimeUtilsLunarDayToChinese_0096
     * @tc.desc      lunarDayToChinese(day=62) returns undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_TimeUtilsLunarDayToChinese_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0096 begin`);
      const actual: string = TimeUtils.lunarDayToChinese(62);
      logInfo(`lunarDayToChinese(day=62): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}TimeUtilsLunarDayToChinese_0096 end`);
    });
  });
}
