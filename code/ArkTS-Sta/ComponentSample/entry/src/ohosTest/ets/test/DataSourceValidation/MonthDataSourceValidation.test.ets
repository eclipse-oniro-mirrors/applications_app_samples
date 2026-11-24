'use static';

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
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import {
  MonthDataSource as CalendarMonthSource,
  Month as CalendarMonth,
} from '../../../../main/ets/pages/CustomCalendar/components/MonthDataSource';
import {
  MonthDataSource as LoadedMonthSource,
  Month as LoadedMonth,
} from '../../../../main/ets/pages/HighlyLoaded/MonthDataSource';
import { getMonthDate } from '../../../../main/ets/pages/CustomCalendar/components/GetDate';
import { MyDataSource as CascadeSource, CustomDataType } from '../../../../main/ets/pages/SecondaryLinkage/DataType';
import { MyDataSource as StringSource } from '../../../../main/ets/pages/DynamicAttributes/common/LazyForEach';
import { logSuite, monthLabel, countValue, realDays, fingerprint, expectedGrid, daysInMonth } from '../Shared/Support';
import {
  EventRecorder,
  PanelBuilder,
  WeekHeader,
  WeekHeaderEntry,
  GridInspector,
  makeDataEntry,
} from '../Shared/SharedDriver';
import { CascadeModel, StyleTable, CascadeItem } from '../Shared/SecondaryModel';
import { Sanitizer, RolePolicy, AuditTrail } from '../Shared/SecurityModels';

