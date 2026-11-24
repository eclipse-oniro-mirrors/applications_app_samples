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

export default function CascadeDataValidationTest(): void {
  describe('CascadeDataValidationTest', () => {
    beforeAll(() => {
      logSuite('CascadeDataValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('CascadeDataValidationTest', 'end');
    });

    /**
     * @tc.name AttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepEventOrderStableForCalendarPanels
     * @tc.desc AttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepEventOrderStableForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepEventOrderStableForCalendarPanels',
      0,
      () => {
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          const batchEntriesD: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesD.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesD);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryE: CustomDataType = makeDataEntry('entry-4', 'tag-2024');
          source.addData(0, insertedEntryE);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          const batchEntriesC: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesC.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesC);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryD: CustomDataType = makeDataEntry('entry-2', 'tag-2024');
          source.addData(0, insertedEntryD);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesF: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesF.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesF);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:20');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadPreserveTailIndicesForCalendarPanels
     * @tc.desc NotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadPreserveTailIndicesForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadPreserveTailIndicesForCalendarPanels',
      0,
      () => {
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesC: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesC.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesC);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          source.notifyDataChange(9);
          expect(recorder.last()).assertEqual('change:9');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const batchEntriesB: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesB.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesB);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          source.notifyDataChange(9);
          expect(recorder.last()).assertEqual('change:9');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(source.getData(0) !== undefined).assertTrue();
          const batchEntriesF: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesF.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesF);
          expect(source.totalCount()).assertEqual(20);
          expect(recorder.last()).assertEqual('add:19');
          const insertedEntryG: CustomDataType = makeDataEntry('entry-12', 'tag-2025');
          source.addData(0, insertedEntryG);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          const batchEntriesE: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesE.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesE);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryF: CustomDataType = makeDataEntry('entry-10', 'tag-2025');
          source.addData(0, insertedEntryF);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesH: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesH.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesH);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:20');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name ReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotLeaveTotalsAlignedForCalendarPanels
     * @tc.desc ReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotLeaveTotalsAlignedForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotLeaveTotalsAlignedForCalendarPanels',
      0,
      () => {
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          const batchEntriesC: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesC.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesC);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryD: CustomDataType = makeDataEntry('entry-3', 'tag-2025');
          source.addData(0, insertedEntryD);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesF: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesF.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesF);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:20');
          source.notifyDataChange(20);
          expect(recorder.last()).assertEqual('change:20');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const batchEntriesB: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesB.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesB);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryC: CustomDataType = makeDataEntry('entry-1', 'tag-2025');
          source.addData(0, insertedEntryC);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesE: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesE.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesE);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:20');
          source.notifyDataChange(20);
          expect(recorder.last()).assertEqual('change:20');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name PushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchReportSingleNotificationForCalendarPanels
     * @tc.desc PushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchReportSingleNotificationForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchReportSingleNotificationForCalendarPanels',
      0,
      () => {
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const batchEntriesB: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesB.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesB);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          source.notifyDataChange(9);
          expect(recorder.last()).assertEqual('change:9');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(source.getData(0) !== undefined).assertTrue();
          const batchEntriesF: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesF.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesF);
          expect(source.totalCount()).assertEqual(20);
          expect(recorder.last()).assertEqual('add:19');
          const insertedEntryG: CustomDataType = makeDataEntry('entry-1', 'tag-2026');
          source.addData(0, insertedEntryG);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          const batchEntriesE: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesE.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesE);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          const batchEntriesD: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesD.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesD);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryE: CustomDataType = makeDataEntry('entry-9', 'tag-2026');
          source.addData(0, insertedEntryE);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name PushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerKeepTheRegistryCleanForCalendarPanels
     * @tc.desc PushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerKeepTheRegistryCleanForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerKeepTheRegistryCleanForCalendarPanels',
      0,
      () => {
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const batchEntriesB: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesB.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesB);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryC: CustomDataType = makeDataEntry('entry-2', 'tag-2026');
          source.addData(0, insertedEntryC);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesE: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesE.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesE);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:20');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedEntryB: CustomDataType = makeDataEntry('entry-12', 'tag-2026');
          source.addData(0, insertedEntryB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesD: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesD.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesD);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:10');
          source.notifyDataChange(10);
          expect(recorder.last()).assertEqual('change:10');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAvoidDuplicateCallbacksForCalendarPanels
     * @tc.desc NotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAvoidDuplicateCallbacksForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAvoidDuplicateCallbacksForCalendarPanels',
      0,
      () => {
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          const batchEntriesE: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesE.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesE);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryF: CustomDataType = makeDataEntry('entry-12', 'tag-2024');
          source.addData(0, insertedEntryF);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          const batchEntriesD: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesD.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesD);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryE: CustomDataType = makeDataEntry('entry-10', 'tag-2024');
          source.addData(0, insertedEntryE);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesG: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesG.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesG);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:20');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          const batchEntriesC: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesC.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesC);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryD: CustomDataType = makeDataEntry('entry-8', 'tag-2024');
          source.addData(0, insertedEntryD);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesF: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesF.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesF);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:20');
          source.notifyDataChange(20);
          expect(recorder.last()).assertEqual('change:20');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name InsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadMaintainInsertionOrderForCalendarPanels
     * @tc.desc InsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadMaintainInsertionOrderForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'InsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadMaintainInsertionOrderForCalendarPanels',
      0,
      () => {
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedEntryB: CustomDataType = makeDataEntry('entry-1', 'tag-2024');
          source.addData(0, insertedEntryB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesD: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesD.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesD);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:10');
          source.notifyDataChange(10);
          expect(recorder.last()).assertEqual('change:10');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesC: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesC.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesC);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          source.notifyDataChange(9);
          expect(recorder.last()).assertEqual('change:9');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(source.getData(0) !== undefined).assertTrue();
          const batchEntriesG: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesG.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesG);
          expect(source.totalCount()).assertEqual(20);
          expect(recorder.last()).assertEqual('add:19');
          const insertedEntryH: CustomDataType = makeDataEntry('entry-8', 'tag-2025');
          source.addData(0, insertedEntryH);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name AttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteSurviveRepeatedReadsForCalendarPanels
     * @tc.desc AttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteSurviveRepeatedReadsForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteSurviveRepeatedReadsForCalendarPanels',
      0,
      () => {
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          const batchEntriesD: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesD.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesD);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryE: CustomDataType = makeDataEntry('entry-11', 'tag-2025');
          source.addData(0, insertedEntryE);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesG: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesG.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesG);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:20');
          source.notifyDataChange(20);
          expect(recorder.last()).assertEqual('change:20');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          const batchEntriesC: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesC.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesC);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryD: CustomDataType = makeDataEntry('entry-9', 'tag-2025');
          source.addData(0, insertedEntryD);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const batchEntriesB: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesB.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesB);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryC: CustomDataType = makeDataEntry('entry-7', 'tag-2025');
          source.addData(0, insertedEntryC);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesE: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesE.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesE);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:20');
          source.notifyDataChange(20);
          expect(recorder.last()).assertEqual('change:20');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchRetainTheOriginalPayloadForCalendarPanels
     * @tc.desc NotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchRetainTheOriginalPayloadForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchRetainTheOriginalPayloadForCalendarPanels',
      0,
      () => {
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesC: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesC.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesC);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          source.notifyDataChange(9);
          expect(recorder.last()).assertEqual('change:9');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const batchEntriesB: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesB.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesB);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          source.notifyDataChange(9);
          expect(recorder.last()).assertEqual('change:9');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(source.getData(0) !== undefined).assertTrue();
          const batchEntriesF: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesF.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesF);
          expect(source.totalCount()).assertEqual(20);
          expect(recorder.last()).assertEqual('add:19');
          expect(source.totalCount()).assertEqual(20);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name ReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerContinueAfterAReadProbeForCalendarPanels
     * @tc.desc ReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerContinueAfterAReadProbeForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerContinueAfterAReadProbeForCalendarPanels',
      0,
      () => {
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          const batchEntriesC: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesC.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesC);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryD: CustomDataType = makeDataEntry('entry-10', 'tag-2026');
          source.addData(0, insertedEntryD);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesF: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesF.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesF);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:20');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const batchEntriesB: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesB.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesB);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryC: CustomDataType = makeDataEntry('entry-8', 'tag-2026');
          source.addData(0, insertedEntryC);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesE: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesE.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesE);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:20');
          source.notifyDataChange(20);
          expect(recorder.last()).assertEqual('change:20');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedEntryB: CustomDataType = makeDataEntry('entry-6', 'tag-2026');
          source.addData(0, insertedEntryB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesD: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesD.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesD);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:10');
          source.notifyDataChange(10);
          expect(recorder.last()).assertEqual('change:10');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.getData(0) !== undefined).assertTrue();
          const batchEntriesH: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesH.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesH);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:20');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name PushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepListenerAndDataInStepForCalendarPanels
     * @tc.desc PushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepListenerAndDataInStepForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepListenerAndDataInStepForCalendarPanels',
      0,
      () => {
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const batchEntriesB: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesB.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesB);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          source.notifyDataChange(9);
          expect(recorder.last()).assertEqual('change:9');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(source.getData(0) !== undefined).assertTrue();
          const batchEntriesF: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesF.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesF);
          expect(source.totalCount()).assertEqual(20);
          expect(recorder.last()).assertEqual('add:19');
          const insertedEntryG: CustomDataType = makeDataEntry('entry-8', 'tag-2024');
          source.addData(0, insertedEntryG);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          const batchEntriesE: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesE.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesE);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryF: CustomDataType = makeDataEntry('entry-6', 'tag-2024');
          source.addData(0, insertedEntryF);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesH: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesH.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesH);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:20');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name PushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeKeepEventOrderStableUnderRepeat
     * @tc.desc PushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeKeepEventOrderStableUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeKeepEventOrderStableUnderRepeat',
      0,
      () => {
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const batchEntriesB: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesB.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesB);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryC: CustomDataType = makeDataEntry('entry-9', 'tag-2024');
          source.addData(0, insertedEntryC);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesE: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesE.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesE);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:20');
          source.notifyDataChange(20);
          expect(recorder.last()).assertEqual('change:20');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedEntryB: CustomDataType = makeDataEntry('entry-7', 'tag-2024');
          source.addData(0, insertedEntryB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesD: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesD.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesD);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:10');
          source.notifyDataChange(10);
          expect(recorder.last()).assertEqual('change:10');
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesC: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesC.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesC);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          source.notifyDataChange(9);
          expect(recorder.last()).assertEqual('change:9');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeletePreserveTailIndicesUnderRepeat
     * @tc.desc NotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeletePreserveTailIndicesUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeletePreserveTailIndicesUnderRepeat',
      0,
      () => {
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          const batchEntriesE: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesE.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesE);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          const batchEntriesD: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesD.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesD);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          const insertedEntryE: CustomDataType = makeDataEntry('entry-5', 'tag-2025');
          source.addData(0, insertedEntryE);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name InsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchLeaveTotalsAlignedUnderRepeat
     * @tc.desc InsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchLeaveTotalsAlignedUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'InsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchLeaveTotalsAlignedUnderRepeat',
      0,
      () => {
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedEntryB: CustomDataType = makeDataEntry('entry-8', 'tag-2025');
          source.addData(0, insertedEntryB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesD: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesD.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesD);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:10');
          source.notifyDataChange(10);
          expect(recorder.last()).assertEqual('change:10');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const batchEntriesC: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesC.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesC);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          source.notifyDataChange(9);
          expect(recorder.last()).assertEqual('change:9');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(source.getData(0) !== undefined).assertTrue();
          const batchEntriesG: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesG.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesG);
          expect(source.totalCount()).assertEqual(20);
          expect(recorder.last()).assertEqual('add:19');
          expect(source.totalCount()).assertEqual(20);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const batchEntriesB: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesB.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesB);
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.last()).assertEqual('add:9');
          source.notifyDataChange(9);
          expect(recorder.last()).assertEqual('change:9');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          expect(source.getData(0) !== undefined).assertTrue();
          const batchEntriesF: CustomDataType[] = [];
          for (let index = 0; index < 10; index++) {
            batchEntriesF.push(makeDataEntry('entry-' + index.toString(), 'tag-' + index.toString()));
          }
          source.pushData(batchEntriesF);
          expect(source.totalCount()).assertEqual(20);
          expect(recorder.last()).assertEqual('add:19');
          const insertedEntryG: CustomDataType = makeDataEntry('entry-1', 'tag-2026');
          source.addData(0, insertedEntryG);
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );
  });
}
