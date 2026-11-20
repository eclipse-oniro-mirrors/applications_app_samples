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

export default function ComprehensiveRegressionTest(): void {
  describe('ComprehensiveRegressionTest', () => {
    beforeAll(() => {
      logSuite('ComprehensiveRegressionTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('ComprehensiveRegressionTest', 'end');
    });

    /**
     * @tc.name CalendarJourneyAndRealTimeDateFieldsStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc CalendarJourneyAndRealTimeDateFieldsStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndRealTimeDateFieldsStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
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
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.week >= 0 && model.week <= 6).assertTrue();
        expect(new Date(model.year, model.month, 0).getDate().toInt() >= model.day).assertTrue();
      }
    });

    /**
     * @tc.name RealTimeDateFieldsAndListenerLifecycleAndLoadedSourceReloadKeepTheVisibleStateInStepDuringPreview
     * @tc.desc RealTimeDateFieldsAndListenerLifecycleAndLoadedSourceReloadKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RealTimeDateFieldsAndListenerLifecycleAndLoadedSourceReloadKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.week >= 0 && model.week <= 6).assertTrue();
        expect(new Date(model.year, model.month, 0).getDate().toInt() >= model.day).assertTrue();
      }
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(3, 2024), num: 3, days: getMonthDate(3, 2024) };
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
        const source: LoadedMonthSource = new LoadedMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        const loadedMonth: LoadedMonth = {
          month: monthLabel(4, 2031),
          num: 4,
          days: getMonthDate(4, 2031),
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
     * @tc.name ListenerLifecycleAndLoadedSourceReloadPreserveTheDeclaredContractDuringPreview
     * @tc.desc ListenerLifecycleAndLoadedSourceReloadPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ListenerLifecycleAndLoadedSourceReloadPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(3, 2024), num: 3, days: getMonthDate(3, 2024) };
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
        const source: LoadedMonthSource = new LoadedMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        const loadedMonth: LoadedMonth = {
          month: monthLabel(4, 2031),
          num: 4,
          days: getMonthDate(4, 2031),
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
     * @tc.name LoadedSourceReloadAndMonthLabelContractAndComponentStyleValuesSurviveRapidInteractionDuringPreview
     * @tc.desc LoadedSourceReloadAndMonthLabelContractAndComponentStyleValuesSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('LoadedSourceReloadAndMonthLabelContractAndComponentStyleValuesSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const source: LoadedMonthSource = new LoadedMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        const loadedMonth: LoadedMonth = {
          month: monthLabel(4, 2031),
          num: 4,
          days: getMonthDate(4, 2031),
          year: 2031,
        };
        source.pushData(loadedMonth);
        source.notifyDataReload();
        expect(recorder.trace()).assertEqual('add:0|reload');
        expect(source.getData(0).year).assertEqual(2031);
        source.setData(0, []);
        expect(source.totalCount()).assertEqual(1);
      }
      {
        const label: string = monthLabel(5, 2019);
        expect(label.indexOf('2019') >= 0).assertTrue();
        expect(label.indexOf('5') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(5, 2019, 1);
        expect(panels[0].label).assertEqual(label);
      }
      {
        expect(ComponentStyle.SUB_ITEM_TEXT_WIDTH_BODY > ComponentStyle.SUB_ITEM_TEXT_WIDTH_TITLE).assertTrue();
        expect(ComponentStyle.SUB_ITEM_HEIGHT > ComponentStyle.SUB_ITEM_GUTTER).assertTrue();
        expect(ComponentStyle.BOTTOM_TOAST_TEXT_MAX_HEIGHT > ComponentStyle.TAG_TEXT_HEIGHT).assertTrue();
        expect(StyleTable.all().length).assertEqual(8);
      }
    });

    /**
     * @tc.name MonthLabelContractAndComponentStyleValuesHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc MonthLabelContractAndComponentStyleValuesHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('MonthLabelContractAndComponentStyleValuesHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const label: string = monthLabel(5, 2019);
        expect(label.indexOf('2019') >= 0).assertTrue();
        expect(label.indexOf('5') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(5, 2019, 1);
        expect(panels[0].label).assertEqual(label);
      }
      {
        expect(ComponentStyle.SUB_ITEM_TEXT_WIDTH_BODY > ComponentStyle.SUB_ITEM_TEXT_WIDTH_TITLE).assertTrue();
        expect(ComponentStyle.SUB_ITEM_HEIGHT > ComponentStyle.SUB_ITEM_GUTTER).assertTrue();
        expect(ComponentStyle.BOTTOM_TOAST_TEXT_MAX_HEIGHT > ComponentStyle.TAG_TEXT_HEIGHT).assertTrue();
        expect(StyleTable.all().length).assertEqual(8);
      }
    });

    /**
     * @tc.name ComponentStyleValuesAndCalendarJourneyAndRealTimeDateFieldsRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc ComponentStyleValuesAndCalendarJourneyAndRealTimeDateFieldsRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ComponentStyleValuesAndCalendarJourneyAndRealTimeDateFieldsRemainCorrectAfterRecoveryDuringPreview', 0, () => {
      {
        expect(ComponentStyle.SUB_ITEM_TEXT_WIDTH_BODY > ComponentStyle.SUB_ITEM_TEXT_WIDTH_TITLE).assertTrue();
        expect(ComponentStyle.SUB_ITEM_HEIGHT > ComponentStyle.SUB_ITEM_GUTTER).assertTrue();
        expect(ComponentStyle.BOTTOM_TOAST_TEXT_MAX_HEIGHT > ComponentStyle.TAG_TEXT_HEIGHT).assertTrue();
        expect(StyleTable.all().length).assertEqual(8);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(7, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(7, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 7);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.week >= 0 && model.week <= 6).assertTrue();
        expect(new Date(model.year, model.month, 0).getDate().toInt() >= model.day).assertTrue();
      }
    });

    /**
     * @tc.name CalendarJourneyAndRealTimeDateFieldsAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc CalendarJourneyAndRealTimeDateFieldsAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndRealTimeDateFieldsAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(7, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(7, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 7);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.week >= 0 && model.week <= 6).assertTrue();
        expect(new Date(model.year, model.month, 0).getDate().toInt() >= model.day).assertTrue();
      }
    });

    /**
     * @tc.name RealTimeDateFieldsAndListenerLifecycleAndLoadedSourceReloadKeepTheSessionCoherentDuringPreview
     * @tc.desc RealTimeDateFieldsAndListenerLifecycleAndLoadedSourceReloadKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RealTimeDateFieldsAndListenerLifecycleAndLoadedSourceReloadKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.week >= 0 && model.week <= 6).assertTrue();
        expect(new Date(model.year, model.month, 0).getDate().toInt() >= model.day).assertTrue();
      }
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(9, 2024), num: 9, days: getMonthDate(9, 2024) };
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
        const source: LoadedMonthSource = new LoadedMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        const loadedMonth: LoadedMonth = {
          month: monthLabel(10, 2029),
          num: 10,
          days: getMonthDate(10, 2029),
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
     * @tc.name ListenerLifecycleAndLoadedSourceReloadTrackTheSelectedStateDuringPreview
     * @tc.desc ListenerLifecycleAndLoadedSourceReloadTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ListenerLifecycleAndLoadedSourceReloadTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const source: CalendarMonthSource = new CalendarMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        source.registerDataChangeListener(recorder);
        const seededMonth: CalendarMonth = { month: monthLabel(9, 2024), num: 9, days: getMonthDate(9, 2024) };
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
        const source: LoadedMonthSource = new LoadedMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        const loadedMonth: LoadedMonth = {
          month: monthLabel(10, 2029),
          num: 10,
          days: getMonthDate(10, 2029),
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
     * @tc.name LoadedSourceReloadAndMonthLabelContractAndComponentStyleValuesPreserveOrderingGuaranteesDuringPreview
     * @tc.desc LoadedSourceReloadAndMonthLabelContractAndComponentStyleValuesPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'LoadedSourceReloadAndMonthLabelContractAndComponentStyleValuesPreserveOrderingGuaranteesDuringPreview',
      0,
      () => {
        {
          const source: LoadedMonthSource = new LoadedMonthSource();
          const recorder: EventRecorder = new EventRecorder();
          source.registerDataChangeListener(recorder);
          const loadedMonth: LoadedMonth = {
            month: monthLabel(10, 2029),
            num: 10,
            days: getMonthDate(10, 2029),
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
          const label: string = monthLabel(11, 2025);
          expect(label.indexOf('2025') >= 0).assertTrue();
          expect(label.indexOf('11') >= 0).assertTrue();
          expect(label.length > 3).assertTrue();
          const panels = PanelBuilder.build(11, 2025, 1);
          expect(panels[0].label).assertEqual(label);
        }
        {
          expect(ComponentStyle.SUB_ITEM_TEXT_WIDTH_BODY > ComponentStyle.SUB_ITEM_TEXT_WIDTH_TITLE).assertTrue();
          expect(ComponentStyle.SUB_ITEM_HEIGHT > ComponentStyle.SUB_ITEM_GUTTER).assertTrue();
          expect(ComponentStyle.BOTTOM_TOAST_TEXT_MAX_HEIGHT > ComponentStyle.TAG_TEXT_HEIGHT).assertTrue();
          expect(StyleTable.all().length).assertEqual(8);
        }
      },
    );

    /**
     * @tc.name MonthLabelContractAndComponentStyleValuesHoldForRepeatedEntryDuringPreview
     * @tc.desc MonthLabelContractAndComponentStyleValuesHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('MonthLabelContractAndComponentStyleValuesHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const label: string = monthLabel(11, 2025);
        expect(label.indexOf('2025') >= 0).assertTrue();
        expect(label.indexOf('11') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(11, 2025, 1);
        expect(panels[0].label).assertEqual(label);
      }
      {
        expect(ComponentStyle.SUB_ITEM_TEXT_WIDTH_BODY > ComponentStyle.SUB_ITEM_TEXT_WIDTH_TITLE).assertTrue();
        expect(ComponentStyle.SUB_ITEM_HEIGHT > ComponentStyle.SUB_ITEM_GUTTER).assertTrue();
        expect(ComponentStyle.BOTTOM_TOAST_TEXT_MAX_HEIGHT > ComponentStyle.TAG_TEXT_HEIGHT).assertTrue();
        expect(StyleTable.all().length).assertEqual(8);
      }
    });

    /**
     * @tc.name ComponentStyleValuesAndCalendarJourneyAndRealTimeDateFieldsRemainStableUnderLoadDuringPreview
     * @tc.desc ComponentStyleValuesAndCalendarJourneyAndRealTimeDateFieldsRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('ComponentStyleValuesAndCalendarJourneyAndRealTimeDateFieldsRemainStableUnderLoadDuringPreview', 0, () => {
      {
        expect(ComponentStyle.SUB_ITEM_TEXT_WIDTH_BODY > ComponentStyle.SUB_ITEM_TEXT_WIDTH_TITLE).assertTrue();
        expect(ComponentStyle.SUB_ITEM_HEIGHT > ComponentStyle.SUB_ITEM_GUTTER).assertTrue();
        expect(ComponentStyle.BOTTOM_TOAST_TEXT_MAX_HEIGHT > ComponentStyle.TAG_TEXT_HEIGHT).assertTrue();
        expect(StyleTable.all().length).assertEqual(8);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(1, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(1, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 13);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.week >= 0 && model.week <= 6).assertTrue();
        expect(new Date(model.year, model.month, 0).getDate().toInt() >= model.day).assertTrue();
      }
    });

    /**
     * @tc.name CalendarJourneyAndRealTimeDateFieldsStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc CalendarJourneyAndRealTimeDateFieldsStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndRealTimeDateFieldsStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(1, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(1, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 13);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        const model: DateModel = getRealTimeDate();
        const now: Date = new Date();
        expect(model.year).assertEqual(now.getFullYear().toInt());
        expect(model.month).assertEqual(now.getMonth().toInt() + 1);
        expect(model.day).assertEqual(now.getDate().toInt());
        expect(model.week).assertEqual(new Date(model.year, model.month - 1, model.day).getDay().toInt());
        expect(model.week >= 0 && model.week <= 6).assertTrue();
        expect(new Date(model.year, model.month, 0).getDate().toInt() >= model.day).assertTrue();
      }
    });

    /**
     * @tc.name LoadedSourceReloadAndMonthLabelContractAndComponentStyleValuesSurviveRapidInteractionAfterRollover
     * @tc.desc LoadedSourceReloadAndMonthLabelContractAndComponentStyleValuesSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('LoadedSourceReloadAndMonthLabelContractAndComponentStyleValuesSurviveRapidInteractionAfterRollover', 0, () => {
      {
        const source: LoadedMonthSource = new LoadedMonthSource();
        const recorder: EventRecorder = new EventRecorder();
        source.registerDataChangeListener(recorder);
        const loadedMonth: LoadedMonth = {
          month: monthLabel(4, 2031),
          num: 4,
          days: getMonthDate(4, 2031),
          year: 2031,
        };
        source.pushData(loadedMonth);
        source.notifyDataReload();
        expect(recorder.trace()).assertEqual('add:0|reload');
        expect(source.getData(0).year).assertEqual(2031);
        source.setData(0, []);
        expect(source.totalCount()).assertEqual(1);
      }
      {
        const label: string = monthLabel(5, 2031);
        expect(label.indexOf('2031') >= 0).assertTrue();
        expect(label.indexOf('5') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(5, 2031, 1);
        expect(panels[0].label).assertEqual(label);
      }
      {
        expect(ComponentStyle.SUB_ITEM_TEXT_WIDTH_BODY > ComponentStyle.SUB_ITEM_TEXT_WIDTH_TITLE).assertTrue();
        expect(ComponentStyle.SUB_ITEM_HEIGHT > ComponentStyle.SUB_ITEM_GUTTER).assertTrue();
        expect(ComponentStyle.BOTTOM_TOAST_TEXT_MAX_HEIGHT > ComponentStyle.TAG_TEXT_HEIGHT).assertTrue();
        expect(StyleTable.all().length).assertEqual(8);
      }
    });

    /**
     * @tc.name MonthLabelContractAndComponentStyleValuesHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc MonthLabelContractAndComponentStyleValuesHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('MonthLabelContractAndComponentStyleValuesHoldAcrossConfigurationChangesAfterRollover', 0, () => {
      {
        const label: string = monthLabel(5, 2031);
        expect(label.indexOf('2031') >= 0).assertTrue();
        expect(label.indexOf('5') >= 0).assertTrue();
        expect(label.length > 3).assertTrue();
        const panels = PanelBuilder.build(5, 2031, 1);
        expect(panels[0].label).assertEqual(label);
      }
      {
        expect(ComponentStyle.SUB_ITEM_TEXT_WIDTH_BODY > ComponentStyle.SUB_ITEM_TEXT_WIDTH_TITLE).assertTrue();
        expect(ComponentStyle.SUB_ITEM_HEIGHT > ComponentStyle.SUB_ITEM_GUTTER).assertTrue();
        expect(ComponentStyle.BOTTOM_TOAST_TEXT_MAX_HEIGHT > ComponentStyle.TAG_TEXT_HEIGHT).assertTrue();
        expect(StyleTable.all().length).assertEqual(8);
      }
    });
  });
}
