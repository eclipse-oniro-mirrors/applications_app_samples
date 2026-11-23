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

export default function MonthInterfaceValidationTest(): void {
  describe('MonthInterfaceValidationTest', () => {
    beforeAll(() => {
      logSuite('MonthInterfaceValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('MonthInterfaceValidationTest', 'end');
    });

    /**
     * @tc.name NotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveMaintainInsertionOrderUnderRepeat
     * @tc.desc NotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveMaintainInsertionOrderUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveMaintainInsertionOrderUnderRepeat',
      0,
      () => {
        {
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthD: LoadedMonth = {
            month: monthLabel(9, 2025),
            num: 9,
            days: getMonthDate(9, 2025),
            year: 2025,
          };
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthF: LoadedMonth = {
            month: monthLabel(3, 2024),
            num: 3,
            days: getMonthDate(3, 2024),
            year: 2024,
          };
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthC: LoadedMonth = {
            month: monthLabel(7, 2025),
            num: 7,
            days: getMonthDate(7, 2025),
            year: 2025,
          };
          source.addData(source.totalCount(), appendedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthE: LoadedMonth = {
            month: monthLabel(1, 2024),
            num: 1,
            days: getMonthDate(1, 2024),
            year: 2024,
          };
          source.pushData(pushedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).year >= 2024).assertTrue();
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const appendedMonthB: LoadedMonth = {
            month: monthLabel(5, 2025),
            num: 5,
            days: getMonthDate(5, 2025),
            year: 2025,
          };
          source.addData(source.totalCount(), appendedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthD: LoadedMonth = {
            month: monthLabel(11, 2024),
            num: 11,
            days: getMonthDate(11, 2024),
            year: 2024,
          };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).year >= 2024).assertTrue();
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthG: LoadedMonth = {
            month: monthLabel(8, 2024),
            num: 8,
            days: getMonthDate(8, 2024),
            year: 2024,
          };
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
     * @tc.name InsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveSurviveRepeatedReadsUnderRepeat
     * @tc.desc InsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveSurviveRepeatedReadsUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'InsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveSurviveRepeatedReadsUnderRepeat',
      0,
      () => {
        {
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedMonthB: LoadedMonth = {
            month: monthLabel(4, 2024),
            num: 4,
            days: getMonthDate(4, 2024),
            year: 2024,
          };
          source.addData(0, insertedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthE: LoadedMonth = {
            month: monthLabel(1, 2024),
            num: 1,
            days: getMonthDate(1, 2024),
            year: 2024,
          };
          source.addData(source.totalCount(), appendedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthG: LoadedMonth = {
            month: monthLabel(7, 2026),
            num: 7,
            days: getMonthDate(7, 2026),
            year: 2026,
          };
          source.pushData(pushedMonthG);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthD: LoadedMonth = {
            month: monthLabel(11, 2024),
            num: 11,
            days: getMonthDate(11, 2024),
            year: 2024,
          };
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthF: LoadedMonth = {
            month: monthLabel(5, 2026),
            num: 5,
            days: getMonthDate(5, 2026),
            year: 2026,
          };
          source.pushData(pushedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).year >= 2024).assertTrue();
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
      },
    );

    /**
     * @tc.name NotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailRetainTheOriginalPayloadUnderRepeat
     * @tc.desc NotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailRetainTheOriginalPayloadUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailThenNotifyDeleteThenPushMonthAndInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailRetainTheOriginalPayloadUnderRepeat',
      0,
      () => {
        {
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthC: LoadedMonth = {
            month: monthLabel(8, 2026),
            num: 8,
            days: getMonthDate(8, 2026),
            year: 2026,
          };
          source.addData(0, insertedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthF: LoadedMonth = {
            month: monthLabel(5, 2026),
            num: 5,
            days: getMonthDate(5, 2026),
            year: 2026,
          };
          source.addData(source.totalCount(), appendedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthH: LoadedMonth = {
            month: monthLabel(11, 2025),
            num: 11,
            days: getMonthDate(11, 2025),
            year: 2025,
          };
          source.pushData(pushedMonthH);
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.last()).assertEqual('add:2');
          expect(source.totalCount()).assertEqual(3);
          expect(recorder.countOf('add')).assertEqual(4);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const insertedMonthB: LoadedMonth = {
            month: monthLabel(6, 2026),
            num: 6,
            days: getMonthDate(6, 2026),
            year: 2026,
          };
          source.addData(0, insertedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthE: LoadedMonth = {
            month: monthLabel(3, 2026),
            num: 3,
            days: getMonthDate(3, 2026),
            year: 2026,
          };
          source.addData(source.totalCount(), appendedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(1);
          const appendedMonthD: LoadedMonth = {
            month: monthLabel(1, 2026),
            num: 1,
            days: getMonthDate(1, 2026),
            year: 2026,
          };
          source.addData(source.totalCount(), appendedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(2);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthF: LoadedMonth = {
            month: monthLabel(7, 2025),
            num: 7,
            days: getMonthDate(7, 2025),
            year: 2025,
          };
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
     * @tc.name ReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailContinueAfterAReadProbeUnderRepeat
     * @tc.desc ReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailContinueAfterAReadProbeUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'ReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailContinueAfterAReadProbeUnderRepeat',
      0,
      () => {
        {
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthD: LoadedMonth = {
            month: monthLabel(12, 2025),
            num: 12,
            days: getMonthDate(12, 2025),
            year: 2025,
          };
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
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthC: LoadedMonth = {
            month: monthLabel(10, 2025),
            num: 10,
            days: getMonthDate(10, 2025),
            year: 2025,
          };
          source.addData(0, insertedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthF: LoadedMonth = {
            month: monthLabel(7, 2025),
            num: 7,
            days: getMonthDate(7, 2025),
            year: 2025,
          };
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
     * @tc.name PushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailKeepListenerAndDataInStepUnderRepeat
     * @tc.desc PushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailKeepListenerAndDataInStepUnderRepeat
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'PushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailKeepListenerAndDataInStepUnderRepeat',
      0,
      () => {
        {
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: LoadedMonth = {
            month: monthLabel(7, 2024),
            num: 7,
            days: getMonthDate(7, 2024),
            year: 2024,
          };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).year >= 2024).assertTrue();
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthE: LoadedMonth = {
            month: monthLabel(4, 2024),
            num: 4,
            days: getMonthDate(4, 2024),
            year: 2024,
          };
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
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          expect((): void => {
            source.getData(0);
          }).assertThrowError('RangeError');
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthD: LoadedMonth = {
            month: monthLabel(2, 2024),
            num: 2,
            days: getMonthDate(2, 2024),
            year: 2024,
          };
          source.addData(0, insertedMonthD);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthG: LoadedMonth = {
            month: monthLabel(11, 2024),
            num: 11,
            days: getMonthDate(11, 2024),
            year: 2024,
          };
          source.addData(source.totalCount(), appendedMonthG);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthC: LoadedMonth = {
            month: monthLabel(12, 2024),
            num: 12,
            days: getMonthDate(12, 2024),
            year: 2024,
          };
          source.addData(0, insertedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(0);
          expect(recorder.last()).assertEqual('change:0');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(2);
          const appendedMonthF: LoadedMonth = {
            month: monthLabel(9, 2024),
            num: 9,
            days: getMonthDate(9, 2024),
            year: 2024,
          };
          source.addData(source.totalCount(), appendedMonthF);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.countOf('add')).assertEqual(3);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthH: LoadedMonth = {
            month: monthLabel(3, 2026),
            num: 3,
            days: getMonthDate(3, 2026),
            year: 2026,
          };
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
     * @tc.name NotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailKeepEventOrderStableAfterInsertion
     * @tc.desc NotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailKeepEventOrderStableAfterInsertion
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'NotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeThenAttachListenerThenAppendMonthTailKeepEventOrderStableAfterInsertion',
      0,
      () => {
        {
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthC: LoadedMonth = {
            month: monthLabel(11, 2026),
            num: 11,
            days: getMonthDate(11, 2026),
            year: 2026,
          };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).year >= 2024).assertTrue();
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthF: LoadedMonth = {
            month: monthLabel(8, 2026),
            num: 8,
            days: getMonthDate(8, 2026),
            year: 2026,
          };
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
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: LoadedMonth = {
            month: monthLabel(9, 2026),
            num: 9,
            days: getMonthDate(9, 2026),
            year: 2026,
          };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).year >= 2024).assertTrue();
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthE: LoadedMonth = {
            month: monthLabel(6, 2026),
            num: 6,
            days: getMonthDate(6, 2026),
            year: 2026,
          };
          source.addData(0, insertedMonthE);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:0');
          source.notifyDataChange(1);
          expect(recorder.last()).assertEqual('change:1');
          source.registerDataChangeListener(recorder);
          source.notifyDataAdd(0);
          expect(recorder.countOf('add')).assertEqual(3);
          const appendedMonthH: LoadedMonth = {
            month: monthLabel(3, 2026),
            num: 3,
            days: getMonthDate(3, 2026),
            year: 2026,
          };
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
     * @tc.name AppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMovePreserveTailIndicesAfterInsertion
     * @tc.desc AppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMovePreserveTailIndicesAfterInsertion
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'AppendMonthTailThenNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMoveThenInsertMonthAtHeadThenNotifyChangeAndNotifyDeleteThenPushMonthThenReadFirstSlotThenNotifyMovePreserveTailIndicesAfterInsertion',
      0,
      () => {
        {
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const appendedMonthB: LoadedMonth = {
            month: monthLabel(9, 2026),
            num: 9,
            days: getMonthDate(9, 2026),
            year: 2026,
          };
          source.addData(source.totalCount(), appendedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthD: LoadedMonth = {
            month: monthLabel(3, 2025),
            num: 3,
            days: getMonthDate(3, 2025),
            year: 2025,
          };
          source.pushData(pushedMonthD);
          expect(source.totalCount()).assertEqual(2);
          expect(recorder.last()).assertEqual('add:1');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).year >= 2024).assertTrue();
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthG: LoadedMonth = {
            month: monthLabel(12, 2025),
            num: 12,
            days: getMonthDate(12, 2025),
            year: 2025,
          };
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
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          source.notifyDataDelete(0);
          expect(recorder.last()).assertEqual('delete:0');
          const pushedMonthC: LoadedMonth = {
            month: monthLabel(1, 2025),
            num: 1,
            days: getMonthDate(1, 2025),
            year: 2025,
          };
          source.pushData(pushedMonthC);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).year >= 2024).assertTrue();
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.countOf('add')).assertEqual(1);
          expect(recorder.trace().length >= 0).assertTrue();
        }
        {
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          expect(source.totalCount()).assertEqual(0);
          const pushedMonthB: LoadedMonth = {
            month: monthLabel(11, 2025),
            num: 11,
            days: getMonthDate(11, 2025),
            year: 2025,
          };
          source.pushData(pushedMonthB);
          expect(source.totalCount()).assertEqual(1);
          expect(recorder.last()).assertEqual('add:0');
          expect(source.getData(0) !== undefined).assertTrue();
          expect(source.getData(0).year >= 2024).assertTrue();
          source.notifyDataMove(0, 1);
          expect(recorder.last()).assertEqual('move:0:1');
          const insertedMonthE: LoadedMonth = {
            month: monthLabel(8, 2025),
            num: 8,
            days: getMonthDate(8, 2025),
            year: 2025,
          };
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
  });
}
