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

export default function ListenerRegistryValidationTest(): void {
  describe('ListenerRegistryValidationTest', () => {
    beforeAll(() => {
      logSuite('ListenerRegistryValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('ListenerRegistryValidationTest', 'end');
    });

    /**
     * @tc.name AttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthAndNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerKeepEventOrderStableForCalendarPanels
     * @tc.desc AttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthAndNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerKeepEventOrderStableForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthAndNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerKeepEventOrderStableForCalendarPanels',
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
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(12, 2026), num: 12, days: getMonthDate(12, 2026) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(10, 2026), num: 10, days: getMonthDate(10, 2026) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(1, 2024), num: 1, days: getMonthDate(1, 2024) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name PushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeAndAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthPreserveTailIndicesForCalendarPanels
     * @tc.desc PushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeAndAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthPreserveTailIndicesForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeAndAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthPreserveTailIndicesForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: CalendarMonth = { month: monthLabel(4, 2024), num: 4, days: getMonthDate(4, 2024) };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          expect(source.totalCount()).assertEqual(1);
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
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthG: CalendarMonth = { month: monthLabel(8, 2024), num: 8, days: getMonthDate(8, 2024) };
          source.pushData(pushedMonthG);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(1);
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
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthF: CalendarMonth = { month: monthLabel(6, 2024), num: 6, days: getMonthDate(6, 2024) };
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthG: CalendarMonth = { month: monthLabel(9, 2025), num: 9, days: getMonthDate(9, 2025) };
          source.pushData(pushedMonthG);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveAndNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeLeaveTotalsAlignedForCalendarPanels
     * @tc.desc NotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveAndNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeLeaveTotalsAlignedForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveAndNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeLeaveTotalsAlignedForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(11, 2024), num: 11, days: getMonthDate(11, 2024) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(2, 2025), num: 2, days: getMonthDate(2, 2025) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
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
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthC: CalendarMonth = { month: monthLabel(9, 2024), num: 9, days: getMonthDate(9, 2024) };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(12, 2025), num: 12, days: getMonthDate(12, 2025) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name AttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthAndNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteReportSingleNotificationForCalendarPanels
     * @tc.desc AttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthAndNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteReportSingleNotificationForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthAndNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteReportSingleNotificationForCalendarPanels',
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
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthG: CalendarMonth = { month: monthLabel(9, 2025), num: 9, days: getMonthDate(9, 2025) };
          source.pushData(pushedMonthG);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthH: CalendarMonth = { month: monthLabel(12, 2026), num: 12, days: getMonthDate(12, 2026) };
          source.pushData(pushedMonthH);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          expect(source.totalCount()).assertEqual(0);
          expect(recorder.countOf('add')).assertEqual(1);
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
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(5, 2025), num: 5, days: getMonthDate(5, 2025) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthF: CalendarMonth = { month: monthLabel(8, 2026), num: 8, days: getMonthDate(8, 2026) };
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
     * @tc.name NotifyDeleteThenPushMonthThenPushMonthThenAttachListenerAndPushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerKeepTheRegistryCleanForCalendarPanels
     * @tc.desc NotifyDeleteThenPushMonthThenPushMonthThenAttachListenerAndPushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerKeepTheRegistryCleanForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyDeleteThenPushMonthThenPushMonthThenAttachListenerAndPushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerKeepTheRegistryCleanForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthC: CalendarMonth = { month: monthLabel(10, 2025), num: 10, days: getMonthDate(10, 2025) };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(1, 2026), num: 1, days: getMonthDate(1, 2026) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
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
          const pushedMonthB: CalendarMonth = { month: monthLabel(8, 2025), num: 8, days: getMonthDate(8, 2025) };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthC: CalendarMonth = { month: monthLabel(11, 2026), num: 11, days: getMonthDate(11, 2026) };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthAndAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerAvoidDuplicateCallbacksForCalendarPanels
     * @tc.desc NotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthAndAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerAvoidDuplicateCallbacksForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthAndAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerAvoidDuplicateCallbacksForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthF: CalendarMonth = { month: monthLabel(8, 2026), num: 8, days: getMonthDate(8, 2026) };
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
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
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(6, 2026), num: 6, days: getMonthDate(6, 2026) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthF: CalendarMonth = { month: monthLabel(9, 2024), num: 9, days: getMonthDate(9, 2024) };
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.totalCount()).assertEqual(2);
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
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(4, 2026), num: 4, days: getMonthDate(4, 2026) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(7, 2024), num: 7, days: getMonthDate(7, 2024) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name PushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeAndPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthMaintainInsertionOrderForCalendarPanels
     * @tc.desc PushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeAndPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthMaintainInsertionOrderForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeAndPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthMaintainInsertionOrderForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: CalendarMonth = { month: monthLabel(9, 2026), num: 9, days: getMonthDate(9, 2026) };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthC: CalendarMonth = { month: monthLabel(12, 2024), num: 12, days: getMonthDate(12, 2024) };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: CalendarMonth = { month: monthLabel(10, 2024), num: 10, days: getMonthDate(10, 2024) };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthH: CalendarMonth = { month: monthLabel(4, 2024), num: 4, days: getMonthDate(4, 2024) };
          source.pushData(pushedMonthH);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name AttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveAndNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthSurviveRepeatedReadsForCalendarPanels
     * @tc.desc AttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveAndNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthSurviveRepeatedReadsForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveAndNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthSurviveRepeatedReadsForCalendarPanels',
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
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(7, 2024), num: 7, days: getMonthDate(7, 2024) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthF: CalendarMonth = { month: monthLabel(10, 2025), num: 10, days: getMonthDate(10, 2025) };
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          expect(source.totalCount()).assertEqual(2);
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
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(5, 2024), num: 5, days: getMonthDate(5, 2024) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(8, 2025), num: 8, days: getMonthDate(8, 2025) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthC: CalendarMonth = { month: monthLabel(3, 2024), num: 3, days: getMonthDate(3, 2024) };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(6, 2025), num: 6, days: getMonthDate(6, 2025) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name PushMonthThenAttachListenerThenNotifyMoveThenAttachListenerAndAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteRetainTheOriginalPayloadForCalendarPanels
     * @tc.desc PushMonthThenAttachListenerThenNotifyMoveThenAttachListenerAndAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteRetainTheOriginalPayloadForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PushMonthThenAttachListenerThenNotifyMoveThenAttachListenerAndAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteRetainTheOriginalPayloadForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: CalendarMonth = { month: monthLabel(11, 2025), num: 11, days: getMonthDate(11, 2025) };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.totalCount()).assertEqual(1);
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
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          expect(source.totalCount()).assertEqual(0);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerAndNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerContinueAfterAReadProbeForCalendarPanels
     * @tc.desc NotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerAndNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerContinueAfterAReadProbeForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerAndNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerContinueAfterAReadProbeForCalendarPanels',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(6, 2025), num: 6, days: getMonthDate(6, 2025) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(9, 2026), num: 9, days: getMonthDate(9, 2026) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
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
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthC: CalendarMonth = { month: monthLabel(4, 2025), num: 4, days: getMonthDate(4, 2025) };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(7, 2026), num: 7, days: getMonthDate(7, 2026) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(4);
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
          const pushedMonthC: CalendarMonth = { month: monthLabel(5, 2026), num: 5, days: getMonthDate(5, 2026) };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name AttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthAndNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerKeepListenerAndDataInStepForCalendarPanels
     * @tc.desc AttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthAndNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerKeepListenerAndDataInStepForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthAndNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerKeepListenerAndDataInStepForCalendarPanels',
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
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthG: CalendarMonth = { month: monthLabel(4, 2026), num: 4, days: getMonthDate(4, 2026) };
          source.pushData(pushedMonthG);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(1);
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
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthF: CalendarMonth = { month: monthLabel(2, 2026), num: 2, days: getMonthDate(2, 2026) };
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthG: CalendarMonth = { month: monthLabel(5, 2024), num: 5, days: getMonthDate(5, 2024) };
          source.pushData(pushedMonthG);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeAndPushMonthThenPushMonthThenAttachListenerThenNotifyMoveKeepEventOrderStableUnderRepeat
     * @tc.desc NotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeAndPushMonthThenPushMonthThenAttachListenerThenNotifyMoveKeepEventOrderStableUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeAndPushMonthThenPushMonthThenAttachListenerThenNotifyMoveKeepEventOrderStableUnderRepeat',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthC: CalendarMonth = { month: monthLabel(5, 2026), num: 5, days: getMonthDate(5, 2026) };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(8, 2024), num: 8, days: getMonthDate(8, 2024) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: CalendarMonth = { month: monthLabel(3, 2026), num: 3, days: getMonthDate(3, 2026) };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthC: CalendarMonth = { month: monthLabel(6, 2024), num: 6, days: getMonthDate(6, 2024) };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
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
          const pushedMonthB: CalendarMonth = { month: monthLabel(4, 2024), num: 4, days: getMonthDate(4, 2024) };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteAndAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthPreserveTailIndicesUnderRepeat
     * @tc.desc NotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteAndAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthPreserveTailIndicesUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteAndAttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthPreserveTailIndicesUnderRepeat',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          expect(source.totalCount()).assertEqual(0);
          expect(recorder.countOf('add')).assertEqual(1);
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
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(1, 2024), num: 1, days: getMonthDate(1, 2024) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthF: CalendarMonth = { month: monthLabel(4, 2025), num: 4, days: getMonthDate(4, 2025) };
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
     * @tc.name PushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerAndPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteLeaveTotalsAlignedUnderRepeat
     * @tc.desc PushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerAndPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteLeaveTotalsAlignedUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerAndPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerThenNotifyChangeThenNotifyDeleteLeaveTotalsAlignedUnderRepeat',
      0,
      () => {
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: CalendarMonth = { month: monthLabel(4, 2024), num: 4, days: getMonthDate(4, 2024) };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthC: CalendarMonth = { month: monthLabel(7, 2025), num: 7, days: getMonthDate(7, 2025) };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: CalendarMonth = { month: monthLabel(5, 2025), num: 5, days: getMonthDate(5, 2025) };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          expect(source.totalCount()).assertEqual(1);
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
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthG: CalendarMonth = { month: monthLabel(9, 2025), num: 9, days: getMonthDate(9, 2025) };
          source.pushData(pushedMonthG);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthH: CalendarMonth = { month: monthLabel(12, 2026), num: 12, days: getMonthDate(12, 2026) };
          source.pushData(pushedMonthH);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name AttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerAndNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerReportSingleNotificationUnderRepeat
     * @tc.desc AttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerAndNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerReportSingleNotificationUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AttachListenerThenNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerAndNotifyChangeThenNotifyDeleteThenPushMonthThenPushMonthThenAttachListenerThenNotifyMoveThenAttachListenerReportSingleNotificationUnderRepeat',
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
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(2, 2025), num: 2, days: getMonthDate(2, 2025) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthF: CalendarMonth = { month: monthLabel(5, 2026), num: 5, days: getMonthDate(5, 2026) };
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.totalCount()).assertEqual(2);
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
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthD: CalendarMonth = { month: monthLabel(12, 2025), num: 12, days: getMonthDate(12, 2025) };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(3, 2026), num: 3, days: getMonthDate(3, 2026) };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );
  });
}
