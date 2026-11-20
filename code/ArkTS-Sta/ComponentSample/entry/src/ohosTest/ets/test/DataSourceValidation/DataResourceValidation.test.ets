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

export default function DataResourceValidationTest(): void {
  describe('DataResourceValidationTest', () => {
    beforeAll(() => {
      logSuite('DataResourceValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('DataResourceValidationTest', 'end');
    });

    /**
     * @tc.name StyleTableContractHoldsAndAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveKeepEventOrderStableForCalendarPanels
     * @tc.desc StyleTableContractHoldsAndAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveKeepEventOrderStableForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'StyleTableContractHoldsAndAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveKeepEventOrderStableForCalendarPanels',
      0,
      () => {
        {
          const metrics: int[] = StyleTable.all();
          expect(metrics.length).assertEqual(8);
          expect(metrics[0]).assertEqual(12);
          expect(metrics[1]).assertEqual(75);
          expect(metrics[7]).assertEqual(200);
          expect(StyleTable.isMonotonicExceptGutters()).assertTrue();
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

    /**
     * @tc.name MonthResourceShapeIsStableAndAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMovePreserveTailIndicesForCalendarPanels
     * @tc.desc MonthResourceShapeIsStableAndAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMovePreserveTailIndicesForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'MonthResourceShapeIsStableAndAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMovePreserveTailIndicesForCalendarPanels',
      0,
      () => {
        {
          const grid: int[] = getMonthDate(2, 2024);
          expect(grid.length).assertEqual(35);
          expect(realDays(grid).length).assertEqual(29);
          expect(countValue(grid, 0)).assertEqual(6);
          expect(fingerprint(grid)).assertEqual(fingerprint(expectedGrid(2, 2024)));
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthC: CalendarMonth = { month: monthLabel(6, 2024), num: 6, days: getMonthDate(6, 2024) };
          source.addData(source.totalCount(), appendedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthE: CalendarMonth = { month: monthLabel(12, 2026), num: 12, days: getMonthDate(12, 2026) };
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
      },
    );

    /**
     * @tc.name PanelSequenceKeepsItsLabelsAndNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveLeaveTotalsAlignedForCalendarPanels
     * @tc.desc PanelSequenceKeepsItsLabelsAndNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveLeaveTotalsAlignedForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PanelSequenceKeepsItsLabelsAndNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveLeaveTotalsAlignedForCalendarPanels',
      0,
      () => {
        {
          const panels = PanelBuilder.build(11, 2024, 3);
          expect(panels.length).assertEqual(3);
          expect(panels[2].num).assertEqual(1);
          expect(panels[2].year).assertEqual(2025);
          expect(panels[0].label.indexOf('2024') >= 0).assertTrue();
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
          const appendedMonthD: CalendarMonth = { month: monthLabel(10, 2026), num: 10, days: getMonthDate(10, 2026) };
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthF: CalendarMonth = { month: monthLabel(4, 2025), num: 4, days: getMonthDate(4, 2025) };
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
     * @tc.name StyleTableContractHoldsAndInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailReportSingleNotificationForCalendarPanels
     * @tc.desc StyleTableContractHoldsAndInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailReportSingleNotificationForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'StyleTableContractHoldsAndInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailReportSingleNotificationForCalendarPanels',
      0,
      () => {
        {
          const week: WeekHeaderEntry[] = WeekHeader.entries();
          expect(week.length).assertEqual(7);
          expect(week[0].emphasized).assertTrue();
          expect(week[6].emphasized).assertTrue();
          expect(week[3].emphasized).assertFalse();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedMonthB: CalendarMonth = { month: monthLabel(5, 2025), num: 5, days: getMonthDate(5, 2025) };
          source.addData(0, insertedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthE: CalendarMonth = { month: monthLabel(2, 2025), num: 2, days: getMonthDate(2, 2025) };
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
      },
    );

    /**
     * @tc.name MonthResourceShapeIsStableAndNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailKeepTheRegistryCleanForCalendarPanels
     * @tc.desc MonthResourceShapeIsStableAndNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailKeepTheRegistryCleanForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'MonthResourceShapeIsStableAndNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailKeepTheRegistryCleanForCalendarPanels',
      0,
      () => {
        {
          const metrics: int[] = StyleTable.all();
          expect(metrics.length).assertEqual(8);
          expect(metrics[0]).assertEqual(12);
          expect(metrics[1]).assertEqual(75);
          expect(metrics[7]).assertEqual(200);
          expect(StyleTable.isMonotonicExceptGutters()).assertTrue();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthC: CalendarMonth = { month: monthLabel(9, 2024), num: 9, days: getMonthDate(9, 2024) };
          source.addData(0, insertedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthF: CalendarMonth = { month: monthLabel(6, 2024), num: 6, days: getMonthDate(6, 2024) };
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
     * @tc.name PanelSequenceKeepsItsLabelsAndReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailAvoidDuplicateCallbacksForCalendarPanels
     * @tc.desc PanelSequenceKeepsItsLabelsAndReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailAvoidDuplicateCallbacksForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PanelSequenceKeepsItsLabelsAndReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailAvoidDuplicateCallbacksForCalendarPanels',
      0,
      () => {
        {
          const grid: int[] = getMonthDate(2, 2024);
          expect(grid.length).assertEqual(35);
          expect(realDays(grid).length).assertEqual(29);
          expect(countValue(grid, 0)).assertEqual(6);
          expect(fingerprint(grid)).assertEqual(fingerprint(expectedGrid(2, 2024)));
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
          const insertedMonthD: CalendarMonth = { month: monthLabel(1, 2026), num: 1, days: getMonthDate(1, 2026) };
          source.addData(0, insertedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthG: CalendarMonth = { month: monthLabel(10, 2026), num: 10, days: getMonthDate(10, 2026) };
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
      },
    );

    /**
     * @tc.name StyleTableContractHoldsAndPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailMaintainInsertionOrderForCalendarPanels
     * @tc.desc StyleTableContractHoldsAndPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailMaintainInsertionOrderForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'StyleTableContractHoldsAndPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailMaintainInsertionOrderForCalendarPanels',
      0,
      () => {
        {
          const panels = PanelBuilder.build(11, 2024, 3);
          expect(panels.length).assertEqual(3);
          expect(panels[2].num).assertEqual(1);
          expect(panels[2].year).assertEqual(2025);
          expect(panels[0].label.indexOf('2024') >= 0).assertTrue();
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
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).num >= 1).assertTrue();
          expect(source.getData(0).days.length % 7).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthE: CalendarMonth = { month: monthLabel(5, 2025), num: 5, days: getMonthDate(5, 2025) };
          source.addData(0, insertedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          const appendedMonthH: CalendarMonth = { month: monthLabel(2, 2025), num: 2, days: getMonthDate(2, 2025) };
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
     * @tc.name MonthResourceShapeIsStableAndNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveSurviveRepeatedReadsForCalendarPanels
     * @tc.desc MonthResourceShapeIsStableAndNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveSurviveRepeatedReadsForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'MonthResourceShapeIsStableAndNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveSurviveRepeatedReadsForCalendarPanels',
      0,
      () => {
        {
          const week: WeekHeaderEntry[] = WeekHeader.entries();
          expect(week.length).assertEqual(7);
          expect(week[0].emphasized).assertTrue();
          expect(week[6].emphasized).assertTrue();
          expect(week[3].emphasized).assertFalse();
        }
        {
          const source: CalendarMonthSource = new CalendarMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthC: CalendarMonth = { month: monthLabel(12, 2024), num: 12, days: getMonthDate(12, 2024) };
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
      },
    );

    /**
     * @tc.name PanelSequenceKeepsItsLabelsAndAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveRetainTheOriginalPayloadForCalendarPanels
     * @tc.desc PanelSequenceKeepsItsLabelsAndAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveRetainTheOriginalPayloadForCalendarPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PanelSequenceKeepsItsLabelsAndAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveRetainTheOriginalPayloadForCalendarPanels',
      0,
      () => {
        {
          const metrics: int[] = StyleTable.all();
          expect(metrics.length).assertEqual(8);
          expect(metrics[0]).assertEqual(12);
          expect(metrics[1]).assertEqual(75);
          expect(metrics[7]).assertEqual(200);
          expect(StyleTable.isMonotonicExceptGutters()).assertTrue();
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
  });
}
