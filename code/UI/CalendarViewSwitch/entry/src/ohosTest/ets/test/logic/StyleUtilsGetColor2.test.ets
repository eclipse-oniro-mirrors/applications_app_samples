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

/** Logic checks for StyleUtils.getColor (65 cases). */
export default function styleUtilsGetColor2Test(): void {
  describe('StyleUtilsGetColor2Test', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0086
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0086
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0086 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0086 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0087
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0087
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0087 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0087 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0088
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0088
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0088 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0088 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0089
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0089
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0089 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2026, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0089 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0090
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0090
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0090 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0090 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0091
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0091
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0091 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0091 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0092
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0092
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0092 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2026, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0092 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0093
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0093
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0093 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0093 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0094
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0094
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0094 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0094 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0095
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0095
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0095 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0095 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0096
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0096
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0096 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0096 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0097
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0097
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0097 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0097 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0098
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0098
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0098 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2026, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0098 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0099
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0099
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0099 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0099 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0100
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0100
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0100 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0100 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0101
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0101
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0101 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2026, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0101 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0102
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0102
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0102 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0102 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0103
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0103
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0103 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0103 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0104
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0104
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0104 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0104 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0105
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0105
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0105 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0105 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0106
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0106
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0106 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0106 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0107
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0107
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0107 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2026, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0107 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0108
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0108
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0108 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2026, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0108 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0109
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0109
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0109 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0109 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0110
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0110
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0110 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2025, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0110 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0111
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0111
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0111 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0111 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0112
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0112
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0112 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0112 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0113
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0113
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0113 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0113 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0114
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0114
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0114 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0114 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0115
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0115
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0115 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0115 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0116
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0116
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0116 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2025, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0116 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0117
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0117
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0117 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0117 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0118
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0118
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0118 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0118 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0119
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0119
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0119 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2025, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0119 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0120
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0120
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0120 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0120 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0121
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0121
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0121 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0121 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0122
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0122
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0122 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0122 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0123
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0123
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0123 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0123 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0124
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0124
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0124 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0124 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0125
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0125
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0125 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2025, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0125 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0126
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0126
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0126 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0126 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0127
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0127
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0127 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0127 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0128
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0128
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0128 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2025, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0128 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0129
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0129
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0129 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0129 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0130
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0130
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0130 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0130 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0131
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0131
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0131 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0131 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0132
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0132
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0132 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0132 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0133
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0133
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0133 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0133 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0134
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0134
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0134 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2025, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0134 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0135
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0135
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0135 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0135 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0136
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0136
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0136 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0136 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0137
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0137
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0137 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2025, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0137 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0138
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0138
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0138 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0138 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0139
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0139
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0139 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0139 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0140
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0140
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0140 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0140 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0141
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0141
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0141 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0141 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0142
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0142
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0142 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0142 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0143
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0143
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0143 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2025, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0143 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0144
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0144
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0144 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2025, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0144 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0145
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0145
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2027, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0145 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2027, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0145 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0146
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0146
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2027, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0146 begin`);
      const actual = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, 2027, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(Color.Black);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0146 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0147
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0147
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2027, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0147 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2027, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0147 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0148
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0148
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2027, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0148 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2027, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 0,
        backgroundColor: 1, monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0148 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0149
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0149
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2027, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0149 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2027, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH, { textScaling: -1,
        backgroundColor: 2, monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0149 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_COLOR_0150
     * @tc.name      CalendarViewSwitch_StyleUtilsGetColor_0150
     * @tc.desc      getColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2027, currentSe...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetColor_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetColor_0150 begin`);
      const actual: number = StyleUtils.getColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, 2027, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH, { textScaling: 3,
        backgroundColor: 10, monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' }) as number;
      logInfo(`getColor(day={dayNum: 1, lunarDay: "2023-...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}StyleUtilsGetColor_0150 end`);
    });
  });
}
