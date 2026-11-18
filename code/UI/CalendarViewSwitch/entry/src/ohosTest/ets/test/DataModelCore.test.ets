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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DayInfo, CalendarController, CalendarViewType, ScheduleInfo, DeviceType, Constants, CommonData,
  CalendarData } from '../../../main/ets/bridge/CalendarSwitchBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'DataModelCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function dataModelCoreTest(): void {
  describe('DataModelCoreTest', () => {
    beforeEach(() => {
      CommonData.SCHEDULE_ARRAY = [];
      CommonData.SCHEDULE_DATA = [];
      CommonData.CURRENT_SELECT_DATE = '';
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0501
     * @tc.name      testDataModel0501
     * @tc.desc      Checks DayInfo stores year month date week fields as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0501 begin');
      const day: DayInfo = new DayInfo(2024, 2, 29, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual day.year=${day.year}, expected=2024`);
      expect(day.year).assertEqual(2024);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual day.month=${day.month}, expected=2`);
      expect(day.month).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual day.date=${day.date}, expected=29`);
      expect(day.date).assertEqual(29);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual day.week=${day.week}, expected=0`);
      expect(day.week).assertEqual(0);
      log('testDataModel0501 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0502
     * @tc.name      testDataModel0502
     * @tc.desc      Checks DayInfo keeps the week marker for current month days.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0502 begin');
      const day: DayInfo = new DayInfo(2024, 6, 15, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual day.week=${day.week}, expected=1`);
      expect(day.week).assertEqual(1);
      log('testDataModel0502 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0503
     * @tc.name      testDataModel0503
     * @tc.desc      Checks DayInfo fields are mutable and keep assigned values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0503 begin');
      const day: DayInfo = new DayInfo(2024, 6, 15, 1);
      day.year = 2025;
      day.month = 7;
      day.date = 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual day.year=${day.year}, expected=2025`);
      expect(day.year).assertEqual(2025);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual day.month=${day.month}, expected=7`);
      expect(day.month).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual day.date=${day.date}, expected=1`);
      expect(day.date).assertEqual(1);
      log('testDataModel0503 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0504
     * @tc.name      testDataModel0504
     * @tc.desc      Checks all DayInfo fields keep number types.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0504 begin');
      const day: DayInfo = new DayInfo(2024, 6, 15, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof day.year=${typeof day.year}, expected='number'`);
      expect(typeof day.year).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof day.month=${typeof day.month}, expected='number'`);
      expect(typeof day.month).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof day.date=${typeof day.date}, expected='number'`);
      expect(typeof day.date).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof day.week=${typeof day.week}, expected='number'`);
      expect(typeof day.week).assertEqual('number');
      log('testDataModel0504 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0505
     * @tc.name      testDataModel0505
     * @tc.desc      Checks DayInfo stores extreme zero values without normalization.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0505 begin');
      const day: DayInfo = new DayInfo(0, 0, 0, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual day.year=${day.year}, expected=0`);
      expect(day.year).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual day.month=${day.month}, expected=0`);
      expect(day.month).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual day.date=${day.date}, expected=0`);
      expect(day.date).assertEqual(0);
      log('testDataModel0505 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0506
     * @tc.name      testDataModel0506
     * @tc.desc      Checks DayInfo stores negative values as provided.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0506 begin');
      const day: DayInfo = new DayInfo(-1, -1, -1, -1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual day.year=${day.year}, expected=-1`);
      expect(day.year).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual day.month=${day.month}, expected=-1`);
      expect(day.month).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual day.date=${day.date}, expected=-1`);
      expect(day.date).assertEqual(-1);
      log('testDataModel0506 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0507
     * @tc.name      testDataModel0507
     * @tc.desc      Checks two DayInfo instances do not share mutable state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0507 begin');
      const first: DayInfo = new DayInfo(2024, 6, 15, 1);
      const second: DayInfo = new DayInfo(2023, 5, 10, 0);
      first.year = 2030;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.year=${second.year}, expected=2023`);
      expect(second.year).assertEqual(2023);
      log('testDataModel0507 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0508
     * @tc.name      testDataModel0508
     * @tc.desc      Checks a constructed DayInfo is an instance of DayInfo.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0508 begin');
      const day: DayInfo = new DayInfo(2024, 6, 15, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue day instanceof DayInfo=${day instanceof DayInfo}`);
      expect(day instanceof DayInfo).assertTrue();
      log('testDataModel0508 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0509
     * @tc.name      testDataModel0509
     * @tc.desc      Checks ScheduleInfo stores title and location as constructed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0509 begin');
      const info: ScheduleInfo =
        new ScheduleInfo('评审', '会议室A', new Date(2024, 5, 1), new Date(2024, 5, 2), '说明', '2024/6/1', [0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.title=${info.title}, expected='评审'`);
      expect(info.title).assertEqual('评审');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.location=${info.location}, expected='会议室A'`);
      expect(info.location).assertEqual('会议室A');
      log('testDataModel0509 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0510
     * @tc.name      testDataModel0510
     * @tc.desc      Checks ScheduleInfo keeps start and end Date values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0510 begin');
      const start: Date = new Date(2024, 5, 1);
      const end: Date = new Date(2024, 5, 2);
      const info: ScheduleInfo = new ScheduleInfo('评审', '会议室A', start, end, '说明', '2024/6/1', [0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.startTime.getTime()=${info.startTime.getTime()}`);
      expect(info.startTime.getTime()).assertEqual(start.getTime());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.endTime.getTime()=${info.endTime.getTime()}`);
      expect(info.endTime.getTime()).assertEqual(end.getTime());
      log('testDataModel0510 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0511
     * @tc.name      testDataModel0511
     * @tc.desc      Checks ScheduleInfo stores describe and dateString fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0511 begin');
      const info: ScheduleInfo =
        new ScheduleInfo('评审', '会议室A', new Date(2024, 5, 1), new Date(2024, 5, 2), '月度评审', '2024/6/1', [0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.describe=${info.describe}, expected='月度评审'`);
      expect(info.describe).assertEqual('月度评审');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.dateString=${info.dateString}, expected='2024/6/1'`);
      expect(info.dateString).assertEqual('2024/6/1');
      log('testDataModel0511 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0512
     * @tc.name      testDataModel0512
     * @tc.desc      Checks ScheduleInfo stores the reminder time array content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0512 begin');
      const reminders: number[] = [0, 1, 4];
      const info: ScheduleInfo =
        new ScheduleInfo('评审', '会议室A', new Date(2024, 5, 1), new Date(2024, 5, 2), '说明', '2024/6/1', reminders);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.reminderTime.length=${info.reminderTime.length}`);
      expect(info.reminderTime.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.reminderTime[0]=${info.reminderTime[0]}, expected=0`);
      expect(info.reminderTime[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.reminderTime[2]=${info.reminderTime[2]}, expected=4`);
      expect(info.reminderTime[2]).assertEqual(4);
      log('testDataModel0512 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0513
     * @tc.name      testDataModel0513
     * @tc.desc      Checks ScheduleInfo field types after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0513 begin');
      const info: ScheduleInfo =
        new ScheduleInfo('评审', '会议室A', new Date(2024, 5, 1), new Date(2024, 5, 2), '说明', '2024/6/1', [0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof info.title=${typeof info.title}, expected='string'`);
      expect(typeof info.title).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof info.dateString=${typeof info.dateString}`);
      expect(typeof info.dateString).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${info.startTime instanceof Date}`);
      expect(info.startTime instanceof Date).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${info.reminderTime instanceof Array}`);
      expect(info.reminderTime instanceof Array).assertTrue();
      log('testDataModel0513 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0514
     * @tc.name      testDataModel0514
     * @tc.desc      Checks ScheduleInfo fields remain mutable after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0514 begin');
      const info: ScheduleInfo =
        new ScheduleInfo('评审', '会议室A', new Date(2024, 5, 1), new Date(2024, 5, 2), '说明', '2024/6/1', [0]);
      info.title = '新标题';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.title=${info.title}, expected='新标题'`);
      expect(info.title).assertEqual('新标题');
      log('testDataModel0514 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0515
     * @tc.name      testDataModel0515
     * @tc.desc      Checks ScheduleInfo accepts empty strings for text fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0515 begin');
      const info: ScheduleInfo = new ScheduleInfo('', '', new Date(2024, 5, 1), new Date(2024, 5, 1), '', '', []);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.title=${info.title}, expected=''`);
      expect(info.title).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.location=${info.location}, expected=''`);
      expect(info.location).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual info.reminderTime.length=${info.reminderTime.length}`);
      expect(info.reminderTime.length).assertEqual(0);
      log('testDataModel0515 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0516
     * @tc.name      testDataModel0516
     * @tc.desc      Checks a constructed ScheduleInfo is an instance of ScheduleInfo.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0516 begin');
      const info: ScheduleInfo =
        new ScheduleInfo('评审', '会议室A', new Date(2024, 5, 1), new Date(2024, 5, 2), '说明', '2024/6/1', [0]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue info instanceof ScheduleInfo=${info instanceof ScheduleInfo}`);
      expect(info instanceof ScheduleInfo).assertTrue();
      log('testDataModel0516 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0517
     * @tc.name      testDataModel0517
     * @tc.desc      Checks CalendarController exposes a swiperRefresh function.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0517 begin');
      const controller: CalendarController = new CalendarController();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof controller.swiperRefresh}`);
      expect(typeof controller.swiperRefresh).assertEqual('function');
      log('testDataModel0517 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0518
     * @tc.name      testDataModel0518
     * @tc.desc      Checks CalendarController exposes a swiperYearToMonthRefresh function.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0518 begin');
      const controller: CalendarController = new CalendarController();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof controller.swiperYearToMonthRefresh}`);
      expect(typeof controller.swiperYearToMonthRefresh).assertEqual('function');
      log('testDataModel0518 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0519
     * @tc.name      testDataModel0519
     * @tc.desc      Checks CalendarController exposes a schedulePointRefresh function.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0519 begin');
      const controller: CalendarController = new CalendarController();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof controller.schedulePointRefresh}`);
      expect(typeof controller.schedulePointRefresh).assertEqual('function');
      log('testDataModel0519 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0520
     * @tc.name      testDataModel0520
     * @tc.desc      Checks default swiperRefresh runs without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0520 begin');
      const controller: CalendarController = new CalendarController();
      controller.swiperRefresh(CalendarViewType.MONTH);
      controller.swiperRefresh(CalendarViewType.WEEK);
      controller.swiperRefresh(CalendarViewType.YEAR);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testDataModel0520 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0521
     * @tc.name      testDataModel0521
     * @tc.desc      Checks default swiperYearToMonthRefresh runs without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0521 begin');
      const controller: CalendarController = new CalendarController();
      controller.swiperYearToMonthRefresh(2024, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testDataModel0521 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0522
     * @tc.name      testDataModel0522
     * @tc.desc      Checks default schedulePointRefresh runs without throwing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0522 begin');
      const controller: CalendarController = new CalendarController();
      controller.schedulePointRefresh();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testDataModel0522 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0523
     * @tc.name      testDataModel0523
     * @tc.desc      Checks sequential controller calls stay stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0523 begin');
      const controller: CalendarController = new CalendarController();
      controller.swiperRefresh(CalendarViewType.MONTH);
      controller.swiperYearToMonthRefresh(2025, 1);
      controller.schedulePointRefresh();
      controller.swiperRefresh(CalendarViewType.YEAR);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue true=${true}`);
      expect(true).assertTrue();
      log('testDataModel0523 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0524
     * @tc.name      testDataModel0524
     * @tc.desc      Checks two CalendarController instances are independent objects.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0524 begin');
      const first: CalendarController = new CalendarController();
      const second: CalendarController = new CalendarController();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse first === second=${first === second}`);
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${first.swiperRefresh === second.swiperRefresh}`);
      expect(first.swiperRefresh === second.swiperRefresh).assertFalse();
      log('testDataModel0524 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0525
     * @tc.name      testDataModel0525
     * @tc.desc      Checks CalendarViewType.YEAR maps to enum value 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0525 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CalendarViewType.YEAR=${CalendarViewType.YEAR}, expected=0`);
      expect(CalendarViewType.YEAR).assertEqual(0);
      log('testDataModel0525 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0526
     * @tc.name      testDataModel0526
     * @tc.desc      Checks CalendarViewType.MONTH maps to enum value 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0526 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CalendarViewType.MONTH=${CalendarViewType.MONTH}, expected=1`);
      expect(CalendarViewType.MONTH).assertEqual(1);
      log('testDataModel0526 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0527
     * @tc.name      testDataModel0527
     * @tc.desc      Checks CalendarViewType.WEEK maps to enum value 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0527 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CalendarViewType.WEEK=${CalendarViewType.WEEK}, expected=2`);
      expect(CalendarViewType.WEEK).assertEqual(2);
      log('testDataModel0527 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0528
     * @tc.name      testDataModel0528
     * @tc.desc      Checks DeviceType.PHONE maps to enum value 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0528 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual DeviceType.PHONE=${DeviceType.PHONE}, expected=0`);
      expect(DeviceType.PHONE).assertEqual(0);
      log('testDataModel0528 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0529
     * @tc.name      testDataModel0529
     * @tc.desc      Checks DeviceType.EXPAND_FOLD maps to enum value 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0529 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual DeviceType.EXPAND_FOLD=${DeviceType.EXPAND_FOLD}, expected=1`);
      expect(DeviceType.EXPAND_FOLD).assertEqual(1);
      log('testDataModel0529 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0530
     * @tc.name      testDataModel0530
     * @tc.desc      Checks DeviceType.RK maps to enum value 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0530 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual DeviceType.RK=${DeviceType.RK}, expected=2`);
      expect(DeviceType.RK).assertEqual(2);
      log('testDataModel0530 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0531
     * @tc.name      testDataModel0531
     * @tc.desc      Checks the MONTHS table has 12 Chinese month labels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0531 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.MONTHS.length=${Constants.MONTHS.length}`);
      expect(Constants.MONTHS.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.MONTHS[0]=${Constants.MONTHS[0]}, expected='1月'`);
      expect(Constants.MONTHS[0]).assertEqual('1月');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.MONTHS[11]=${Constants.MONTHS[11]}, expected='12月'`);
      expect(Constants.MONTHS[11]).assertEqual('12月');
      log('testDataModel0531 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0532
     * @tc.name      testDataModel0532
     * @tc.desc      Checks the WEEKS table has 7 weekday labels starting at 日.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0532 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.WEEKS.length=${Constants.WEEKS.length}, expected=7`);
      expect(Constants.WEEKS.length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.WEEKS[0]=${Constants.WEEKS[0]}, expected='日'`);
      expect(Constants.WEEKS[0]).assertEqual('日');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.WEEKS[6]=${Constants.WEEKS[6]}, expected='六'`);
      expect(Constants.WEEKS[6]).assertEqual('六');
      log('testDataModel0532 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0533
     * @tc.name      testDataModel0533
     * @tc.desc      Checks the CHINESE_MONTH table has 12 labels from 正 to 腊.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0533 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${Constants.CHINESE_MONTH.length}, expected=12`);
      expect(Constants.CHINESE_MONTH.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.CHINESE_MONTH[0]=${Constants.CHINESE_MONTH[0]}`);
      expect(Constants.CHINESE_MONTH[0]).assertEqual('正');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.CHINESE_MONTH[11]=${Constants.CHINESE_MONTH[11]}`);
      expect(Constants.CHINESE_MONTH[11]).assertEqual('腊');
      log('testDataModel0533 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0534
     * @tc.name      testDataModel0534
     * @tc.desc      Checks the CHINESE_DAY table has 30 labels from 初一 to 三十.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0534 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.CHINESE_DAY.length=${Constants.CHINESE_DAY.length}`);
      expect(Constants.CHINESE_DAY.length).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.CHINESE_DAY[0]=${Constants.CHINESE_DAY[0]}`);
      expect(Constants.CHINESE_DAY[0]).assertEqual('初一');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.CHINESE_DAY[29]=${Constants.CHINESE_DAY[29]}`);
      expect(Constants.CHINESE_DAY[29]).assertEqual('三十');
      log('testDataModel0534 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0535
     * @tc.name      testDataModel0535
     * @tc.desc      Checks TOTAL_MILLISECONDS_IN_DAY equals 86400000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0535 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${Constants.TOTAL_MILLISECONDS_IN_DAY}`);
      expect(Constants.TOTAL_MILLISECONDS_IN_DAY).assertEqual(86400000);
      log('testDataModel0535 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0536
     * @tc.name      testDataModel0536
     * @tc.desc      Checks DAYS_IN_WEEK, MONTHS_NUM and DEFAULT constants.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0536 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.DAYS_IN_WEEK=${Constants.DAYS_IN_WEEK}, expected=7`);
      expect(Constants.DAYS_IN_WEEK).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.MONTHS_NUM=${Constants.MONTHS_NUM}, expected=12`);
      expect(Constants.MONTHS_NUM).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.DEFAULT=${Constants.DEFAULT}, expected=0`);
      expect(Constants.DEFAULT).assertEqual(0);
      log('testDataModel0536 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0537
     * @tc.name      testDataModel0537
     * @tc.desc      Checks the font size constants for day, lunar, week and title text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0537 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.DAY_FONT_SIZE=${Constants.DAY_FONT_SIZE}`);
      expect(Constants.DAY_FONT_SIZE).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${Constants.LUNAR_DAY_FONT_SIZE}, expected=10`);
      expect(Constants.LUNAR_DAY_FONT_SIZE).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.WEEK_FONT_SIZE=${Constants.WEEK_FONT_SIZE}`);
      expect(Constants.WEEK_FONT_SIZE).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${Constants.YEAR_MONTH_FONT_SIZE}, expected=18`);
      expect(Constants.YEAR_MONTH_FONT_SIZE).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.FONT_MULTIPLIER=${Constants.FONT_MULTIPLIER}`);
      expect(Constants.FONT_MULTIPLIER).assertEqual(1);
      log('testDataModel0537 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0538
     * @tc.name      testDataModel0538
     * @tc.desc      Checks font weight and select border width constants.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0538 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${Constants.FONT_WEIGHT_FIVE_HUNDRED}, expected=500`);
      expect(Constants.FONT_WEIGHT_FIVE_HUNDRED).assertEqual(500);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${Constants.FONT_WEIGHT_EIGHT_HUNDRED}, expected=800`);
      expect(Constants.FONT_WEIGHT_EIGHT_HUNDRED).assertEqual(800);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${Constants.SELECT_DATE_BORDER_WIDTH}, expected=1`);
      expect(Constants.SELECT_DATE_BORDER_WIDTH).assertEqual(1);
      log('testDataModel0538 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0539
     * @tc.name      testDataModel0539
     * @tc.desc      Checks view size constants for month, week, year and schedule point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0539 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.MONTH_VIEW_HEIGHT=${Constants.MONTH_VIEW_HEIGHT}`);
      expect(Constants.MONTH_VIEW_HEIGHT).assertEqual(400);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.WEEK_VIEW_HEIGHT=${Constants.WEEK_VIEW_HEIGHT}`);
      expect(Constants.WEEK_VIEW_HEIGHT).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual Constants.YEAR_VIEW_HEIGHT=${Constants.YEAR_VIEW_HEIGHT}`);
      expect(Constants.YEAR_VIEW_HEIGHT).assertEqual(650);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${Constants.SCHEDULE_POINT_DIAMETER}, expected=5`);
      expect(Constants.SCHEDULE_POINT_DIAMETER).assertEqual(5);
      log('testDataModel0539 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0540
     * @tc.name      testDataModel0540
     * @tc.desc      Checks the reminder option list and year view font color constant.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0540 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${Constants.REMINDER_TIME_OPTION.length}, expected=5`);
      expect(Constants.REMINDER_TIME_OPTION.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${Constants.REMINDER_TIME_OPTION[0]}, expected='准时'`);
      expect(Constants.REMINDER_TIME_OPTION[0]).assertEqual('准时');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${Constants.YEAR_VIEW_FONT_COLOR}, expected='#7e7e7e'`);
      expect(Constants.YEAR_VIEW_FONT_COLOR).assertEqual('#7e7e7e');
      log('testDataModel0540 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0541
     * @tc.name      testDataModel0541
     * @tc.desc      Checks today constants stay inside valid calendar ranges.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0541 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof Constants.TODAY=${typeof Constants.TODAY}`);
      expect(typeof Constants.TODAY).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLargerOrEqual Constants.TODAY=${Constants.TODAY}, expected=1`);
      expect(Constants.TODAY).assertLargerOrEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess Constants.TODAY=${Constants.TODAY}, expected=32`);
      expect(Constants.TODAY).assertLess(32);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLargerOrEqual Constants.TODAY_MONTH=${Constants.TODAY_MONTH}`);
      expect(Constants.TODAY_MONTH).assertLargerOrEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLess Constants.TODAY_MONTH=${Constants.TODAY_MONTH}, expected=13`);
      expect(Constants.TODAY_MONTH).assertLess(13);
      const currentYear: number = new Date().getFullYear();
      hilog.info(DOMAIN, TAG, '%{public}s', 'assertEqual Constants.TODAY_YEAR=' + Constants.TODAY_YEAR +
        ', expected=' + currentYear);
      expect(Constants.TODAY_YEAR).assertEqual(currentYear);
      log('testDataModel0541 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0542
     * @tc.name      testDataModel0542
     * @tc.desc      Checks CommonData defaults to empty schedule arrays and empty date.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0542 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonData.SCHEDULE_ARRAY.length}, expected=0`);
      expect(CommonData.SCHEDULE_ARRAY.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonData.SCHEDULE_DATA.length}, expected=0`);
      expect(CommonData.SCHEDULE_DATA.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonData.CURRENT_SELECT_DATE}, expected=''`);
      expect(CommonData.CURRENT_SELECT_DATE).assertEqual('');
      log('testDataModel0542 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0543
     * @tc.name      testDataModel0543
     * @tc.desc      Checks CommonData defaults device type to PHONE and fold flag false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0543 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonData.DEVICE_TYPE=${CommonData.DEVICE_TYPE}`);
      expect(CommonData.DEVICE_TYPE).assertEqual(DeviceType.PHONE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse CommonData.IS_FOLD=${CommonData.IS_FOLD}`);
      expect(CommonData.IS_FOLD).assertFalse();
      log('testDataModel0543 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0544
     * @tc.name      testDataModel0544
     * @tc.desc      Checks CommonData schedule array supports push and read back.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0544 begin');
      CommonData.SCHEDULE_ARRAY.push('2024/6/1');
      CommonData.SCHEDULE_ARRAY.push('2024/6/2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonData.SCHEDULE_ARRAY.length}, expected=2`);
      expect(CommonData.SCHEDULE_ARRAY.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonData.SCHEDULE_ARRAY[1]=${CommonData.SCHEDULE_ARRAY[1]}`);
      expect(CommonData.SCHEDULE_ARRAY[1]).assertEqual('2024/6/2');
      log('testDataModel0544 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0545
     * @tc.name      testDataModel0545
     * @tc.desc      Checks CommonData schedule data list stores ScheduleInfo entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0545 begin');
      const info: ScheduleInfo =
        new ScheduleInfo('评审', '会议室A', new Date(2024, 5, 1), new Date(2024, 5, 2), '说明', '2024/6/1', [0]);
      CommonData.SCHEDULE_DATA.push(info);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonData.SCHEDULE_DATA.length}, expected=1`);
      expect(CommonData.SCHEDULE_DATA.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonData.SCHEDULE_DATA[0].title}, expected='评审'`);
      expect(CommonData.SCHEDULE_DATA[0].title).assertEqual('评审');
      log('testDataModel0545 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0546
     * @tc.name      testDataModel0546
     * @tc.desc      Checks CommonData current select date assignment persists.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0546 begin');
      CommonData.CURRENT_SELECT_DATE = '2024-6-15';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonData.CURRENT_SELECT_DATE}`);
      expect(CommonData.CURRENT_SELECT_DATE).assertEqual('2024-6-15');
      log('testDataModel0546 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_DATAMODEL_0547
     * @tc.name      testDataModel0547
     * @tc.desc      Checks the CalendarData structure stores year month date fields.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataModel0547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataModel0547 begin');
      const data: CalendarData = { year: 2024, month: 6, date: 1 };
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.year=${data.year}, expected=2024`);
      expect(data.year).assertEqual(2024);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.month=${data.month}, expected=6`);
      expect(data.month).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual data.date=${data.date}, expected=1`);
      expect(data.date).assertEqual(1);
      log('testDataModel0547 end');
    })
  })
}
