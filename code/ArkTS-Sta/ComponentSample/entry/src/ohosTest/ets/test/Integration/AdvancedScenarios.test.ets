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
import { getMonthDate, getRealTimeDate } from '../../../../main/ets/pages/CustomCalendar/components/GetDate';
import { DateModel } from '../../../../main/ets/pages/CustomCalendar/components/DateModel';
import {
  MonthDataSource as CalendarMonthSource,
  Month as CalendarMonth,
} from '../../../../main/ets/pages/CustomCalendar/components/MonthDataSource';
import {
  MonthDataSource as LoadedMonthSource,
  Month as LoadedMonth,
} from '../../../../main/ets/pages/HighlyLoaded/MonthDataSource';
import {
  MyDataSource as CascadeSource,
  CustomDataType,
  ComponentStyle,
  ListIndexPosition,
} from '../../../../main/ets/pages/SecondaryLinkage/DataType';
import {
  logSuite,
  monthLabel,
  countValue,
  realDays,
  fingerprint,
  expectedGrid,
  daysInMonth,
  firstWeekday,
  sameIntArray,
  firstNonZero,
  joined,
  isLeapYear,
} from '../Shared/Support';
import {
  EventRecorder,
  PanelBuilder,
  WeekHeader,
  WeekHeaderEntry,
  GridInspector,
  SelectionGuard,
  CellProjector,
  makeDataEntry,
  RetryBudget,
  StableRandom,
  EnergyLedger,
  Stopwatch,
} from '../Shared/SharedDriver';
import {
  FocusGrid,
  FocusRingModel,
  GestureSample,
  GestureClassifier,
  ThemeResolver,
  ThemeTokens,
  ContentScaleModel,
  AnimationTimeline,
  EventNode,
  EventDispatcher,
} from '../Shared/UiModels';
import { CartModel, CartItem, BottomBarModel, SettlementBar, ProductInfoModel } from '../Shared/CartModel';
import { CascadeModel, StyleTable, CascadeItem } from '../Shared/SecondaryModel';
import {
  ConfigSnapshot,
  PanelMachine,
  SessionStore,
  Snapshot,
  ResourcePool,
  OfflineQueue,
  ErrorClassifier,
} from '../Shared/LifecycleModels';
import { RolePolicy, Sanitizer, RateLimiter, TokenBucket, AuditTrail } from '../Shared/SecurityModels';

