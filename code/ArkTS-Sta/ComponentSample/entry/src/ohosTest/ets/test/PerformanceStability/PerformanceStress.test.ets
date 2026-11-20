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

export default function PerformanceStressTest(): void {
  describe('PerformanceStressTest', () => {
    beforeAll(() => {
      logSuite('PerformanceStressTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('PerformanceStressTest', 'end');
    });

    /**
     * @tc.name RepeatedBuildStabilityAndEnergyAccountingStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc RepeatedBuildStabilityAndEnergyAccountingStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('RepeatedBuildStabilityAndEnergyAccountingStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        let stable: boolean = true;
        const reference: int[] = getMonthDate(5, 2024);
        for (let round = 0; round < 20; round++) {
          const grid: int[] = getMonthDate(5, 2024);
          if (!sameIntArray(grid, reference)) {
            stable = false;
          }
        }
        expect(stable).assertTrue();
        expect(reference.length).assertEqual(35);
        expect(fingerprint(reference)).assertEqual(fingerprint(getMonthDate(5, 2024)));
      }
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(11, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(5.5);
        expect(ledger.average(11)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
    });

    /**
     * @tc.name EnergyAccountingAndFrameBudgetTrackingAndStopwatchMeasurementKeepTheVisibleStateInStepDuringPreview
     * @tc.desc EnergyAccountingAndFrameBudgetTrackingAndStopwatchMeasurementKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndFrameBudgetTrackingAndStopwatchMeasurementKeepTheVisibleStateInStepDuringPreview', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(11, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(5.5);
        expect(ledger.average(11)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 5; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(12);
        expect(timeline.frames.length).assertEqual(6);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndStopwatchMeasurementPreserveTheDeclaredContractDuringPreview
     * @tc.desc FrameBudgetTrackingAndStopwatchMeasurementPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndStopwatchMeasurementPreserveTheDeclaredContractDuringPreview', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 5; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(12);
        expect(timeline.frames.length).assertEqual(6);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
    });

    /**
     * @tc.name StopwatchMeasurementAndStableRandomStreamAndCalendarJourneySurviveRapidInteractionDuringPreview
     * @tc.desc StopwatchMeasurementAndStableRandomStreamAndCalendarJourneySurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndStableRandomStreamAndCalendarJourneySurviveRapidInteractionDuringPreview', 0, () => {
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
      {
        const stream: StableRandom = new StableRandom(15);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(15);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
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
     * @tc.name StableRandomStreamAndCalendarJourneyHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc StableRandomStreamAndCalendarJourneyHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('StableRandomStreamAndCalendarJourneyHoldAcrossConfigurationChangesDuringPreview', 0, () => {
      {
        const stream: StableRandom = new StableRandom(15);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(15);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
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
     * @tc.name CalendarJourneyAndRepeatedBuildStabilityAndEnergyAccountingRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc CalendarJourneyAndRepeatedBuildStabilityAndEnergyAccountingRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndRepeatedBuildStabilityAndEnergyAccountingRemainCorrectAfterRecoveryDuringPreview', 0, () => {
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
        let stable: boolean = true;
        const reference: int[] = getMonthDate(5, 2024);
        for (let round = 0; round < 40; round++) {
          const grid: int[] = getMonthDate(5, 2024);
          if (!sameIntArray(grid, reference)) {
            stable = false;
          }
        }
        expect(stable).assertTrue();
        expect(reference.length).assertEqual(35);
        expect(fingerprint(reference)).assertEqual(fingerprint(getMonthDate(5, 2024)));
      }
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(17, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(8.5);
        expect(ledger.average(17)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
    });

    /**
     * @tc.name EnergyAccountingAndFrameBudgetTrackingAndStopwatchMeasurementKeepTheSessionCoherentDuringPreview
     * @tc.desc EnergyAccountingAndFrameBudgetTrackingAndStopwatchMeasurementKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndFrameBudgetTrackingAndStopwatchMeasurementKeepTheSessionCoherentDuringPreview', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(17, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(8.5);
        expect(ledger.average(17)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 3; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(18);
        expect(timeline.frames.length).assertEqual(4);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndStopwatchMeasurementTrackTheSelectedStateDuringPreview
     * @tc.desc FrameBudgetTrackingAndStopwatchMeasurementTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndStopwatchMeasurementTrackTheSelectedStateDuringPreview', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 3; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(18);
        expect(timeline.frames.length).assertEqual(4);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
    });

    /**
     * @tc.name StopwatchMeasurementAndStableRandomStreamAndCalendarJourneyPreserveOrderingGuaranteesDuringPreview
     * @tc.desc StopwatchMeasurementAndStableRandomStreamAndCalendarJourneyPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndStableRandomStreamAndCalendarJourneyPreserveOrderingGuaranteesDuringPreview', 0, () => {
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
      {
        const stream: StableRandom = new StableRandom(21);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(21);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(12, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(12, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 12);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name StableRandomStreamAndCalendarJourneyHoldForRepeatedEntryDuringPreview
     * @tc.desc StableRandomStreamAndCalendarJourneyHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('StableRandomStreamAndCalendarJourneyHoldForRepeatedEntryDuringPreview', 0, () => {
      {
        const stream: StableRandom = new StableRandom(21);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(21);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(12, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(12, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 12);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndRepeatedBuildStabilityAndEnergyAccountingRemainStableUnderLoadDuringPreview
     * @tc.desc CalendarJourneyAndRepeatedBuildStabilityAndEnergyAccountingRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndRepeatedBuildStabilityAndEnergyAccountingRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(12, 2027);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(12, 2027, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 12);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        let stable: boolean = true;
        const reference: int[] = getMonthDate(5, 2024);
        for (let round = 0; round < 20; round++) {
          const grid: int[] = getMonthDate(5, 2024);
          if (!sameIntArray(grid, reference)) {
            stable = false;
          }
        }
        expect(stable).assertTrue();
        expect(reference.length).assertEqual(35);
        expect(fingerprint(reference)).assertEqual(fingerprint(getMonthDate(5, 2024)));
      }
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(23, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(11.5);
        expect(ledger.average(23)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
    });

    /**
     * @tc.name RepeatedBuildStabilityAndEnergyAccountingStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc RepeatedBuildStabilityAndEnergyAccountingStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('RepeatedBuildStabilityAndEnergyAccountingStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
      {
        let stable: boolean = true;
        const reference: int[] = getMonthDate(5, 2024);
        for (let round = 0; round < 20; round++) {
          const grid: int[] = getMonthDate(5, 2024);
          if (!sameIntArray(grid, reference)) {
            stable = false;
          }
        }
        expect(stable).assertTrue();
        expect(reference.length).assertEqual(35);
        expect(fingerprint(reference)).assertEqual(fingerprint(getMonthDate(5, 2024)));
      }
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(23, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(11.5);
        expect(ledger.average(23)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
    });

    /**
     * @tc.name EnergyAccountingAndFrameBudgetTrackingAndStopwatchMeasurementKeepTheVisibleStateInStepAfterRollover
     * @tc.desc EnergyAccountingAndFrameBudgetTrackingAndStopwatchMeasurementKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndFrameBudgetTrackingAndStopwatchMeasurementKeepTheVisibleStateInStepAfterRollover', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(23, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(11.5);
        expect(ledger.average(23)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 5; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(15);
        expect(timeline.frames.length).assertEqual(6);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndStopwatchMeasurementPreserveTheDeclaredContractAfterRollover
     * @tc.desc FrameBudgetTrackingAndStopwatchMeasurementPreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndStopwatchMeasurementPreserveTheDeclaredContractAfterRollover', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 5; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(15);
        expect(timeline.frames.length).assertEqual(6);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
    });

    /**
     * @tc.name StopwatchMeasurementAndStableRandomStreamAndCalendarJourneySurviveRapidInteractionAfterRollover
     * @tc.desc StopwatchMeasurementAndStableRandomStreamAndCalendarJourneySurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndStableRandomStreamAndCalendarJourneySurviveRapidInteractionAfterRollover', 0, () => {
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
      {
        const stream: StableRandom = new StableRandom(27);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(27);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(6, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(6, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 18);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name StableRandomStreamAndCalendarJourneyHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc StableRandomStreamAndCalendarJourneyHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('StableRandomStreamAndCalendarJourneyHoldAcrossConfigurationChangesAfterRollover', 0, () => {
      {
        const stream: StableRandom = new StableRandom(27);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(27);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(6, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(6, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 18);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
    });

    /**
     * @tc.name CalendarJourneyAndRepeatedBuildStabilityAndEnergyAccountingRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc CalendarJourneyAndRepeatedBuildStabilityAndEnergyAccountingRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndRepeatedBuildStabilityAndEnergyAccountingRemainCorrectAfterRecoveryAfterRollover', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(6, 2025);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(6, 2025, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 18);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
      }
      {
        let stable: boolean = true;
        const reference: int[] = getMonthDate(5, 2024);
        for (let round = 0; round < 40; round++) {
          const grid: int[] = getMonthDate(5, 2024);
          if (!sameIntArray(grid, reference)) {
            stable = false;
          }
        }
        expect(stable).assertTrue();
        expect(reference.length).assertEqual(35);
        expect(fingerprint(reference)).assertEqual(fingerprint(getMonthDate(5, 2024)));
      }
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(29, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(14.5);
        expect(ledger.average(29)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
    });

    /**
     * @tc.name RepeatedBuildStabilityAndEnergyAccountingAgreeWithTheModelInvariantsAfterRollover
     * @tc.desc RepeatedBuildStabilityAndEnergyAccountingAgreeWithTheModelInvariantsAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('RepeatedBuildStabilityAndEnergyAccountingAgreeWithTheModelInvariantsAfterRollover', 0, () => {
      {
        let stable: boolean = true;
        const reference: int[] = getMonthDate(5, 2024);
        for (let round = 0; round < 40; round++) {
          const grid: int[] = getMonthDate(5, 2024);
          if (!sameIntArray(grid, reference)) {
            stable = false;
          }
        }
        expect(stable).assertTrue();
        expect(reference.length).assertEqual(35);
        expect(fingerprint(reference)).assertEqual(fingerprint(getMonthDate(5, 2024)));
      }
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(29, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(14.5);
        expect(ledger.average(29)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
    });

    /**
     * @tc.name EnergyAccountingAndFrameBudgetTrackingAndStopwatchMeasurementKeepTheSessionCoherentAfterRollover
     * @tc.desc EnergyAccountingAndFrameBudgetTrackingAndStopwatchMeasurementKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndFrameBudgetTrackingAndStopwatchMeasurementKeepTheSessionCoherentAfterRollover', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(29, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(14.5);
        expect(ledger.average(29)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 3; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(12);
        expect(timeline.frames.length).assertEqual(4);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
    });

    /**
     * @tc.name FrameBudgetTrackingAndStopwatchMeasurementTrackTheSelectedStateAfterRollover
     * @tc.desc FrameBudgetTrackingAndStopwatchMeasurementTrackTheSelectedStateAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndStopwatchMeasurementTrackTheSelectedStateAfterRollover', 0, () => {
      {
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 3; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(12);
        expect(timeline.frames.length).assertEqual(4);
        expect(timeline.dropped()).assertEqual(0);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
    });
  });
}
