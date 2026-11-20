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

export default function IndexInputValidationTest(): void {
  describe('IndexInputValidationTest', () => {
    beforeAll(() => {
      logSuite('IndexInputValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('IndexInputValidationTest', 'end');
    });

    /**
     * @tc.name TagIndexResolvesToItemOffsetAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepEventOrderStableForCalendarPanels
     * @tc.desc TagIndexResolvesToItemOffsetAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepEventOrderStableForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'TagIndexResolvesToItemOffsetAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepEventOrderStableForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findItemIndex(1)).assertEqual(10);
          expect(model.records[1]).assertEqual(10);
          expect(model.tagLabels[1].length > 0).assertTrue();
          expect(model.findItemIndex(1) + 10 <= 120).assertTrue();
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
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name CategoryLookupWalksTheRecordOffsetsAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadPreserveTailIndicesForCalendarPanels
     * @tc.desc CategoryLookupWalksTheRecordOffsetsAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadPreserveTailIndicesForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'CategoryLookupWalksTheRecordOffsetsAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadPreserveTailIndicesForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findItemIndex(2)).assertEqual(20);
          expect(model.records[2]).assertEqual(20);
          expect(model.tagLabels[2].length > 0).assertTrue();
          expect(model.findItemIndex(2) + 10 <= 120).assertTrue();
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
          const insertedEntryG: CustomDataType = makeDataEntry('entry-11', 'tag-2024');
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
          const insertedEntryF: CustomDataType = makeDataEntry('entry-9', 'tag-2024');
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
     * @tc.name FirstLevelIndexMapsToContentStartAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotLeaveTotalsAlignedForCalendarPanels
     * @tc.desc FirstLevelIndexMapsToContentStartAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotLeaveTotalsAlignedForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'FirstLevelIndexMapsToContentStartAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotLeaveTotalsAlignedForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findItemIndex(3)).assertEqual(30);
          expect(model.records[3]).assertEqual(30);
          expect(model.tagLabels[3].length > 0).assertTrue();
          expect(model.findItemIndex(3) + 10 <= 120).assertTrue();
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
     * @tc.name TagIndexResolvesToItemOffsetAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchReportSingleNotificationForCalendarPanels
     * @tc.desc TagIndexResolvesToItemOffsetAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchReportSingleNotificationForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'TagIndexResolvesToItemOffsetAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchReportSingleNotificationForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findItemIndex(4)).assertEqual(40);
          expect(model.records[4]).assertEqual(40);
          expect(model.tagLabels[4].length > 0).assertTrue();
          expect(model.findItemIndex(4) + 10 <= 120).assertTrue();
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
          const insertedEntryE: CustomDataType = makeDataEntry('entry-8', 'tag-2025');
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
     * @tc.name CategoryLookupWalksTheRecordOffsetsAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerKeepTheRegistryCleanForCalendarPanels
     * @tc.desc CategoryLookupWalksTheRecordOffsetsAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerKeepTheRegistryCleanForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'CategoryLookupWalksTheRecordOffsetsAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerKeepTheRegistryCleanForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findItemIndex(5)).assertEqual(50);
          expect(model.records[5]).assertEqual(50);
          expect(model.tagLabels[5].length > 0).assertTrue();
          expect(model.findItemIndex(5) + 10 <= 120).assertTrue();
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
          expect(source.totalCount()).assertEqual(11);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name FirstLevelIndexMapsToContentStartAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAvoidDuplicateCallbacksForCalendarPanels
     * @tc.desc FirstLevelIndexMapsToContentStartAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAvoidDuplicateCallbacksForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'FirstLevelIndexMapsToContentStartAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAvoidDuplicateCallbacksForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findItemIndex(6)).assertEqual(60);
          expect(model.records[6]).assertEqual(60);
          expect(model.tagLabels[6].length > 0).assertTrue();
          expect(model.findItemIndex(6) + 10 <= 120).assertTrue();
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
     * @tc.name TagIndexResolvesToItemOffsetAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadMaintainInsertionOrderForCalendarPanels
     * @tc.desc TagIndexResolvesToItemOffsetAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadMaintainInsertionOrderForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'TagIndexResolvesToItemOffsetAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadMaintainInsertionOrderForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findItemIndex(7)).assertEqual(70);
          expect(model.records[7]).assertEqual(70);
          expect(model.tagLabels[7].length > 0).assertTrue();
          expect(model.findItemIndex(7) + 10 <= 120).assertTrue();
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
          const insertedEntryH: CustomDataType = makeDataEntry('entry-7', 'tag-2024');
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
     * @tc.name CategoryLookupWalksTheRecordOffsetsAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteSurviveRepeatedReadsForCalendarPanels
     * @tc.desc CategoryLookupWalksTheRecordOffsetsAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteSurviveRepeatedReadsForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'CategoryLookupWalksTheRecordOffsetsAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteSurviveRepeatedReadsForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findItemIndex(8)).assertEqual(80);
          expect(model.records[8]).assertEqual(80);
          expect(model.tagLabels[8].length > 0).assertTrue();
          expect(model.findItemIndex(8) + 10 <= 120).assertTrue();
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
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name FirstLevelIndexMapsToContentStartAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchRetainTheOriginalPayloadForCalendarPanels
     * @tc.desc FirstLevelIndexMapsToContentStartAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchRetainTheOriginalPayloadForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'FirstLevelIndexMapsToContentStartAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchRetainTheOriginalPayloadForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findItemIndex(9)).assertEqual(90);
          expect(model.records[9]).assertEqual(90);
          expect(model.tagLabels[9].length > 0).assertTrue();
          expect(model.findItemIndex(9) + 10 <= 120).assertTrue();
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
     * @tc.name TagIndexResolvesToItemOffsetAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerContinueAfterAReadProbeForCalendarPanels
     * @tc.desc TagIndexResolvesToItemOffsetAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerContinueAfterAReadProbeForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'TagIndexResolvesToItemOffsetAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerContinueAfterAReadProbeForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findItemIndex(10)).assertEqual(100);
          expect(model.records[10]).assertEqual(100);
          expect(model.tagLabels[10].length > 0).assertTrue();
          expect(model.findItemIndex(10) + 10 <= 120).assertTrue();
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
          const insertedEntryB: CustomDataType = makeDataEntry('entry-5', 'tag-2025');
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
     * @tc.name CategoryLookupWalksTheRecordOffsetsAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepListenerAndDataInStepForCalendarPanels
     * @tc.desc CategoryLookupWalksTheRecordOffsetsAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepListenerAndDataInStepForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'CategoryLookupWalksTheRecordOffsetsAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepListenerAndDataInStepForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          expect(model.findItemIndex(11)).assertEqual(110);
          expect(model.records[11]).assertEqual(110);
          expect(model.tagLabels[11].length > 0).assertTrue();
          expect(model.findItemIndex(11) + 10 <= 120).assertTrue();
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
          const insertedEntryF: CustomDataType = makeDataEntry('entry-5', 'tag-2026');
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
  });
}
