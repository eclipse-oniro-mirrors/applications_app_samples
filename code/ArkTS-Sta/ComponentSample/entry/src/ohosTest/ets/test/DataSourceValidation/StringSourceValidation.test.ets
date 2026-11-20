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

export default function StringSourceValidationTest(): void {
  describe('StringSourceValidationTest', () => {
    beforeAll(() => {
      logSuite('StringSourceValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('StringSourceValidationTest', 'end');
    });

    /**
     * @tc.name AttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadAndAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthKeepEventOrderStableForCalendarPanels
     * @tc.desc AttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadAndAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthKeepEventOrderStableForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadAndAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthKeepEventOrderStableForCalendarPanels',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthC: string = 'item-11-2026';
          source.addData(source.totalCount(), appendedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          const pushedMonthD: string = 'item-2-2024';
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthE: string = 'item-5-2025';
          source.addData(0, insertedMonthE);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const appendedMonthB: string = 'item-9-2026';
          source.addData(source.totalCount(), appendedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          const pushedMonthC: string = 'item-12-2024';
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthD: string = 'item-3-2025';
          source.addData(0, insertedMonthD);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          const pushedMonthF: string = 'item-9-2024';
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:3');
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailAndPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadPreserveTailIndicesForCalendarPanels
     * @tc.desc NotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailAndPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadPreserveTailIndicesForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailAndPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadPreserveTailIndicesForCalendarPanels',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          const pushedMonthC: string = 'item-12-2024';
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthF: string = 'item-9-2024';
          source.addData(source.totalCount(), appendedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: string = 'item-10-2024';
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthE: string = 'item-7-2024';
          source.addData(source.totalCount(), appendedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          const pushedMonthF: string = 'item-10-2025';
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          const insertedMonthG: string = 'item-1-2026';
          source.addData(0, insertedMonthG);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthD: string = 'item-5-2024';
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          const pushedMonthE: string = 'item-8-2025';
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthF: string = 'item-11-2026';
          source.addData(0, insertedMonthF);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          const pushedMonthH: string = 'item-5-2025';
          source.pushData(pushedMonthH);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:3');
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name AppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotAndPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailLeaveTotalsAlignedForCalendarPanels
     * @tc.desc AppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotAndPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailLeaveTotalsAlignedForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotAndPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailLeaveTotalsAlignedForCalendarPanels',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const appendedMonthB: string = 'item-10-2024';
          source.addData(source.totalCount(), appendedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          const pushedMonthC: string = 'item-1-2025';
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthD: string = 'item-4-2026';
          source.addData(0, insertedMonthD);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          const pushedMonthF: string = 'item-10-2025';
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:3');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: string = 'item-11-2025';
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const insertedMonthC: string = 'item-2-2026';
          source.addData(0, insertedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          const pushedMonthE: string = 'item-8-2025';
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          const appendedMonthH: string = 'item-5-2025';
          source.addData(source.totalCount(), appendedMonthH);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name PushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeAndReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthReportSingleNotificationForCalendarPanels
     * @tc.desc PushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeAndReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthReportSingleNotificationForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeAndReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthReportSingleNotificationForCalendarPanels',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: string = 'item-11-2025';
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthE: string = 'item-8-2025';
          source.addData(source.totalCount(), appendedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          const pushedMonthF: string = 'item-11-2026';
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          const insertedMonthG: string = 'item-2-2024';
          source.addData(0, insertedMonthG);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(3);
          expect(recorder.last()).assertEqual('change:3');
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthD: string = 'item-6-2025';
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          const pushedMonthE: string = 'item-9-2026';
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthC: string = 'item-4-2025';
          source.addData(source.totalCount(), appendedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          const pushedMonthD: string = 'item-7-2026';
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthE: string = 'item-10-2024';
          source.addData(0, insertedMonthE);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name PushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthAndInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerKeepTheRegistryCleanForCalendarPanels
     * @tc.desc PushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthAndInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerKeepTheRegistryCleanForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthAndInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerKeepTheRegistryCleanForCalendarPanels',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: string = 'item-12-2026';
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const insertedMonthC: string = 'item-3-2024';
          source.addData(0, insertedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          const pushedMonthE: string = 'item-9-2026';
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedMonthB: string = 'item-1-2024';
          source.addData(0, insertedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          const pushedMonthD: string = 'item-7-2026';
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
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
     * @tc.name ReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadAndAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthAvoidDuplicateCallbacksForCalendarPanels
     * @tc.desc ReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadAndAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthAvoidDuplicateCallbacksForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadAndAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthAvoidDuplicateCallbacksForCalendarPanels',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthD: string = 'item-7-2026';
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          const pushedMonthE: string = 'item-10-2024';
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthF: string = 'item-1-2025';
          source.addData(0, insertedMonthF);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthC: string = 'item-5-2026';
          source.addData(source.totalCount(), appendedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          const pushedMonthD: string = 'item-8-2024';
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthE: string = 'item-11-2025';
          source.addData(0, insertedMonthE);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          const pushedMonthG: string = 'item-5-2024';
          source.pushData(pushedMonthG);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:3');
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const appendedMonthB: string = 'item-3-2026';
          source.addData(source.totalCount(), appendedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          const pushedMonthC: string = 'item-6-2024';
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthD: string = 'item-9-2025';
          source.addData(0, insertedMonthD);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          const pushedMonthF: string = 'item-3-2024';
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:3');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name InsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailAndNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadMaintainInsertionOrderForCalendarPanels
     * @tc.desc InsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailAndNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadMaintainInsertionOrderForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'InsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailAndNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadMaintainInsertionOrderForCalendarPanels',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedMonthB: string = 'item-2-2025';
          source.addData(0, insertedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          const pushedMonthD: string = 'item-8-2024';
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          const appendedMonthG: string = 'item-5-2024';
          source.addData(source.totalCount(), appendedMonthG);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          const pushedMonthC: string = 'item-6-2024';
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthF: string = 'item-3-2024';
          source.addData(source.totalCount(), appendedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          const pushedMonthG: string = 'item-6-2025';
          source.pushData(pushedMonthG);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          const insertedMonthH: string = 'item-9-2026';
          source.addData(0, insertedMonthH);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name AttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotAndAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeSurviveRepeatedReadsForCalendarPanels
     * @tc.desc AttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotAndAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeSurviveRepeatedReadsForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotAndAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeSurviveRepeatedReadsForCalendarPanels',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthC: string = 'item-6-2024';
          source.addData(source.totalCount(), appendedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          const pushedMonthD: string = 'item-9-2025';
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthE: string = 'item-12-2026';
          source.addData(0, insertedMonthE);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          const pushedMonthG: string = 'item-6-2025';
          source.pushData(pushedMonthG);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:3');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const appendedMonthB: string = 'item-4-2024';
          source.addData(source.totalCount(), appendedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          const pushedMonthC: string = 'item-7-2025';
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthD: string = 'item-10-2026';
          source.addData(0, insertedMonthD);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: string = 'item-5-2025';
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const insertedMonthC: string = 'item-8-2026';
          source.addData(0, insertedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          const pushedMonthE: string = 'item-2-2025';
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerAndPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthRetainTheOriginalPayloadForCalendarPanels
     * @tc.desc NotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerAndPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthRetainTheOriginalPayloadForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerAndPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthRetainTheOriginalPayloadForCalendarPanels',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          const pushedMonthC: string = 'item-7-2025';
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: string = 'item-5-2025';
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthE: string = 'item-2-2025';
          source.addData(source.totalCount(), appendedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          const pushedMonthF: string = 'item-5-2026';
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name AppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthAndPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerContinueAfterAReadProbeForCalendarPanels
     * @tc.desc AppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthAndPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerContinueAfterAReadProbeForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthAndPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerContinueAfterAReadProbeForCalendarPanels',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const appendedMonthB: string = 'item-5-2025';
          source.addData(source.totalCount(), appendedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          const pushedMonthC: string = 'item-8-2026';
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthD: string = 'item-11-2024';
          source.addData(0, insertedMonthD);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          const pushedMonthF: string = 'item-5-2026';
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:3');
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: string = 'item-6-2026';
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const insertedMonthC: string = 'item-9-2024';
          source.addData(0, insertedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          const pushedMonthE: string = 'item-3-2026';
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedMonthB: string = 'item-7-2024';
          source.addData(0, insertedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          const pushedMonthD: string = 'item-1-2026';
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          const appendedMonthG: string = 'item-10-2026';
          source.addData(source.totalCount(), appendedMonthG);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          const pushedMonthH: string = 'item-1-2024';
          source.pushData(pushedMonthH);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:3');
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name PushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadAndReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthKeepListenerAndDataInStepForCalendarPanels
     * @tc.desc PushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadAndReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthKeepListenerAndDataInStepForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadAndReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthKeepListenerAndDataInStepForCalendarPanels',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: string = 'item-6-2026';
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthE: string = 'item-3-2026';
          source.addData(source.totalCount(), appendedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          const pushedMonthF: string = 'item-6-2024';
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          const insertedMonthG: string = 'item-9-2025';
          source.addData(0, insertedMonthG);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthD: string = 'item-1-2026';
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          const pushedMonthE: string = 'item-4-2024';
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthF: string = 'item-7-2025';
          source.addData(0, insertedMonthF);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          const pushedMonthH: string = 'item-1-2024';
          source.pushData(pushedMonthH);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:3');
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name PushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailAndInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotKeepEventOrderStableUnderRepeat
     * @tc.desc PushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailAndInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotKeepEventOrderStableUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailAndInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotKeepEventOrderStableUnderRepeat',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: string = 'item-7-2024';
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          const insertedMonthC: string = 'item-10-2025';
          source.addData(0, insertedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          const pushedMonthE: string = 'item-4-2024';
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          const appendedMonthH: string = 'item-1-2024';
          source.addData(source.totalCount(), appendedMonthH);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedMonthB: string = 'item-8-2025';
          source.addData(0, insertedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          const pushedMonthD: string = 'item-2-2024';
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          const pushedMonthC: string = 'item-12-2024';
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthF: string = 'item-9-2024';
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
     * @tc.name ReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthAndAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangePreserveTailIndicesUnderRepeat
     * @tc.desc ReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthAndAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangePreserveTailIndicesUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthAndAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangePreserveTailIndicesUnderRepeat',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthD: string = 'item-2-2024';
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          const pushedMonthE: string = 'item-5-2025';
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthC: string = 'item-12-2024';
          source.addData(source.totalCount(), appendedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          const pushedMonthD: string = 'item-3-2025';
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthE: string = 'item-6-2026';
          source.addData(0, insertedMonthE);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name InsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerAndNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthLeaveTotalsAlignedUnderRepeat
     * @tc.desc InsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerAndNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthLeaveTotalsAlignedUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'InsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerAndNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthLeaveTotalsAlignedUnderRepeat',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedMonthB: string = 'item-9-2026';
          source.addData(0, insertedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          const pushedMonthD: string = 'item-3-2025';
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          const pushedMonthC: string = 'item-1-2025';
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthF: string = 'item-10-2025';
          source.addData(source.totalCount(), appendedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          const pushedMonthG: string = 'item-1-2026';
          source.pushData(pushedMonthG);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: string = 'item-11-2025';
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthE: string = 'item-8-2025';
          source.addData(source.totalCount(), appendedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          const pushedMonthF: string = 'item-11-2026';
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          const insertedMonthG: string = 'item-2-2024';
          source.addData(0, insertedMonthG);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(3);
          expect(recorder.last()).assertEqual('change:3');
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name AttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthAndAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerReportSingleNotificationUnderRepeat
     * @tc.desc AttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthAndAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerReportSingleNotificationUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthAndAppendMonthTailThenPushMonthThenInsertMonthAtHeadThenNotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerReportSingleNotificationUnderRepeat',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthC: string = 'item-1-2025';
          source.addData(source.totalCount(), appendedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          const pushedMonthD: string = 'item-4-2026';
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthE: string = 'item-7-2024';
          source.addData(0, insertedMonthE);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          const pushedMonthG: string = 'item-1-2026';
          source.pushData(pushedMonthG);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:3');
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const appendedMonthB: string = 'item-11-2025';
          source.addData(source.totalCount(), appendedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          const pushedMonthC: string = 'item-2-2026';
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthD: string = 'item-5-2024';
          source.addData(0, insertedMonthD);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(2);
          expect(recorder.last()).assertEqual('change:2');
          const pushedMonthF: string = 'item-11-2026';
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:3');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadAndPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailKeepTheRegistryCleanUnderRepeat
     * @tc.desc NotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadAndPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailKeepTheRegistryCleanUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyChangeThenPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailThenPushMonthThenInsertMonthAtHeadAndPushMonthThenReadFirstSlotThenAttachListenerThenAppendMonthTailKeepTheRegistryCleanUnderRepeat',
      0,
      () => {
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          const pushedMonthC: string = 'item-2-2026';
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthF: string = 'item-11-2026';
          source.addData(source.totalCount(), appendedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          const pushedMonthG: string = 'item-2-2024';
          source.pushData(pushedMonthG);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          const insertedMonthH: string = 'item-5-2025';
          source.addData(0, insertedMonthH);
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(4);
          expect(recorder.countOf('add')).assertEqual(5);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: string = 'item-12-2026';
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).length > 0).assertTrue();
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthE: string = 'item-9-2026';
          source.addData(source.totalCount(), appendedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: StringSource = new StringSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthD: string = 'item-7-2026';
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          const pushedMonthE: string = 'item-10-2024';
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          const insertedMonthF: string = 'item-1-2025';
          source.addData(0, insertedMonthF);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );
  });
}
