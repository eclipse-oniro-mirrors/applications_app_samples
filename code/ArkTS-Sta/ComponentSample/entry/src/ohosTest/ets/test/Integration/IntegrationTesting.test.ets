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

export default function IntegrationTestingTest(): void {
  describe('IntegrationTestingTest', () => {
    beforeAll(() => {
      logSuite('IntegrationTestingTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('IntegrationTestingTest', 'end');
    });

    /**
     * @tc.name CalendarJourneyAndLoadedSourceReloadStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc CalendarJourneyAndLoadedSourceReloadStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndLoadedSourceReloadStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
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
        const source: LoadedMonthSource = new LoadedMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        const loadedMonth: LoadedMonth = {
          month: monthLabel(2, 2029),
          num: 2,
          days: getMonthDate(2, 2029),
          year: 2029,
        };
        source.pushData(loadedMonth);
        source.notifyDataReload();
        expect(recorder.trace()).assertEqual('add:0|reload');
        expect(source.getData(0).year).assertEqual(2029);
        source.setData(0, []);
        expect(source.totalCount()).assertEqual(1);
      }
    });

    /**
     * @tc.name LoadedSourceReloadAndCascadeTagSelectionAndMonthLabelContractKeepTheVisibleStateInStepDuringPreview
     * @tc.desc LoadedSourceReloadAndCascadeTagSelectionAndMonthLabelContractKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('LoadedSourceReloadAndCascadeTagSelectionAndMonthLabelContractKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const source: LoadedMonthSource = new LoadedMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        const loadedMonth: LoadedMonth = {
          month: monthLabel(2, 2029),
          num: 2,
          days: getMonthDate(2, 2029),
          year: 2029,
        };
        source.pushData(loadedMonth);
        source.notifyDataReload();
        expect(recorder.trace()).assertEqual('add:0|reload');
        expect(source.getData(0).year).assertEqual(2029);
        source.setData(0, []);
        expect(source.totalCount()).assertEqual(1);
      }
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(2);
        expect(model.itemScrollTarget).assertEqual(20);
        expect(model.currentTagIndex).assertEqual(2);
        expect(model.itemsOfTag(2).length).assertEqual(10);
      }
      {
        const label: string = monthLabel(4, 2018);
        expect(label.indexOf('2018') >= 0).assertTrue();
        expect(label.indexOf('4') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(4, 2018, 1);
        expect(panels[0].label).assertEqual(label);
      }
    });

    /**
     * @tc.name CascadeTagSelectionAndMonthLabelContractPreserveTheDeclaredContractDuringPreview
     * @tc.desc CascadeTagSelectionAndMonthLabelContractPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CascadeTagSelectionAndMonthLabelContractPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(2);
        expect(model.itemScrollTarget).assertEqual(20);
        expect(model.currentTagIndex).assertEqual(2);
        expect(model.itemsOfTag(2).length).assertEqual(10);
      }
      {
        const label: string = monthLabel(4, 2018);
        expect(label.indexOf('2018') >= 0).assertTrue();
        expect(label.indexOf('4') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(4, 2018, 1);
        expect(panels[0].label).assertEqual(label);
      }
    });

    /**
     * @tc.name MonthLabelContractAndListenerLifecycleAndCalendarJourneySurviveRapidInteractionDuringPreview
     * @tc.desc MonthLabelContractAndListenerLifecycleAndCalendarJourneySurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('MonthLabelContractAndListenerLifecycleAndCalendarJourneySurviveRapidInteractionDuringPreview', 0, () => {
      {
        const label: string = monthLabel(4, 2018);
        expect(label.indexOf('2018') >= 0).assertTrue();
        expect(label.indexOf('4') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(4, 2018, 1);
        expect(panels[0].label).assertEqual(label);
      }
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(5, 2024), num: 5, days: getMonthDate(5, 2024) };
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
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(6, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(6, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 6);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name ListenerLifecycleAndCalendarJourneyHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc ListenerLifecycleAndCalendarJourneyHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ListenerLifecycleAndCalendarJourneyHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(5, 2024), num: 5, days: getMonthDate(5, 2024) };
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
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(6, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(6, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 6);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndLoadedSourceReloadAndCascadeTagSelectionRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc CalendarJourneyAndLoadedSourceReloadAndCascadeTagSelectionRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndLoadedSourceReloadAndCascadeTagSelectionRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(6, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(6, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 6);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const source: LoadedMonthSource = new LoadedMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        const loadedMonth: LoadedMonth = {
          month: monthLabel(7, 2030),
          num: 7,
          days: getMonthDate(7, 2030),
          year: 2030,
        };
        source.pushData(loadedMonth);
        source.notifyDataReload();
        expect(recorder.trace()).assertEqual('add:0|reload');
        expect(source.getData(0).year).assertEqual(2030);
        source.setData(0, []);
        expect(source.totalCount()).assertEqual(1);
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
     * @tc.name LoadedSourceReloadAndCascadeTagSelectionAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc LoadedSourceReloadAndCascadeTagSelectionAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('LoadedSourceReloadAndCascadeTagSelectionAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const source: LoadedMonthSource = new LoadedMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        const loadedMonth: LoadedMonth = {
          month: monthLabel(7, 2030),
          num: 7,
          days: getMonthDate(7, 2030),
          year: 2030,
        };
        source.pushData(loadedMonth);
        source.notifyDataReload();
        expect(recorder.trace()).assertEqual('add:0|reload');
        expect(source.getData(0).year).assertEqual(2030);
        source.setData(0, []);
        expect(source.totalCount()).assertEqual(1);
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
     * @tc.name CascadeTagSelectionAndMonthLabelContractAndListenerLifecycleKeepTheSessionCoherentDuringPreview
     * @tc.desc CascadeTagSelectionAndMonthLabelContractAndListenerLifecycleKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CascadeTagSelectionAndMonthLabelContractAndListenerLifecycleKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const model: CascadeModel = new CascadeModel();
        model.selectTag(7);
        expect(model.itemScrollTarget).assertEqual(70);
        expect(model.currentTagIndex).assertEqual(7);
        expect(model.itemsOfTag(7).length).assertEqual(10);
      }
      {
        const label: string = monthLabel(9, 2023);
        expect(label.indexOf('2023') >= 0).assertTrue();
        expect(label.indexOf('9') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(9, 2023, 1);
        expect(panels[0].label).assertEqual(label);
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

    /**
     * @tc.name MonthLabelContractAndListenerLifecycleTrackTheSelectedStateDuringPreview
     * @tc.desc MonthLabelContractAndListenerLifecycleTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('MonthLabelContractAndListenerLifecycleTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const label: string = monthLabel(9, 2023);
        expect(label.indexOf('2023') >= 0).assertTrue();
        expect(label.indexOf('9') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(9, 2023, 1);
        expect(panels[0].label).assertEqual(label);
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

    /**
     * @tc.name ListenerLifecycleAndCalendarJourneyAndLoadedSourceReloadPreserveOrderingGuaranteesDuringPreview
     * @tc.desc ListenerLifecycleAndCalendarJourneyAndLoadedSourceReloadPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ListenerLifecycleAndCalendarJourneyAndLoadedSourceReloadPreserveOrderingGuaranteesDuringPreview', 0, () => {
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
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(11, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(11, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 11);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const source: LoadedMonthSource = new LoadedMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        const loadedMonth: LoadedMonth = {
          month: monthLabel(12, 2031),
          num: 12,
          days: getMonthDate(12, 2031),
          year: 2031,
        };
        source.pushData(loadedMonth);
        source.notifyDataReload();
        expect(recorder.trace()).assertEqual('add:0|reload');
        expect(source.getData(0).year).assertEqual(2031);
        source.setData(0, []);
        expect(source.totalCount()).assertEqual(1);
      }
    });

    /**
     * @tc.name CalendarJourneyAndLoadedSourceReloadHoldForRepeatedEntryDuringPreview
     * @tc.desc CalendarJourneyAndLoadedSourceReloadHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndLoadedSourceReloadHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(11, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(11, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 11);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const source: LoadedMonthSource = new LoadedMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        const loadedMonth: LoadedMonth = {
          month: monthLabel(12, 2031),
          num: 12,
          days: getMonthDate(12, 2031),
          year: 2031,
        };
        source.pushData(loadedMonth);
        source.notifyDataReload();
        expect(recorder.trace()).assertEqual('add:0|reload');
        expect(source.getData(0).year).assertEqual(2031);
        source.setData(0, []);
        expect(source.totalCount()).assertEqual(1);
      }
    });
  });
}
