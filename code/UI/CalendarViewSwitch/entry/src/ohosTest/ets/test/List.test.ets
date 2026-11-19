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
import { beforeEachIt } from '@ohos/hypium';
import abilityTest from './Ability.test';
import timeUtilsMonthCoreTest from './TimeUtilsMonthCore.test';
import timeUtilsYearMonthNavTest from './TimeUtilsYearMonthNav.test';
import timeUtilsLunarCoreTest from './TimeUtilsLunarCore.test';
import timeUtilsCalendarMatrixTest from './TimeUtilsCalendarMatrix.test';
import styleUtilsCoreTest from './StyleUtilsCore.test';
import dataModelCoreTest from './DataModelCore.test';
import timeUtilsGetWeekDayTest from './logic/TimeUtilsGetWeekDay.test';
import timeUtilsGetWeekDay2Test from './logic/TimeUtilsGetWeekDay2.test';
import timeUtilsGetLastDayOfMonthTest from './logic/TimeUtilsGetLastDayOfMonth.test';
import timeUtilsGetLastDayOfMonth2Test from './logic/TimeUtilsGetLastDayOfMonth2.test';
import timeUtilsGetPreviousMonthLastDaysTest from './logic/TimeUtilsGetPreviousMonthLastDays.test';
import timeUtilsGetPreviousMonthLastDays2Test from './logic/TimeUtilsGetPreviousMonthLastDays2.test';
import timeUtilsGetPreviousMonthLastDays3Test from './logic/TimeUtilsGetPreviousMonthLastDays3.test';
import timeUtilsGetCurrentMonthDaysTest from './logic/TimeUtilsGetCurrentMonthDays.test';
import timeUtilsGetCurrentMonthDays2Test from './logic/TimeUtilsGetCurrentMonthDays2.test';
import timeUtilsLunarMonthToChineseTest from './logic/TimeUtilsLunarMonthToChinese.test';
import timeUtilsLunarMonthToChinese2Test from './logic/TimeUtilsLunarMonthToChinese2.test';
import timeUtilsLunarDayToChineseTest from './logic/TimeUtilsLunarDayToChinese.test';
import timeUtilsLunarDayToChinese2Test from './logic/TimeUtilsLunarDayToChinese2.test';
import timeUtilsGetMonthDaysTest from './logic/TimeUtilsGetMonthDays.test';
import timeUtilsGetMonthDays2Test from './logic/TimeUtilsGetMonthDays2.test';
import timeUtilsGetLastYearMonthTest from './logic/TimeUtilsGetLastYearMonth.test';
import timeUtilsGetLastYearMonth2Test from './logic/TimeUtilsGetLastYearMonth2.test';
import timeUtilsGetNextYearMonthTest from './logic/TimeUtilsGetNextYearMonth.test';
import timeUtilsGetNextYearMonth2Test from './logic/TimeUtilsGetNextYearMonth2.test';
import timeUtilsGetLastYearTest from './logic/TimeUtilsGetLastYear.test';
import timeUtilsGetLastYear2Test from './logic/TimeUtilsGetLastYear2.test';
import timeUtilsGetLastMonthTest from './logic/TimeUtilsGetLastMonth.test';
import timeUtilsGetLastMonth2Test from './logic/TimeUtilsGetLastMonth2.test';
import timeUtilsGetNextYearTest from './logic/TimeUtilsGetNextYear.test';
import timeUtilsGetNextYear2Test from './logic/TimeUtilsGetNextYear2.test';
import timeUtilsGetNextMonthTest from './logic/TimeUtilsGetNextMonth.test';
import timeUtilsGetNextMonth2Test from './logic/TimeUtilsGetNextMonth2.test';
import styleUtilsGetColorTest from './logic/StyleUtilsGetColor.test';
import styleUtilsGetColor2Test from './logic/StyleUtilsGetColor2.test';
import styleUtilsGetLunarDayColorTest from './logic/StyleUtilsGetLunarDayColor.test';
import styleUtilsGetBackgroundColorTest from './logic/StyleUtilsGetBackgroundColor.test';
import styleUtilsGetBorderWidthTest from './logic/StyleUtilsGetBorderWidth.test';
import dayInfoCtorTest from './logic/DayInfoCtor.test';
import dayInfoCtor2Test from './logic/DayInfoCtor2.test';
import calendarViewTypeValuesTest from './logic/CalendarViewTypeValues.test';
import deviceTypeValuesTest from './logic/DeviceTypeValues.test';
import constantsValuesTest from './logic/ConstantsValues.test';
import commonDataValuesTest from './logic/CommonDataValues.test';

async function yieldToEventLoop(): Promise<void> {
  await new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, 1);
  });
}

export default function testsuite() {
  beforeEachIt(yieldToEventLoop);
  abilityTest();
  timeUtilsMonthCoreTest();
  timeUtilsYearMonthNavTest();
  timeUtilsLunarCoreTest();
  timeUtilsCalendarMatrixTest();
  styleUtilsCoreTest();
  dataModelCoreTest();
  timeUtilsGetWeekDayTest();
  timeUtilsGetWeekDay2Test();
  timeUtilsGetLastDayOfMonthTest();
  timeUtilsGetLastDayOfMonth2Test();
  timeUtilsGetPreviousMonthLastDaysTest();
  timeUtilsGetPreviousMonthLastDays2Test();
  timeUtilsGetPreviousMonthLastDays3Test();
  timeUtilsGetCurrentMonthDaysTest();
  timeUtilsGetCurrentMonthDays2Test();
  timeUtilsLunarMonthToChineseTest();
  timeUtilsLunarMonthToChinese2Test();
  timeUtilsLunarDayToChineseTest();
  timeUtilsLunarDayToChinese2Test();
  timeUtilsGetMonthDaysTest();
  timeUtilsGetMonthDays2Test();
  timeUtilsGetLastYearMonthTest();
  timeUtilsGetLastYearMonth2Test();
  timeUtilsGetNextYearMonthTest();
  timeUtilsGetNextYearMonth2Test();
  timeUtilsGetLastYearTest();
  timeUtilsGetLastYear2Test();
  timeUtilsGetLastMonthTest();
  timeUtilsGetLastMonth2Test();
  timeUtilsGetNextYearTest();
  timeUtilsGetNextYear2Test();
  timeUtilsGetNextMonthTest();
  timeUtilsGetNextMonth2Test();
  styleUtilsGetColorTest();
  styleUtilsGetColor2Test();
  styleUtilsGetLunarDayColorTest();
  styleUtilsGetBackgroundColorTest();
  styleUtilsGetBorderWidthTest();
  dayInfoCtorTest();
  dayInfoCtor2Test();
  calendarViewTypeValuesTest();
  deviceTypeValuesTest();
  constantsValuesTest();
  commonDataValuesTest();
}