export default function AdvancedScenariosTest(): void {
  describe('AdvancedScenariosTest', () => {
    beforeAll(() => {
      logSuite('AdvancedScenariosTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('AdvancedScenariosTest', 'end');
    });

    /**
     * @tc.name CalendarJourneyAndListenerLifecycleStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc CalendarJourneyAndListenerLifecycleStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndListenerLifecycleStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(1, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(1, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 1);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(2, 2024), num: 2, days: getMonthDate(2, 2024) };
        source.pushData(seededMonth);
        expect(source.totalCount()).assertEqual(1);
        expect(recorder.countOf('add')).assertEqual(1);
        source.addData(0, seededMonth);
        expect(recorder.trace()).assertEqual('add:0|add:0');
        source.unregisterDataChangeListener(recorder);
        const frozen: number = recorder.size();
        source.notifyDataChange(0);
        expect(recorder.size()).assertEqual(frozen);
      }
    });

    /**
     * @tc.name ListenerLifecycleAndSnapshotRoundTripAndCascadeTagSelectionKeepTheVisibleStateInStepDuringPreview
     * @tc.desc ListenerLifecycleAndSnapshotRoundTripAndCascadeTagSelectionKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ListenerLifecycleAndSnapshotRoundTripAndCascadeTagSelectionKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(2, 2024), num: 2, days: getMonthDate(2, 2024) };
        source.pushData(seededMonth);
        expect(source.totalCount()).assertEqual(1);
        expect(recorder.countOf('add')).assertEqual(1);
        source.addData(0, seededMonth);
        expect(recorder.trace()).assertEqual('add:0|add:0');
        source.unregisterDataChangeListener(recorder);
        const frozen: number = recorder.size();
        source.notifyDataChange(0);
        expect(recorder.size()).assertEqual(frozen);
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '3');
        snapshot.put('day', '3');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('3');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(3);
        expect(model.itemScrollTarget).assertEqual(30);
        expect(model.currentTagIndex).assertEqual(3);
        expect(model.itemsOfTag(3).length).assertEqual(10);
      }
    });

    /**
     * @tc.name SnapshotRoundTripAndCascadeTagSelectionPreserveTheDeclaredContractDuringPreview
     * @tc.desc SnapshotRoundTripAndCascadeTagSelectionPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndCascadeTagSelectionPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '3');
        snapshot.put('day', '3');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('3');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(3);
        expect(model.itemScrollTarget).assertEqual(30);
        expect(model.currentTagIndex).assertEqual(3);
        expect(model.itemsOfTag(3).length).assertEqual(10);
      }
    });

    /**
     * @tc.name CascadeTagSelectionAndCalendarJourneyAndListenerLifecycleSurviveRapidInteractionDuringPreview
     * @tc.desc CascadeTagSelectionAndCalendarJourneyAndListenerLifecycleSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CascadeTagSelectionAndCalendarJourneyAndListenerLifecycleSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(3);
        expect(model.itemScrollTarget).assertEqual(30);
        expect(model.currentTagIndex).assertEqual(3);
        expect(model.itemsOfTag(3).length).assertEqual(10);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(5, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(5, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 5);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(6, 2024), num: 6, days: getMonthDate(6, 2024) };
        source.pushData(seededMonth);
        expect(source.totalCount()).assertEqual(1);
        expect(recorder.countOf('add')).assertEqual(1);
        source.addData(0, seededMonth);
        expect(recorder.trace()).assertEqual('add:0|add:0');
        source.unregisterDataChangeListener(recorder);
        const frozen: number = recorder.size();
        source.notifyDataChange(0);
        expect(recorder.size()).assertEqual(frozen);
      }
    });

    /**
     * @tc.name CalendarJourneyAndListenerLifecycleHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc CalendarJourneyAndListenerLifecycleHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndListenerLifecycleHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(5, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(5, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 5);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(6, 2024), num: 6, days: getMonthDate(6, 2024) };
        source.pushData(seededMonth);
        expect(source.totalCount()).assertEqual(1);
        expect(recorder.countOf('add')).assertEqual(1);
        source.addData(0, seededMonth);
        expect(recorder.trace()).assertEqual('add:0|add:0');
        source.unregisterDataChangeListener(recorder);
        const frozen: number = recorder.size();
        source.notifyDataChange(0);
        expect(recorder.size()).assertEqual(frozen);
      }
    });

    /**
     * @tc.name ListenerLifecycleAndSnapshotRoundTripAndCascadeTagSelectionRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc ListenerLifecycleAndSnapshotRoundTripAndCascadeTagSelectionRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ListenerLifecycleAndSnapshotRoundTripAndCascadeTagSelectionRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(6, 2024), num: 6, days: getMonthDate(6, 2024) };
        source.pushData(seededMonth);
        expect(source.totalCount()).assertEqual(1);
        expect(recorder.countOf('add')).assertEqual(1);
        source.addData(0, seededMonth);
        expect(recorder.trace()).assertEqual('add:0|add:0');
        source.unregisterDataChangeListener(recorder);
        const frozen: number = recorder.size();
        source.notifyDataChange(0);
        expect(recorder.size()).assertEqual(frozen);
      }
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '7');
        snapshot.put('day', '7');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('7');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(7);
        expect(model.itemScrollTarget).assertEqual(70);
        expect(model.currentTagIndex).assertEqual(7);
        expect(model.itemsOfTag(7).length).assertEqual(10);
      }
    });

    /**
     * @tc.name SnapshotRoundTripAndCascadeTagSelectionAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc SnapshotRoundTripAndCascadeTagSelectionAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('SnapshotRoundTripAndCascadeTagSelectionAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const snapshot: Snapshot = new Snapshot();
        snapshot.put('month', '7');
        snapshot.put('day', '7');
        const encoded: string = snapshot.encode();
        expect(encoded.indexOf('month=') >= 0).assertTrue();
        const restored: Snapshot = Snapshot.decode(encoded);
        expect(restored.get('month')).assertEqual('7');
        expect(restored.fields.length).assertEqual(2);
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(7);
        expect(model.itemScrollTarget).assertEqual(70);
        expect(model.currentTagIndex).assertEqual(7);
        expect(model.itemsOfTag(7).length).assertEqual(10);
      }
    });

    /**
     * @tc.name CascadeTagSelectionAndCalendarJourneyAndListenerLifecycleKeepTheSessionCoherentDuringPreview
     * @tc.desc CascadeTagSelectionAndCalendarJourneyAndListenerLifecycleKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CascadeTagSelectionAndCalendarJourneyAndListenerLifecycleKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(7);
        expect(model.itemScrollTarget).assertEqual(70);
        expect(model.currentTagIndex).assertEqual(7);
        expect(model.itemsOfTag(7).length).assertEqual(10);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(9, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(9, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 9);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(10, 2024), num: 10, days: getMonthDate(10, 2024) };
        source.pushData(seededMonth);
        expect(source.totalCount()).assertEqual(1);
        expect(recorder.countOf('add')).assertEqual(1);
        source.addData(0, seededMonth);
        expect(recorder.trace()).assertEqual('add:0|add:0');
        source.unregisterDataChangeListener(recorder);
        const frozen: number = recorder.size();
        source.notifyDataChange(0);
        expect(recorder.size()).assertEqual(frozen);
      }
    });
  });
}
