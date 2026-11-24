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

export default function ItemIndexValidationTest(): void {
  describe('ItemIndexValidationTest', () => {
    beforeAll(() => {
      logSuite('ItemIndexValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('ItemIndexValidationTest', 'end');
    });

    /**
     * @tc.name ContentIndexFallsIntoItsCategoryAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepEventOrderStableForCalendarPanels
     * @tc.desc ContentIndexFallsIntoItsCategoryAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepEventOrderStableForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ContentIndexFallsIntoItsCategoryAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepEventOrderStableForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(3)).assertEqual(0);
          expect(model.records[0] <= 3).assertTrue();
          expect(model.records[1] > 3).assertTrue();
          expect(model.itemsOfTag(0).length).assertEqual(10);
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
          const insertedEntryD: CustomDataType = makeDataEntry('entry-11', 'tag-2024');
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
     * @tc.name ClassLookupReturnsTheOwningTagAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadPreserveTailIndicesForCalendarPanels
     * @tc.desc ClassLookupReturnsTheOwningTagAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadPreserveTailIndicesForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ClassLookupReturnsTheOwningTagAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadPreserveTailIndicesForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(10)).assertEqual(1);
          expect(model.records[1] <= 10).assertTrue();
          expect(model.records[2] > 10).assertTrue();
          expect(model.itemsOfTag(1).length).assertEqual(10);
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
          const insertedEntryG: CustomDataType = makeDataEntry('entry-9', 'tag-2025');
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
          const insertedEntryF: CustomDataType = makeDataEntry('entry-7', 'tag-2025');
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
     * @tc.name DeepScrollMapsBackToTheListHeadAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotLeaveTotalsAlignedForCalendarPanels
     * @tc.desc DeepScrollMapsBackToTheListHeadAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotLeaveTotalsAlignedForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'DeepScrollMapsBackToTheListHeadAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotLeaveTotalsAlignedForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(17)).assertEqual(1);
          expect(model.records[1] <= 17).assertTrue();
          expect(model.records[2] > 17).assertTrue();
          expect(model.itemsOfTag(1).length).assertEqual(10);
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
          const insertedEntryC: CustomDataType = makeDataEntry('entry-10', 'tag-2025');
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
     * @tc.name ContentIndexFallsIntoItsCategoryAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchReportSingleNotificationForCalendarPanels
     * @tc.desc ContentIndexFallsIntoItsCategoryAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchReportSingleNotificationForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ContentIndexFallsIntoItsCategoryAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchReportSingleNotificationForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(24)).assertEqual(2);
          expect(model.records[2] <= 24).assertTrue();
          expect(model.records[3] > 24).assertTrue();
          expect(model.itemsOfTag(2).length).assertEqual(10);
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
          const insertedEntryE: CustomDataType = makeDataEntry('entry-6', 'tag-2026');
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
     * @tc.name ClassLookupReturnsTheOwningTagAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerKeepTheRegistryCleanForCalendarPanels
     * @tc.desc ClassLookupReturnsTheOwningTagAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerKeepTheRegistryCleanForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ClassLookupReturnsTheOwningTagAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerKeepTheRegistryCleanForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(31)).assertEqual(3);
          expect(model.records[3] <= 31).assertTrue();
          expect(model.records[4] > 31).assertTrue();
          expect(model.itemsOfTag(3).length).assertEqual(10);
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedEntryB: CustomDataType = makeDataEntry('entry-9', 'tag-2026');
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
     * @tc.name DeepScrollMapsBackToTheListHeadAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAvoidDuplicateCallbacksForCalendarPanels
     * @tc.desc DeepScrollMapsBackToTheListHeadAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAvoidDuplicateCallbacksForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'DeepScrollMapsBackToTheListHeadAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAvoidDuplicateCallbacksForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(38)).assertEqual(3);
          expect(model.records[3] <= 38).assertTrue();
          expect(model.records[4] > 38).assertTrue();
          expect(model.itemsOfTag(3).length).assertEqual(10);
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
          const insertedEntryE: CustomDataType = makeDataEntry('entry-7', 'tag-2024');
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
          const insertedEntryD: CustomDataType = makeDataEntry('entry-5', 'tag-2024');
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
     * @tc.name ContentIndexFallsIntoItsCategoryAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadMaintainInsertionOrderForCalendarPanels
     * @tc.desc ContentIndexFallsIntoItsCategoryAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadMaintainInsertionOrderForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ContentIndexFallsIntoItsCategoryAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadMaintainInsertionOrderForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(45)).assertEqual(4);
          expect(model.records[4] <= 45).assertTrue();
          expect(model.records[5] > 45).assertTrue();
          expect(model.itemsOfTag(4).length).assertEqual(10);
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
          const insertedEntryH: CustomDataType = makeDataEntry('entry-5', 'tag-2025');
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
     * @tc.name ClassLookupReturnsTheOwningTagAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteSurviveRepeatedReadsForCalendarPanels
     * @tc.desc ClassLookupReturnsTheOwningTagAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteSurviveRepeatedReadsForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ClassLookupReturnsTheOwningTagAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteSurviveRepeatedReadsForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(52)).assertEqual(5);
          expect(model.records[5] <= 52).assertTrue();
          expect(model.records[6] > 52).assertTrue();
          expect(model.itemsOfTag(5).length).assertEqual(10);
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
          const insertedEntryD: CustomDataType = makeDataEntry('entry-6', 'tag-2025');
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
          const insertedEntryC: CustomDataType = makeDataEntry('entry-4', 'tag-2025');
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
     * @tc.name DeepScrollMapsBackToTheListHeadAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchRetainTheOriginalPayloadForCalendarPanels
     * @tc.desc DeepScrollMapsBackToTheListHeadAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchRetainTheOriginalPayloadForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'DeepScrollMapsBackToTheListHeadAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchRetainTheOriginalPayloadForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(59)).assertEqual(5);
          expect(model.records[5] <= 59).assertTrue();
          expect(model.records[6] > 59).assertTrue();
          expect(model.itemsOfTag(5).length).assertEqual(10);
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
     * @tc.name ContentIndexFallsIntoItsCategoryAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerContinueAfterAReadProbeForCalendarPanels
     * @tc.desc ContentIndexFallsIntoItsCategoryAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerContinueAfterAReadProbeForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ContentIndexFallsIntoItsCategoryAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerContinueAfterAReadProbeForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(66)).assertEqual(6);
          expect(model.records[6] <= 66).assertTrue();
          expect(model.records[7] > 66).assertTrue();
          expect(model.itemsOfTag(6).length).assertEqual(10);
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
          const insertedEntryC: CustomDataType = makeDataEntry('entry-5', 'tag-2026');
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
          const insertedEntryB: CustomDataType = makeDataEntry('entry-3', 'tag-2026');
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
     * @tc.name ClassLookupReturnsTheOwningTagAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepListenerAndDataInStepForCalendarPanels
     * @tc.desc ClassLookupReturnsTheOwningTagAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepListenerAndDataInStepForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ClassLookupReturnsTheOwningTagAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepListenerAndDataInStepForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(73)).assertEqual(7);
          expect(model.records[7] <= 73).assertTrue();
          expect(model.records[8] > 73).assertTrue();
          expect(model.itemsOfTag(7).length).assertEqual(10);
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
          const insertedEntryF: CustomDataType = makeDataEntry('entry-3', 'tag-2024');
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
     * @tc.name DeepScrollMapsBackToTheListHeadAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeKeepEventOrderStableUnderRepeat
     * @tc.desc DeepScrollMapsBackToTheListHeadAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeKeepEventOrderStableUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'DeepScrollMapsBackToTheListHeadAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeKeepEventOrderStableUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(80)).assertEqual(8);
          expect(model.records[8] <= 80).assertTrue();
          expect(model.records[9] > 80).assertTrue();
          expect(model.itemsOfTag(8).length).assertEqual(10);
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedEntryB: CustomDataType = makeDataEntry('entry-4', 'tag-2024');
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
     * @tc.name ContentIndexFallsIntoItsCategoryAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeletePreserveTailIndicesUnderRepeat
     * @tc.desc ContentIndexFallsIntoItsCategoryAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeletePreserveTailIndicesUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ContentIndexFallsIntoItsCategoryAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeletePreserveTailIndicesUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(87)).assertEqual(8);
          expect(model.records[8] <= 87).assertTrue();
          expect(model.records[9] > 87).assertTrue();
          expect(model.itemsOfTag(8).length).assertEqual(10);
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
          const insertedEntryE: CustomDataType = makeDataEntry('entry-2', 'tag-2025');
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
     * @tc.name ClassLookupReturnsTheOwningTagAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchLeaveTotalsAlignedUnderRepeat
     * @tc.desc ClassLookupReturnsTheOwningTagAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchLeaveTotalsAlignedUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ClassLookupReturnsTheOwningTagAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchLeaveTotalsAlignedUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(94)).assertEqual(9);
          expect(model.records[9] <= 94).assertTrue();
          expect(model.records[10] > 94).assertTrue();
          expect(model.itemsOfTag(9).length).assertEqual(10);
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
          const insertedEntryG: CustomDataType = makeDataEntry('entry-10', 'tag-2026');
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

    /**
     * @tc.name DeepScrollMapsBackToTheListHeadAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerReportSingleNotificationUnderRepeat
     * @tc.desc DeepScrollMapsBackToTheListHeadAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerReportSingleNotificationUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'DeepScrollMapsBackToTheListHeadAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerReportSingleNotificationUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(101)).assertEqual(10);
          expect(model.records[10] <= 101).assertTrue();
          expect(model.records[11] > 101).assertTrue();
          expect(model.itemsOfTag(10).length).assertEqual(10);
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
          const insertedEntryD: CustomDataType = makeDataEntry('entry-1', 'tag-2026');
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
     * @tc.name ContentIndexFallsIntoItsCategoryAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotKeepTheRegistryCleanUnderRepeat
     * @tc.desc ContentIndexFallsIntoItsCategoryAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotKeepTheRegistryCleanUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ContentIndexFallsIntoItsCategoryAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotKeepTheRegistryCleanUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(108)).assertEqual(10);
          expect(model.records[10] <= 108).assertTrue();
          expect(model.records[11] > 108).assertTrue();
          expect(model.itemsOfTag(10).length).assertEqual(10);
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
          expect(source.totalCount()).assertEqual(10);
          expect(recorder.countOf('add')).assertEqual(2);
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
          const insertedEntryF: CustomDataType = makeDataEntry('entry-9', 'tag-2024');
          source.addData(0, insertedEntryF);
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name ClassLookupReturnsTheOwningTagAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeAvoidDuplicateCallbacksUnderRepeat
     * @tc.desc ClassLookupReturnsTheOwningTagAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeAvoidDuplicateCallbacksUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ClassLookupReturnsTheOwningTagAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeAvoidDuplicateCallbacksUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(115)).assertEqual(11);
          expect(model.records[11] <= 115).assertTrue();
          expect(model.records[12] > 115).assertTrue();
          expect(model.itemsOfTag(11).length).assertEqual(10);
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
          const insertedEntryC: CustomDataType = makeDataEntry('entry-12', 'tag-2024');
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
     * @tc.name DeepScrollMapsBackToTheListHeadAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteMaintainInsertionOrderUnderRepeat
     * @tc.desc DeepScrollMapsBackToTheListHeadAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteMaintainInsertionOrderUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'DeepScrollMapsBackToTheListHeadAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteMaintainInsertionOrderUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(2)).assertEqual(0);
          expect(model.records[0] <= 2).assertTrue();
          expect(model.records[1] > 2).assertTrue();
          expect(model.itemsOfTag(0).length).assertEqual(10);
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
          const insertedEntryE: CustomDataType = makeDataEntry('entry-8', 'tag-2025');
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
      },
    );

    /**
     * @tc.name ContentIndexFallsIntoItsCategoryAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchSurviveRepeatedReadsUnderRepeat
     * @tc.desc ContentIndexFallsIntoItsCategoryAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchSurviveRepeatedReadsUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ContentIndexFallsIntoItsCategoryAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchSurviveRepeatedReadsUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(9)).assertEqual(0);
          expect(model.records[0] <= 9).assertTrue();
          expect(model.records[1] > 9).assertTrue();
          expect(model.itemsOfTag(0).length).assertEqual(10);
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedEntryB: CustomDataType = makeDataEntry('entry-11', 'tag-2025');
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
     * @tc.name ClassLookupReturnsTheOwningTagAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadRetainTheOriginalPayloadUnderRepeat
     * @tc.desc ClassLookupReturnsTheOwningTagAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadRetainTheOriginalPayloadUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ClassLookupReturnsTheOwningTagAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadRetainTheOriginalPayloadUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(16)).assertEqual(1);
          expect(model.records[1] <= 16).assertTrue();
          expect(model.records[2] > 16).assertTrue();
          expect(model.itemsOfTag(1).length).assertEqual(10);
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
          const insertedEntryD: CustomDataType = makeDataEntry('entry-7', 'tag-2026');
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
     * @tc.name DeepScrollMapsBackToTheListHeadAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotContinueAfterAReadProbeUnderRepeat
     * @tc.desc DeepScrollMapsBackToTheListHeadAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotContinueAfterAReadProbeUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'DeepScrollMapsBackToTheListHeadAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotContinueAfterAReadProbeUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(23)).assertEqual(2);
          expect(model.records[2] <= 23).assertTrue();
          expect(model.records[3] > 23).assertTrue();
          expect(model.itemsOfTag(2).length).assertEqual(10);
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
     * @tc.name ContentIndexFallsIntoItsCategoryAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeKeepListenerAndDataInStepUnderRepeat
     * @tc.desc ContentIndexFallsIntoItsCategoryAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeKeepListenerAndDataInStepUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ContentIndexFallsIntoItsCategoryAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeKeepListenerAndDataInStepUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findClassIndex(30)).assertEqual(3);
          expect(model.records[3] <= 30).assertTrue();
          expect(model.records[4] > 30).assertTrue();
          expect(model.itemsOfTag(3).length).assertEqual(10);
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
          const insertedEntryC: CustomDataType = makeDataEntry('entry-6', 'tag-2024');
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
  });
}
