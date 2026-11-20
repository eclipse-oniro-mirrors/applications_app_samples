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
import { CalendarViewType, DayInfo, StyleUtils } from '../../../../main/ets/bridge/CalendarSwitchBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CalendarViewSwitch]';
const BUNDLE: string = 'CalendarViewSwitch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for StyleUtils.getColor (85 cases). */
export default function styleUtilsGetColorTest(): void {
  describe('StyleUtilsGetColorTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0001
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0001
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0001 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0002
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0002
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0002 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 1, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0003
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0003
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0003 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0004
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0004
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0004 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0005
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0005
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0005 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0005 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0006
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0006
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0006 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0006 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0007
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0007
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0007 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0007 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0008
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0008
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0008 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 1, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0008 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0009
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0009
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0009 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0009 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0010
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0010
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0010 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0010 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0011
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0011
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0011 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 1, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0011 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0012
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0012
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0012 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0012 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0013
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0013
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0013 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0013 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0014
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0014
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0014 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 1, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0014 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0015
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0015
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0015 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0015 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0016
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0016
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0016 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0016 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0017
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0017
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0017 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 1, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0017 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0018
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0018
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0018 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0018 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0019
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0019
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0019 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0019 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0020
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0020
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0020 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 1, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0020 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0021
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0021
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0021 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0021 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0022
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0022
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0022 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0022 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0023
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0023
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0023 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 1, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0023 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0024
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0024
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0024 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0024 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0025
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0025
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0025 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0025 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0026
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0026
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0026 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 1, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0026 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0027
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0027
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0027 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0027 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0028
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0028
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0028 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0028 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0029
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0029
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0029 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 1, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0029 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0030
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0030
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0030 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0030 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0031
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0031
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0031 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0031 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0032
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0032
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0032 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 1, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0032 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0033
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0033
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0033 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0033 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0034
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0034
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0034 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0034 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0035
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0035
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0035 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 1, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0035 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0036
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0036
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0036 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0036 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0037
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0037
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0037 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0037 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0038
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0038
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0038 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 1, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0038 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0039
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0039
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0039 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 1, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0039 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0040
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0040
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0040 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0040 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0041
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0041
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0041 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0041 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0042
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0042
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0042 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0042 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0043
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0043
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0043 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0043 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0044
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0044
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0044 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0044 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0045
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0045
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0045 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0045 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0046
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0046
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0046 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0046 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0047
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0047
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0047 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0047 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0048
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0048
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0048 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0048 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0049
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0049
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0049 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0049 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0050
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0050
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0050 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0050 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0051
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0051
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0051 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0051 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0052
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0052
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0052 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0052 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0053
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0053
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0053 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0053 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0054
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0054
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0054 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0054 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0055
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0055
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0055 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0055 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0056
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0056
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0056 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0056 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0057
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0057
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0057 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0057 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0058
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0058
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0058 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0058 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0059
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0059
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0059 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0059 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0060
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0060
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0060 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0060 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0061
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0061
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0061 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0061 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0062
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0062
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0062 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0062 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0063
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0063
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0063 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0063 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0064
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0064
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0064 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0064 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0065
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0065
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0065 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0065 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0066
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0066
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0066 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0066 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0067
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0067
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0067 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0067 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0068
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0068
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0068 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0068 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0069
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0069
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0069 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0069 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0070
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0070
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0070 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0070 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0071
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0071
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0071 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0071 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0072
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0072
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, currentSelec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0072 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0072 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0073
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0073
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0073 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0073 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0074
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0074
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0074 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2026, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0074 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0075
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0075
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0075 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0075 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0076
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0076
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0076 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0076 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0077
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0077
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0077 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0077 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0078
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0078
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0078 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0078 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0079
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0079
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0079 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0079 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0080
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0080
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0080 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2026, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0080 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0081
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0081
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0081 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0081 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0082
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0082
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0082 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0082 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0083
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0083
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0083 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2026, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0083 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0084
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0084
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0084 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0084 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0085
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0085
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0085 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0085 end`);
    });
  });
}
