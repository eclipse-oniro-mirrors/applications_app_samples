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
import { Constants } from '../../../../main/ets/bridge/CalendarSwitchBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CalendarViewSwitch]';
const BUNDLE: string = 'CalendarViewSwitch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for Constants (39 cases). */
export default function constantsValuesTest(): void {
  describe('ConstantsValuesTest', () => {
    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0001
     * @tc.name      CalendarViewSwitch_ConstantsValues_0001
     * @tc.desc      Constants.MONTHS keeps value ["11?","12?"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_ConstantsValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConstantsValues_0001 begin`);
      const actual: string[] = Constants.MONTHS;
      logInfo(`Constants.MONTHS: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`Constants.MONTHS: JSON.stringify(actual.slice(0, 5))=${JSON.stringify(actual.slice(0, 5))}`);
      expect(JSON.stringify(actual.slice(0, 5))).assertEqual('["1\u6708","2\u6708","3\u6708","4\u6708","5\u6708"]');
      logInfo(`Constants.MONTHS: JSON.stringify(actual.slice(5, 10))=${JSON.stringify(actual.slice(5, 10))}`);
      expect(JSON.stringify(actual.slice(5, 10))).assertEqual('["6\u6708","7\u6708","8\u6708","9\u6708","10\u6708"]');
      logInfo(`Constants.MONTHS: JSON.stringify(actual.slice(10, 12))=${JSON.stringify(actual.slice(10, 12))}`);
      expect(JSON.stringify(actual.slice(10, 12))).assertEqual('["11\u6708","12\u6708"]');
      logInfo(`${BUNDLE}ConstantsValues_0001 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0002
     * @tc.name      CalendarViewSwitch_ConstantsValues_0002
     * @tc.desc      Constants.WEEKS keeps value ["?","?","?","?","?","?","?"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CalendarViewSwitch_ConstantsValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ConstantsValues_0002 begin`);
      const actual: string[] = Constants.WEEKS;
      logInfo(`Constants.WEEKS: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(7);
      logInfo(`Constants.WEEKS: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["\u65e5","\u4e00","\u4e8c","\u4e09","\u56db","\u4e94","\u516d"]');
      logInfo(`${BUNDLE}ConstantsValues_0002 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0003
     * @tc.name      CalendarViewSwitch_ConstantsValues_0003
     * @tc.desc      Constants.CHINESE_MONTH keeps value ["?"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0003 begin`);
      const actual: string[] = Constants.CHINESE_MONTH;
      logInfo(`Constants.CHINESE_MONTH: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`Constants.CHINESE_MONTH: JSON.stringify(actual.slice(0, 6))=${JSON.stringify(actual.slice(0, 6))}`);
      expect(JSON.stringify(actual.slice(0, 6))).assertEqual('["\u6b63","\u4e8c","\u4e09","\u56db","\u4e94","\u516d"]');
      logInfo(`Constants.CHINESE_MONTH: JSON.stringify(actual.slice(6, 11))=${JSON.stringify(actual.slice(6, 11))}`);
      expect(JSON.stringify(actual.slice(6, 11))).assertEqual('["\u4e03","\u516b","\u4e5d","\u5341","\u5341\u4e00"]');
      logInfo(`Constants.CHINESE_MONTH: JSON.stringify(actual.slice(11, 12))=${JSON.stringify(actual.slice(11, 12))}`);
      expect(JSON.stringify(actual.slice(11, 12))).assertEqual('["\u814a"]');
      logInfo(`${BUNDLE}ConstantsValues_0003 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0004
     * @tc.name      CalendarViewSwitch_ConstantsValues_0004
     * @tc.desc      Constants.CHINESE_DAY keeps value ["??","??","??"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0004 begin`);
      const actual: string[] = Constants.CHINESE_DAY;
      logInfo(`Constants.CHINESE_DAY: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(30);
      logInfo(`Constants.CHINESE_DAY: JSON.stringify(actual.slice(0, 3))=${JSON.stringify(actual.slice(0, 3))}`);
      expect(JSON.stringify(actual.slice(0, 3))).assertEqual('["\u521d\u4e00","\u521d\u4e8c","\u521d\u4e09"]');
      logInfo(`Constants.CHINESE_DAY: JSON.stringify(actual.slice(15, 18))=${JSON.stringify(actual.slice(15, 18))}`);
      expect(JSON.stringify(actual.slice(15, 18))).assertEqual('["\u5341\u516d","\u5341\u4e03","\u5341\u516b"]');
      logInfo(`Constants.CHINESE_DAY: JSON.stringify(actual.slice(27, 30))=${JSON.stringify(actual.slice(27, 30))}`);
      expect(JSON.stringify(actual.slice(27, 30))).assertEqual('["\u5eff\u516b","\u5eff\u4e5d","\u4e09\u5341"]');
      logInfo(`${BUNDLE}ConstantsValues_0004 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0005
     * @tc.name      CalendarViewSwitch_ConstantsValues_0005
     * @tc.desc      Constants.TOTAL_MILLISECONDS_IN_DAY keeps value 86400000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0005 begin`);
      const actual: number = Constants.TOTAL_MILLISECONDS_IN_DAY;
      logInfo(`Constants.TOTAL_MILLISECONDS_IN_DAY: actual=${actual}`);
      expect(actual).assertEqual(86400000);
      logInfo(`${BUNDLE}ConstantsValues_0005 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0006
     * @tc.name      CalendarViewSwitch_ConstantsValues_0006
     * @tc.desc      Constants.DAYS_IN_WEEK keeps value 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0006 begin`);
      const actual: number = Constants.DAYS_IN_WEEK;
      logInfo(`Constants.DAYS_IN_WEEK: actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}ConstantsValues_0006 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0007
     * @tc.name      CalendarViewSwitch_ConstantsValues_0007
     * @tc.desc      Constants.DAY_FONT_SIZE keeps value 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0007 begin`);
      const actual: number = Constants.DAY_FONT_SIZE;
      logInfo(`Constants.DAY_FONT_SIZE: actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}ConstantsValues_0007 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0008
     * @tc.name      CalendarViewSwitch_ConstantsValues_0008
     * @tc.desc      Constants.LUNAR_DAY_FONT_SIZE keeps value 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0008 begin`);
      const actual: number = Constants.LUNAR_DAY_FONT_SIZE;
      logInfo(`Constants.LUNAR_DAY_FONT_SIZE: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ConstantsValues_0008 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0009
     * @tc.name      CalendarViewSwitch_ConstantsValues_0009
     * @tc.desc      Constants.YEAR_MONTH_FONT_SIZE keeps value 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0009 begin`);
      const actual: number = Constants.YEAR_MONTH_FONT_SIZE;
      logInfo(`Constants.YEAR_MONTH_FONT_SIZE: actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}ConstantsValues_0009 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0010
     * @tc.name      CalendarViewSwitch_ConstantsValues_0010
     * @tc.desc      Constants.FONT_MULTIPLIER keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0010 begin`);
      const actual: number = Constants.FONT_MULTIPLIER;
      logInfo(`Constants.FONT_MULTIPLIER: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ConstantsValues_0010 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0011
     * @tc.name      CalendarViewSwitch_ConstantsValues_0011
     * @tc.desc      Constants.DEFAULT keeps value 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0011 begin`);
      const actual: number = Constants.DEFAULT;
      logInfo(`Constants.DEFAULT: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ConstantsValues_0011 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0012
     * @tc.name      CalendarViewSwitch_ConstantsValues_0012
     * @tc.desc      Constants.MONTHS_NUM keeps value 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0012 begin`);
      const actual: number = Constants.MONTHS_NUM;
      logInfo(`Constants.MONTHS_NUM: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}ConstantsValues_0012 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0013
     * @tc.name      CalendarViewSwitch_ConstantsValues_0013
     * @tc.desc      Constants.FONT_WEIGHT_FIVE_HUNDRED keeps value 500
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0013 begin`);
      const actual: number = Constants.FONT_WEIGHT_FIVE_HUNDRED;
      logInfo(`Constants.FONT_WEIGHT_FIVE_HUNDRED: actual=${actual}`);
      expect(actual).assertEqual(500);
      logInfo(`${BUNDLE}ConstantsValues_0013 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0014
     * @tc.name      CalendarViewSwitch_ConstantsValues_0014
     * @tc.desc      Constants.FONT_WEIGHT_EIGHT_HUNDRED keeps value 800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0014 begin`);
      const actual: number = Constants.FONT_WEIGHT_EIGHT_HUNDRED;
      logInfo(`Constants.FONT_WEIGHT_EIGHT_HUNDRED: actual=${actual}`);
      expect(actual).assertEqual(800);
      logInfo(`${BUNDLE}ConstantsValues_0014 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0018
     * @tc.name      CalendarViewSwitch_ConstantsValues_0018
     * @tc.desc      Constants.YEAR_VIEW_WIDTH keeps value "100%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0018 begin`);
      const actual: number | string = Constants.YEAR_VIEW_WIDTH;
      logInfo(`Constants.YEAR_VIEW_WIDTH: actual=${actual}`);
      expect(actual).assertEqual('100%');
      logInfo(`${BUNDLE}ConstantsValues_0018 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0019
     * @tc.name      CalendarViewSwitch_ConstantsValues_0019
     * @tc.desc      Constants.YEAR_VIEW_HEIGHT keeps value 650
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0019 begin`);
      const actual: number | string = Constants.YEAR_VIEW_HEIGHT;
      logInfo(`Constants.YEAR_VIEW_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(650);
      logInfo(`${BUNDLE}ConstantsValues_0019 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0020
     * @tc.name      CalendarViewSwitch_ConstantsValues_0020
     * @tc.desc      Constants.MONTH_VIEW_HEIGHT keeps value 400
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0020 begin`);
      const actual: number | string = Constants.MONTH_VIEW_HEIGHT;
      logInfo(`Constants.MONTH_VIEW_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(400);
      logInfo(`${BUNDLE}ConstantsValues_0020 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0021
     * @tc.name      CalendarViewSwitch_ConstantsValues_0021
     * @tc.desc      Constants.WEEK_VIEW_HEIGHT keeps value 120
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0021 begin`);
      const actual: number | string = Constants.WEEK_VIEW_HEIGHT;
      logInfo(`Constants.WEEK_VIEW_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(120);
      logInfo(`${BUNDLE}ConstantsValues_0021 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0022
     * @tc.name      CalendarViewSwitch_ConstantsValues_0022
     * @tc.desc      Constants.SCHEDULE_POINT_DIAMETER keeps value 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0022 begin`);
      const actual: number = Constants.SCHEDULE_POINT_DIAMETER;
      logInfo(`Constants.SCHEDULE_POINT_DIAMETER: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}ConstantsValues_0022 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0023
     * @tc.name      CalendarViewSwitch_ConstantsValues_0023
     * @tc.desc      Constants.YEAR_VIEW_FONT_COLOR keeps value "#7e7e7e"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0023 begin`);
      const actual: string = Constants.YEAR_VIEW_FONT_COLOR;
      logInfo(`Constants.YEAR_VIEW_FONT_COLOR: actual=${actual}`);
      expect(actual).assertEqual('#7e7e7e');
      logInfo(`${BUNDLE}ConstantsValues_0023 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0024
     * @tc.name      CalendarViewSwitch_ConstantsValues_0024
     * @tc.desc      Constants.REMINDER_TIME_OPTION keeps value ["1???"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0024 begin`);
      const actual: string[] = Constants.REMINDER_TIME_OPTION;
      logInfo(`Constants.REMINDER_TIME_OPTION: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`Constants.REMINDER_TIME_OPTION: JSON.stringify(actual.slice(0,...${JSON.stringify(actual.slice(0, 2))}`);
      expect(JSON.stringify(actual.slice(0, 2))).assertEqual('["\u51c6\u65f6","1\u5206\u949f\u524d"]');
      logInfo(`Constants.REMINDER_TIME_OPTION: JSON.stringify(actual.slice(2,...${JSON.stringify(actual.slice(2, 4))}`);
      expect(JSON.stringify(actual.slice(2, 4))).assertEqual('["5\u5206\u949f\u524d","30\u5206\u949f\u524d"]');
      logInfo(`Constants.REMINDER_TIME_OPTION: JSON.stringify(actual.slice(4,...${JSON.stringify(actual.slice(4, 5))}`);
      expect(JSON.stringify(actual.slice(4, 5))).assertEqual('["1\u5c0f\u65f6\u524d"]');
      logInfo(`${BUNDLE}ConstantsValues_0024 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0025
     * @tc.name      CalendarViewSwitch_ConstantsValues_0025
     * @tc.desc      Constants.YEAR_VIEW_MONTH_FONT keeps value ["60px 500","70px 500","25px 400"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0025 begin`);
      const actual: string[] = Constants.YEAR_VIEW_MONTH_FONT;
      logInfo(`Constants.YEAR_VIEW_MONTH_FONT: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`Constants.YEAR_VIEW_MONTH_FONT: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["60px 500","70px 500","25px 400"]');
      logInfo(`${BUNDLE}ConstantsValues_0025 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0026
     * @tc.name      CalendarViewSwitch_ConstantsValues_0026
     * @tc.desc      Constants.YEAR_VIEW_WEEK_FONT keeps value ["35px","45px","20px"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0026 begin`);
      const actual: string[] = Constants.YEAR_VIEW_WEEK_FONT;
      logInfo(`Constants.YEAR_VIEW_WEEK_FONT: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`Constants.YEAR_VIEW_WEEK_FONT: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["35px","45px","20px"]');
      logInfo(`${BUNDLE}ConstantsValues_0026 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0027
     * @tc.name      CalendarViewSwitch_ConstantsValues_0027
     * @tc.desc      Constants.YEAR_VIEW_DAY_FONT keeps value ["30px 400","40px 400","16px 400"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0027 begin`);
      const actual: string[] = Constants.YEAR_VIEW_DAY_FONT;
      logInfo(`Constants.YEAR_VIEW_DAY_FONT: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`Constants.YEAR_VIEW_DAY_FONT: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["30px 400","40px 400","16px 400"]');
      logInfo(`${BUNDLE}ConstantsValues_0027 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0028
     * @tc.name      CalendarViewSwitch_ConstantsValues_0028
     * @tc.desc      Constants.YEAR_VIEW_UNDERLINE keeps value ["80px","100px","40px"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0028 begin`);
      const actual: string[] = Constants.YEAR_VIEW_UNDERLINE;
      logInfo(`Constants.YEAR_VIEW_UNDERLINE: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`Constants.YEAR_VIEW_UNDERLINE: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["80px","100px","40px"]');
      logInfo(`${BUNDLE}ConstantsValues_0028 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0029
     * @tc.name      CalendarViewSwitch_ConstantsValues_0029
     * @tc.desc      Constants.YEAR_VIEW_MONTH_HEIGHT keeps value [20,20,15]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0029 begin`);
      const actual: number[] = Constants.YEAR_VIEW_MONTH_HEIGHT;
      logInfo(`Constants.YEAR_VIEW_MONTH_HEIGHT: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`Constants.YEAR_VIEW_MONTH_HEIGHT: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[20,20,15]');
      logInfo(`${BUNDLE}ConstantsValues_0029 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0030
     * @tc.name      CalendarViewSwitch_ConstantsValues_0030
     * @tc.desc      Constants.YEAR_VIEW_HORIZONTAL_OFFSET keeps value [15,30,20]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0030 begin`);
      const actual: number[] = Constants.YEAR_VIEW_HORIZONTAL_OFFSET;
      logInfo(`Constants.YEAR_VIEW_HORIZONTAL_OFFSET: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`Constants.YEAR_VIEW_HORIZONTAL_OFFSET: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[15,30,20]');
      logInfo(`${BUNDLE}ConstantsValues_0030 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0031
     * @tc.name      CalendarViewSwitch_ConstantsValues_0031
     * @tc.desc      Constants.YEAR_VIEW_VERTICAL_OFFSET keeps value [18,18,20]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0031 begin`);
      const actual: number[] = Constants.YEAR_VIEW_VERTICAL_OFFSET;
      logInfo(`Constants.YEAR_VIEW_VERTICAL_OFFSET: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`Constants.YEAR_VIEW_VERTICAL_OFFSET: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[18,18,20]');
      logInfo(`${BUNDLE}ConstantsValues_0031 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0032
     * @tc.name      CalendarViewSwitch_ConstantsValues_0032
     * @tc.desc      Constants.YEAR_VIEW_WEEK_HEIGHT keeps value [40,40,33]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0032 begin`);
      const actual: number[] = Constants.YEAR_VIEW_WEEK_HEIGHT;
      logInfo(`Constants.YEAR_VIEW_WEEK_HEIGHT: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`Constants.YEAR_VIEW_WEEK_HEIGHT: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[40,40,33]');
      logInfo(`${BUNDLE}ConstantsValues_0032 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0033
     * @tc.name      CalendarViewSwitch_ConstantsValues_0033
     * @tc.desc      Constants.YEAR_VIEW_DAY_HEIGHT keeps value [58,58,58]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0033 begin`);
      const actual: number[] = Constants.YEAR_VIEW_DAY_HEIGHT;
      logInfo(`Constants.YEAR_VIEW_DAY_HEIGHT: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`Constants.YEAR_VIEW_DAY_HEIGHT: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[58,58,58]');
      logInfo(`${BUNDLE}ConstantsValues_0033 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0034
     * @tc.name      CalendarViewSwitch_ConstantsValues_0034
     * @tc.desc      Constants.YEAR_VIEW_TODAY_RADIUS keeps value [6,9,7]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0034 begin`);
      const actual: number[] = Constants.YEAR_VIEW_TODAY_RADIUS;
      logInfo(`Constants.YEAR_VIEW_TODAY_RADIUS: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`Constants.YEAR_VIEW_TODAY_RADIUS: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[6,9,7]');
      logInfo(`${BUNDLE}ConstantsValues_0034 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0035
     * @tc.name      CalendarViewSwitch_ConstantsValues_0035
     * @tc.desc      Constants.YEAR_VIEW_TODAY_END_ANGLE keeps value [6.28,6.28,6.28]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0035 begin`);
      const actual: number[] = Constants.YEAR_VIEW_TODAY_END_ANGLE;
      logInfo(`Constants.YEAR_VIEW_TODAY_END_ANGLE: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`Constants.YEAR_VIEW_TODAY_END_ANGLE: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[6.28,6.28,6.28]');
      logInfo(`${BUNDLE}ConstantsValues_0035 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0036
     * @tc.name      CalendarViewSwitch_ConstantsValues_0036
     * @tc.desc      Constants.YEAR_VIEW_INIT_THREE keeps value [3,3,3]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0036 begin`);
      const actual: number[] = Constants.YEAR_VIEW_INIT_THREE;
      logInfo(`Constants.YEAR_VIEW_INIT_THREE: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`Constants.YEAR_VIEW_INIT_THREE: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[3,3,3]');
      logInfo(`${BUNDLE}ConstantsValues_0036 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0037
     * @tc.name      CalendarViewSwitch_ConstantsValues_0037
     * @tc.desc      Constants.YEAR_VIEW_X_AXIS keeps value [0,2,1]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0037 begin`);
      const actual: number[] = Constants.YEAR_VIEW_X_AXIS;
      logInfo(`Constants.YEAR_VIEW_X_AXIS: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`Constants.YEAR_VIEW_X_AXIS: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[0,2,1]');
      logInfo(`${BUNDLE}ConstantsValues_0037 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0038
     * @tc.name      CalendarViewSwitch_ConstantsValues_0038
     * @tc.desc      Constants.YEAR_VIEW_Y_AXIS keeps value [0,1,0]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0038 begin`);
      const actual: number[] = Constants.YEAR_VIEW_Y_AXIS;
      logInfo(`Constants.YEAR_VIEW_Y_AXIS: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(3);
      logInfo(`Constants.YEAR_VIEW_Y_AXIS: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[0,1,0]');
      logInfo(`${BUNDLE}ConstantsValues_0038 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0039
     * @tc.name      CalendarViewSwitch_ConstantsValues_0039
     * @tc.desc      Constants.WEEK_FONT_SIZE keeps value 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0039 begin`);
      const actual: number = Constants.WEEK_FONT_SIZE;
      logInfo(`Constants.WEEK_FONT_SIZE: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}ConstantsValues_0039 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0040
     * @tc.name      CalendarViewSwitch_ConstantsValues_0040
     * @tc.desc      Constants.SELECT_DATE_BORDER_WIDTH keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0040 begin`);
      const actual: number = Constants.SELECT_DATE_BORDER_WIDTH;
      logInfo(`Constants.SELECT_DATE_BORDER_WIDTH: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ConstantsValues_0040 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0041
     * @tc.name      CalendarViewSwitch_ConstantsValues_0041
     * @tc.desc      Constants.MONTH_VIEW_WIDTH keeps value "100%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0041 begin`);
      const actual: number | string = Constants.MONTH_VIEW_WIDTH;
      logInfo(`Constants.MONTH_VIEW_WIDTH: actual=${actual}`);
      expect(actual).assertEqual('100%');
      logInfo(`${BUNDLE}ConstantsValues_0041 end`);
    });

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CONSTANTS_VALUES_0042
     * @tc.name      CalendarViewSwitch_ConstantsValues_0042
     * @tc.desc      Constants.WEEK_VIEW_WIDTH keeps value "100%"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CalendarViewSwitch_ConstantsValues_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ConstantsValues_0042 begin`);
      const actual: number | string = Constants.WEEK_VIEW_WIDTH;
      logInfo(`Constants.WEEK_VIEW_WIDTH: actual=${actual}`);
      expect(actual).assertEqual('100%');
      logInfo(`${BUNDLE}ConstantsValues_0042 end`);
    });
  });
}
