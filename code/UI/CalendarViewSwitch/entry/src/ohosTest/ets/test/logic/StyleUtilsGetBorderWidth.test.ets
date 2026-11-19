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

/** Logic checks for StyleUtils.getBorderWidth (50 cases). */
export default function styleUtilsGetBorderWidthTest(): void {
  describe('StyleUtilsGetBorderWidthTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0001
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0001
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0001 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 1, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0002
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0002
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0002 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 1, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0003
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0003
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0003 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 1, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0004
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0004
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0004 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 1, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0005
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0005
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0005 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 1, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0005 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0006
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0006
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0006 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 1, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0006 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0007
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0007
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0007 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 1, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0007 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0008
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0008
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0008 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 1, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0008 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0009
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0009
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0009 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 1, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0009 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0010
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0010
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0010 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 1, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0010 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0011
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0011
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0011 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 1, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0011 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0012
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0012
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=1, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0012 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 1, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0012 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0013
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0013
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0013 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0013 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0014
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0014
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0014 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0014 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0015
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0015
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0015 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0015 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0016
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0016
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0016 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0016 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0017
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0017
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0017 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0017 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0018
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0018
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0018 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0018 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0019
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0019
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0019 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0019 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0020
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0020
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0020 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0020 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0021
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0021
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0021 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0021 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0022
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0022
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0022 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0022 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0023
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0023
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0023 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0023 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0024
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0024
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2, curren...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0024 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0024 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0025
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0025
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0025 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2026, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0025 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0026
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0026
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0026 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2026, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0026 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0027
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0027
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0027 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2026, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0027 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0028
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0028
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0028 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2026, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0028 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0029
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0029
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0029 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2026, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0029 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0030
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0030
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0030 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2026, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0030 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0031
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0031
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0031 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2026, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0031 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0032
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0032
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0032 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2026, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0032 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0033
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0033
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0033 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2026, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0033 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0034
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0034
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0034 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2026, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0034 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0035
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0035
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0035 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2026, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0035 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0036
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0036
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2026, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0036 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2026, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0036 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0037
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0037
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0037 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2025, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0037 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0038
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0038
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0038 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2025, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0038 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0039
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0039
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0039 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2025, new DayInfo(2024, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0039 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0040
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0040
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0040 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2025, new DayInfo(2023, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0040 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0041
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0041
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0041 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2025, new DayInfo(2023, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0041 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0042
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0042
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0042 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2025, new DayInfo(2023, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0042 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0043
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0043
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0043 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2025, new DayInfo(2000, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0043 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0044
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0044
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0044 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2025, new DayInfo(2000, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0044 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0045
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0045
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0045 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2025, new DayInfo(2000, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0045 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0046
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0046
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0046 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2025, new DayInfo(1900, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0046 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0047
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0047
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0047 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2025, new DayInfo(1900, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0047 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0048
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0048
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2025, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0048 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2025, new DayInfo(1900, 1, 1, 0), CalendarViewType.WEEK);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0048 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0049
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0049
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2027, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0049 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2027, new DayInfo(2024, 1, 1, 0), CalendarViewType.YEAR);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0049 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLE_UTILS_GET_BORDER_WIDTH_0050
     * @tc.name      CalendarViewSwitch_StyleUtilsGetBorderWidth_0050
     * @tc.desc      getBorderWidth(day={dayNum: 1, lunarDay: "2023-12-31", dayInfo: DayInfo(2000, 1, month=2027, cur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CalendarViewSwitch_StyleUtilsGetBorderWidth_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0050 begin`);
      const actual: number = StyleUtils.getBorderWidth({ dayNum: 1, lunarDay: '2023-12-31', dayInfo: new DayInfo(2000,
        1, 1, 0), isShowSchedulePoint: false }, 2027, new DayInfo(2024, 1, 1, 0), CalendarViewType.MONTH);
      logInfo(`getBorderWidth(day={dayNum: 1, lunarDay: ...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}StyleUtilsGetBorderWidth_0050 end`);
    });
  });
}
