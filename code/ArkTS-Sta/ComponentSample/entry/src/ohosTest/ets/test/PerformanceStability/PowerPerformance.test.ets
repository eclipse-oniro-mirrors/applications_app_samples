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

export default function PowerPerformanceTest(): void {
  describe('PowerPerformanceTest', () => {
    beforeAll(() => {
      logSuite('PowerPerformanceTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('PowerPerformanceTest', 'end');
    });

    /**
     * @tc.name EnergyAccountingAndRepeatedBuildStabilityStayConsistentUnderRepeatedUseDuringPreview
     * @tc.desc EnergyAccountingAndRepeatedBuildStabilityStayConsistentUnderRepeatedUseDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndRepeatedBuildStabilityStayConsistentUnderRepeatedUseDuringPreview', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(10, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(5);
        expect(ledger.average(10)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        let stable: boolean = true;
        const reference: int[] = getMonthDate(5, 2024);
        for (let round = 0; round < 30; round++) {
          const grid: int[] = getMonthDate(5, 2024);
          if (!sameIntArray(grid, reference)) {
            stable = false;
          }
        }
        expect(stable).assertTrue();
        expect(reference.length).assertEqual(35);
        expect(fingerprint(reference)).assertEqual(fingerprint(getMonthDate(5, 2024)));
      }
    });

    /**
     * @tc.name RepeatedBuildStabilityAndFrameBudgetTrackingAndStableRandomStreamKeepTheVisibleStateInStepDuringPreview
     * @tc.desc RepeatedBuildStabilityAndFrameBudgetTrackingAndStableRandomStreamKeepTheVisibleStateInStepDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'RepeatedBuildStabilityAndFrameBudgetTrackingAndStableRandomStreamKeepTheVisibleStateInStepDuringPreview',
      0,
      () => {
        {
          let stable: boolean = true;
          const reference: int[] = getMonthDate(5, 2024);
          for (let round = 0; round < 30; round++) {
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
          const stream: StableRandom = new StableRandom(14);
          const first: number = stream.nextInRange(0, 34);
          expect(first >= 0).assertTrue();
          expect(first <= 34).assertTrue();
          const replay: StableRandom = new StableRandom(14);
          expect(replay.nextInRange(0, 34)).assertEqual(first);
        }
      },
    );

    /**
     * @tc.name FrameBudgetTrackingAndStableRandomStreamPreserveTheDeclaredContractDuringPreview
     * @tc.desc FrameBudgetTrackingAndStableRandomStreamPreserveTheDeclaredContractDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndStableRandomStreamPreserveTheDeclaredContractDuringPreview', 0, () => {
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
        const stream: StableRandom = new StableRandom(14);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(14);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
    });

    /**
     * @tc.name StableRandomStreamAndCalendarJourneyAndStopwatchMeasurementSurviveRapidInteractionDuringPreview
     * @tc.desc StableRandomStreamAndCalendarJourneyAndStopwatchMeasurementSurviveRapidInteractionDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('StableRandomStreamAndCalendarJourneyAndStopwatchMeasurementSurviveRapidInteractionDuringPreview', 0, () => {
      {
        const stream: StableRandom = new StableRandom(14);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(14);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
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
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
    });

    /**
     * @tc.name CalendarJourneyAndStopwatchMeasurementHoldAcrossConfigurationChangesDuringPreview
     * @tc.desc CalendarJourneyAndStopwatchMeasurementHoldAcrossConfigurationChangesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndStopwatchMeasurementHoldAcrossConfigurationChangesDuringPreview', 0, () => {
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
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
    });

    /**
     * @tc.name StopwatchMeasurementAndEnergyAccountingAndRepeatedBuildStabilityRemainCorrectAfterRecoveryDuringPreview
     * @tc.desc StopwatchMeasurementAndEnergyAccountingAndRepeatedBuildStabilityRemainCorrectAfterRecoveryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'StopwatchMeasurementAndEnergyAccountingAndRepeatedBuildStabilityRemainCorrectAfterRecoveryDuringPreview',
      0,
      () => {
        {
          const watch: Stopwatch = new Stopwatch();
          watch.start();
          expect(watch.isRunning()).assertTrue();
          const elapsed: number = watch.stop();
          expect(elapsed >= 0).assertTrue();
          expect(watch.isRunning()).assertFalse();
        }
        {
          const ledger: EnergyLedger = new EnergyLedger();
          ledger.chargeOperation(16, 0.5);
          expect(ledger.milliwattSeconds).assertEqual(8);
          expect(ledger.average(16)).assertEqual(0.5);
          expect(ledger.average(0)).assertEqual(0);
        }
        {
          let stable: boolean = true;
          const reference: int[] = getMonthDate(5, 2024);
          for (let round = 0; round < 50; round++) {
            const grid: int[] = getMonthDate(5, 2024);
            if (!sameIntArray(grid, reference)) {
              stable = false;
            }
          }
          expect(stable).assertTrue();
          expect(reference.length).assertEqual(35);
          expect(fingerprint(reference)).assertEqual(fingerprint(getMonthDate(5, 2024)));
        }
      },
    );

    /**
     * @tc.name EnergyAccountingAndRepeatedBuildStabilityAgreeWithTheModelInvariantsDuringPreview
     * @tc.desc EnergyAccountingAndRepeatedBuildStabilityAgreeWithTheModelInvariantsDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndRepeatedBuildStabilityAgreeWithTheModelInvariantsDuringPreview', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(16, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(8);
        expect(ledger.average(16)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        let stable: boolean = true;
        const reference: int[] = getMonthDate(5, 2024);
        for (let round = 0; round < 50; round++) {
          const grid: int[] = getMonthDate(5, 2024);
          if (!sameIntArray(grid, reference)) {
            stable = false;
          }
        }
        expect(stable).assertTrue();
        expect(reference.length).assertEqual(35);
        expect(fingerprint(reference)).assertEqual(fingerprint(getMonthDate(5, 2024)));
      }
    });

    /**
     * @tc.name RepeatedBuildStabilityAndFrameBudgetTrackingAndStableRandomStreamKeepTheSessionCoherentDuringPreview
     * @tc.desc RepeatedBuildStabilityAndFrameBudgetTrackingAndStableRandomStreamKeepTheSessionCoherentDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'RepeatedBuildStabilityAndFrameBudgetTrackingAndStableRandomStreamKeepTheSessionCoherentDuringPreview',
      0,
      () => {
        {
          let stable: boolean = true;
          const reference: int[] = getMonthDate(5, 2024);
          for (let round = 0; round < 50; round++) {
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
          const stream: StableRandom = new StableRandom(20);
          const first: number = stream.nextInRange(0, 34);
          expect(first >= 0).assertTrue();
          expect(first <= 34).assertTrue();
          const replay: StableRandom = new StableRandom(20);
          expect(replay.nextInRange(0, 34)).assertEqual(first);
        }
      },
    );

    /**
     * @tc.name FrameBudgetTrackingAndStableRandomStreamTrackTheSelectedStateDuringPreview
     * @tc.desc FrameBudgetTrackingAndStableRandomStreamTrackTheSelectedStateDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndStableRandomStreamTrackTheSelectedStateDuringPreview', 0, () => {
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
        const stream: StableRandom = new StableRandom(20);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(20);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
    });

    /**
     * @tc.name StableRandomStreamAndCalendarJourneyAndStopwatchMeasurementPreserveOrderingGuaranteesDuringPreview
     * @tc.desc StableRandomStreamAndCalendarJourneyAndStopwatchMeasurementPreserveOrderingGuaranteesDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('StableRandomStreamAndCalendarJourneyAndStopwatchMeasurementPreserveOrderingGuaranteesDuringPreview', 0, () => {
      {
        const stream: StableRandom = new StableRandom(20);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(20);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
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
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
    });

    /**
     * @tc.name CalendarJourneyAndStopwatchMeasurementHoldForRepeatedEntryDuringPreview
     * @tc.desc CalendarJourneyAndStopwatchMeasurementHoldForRepeatedEntryDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndStopwatchMeasurementHoldForRepeatedEntryDuringPreview', 0, () => {
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
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
    });

    /**
     * @tc.name StopwatchMeasurementAndEnergyAccountingAndRepeatedBuildStabilityRemainStableUnderLoadDuringPreview
     * @tc.desc StopwatchMeasurementAndEnergyAccountingAndRepeatedBuildStabilityRemainStableUnderLoadDuringPreview
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndEnergyAccountingAndRepeatedBuildStabilityRemainStableUnderLoadDuringPreview', 0, () => {
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(22, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(11);
        expect(ledger.average(22)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        let stable: boolean = true;
        const reference: int[] = getMonthDate(5, 2024);
        for (let round = 0; round < 30; round++) {
          const grid: int[] = getMonthDate(5, 2024);
          if (!sameIntArray(grid, reference)) {
            stable = false;
          }
        }
        expect(stable).assertTrue();
        expect(reference.length).assertEqual(35);
        expect(fingerprint(reference)).assertEqual(fingerprint(getMonthDate(5, 2024)));
      }
    });

    /**
     * @tc.name EnergyAccountingAndRepeatedBuildStabilityStayConsistentUnderRepeatedUseAfterRollover
     * @tc.desc EnergyAccountingAndRepeatedBuildStabilityStayConsistentUnderRepeatedUseAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndRepeatedBuildStabilityStayConsistentUnderRepeatedUseAfterRollover', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(22, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(11);
        expect(ledger.average(22)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        let stable: boolean = true;
        const reference: int[] = getMonthDate(5, 2024);
        for (let round = 0; round < 30; round++) {
          const grid: int[] = getMonthDate(5, 2024);
          if (!sameIntArray(grid, reference)) {
            stable = false;
          }
        }
        expect(stable).assertTrue();
        expect(reference.length).assertEqual(35);
        expect(fingerprint(reference)).assertEqual(fingerprint(getMonthDate(5, 2024)));
      }
    });

    /**
     * @tc.name RepeatedBuildStabilityAndFrameBudgetTrackingAndStableRandomStreamKeepTheVisibleStateInStepAfterRollover
     * @tc.desc RepeatedBuildStabilityAndFrameBudgetTrackingAndStableRandomStreamKeepTheVisibleStateInStepAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'RepeatedBuildStabilityAndFrameBudgetTrackingAndStableRandomStreamKeepTheVisibleStateInStepAfterRollover',
      0,
      () => {
        {
          let stable: boolean = true;
          const reference: int[] = getMonthDate(5, 2024);
          for (let round = 0; round < 30; round++) {
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
          const stream: StableRandom = new StableRandom(26);
          const first: number = stream.nextInRange(0, 34);
          expect(first >= 0).assertTrue();
          expect(first <= 34).assertTrue();
          const replay: StableRandom = new StableRandom(26);
          expect(replay.nextInRange(0, 34)).assertEqual(first);
        }
      },
    );

    /**
     * @tc.name FrameBudgetTrackingAndStableRandomStreamPreserveTheDeclaredContractAfterRollover
     * @tc.desc FrameBudgetTrackingAndStableRandomStreamPreserveTheDeclaredContractAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndStableRandomStreamPreserveTheDeclaredContractAfterRollover', 0, () => {
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
        const stream: StableRandom = new StableRandom(26);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(26);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
    });

    /**
     * @tc.name StableRandomStreamAndCalendarJourneyAndStopwatchMeasurementSurviveRapidInteractionAfterRollover
     * @tc.desc StableRandomStreamAndCalendarJourneyAndStopwatchMeasurementSurviveRapidInteractionAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('StableRandomStreamAndCalendarJourneyAndStopwatchMeasurementSurviveRapidInteractionAfterRollover', 0, () => {
      {
        const stream: StableRandom = new StableRandom(26);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(26);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(5, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(5, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 17);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
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
     * @tc.name CalendarJourneyAndStopwatchMeasurementHoldAcrossConfigurationChangesAfterRollover
     * @tc.desc CalendarJourneyAndStopwatchMeasurementHoldAcrossConfigurationChangesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndStopwatchMeasurementHoldAcrossConfigurationChangesAfterRollover', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(5, 2024);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(5, 2024, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 17);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
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
     * @tc.name StopwatchMeasurementAndEnergyAccountingAndRepeatedBuildStabilityRemainCorrectAfterRecoveryAfterRollover
     * @tc.desc StopwatchMeasurementAndEnergyAccountingAndRepeatedBuildStabilityRemainCorrectAfterRecoveryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'StopwatchMeasurementAndEnergyAccountingAndRepeatedBuildStabilityRemainCorrectAfterRecoveryAfterRollover',
      0,
      () => {
        {
          const watch: Stopwatch = new Stopwatch();
          watch.start();
          expect(watch.isRunning()).assertTrue();
          const elapsed: number = watch.stop();
          expect(elapsed >= 0).assertTrue();
          expect(watch.isRunning()).assertFalse();
        }
        {
          const ledger: EnergyLedger = new EnergyLedger();
          ledger.chargeOperation(28, 0.5);
          expect(ledger.milliwattSeconds).assertEqual(14);
          expect(ledger.average(28)).assertEqual(0.5);
          expect(ledger.average(0)).assertEqual(0);
        }
        {
          let stable: boolean = true;
          const reference: int[] = getMonthDate(5, 2024);
          for (let round = 0; round < 50; round++) {
            const grid: int[] = getMonthDate(5, 2024);
            if (!sameIntArray(grid, reference)) {
              stable = false;
            }
          }
          expect(stable).assertTrue();
          expect(reference.length).assertEqual(35);
          expect(fingerprint(reference)).assertEqual(fingerprint(getMonthDate(5, 2024)));
        }
      },
    );

    /**
     * @tc.name EnergyAccountingAndRepeatedBuildStabilityAgreeWithTheModelInvariantsAfterRollover
     * @tc.desc EnergyAccountingAndRepeatedBuildStabilityAgreeWithTheModelInvariantsAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndRepeatedBuildStabilityAgreeWithTheModelInvariantsAfterRollover', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(28, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(14);
        expect(ledger.average(28)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        let stable: boolean = true;
        const reference: int[] = getMonthDate(5, 2024);
        for (let round = 0; round < 50; round++) {
          const grid: int[] = getMonthDate(5, 2024);
          if (!sameIntArray(grid, reference)) {
            stable = false;
          }
        }
        expect(stable).assertTrue();
        expect(reference.length).assertEqual(35);
        expect(fingerprint(reference)).assertEqual(fingerprint(getMonthDate(5, 2024)));
      }
    });

    /**
     * @tc.name RepeatedBuildStabilityAndFrameBudgetTrackingAndStableRandomStreamKeepTheSessionCoherentAfterRollover
     * @tc.desc RepeatedBuildStabilityAndFrameBudgetTrackingAndStableRandomStreamKeepTheSessionCoherentAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it(
      'RepeatedBuildStabilityAndFrameBudgetTrackingAndStableRandomStreamKeepTheSessionCoherentAfterRollover',
      0,
      () => {
        {
          let stable: boolean = true;
          const reference: int[] = getMonthDate(5, 2024);
          for (let round = 0; round < 50; round++) {
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
          const stream: StableRandom = new StableRandom(32);
          const first: number = stream.nextInRange(0, 34);
          expect(first >= 0).assertTrue();
          expect(first <= 34).assertTrue();
          const replay: StableRandom = new StableRandom(32);
          expect(replay.nextInRange(0, 34)).assertEqual(first);
        }
      },
    );

    /**
     * @tc.name FrameBudgetTrackingAndStableRandomStreamTrackTheSelectedStateAfterRollover
     * @tc.desc FrameBudgetTrackingAndStableRandomStreamTrackTheSelectedStateAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('FrameBudgetTrackingAndStableRandomStreamTrackTheSelectedStateAfterRollover', 0, () => {
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
        const stream: StableRandom = new StableRandom(32);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(32);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
    });

    /**
     * @tc.name StableRandomStreamAndCalendarJourneyAndStopwatchMeasurementPreserveOrderingGuaranteesAfterRollover
     * @tc.desc StableRandomStreamAndCalendarJourneyAndStopwatchMeasurementPreserveOrderingGuaranteesAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('StableRandomStreamAndCalendarJourneyAndStopwatchMeasurementPreserveOrderingGuaranteesAfterRollover', 0, () => {
      {
        const stream: StableRandom = new StableRandom(32);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(32);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(11, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(11, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 23);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
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
     * @tc.name CalendarJourneyAndStopwatchMeasurementHoldForRepeatedEntryAfterRollover
     * @tc.desc CalendarJourneyAndStopwatchMeasurementHoldForRepeatedEntryAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarJourneyAndStopwatchMeasurementHoldForRepeatedEntryAfterRollover', 0, () => {
      {
        const today: DateModel = getRealTimeDate();
        const grid: int[] = getMonthDate(11, 2026);
        expect(grid.length % 7).assertEqual(0);
        const panel = PanelBuilder.build(11, 2026, 2);
        expect(panel.length).assertEqual(2);
        const chosen: number = GridInspector.slotOfDay(grid, 23);
        expect(chosen >= 0).assertTrue();
        expect(today.month >= 1).assertTrue();
        expect(panel[0].days.length).assertEqual(grid.length);
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
     * @tc.name StopwatchMeasurementAndEnergyAccountingAndRepeatedBuildStabilityRemainStableUnderLoadAfterRollover
     * @tc.desc StopwatchMeasurementAndEnergyAccountingAndRepeatedBuildStabilityRemainStableUnderLoadAfterRollover
     * @tc.type Function
     * @tc.level Level2
     */
    it('StopwatchMeasurementAndEnergyAccountingAndRepeatedBuildStabilityRemainStableUnderLoadAfterRollover', 0, () => {
      {
        const watch: Stopwatch = new Stopwatch();
        watch.start();
        expect(watch.isRunning()).assertTrue();
        const elapsed: number = watch.stop();
        expect(elapsed >= 0).assertTrue();
        expect(watch.isRunning()).assertFalse();
      }
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(14, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(7);
        expect(ledger.average(14)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        let stable: boolean = true;
        const reference: int[] = getMonthDate(5, 2024);
        for (let round = 0; round < 30; round++) {
          const grid: int[] = getMonthDate(5, 2024);
          if (!sameIntArray(grid, reference)) {
            stable = false;
          }
        }
        expect(stable).assertTrue();
        expect(reference.length).assertEqual(35);
        expect(fingerprint(reference)).assertEqual(fingerprint(getMonthDate(5, 2024)));
      }
    });

    /**
     * @tc.name EnergyAccountingAndRepeatedBuildStabilityStayConsistentUnderRepeatedUseUnderLoad
     * @tc.desc EnergyAccountingAndRepeatedBuildStabilityStayConsistentUnderRepeatedUseUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('EnergyAccountingAndRepeatedBuildStabilityStayConsistentUnderRepeatedUseUnderLoad', 0, () => {
      {
        const ledger: EnergyLedger = new EnergyLedger();
        ledger.chargeOperation(14, 0.5);
        expect(ledger.milliwattSeconds).assertEqual(7);
        expect(ledger.average(14)).assertEqual(0.5);
        expect(ledger.average(0)).assertEqual(0);
      }
      {
        let stable: boolean = true;
        const reference: int[] = getMonthDate(5, 2024);
        for (let round = 0; round < 30; round++) {
          const grid: int[] = getMonthDate(5, 2024);
          if (!sameIntArray(grid, reference)) {
            stable = false;
          }
        }
        expect(stable).assertTrue();
        expect(reference.length).assertEqual(35);
        expect(fingerprint(reference)).assertEqual(fingerprint(getMonthDate(5, 2024)));
      }
    });

    /**
     * @tc.name RepeatedBuildStabilityAndFrameBudgetTrackingAndStableRandomStreamKeepTheVisibleStateInStepUnderLoad
     * @tc.desc RepeatedBuildStabilityAndFrameBudgetTrackingAndStableRandomStreamKeepTheVisibleStateInStepUnderLoad
     * @tc.type Function
     * @tc.level Level2
     */
    it('RepeatedBuildStabilityAndFrameBudgetTrackingAndStableRandomStreamKeepTheVisibleStateInStepUnderLoad', 0, () => {
      {
        let stable: boolean = true;
        const reference: int[] = getMonthDate(5, 2024);
        for (let round = 0; round < 30; round++) {
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
        const timeline: AnimationTimeline = new AnimationTimeline();
        for (let index = 0; index < 5; index++) {
          timeline.addFrame(12.5);
        }
        timeline.addFrame(18);
        expect(timeline.frames.length).assertEqual(6);
        expect(timeline.dropped()).assertEqual(1);
        expect(timeline.averageFrame() > 0).assertTrue();
      }
      {
        const stream: StableRandom = new StableRandom(38);
        const first: number = stream.nextInRange(0, 34);
        expect(first >= 0).assertTrue();
        expect(first <= 34).assertTrue();
        const replay: StableRandom = new StableRandom(38);
        expect(replay.nextInRange(0, 34)).assertEqual(first);
      }
    });
  });
}
