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
import { DayInfo, StyleUtils } from '../../../../main/ets/bridge/CalendarSwitchBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CalendarViewSwitch]';
const BUNDLE: string = 'CalendarViewSwitch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for StyleUtils.getBackgroundColor (30 cases). */
export default function styleUtilsGetBackgroundColorTest(): void {
  describe('StyleUtilsGetBackgroundColorTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0001
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0001
     * @tc.desc      getBackgroundColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0001 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2024, 1, 1, 0), { textScaling: 0, backgroundColor: 1,
        monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 });
      logInfo(`getBackgroundColor(day={dayNum: 1, lunarD...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0002
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0002
     * @tc.desc      getBackgroundColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0002 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2024, 1, 1, 0), { textScaling: -1, backgroundColor: 2,
        monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getBackgroundColor(day={dayNum: 1, lunarD...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0003
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0003
     * @tc.desc      getBackgroundColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0003 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2024, 1, 1, 0), { textScaling: 3, backgroundColor: 10,
        monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' });
      logInfo(`getBackgroundColor(day={dayNum: 1, lunarD...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0004
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0004
     * @tc.desc      getBackgroundColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0004 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2023, 1, 1, 0), { textScaling: 0, backgroundColor: 1,
        monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 });
      logInfo(`getBackgroundColor(day={dayNum: 1, lunarD...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0005
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0005
     * @tc.desc      getBackgroundColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0005 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2023, 1, 1, 0), { textScaling: -1, backgroundColor: 2,
        monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getBackgroundColor(day={dayNum: 1, lunarD...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0005 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0006
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0006
     * @tc.desc      getBackgroundColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0006 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2023, 1, 1, 0), { textScaling: 3, backgroundColor: 10,
        monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' });
      logInfo(`getBackgroundColor(day={dayNum: 1, lunarD...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0006 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0007
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0007
     * @tc.desc      getBackgroundColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0007 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2000, 1, 1, 0), { textScaling: 0, backgroundColor: 1,
        monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 });
      logInfo(`getBackgroundColor(day={dayNum: 1, lunarD...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0007 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0008
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0008
     * @tc.desc      getBackgroundColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0008 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2000, 1, 1, 0), { textScaling: -1, backgroundColor: 2,
        monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getBackgroundColor(day={dayNum: 1, lunarD...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0008 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0009
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0009
     * @tc.desc      getBackgroundColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0009 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2000, 1, 1, 0), { textScaling: 3, backgroundColor: 10,
        monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' });
      logInfo(`getBackgroundColor(day={dayNum: 1, lunarD...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0009 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0010
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0010
     * @tc.desc      getBackgroundColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0010 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(1900, 1, 1, 0), { textScaling: 0, backgroundColor: 1,
        monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 });
      logInfo(`getBackgroundColor(day={dayNum: 1, lunarD...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0010 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0011
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0011
     * @tc.desc      getBackgroundColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0011 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(1900, 1, 1, 0), { textScaling: -1, backgroundColor: 2,
        monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getBackgroundColor(day={dayNum: 1, lunarD...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0011 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0012
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0012
     * @tc.desc      getBackgroundColor(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0012 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(1900, 1, 1, 0), { textScaling: 3, backgroundColor: 10,
        monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' });
      logInfo(`getBackgroundColor(day={dayNum: 1, lunarD...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0012 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0013
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0013
     * @tc.desc      getBackgroundColor(day={dayNum: 28, lunarDay: "invalid", dayInfo: DayInfo(2024, 1, , currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0013 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 28, lunarDay: 'invalid', dayInfo: new DayInfo(2024, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2024, 1, 1, 0), { textScaling: 0, backgroundColor: 1,
        monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 });
      logInfo(`getBackgroundColor(day={dayNum: 28, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0013 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0014
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0014
     * @tc.desc      getBackgroundColor(day={dayNum: 28, lunarDay: "invalid", dayInfo: DayInfo(2024, 1, , currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0014 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 28, lunarDay: 'invalid', dayInfo: new DayInfo(2024, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2024, 1, 1, 0), { textScaling: -1, backgroundColor: 2,
        monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getBackgroundColor(day={dayNum: 28, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0014 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0015
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0015
     * @tc.desc      getBackgroundColor(day={dayNum: 28, lunarDay: "invalid", dayInfo: DayInfo(2024, 1, , currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0015 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 28, lunarDay: 'invalid', dayInfo: new DayInfo(2024, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2024, 1, 1, 0), { textScaling: 3, backgroundColor: 10,
        monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' });
      logInfo(`getBackgroundColor(day={dayNum: 28, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0015 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0016
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0016
     * @tc.desc      getBackgroundColor(day={dayNum: 28, lunarDay: "invalid", dayInfo: DayInfo(2024, 1, , currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0016 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 28, lunarDay: 'invalid', dayInfo: new DayInfo(2024, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2023, 1, 1, 0), { textScaling: 0, backgroundColor: 1,
        monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 });
      logInfo(`getBackgroundColor(day={dayNum: 28, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0016 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0017
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0017
     * @tc.desc      getBackgroundColor(day={dayNum: 28, lunarDay: "invalid", dayInfo: DayInfo(2024, 1, , currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0017 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 28, lunarDay: 'invalid', dayInfo: new DayInfo(2024, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2023, 1, 1, 0), { textScaling: -1, backgroundColor: 2,
        monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getBackgroundColor(day={dayNum: 28, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0017 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0018
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0018
     * @tc.desc      getBackgroundColor(day={dayNum: 28, lunarDay: "invalid", dayInfo: DayInfo(2024, 1, , currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0018 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 28, lunarDay: 'invalid', dayInfo: new DayInfo(2024, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2023, 1, 1, 0), { textScaling: 3, backgroundColor: 10,
        monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' });
      logInfo(`getBackgroundColor(day={dayNum: 28, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0018 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0019
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0019
     * @tc.desc      getBackgroundColor(day={dayNum: 28, lunarDay: "invalid", dayInfo: DayInfo(2024, 1, , currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0019 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 28, lunarDay: 'invalid', dayInfo: new DayInfo(2024, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2000, 1, 1, 0), { textScaling: 0, backgroundColor: 1,
        monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 });
      logInfo(`getBackgroundColor(day={dayNum: 28, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0019 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0020
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0020
     * @tc.desc      getBackgroundColor(day={dayNum: 28, lunarDay: "invalid", dayInfo: DayInfo(2024, 1, , currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0020 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 28, lunarDay: 'invalid', dayInfo: new DayInfo(2024, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2000, 1, 1, 0), { textScaling: -1, backgroundColor: 2,
        monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getBackgroundColor(day={dayNum: 28, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0020 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0021
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0021
     * @tc.desc      getBackgroundColor(day={dayNum: 28, lunarDay: "invalid", dayInfo: DayInfo(2024, 1, , currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0021 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 28, lunarDay: 'invalid', dayInfo: new DayInfo(2024, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(2000, 1, 1, 0), { textScaling: 3, backgroundColor: 10,
        monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' });
      logInfo(`getBackgroundColor(day={dayNum: 28, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0021 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0022
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0022
     * @tc.desc      getBackgroundColor(day={dayNum: 28, lunarDay: "invalid", dayInfo: DayInfo(2024, 1, , currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0022 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 28, lunarDay: 'invalid', dayInfo: new DayInfo(2024, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(1900, 1, 1, 0), { textScaling: 0, backgroundColor: 1,
        monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 });
      logInfo(`getBackgroundColor(day={dayNum: 28, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0022 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0023
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0023
     * @tc.desc      getBackgroundColor(day={dayNum: 28, lunarDay: "invalid", dayInfo: DayInfo(2024, 1, , currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0023 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 28, lunarDay: 'invalid', dayInfo: new DayInfo(2024, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(1900, 1, 1, 0), { textScaling: -1, backgroundColor: 2,
        monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getBackgroundColor(day={dayNum: 28, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0023 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0024
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0024
     * @tc.desc      getBackgroundColor(day={dayNum: 28, lunarDay: "invalid", dayInfo: DayInfo(2024, 1, , currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0024 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 28, lunarDay: 'invalid', dayInfo: new DayInfo(2024, 1, 1,
        0), isShowSchedulePoint: false }, new DayInfo(1900, 1, 1, 0), { textScaling: 3, backgroundColor: 10,
        monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' });
      logInfo(`getBackgroundColor(day={dayNum: 28, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0024 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0025
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0025
     * @tc.desc      getBackgroundColor(day={dayNum: 30, lunarDay: "abc", dayInfo: DayInfo(2000, 1, 1, 0, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0025 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 30, lunarDay: 'abc', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, new DayInfo(2024, 1, 1, 0), { textScaling: 0, backgroundColor: 1,
        monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 });
      logInfo(`getBackgroundColor(day={dayNum: 30, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0025 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0026
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0026
     * @tc.desc      getBackgroundColor(day={dayNum: 30, lunarDay: "abc", dayInfo: DayInfo(2000, 1, 1, 0, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0026 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 30, lunarDay: 'abc', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, new DayInfo(2024, 1, 1, 0), { textScaling: -1, backgroundColor: 2,
        monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getBackgroundColor(day={dayNum: 30, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0026 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0027
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0027
     * @tc.desc      getBackgroundColor(day={dayNum: 30, lunarDay: "abc", dayInfo: DayInfo(2000, 1, 1, 0, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0027 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 30, lunarDay: 'abc', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, new DayInfo(2024, 1, 1, 0), { textScaling: 3, backgroundColor: 10,
        monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' });
      logInfo(`getBackgroundColor(day={dayNum: 30, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0027 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0028
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0028
     * @tc.desc      getBackgroundColor(day={dayNum: 30, lunarDay: "abc", dayInfo: DayInfo(2000, 1, 1, 0, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0028 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 30, lunarDay: 'abc', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, new DayInfo(2023, 1, 1, 0), { textScaling: 0, backgroundColor: 1,
        monthDayColor: 6, noMonthDayColor: 12, lunarColor: 3 });
      logInfo(`getBackgroundColor(day={dayNum: 30, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0028 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0029
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0029
     * @tc.desc      getBackgroundColor(day={dayNum: 30, lunarDay: "abc", dayInfo: DayInfo(2000, 1, 1, 0, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0029 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 30, lunarDay: 'abc', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, new DayInfo(2023, 1, 1, 0), { textScaling: -1, backgroundColor: 2,
        monthDayColor: 0, noMonthDayColor: 13, lunarColor: 100 });
      logInfo(`getBackgroundColor(day={dayNum: 30, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0029 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BACKGROUND_COLOR_0030
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBackgroundColor_0030
     * @tc.desc      getBackgroundColor(day={dayNum: 30, lunarDay: "abc", dayInfo: DayInfo(2000, 1, 1, 0, currentSele...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBackgroundColor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0030 begin`);
      const actual = StyleUtils.getBackgroundColor({ dayNum: 30, lunarDay: 'abc', dayInfo: new DayInfo(2000, 1, 1, 0),
        isShowSchedulePoint: false }, new DayInfo(2023, 1, 1, 0), { textScaling: 3, backgroundColor: 10,
        monthDayColor: -1, noMonthDayColor: 3, lunarColor: '' });
      logInfo(`getBackgroundColor(day={dayNum: 30, lunar...: actual=${actual}`);
      expect(actual).assertEqual(Color.Transparent);
      logInfo(`${BUNDLE}StyleUtilsGetBackgroundColor_0030 end`);
    });
  });
}
