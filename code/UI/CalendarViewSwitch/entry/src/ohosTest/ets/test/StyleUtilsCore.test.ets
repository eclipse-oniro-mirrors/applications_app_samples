/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  StyleUtils, DayInfo, Day, CalendarStyle, Constants, CalendarViewType
} from '../../../main/ets/bridge/CalendarSwitchBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'StyleUtilsCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function makeDay(year: number, month: number, date: number): Day {
  return { dayNum: date, lunarDay: '初一', dayInfo: new DayInfo(year, month, date, 1), isShowSchedulePoint: false };
}

export default function styleUtilsCoreTest(): void {
  describe('StyleUtilsCoreTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0401
     * @tc.name      testStyleCore0401
     * @tc.desc      Checks selected today renders white in the month view.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0401 begin');
      const day: Day = makeDay(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY);
      const select: DayInfo = new DayInfo(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY, 0);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource =
        StyleUtils.getColor(day, Constants.TODAY_MONTH, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.White`);
      expect(actual).assertEqual(Color.White);
      log('testStyleCore0401 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0402
     * @tc.name      testStyleCore0402
     * @tc.desc      Checks unselected today renders red in the month view.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0402 begin');
      const day: Day = makeDay(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource =
        StyleUtils.getColor(day, Constants.TODAY_MONTH, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Red`);
      expect(actual).assertEqual(Color.Red);
      log('testStyleCore0402 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0403
     * @tc.name      testStyleCore0403
     * @tc.desc      Checks a selected non-today current-month day renders black by default.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0403 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource =
        StyleUtils.getColor(day, 5, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Black`);
      expect(actual).assertEqual(Color.Black);
      log('testStyleCore0403 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0404
     * @tc.name      testStyleCore0404
     * @tc.desc      Checks a non-current-month day renders gray in the month view.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0404 begin');
      const day: Day = makeDay(2023, 6, 3);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource =
        StyleUtils.getColor(day, 5, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Gray`);
      expect(actual).assertEqual(Color.Gray);
      log('testStyleCore0404 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0405
     * @tc.name      testStyleCore0405
     * @tc.desc      Checks the week view ignores the non-current-month gray rule.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0405 begin');
      const day: Day = makeDay(2023, 6, 3);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource =
        StyleUtils.getColor(day, 5, select, CalendarViewType.WEEK, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Black`);
      expect(actual).assertEqual(Color.Black);
      log('testStyleCore0405 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0406
     * @tc.name      testStyleCore0406
     * @tc.desc      Checks selected today renders white in the week view too.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0406 begin');
      const day: Day = makeDay(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY);
      const select: DayInfo = new DayInfo(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY, 0);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource =
        StyleUtils.getColor(day, Constants.TODAY_MONTH, select, CalendarViewType.WEEK, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.White`);
      expect(actual).assertEqual(Color.White);
      log('testStyleCore0406 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0407
     * @tc.name      testStyleCore0407
     * @tc.desc      Checks a custom monthDayColor is returned for ordinary days.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0407 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = { monthDayColor: Color.Green };
      const actual: Color | number | string | Resource =
        StyleUtils.getColor(day, 5, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Green`);
      expect(actual).assertEqual(Color.Green);
      log('testStyleCore0407 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0408
     * @tc.name      testStyleCore0408
     * @tc.desc      Checks a custom numeric noMonthDayColor is returned in the month view.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0408 begin');
      const day: Day = makeDay(2023, 6, 3);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = { noMonthDayColor: 0xFF00FF };
      const actual: Color | number | string | Resource =
        StyleUtils.getColor(day, 5, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0xFF00FF`);
      expect(actual).assertEqual(0xFF00FF);
      log('testStyleCore0408 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0409
     * @tc.name      testStyleCore0409
     * @tc.desc      Checks noMonthDayColor is ignored by the week view.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0409 begin');
      const day: Day = makeDay(2023, 6, 3);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = { noMonthDayColor: 0xFF00FF, monthDayColor: Color.Green };
      const actual: Color | number | string | Resource =
        StyleUtils.getColor(day, 5, select, CalendarViewType.WEEK, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Green`);
      expect(actual).assertEqual(Color.Green);
      log('testStyleCore0409 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0410
     * @tc.name      testStyleCore0410
     * @tc.desc      Checks same month of a past year counts as the current month column.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0410 begin');
      const day: Day = makeDay(Constants.TODAY_YEAR - 1, Constants.TODAY_MONTH, 1);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource =
        StyleUtils.getColor(day, Constants.TODAY_MONTH, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Black`);
      expect(actual).assertEqual(Color.Black);
      log('testStyleCore0410 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0411
     * @tc.name      testStyleCore0411
     * @tc.desc      Checks selected today lunar text renders white.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0411 begin');
      const day: Day = makeDay(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY);
      const select: DayInfo = new DayInfo(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY, 0);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource =
        StyleUtils.getLunarDayColor(day, Constants.TODAY_MONTH, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.White`);
      expect(actual).assertEqual(Color.White);
      log('testStyleCore0411 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0412
     * @tc.name      testStyleCore0412
     * @tc.desc      Checks unselected today lunar text renders red.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0412 begin');
      const day: Day = makeDay(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource =
        StyleUtils.getLunarDayColor(day, Constants.TODAY_MONTH, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Red`);
      expect(actual).assertEqual(Color.Red);
      log('testStyleCore0412 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0413
     * @tc.name      testStyleCore0413
     * @tc.desc      Checks ordinary lunar text renders gray by default.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0413 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource =
        StyleUtils.getLunarDayColor(day, 5, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Gray`);
      expect(actual).assertEqual(Color.Gray);
      log('testStyleCore0413 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0414
     * @tc.name      testStyleCore0414
     * @tc.desc      Checks non-current-month lunar text renders gray.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0414 begin');
      const day: Day = makeDay(2023, 6, 3);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource =
        StyleUtils.getLunarDayColor(day, 5, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Gray`);
      expect(actual).assertEqual(Color.Gray);
      log('testStyleCore0414 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0415
     * @tc.name      testStyleCore0415
     * @tc.desc      Checks a custom lunarColor is returned for ordinary days.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0415 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = { lunarColor: 0x00FF00 };
      const actual: Color | number | string | Resource =
        StyleUtils.getLunarDayColor(day, 5, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0x00FF00`);
      expect(actual).assertEqual(0x00FF00);
      log('testStyleCore0415 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0416
     * @tc.name      testStyleCore0416
     * @tc.desc      Checks week view lunar text renders gray for ordinary days.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0416 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource =
        StyleUtils.getLunarDayColor(day, 5, select, CalendarViewType.WEEK, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Gray`);
      expect(actual).assertEqual(Color.Gray);
      log('testStyleCore0416 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0417
     * @tc.name      testStyleCore0417
     * @tc.desc      Checks selected today background defaults to red.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0417 begin');
      const day: Day = makeDay(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY);
      const select: DayInfo = new DayInfo(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY, 0);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource = StyleUtils.getBackgroundColor(day, select, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Red`);
      expect(actual).assertEqual(Color.Red);
      log('testStyleCore0417 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0418
     * @tc.name      testStyleCore0418
     * @tc.desc      Checks selected today background uses the custom color.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0418 begin');
      const day: Day = makeDay(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY);
      const select: DayInfo = new DayInfo(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY, 0);
      const style: CalendarStyle = { backgroundColor: Color.Blue };
      const actual: Color | number | string | Resource = StyleUtils.getBackgroundColor(day, select, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Blue`);
      expect(actual).assertEqual(Color.Blue);
      log('testStyleCore0418 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0419
     * @tc.name      testStyleCore0419
     * @tc.desc      Checks unselected today background stays transparent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0419 begin');
      const day: Day = makeDay(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource = StyleUtils.getBackgroundColor(day, select, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Transparent`);
      expect(actual).assertEqual(Color.Transparent);
      log('testStyleCore0419 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0420
     * @tc.name      testStyleCore0420
     * @tc.desc      Checks a selected non-today background stays transparent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0420 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource = StyleUtils.getBackgroundColor(day, select, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Transparent`);
      expect(actual).assertEqual(Color.Transparent);
      log('testStyleCore0420 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0421
     * @tc.name      testStyleCore0421
     * @tc.desc      Checks non-today background stays transparent even with a custom style.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0421 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = { backgroundColor: Color.Blue };
      const actual: Color | number | string | Resource = StyleUtils.getBackgroundColor(day, select, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Transparent`);
      expect(actual).assertEqual(Color.Transparent);
      log('testStyleCore0421 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0422
     * @tc.name      testStyleCore0422
     * @tc.desc      Checks selected non-today current-month day gets a border in month view.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0422 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const actual: number = StyleUtils.getBorderWidth(day, 5, select, CalendarViewType.MONTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1`);
      expect(actual).assertEqual(1);
      log('testStyleCore0422 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0423
     * @tc.name      testStyleCore0423
     * @tc.desc      Checks month view skips the border when the month does not match.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0423 begin');
      const day: Day = makeDay(2023, 6, 3);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const actual: number = StyleUtils.getBorderWidth(day, 5, select, CalendarViewType.MONTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      log('testStyleCore0423 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0424
     * @tc.name      testStyleCore0424
     * @tc.desc      Checks selected today gets no border because today uses a background.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0424 begin');
      const day: Day = makeDay(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY);
      const select: DayInfo = new DayInfo(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY, 0);
      const actual: number = StyleUtils.getBorderWidth(day, Constants.TODAY_MONTH, select, CalendarViewType.MONTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      log('testStyleCore0424 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0425
     * @tc.name      testStyleCore0425
     * @tc.desc      Checks unselected days get no border in month view.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0425 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 6, 20, 2);
      const actual: number = StyleUtils.getBorderWidth(day, 5, select, CalendarViewType.MONTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      log('testStyleCore0425 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0426
     * @tc.name      testStyleCore0426
     * @tc.desc      Checks selected non-today days get a border in week view.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0426 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const actual: number = StyleUtils.getBorderWidth(day, 5, select, CalendarViewType.WEEK);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1`);
      expect(actual).assertEqual(1);
      log('testStyleCore0426 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0427
     * @tc.name      testStyleCore0427
     * @tc.desc      Checks week view border ignores the month parameter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0427 begin');
      const day: Day = makeDay(2023, 6, 3);
      const select: DayInfo = new DayInfo(2023, 6, 3, 1);
      const actual: number = StyleUtils.getBorderWidth(day, 5, select, CalendarViewType.WEEK);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1`);
      expect(actual).assertEqual(1);
      log('testStyleCore0427 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0428
     * @tc.name      testStyleCore0428
     * @tc.desc      Checks selected today gets no border in week view.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0428 begin');
      const day: Day = makeDay(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY);
      const select: DayInfo = new DayInfo(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY, 0);
      const actual: number = StyleUtils.getBorderWidth(day, Constants.TODAY_MONTH, select, CalendarViewType.WEEK);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      log('testStyleCore0428 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0429
     * @tc.name      testStyleCore0429
     * @tc.desc      Checks the selected border equals the SELECT_DATE_BORDER_WIDTH constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0429 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const actual: number = StyleUtils.getBorderWidth(day, 5, select, CalendarViewType.MONTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Constants.SELECT_DATE_BORDE...`);
      expect(actual).assertEqual(Constants.SELECT_DATE_BORDER_WIDTH);
      log('testStyleCore0429 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0430
     * @tc.name      testStyleCore0430
     * @tc.desc      Checks the default border equals the DEFAULT constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0430 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 6, 20, 2);
      const actual: number = StyleUtils.getBorderWidth(day, 5, select, CalendarViewType.MONTH);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Constants.DEFAULT`);
      expect(actual).assertEqual(Constants.DEFAULT);
      log('testStyleCore0430 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0431
     * @tc.name      testStyleCore0431
     * @tc.desc      Checks the unsupported YEAR view type falls back to the default border.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0431 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const actual: number = StyleUtils.getBorderWidth(day, 5, select, CalendarViewType.YEAR);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      log('testStyleCore0431 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0432
     * @tc.name      testStyleCore0432
     * @tc.desc      Checks a string monthDayColor is passed through unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0432 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = { monthDayColor: '#123456' };
      const actual: Color | number | string | Resource =
        StyleUtils.getColor(day, 5, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='#123456'`);
      expect(actual).assertEqual('#123456');
      log('testStyleCore0432 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0433
     * @tc.name      testStyleCore0433
     * @tc.desc      Checks a string backgroundColor is passed through unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0433 begin');
      const day: Day = makeDay(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY);
      const select: DayInfo = new DayInfo(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY, 0);
      const style: CalendarStyle = { backgroundColor: '#ABCDEF' };
      const actual: Color | number | string | Resource = StyleUtils.getBackgroundColor(day, select, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='#ABCDEF'`);
      expect(actual).assertEqual('#ABCDEF');
      log('testStyleCore0433 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0434
     * @tc.name      testStyleCore0434
     * @tc.desc      Checks a string lunarColor is passed through unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0434 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = { lunarColor: '#0F0F0F' };
      const actual: Color | number | string | Resource =
        StyleUtils.getLunarDayColor(day, 5, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected='#0F0F0F'`);
      expect(actual).assertEqual('#0F0F0F');
      log('testStyleCore0434 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0435
     * @tc.name      testStyleCore0435
     * @tc.desc      Checks selected today stays white even with a fully custom style.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0435 begin');
      const day: Day = makeDay(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY);
      const select: DayInfo = new DayInfo(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY, 0);
      const style: CalendarStyle = { monthDayColor: Color.Green, noMonthDayColor: 0xFF00FF };
      const actual: Color | number | string | Resource =
        StyleUtils.getColor(day, Constants.TODAY_MONTH, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.White`);
      expect(actual).assertEqual(Color.White);
      log('testStyleCore0435 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0436
     * @tc.name      testStyleCore0436
     * @tc.desc      Checks the default day color and its runtime type match Color.Black.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0436 begin');
      const day: Day = makeDay(2023, 5, 15);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = {};
      const actual: Color | number | string | Resource =
        StyleUtils.getColor(day, 5, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', 'assertEqual actual=' + actual + ', expected=' + Color.Black);
      expect(actual).assertEqual(Color.Black);
      hilog.info(DOMAIN, TAG, '%{public}s', 'assertEqual typeof actual=' + typeof actual +
        ', expected=' + typeof Color.Black);
      expect(typeof actual).assertEqual(typeof Color.Black);
      log('testStyleCore0436 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0437
     * @tc.name      testStyleCore0437
     * @tc.desc      Checks unselected today gets no border in week view.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0437 begin');
      const day: Day = makeDay(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const actual: number = StyleUtils.getBorderWidth(day, Constants.TODAY_MONTH, select, CalendarViewType.WEEK);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      log('testStyleCore0437 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0438
     * @tc.name      testStyleCore0438
     * @tc.desc      Checks custom noMonthDayColor applies regardless of selection state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0438 begin');
      const day: Day = makeDay(2023, 6, 3);
      const select: DayInfo = new DayInfo(2023, 6, 3, 1);
      const style: CalendarStyle = { noMonthDayColor: 0xFF00FF };
      const actual: Color | number | string | Resource =
        StyleUtils.getColor(day, 5, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0xFF00FF`);
      expect(actual).assertEqual(0xFF00FF);
      log('testStyleCore0438 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0439
     * @tc.name      testStyleCore0439
     * @tc.desc      Checks non-current-month lunar color ignores the custom lunarColor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0439 begin');
      const day: Day = makeDay(2023, 2, 10);
      const select: DayInfo = new DayInfo(2023, 5, 15, 1);
      const style: CalendarStyle = { lunarColor: 0x00FF00 };
      const actual: Color | number | string | Resource =
        StyleUtils.getLunarDayColor(day, 3, select, CalendarViewType.MONTH, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Gray`);
      expect(actual).assertEqual(Color.Gray);
      log('testStyleCore0439 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_STYLECORE_0440
     * @tc.name      testStyleCore0440
     * @tc.desc      Checks a past-year same-month day background stays transparent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStyleCore0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testStyleCore0440 begin');
      const day: Day = makeDay(Constants.TODAY_YEAR - 1, Constants.TODAY_MONTH, Constants.TODAY);
      const select: DayInfo = new DayInfo(Constants.TODAY_YEAR, Constants.TODAY_MONTH, Constants.TODAY, 0);
      const style: CalendarStyle = { backgroundColor: Color.Blue };
      const actual: Color | number | string | Resource = StyleUtils.getBackgroundColor(day, select, style);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=Color.Transparent`);
      expect(actual).assertEqual(Color.Transparent);
      log('testStyleCore0440 end');
    })
  })
}