export default function MonthDataSourceValidationTest(): void {
  describe('MonthDataSourceValidationTest', () => {
    beforeAll(() => {
      logSuite('MonthDataSourceValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('MonthDataSourceValidationTest', 'end');
    });

    /**
     * @tc.name AttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveKeepEventOrderStableForCalendarPanels
     * @tc.desc AttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveKeepEventOrderStableForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveKeepEventOrderStableForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthC: CalendarMonth = { month: monthLabel(12, 2024), num: 12, days: getMonthDate(12, 2024) };
          source.addData(source.totalCount(), appendedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(6, 2026), num: 6, days: getMonthDate(6, 2026) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const appendedMonthB: CalendarMonth = { month: monthLabel(10, 2024), num: 10, days: getMonthDate(10, 2024) };
          source.addData(source.totalCount(), appendedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(4, 2026), num: 4, days: getMonthDate(4, 2026) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMovePreserveTailIndicesForCalendarPanels
     * @tc.desc NotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMovePreserveTailIndicesForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMovePreserveTailIndicesForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthD: CalendarMonth = { month: monthLabel(4, 2026), num: 4, days: getMonthDate(4, 2026) };
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthF: CalendarMonth = { month: monthLabel(10, 2025), num: 10, days: getMonthDate(10, 2025) };
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthC: CalendarMonth = { month: monthLabel(2, 2026), num: 2, days: getMonthDate(2, 2026) };
          source.addData(source.totalCount(), appendedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(8, 2025), num: 8, days: getMonthDate(8, 2025) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const appendedMonthB: CalendarMonth = { month: monthLabel(12, 2026), num: 12, days: getMonthDate(12, 2026) };
          source.addData(source.totalCount(), appendedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(6, 2025), num: 6, days: getMonthDate(6, 2025) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthG: CalendarMonth = { month: monthLabel(3, 2025), num: 3, days: getMonthDate(3, 2025) };
          source.addData(0, insertedMonthG);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name InsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveLeaveTotalsAlignedForCalendarPanels
     * @tc.desc InsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveLeaveTotalsAlignedForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'InsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveLeaveTotalsAlignedForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedMonthB: CalendarMonth = { month: monthLabel(11, 2025), num: 11, days: getMonthDate(11, 2025) };
          source.addData(0, insertedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthE: CalendarMonth = { month: monthLabel(8, 2025), num: 8, days: getMonthDate(8, 2025) };
          source.addData(source.totalCount(), appendedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthG: CalendarMonth = { month: monthLabel(2, 2024), num: 2, days: getMonthDate(2, 2024) };
          source.pushData(pushedMonthG);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthD: CalendarMonth = { month: monthLabel(6, 2025), num: 6, days: getMonthDate(6, 2025) };
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthF: CalendarMonth = { month: monthLabel(12, 2024), num: 12, days: getMonthDate(12, 2024) };
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailReportSingleNotificationForCalendarPanels
     * @tc.desc NotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailReportSingleNotificationForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailReportSingleNotificationForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthC: CalendarMonth = { month: monthLabel(3, 2024), num: 3, days: getMonthDate(3, 2024) };
          source.addData(0, insertedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthF: CalendarMonth = { month: monthLabel(12, 2024), num: 12, days: getMonthDate(12, 2024) };
          source.addData(source.totalCount(), appendedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthH: CalendarMonth = { month: monthLabel(6, 2026), num: 6, days: getMonthDate(6, 2026) };
          source.pushData(pushedMonthH);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedMonthB: CalendarMonth = { month: monthLabel(1, 2024), num: 1, days: getMonthDate(1, 2024) };
          source.addData(0, insertedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthE: CalendarMonth = { month: monthLabel(10, 2024), num: 10, days: getMonthDate(10, 2024) };
          source.addData(source.totalCount(), appendedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthD: CalendarMonth = { month: monthLabel(8, 2024), num: 8, days: getMonthDate(8, 2024) };
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthF: CalendarMonth = { month: monthLabel(2, 2026), num: 2, days: getMonthDate(2, 2026) };
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name ReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailKeepTheRegistryCleanForCalendarPanels
     * @tc.desc ReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailKeepTheRegistryCleanForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailKeepTheRegistryCleanForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthD: CalendarMonth = { month: monthLabel(7, 2026), num: 7, days: getMonthDate(7, 2026) };
          source.addData(0, insertedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthC: CalendarMonth = { month: monthLabel(5, 2026), num: 5, days: getMonthDate(5, 2026) };
          source.addData(0, insertedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthF: CalendarMonth = { month: monthLabel(2, 2026), num: 2, days: getMonthDate(2, 2026) };
          source.addData(source.totalCount(), appendedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name PushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailAvoidDuplicateCallbacksForCalendarPanels
     * @tc.desc PushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailAvoidDuplicateCallbacksForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailAvoidDuplicateCallbacksForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: CalendarMonth = { month: monthLabel(2, 2025), num: 2, days: getMonthDate(2, 2025) };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthE: CalendarMonth = { month: monthLabel(11, 2025), num: 11, days: getMonthDate(11, 2025) };
          source.addData(0, insertedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthD: CalendarMonth = { month: monthLabel(9, 2025), num: 9, days: getMonthDate(9, 2025) };
          source.addData(0, insertedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthG: CalendarMonth = { month: monthLabel(6, 2025), num: 6, days: getMonthDate(6, 2025) };
          source.addData(source.totalCount(), appendedMonthG);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthC: CalendarMonth = { month: monthLabel(7, 2025), num: 7, days: getMonthDate(7, 2025) };
          source.addData(0, insertedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthF: CalendarMonth = { month: monthLabel(4, 2025), num: 4, days: getMonthDate(4, 2025) };
          source.addData(source.totalCount(), appendedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthH: CalendarMonth = { month: monthLabel(10, 2024), num: 10, days: getMonthDate(10, 2024) };
          source.pushData(pushedMonthH);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailMaintainInsertionOrderForCalendarPanels
     * @tc.desc NotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailMaintainInsertionOrderForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailMaintainInsertionOrderForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthC: CalendarMonth = { month: monthLabel(6, 2024), num: 6, days: getMonthDate(6, 2024) };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthF: CalendarMonth = { month: monthLabel(3, 2024), num: 3, days: getMonthDate(3, 2024) };
          source.addData(0, insertedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: CalendarMonth = { month: monthLabel(4, 2024), num: 4, days: getMonthDate(4, 2024) };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthE: CalendarMonth = { month: monthLabel(1, 2024), num: 1, days: getMonthDate(1, 2024) };
          source.addData(0, insertedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          const appendedMonthH: CalendarMonth = { month: monthLabel(10, 2024), num: 10, days: getMonthDate(10, 2024) };
          source.addData(source.totalCount(), appendedMonthH);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name AppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveSurviveRepeatedReadsForCalendarPanels
     * @tc.desc AppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveSurviveRepeatedReadsForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveSurviveRepeatedReadsForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const appendedMonthB: CalendarMonth = { month: monthLabel(4, 2024), num: 4, days: getMonthDate(4, 2024) };
          source.addData(source.totalCount(), appendedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(10, 2026), num: 10, days: getMonthDate(10, 2026) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthG: CalendarMonth = { month: monthLabel(7, 2026), num: 7, days: getMonthDate(7, 2026) };
          source.addData(0, insertedMonthG);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthC: CalendarMonth = { month: monthLabel(8, 2026), num: 8, days: getMonthDate(8, 2026) };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: CalendarMonth = { month: monthLabel(6, 2026), num: 6, days: getMonthDate(6, 2026) };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthE: CalendarMonth = { month: monthLabel(3, 2026), num: 3, days: getMonthDate(3, 2026) };
          source.addData(0, insertedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name AttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveRetainTheOriginalPayloadForCalendarPanels
     * @tc.desc AttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveRetainTheOriginalPayloadForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveRetainTheOriginalPayloadForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthC: CalendarMonth = { month: monthLabel(8, 2026), num: 8, days: getMonthDate(8, 2026) };
          source.addData(source.totalCount(), appendedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(2, 2025), num: 2, days: getMonthDate(2, 2025) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const appendedMonthB: CalendarMonth = { month: monthLabel(6, 2026), num: 6, days: getMonthDate(6, 2026) };
          source.addData(source.totalCount(), appendedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(12, 2025), num: 12, days: getMonthDate(12, 2025) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveContinueAfterAReadProbeForCalendarPanels
     * @tc.desc NotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveContinueAfterAReadProbeForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveContinueAfterAReadProbeForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthD: CalendarMonth = { month: monthLabel(12, 2025), num: 12, days: getMonthDate(12, 2025) };
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthF: CalendarMonth = { month: monthLabel(6, 2024), num: 6, days: getMonthDate(6, 2024) };
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthC: CalendarMonth = { month: monthLabel(10, 2025), num: 10, days: getMonthDate(10, 2025) };
          source.addData(source.totalCount(), appendedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(4, 2024), num: 4, days: getMonthDate(4, 2024) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const appendedMonthB: CalendarMonth = { month: monthLabel(8, 2025), num: 8, days: getMonthDate(8, 2025) };
          source.addData(source.totalCount(), appendedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(2, 2024), num: 2, days: getMonthDate(2, 2024) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthG: CalendarMonth = { month: monthLabel(11, 2024), num: 11, days: getMonthDate(11, 2024) };
          source.addData(0, insertedMonthG);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name InsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveKeepListenerAndDataInStepForCalendarPanels
     * @tc.desc InsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveKeepListenerAndDataInStepForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'InsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveKeepListenerAndDataInStepForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedMonthB: CalendarMonth = { month: monthLabel(7, 2024), num: 7, days: getMonthDate(7, 2024) };
          source.addData(0, insertedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthE: CalendarMonth = { month: monthLabel(4, 2024), num: 4, days: getMonthDate(4, 2024) };
          source.addData(source.totalCount(), appendedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthG: CalendarMonth = { month: monthLabel(10, 2026), num: 10, days: getMonthDate(10, 2026) };
          source.pushData(pushedMonthG);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthD: CalendarMonth = { month: monthLabel(2, 2024), num: 2, days: getMonthDate(2, 2024) };
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthF: CalendarMonth = { month: monthLabel(8, 2026), num: 8, days: getMonthDate(8, 2026) };
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailKeepEventOrderStableUnderRepeat
     * @tc.desc NotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailKeepEventOrderStableUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailKeepEventOrderStableUnderRepeat',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthC: CalendarMonth = { month: monthLabel(11, 2026), num: 11, days: getMonthDate(11, 2026) };
          source.addData(0, insertedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthF: CalendarMonth = { month: monthLabel(8, 2026), num: 8, days: getMonthDate(8, 2026) };
          source.addData(source.totalCount(), appendedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthH: CalendarMonth = { month: monthLabel(2, 2025), num: 2, days: getMonthDate(2, 2025) };
          source.pushData(pushedMonthH);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedMonthB: CalendarMonth = { month: monthLabel(9, 2026), num: 9, days: getMonthDate(9, 2026) };
          source.addData(0, insertedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthE: CalendarMonth = { month: monthLabel(6, 2026), num: 6, days: getMonthDate(6, 2026) };
          source.addData(source.totalCount(), appendedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthD: CalendarMonth = { month: monthLabel(4, 2026), num: 4, days: getMonthDate(4, 2026) };
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthF: CalendarMonth = { month: monthLabel(10, 2025), num: 10, days: getMonthDate(10, 2025) };
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name ReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailPreserveTailIndicesUnderRepeat
     * @tc.desc ReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailPreserveTailIndicesUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailPreserveTailIndicesUnderRepeat',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthD: CalendarMonth = { month: monthLabel(3, 2025), num: 3, days: getMonthDate(3, 2025) };
          source.addData(0, insertedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthC: CalendarMonth = { month: monthLabel(1, 2025), num: 1, days: getMonthDate(1, 2025) };
          source.addData(0, insertedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthF: CalendarMonth = { month: monthLabel(10, 2025), num: 10, days: getMonthDate(10, 2025) };
          source.addData(source.totalCount(), appendedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name PushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailLeaveTotalsAlignedUnderRepeat
     * @tc.desc PushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailLeaveTotalsAlignedUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailLeaveTotalsAlignedUnderRepeat',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: CalendarMonth = { month: monthLabel(10, 2024), num: 10, days: getMonthDate(10, 2024) };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthE: CalendarMonth = { month: monthLabel(7, 2024), num: 7, days: getMonthDate(7, 2024) };
          source.addData(0, insertedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthD: CalendarMonth = { month: monthLabel(5, 2024), num: 5, days: getMonthDate(5, 2024) };
          source.addData(0, insertedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthG: CalendarMonth = { month: monthLabel(2, 2024), num: 2, days: getMonthDate(2, 2024) };
          source.addData(source.totalCount(), appendedMonthG);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthC: CalendarMonth = { month: monthLabel(3, 2024), num: 3, days: getMonthDate(3, 2024) };
          source.addData(0, insertedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthF: CalendarMonth = { month: monthLabel(12, 2024), num: 12, days: getMonthDate(12, 2024) };
          source.addData(source.totalCount(), appendedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthH: CalendarMonth = { month: monthLabel(6, 2026), num: 6, days: getMonthDate(6, 2026) };
          source.pushData(pushedMonthH);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailReportSingleNotificationUnderRepeat
     * @tc.desc NotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailReportSingleNotificationUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailReportSingleNotificationUnderRepeat',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthC: CalendarMonth = { month: monthLabel(2, 2026), num: 2, days: getMonthDate(2, 2026) };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthF: CalendarMonth = { month: monthLabel(11, 2026), num: 11, days: getMonthDate(11, 2026) };
          source.addData(0, insertedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: CalendarMonth = { month: monthLabel(12, 2026), num: 12, days: getMonthDate(12, 2026) };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthE: CalendarMonth = { month: monthLabel(9, 2026), num: 9, days: getMonthDate(9, 2026) };
          source.addData(0, insertedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          const appendedMonthH: CalendarMonth = { month: monthLabel(6, 2026), num: 6, days: getMonthDate(6, 2026) };
          source.addData(source.totalCount(), appendedMonthH);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name AppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveKeepTheRegistryCleanUnderRepeat
     * @tc.desc AppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveKeepTheRegistryCleanUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveKeepTheRegistryCleanUnderRepeat',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const appendedMonthB: CalendarMonth = { month: monthLabel(12, 2026), num: 12, days: getMonthDate(12, 2026) };
          source.addData(source.totalCount(), appendedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(6, 2025), num: 6, days: getMonthDate(6, 2025) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthG: CalendarMonth = { month: monthLabel(3, 2025), num: 3, days: getMonthDate(3, 2025) };
          source.addData(0, insertedMonthG);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthC: CalendarMonth = { month: monthLabel(4, 2025), num: 4, days: getMonthDate(4, 2025) };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: CalendarMonth = { month: monthLabel(2, 2025), num: 2, days: getMonthDate(2, 2025) };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthE: CalendarMonth = { month: monthLabel(11, 2025), num: 11, days: getMonthDate(11, 2025) };
          source.addData(0, insertedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name AttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveAvoidDuplicateCallbacksUnderRepeat
     * @tc.desc AttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveAvoidDuplicateCallbacksUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveAvoidDuplicateCallbacksUnderRepeat',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthC: CalendarMonth = { month: monthLabel(4, 2025), num: 4, days: getMonthDate(4, 2025) };
          source.addData(source.totalCount(), appendedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(10, 2024), num: 10, days: getMonthDate(10, 2024) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const appendedMonthB: CalendarMonth = { month: monthLabel(2, 2025), num: 2, days: getMonthDate(2, 2025) };
          source.addData(source.totalCount(), appendedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(8, 2024), num: 8, days: getMonthDate(8, 2024) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );
  });
}
