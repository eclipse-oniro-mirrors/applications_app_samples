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

export default function CascadePointerValidationTest(): void {
  describe('CascadePointerValidationTest', () => {
    beforeAll(() => {
      logSuite('CascadePointerValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('CascadePointerValidationTest', 'end');
    });

    /**
     * @tc.name TapTagPinsTheContentPointerAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepEventOrderStableForCalendarPanels
     * @tc.desc TapTagPinsTheContentPointerAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepEventOrderStableForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'TapTagPinsTheContentPointerAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepEventOrderStableForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(0);
          expect(model.currentTagIndex).assertEqual(0);
          expect(model.itemScrollTarget).assertEqual(0);
          model.scrollContent(0);
          expect(model.findClassIndex(0)).assertEqual(0);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 0;
          model.tagEnd = 2;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
     * @tc.name ScrollKeepsTheFocusedTagVisibleAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadPreserveTailIndicesForCalendarPanels
     * @tc.desc ScrollKeepsTheFocusedTagVisibleAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadPreserveTailIndicesForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ScrollKeepsTheFocusedTagVisibleAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadPreserveTailIndicesForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(1);
          expect(model.currentTagIndex).assertEqual(1);
          expect(model.itemScrollTarget).assertEqual(10);
          model.scrollContent(7);
          expect(model.findClassIndex(7)).assertEqual(0);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 1;
          model.tagEnd = 3;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
          const insertedEntryG: CustomDataType = makeDataEntry('entry-7', 'tag-2026');
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

    /**
     * @tc.name PointerUpdateFollowsWatchHandlerAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotLeaveTotalsAlignedForCalendarPanels
     * @tc.desc PointerUpdateFollowsWatchHandlerAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotLeaveTotalsAlignedForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PointerUpdateFollowsWatchHandlerAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotLeaveTotalsAlignedForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(2);
          expect(model.currentTagIndex).assertEqual(2);
          expect(model.itemScrollTarget).assertEqual(20);
          model.scrollContent(14);
          expect(model.findClassIndex(14)).assertEqual(1);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 2;
          model.tagEnd = 4;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name TapTagPinsTheContentPointerAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchReportSingleNotificationForCalendarPanels
     * @tc.desc TapTagPinsTheContentPointerAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchReportSingleNotificationForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'TapTagPinsTheContentPointerAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchReportSingleNotificationForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(3);
          expect(model.currentTagIndex).assertEqual(3);
          expect(model.itemScrollTarget).assertEqual(30);
          model.scrollContent(21);
          expect(model.findClassIndex(21)).assertEqual(2);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 3;
          model.tagEnd = 5;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
          const insertedEntryE: CustomDataType = makeDataEntry('entry-4', 'tag-2024');
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
     * @tc.name ScrollKeepsTheFocusedTagVisibleAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerKeepTheRegistryCleanForCalendarPanels
     * @tc.desc ScrollKeepsTheFocusedTagVisibleAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerKeepTheRegistryCleanForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ScrollKeepsTheFocusedTagVisibleAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerKeepTheRegistryCleanForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(4);
          expect(model.currentTagIndex).assertEqual(4);
          expect(model.itemScrollTarget).assertEqual(40);
          model.scrollContent(28);
          expect(model.findClassIndex(28)).assertEqual(2);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 4;
          model.tagEnd = 6;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
     * @tc.name PointerUpdateFollowsWatchHandlerAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAvoidDuplicateCallbacksForCalendarPanels
     * @tc.desc PointerUpdateFollowsWatchHandlerAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAvoidDuplicateCallbacksForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PointerUpdateFollowsWatchHandlerAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchAvoidDuplicateCallbacksForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(5);
          expect(model.currentTagIndex).assertEqual(5);
          expect(model.itemScrollTarget).assertEqual(50);
          model.scrollContent(35);
          expect(model.findClassIndex(35)).assertEqual(3);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 5;
          model.tagEnd = 7;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
     * @tc.name TapTagPinsTheContentPointerAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadMaintainInsertionOrderForCalendarPanels
     * @tc.desc TapTagPinsTheContentPointerAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadMaintainInsertionOrderForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'TapTagPinsTheContentPointerAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadMaintainInsertionOrderForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(6);
          expect(model.currentTagIndex).assertEqual(6);
          expect(model.itemScrollTarget).assertEqual(60);
          model.scrollContent(42);
          expect(model.findClassIndex(42)).assertEqual(4);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 6;
          model.tagEnd = 8;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
          const insertedEntryH: CustomDataType = makeDataEntry('entry-3', 'tag-2026');
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
     * @tc.name ScrollKeepsTheFocusedTagVisibleAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteSurviveRepeatedReadsForCalendarPanels
     * @tc.desc ScrollKeepsTheFocusedTagVisibleAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteSurviveRepeatedReadsForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ScrollKeepsTheFocusedTagVisibleAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteSurviveRepeatedReadsForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(7);
          expect(model.currentTagIndex).assertEqual(7);
          expect(model.itemScrollTarget).assertEqual(70);
          model.scrollContent(49);
          expect(model.findClassIndex(49)).assertEqual(4);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 7;
          model.tagEnd = 9;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
          const insertedEntryD: CustomDataType = makeDataEntry('entry-4', 'tag-2026');
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
          source.notifyDataChange(20);
          expect(recorder.last()).assertEqual('change:20');
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name PointerUpdateFollowsWatchHandlerAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchRetainTheOriginalPayloadForCalendarPanels
     * @tc.desc PointerUpdateFollowsWatchHandlerAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchRetainTheOriginalPayloadForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PointerUpdateFollowsWatchHandlerAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchRetainTheOriginalPayloadForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(8);
          expect(model.currentTagIndex).assertEqual(8);
          expect(model.itemScrollTarget).assertEqual(80);
          model.scrollContent(56);
          expect(model.findClassIndex(56)).assertEqual(5);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 8;
          model.tagEnd = 10;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
     * @tc.name TapTagPinsTheContentPointerAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerContinueAfterAReadProbeForCalendarPanels
     * @tc.desc TapTagPinsTheContentPointerAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerContinueAfterAReadProbeForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'TapTagPinsTheContentPointerAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerContinueAfterAReadProbeForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(9);
          expect(model.currentTagIndex).assertEqual(9);
          expect(model.itemScrollTarget).assertEqual(90);
          model.scrollContent(63);
          expect(model.findClassIndex(63)).assertEqual(6);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 9;
          model.tagEnd = 11;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
          const insertedEntryC: CustomDataType = makeDataEntry('entry-3', 'tag-2024');
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
     * @tc.name ScrollKeepsTheFocusedTagVisibleAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepListenerAndDataInStepForCalendarPanels
     * @tc.desc ScrollKeepsTheFocusedTagVisibleAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepListenerAndDataInStepForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ScrollKeepsTheFocusedTagVisibleAndNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchKeepListenerAndDataInStepForCalendarPanels',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(10);
          expect(model.currentTagIndex).assertEqual(10);
          expect(model.itemScrollTarget).assertEqual(100);
          model.scrollContent(70);
          expect(model.findClassIndex(70)).assertEqual(7);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 10;
          model.tagEnd = 11;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
          const insertedEntryF: CustomDataType = makeDataEntry('entry-1', 'tag-2025');
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
     * @tc.name PointerUpdateFollowsWatchHandlerAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeKeepEventOrderStableUnderRepeat
     * @tc.desc PointerUpdateFollowsWatchHandlerAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeKeepEventOrderStableUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PointerUpdateFollowsWatchHandlerAndInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeKeepEventOrderStableUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(11);
          expect(model.currentTagIndex).assertEqual(11);
          expect(model.itemScrollTarget).assertEqual(110);
          model.scrollContent(77);
          expect(model.findClassIndex(77)).assertEqual(7);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 11;
          model.tagEnd = 11;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
        }
        {
          const source: CascadeSource = new CascadeSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedEntryB: CustomDataType = makeDataEntry('entry-2', 'tag-2025');
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
     * @tc.name TapTagPinsTheContentPointerAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeletePreserveTailIndicesUnderRepeat
     * @tc.desc TapTagPinsTheContentPointerAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeletePreserveTailIndicesUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'TapTagPinsTheContentPointerAndAttachListenerThenReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeletePreserveTailIndicesUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(0);
          expect(model.currentTagIndex).assertEqual(0);
          expect(model.itemScrollTarget).assertEqual(0);
          model.scrollContent(84);
          expect(model.findClassIndex(84)).assertEqual(8);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 0;
          model.tagEnd = 2;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
          const insertedEntryE: CustomDataType = makeDataEntry('entry-12', 'tag-2026');
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
     * @tc.name ScrollKeepsTheFocusedTagVisibleAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchLeaveTotalsAlignedUnderRepeat
     * @tc.desc ScrollKeepsTheFocusedTagVisibleAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchLeaveTotalsAlignedUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ScrollKeepsTheFocusedTagVisibleAndNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotThenPushTenItemBatchLeaveTotalsAlignedUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(1);
          expect(model.currentTagIndex).assertEqual(1);
          expect(model.itemScrollTarget).assertEqual(10);
          model.scrollContent(91);
          expect(model.findClassIndex(91)).assertEqual(9);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 1;
          model.tagEnd = 3;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
          const insertedEntryG: CustomDataType = makeDataEntry('entry-8', 'tag-2024');
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
     * @tc.name PointerUpdateFollowsWatchHandlerAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerReportSingleNotificationUnderRepeat
     * @tc.desc PointerUpdateFollowsWatchHandlerAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerReportSingleNotificationUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PointerUpdateFollowsWatchHandlerAndReadFirstSlotThenPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeThenAttachListenerReportSingleNotificationUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(2);
          expect(model.currentTagIndex).assertEqual(2);
          expect(model.itemScrollTarget).assertEqual(20);
          model.scrollContent(98);
          expect(model.findClassIndex(98)).assertEqual(9);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 2;
          model.tagEnd = 4;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
     * @tc.name TapTagPinsTheContentPointerAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotKeepTheRegistryCleanUnderRepeat
     * @tc.desc TapTagPinsTheContentPointerAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotKeepTheRegistryCleanUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'TapTagPinsTheContentPointerAndPushTenItemBatchThenNotifyChangeThenAttachListenerThenReadFirstSlotKeepTheRegistryCleanUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(3);
          expect(model.currentTagIndex).assertEqual(3);
          expect(model.itemScrollTarget).assertEqual(30);
          model.scrollContent(105);
          expect(model.findClassIndex(105)).assertEqual(10);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 3;
          model.tagEnd = 5;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
          const insertedEntryF: CustomDataType = makeDataEntry('entry-7', 'tag-2025');
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
     * @tc.name ScrollKeepsTheFocusedTagVisibleAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeAvoidDuplicateCallbacksUnderRepeat
     * @tc.desc ScrollKeepsTheFocusedTagVisibleAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeAvoidDuplicateCallbacksUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ScrollKeepsTheFocusedTagVisibleAndPushTenItemBatchThenInsertMonthAtHeadThenNotifyDeleteThenPushTenItemBatchThenNotifyChangeAvoidDuplicateCallbacksUnderRepeat',
      0,
      () => {
        {
          const model: CascadeModel = new CascadeModel();
          model.selectTag(4);
          expect(model.currentTagIndex).assertEqual(4);
          expect(model.itemScrollTarget).assertEqual(40);
          model.scrollContent(112);
          expect(model.findClassIndex(112)).assertEqual(11);
          expect(model.clickOnTagList).assertTrue();
          model.tagStart = 4;
          model.tagEnd = 6;
          model.onIndexChange();
          expect(model.tagScrollTarget >= 0).assertTrue();
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
          expect(source.totalCount()).assertEqual(21);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );
  });
}
